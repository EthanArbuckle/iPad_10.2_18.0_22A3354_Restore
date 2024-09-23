@implementation MTLDebugRenderCommandEncoder

- (void)viewports
{
  return &self->_viewports.__end_;
}

- (void)scissorRects
{
  return &self->_scissorRects.__end_;
}

- ($54B668FA3CFF7C50914A1C899F2834C0)viewport
{
  $54B668FA3CFF7C50914A1C899F2834C0 *result;
  double var0;
  __int128 v5;

  result = ($54B668FA3CFF7C50914A1C899F2834C0 *)&self->_viewports.__end_;
  var0 = result->var0;
  if (*(_QWORD *)&result->var1 == *(_QWORD *)&result->var0)
    std::vector<MTLViewport>::__throw_out_of_range[abi:ne180100]();
  v5 = *(_OWORD *)(*(_QWORD *)&var0 + 16);
  *(_OWORD *)&retstr->var0 = **(_OWORD **)&var0;
  *(_OWORD *)&retstr->var2 = v5;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)(*(_QWORD *)&var0 + 32);
  return result;
}

- ($3CC19D079FD0B010EE84973AA846B91B)scissorRect
{
  $3CC19D079FD0B010EE84973AA846B91B *result;
  _OWORD *var0;
  __int128 v5;

  result = ($3CC19D079FD0B010EE84973AA846B91B *)&self->_scissorRects.__end_;
  var0 = (_OWORD *)result->var0;
  if (result->var1 == result->var0)
    std::vector<MTLViewport>::__throw_out_of_range[abi:ne180100]();
  v5 = var0[1];
  *(_OWORD *)&retstr->var0 = *var0;
  *(_OWORD *)&retstr->var2 = v5;
  return result;
}

- (void)enumerateVertexBuffersUsingBlock:(id)a3
{
  enumerateFunctionArgumentWithArray((uint64_t)&self->_vertexBuffers[0].type, 0x24uLL, (uint64_t)a3);
}

- (void)enumerateVertexTexturesUsingBlock:(id)a3
{
  enumerateFunctionArgumentWithArray((uint64_t)&self->_vertexTextures[0].type, 0x80uLL, (uint64_t)a3);
}

- (void)enumerateVertexSamplersUsingBlock:(id)a3
{
  enumerateFunctionArgumentWithArray((uint64_t)&self->_vertexSamplers[0].type, 0x10uLL, (uint64_t)a3);
}

- (void)enumerateFragmentBuffersUsingBlock:(id)a3
{
  enumerateFunctionArgumentWithArray((uint64_t)&self->_fragmentBuffers[0].type, 0x1FuLL, (uint64_t)a3);
}

- (void)enumerateFragmentTexturesUsingBlock:(id)a3
{
  enumerateFunctionArgumentWithArray((uint64_t)&self->_fragmentTextures[0].type, 0x80uLL, (uint64_t)a3);
}

- (void)enumerateFragmentSamplersUsingBlock:(id)a3
{
  enumerateFunctionArgumentWithArray((uint64_t)&self->_fragmentSamplers[0].type, 0x10uLL, (uint64_t)a3);
}

- (void)enumerateTileBuffersUsingBlock:(id)a3
{
  enumerateFunctionArgumentWithArray((uint64_t)&self->_tileBuffers[0].type, 0x1FuLL, (uint64_t)a3);
}

- (void)enumerateTileTexturesUsingBlock:(id)a3
{
  enumerateFunctionArgumentWithArray((uint64_t)&self->_tileTextures[0].type, 0x80uLL, (uint64_t)a3);
}

- (void)enumerateTileSamplersUsingBlock:(id)a3
{
  enumerateFunctionArgumentWithArray((uint64_t)&self->_tileSamplers[0].type, 0x10uLL, (uint64_t)a3);
}

- (void)enumerateThreadgroupMemoryUsingBlock:(id)a3
{
  enumerateFunctionArgumentWithArray((uint64_t)&self->_threadgroupMemoryArguments[0].type, 0x1FuLL, (uint64_t)a3);
}

- (void)_setDefaults
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  unint64_t *p_height;
  unint64_t *p_tessellationFactorBufferInstanceStride;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __end_ ****p_var0;
  void **v13;
  __end_ ***v14;
  unint64_t v15;
  __end_ ***v16;
  uint64_t v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  __int128 v21;
  double v22;
  double v23;
  __int128 v24;

  self->_peakPerSampleStorage = 0;
  self->_defaultDepthStencilDescriptor = 0;
  self->_commandBuffer = 0;
  begin = self->_viewports.__begin_;
  if (begin)
  {
    std::__tree<unsigned int>::destroy((uint64_t)self->_viewports.__begin_, *((_QWORD **)begin + 1));
    MEMORY[0x22E309118](begin, 0x1020C4062D53EE8);
    self->_viewports.__begin_ = 0;
  }
  bzero(&self->_vertexBuffers[0].type, 0xC60uLL);
  bzero(&self->_vertexTextures[0].type, 0x2C00uLL);
  bzero(&self->_vertexSamplers[0].type, 0x580uLL);
  bzero(&self->_fragmentBuffers[0].type, 0xAA8uLL);
  bzero(&self->_fragmentTextures[0].type, 0x2C00uLL);
  bzero(&self->_fragmentSamplers[0].type, 0x580uLL);
  bzero(&self->_tileBuffers[0].type, 0xAA8uLL);
  bzero(&self->_tileTextures[0].type, 0x2C00uLL);
  bzero(&self->_tileSamplers[0].type, 0x580uLL);
  bzero(&self->_threadgroupMemoryArguments[0].type, 0xAA8uLL);
  LODWORD(self->_visibilityOffsets) = -2147418116;
  p_height = &self->_height;
  p_tessellationFactorBufferInstanceStride = &self->_tessellationFactorBufferInstanceStride;
  objc_msgSend((id)self->_frontFacingWinding, "validate:width:height:", self->super.super.super._device, &self->_height, &self->_tessellationFactorBufferInstanceStride);
  v6 = objc_msgSend((id)self->_frontFacingWinding, "rasterizationRateMap");
  if (v6)
  {
    v7 = (void *)v6;
    v8 = objc_msgSend((id)self->_frontFacingWinding, "renderTargetWidth");
    v9 = objc_msgSend((id)self->_frontFacingWinding, "renderTargetHeight");
    v10 = v9;
    if (v8)
    {
      if (v9)
      {
LABEL_6:
        *p_height = v8;
        *p_tessellationFactorBufferInstanceStride = v10;
        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend(v7, "screenSize");
      v8 = v21;
      if (v10)
        goto LABEL_6;
    }
    objc_msgSend(v7, "screenSize");
    v10 = *((_QWORD *)&v21 + 1);
    goto LABEL_6;
  }
  v10 = *p_tessellationFactorBufferInstanceStride;
LABEL_8:
  v21 = 0uLL;
  v22 = (float)*p_height;
  v23 = (float)v10;
  v24 = xmmword_22CEAB7E0;
  std::vector<MTLViewport>::assign((char **)&self->_viewports.__end_, 1uLL, &v21);
  self->_cullMode = 0;
  self->_depthClipMode = 0;
  self->_triangleFillMode = 0;
  self->_depthBiasSlopeScale = 1.0;
  self->_depthBiasClamp = 0.0;
  self->_frontStencilRef = 0;
  self->_backStencilRef = 0;
  v18 = 0uLL;
  v11 = *p_tessellationFactorBufferInstanceStride;
  v19 = *p_height;
  v20 = v11;
  std::vector<MTLScissorRect>::assign((char **)&self->_scissorRects.__end_, 1uLL, &v18);
  self->_renderPipelineState = 0;
  self->_amplificationValue = 0;
  self->_vertexAmplificationCount = 1;
  self->_updatedFences.__map_.__first_ = (__begin_ ***)1;

  self->_visibilityResultMode = objc_opt_new();
  self->_blendColorRed = 0.0;
  self->_blendColorGreen = 0.0;
  self->_visibilityResultOffset = 0;
  self->_width = 0;
  self->_blendColorBlue = 0.0;
  self->_blendColorAlpha = 0.0;
  self->_tessellationFactorScale = 0.0;
  LODWORD(self->_descriptor) = 0;
  LOBYTE(self->_tessellationFactorBufferArgument.type) = 0;
  *(_QWORD *)&self->_tessellationFactorBufferArgument.isValid = 0;
  HIDWORD(self->_descriptor) = 1065353216;
  LOBYTE(self->_depthBias) = 0;
  p_var0 = &self->_updatedFences.__map_.var0;
  v13 = (void **)p_var0[1];
  v14 = p_var0[2];
  p_var0[5] = 0;
  v15 = (char *)v14 - (char *)v13;
  if (v15 >= 0x11)
  {
    do
    {
      operator delete(*v13);
      v16 = p_var0[2];
      v13 = (void **)(p_var0[1] + 1);
      p_var0[1] = (__end_ ***)v13;
      v15 = (char *)v16 - (char *)v13;
    }
    while (v15 > 0x10);
  }
  if (v15 >> 3 == 1)
  {
    v17 = 256;
  }
  else
  {
    if (v15 >> 3 != 2)
      return;
    v17 = 512;
  }
  p_var0[4] = (__end_ ***)v17;
}

- (MTLDebugRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5
{
  MTLDebugRenderCommandEncoder *v7;
  MTLDebugRenderCommandEncoder *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLDebugRenderCommandEncoder;
  v7 = -[MTLToolsRenderCommandEncoder initWithRenderCommandEncoder:parent:descriptor:](&v10, sel_initWithRenderCommandEncoder_parent_descriptor_, a3);
  v8 = v7;
  if (v7)
  {
    v7->_maxVertexBuffers = (unint64_t)a4;
    v7->_frontFacingWinding = objc_msgSend(a5, "copy");
    -[MTLDebugRenderCommandEncoder _init](v8, "_init");
  }
  return v8;
}

- (MTLDebugRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parallelRenderCommandEncoder:(id)a4 descriptor:(id)a5
{
  MTLDebugRenderCommandEncoder *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTLDebugRenderCommandEncoder;
  v7 = -[MTLToolsRenderCommandEncoder initWithRenderCommandEncoder:parent:](&v9, sel_initWithRenderCommandEncoder_parent_, a3);
  if (v7)
  {
    v7->_maxVertexBuffers = objc_msgSend(a4, "commandBuffer");
    v7->_frontFacingWinding = (unint64_t)a5;
    -[MTLDebugRenderCommandEncoder _init](v7, "_init");
  }
  return v7;
}

- (void)_init
{
  void *frontFacingWinding;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  MTLDebugRenderCommandEncoder *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  MTLDepthStencilState *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t attachmentWriteMask;
  uint64_t v24;
  __int128 v25;
  _QWORD v26[66];

  v26[64] = *MEMORY[0x24BDAC8D0];
  if (hasMemorylessAttachments((MTLRenderPassDescriptor *)self->_frontFacingWinding))
    -[MTLToolsRenderCommandEncoder addSplitHandler:](self, "addSplitHandler:", &__block_literal_global_3);
  *(_DWORD *)&self->_openGLModeEnabled = 0x7FFF;
  frontFacingWinding = (void *)self->_frontFacingWinding;
  if (frontFacingWinding)
  {
    v4 = (void *)objc_msgSend(frontFacingWinding, "colorAttachments");
    v25 = 0uLL;
    v5 = 0;
    v6 = 0;
    v24 = 0;
    v7 = self;
    do
    {
      v8 = (void *)objc_msgSend(v4, "_descriptorAtIndex:", v5);
      v7->_attachmentInfo[0].sampleCount = 0;
      v7->_attachmentInfo[1].pixelFormat = 0;
      if (v8)
      {
        v9 = v8;
        v10 = objc_msgSend(v8, "texture");
        if (v10)
        {
          v11 = v10;
          if (objc_msgSend(v9, "storeAction") == 4)
            HIDWORD(self->_visibilityOffsets) |= 1 << v5;
          v7->_attachmentInfo[1].pixelFormat = objc_msgSend((id)v11, "sampleCount");
          v7->_attachmentInfo[0].sampleCount = objc_msgSend((id)v11, "pixelFormat");
          if (v5 > 7)
          {
            if (v5 == 8)
              v16 = v25;
            else
              v16 = v11;
            v17 = *((_QWORD *)&v25 + 1);
            if (v5 == 8)
              v17 = v11;
            *(_QWORD *)&v25 = v16;
            *((_QWORD *)&v25 + 1) = v17;
          }
          else
          {
            v24 = objc_msgSend((id)v11, "sampleCount");
            v26[v6] = objc_msgSend((id)v11, "pixelFormat");
            v12 = &v26[7 * v6++ + 8];
            v14 = *(_OWORD *)(v11 + 88);
            v13 = *(_OWORD *)(v11 + 104);
            v15 = *(_OWORD *)(v11 + 72);
            v12[6] = *(_QWORD *)(v11 + 120);
            *((_OWORD *)v12 + 1) = v14;
            *((_OWORD *)v12 + 2) = v13;
            *(_OWORD *)v12 = v15;
          }
          objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", v11, 1, 1);
          objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", objc_msgSend(v9, "resolveTexture"), 1, 1);
        }
      }
      ++v5;
      v7 = (MTLDebugRenderCommandEncoder *)((char *)v7 + 16);
    }
    while (v5 != 10);
    objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", objc_msgSend((id)self->_frontFacingWinding, "visibilityResultBuffer"), 1, 1);
    objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", objc_msgSend((id)self->_frontFacingWinding, "rasterizationRateMap"), 1, 0);
    for (i = 0; i != 4; ++i)
      objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)self->_frontFacingWinding, "sampleBufferAttachments"), "objectAtIndexedSubscript:", i), "sampleBuffer"), 1, 0);
    v19 = (void *)*((_QWORD *)&v25 + 1);
    v20 = (MTLDepthStencilState *)v24;
    if (v25 == 0)
    {
      v21 = 0;
    }
    else
    {
      if (!*((_QWORD *)&v25 + 1))
        v19 = (void *)v25;
      v21 = objc_msgSend(v19, "sampleCount");
    }
    if (-[MTLToolsDevice supportsRenderPassWithoutRenderTarget](self->super.super.super._device, "supportsRenderPassWithoutRenderTarget"))
    {
      if (!v24)
      {
        v20 = (MTLDepthStencilState *)objc_msgSend((id)self->_frontFacingWinding, "defaultColorSampleCount");
        if (!v20)
          v20 = (MTLDepthStencilState *)objc_msgSend((id)self->_frontFacingWinding, "defaultRasterSampleCount");
      }
      if (!v21)
        v21 = objc_msgSend((id)self->_frontFacingWinding, "defaultRasterSampleCount");
      if (!v21 || !v20)
      {
        if (!v20)
          v20 = (MTLDepthStencilState *)v21;
        v21 = (uint64_t)v20;
      }
    }
  }
  else
  {
    v20 = 0;
    v21 = 0;
  }
  -[MTLDebugRenderCommandEncoder _setDefaults](self, "_setDefaults");
  self->_commandBuffer = (MTLDebugCommandBuffer *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 10);
  *(_QWORD *)&self->_vertexBuffers[0].isValid = v21;
  self->_depthStencilState = v20;
  v22 = MTLPixelFormatComputeTotalSizeUsed();
  if (v22 <= objc_msgSend((id)self->_frontFacingWinding, "imageblockSampleLength"))
    v22 = objc_msgSend((id)self->_frontFacingWinding, "imageblockSampleLength");
  self->_resolvedSampleCount = v22;
  self->_attachmentWriteMask = -[MTLToolsDevice maxVertexBuffers](self->super.super.super._device, "maxVertexBuffers");
  if (objc_msgSend((id)self->_frontFacingWinding, "openGLModeEnabled"))
  {
    attachmentWriteMask = self->_attachmentWriteMask;
    if (attachmentWriteMask <= 0x24)
      attachmentWriteMask = 36;
    self->_attachmentWriteMask = attachmentWriteMask;
    LOBYTE(self->_vertexBuiltinArguments) = 1;
  }
}

uint64_t __37__MTLDebugRenderCommandEncoder__init__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    result = MTLReportFailure();
    if ((a3 & 2) == 0)
    {
LABEL_3:
      if ((a3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  result = MTLReportFailure();
  if ((a3 & 4) == 0)
  {
LABEL_4:
    if ((a3 & 8) == 0)
      return result;
    return MTLReportFailure();
  }
LABEL_8:
  result = MTLReportFailure();
  if ((a3 & 8) != 0)
    return MTLReportFailure();
  return result;
}

- (void)dealloc
{
  __end_cap_ ***var1;
  id **value;
  unint64_t v5;
  id **v6;
  unint64_t v7;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  objc_super v9;

  var1 = self->_updatedFences.__map_.var1;
  value = self->_updatedFences.__map_.var2.__value_;
  self->_storingRenderTargets = 0;
  v5 = (char *)value - (char *)var1;
  if (v5 >= 0x11)
  {
    do
    {
      operator delete(*var1);
      v6 = self->_updatedFences.__map_.var2.__value_;
      var1 = self->_updatedFences.__map_.var1 + 1;
      self->_updatedFences.__map_.var1 = var1;
      v5 = (char *)v6 - (char *)var1;
    }
    while (v5 > 0x10);
  }
  if (v5 >> 3 == 1)
  {
    v7 = 256;
  }
  else
  {
    if (v5 >> 3 != 2)
      goto LABEL_8;
    v7 = 512;
  }
  self->_updatedFences.__size_.__value_ = v7;
LABEL_8:
  begin = self->_viewports.__begin_;
  if (begin)
  {
    std::__tree<unsigned int>::destroy((uint64_t)self->_viewports.__begin_, *((_QWORD **)begin + 1));
    MEMORY[0x22E309118](begin, 0x1020C4062D53EE8);
    self->_viewports.__begin_ = 0;
  }
  if (((uint64_t)self->_visibilityOffsets & 1) != 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)MTLDebugRenderCommandEncoder;
    -[MTLToolsObject dealloc](&v9, sel_dealloc);
  }
  else
  {
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
    v9.receiver = self;
    v9.super_class = (Class)MTLDebugRenderCommandEncoder;
    -[MTLToolsObject dealloc](&v9, sel_dealloc);
    MTLReportFailure();
  }
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *frontFacingWinding;
  const __CFString *v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **p_end;
  double v13;
  uint64_t v14;
  unint64_t v15;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v16;
  unint64_t cullMode;
  const __CFString *v18;
  const __CFString *v19;
  unint64_t depthClipMode;
  const __CFString *v21;
  unint64_t triangleFillMode;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t renderPipelineState;
  const __CFString *v29;
  uint64_t peakPerSampleStorage;
  uint64_t defaultDepthStencilDescriptor;
  unint64_t visibilityResultOffset;
  const __CFString *v33;
  uint64_t v34;
  MTLDebugRenderCommandEncoder *v35;
  uint64_t v36;
  MTLDebugRenderCommandEncoder *v37;
  uint64_t v38;
  MTLDebugRenderCommandEncoder *v39;
  uint64_t v40;
  MTLDebugRenderCommandEncoder *v41;
  uint64_t v42;
  MTLDebugRenderCommandEncoder *v43;
  uint64_t v44;
  MTLDebugRenderCommandEncoder *v45;
  uint64_t v46;
  MTLDebugRenderCommandEncoder *v47;
  uint64_t v48;
  MTLDebugRenderCommandEncoder *v49;
  uint64_t v50;
  MTLDebugRenderCommandEncoder *v51;
  double v52;
  MTLDebugRenderCommandEncoder *v54;
  uint64_t v55;
  objc_super v56;
  _QWORD v57[9];
  _QWORD v58[3];
  _QWORD v59[2];
  _QWORD v60[3];
  _QWORD v61[2];
  _QWORD v62[3];
  _QWORD v63[2];
  _QWORD v64[3];
  _QWORD v65[2];
  _QWORD v66[3];
  _QWORD v67[2];
  _QWORD v68[3];
  _QWORD v69[2];
  _QWORD v70[3];
  _QWORD v71[2];
  _QWORD v72[3];
  _QWORD v73[2];
  _QWORD v74[3];
  _QWORD v75[35];
  _QWORD v76[3];
  _QWORD v77[26];
  _QWORD v78[3];
  _QWORD v79[10];

  v79[8] = *MEMORY[0x24BDAC8D0];
  v5 = a3 + 4;
  v6 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v7 = a3 + 8;
  v8 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 8, CFSTR(" "), 0);
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 128);
  v79[0] = v6;
  v79[1] = CFSTR("descriptor =");
  frontFacingWinding = (void *)self->_frontFacingWinding;
  if (frontFacingWinding)
    v11 = (const __CFString *)objc_msgSend(frontFacingWinding, "formattedDescription:", v5);
  else
    v11 = CFSTR("<null>");
  v79[2] = v11;
  v79[3] = v6;
  v79[4] = CFSTR("viewportCount =");
  v54 = self;
  p_end = &self->_viewports.__end_;
  v79[5] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 0xAAAAAAAAAAAAAAABLL * ((self->_viewports.__end_cap_.__value_ - self->_viewports.__end_) >> 4));
  v79[6] = v6;
  v55 = v6;
  v79[7] = CFSTR("viewports:");
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v79, 8));
  if (self->_viewports.__end_cap_.__value_ != self->_viewports.__end_)
  {
    v14 = 0;
    v15 = 0;
    do
    {
      v78[0] = v8;
      v78[1] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Viewport %lu:"), v15);
      if (0xAAAAAAAAAAAAAAABLL * ((p_end[1] - *p_end) >> 4) <= v15)
        std::vector<MTLViewport>::__throw_out_of_range[abi:ne180100]();
      v16 = *p_end;
      v78[2] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%g %g %g %g %g %g"), *(_QWORD *)((char *)v16 + v14), *(_QWORD *)((char *)v16 + v14 + 8), *(_QWORD *)((char *)v16 + v14 + 16), *(_QWORD *)((char *)v16 + v14 + 24), *(_QWORD *)((char *)v16 + v14 + 32), *(_QWORD *)((char *)v16 + v14 + 40));
      objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 3));
      ++v15;
      v14 += 48;
    }
    while (v15 < 0xAAAAAAAAAAAAAAABLL * ((p_end[1] - *p_end) >> 4));
  }
  cullMode = v54->_cullMode;
  v18 = CFSTR("Unknown");
  v77[0] = v6;
  v77[1] = CFSTR("frontFacingWinding =");
  if (cullMode == 1)
    v19 = CFSTR("MTLWindingCounterClockwise");
  else
    v19 = CFSTR("Unknown");
  if (!cullMode)
    v19 = CFSTR("MTLWindingClockwise");
  v77[2] = v19;
  v77[3] = v6;
  v77[4] = CFSTR("cullMode =");
  depthClipMode = v54->_depthClipMode;
  v21 = CFSTR("Unknown");
  if (depthClipMode <= 2)
    v21 = off_24F795848[depthClipMode];
  v77[5] = v21;
  v77[6] = v6;
  triangleFillMode = v54->_triangleFillMode;
  if (triangleFillMode == 1)
    v18 = CFSTR("MTLDepthClipModeClamp");
  if (!triangleFillMode)
    v18 = CFSTR("MTLDepthClipModeClip");
  v77[7] = CFSTR("depthClipMode =");
  v77[8] = v18;
  v77[9] = v6;
  v77[10] = CFSTR("lineWidth =");
  *(float *)&v13 = v54->_depthBiasSlopeScale;
  v77[11] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
  v77[12] = v6;
  v77[13] = CFSTR("depthBias =");
  *(float *)&v23 = v54->_depthBiasClamp;
  v77[14] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v23);
  v77[15] = v6;
  v77[16] = CFSTR("depthBiasSlopeScale =");
  LODWORD(v24) = v54->_frontStencilRef;
  v77[17] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v24);
  v77[18] = v6;
  v77[19] = CFSTR("depthBiasClamp =");
  LODWORD(v25) = v54->_backStencilRef;
  v77[20] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v25);
  v77[21] = v6;
  v77[22] = CFSTR("scissorRectCount =");
  v77[23] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (v54->_scissorRects.__end_cap_.__value_ - v54->_scissorRects.__end_) >> 5);
  v77[24] = v6;
  v77[25] = CFSTR("scissorRects:");
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 26));
  if (v54->_scissorRects.__end_cap_.__value_ != v54->_scissorRects.__end_)
  {
    v26 = 0;
    v27 = 0;
    do
    {
      v76[0] = v8;
      v76[1] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Scissor %lu:"), v27);
      if (v27 >= (v54->_scissorRects.__end_cap_.__value_ - v54->_scissorRects.__end_) >> 5)
        std::vector<MTLViewport>::__throw_out_of_range[abi:ne180100]();
      v76[2] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu %lu %lu %lu"), *(_QWORD *)((char *)v54->_scissorRects.__end_ + v26), *(_QWORD *)((char *)v54->_scissorRects.__end_ + v26 + 8), *(_QWORD *)((char *)v54->_scissorRects.__end_ + v26 + 16), *(_QWORD *)((char *)v54->_scissorRects.__end_ + v26 + 24));
      objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 3));
      ++v27;
      v26 += 32;
    }
    while (v27 < (v54->_scissorRects.__end_cap_.__value_ - v54->_scissorRects.__end_) >> 5);
  }
  v75[0] = v55;
  v75[1] = CFSTR("amplificationMode =");
  v75[2] = MTLVertexAmplificationModeString();
  v75[3] = v55;
  v75[4] = CFSTR("amplificationValue =");
  v75[5] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v54->_vertexAmplificationCount);
  v75[6] = v55;
  v75[7] = CFSTR("vertexAmplificationCount =");
  v75[8] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v54->_updatedFences.__map_.__first_);
  v75[9] = v55;
  v75[10] = CFSTR("triangleFillMode =");
  renderPipelineState = (unint64_t)v54->_renderPipelineState;
  if (renderPipelineState > 2)
    v29 = CFSTR("Unknown");
  else
    v29 = off_24F795860[renderPipelineState];
  v75[11] = v29;
  v75[12] = v55;
  v75[13] = CFSTR("renderPipelineState =");
  peakPerSampleStorage = v54->_peakPerSampleStorage;
  if (!peakPerSampleStorage)
    peakPerSampleStorage = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v75[14] = peakPerSampleStorage;
  v75[15] = v55;
  v75[16] = CFSTR("depthStencilState =");
  defaultDepthStencilDescriptor = (uint64_t)v54->_defaultDepthStencilDescriptor;
  if (!defaultDepthStencilDescriptor)
  {
    defaultDepthStencilDescriptor = v54->_visibilityResultMode;
    if (!defaultDepthStencilDescriptor)
      defaultDepthStencilDescriptor = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  }
  v75[17] = defaultDepthStencilDescriptor;
  v75[18] = v55;
  v75[19] = CFSTR("frontStencilRef =");
  v75[20] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%x"), LODWORD(v54->_blendColorRed));
  v75[21] = v55;
  v75[22] = CFSTR("backStencilRef =");
  v75[23] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%x"), LODWORD(v54->_blendColorGreen));
  v75[24] = v55;
  v75[25] = CFSTR("visibilityResultMode =");
  visibilityResultOffset = v54->_visibilityResultOffset;
  if (visibilityResultOffset > 2)
    v33 = CFSTR("Unknown");
  else
    v33 = off_24F795878[visibilityResultOffset];
  v75[26] = v33;
  v75[27] = v55;
  v75[28] = CFSTR("visibilityResultOffset =");
  v75[29] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v54->_width);
  v75[30] = v55;
  v75[31] = CFSTR("Blend Color =");
  v75[32] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%g %g %g %g"), v54->_blendColorBlue, v54->_blendColorAlpha, v54->_tessellationFactorScale, *(float *)&v54->_descriptor);
  v75[33] = v55;
  v75[34] = CFSTR("Set Vertex Buffers:");
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v75, 35));
  v34 = 0;
  v35 = v54;
  do
  {
    v74[0] = v8;
    v74[1] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Buffer %lu:"), v34);
    v74[2] = argumentFormattedDescription(v7, (uint64_t)&v35->_vertexBuffers[0].type);
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 3));
    ++v34;
    v35 = (MTLDebugRenderCommandEncoder *)((char *)v35 + 88);
  }
  while (v34 != 36);
  v73[0] = v55;
  v73[1] = CFSTR("Set Vertex Textures:");
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 2));
  v36 = 0;
  v37 = v54;
  do
  {
    v72[0] = v8;
    v72[1] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Texture %lu:"), v36);
    v72[2] = argumentFormattedDescription(v7, (uint64_t)&v37->_vertexTextures[0].type);
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 3));
    ++v36;
    v37 = (MTLDebugRenderCommandEncoder *)((char *)v37 + 88);
  }
  while (v36 != 128);
  v71[0] = v55;
  v71[1] = CFSTR("Set Vertex Samplers:");
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 2));
  v38 = 0;
  v39 = v54;
  do
  {
    v70[0] = v8;
    v70[1] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sampler %lu:"), v38);
    v70[2] = argumentFormattedDescription(v7, (uint64_t)&v39->_vertexSamplers[0].type);
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 3));
    ++v38;
    v39 = (MTLDebugRenderCommandEncoder *)((char *)v39 + 88);
  }
  while (v38 != 16);
  v69[0] = v55;
  v69[1] = CFSTR("Set Fragment Buffers:");
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v69, 2));
  v40 = 0;
  v41 = v54;
  do
  {
    v68[0] = v8;
    v68[1] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Buffer %lu:"), v40);
    v68[2] = argumentFormattedDescription(v7, (uint64_t)&v41->_fragmentBuffers[0].type);
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 3));
    ++v40;
    v41 = (MTLDebugRenderCommandEncoder *)((char *)v41 + 88);
  }
  while (v40 != 31);
  v67[0] = v55;
  v67[1] = CFSTR("Set Fragment Textures:");
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 2));
  v42 = 0;
  v43 = v54;
  do
  {
    v66[0] = v8;
    v66[1] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Texture %lu:"), v42);
    v66[2] = argumentFormattedDescription(v7, (uint64_t)&v43->_fragmentTextures[0].type);
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 3));
    ++v42;
    v43 = (MTLDebugRenderCommandEncoder *)((char *)v43 + 88);
  }
  while (v42 != 128);
  v65[0] = v55;
  v65[1] = CFSTR("Set Fragment Samplers:");
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 2));
  v44 = 0;
  v45 = v54;
  do
  {
    v64[0] = v8;
    v64[1] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sampler %lu:"), v44);
    v64[2] = argumentFormattedDescription(v7, (uint64_t)&v45->_fragmentSamplers[0].type);
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v64, 3));
    ++v44;
    v45 = (MTLDebugRenderCommandEncoder *)((char *)v45 + 88);
  }
  while (v44 != 16);
  v63[0] = v55;
  v63[1] = CFSTR("Set Tile Buffers:");
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 2));
  v46 = 0;
  v47 = v54;
  do
  {
    v62[0] = v8;
    v62[1] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Buffer %lu:"), v46);
    v62[2] = argumentFormattedDescription(v7, (uint64_t)&v47->_tileBuffers[0].type);
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 3));
    ++v46;
    v47 = (MTLDebugRenderCommandEncoder *)((char *)v47 + 88);
  }
  while (v46 != 31);
  v61[0] = v55;
  v61[1] = CFSTR("Set Tile Textures:");
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 2));
  v48 = 0;
  v49 = v54;
  do
  {
    v60[0] = v8;
    v60[1] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Texture %lu:"), v48);
    v60[2] = argumentFormattedDescription(v7, (uint64_t)&v49->_tileTextures[0].type);
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 3));
    ++v48;
    v49 = (MTLDebugRenderCommandEncoder *)((char *)v49 + 88);
  }
  while (v48 != 128);
  v59[0] = v55;
  v59[1] = CFSTR("Set Tile Samplers:");
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 2));
  v50 = 0;
  v51 = v54;
  do
  {
    v58[0] = v8;
    v58[1] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sampler %lu:"), v50);
    v58[2] = argumentFormattedDescription(v7, (uint64_t)&v51->_tileSamplers[0].type);
    objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 3));
    ++v50;
    v51 = (MTLDebugRenderCommandEncoder *)((char *)v51 + 88);
  }
  while (v50 != 16);
  v57[0] = v55;
  v57[1] = CFSTR("Set Tessellation Factor Buffer =");
  v57[2] = argumentFormattedDescription(v7, (uint64_t)&v54->_tessellationFactorBufferArgument.type);
  v57[3] = v55;
  v57[4] = CFSTR("tessellationFactorBufferInstanceStride =");
  v57[5] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)&v54->_tessellationFactorBufferArgument.isValid);
  v57[6] = v55;
  v57[7] = CFSTR("tessellationFactorScale =");
  LODWORD(v52) = HIDWORD(v54->_descriptor);
  v57[8] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v52);
  objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 9));
  v56.receiver = v54;
  v56.super_class = (Class)MTLDebugRenderCommandEncoder;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), -[MTLToolsObject description](&v56, sel_description), objc_msgSend(v9, "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLDebugRenderCommandEncoder formattedDescription:](self, "formattedDescription:", 0);
}

- (void)validateFramebufferWithRenderPipelineState:(id)a3 context:(_MTLMessageContext *)a4
{
  MTLRenderPipelineState *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  MTLRenderPipelineState *v12;
  uint64_t v13;
  MTLDepthStencilState *v14;
  unint64_t v15;
  $EBDDEC458DDD75EB1420AE33CC9E075F *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  unint64_t sampleCount;
  unint64_t pixelFormat;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  MTLRenderPipelineState *previousRenderPipelineStateWithWritesToImageBlock;
  _BOOL4 v32;
  MTLDepthStencilState *depthStencilState;
  unint64_t v35;
  uint64_t Name;
  uint64_t v37;

  v6 = (MTLRenderPipelineState *)*((_QWORD *)a3 + 8);
  if (-[MTLToolsDevice supportsRenderPassWithoutRenderTarget](self->super.super.super._device, "supportsRenderPassWithoutRenderTarget"))
  {
    v7 = objc_msgSend((id)objc_msgSend(a3, "descriptor"), "rasterSampleCount");
    if (v7)
      v8 = v7;
    else
      v8 = (uint64_t)v6;
    v9 = objc_msgSend((id)objc_msgSend(a3, "descriptor"), "colorSampleCount");
    if (v9)
      v10 = v9;
    else
      v10 = (uint64_t)v6;
    v11 = objc_msgSend((id)objc_msgSend(a3, "meshDescriptor"), "rasterSampleCount");
    if (v11)
      v12 = (MTLRenderPipelineState *)v11;
    else
      v12 = (MTLRenderPipelineState *)v8;
    v13 = objc_msgSend((id)objc_msgSend(a3, "meshDescriptor"), "colorSampleCount");
    if (v13)
      v14 = (MTLDepthStencilState *)v13;
    else
      v14 = (MTLDepthStencilState *)v10;
  }
  else
  {
    v14 = 0;
    v12 = 0;
  }
  if (!objc_msgSend(a3, "rasterizationEnabled"))
    goto LABEL_47;
  v15 = 0;
  v16 = &self->_attachmentInfo[1];
  v17 = CFSTR("For color attachment %d, the renderPipelineState pixelFormat must be MTLPixelFormatInvalid, as no texture is set.");
  v18 = CFSTR("For color attachment %d, the render pipeline's pixelFormat (%s) does not match the framebuffer's pixelFormat (%s).");
  v19 = CFSTR("For color attachment %d, the texture sample count (%lu) does not match the renderPipelineState colorSampleCount (%lu).");
  do
  {
    v20 = *((_QWORD *)a3 + v15 + 9);
    sampleCount = v16[-1].sampleCount;
    if (sampleCount)
    {
      pixelFormat = v16->pixelFormat;
      if (v14)
      {
        if (v14 == (MTLDepthStencilState *)pixelFormat)
          goto LABEL_24;
        Name = v16->pixelFormat;
        v37 = (uint64_t)v14;
        v35 = v15;
      }
      else
      {
        if (v6 == (MTLRenderPipelineState *)pixelFormat)
          goto LABEL_24;
        Name = v16->pixelFormat;
        v37 = (uint64_t)v6;
        v35 = v15;
      }
      _MTLMessageContextPush_();
      v19 = CFSTR("For color attachment %d, the texture sample count (%lu) does not match the renderPipelineState colorSampleCount (%lu).");
      v18 = CFSTR("For color attachment %d, the render pipeline's pixelFormat (%s) does not match the framebuffer's pixelFormat (%s).");
      v17 = CFSTR("For color attachment %d, the renderPipelineState pixelFormat must be MTLPixelFormatInvalid, as no texture is set.");
LABEL_24:
      if (v20 != sampleCount)
      {
        v25 = v18;
        Name = MTLPixelFormatGetName();
        v37 = MTLPixelFormatGetName();
        v35 = v15;
        _MTLMessageContextPush_();
        v19 = CFSTR("For color attachment %d, the texture sample count (%lu) does not match the renderPipelineState colorSampleCount (%lu).");
        v18 = v25;
        v17 = CFSTR("For color attachment %d, the renderPipelineState pixelFormat must be MTLPixelFormatInvalid, as no texture is set.");
      }
      goto LABEL_26;
    }
    if (v20)
    {
      v35 = v15;
      v23 = v17;
      v24 = v19;
      _MTLMessageContextPush_();
      v19 = v24;
      v18 = CFSTR("For color attachment %d, the render pipeline's pixelFormat (%s) does not match the framebuffer's pixelFormat (%s).");
      v17 = v23;
    }
LABEL_26:
    ++v16;
    ++v15;
  }
  while (v15 != 8);
  if (objc_msgSend(a3, "tileDescriptor"))
    goto LABEL_47;
  v26 = self->_attachmentInfo[8].sampleCount;
  v27 = *((_QWORD *)a3 + 17);
  if (!v26)
  {
    if (!v27)
      goto LABEL_39;
    goto LABEL_62;
  }
  v28 = self->_attachmentInfo[9].pixelFormat;
  if (v12)
  {
    if (v12 != (MTLRenderPipelineState *)v28)
    {
      v35 = self->_attachmentInfo[9].pixelFormat;
      Name = (uint64_t)v12;
      goto LABEL_66;
    }
  }
  else if (v6 != (MTLRenderPipelineState *)v28)
  {
    v35 = self->_attachmentInfo[9].pixelFormat;
    Name = (uint64_t)v6;
LABEL_66:
    _MTLMessageContextPush_();
  }
  if (v27 != v26)
  {
    v35 = MTLPixelFormatGetName();
    Name = MTLPixelFormatGetName();
LABEL_62:
    _MTLMessageContextPush_();
  }
LABEL_39:
  v29 = self->_attachmentInfo[9].sampleCount;
  v30 = *((_QWORD *)a3 + 18);
  if (!v29)
  {
    if (!v30)
      goto LABEL_47;
    goto LABEL_64;
  }
  previousRenderPipelineStateWithWritesToImageBlock = self->_previousRenderPipelineStateWithWritesToImageBlock;
  if (v12)
  {
    if (v12 != previousRenderPipelineStateWithWritesToImageBlock)
    {
      v35 = (unint64_t)self->_previousRenderPipelineStateWithWritesToImageBlock;
      Name = (uint64_t)v12;
      goto LABEL_68;
    }
  }
  else if (v6 != previousRenderPipelineStateWithWritesToImageBlock)
  {
    v35 = (unint64_t)self->_previousRenderPipelineStateWithWritesToImageBlock;
    Name = (uint64_t)v6;
LABEL_68:
    _MTLMessageContextPush_();
  }
  if (v30 != v29)
  {
    v35 = MTLPixelFormatGetName();
    Name = MTLPixelFormatGetName();
LABEL_64:
    _MTLMessageContextPush_();
  }
LABEL_47:
  if (-[MTLToolsDevice supportsRenderPassWithoutRenderTarget](self->super.super.super._device, "supportsRenderPassWithoutRenderTarget", v35, Name, v37))
  {
    v32 = -[MTLToolsDevice supportsSeparateVisibilityAndShadingRate](self->super.super.super._device, "supportsSeparateVisibilityAndShadingRate");
    depthStencilState = self->_depthStencilState;
    if (v32)
    {
      if (depthStencilState != v14)
        _MTLMessageContextPush_();
      if (*(MTLRenderPipelineState **)&self->_vertexBuffers[0].isValid != v12)
        goto LABEL_60;
    }
    else
    {
      if (depthStencilState != *(MTLDepthStencilState **)&self->_vertexBuffers[0].isValid || v14 != v12)
      {
        _MTLMessageContextPush_();
        depthStencilState = self->_depthStencilState;
      }
      if (depthStencilState != v14)
LABEL_60:
        _MTLMessageContextPush_();
    }
  }
}

- (void)setRenderPipelineState:(id)a3
{
  int visibilityOffsets;
  MTLToolsDevice *device;
  int v7;
  void *peakPerSampleStorage;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t *p_height;
  unint64_t *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t resolvedSampleCount;
  __int128 v20;
  unint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = 0;
  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
  {
    _MTLMessageContextPush_();
    if (a3)
      goto LABEL_3;
LABEL_29:
    _MTLMessageContextPush_();
    goto LABEL_3;
  }
  if (!a3)
    goto LABEL_29;
LABEL_3:
  visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x20000) != 0 && (id)self->_peakPerSampleStorage == a3)
  {
    _MTLMessageContextPush_();
    if (((uint64_t)self->_visibilityOffsets & 4) != 0)
      goto LABEL_6;
  }
  else if ((visibilityOffsets & 4) != 0)
  {
    goto LABEL_6;
  }
  _MTLMessageContextPush_();
LABEL_6:
  _MTLMessageContextEnd();
  if ((id)self->_peakPerSampleStorage != a3)
  {
    v25 = 0;
    v23 = 0u;
    v24 = 0u;
    v22 = 0u;
    _MTLMessageContextBegin_();
    if (a3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        device = self->super.super.super._device;
        if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
          _MTLMessageContextPush_();
        if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled())
          -[MTLDebugRenderCommandEncoder validateFramebufferWithRenderPipelineState:context:](self, "validateFramebufferWithRenderPipelineState:context:", a3, &v22);
      }
      else
      {
        _MTLMessageContextPush_();
      }
    }
    v7 = (int)self->_visibilityOffsets;
    LODWORD(self->_visibilityOffsets) = v7 | 0x20000;
    peakPerSampleStorage = (void *)self->_peakPerSampleStorage;
    if (peakPerSampleStorage && (v7 & 4) != 0 && objc_msgSend(peakPerSampleStorage, "outputImageBlockData"))
      self->_resolvedRasterSampleCount = self->_peakPerSampleStorage;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(a3, "imageblockSampleLength");
      if (v9 > self->_resolvedSampleCount)
      {
        v18 = v9;
        resolvedSampleCount = self->_resolvedSampleCount;
        _MTLMessageContextPush_();
      }
    }
    v10 = objc_msgSend((id)self->_frontFacingWinding, "tileWidth", v18, resolvedSampleCount);
    v11 = objc_msgSend((id)self->_frontFacingWinding, "tileHeight") * v10 * (uint64_t)self->_depthStencilState;
    v12 = self->_resolvedSampleCount;
    v13 = objc_msgSend((id)self->_frontFacingWinding, "threadgroupMemoryLength") + v11 * v12;
    if (v13 > -[MTLToolsDevice maxThreadgroupMemoryLength](self->super.super.super._device, "maxThreadgroupMemoryLength"))
    {
      -[MTLToolsDevice maxThreadgroupMemoryLength](self->super.super.super._device, "maxThreadgroupMemoryLength");
      _MTLMessageContextPush_();
    }
    _MTLMessageContextEnd();
    LODWORD(self->_visibilityOffsets) &= ~4u;
    objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 0);
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setRenderPipelineState:", objc_msgSend(a3, "baseObject"));
    self->_peakPerSampleStorage = (unint64_t)a3;
    *(_DWORD *)&self->_openGLModeEnabled |= 0x7FFFu;
    p_height = &self->_objectThreadsPerTG.height;
    self->_objectThreadsPerTG.depth = 0;
    self->_meshThreadsPerTG.width = 0;
    self->_objectThreadsPerTG.height = 0;
    v15 = &self->_meshThreadsPerTG.height;
    self->_meshThreadsPerTG.depth = 0;
    *(_QWORD *)&self->_allowsNullBufferBinds = 0;
    self->_meshThreadsPerTG.height = 0;
    if (objc_msgSend((id)self->_peakPerSampleStorage, "isMeshShaderPipeline"))
    {
      v16 = (void *)objc_msgSend((id)self->_peakPerSampleStorage, "descriptor");
      if (v16)
      {
        v17 = v16;
        objc_msgSend(v16, "objectThreadsPerThreadgroup");
        *(_OWORD *)p_height = v20;
        p_height[2] = v21;
        objc_msgSend(v17, "meshThreadsPerThreadgroup");
        *(_OWORD *)v15 = v20;
        v15[2] = v21;
      }
    }
  }
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLDebugRenderCommandEncoder setVertexBytes:length:attributeStride:atIndex:](self, "setVertexBytes:length:attributeStride:atIndex:", a3, a4, -1, a5);
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  _BOOL4 v11;
  id v12;
  unint64_t *p_type;
  unint64_t v14;
  unint64_t attachmentWriteMask;
  _MTLMessageContext v16;

  memset(&v16, 0, sizeof(v16));
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (self->_attachmentWriteMask <= a6)
  {
    v14 = a6;
    attachmentWriteMask = self->_attachmentWriteMask;
    _MTLMessageContextPush_();
  }
  if (-[MTLToolsDevice maxVertexInlineDataSize](self->super.super.super._device, "maxVertexInlineDataSize", v14, attachmentWriteMask, v16.var0, v16.var1, *(_QWORD *)&v16.var2, v16.var3, v16.var4, v16.var5, v16.var6) < a4)
  {
    -[MTLToolsDevice maxVertexInlineDataSize](self->super.super.super._device, "maxVertexInlineDataSize");
    _MTLMessageContextPush_();
  }
  if (a6 <= 0x23)
    validateArg(MTLArgumentTypeBuffer, a6, (MTLDebugFunctionArgument *)&self->_vertexBuffers[a6].type, &v16);
  _MTLMessageContextEnd();
  v11 = -[MTLToolsDevice supportsDynamicAttributeStride](self->super.super.super._device, "supportsDynamicAttributeStride");
  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  if (v11)
    objc_msgSend(v12, "setVertexBytes:length:attributeStride:atIndex:", a3, a4, a5, a6);
  else
    objc_msgSend(v12, "setVertexBytes:length:atIndex:", a3, a4, a6);
  MTLReportFailureTypeEnabled();
  p_type = &self->_vertexBuffers[a6].type;
  *(_BYTE *)p_type = a4 != 0;
  *((_BYTE *)p_type + 1) = 0;
  p_type[1] = 0;
  p_type[2] = 0;
  p_type[3] = 0;
  p_type[4] = a4;
  p_type[5] = 0;
  p_type[6] = a5;
  p_type[7] = 0;
  p_type[8] = 0;
  *((_BYTE *)p_type + 72) = 0;
  *((_DWORD *)p_type + 19) = 0;
  *((_DWORD *)p_type + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 2u;
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLDebugRenderCommandEncoder setVertexBuffer:offset:attributeStride:atIndex:](self, "setVertexBuffer:offset:attributeStride:atIndex:", a3, a4, -1, a5);
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  MTLToolsDevice *device;
  unint64_t v12;
  _BOOL4 v13;
  id v14;
  uint64_t v15;
  unint64_t *p_type;
  unint64_t *v17;
  unint64_t *v18;
  _MTLMessageContext v19;

  memset(&v19, 0, sizeof(v19));
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (self->_attachmentWriteMask > a6)
  {
    if (a3)
      goto LABEL_5;
LABEL_12:
    if (!a4)
      goto LABEL_13;
    goto LABEL_10;
  }
  _MTLMessageContextPush_();
  if (!a3)
    goto LABEL_12;
LABEL_5:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_10:
    _MTLMessageContextPush_();
LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    _MTLMessageContextPush_();
  v12 = *((_QWORD *)a3 + 8);
  if (v12 <= a4)
    _MTLMessageContextPush_();
LABEL_14:
  if (a6 <= 0x23)
    validateArg(MTLArgumentTypeBuffer, a6, (MTLDebugFunctionArgument *)&self->_vertexBuffers[a6].type, &v19);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  v13 = -[MTLToolsDevice supportsDynamicAttributeStride](self->super.super.super._device, "supportsDynamicAttributeStride");
  v14 = -[MTLToolsObject baseObject](self, "baseObject");
  v15 = objc_msgSend(a3, "baseObject");
  if (v13)
    objc_msgSend(v14, "setVertexBuffer:offset:attributeStride:atIndex:", v15, a4, a5, a6);
  else
    objc_msgSend(v14, "setVertexBuffer:offset:atIndex:", v15, a4, a6);
  p_type = &self->_vertexBuffers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    if (a3)
    {
      v17 = &p_type[11 * a6];
      if (!*((_BYTE *)v17 + 72)
        && v17[6] == a5
        && v17[5] == a4
        && v17[4] == v12
        && (id)v17[2] == a3
        && !(v17[3] | v17[1])
        && *(_OWORD *)(v17 + 7) == 0
        && !*(unint64_t *)((char *)v17 + 76))
      {
        MTLReportFailure();
      }
    }
  }
  v18 = &p_type[11 * a6];
  *(_BYTE *)v18 = v12 != 0;
  *((_BYTE *)v18 + 1) = 0;
  v18[1] = 0;
  v18[2] = (unint64_t)a3;
  v18[3] = 0;
  v18[4] = v12;
  v18[5] = a4;
  v18[6] = a5;
  v18[7] = 0;
  v18[8] = 0;
  *((_BYTE *)v18 + 72) = 0;
  *((_DWORD *)v18 + 19) = 0;
  *((_DWORD *)v18 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 2u;
}

- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[MTLDebugRenderCommandEncoder setVertexBufferOffset:attributeStride:atIndex:](self, "setVertexBufferOffset:attributeStride:atIndex:", a3, -1, a4);
}

- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MTLDebugFunctionArgument *p_type;
  baseLevel *v10;
  id *p_object;
  baseLevel *object;
  _BOOL4 v13;
  id v14;
  unint64_t *v15;
  unint64_t *v16;
  void *v17;
  void **v18;
  void *v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t attachmentWriteMask;
  _MTLMessageContext v25;

  memset(&v25, 0, sizeof(v25));
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (self->_attachmentWriteMask <= a5)
  {
    v23 = a5;
    attachmentWriteMask = self->_attachmentWriteMask;
    _MTLMessageContextPush_();
  }
  if (a5 <= 0x23)
  {
    p_type = (MTLDebugFunctionArgument *)&self->_vertexBuffers[a5].type;
    validateArg(MTLArgumentTypeBuffer, a5, p_type, &v25);
    object = p_type->object;
    p_object = (id *)&p_type->object;
    v10 = object;
    if (object)
    {
      if (-[baseLevel length](v10, "length") > a3)
        goto LABEL_11;
      v23 = a3;
      attachmentWriteMask = objc_msgSend(*p_object, "length");
    }
    else
    {
      v23 = a5;
    }
    _MTLMessageContextPush_();
  }
LABEL_11:
  _MTLMessageContextEnd();
  v13 = -[MTLToolsDevice supportsDynamicAttributeStride](self->super.super.super._device, "supportsDynamicAttributeStride");
  v14 = -[MTLToolsObject baseObject](self, "baseObject");
  if (v13)
    objc_msgSend(v14, "setVertexBufferOffset:attributeStride:atIndex:", a3, a4, a5);
  else
    objc_msgSend(v14, "setVertexBufferOffset:atIndex:", a3, a5);
  v15 = &self->_vertexBuffers[0].type;
  v16 = &self->_vertexBuffers[a5].type;
  v19 = (void *)v16[2];
  v18 = (void **)(v16 + 2);
  v17 = v19;
  v20 = objc_msgSend(v19, "length", v23, attachmentWriteMask, v25.var0, v25.var1, *(_QWORD *)&v25.var2, v25.var3, v25.var4, v25.var5, v25.var6);
  if (MTLReportFailureTypeEnabled())
  {
    if (v17)
    {
      v21 = &v15[11 * a5];
      if (!*((_BYTE *)v21 + 72)
        && v21[6] == a4
        && v21[5] == a3
        && v21[4] == v20
        && *v18 == v17
        && !(v21[3] | v21[1])
        && *(_OWORD *)(v21 + 7) == 0
        && !*(unint64_t *)((char *)v21 + 76))
      {
        MTLReportFailure();
      }
    }
  }
  v22 = &v15[11 * a5];
  *(_BYTE *)v22 = v20 != 0;
  *((_BYTE *)v22 + 1) = 0;
  v22[1] = 0;
  v22[2] = (unint64_t)v17;
  v22[3] = 0;
  v22[4] = v20;
  v22[5] = a3;
  v22[6] = a4;
  v22[7] = 0;
  v22[8] = 0;
  *((_BYTE *)v22 + 72) = 0;
  *((_DWORD *)v22 + 19) = 0;
  *((_DWORD *)v22 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 2u;
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v10;
  void *__b[3];

  length = a5.length;
  location = a5.location;
  std::vector<unsigned long>::vector(__b, a5.length);
  v10 = __b[0];
  if (length)
    memset(__b[0], 255, 8 * length);
  -[MTLDebugRenderCommandEncoder setVertexBuffers:offsets:attributeStrides:withRange:](self, "setVertexBuffers:offsets:attributeStrides:withRange:", a3, a4, v10, location, length);
  if (__b[0])
  {
    __b[1] = __b[0];
    operator delete(__b[0]);
  }
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  MTLToolsRetainingContainer *v11;
  char *v12;
  const void **v13;
  MTLToolsDevice *device;
  const unint64_t *v15;
  MTLToolsRetainingContainer **v16;
  _QWORD *v17;
  const unint64_t *v18;
  NSUInteger v19;
  MTLToolsRetainingContainer *v20;
  MTLToolsRetainingContainer **v21;
  MTLToolsRetainingContainer *v22;
  unint64_t v23;
  MTLToolsRetainingContainer *v24;
  int v25;
  MTLToolsRetainingContainer *v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  BOOL v30;
  BOOL v31;
  BOOL v32;
  BOOL v34;
  id v35;
  MTLToolsRetainingContainer *v36;
  unint64_t attachmentWriteMask;
  MTLToolsRetainingContainer *v38;
  uint64_t v39;
  const unint64_t *v41;
  NSUInteger v42;
  NSUInteger v43;
  MTLDebugRenderCommandEncoder *v44;
  const void **v45;
  _MTLMessageContext v46;
  _BYTE v47[288];
  uint64_t v48;

  length = a6.length;
  location = a6.location;
  v48 = *MEMORY[0x24BDAC8D0];
  memset(&v46, 0, sizeof(v46));
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length > self->_attachmentWriteMask)
  {
    v36 = (MTLToolsRetainingContainer *)(location + length);
    attachmentWriteMask = self->_attachmentWriteMask;
    _MTLMessageContextPush_();
  }
  v42 = location;
  v43 = length;
  v41 = a4;
  if (!length)
  {
    _MTLMessageContextEnd();
    goto LABEL_52;
  }
  v11 = 0;
  v12 = (char *)self + 88 * location;
  do
  {
    if (!a3[(_QWORD)v11])
    {
      if (!a4[(_QWORD)v11])
        goto LABEL_17;
      v36 = v11;
      attachmentWriteMask = a4[(_QWORD)v11];
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v36 = v11;
      goto LABEL_16;
    }
    v13 = a3;
    device = self->super.super.super._device;
    if (device != (MTLToolsDevice *)objc_msgSend((id)v13[(_QWORD)v11], "device"))
    {
      v36 = v11;
      _MTLMessageContextPush_();
    }
    a3 = v13;
    if (a4[(_QWORD)v11] >= *((_QWORD *)v13[(_QWORD)v11] + 8))
    {
      v38 = v11;
      v39 = *((_QWORD *)v13[(_QWORD)v11] + 8);
      v36 = v11;
      attachmentWriteMask = a4[(_QWORD)v11];
LABEL_16:
      _MTLMessageContextPush_();
    }
LABEL_17:
    if ((unint64_t)v11 + location <= 0x23)
      validateArg(MTLArgumentTypeBuffer, (unint64_t)v11 + location, (MTLDebugFunctionArgument *)(v12 + 248), &v46);
    v11 = (MTLToolsRetainingContainer *)((char *)v11 + 1);
    v12 += 88;
  }
  while ((MTLToolsRetainingContainer *)length != v11);
  _MTLMessageContextEnd();
  v15 = a4;
  v16 = &self->super.super._commandBuffer + 11 * v42;
  v44 = self;
  v17 = v47;
  v18 = a5;
  v19 = length;
  do
  {
    if (*a3)
      v20 = (MTLToolsRetainingContainer *)*((_QWORD *)*a3 + 8);
    else
      v20 = 0;
    objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", v36, attachmentWriteMask, v38, v39);
    *v17 = objc_msgSend((id)*a3, "baseObject");
    v21 = v16 + 31;
    v45 = a3;
    v22 = (MTLToolsRetainingContainer *)*a3;
    v23 = *v15;
    v24 = (MTLToolsRetainingContainer *)*v18;
    v25 = MTLReportFailureTypeEnabled();
    v26 = (MTLToolsRetainingContainer *)v23;
    if (v25 && v22)
    {
      v27 = !*((_BYTE *)v16 + 280) && v16[32] == v24;
      v28 = v27 && *v21 == (MTLToolsRetainingContainer *)v23;
      v29 = v28 && v16[30] == v20;
      v30 = v29 && v16[28] == v22;
      v31 = v30 && ((unint64_t)v16[29] | (unint64_t)v16[27]) == 0;
      v32 = v31 && *(_OWORD *)(v16 + 33) == 0;
      if (v32 && *(MTLToolsRetainingContainer **)((char *)v16 + 284) == 0)
      {
        v36 = v22;
        MTLReportFailure();
        v26 = (MTLToolsRetainingContainer *)v23;
      }
    }
    *((_BYTE *)v16 + 208) = v20 != 0;
    *((_BYTE *)v16 + 209) = 0;
    v16[27] = 0;
    v16[28] = v22;
    v16[29] = 0;
    v16[30] = v20;
    *v21 = v26;
    v16[32] = v24;
    v16[33] = 0;
    v16[34] = 0;
    v16 += 11;
    *((_BYTE *)v21 + 32) = 0;
    ++v18;
    ++v15;
    ++v17;
    a3 = v45 + 1;
    *((_DWORD *)v21 + 9) = 0;
    *((_DWORD *)v21 + 10) = 0;
    --v19;
    self = v44;
  }
  while (v19);
LABEL_52:
  v34 = -[MTLToolsDevice supportsDynamicAttributeStride](self->super.super.super._device, "supportsDynamicAttributeStride", v36);
  v35 = -[MTLToolsObject baseObject](self, "baseObject");
  if (v34)
    objc_msgSend(v35, "setVertexBuffers:offsets:attributeStrides:withRange:", v47, v41, a5, v42, v43);
  else
    objc_msgSend(v35, "setVertexBuffers:offsets:withRange:", v47, v41, v42, v43);
  *(_DWORD *)&self->_openGLModeEnabled |= 2u;
}

- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4
{
  MTLToolsDevice *device;
  unint64_t *p_type;
  unint64_t *v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  _MTLMessageContext v13;

  memset(&v13, 0, sizeof(v13));
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxVertexTextures](self->super.super.super._device, "maxVertexTextures") <= a4)
  {
    v11 = a4;
    v12 = -[MTLToolsDevice maxVertexTextures](self->super.super.super._device, "maxVertexTextures");
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_10;
  }
  else if (!a3)
  {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    _MTLMessageContextPush_();
  if (objc_msgSend(a3, "storageMode", v11, v12, v13.var0, v13.var1, *(_QWORD *)&v13.var2, v13.var3, v13.var4, v13.var5, v13.var6) == 3)LABEL_9:_MTLMessageContextPush_();
LABEL_10:
  if (a4 <= 0x7F)
    validateArg(MTLArgumentTypeTexture, a4, (MTLDebugFunctionArgument *)&self->_vertexTextures[a4].type, &v13);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  p_type = &self->_vertexTextures[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    v9 = &p_type[11 * a4];
    if (!*((_BYTE *)v9 + 72)
      && v9[6] == -1
      && v9[1] == 1
      && (id)v9[2] == a3
      && !(v9[4] | v9[3] | v9[5])
      && *(_OWORD *)(v9 + 7) == 0
      && !*(unint64_t *)((char *)v9 + 76))
    {
      MTLReportFailure();
    }
  }
  v10 = &p_type[11 * a4];
  *(_BYTE *)v10 = a3 != 0;
  *((_BYTE *)v10 + 1) = 0;
  v10[1] = 1;
  v10[2] = (unint64_t)a3;
  v10[3] = 0;
  v10[4] = 0;
  v10[5] = 0;
  v10[6] = -1;
  v10[7] = 0;
  v10[8] = 0;
  *((_BYTE *)v10 + 72) = 0;
  *((_DWORD *)v10 + 19) = 0;
  *((_DWORD *)v10 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 4u;
}

- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void *v8;
  char *v9;
  MTLToolsDevice *device;
  char *v11;
  _QWORD *v12;
  NSUInteger v13;
  const void *v14;
  BOOL v15;
  char *v21;
  const void *v22;
  unint64_t v23;
  _MTLMessageContext v24;
  _BYTE v25[1024];
  uint64_t v26;

  length = a4.length;
  location = a4.location;
  v26 = *MEMORY[0x24BDAC8D0];
  memset(&v24, 0, sizeof(v24));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length <= -[MTLToolsDevice maxVertexTextures](self->super.super.super._device, "maxVertexTextures"))
  {
    if (length)
      goto LABEL_5;
LABEL_40:
    _MTLMessageContextEnd();
    goto LABEL_41;
  }
  v22 = (const void *)(location + length);
  v23 = -[MTLToolsDevice maxVertexTextures](self->super.super.super._device, "maxVertexTextures");
  _MTLMessageContextPush_();
  if (!length)
    goto LABEL_40;
LABEL_5:
  v8 = 0;
  v9 = (char *)self + 88 * location;
  do
  {
    if (a3[(_QWORD)v8])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_11;
      device = self->super.super.super._device;
      if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v8], "device", CFSTR("textures[%lu] is not an MTLTexture.")))
      {
        v22 = v8;
        _MTLMessageContextPush_();
      }
      if (objc_msgSend((id)a3[(_QWORD)v8], "storageMode", v22, v23) == 3)
      {
LABEL_11:
        v22 = v8;
        _MTLMessageContextPush_();
      }
    }
    if ((unint64_t)v8 + location <= 0x7F)
      validateArg(MTLArgumentTypeTexture, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 3416), &v24);
    v8 = (char *)v8 + 1;
    v9 += 88;
  }
  while ((const void *)length != v8);
  _MTLMessageContextEnd();
  v11 = (char *)self + 88 * location;
  v12 = v25;
  v13 = length;
  do
  {
    objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 1, v22);
    *v12 = objc_msgSend((id)*a3, "baseObject");
    v14 = *a3;
    if (MTLReportFailureTypeEnabled())
    {
      if (v11[3488])
        v15 = 0;
      else
        v15 = *((_QWORD *)v11 + 433) == -1;
      if (v15
        && *((_QWORD *)v11 + 428) == 1
        && *((_QWORD *)v11 + 429) == (_QWORD)v14
        && (*((_QWORD *)v11 + 431) | *((_QWORD *)v11 + 430) | *((_QWORD *)v11 + 432)) == 0
        && *((_OWORD *)v11 + 217) == 0
        && *(_QWORD *)(v11 + 3492) == 0)
      {
        v22 = v14;
        MTLReportFailure();
      }
    }
    v21 = v11 + 3416;
    v11[3416] = v14 != 0;
    v11[3417] = 0;
    *((_QWORD *)v11 + 428) = 1;
    *((_QWORD *)v11 + 429) = v14;
    *((_QWORD *)v11 + 430) = 0;
    *((_QWORD *)v11 + 431) = 0;
    *((_QWORD *)v11 + 432) = 0;
    *((_QWORD *)v11 + 433) = -1;
    *((_QWORD *)v11 + 434) = 0;
    *((_QWORD *)v11 + 435) = 0;
    v11[3488] = 0;
    v11 += 88;
    ++v12;
    ++a3;
    *((_DWORD *)v21 + 19) = 0;
    *((_DWORD *)v21 + 20) = 0;
    --v13;
  }
  while (v13);
LABEL_41:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setVertexTextures:withRange:", v25, location, length);
  *(_DWORD *)&self->_openGLModeEnabled |= 4u;
}

- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  MTLToolsDevice *device;
  unint64_t *p_type;
  unint64_t *v9;
  unint64_t *v10;
  _MTLMessageContext v11;

  memset(&v11, 0, sizeof(v11));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxVertexSamplers](self->super.super.super._device, "maxVertexSamplers") <= a4)
  {
    -[MTLToolsDevice maxVertexSamplers](self->super.super.super._device, "maxVertexSamplers");
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_8;
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)objc_msgSend(a3, "device")))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a4 <= 0xF)
    validateArg(MTLArgumentTypeSampler, a4, (MTLDebugFunctionArgument *)&self->_vertexSamplers[a4].type, &v11);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 0);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexSamplerState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  p_type = &self->_vertexSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    v9 = &p_type[11 * a4];
    if (!*((_BYTE *)v9 + 72)
      && v9[6] == -1
      && v9[1] == 2
      && (id)v9[2] == a3
      && !(v9[4] | v9[3] | v9[5])
      && *(_OWORD *)(v9 + 7) == 0
      && !*(unint64_t *)((char *)v9 + 76))
    {
      MTLReportFailure();
    }
  }
  v10 = &p_type[11 * a4];
  *(_BYTE *)v10 = a3 != 0;
  *((_BYTE *)v10 + 1) = 0;
  v10[1] = 2;
  v10[2] = (unint64_t)a3;
  v10[3] = 0;
  v10[4] = 0;
  v10[5] = 0;
  v10[6] = -1;
  v10[7] = 0;
  v10[8] = 0;
  *((_BYTE *)v10 + 72) = 0;
  *((_DWORD *)v10 + 19) = 0;
  *((_DWORD *)v10 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 8u;
}

- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void *v8;
  char *v9;
  MTLToolsDevice *device;
  char *v11;
  _QWORD *v12;
  NSUInteger v13;
  const void *v14;
  BOOL v15;
  char *v21;
  const void *v22;
  unint64_t v23;
  _MTLMessageContext v24;
  _BYTE v25[128];
  uint64_t v26;

  length = a4.length;
  location = a4.location;
  v26 = *MEMORY[0x24BDAC8D0];
  memset(&v24, 0, sizeof(v24));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length <= -[MTLToolsDevice maxVertexSamplers](self->super.super.super._device, "maxVertexSamplers"))
  {
    if (length)
      goto LABEL_5;
LABEL_38:
    _MTLMessageContextEnd();
    goto LABEL_39;
  }
  v22 = (const void *)(location + length);
  v23 = -[MTLToolsDevice maxVertexSamplers](self->super.super.super._device, "maxVertexSamplers");
  _MTLMessageContextPush_();
  if (!length)
    goto LABEL_38;
LABEL_5:
  v8 = 0;
  v9 = (char *)self + 88 * location;
  do
  {
    if (a3[(_QWORD)v8])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (device = self->super.super.super._device,
            device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v8], "device", CFSTR("samplers[%lu] is not an MTLSamplerState."))))
      {
        v22 = v8;
        _MTLMessageContextPush_();
      }
    }
    if ((unint64_t)v8 + location <= 0xF)
      validateArg(MTLArgumentTypeSampler, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 14680), &v24);
    v8 = (char *)v8 + 1;
    v9 += 88;
  }
  while ((const void *)length != v8);
  _MTLMessageContextEnd();
  v11 = (char *)self + 88 * location;
  v12 = v25;
  v13 = length;
  do
  {
    objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 0, v22, v23);
    *v12 = objc_msgSend((id)*a3, "baseObject");
    v14 = *a3;
    if (MTLReportFailureTypeEnabled())
    {
      if (v11[14752])
        v15 = 0;
      else
        v15 = *((_QWORD *)v11 + 1841) == -1;
      if (v15
        && *((_QWORD *)v11 + 1836) == 2
        && *((_QWORD *)v11 + 1837) == (_QWORD)v14
        && (*((_QWORD *)v11 + 1839) | *((_QWORD *)v11 + 1838) | *((_QWORD *)v11 + 1840)) == 0
        && *((_OWORD *)v11 + 921) == 0
        && *(_QWORD *)(v11 + 14756) == 0)
      {
        v22 = v14;
        MTLReportFailure();
      }
    }
    v21 = v11 + 14680;
    v11[14680] = v14 != 0;
    v11[14681] = 0;
    *((_QWORD *)v11 + 1836) = 2;
    *((_QWORD *)v11 + 1837) = v14;
    *((_QWORD *)v11 + 1838) = 0;
    *((_QWORD *)v11 + 1839) = 0;
    *((_QWORD *)v11 + 1840) = 0;
    *((_QWORD *)v11 + 1841) = -1;
    *((_QWORD *)v11 + 1842) = 0;
    *((_QWORD *)v11 + 1843) = 0;
    v11[14752] = 0;
    v11 += 88;
    ++v12;
    ++a3;
    *((_DWORD *)v21 + 19) = 0;
    *((_DWORD *)v21 + 20) = 0;
    --v13;
  }
  while (v13);
LABEL_39:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setVertexSamplerStates:withRange:", v25, location, length);
  *(_DWORD *)&self->_openGLModeEnabled |= 8u;
}

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  MTLToolsDevice *device;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  unint64_t *p_type;
  unint64_t *v17;
  unint64_t *v18;
  _MTLMessageContext v19;

  memset(&v19, 0, sizeof(v19));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxVertexSamplers](self->super.super.super._device, "maxVertexSamplers") <= a6)
  {
    -[MTLToolsDevice maxVertexSamplers](self->super.super.super._device, "maxVertexSamplers");
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_8;
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)objc_msgSend(a3, "device")))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a6 <= 0xF)
    validateArg(MTLArgumentTypeSampler, a6, (MTLDebugFunctionArgument *)&self->_vertexSamplers[a6].type, &v19);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 0);
  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  v13 = objc_msgSend(a3, "baseObject");
  *(float *)&v14 = a4;
  *(float *)&v15 = a5;
  objc_msgSend(v12, "setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:", v13, a6, v14, v15);
  p_type = &self->_vertexSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    v17 = &p_type[11 * a6];
    if (*((_DWORD *)v17 + 20) == LODWORD(a5)
      && *((_DWORD *)v17 + 19) == LODWORD(a4)
      && *((_BYTE *)v17 + 72)
      && v17[6] == -1
      && v17[1] == 2
      && (id)v17[2] == a3
      && !(v17[4] | v17[3] | v17[5])
      && *(_OWORD *)(v17 + 7) == 0)
    {
      MTLReportFailure();
    }
  }
  v18 = &p_type[11 * a6];
  *(_BYTE *)v18 = a3 != 0;
  *((_BYTE *)v18 + 1) = 0;
  v18[1] = 2;
  v18[2] = (unint64_t)a3;
  v18[3] = 0;
  v18[4] = 0;
  v18[5] = 0;
  v18[6] = -1;
  v18[7] = 0;
  v18[8] = 0;
  *((_BYTE *)v18 + 72) = 1;
  *((float *)v18 + 19) = a4;
  *((float *)v18 + 20) = a5;
  *(_DWORD *)&self->_openGLModeEnabled |= 8u;
}

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 lodBias:(float)a6 atIndex:(unint64_t)a7
{
  MTLToolsDevice *device;
  id v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  unint64_t *p_type;
  unint64_t *v20;
  unint64_t *v21;
  _MTLMessageContext v22;

  memset(&v22, 0, sizeof(v22));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxVertexSamplers](self->super.super.super._device, "maxVertexSamplers") <= a7)
  {
    -[MTLToolsDevice maxVertexSamplers](self->super.super.super._device, "maxVertexSamplers");
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_8;
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)objc_msgSend(a3, "device")))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a7 <= 0xF)
    validateArg(MTLArgumentTypeSampler, a7, (MTLDebugFunctionArgument *)&self->_vertexSamplers[a7].type, &v22);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 0);
  v14 = -[MTLToolsObject baseObject](self, "baseObject");
  v15 = objc_msgSend(a3, "baseObject");
  *(float *)&v16 = a4;
  *(float *)&v17 = a5;
  *(float *)&v18 = a6;
  objc_msgSend(v14, "setVertexSamplerState:lodMinClamp:lodMaxClamp:lodBias:atIndex:", v15, a7, v16, v17, v18);
  p_type = &self->_vertexSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    v20 = &p_type[11 * a7];
    if (*((_DWORD *)v20 + 20) == LODWORD(a5)
      && *((_DWORD *)v20 + 19) == LODWORD(a4)
      && *((_BYTE *)v20 + 72)
      && v20[6] == -1
      && v20[1] == 2
      && (id)v20[2] == a3
      && !(v20[4] | v20[3] | v20[5])
      && *(_OWORD *)(v20 + 7) == 0)
    {
      MTLReportFailure();
    }
  }
  v21 = &p_type[11 * a7];
  *(_BYTE *)v21 = a3 != 0;
  *((_BYTE *)v21 + 1) = 0;
  v21[1] = 2;
  v21[2] = (unint64_t)a3;
  v21[3] = 0;
  v21[4] = 0;
  v21[5] = 0;
  v21[6] = -1;
  v21[7] = 0;
  v21[8] = 0;
  *((_BYTE *)v21 + 72) = 1;
  *((float *)v21 + 19) = a4;
  *((float *)v21 + 20) = a5;
  *(_DWORD *)&self->_openGLModeEnabled |= 8u;
}

- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  const void *v10;
  NSUInteger v11;
  char *v12;
  MTLToolsDevice *device;
  NSUInteger v14;
  uint64_t v15;
  _QWORD *v16;
  const float *v17;
  const float *v18;
  _DWORD *v19;
  const void *v20;
  int v21;
  int v22;
  const void *v30;
  unint64_t v31;
  NSUInteger v34;
  MTLDebugRenderCommandEncoder *v35;
  _MTLMessageContext v36;
  _BYTE v37[128];
  uint64_t v38;

  length = a6.length;
  location = a6.location;
  v38 = *MEMORY[0x24BDAC8D0];
  memset(&v36, 0, sizeof(v36));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length > -[MTLToolsDevice maxVertexSamplers](self->super.super.super._device, "maxVertexSamplers"))
  {
    v30 = (const void *)(location + length);
    v31 = -[MTLToolsDevice maxVertexSamplers](self->super.super.super._device, "maxVertexSamplers");
    _MTLMessageContextPush_();
  }
  v34 = length;
  v35 = self;
  if (length)
  {
    v10 = 0;
    v11 = location;
    v12 = (char *)self + 88 * location;
    do
    {
      if (a3[(_QWORD)v10])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (device = v35->super.super.super._device,
              device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v10], "device", CFSTR("samplers[%lu] is not an MTLSamplerState."))))
        {
          v30 = v10;
          _MTLMessageContextPush_();
        }
      }
      if ((unint64_t)v10 + location <= 0xF)
        validateArg(MTLArgumentTypeSampler, (unint64_t)v10 + location, (MTLDebugFunctionArgument *)(v12 + 14680), &v36);
      v10 = (char *)v10 + 1;
      v12 += 88;
    }
    while ((const void *)length != v10);
    _MTLMessageContextEnd();
    v14 = length;
    v15 = (uint64_t)&v35->_attachmentInfo[1] + 88 * location;
    v16 = v37;
    v18 = a4;
    v17 = a5;
    do
    {
      objc_msgSend((id)v35->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 0, v30, v31);
      *v16 = objc_msgSend((id)*a3, "baseObject");
      v19 = (_DWORD *)(v15 + 14680);
      v20 = *a3;
      v21 = *(_DWORD *)v18;
      v22 = *(_DWORD *)v17;
      if (MTLReportFailureTypeEnabled())
      {
        if (*v19 == v22
          && *(_DWORD *)(v15 + 14676) == v21
          && *(_BYTE *)(v15 + 14672) != 0
          && *(_QWORD *)(v15 + 14648) == -1
          && *(_QWORD *)(v15 + 14608) == 2
          && *(_QWORD *)(v15 + 14616) == (_QWORD)v20
          && (*(_QWORD *)(v15 + 14632) | *(_QWORD *)(v15 + 14624) | *(_QWORD *)(v15 + 14640)) == 0
          && *(_OWORD *)(v15 + 14656) == 0)
        {
          v30 = v20;
          MTLReportFailure();
        }
      }
      *(_BYTE *)(v15 + 14600) = v20 != 0;
      *(_BYTE *)(v15 + 14601) = 0;
      *(_QWORD *)(v15 + 14608) = 2;
      *(_QWORD *)(v15 + 14616) = v20;
      *(_QWORD *)(v15 + 14624) = 0;
      *(_QWORD *)(v15 + 14632) = 0;
      *(_QWORD *)(v15 + 14640) = 0;
      *(_QWORD *)(v15 + 14648) = -1;
      *(_QWORD *)(v15 + 14656) = 0;
      *(_QWORD *)(v15 + 14664) = 0;
      v15 += 88;
      *((_BYTE *)v19 - 8) = 1;
      ++v17;
      ++v18;
      *(v19 - 1) = v21;
      *v19 = v22;
      ++v16;
      ++a3;
      --v14;
    }
    while (v14);
  }
  else
  {
    v11 = location;
    _MTLMessageContextEnd();
  }
  objc_msgSend(-[MTLToolsObject baseObject](v35, "baseObject", v30), "setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v37, a4, a5, v11, v34);
  *(_DWORD *)&v35->_openGLModeEnabled |= 8u;
}

- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unint64_t *p_type;
  unint64_t v10;
  unint64_t v11;
  _MTLMessageContext v12;

  memset(&v12, 0, sizeof(v12));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxFragmentBuffers](self->super.super.super._device, "maxFragmentBuffers") <= a5)
  {
    v10 = a5;
    v11 = -[MTLToolsDevice maxFragmentBuffers](self->super.super.super._device, "maxFragmentBuffers");
    _MTLMessageContextPush_();
  }
  if (-[MTLToolsDevice maxFragmentInlineDataSize](self->super.super.super._device, "maxFragmentInlineDataSize", v10, v11) < a4)
  {
    -[MTLToolsDevice maxFragmentInlineDataSize](self->super.super.super._device, "maxFragmentInlineDataSize");
    _MTLMessageContextPush_();
  }
  if (a5 <= 0x1E)
    validateArg(MTLArgumentTypeBuffer, a5, (MTLDebugFunctionArgument *)&self->_fragmentBuffers[a5].type, &v12);
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentBytes:length:atIndex:", a3, a4, a5);
  MTLReportFailureTypeEnabled();
  p_type = &self->_fragmentBuffers[a5].type;
  *(_BYTE *)p_type = a4 != 0;
  *((_BYTE *)p_type + 1) = 0;
  p_type[1] = 0;
  p_type[2] = 0;
  p_type[3] = 0;
  p_type[4] = a4;
  *(_OWORD *)(p_type + 5) = xmmword_22CEAB6E0;
  p_type[7] = 0;
  p_type[8] = 0;
  *((_BYTE *)p_type + 72) = 0;
  *((_DWORD *)p_type + 19) = 0;
  *((_DWORD *)p_type + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x10u;
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MTLToolsDevice *device;
  unint64_t v10;
  unint64_t *p_type;
  unint64_t *v12;
  unint64_t *v13;
  _MTLMessageContext v14;

  memset(&v14, 0, sizeof(v14));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxFragmentBuffers](self->super.super.super._device, "maxFragmentBuffers") > a5)
  {
    if (a3)
      goto LABEL_5;
LABEL_12:
    if (!a4)
      goto LABEL_13;
    goto LABEL_10;
  }
  -[MTLToolsDevice maxFragmentBuffers](self->super.super.super._device, "maxFragmentBuffers");
  _MTLMessageContextPush_();
  if (!a3)
    goto LABEL_12;
LABEL_5:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_10:
    _MTLMessageContextPush_();
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    _MTLMessageContextPush_();
  v10 = *((_QWORD *)a3 + 8);
  if (v10 <= a4)
    _MTLMessageContextPush_();
LABEL_14:
  if (a5 <= 0x1E)
    validateArg(MTLArgumentTypeBuffer, a5, (MTLDebugFunctionArgument *)&self->_fragmentBuffers[a5].type, &v14);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
  p_type = &self->_fragmentBuffers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    if (a3)
    {
      v12 = &p_type[11 * a5];
      if (!*((_BYTE *)v12 + 72)
        && v12[6] == -1
        && v12[5] == a4
        && v12[4] == v10
        && (id)v12[2] == a3
        && !(v12[3] | v12[1])
        && *(_OWORD *)(v12 + 7) == 0
        && !*(unint64_t *)((char *)v12 + 76))
      {
        MTLReportFailure();
      }
    }
  }
  v13 = &p_type[11 * a5];
  *(_BYTE *)v13 = v10 != 0;
  *((_BYTE *)v13 + 1) = 0;
  v13[1] = 0;
  v13[2] = (unint64_t)a3;
  v13[3] = 0;
  v13[4] = v10;
  v13[5] = a4;
  v13[6] = -1;
  v13[7] = 0;
  v13[8] = 0;
  *((_BYTE *)v13 + 72) = 0;
  *((_DWORD *)v13 + 19) = 0;
  *((_DWORD *)v13 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x10u;
}

- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  MTLDebugFunctionArgument *p_type;
  baseLevel *v8;
  id *p_object;
  baseLevel *object;
  unint64_t *v11;
  unint64_t *v12;
  void *v13;
  void **v14;
  void *v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t *v18;
  _MTLMessageContext v19;

  memset(&v19, 0, sizeof(v19));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxFragmentBuffers](self->super.super.super._device, "maxFragmentBuffers") <= a4)
  {
    -[MTLToolsDevice maxFragmentBuffers](self->super.super.super._device, "maxFragmentBuffers");
    _MTLMessageContextPush_();
  }
  if (a4 <= 0x1E)
  {
    p_type = (MTLDebugFunctionArgument *)&self->_fragmentBuffers[a4].type;
    validateArg(MTLArgumentTypeBuffer, a4, p_type, &v19);
    object = p_type->object;
    p_object = (id *)&p_type->object;
    v8 = object;
    if (!object)
    {
LABEL_9:
      _MTLMessageContextPush_();
      goto LABEL_10;
    }
    if (-[baseLevel length](v8, "length") <= a3)
    {
      objc_msgSend(*p_object, "length");
      goto LABEL_9;
    }
  }
LABEL_10:
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentBufferOffset:atIndex:", a3, a4);
  v11 = &self->_fragmentBuffers[0].type;
  v12 = &self->_fragmentBuffers[a4].type;
  v15 = (void *)v12[2];
  v14 = (void **)(v12 + 2);
  v13 = v15;
  v16 = objc_msgSend(v15, "length");
  if (MTLReportFailureTypeEnabled())
  {
    if (v13)
    {
      v17 = &v11[11 * a4];
      if (!*((_BYTE *)v17 + 72)
        && v17[6] == -1
        && v17[5] == a3
        && v17[4] == v16
        && *v14 == v13
        && !(v17[3] | v17[1])
        && *(_OWORD *)(v17 + 7) == 0
        && !*(unint64_t *)((char *)v17 + 76))
      {
        MTLReportFailure();
      }
    }
  }
  v18 = &v11[11 * a4];
  *(_BYTE *)v18 = v16 != 0;
  *((_BYTE *)v18 + 1) = 0;
  v18[1] = 0;
  v18[2] = (unint64_t)v13;
  v18[3] = 0;
  v18[4] = v16;
  v18[5] = a3;
  v18[6] = -1;
  v18[7] = 0;
  v18[8] = 0;
  *((_BYTE *)v18 + 72) = 0;
  *((_DWORD *)v18 + 19) = 0;
  *((_DWORD *)v18 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x10u;
}

- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  MTLDebugRenderCommandEncoder *v8;
  const void *v9;
  char *v10;
  MTLToolsDevice *device;
  uint64_t v12;
  _QWORD *v13;
  const unint64_t *v14;
  uint64_t v15;
  MTLDebugRenderCommandEncoder *v16;
  uint64_t v17;
  const void *v18;
  unint64_t v19;
  BOOL v20;
  const void *v27;
  uint64_t v28;
  const void *v29;
  uint64_t v30;
  NSUInteger v31;
  NSUInteger v32;
  _MTLMessageContext v34;
  _BYTE v35[248];
  uint64_t v36;

  length = a5.length;
  location = a5.location;
  v8 = self;
  v36 = *MEMORY[0x24BDAC8D0];
  memset(&v34, 0, sizeof(v34));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(v8->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length > -[MTLToolsDevice maxFragmentBuffers](v8->super.super.super._device, "maxFragmentBuffers"))
  {
    v27 = (const void *)(location + length);
    v28 = -[MTLToolsDevice maxFragmentBuffers](v8->super.super.super._device, "maxFragmentBuffers");
    _MTLMessageContextPush_();
  }
  v31 = length;
  if (!length)
  {
    _MTLMessageContextEnd();
    goto LABEL_52;
  }
  v9 = 0;
  v10 = (char *)v8 + 88 * location;
  do
  {
    if (!a3[(_QWORD)v9])
    {
      if (!a4[(_QWORD)v9])
        goto LABEL_17;
      v27 = v9;
      v28 = a4[(_QWORD)v9];
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v27 = v9;
      goto LABEL_16;
    }
    device = v8->super.super.super._device;
    if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v9], "device"))
    {
      v27 = v9;
      _MTLMessageContextPush_();
    }
    if (a4[(_QWORD)v9] >= *((_QWORD *)a3[(_QWORD)v9] + 8))
    {
      v29 = v9;
      v30 = *((_QWORD *)a3[(_QWORD)v9] + 8);
      v27 = v9;
      v28 = a4[(_QWORD)v9];
LABEL_16:
      _MTLMessageContextPush_();
    }
LABEL_17:
    if ((unint64_t)v9 + location <= 0x1E)
      validateArg(MTLArgumentTypeBuffer, (unint64_t)v9 + location, (MTLDebugFunctionArgument *)(v10 + 16088), &v34);
    v9 = (char *)v9 + 1;
    v10 += 88;
  }
  while ((const void *)length != v9);
  _MTLMessageContextEnd();
  v12 = (uint64_t)(&v8->super.super._commandBuffer + 11 * location);
  v32 = location;
  v13 = v35;
  v14 = a4;
  do
  {
    if (*a3)
      v15 = *((_QWORD *)*a3 + 8);
    else
      v15 = 0;
    v16 = v8;
    objc_msgSend((id)v8->_maxVertexBuffers, "addObject:retained:purgeable:", v27, v28, v29, v30);
    *v13 = objc_msgSend((id)*a3, "baseObject");
    v17 = v12 + 16088;
    v18 = *a3;
    v19 = *v14;
    if (MTLReportFailureTypeEnabled() && v18)
    {
      if (*(_BYTE *)(v12 + 16120))
        v20 = 0;
      else
        v20 = *(_QWORD *)(v12 + 16096) == -1;
      if (v20
        && *(_QWORD *)v17 == v19
        && *(_QWORD *)(v12 + 16080) == v15
        && *(_QWORD *)(v12 + 16064) == (_QWORD)v18
        && (*(_QWORD *)(v12 + 16072) | *(_QWORD *)(v12 + 16056)) == 0
        && *(_OWORD *)(v12 + 16104) == 0
        && *(_QWORD *)(v12 + 16124) == 0)
      {
        v27 = v18;
        MTLReportFailure();
      }
    }
    *(_BYTE *)(v12 + 16048) = v15 != 0;
    *(_BYTE *)(v12 + 16049) = 0;
    *(_QWORD *)(v12 + 16056) = 0;
    *(_QWORD *)(v12 + 16064) = v18;
    *(_QWORD *)(v12 + 16072) = 0;
    *(_QWORD *)(v12 + 16080) = v15;
    *(_QWORD *)v17 = v19;
    *(_QWORD *)(v12 + 16096) = -1;
    *(_QWORD *)(v12 + 16104) = 0;
    *(_QWORD *)(v12 + 16112) = 0;
    *(_BYTE *)(v12 + 16120) = 0;
    v12 += 88;
    ++v14;
    ++v13;
    ++a3;
    *(_DWORD *)(v17 + 36) = 0;
    *(_DWORD *)(v17 + 40) = 0;
    --length;
    v8 = v16;
    location = v32;
  }
  while (length);
LABEL_52:
  objc_msgSend(-[MTLToolsObject baseObject](v8, "baseObject", v27), "setFragmentBuffers:offsets:withRange:", v35, a4, location, v31);
  *(_DWORD *)&v8->_openGLModeEnabled |= 0x10u;
}

- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4
{
  MTLToolsDevice *device;
  unint64_t *p_type;
  unint64_t *v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  _MTLMessageContext v13;

  memset(&v13, 0, sizeof(v13));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxFragmentTextures](self->super.super.super._device, "maxFragmentTextures") <= a4)
  {
    v11 = a4;
    v12 = -[MTLToolsDevice maxFragmentTextures](self->super.super.super._device, "maxFragmentTextures");
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_10;
  }
  else if (!a3)
  {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    _MTLMessageContextPush_();
  if (objc_msgSend(a3, "storageMode", v11, v12) == 3)
LABEL_9:
    _MTLMessageContextPush_();
LABEL_10:
  if (a4 <= 0x7F)
    validateArg(MTLArgumentTypeTexture, a4, (MTLDebugFunctionArgument *)&self->_fragmentTextures[a4].type, &v13);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  p_type = &self->_fragmentTextures[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    v9 = &p_type[11 * a4];
    if (!*((_BYTE *)v9 + 72)
      && v9[6] == -1
      && v9[1] == 1
      && (id)v9[2] == a3
      && !(v9[4] | v9[3] | v9[5])
      && *(_OWORD *)(v9 + 7) == 0
      && !*(unint64_t *)((char *)v9 + 76))
    {
      MTLReportFailure();
    }
  }
  v10 = &p_type[11 * a4];
  *(_BYTE *)v10 = a3 != 0;
  *((_BYTE *)v10 + 1) = 0;
  v10[1] = 1;
  v10[2] = (unint64_t)a3;
  v10[3] = 0;
  v10[4] = 0;
  v10[5] = 0;
  v10[6] = -1;
  v10[7] = 0;
  v10[8] = 0;
  *((_BYTE *)v10 + 72) = 0;
  *((_DWORD *)v10 + 19) = 0;
  *((_DWORD *)v10 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x20u;
}

- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void *v8;
  char *v9;
  MTLToolsDevice *device;
  char *v11;
  _QWORD *v12;
  NSUInteger v13;
  const void *v14;
  BOOL v15;
  char *v21;
  const void *v22;
  unint64_t v23;
  _MTLMessageContext v24;
  _BYTE v25[1024];
  uint64_t v26;

  length = a4.length;
  location = a4.location;
  v26 = *MEMORY[0x24BDAC8D0];
  memset(&v24, 0, sizeof(v24));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length <= -[MTLToolsDevice maxFragmentTextures](self->super.super.super._device, "maxFragmentTextures"))
  {
    if (length)
      goto LABEL_5;
LABEL_40:
    _MTLMessageContextEnd();
    goto LABEL_41;
  }
  v22 = (const void *)(location + length);
  v23 = -[MTLToolsDevice maxFragmentTextures](self->super.super.super._device, "maxFragmentTextures");
  _MTLMessageContextPush_();
  if (!length)
    goto LABEL_40;
LABEL_5:
  v8 = 0;
  v9 = (char *)self + 88 * location;
  do
  {
    if (a3[(_QWORD)v8])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_11;
      device = self->super.super.super._device;
      if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v8], "device", CFSTR("textures[%lu] is not an MTLTexture.")))
      {
        v22 = v8;
        _MTLMessageContextPush_();
      }
      if (objc_msgSend((id)a3[(_QWORD)v8], "storageMode", v22, v23) == 3)
      {
LABEL_11:
        v22 = v8;
        _MTLMessageContextPush_();
      }
    }
    if ((unint64_t)v8 + location <= 0x7F)
      validateArg(MTLArgumentTypeTexture, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 18816), &v24);
    v8 = (char *)v8 + 1;
    v9 += 88;
  }
  while ((const void *)length != v8);
  _MTLMessageContextEnd();
  v11 = (char *)self + 88 * location;
  v12 = v25;
  v13 = length;
  do
  {
    objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 1, v22);
    *v12 = objc_msgSend((id)*a3, "baseObject");
    v14 = *a3;
    if (MTLReportFailureTypeEnabled())
    {
      if (v11[18888])
        v15 = 0;
      else
        v15 = *((_QWORD *)v11 + 2358) == -1;
      if (v15
        && *((_QWORD *)v11 + 2353) == 1
        && *((_QWORD *)v11 + 2354) == (_QWORD)v14
        && (*((_QWORD *)v11 + 2356) | *((_QWORD *)v11 + 2355) | *((_QWORD *)v11 + 2357)) == 0
        && *(_OWORD *)(v11 + 18872) == 0
        && *(_QWORD *)(v11 + 18892) == 0)
      {
        v22 = v14;
        MTLReportFailure();
      }
    }
    v21 = v11 + 18816;
    v11[18816] = v14 != 0;
    v11[18817] = 0;
    *((_QWORD *)v11 + 2353) = 1;
    *((_QWORD *)v11 + 2354) = v14;
    *((_QWORD *)v11 + 2355) = 0;
    *((_QWORD *)v11 + 2356) = 0;
    *((_QWORD *)v11 + 2357) = 0;
    *((_QWORD *)v11 + 2358) = -1;
    *((_QWORD *)v11 + 2359) = 0;
    *((_QWORD *)v11 + 2360) = 0;
    v11[18888] = 0;
    v11 += 88;
    ++v12;
    ++a3;
    *((_DWORD *)v21 + 19) = 0;
    *((_DWORD *)v21 + 20) = 0;
    --v13;
  }
  while (v13);
LABEL_41:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setFragmentTextures:withRange:", v25, location, length);
  *(_DWORD *)&self->_openGLModeEnabled |= 0x20u;
}

- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  MTLToolsDevice *device;
  unint64_t *p_type;
  unint64_t *v9;
  unint64_t *v10;
  _MTLMessageContext v11;

  memset(&v11, 0, sizeof(v11));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxFragmentSamplers](self->super.super.super._device, "maxFragmentSamplers") <= a4)
  {
    -[MTLToolsDevice maxFragmentSamplers](self->super.super.super._device, "maxFragmentSamplers");
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_8;
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)objc_msgSend(a3, "device")))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a4 <= 0xF)
    validateArg(MTLArgumentTypeSampler, a4, (MTLDebugFunctionArgument *)&self->_fragmentSamplers[a4].type, &v11);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 0);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentSamplerState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  p_type = &self->_fragmentSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    v9 = &p_type[11 * a4];
    if (!*((_BYTE *)v9 + 72)
      && v9[6] == -1
      && v9[1] == 2
      && (id)v9[2] == a3
      && !(v9[4] | v9[3] | v9[5])
      && *(_OWORD *)(v9 + 7) == 0
      && !*(unint64_t *)((char *)v9 + 76))
    {
      MTLReportFailure();
    }
  }
  v10 = &p_type[11 * a4];
  *(_BYTE *)v10 = a3 != 0;
  *((_BYTE *)v10 + 1) = 0;
  v10[1] = 2;
  v10[2] = (unint64_t)a3;
  v10[3] = 0;
  v10[4] = 0;
  v10[5] = 0;
  v10[6] = -1;
  v10[7] = 0;
  v10[8] = 0;
  *((_BYTE *)v10 + 72) = 0;
  *((_DWORD *)v10 + 19) = 0;
  *((_DWORD *)v10 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x40u;
}

- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void *v8;
  char *v9;
  MTLToolsDevice *device;
  char *v11;
  _QWORD *v12;
  NSUInteger v13;
  const void *v14;
  BOOL v15;
  char *v21;
  const void *v22;
  unint64_t v23;
  _MTLMessageContext v24;
  _BYTE v25[128];
  uint64_t v26;

  length = a4.length;
  location = a4.location;
  v26 = *MEMORY[0x24BDAC8D0];
  memset(&v24, 0, sizeof(v24));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length <= -[MTLToolsDevice maxFragmentSamplers](self->super.super.super._device, "maxFragmentSamplers"))
  {
    if (length)
      goto LABEL_5;
LABEL_38:
    _MTLMessageContextEnd();
    goto LABEL_39;
  }
  v22 = (const void *)(location + length);
  v23 = -[MTLToolsDevice maxFragmentSamplers](self->super.super.super._device, "maxFragmentSamplers");
  _MTLMessageContextPush_();
  if (!length)
    goto LABEL_38;
LABEL_5:
  v8 = 0;
  v9 = (char *)self + 88 * location;
  do
  {
    if (a3[(_QWORD)v8])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (device = self->super.super.super._device,
            device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v8], "device", CFSTR("samplers[%lu] is not an MTLSamplerState."))))
      {
        v22 = v8;
        _MTLMessageContextPush_();
      }
    }
    if ((unint64_t)v8 + location <= 0xF)
      validateArg(MTLArgumentTypeSampler, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 30080), &v24);
    v8 = (char *)v8 + 1;
    v9 += 88;
  }
  while ((const void *)length != v8);
  _MTLMessageContextEnd();
  v11 = (char *)self + 88 * location;
  v12 = v25;
  v13 = length;
  do
  {
    objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 0, v22, v23);
    *v12 = objc_msgSend((id)*a3, "baseObject");
    v14 = *a3;
    if (MTLReportFailureTypeEnabled())
    {
      if (v11[30152])
        v15 = 0;
      else
        v15 = *((_QWORD *)v11 + 3766) == -1;
      if (v15
        && *((_QWORD *)v11 + 3761) == 2
        && *((_QWORD *)v11 + 3762) == (_QWORD)v14
        && (*((_QWORD *)v11 + 3764) | *((_QWORD *)v11 + 3763) | *((_QWORD *)v11 + 3765)) == 0
        && *(_OWORD *)(v11 + 30136) == 0
        && *(_QWORD *)(v11 + 30156) == 0)
      {
        v22 = v14;
        MTLReportFailure();
      }
    }
    v21 = v11 + 30080;
    v11[30080] = v14 != 0;
    v11[30081] = 0;
    *((_QWORD *)v11 + 3761) = 2;
    *((_QWORD *)v11 + 3762) = v14;
    *((_QWORD *)v11 + 3763) = 0;
    *((_QWORD *)v11 + 3764) = 0;
    *((_QWORD *)v11 + 3765) = 0;
    *((_QWORD *)v11 + 3766) = -1;
    *((_QWORD *)v11 + 3767) = 0;
    *((_QWORD *)v11 + 3768) = 0;
    v11[30152] = 0;
    v11 += 88;
    ++v12;
    ++a3;
    *((_DWORD *)v21 + 19) = 0;
    *((_DWORD *)v21 + 20) = 0;
    --v13;
  }
  while (v13);
LABEL_39:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setFragmentSamplerStates:withRange:", v25, location, length);
  *(_DWORD *)&self->_openGLModeEnabled |= 0x40u;
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  MTLToolsDevice *device;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  unint64_t *p_type;
  unint64_t *v17;
  unint64_t *v18;
  _MTLMessageContext v19;

  memset(&v19, 0, sizeof(v19));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxFragmentSamplers](self->super.super.super._device, "maxFragmentSamplers") <= a6)
  {
    -[MTLToolsDevice maxFragmentSamplers](self->super.super.super._device, "maxFragmentSamplers");
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_8;
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)objc_msgSend(a3, "device")))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a6 <= 0xF)
    validateArg(MTLArgumentTypeSampler, a6, (MTLDebugFunctionArgument *)&self->_fragmentSamplers[a6].type, &v19);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 0);
  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  v13 = objc_msgSend(a3, "baseObject");
  *(float *)&v14 = a4;
  *(float *)&v15 = a5;
  objc_msgSend(v12, "setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:", v13, a6, v14, v15);
  p_type = &self->_fragmentSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    v17 = &p_type[11 * a6];
    if (*((_DWORD *)v17 + 20) == LODWORD(a5)
      && *((_DWORD *)v17 + 19) == LODWORD(a4)
      && *((_BYTE *)v17 + 72)
      && v17[6] == -1
      && v17[1] == 2
      && (id)v17[2] == a3
      && !(v17[4] | v17[3] | v17[5])
      && *(_OWORD *)(v17 + 7) == 0)
    {
      MTLReportFailure();
    }
  }
  v18 = &p_type[11 * a6];
  *(_BYTE *)v18 = a3 != 0;
  *((_BYTE *)v18 + 1) = 0;
  v18[1] = 2;
  v18[2] = (unint64_t)a3;
  v18[3] = 0;
  v18[4] = 0;
  v18[5] = 0;
  v18[6] = -1;
  v18[7] = 0;
  v18[8] = 0;
  *((_BYTE *)v18 + 72) = 1;
  *((float *)v18 + 19) = a4;
  *((float *)v18 + 20) = a5;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x40u;
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 lodBias:(float)a6 atIndex:(unint64_t)a7
{
  MTLToolsDevice *device;
  id v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  unint64_t *p_type;
  unint64_t *v20;
  unint64_t *v21;
  _MTLMessageContext v22;

  memset(&v22, 0, sizeof(v22));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxFragmentSamplers](self->super.super.super._device, "maxFragmentSamplers") <= a7)
  {
    -[MTLToolsDevice maxFragmentSamplers](self->super.super.super._device, "maxFragmentSamplers");
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_8;
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)objc_msgSend(a3, "device")))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a7 <= 0xF)
    validateArg(MTLArgumentTypeSampler, a7, (MTLDebugFunctionArgument *)&self->_fragmentSamplers[a7].type, &v22);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 0);
  v14 = -[MTLToolsObject baseObject](self, "baseObject");
  v15 = objc_msgSend(a3, "baseObject");
  *(float *)&v16 = a4;
  *(float *)&v17 = a5;
  *(float *)&v18 = a6;
  objc_msgSend(v14, "setFragmentSamplerState:lodMinClamp:lodMaxClamp:lodBias:atIndex:", v15, a7, v16, v17, v18);
  p_type = &self->_fragmentSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    v20 = &p_type[11 * a7];
    if (*((_DWORD *)v20 + 20) == LODWORD(a5)
      && *((_DWORD *)v20 + 19) == LODWORD(a4)
      && *((_BYTE *)v20 + 72)
      && v20[6] == -1
      && v20[1] == 2
      && (id)v20[2] == a3
      && !(v20[4] | v20[3] | v20[5])
      && *(_OWORD *)(v20 + 7) == 0)
    {
      MTLReportFailure();
    }
  }
  v21 = &p_type[11 * a7];
  *(_BYTE *)v21 = a3 != 0;
  *((_BYTE *)v21 + 1) = 0;
  v21[1] = 2;
  v21[2] = (unint64_t)a3;
  v21[3] = 0;
  v21[4] = 0;
  v21[5] = 0;
  v21[6] = -1;
  v21[7] = 0;
  v21[8] = 0;
  *((_BYTE *)v21 + 72) = 1;
  *((float *)v21 + 19) = a4;
  *((float *)v21 + 20) = a5;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x40u;
}

- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  const void *v10;
  NSUInteger v11;
  char *v12;
  MTLToolsDevice *device;
  NSUInteger v14;
  uint64_t v15;
  _QWORD *v16;
  const float *v17;
  const float *v18;
  _DWORD *v19;
  const void *v20;
  int v21;
  int v22;
  const void *v30;
  unint64_t v31;
  NSUInteger v34;
  MTLDebugRenderCommandEncoder *v35;
  _MTLMessageContext v36;
  _BYTE v37[128];
  uint64_t v38;

  length = a6.length;
  location = a6.location;
  v38 = *MEMORY[0x24BDAC8D0];
  memset(&v36, 0, sizeof(v36));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length > -[MTLToolsDevice maxFragmentSamplers](self->super.super.super._device, "maxFragmentSamplers"))
  {
    v30 = (const void *)(location + length);
    v31 = -[MTLToolsDevice maxFragmentSamplers](self->super.super.super._device, "maxFragmentSamplers");
    _MTLMessageContextPush_();
  }
  v34 = length;
  v35 = self;
  if (length)
  {
    v10 = 0;
    v11 = location;
    v12 = (char *)self + 88 * location;
    do
    {
      if (a3[(_QWORD)v10])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (device = v35->super.super.super._device,
              device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v10], "device", CFSTR("samplers[%lu] is not an MTLSamplerState."))))
        {
          v30 = v10;
          _MTLMessageContextPush_();
        }
      }
      if ((unint64_t)v10 + location <= 0xF)
        validateArg(MTLArgumentTypeSampler, (unint64_t)v10 + location, (MTLDebugFunctionArgument *)(v12 + 30080), &v36);
      v10 = (char *)v10 + 1;
      v12 += 88;
    }
    while ((const void *)length != v10);
    _MTLMessageContextEnd();
    v14 = length;
    v15 = (uint64_t)&v35->_attachmentInfo[1] + 88 * location;
    v16 = v37;
    v18 = a4;
    v17 = a5;
    do
    {
      objc_msgSend((id)v35->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 0, v30, v31);
      *v16 = objc_msgSend((id)*a3, "baseObject");
      v19 = (_DWORD *)(v15 + 30080);
      v20 = *a3;
      v21 = *(_DWORD *)v18;
      v22 = *(_DWORD *)v17;
      if (MTLReportFailureTypeEnabled())
      {
        if (*v19 == v22
          && *(_DWORD *)(v15 + 30076) == v21
          && *(_BYTE *)(v15 + 30072) != 0
          && *(_QWORD *)(v15 + 30048) == -1
          && *(_QWORD *)(v15 + 30008) == 2
          && *(_QWORD *)(v15 + 30016) == (_QWORD)v20
          && (*(_QWORD *)(v15 + 30032) | *(_QWORD *)(v15 + 30024) | *(_QWORD *)(v15 + 30040)) == 0
          && *(_OWORD *)(v15 + 30056) == 0)
        {
          v30 = v20;
          MTLReportFailure();
        }
      }
      *(_BYTE *)(v15 + 30000) = v20 != 0;
      *(_BYTE *)(v15 + 30001) = 0;
      *(_QWORD *)(v15 + 30008) = 2;
      *(_QWORD *)(v15 + 30016) = v20;
      *(_QWORD *)(v15 + 30024) = 0;
      *(_QWORD *)(v15 + 30032) = 0;
      *(_QWORD *)(v15 + 30040) = 0;
      *(_QWORD *)(v15 + 30048) = -1;
      *(_QWORD *)(v15 + 30056) = 0;
      *(_QWORD *)(v15 + 30064) = 0;
      v15 += 88;
      *((_BYTE *)v19 - 8) = 1;
      ++v17;
      ++v18;
      *(v19 - 1) = v21;
      *v19 = v22;
      ++v16;
      ++a3;
      --v14;
    }
    while (v14);
  }
  else
  {
    v11 = location;
    _MTLMessageContextEnd();
  }
  objc_msgSend(-[MTLToolsObject baseObject](v35, "baseObject", v30), "setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v37, a4, a5, v11, v34);
  *(_DWORD *)&v35->_openGLModeEnabled |= 0x40u;
}

- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6
{
  MTLToolsDevice *device;
  MTLToolsDevice *v12;
  unint64_t *p_type;
  unint64_t *v14;
  unint64_t *v15;
  unint64_t *v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  _MTLMessageContext v20;

  memset(&v20, 0, sizeof(v20));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxFragmentTextures](self->super.super.super._device, "maxFragmentTextures") <= a4)
  {
    v18 = a4;
    v19 = -[MTLToolsDevice maxFragmentTextures](self->super.super.super._device, "maxFragmentTextures");
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_10;
  }
  else if (!a3)
  {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    _MTLMessageContextPush_();
  if (objc_msgSend(a3, "storageMode", v18, v19) == 3)
LABEL_9:
    _MTLMessageContextPush_();
LABEL_10:
  if (-[MTLToolsDevice maxFragmentSamplers](self->super.super.super._device, "maxFragmentSamplers", v18) <= a6)
  {
    -[MTLToolsDevice maxFragmentSamplers](self->super.super.super._device, "maxFragmentSamplers");
    _MTLMessageContextPush_();
    if (!a5)
      goto LABEL_15;
  }
  else if (!a5)
  {
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v12 = self->super.super.super._device, v12 != (MTLToolsDevice *)objc_msgSend(a5, "device")))
  {
    _MTLMessageContextPush_();
  }
LABEL_15:
  if (a4 <= 0x7F)
    validateArg(MTLArgumentTypeTexture, a4, (MTLDebugFunctionArgument *)&self->_fragmentTextures[a4].type, &v20);
  if (a6 <= 0xF)
    validateArg(MTLArgumentTypeSampler, a6, (MTLDebugFunctionArgument *)&self->_fragmentSamplers[a6].type, &v20);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a5, 1, 0);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentTexture:atTextureIndex:samplerState:atSamplerIndex:", objc_msgSend(a3, "baseObject"), a4, objc_msgSend(a5, "baseObject"), a6);
  p_type = &self->_fragmentTextures[a4].type;
  if (MTLReportFailureTypeEnabled())
  {
    v14 = &self->_fragmentTextures[a4].type;
    if (!*((_BYTE *)v14 + 72)
      && v14[6] == -1
      && v14[1] == 1
      && (id)v14[2] == a3
      && !(v14[4] | v14[3] | v14[5])
      && *(_OWORD *)(v14 + 7) == 0
      && !*(unint64_t *)((char *)v14 + 76))
    {
      MTLReportFailure();
    }
  }
  *(_BYTE *)p_type = a3 != 0;
  *((_BYTE *)p_type + 1) = 0;
  p_type[1] = 1;
  p_type[2] = (unint64_t)a3;
  p_type[3] = 0;
  p_type[4] = 0;
  p_type[5] = 0;
  p_type[6] = -1;
  p_type[7] = 0;
  p_type[8] = 0;
  *((_BYTE *)p_type + 72) = 0;
  *((_DWORD *)p_type + 19) = 0;
  *((_DWORD *)p_type + 20) = 0;
  v15 = &self->_fragmentSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    v16 = &v15[11 * a6];
    if (!*((_BYTE *)v16 + 72)
      && v16[6] == -1
      && v16[1] == 2
      && (id)v16[2] == a5
      && !(v16[4] | v16[3] | v16[5])
      && *(_OWORD *)(v16 + 7) == 0
      && !*(unint64_t *)((char *)v16 + 76))
    {
      MTLReportFailure();
    }
  }
  v17 = &v15[11 * a6];
  *(_BYTE *)v17 = a5 != 0;
  *((_BYTE *)v17 + 1) = 0;
  v17[1] = 2;
  v17[2] = (unint64_t)a5;
  v17[3] = 0;
  v17[4] = 0;
  v17[5] = 0;
  v17[6] = -1;
  v17[7] = 0;
  v17[8] = 0;
  *((_BYTE *)v17 + 72) = 0;
  *((_DWORD *)v17 + 19) = 0;
  *((_DWORD *)v17 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x20u;
}

- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unint64_t *p_type;
  unint64_t v10;
  unint64_t v11;
  _MTLMessageContext v12;

  memset(&v12, 0, sizeof(v12));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxTileBuffers](self->super.super.super._device, "maxTileBuffers") <= a5)
  {
    v10 = a5;
    v11 = -[MTLToolsDevice maxTileBuffers](self->super.super.super._device, "maxTileBuffers");
    _MTLMessageContextPush_();
  }
  if (-[MTLToolsDevice maxTileInlineDataSize](self->super.super.super._device, "maxTileInlineDataSize", v10, v11) < a4)
  {
    -[MTLToolsDevice maxTileInlineDataSize](self->super.super.super._device, "maxTileInlineDataSize");
    _MTLMessageContextPush_();
  }
  if (a5 <= 0x1E)
    validateArg(MTLArgumentTypeBuffer, a5, (MTLDebugFunctionArgument *)&self->_tileBuffers[a5].type, &v12);
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileBytes:length:atIndex:", a3, a4, a5);
  MTLReportFailureTypeEnabled();
  p_type = &self->_tileBuffers[a5].type;
  *(_BYTE *)p_type = a4 != 0;
  *((_BYTE *)p_type + 1) = 0;
  p_type[1] = 0;
  p_type[2] = 0;
  p_type[3] = 0;
  p_type[4] = a4;
  *(_OWORD *)(p_type + 5) = xmmword_22CEAB6E0;
  p_type[7] = 0;
  p_type[8] = 0;
  *((_BYTE *)p_type + 72) = 0;
  *((_DWORD *)p_type + 19) = 0;
  *((_DWORD *)p_type + 20) = 0;
}

- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MTLToolsDevice *device;
  unint64_t *p_type;
  uint64_t v11;
  unint64_t *v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  _MTLMessageContext v16;

  memset(&v16, 0, sizeof(v16));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxTileBuffers](self->super.super.super._device, "maxTileBuffers") <= a5)
  {
    v14 = a5;
    v15 = -[MTLToolsDevice maxTileBuffers](self->super.super.super._device, "maxTileBuffers");
    _MTLMessageContextPush_();
    if (a3)
      goto LABEL_5;
LABEL_12:
    if (a4)
      goto LABEL_10;
    goto LABEL_13;
  }
  if (!a3)
    goto LABEL_12;
LABEL_5:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_10:
    _MTLMessageContextPush_();
    goto LABEL_13;
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    _MTLMessageContextPush_();
  if (objc_msgSend(a3, "length", v14, v15) <= a4)
  {
    objc_msgSend(a3, "length");
    goto LABEL_10;
  }
LABEL_13:
  if (a5 <= 0x1E)
    validateArg(MTLArgumentTypeBuffer, a5, (MTLDebugFunctionArgument *)&self->_tileBuffers[a5].type, &v16);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
  p_type = &self->_tileBuffers[0].type;
  v11 = objc_msgSend(a3, "length");
  if (MTLReportFailureTypeEnabled())
  {
    if (a3)
    {
      v12 = &p_type[11 * a5];
      if (!*((_BYTE *)v12 + 72)
        && v12[6] == -1
        && v12[5] == a4
        && v12[4] == v11
        && (id)v12[2] == a3
        && !(v12[3] | v12[1])
        && *(_OWORD *)(v12 + 7) == 0
        && !*(unint64_t *)((char *)v12 + 76))
      {
        MTLReportFailure();
      }
    }
  }
  v13 = &p_type[11 * a5];
  *(_BYTE *)v13 = v11 != 0;
  *((_BYTE *)v13 + 1) = 0;
  v13[1] = 0;
  v13[2] = (unint64_t)a3;
  v13[3] = 0;
  v13[4] = v11;
  v13[5] = a4;
  v13[6] = -1;
  v13[7] = 0;
  v13[8] = 0;
  *((_BYTE *)v13 + 72) = 0;
  *((_DWORD *)v13 + 19) = 0;
  *((_DWORD *)v13 + 20) = 0;
}

- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  MTLDebugFunctionArgument *p_type;
  baseLevel *v8;
  id *p_object;
  baseLevel *object;
  unint64_t *v11;
  unint64_t *v12;
  void *v13;
  void **v14;
  void *v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t *v18;
  _MTLMessageContext v19;

  memset(&v19, 0, sizeof(v19));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxTileBuffers](self->super.super.super._device, "maxTileBuffers") <= a4)
  {
    -[MTLToolsDevice maxTileBuffers](self->super.super.super._device, "maxTileBuffers");
    _MTLMessageContextPush_();
  }
  if (a4 <= 0x1E)
  {
    p_type = (MTLDebugFunctionArgument *)&self->_tileBuffers[a4].type;
    validateArg(MTLArgumentTypeBuffer, a4, p_type, &v19);
    object = p_type->object;
    p_object = (id *)&p_type->object;
    v8 = object;
    if (!object)
    {
LABEL_9:
      _MTLMessageContextPush_();
      goto LABEL_10;
    }
    if (-[baseLevel length](v8, "length") <= a3)
    {
      objc_msgSend(*p_object, "length");
      goto LABEL_9;
    }
  }
LABEL_10:
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileBufferOffset:atIndex:", a3, a4);
  v11 = &self->_tileBuffers[0].type;
  v12 = &self->_tileBuffers[a4].type;
  v15 = (void *)v12[2];
  v14 = (void **)(v12 + 2);
  v13 = v15;
  v16 = objc_msgSend(v15, "length");
  if (MTLReportFailureTypeEnabled())
  {
    if (v13)
    {
      v17 = &v11[11 * a4];
      if (!*((_BYTE *)v17 + 72)
        && v17[6] == -1
        && v17[5] == a3
        && v17[4] == v16
        && *v14 == v13
        && !(v17[3] | v17[1])
        && *(_OWORD *)(v17 + 7) == 0
        && !*(unint64_t *)((char *)v17 + 76))
      {
        MTLReportFailure();
      }
    }
  }
  v18 = &v11[11 * a4];
  *(_BYTE *)v18 = v16 != 0;
  *((_BYTE *)v18 + 1) = 0;
  v18[1] = 0;
  v18[2] = (unint64_t)v13;
  v18[3] = 0;
  v18[4] = v16;
  v18[5] = a3;
  v18[6] = -1;
  v18[7] = 0;
  v18[8] = 0;
  *((_BYTE *)v18 + 72) = 0;
  *((_DWORD *)v18 + 19) = 0;
  *((_DWORD *)v18 + 20) = 0;
}

- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  MTLDebugRenderCommandEncoder *v9;
  const void *v10;
  char *v11;
  MTLToolsDevice *device;
  unint64_t v13;
  unint64_t v14;
  const unint64_t *v15;
  uint64_t v16;
  _QWORD *v17;
  NSUInteger v18;
  uint64_t v19;
  const void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  const void *v31;
  uint64_t v32;
  const void *v33;
  uint64_t v34;
  const unint64_t *v35;
  NSUInteger v36;
  NSUInteger v37;
  MTLDebugRenderCommandEncoder *v38;
  _MTLMessageContext v39;
  _BYTE v40[248];
  uint64_t v41;

  length = a5.length;
  location = a5.location;
  v9 = self;
  v41 = *MEMORY[0x24BDAC8D0];
  memset(&v39, 0, sizeof(v39));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(v9->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length > -[MTLToolsDevice maxTileBuffers](v9->super.super.super._device, "maxTileBuffers"))
  {
    v31 = (const void *)(location + length);
    v32 = -[MTLToolsDevice maxTileBuffers](v9->super.super.super._device, "maxTileBuffers");
    _MTLMessageContextPush_();
  }
  v36 = location;
  v37 = length;
  v35 = a4;
  if (!length)
  {
    _MTLMessageContextEnd();
    goto LABEL_49;
  }
  v10 = 0;
  v38 = v9;
  v11 = (char *)v9 + 88 * location;
  do
  {
    if (!a3[(_QWORD)v10])
    {
      if (!a4[(_QWORD)v10])
        goto LABEL_17;
      v31 = v10;
      v32 = a4[(_QWORD)v10];
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v31 = v10;
      goto LABEL_16;
    }
    device = v38->super.super.super._device;
    if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v10], "device"))
    {
      v31 = v10;
      _MTLMessageContextPush_();
    }
    v13 = a4[(_QWORD)v10];
    if (v13 >= objc_msgSend((id)a3[(_QWORD)v10], "length", v31, v32, v33, v34))
    {
      v14 = a4[(_QWORD)v10];
      v33 = v10;
      v34 = objc_msgSend((id)a3[(_QWORD)v10], "length");
      v31 = v10;
      v32 = v14;
LABEL_16:
      _MTLMessageContextPush_();
    }
LABEL_17:
    if ((unint64_t)v10 + location <= 0x1E)
      validateArg(MTLArgumentTypeBuffer, (unint64_t)v10 + location, (MTLDebugFunctionArgument *)(v11 + 31488), &v39);
    v10 = (char *)v10 + 1;
    v11 += 88;
  }
  while ((const void *)length != v10);
  _MTLMessageContextEnd();
  v9 = v38;
  v15 = a4;
  v16 = (uint64_t)(&v38->super.super._commandBuffer + 11 * v36);
  v17 = v40;
  v18 = length;
  do
  {
    objc_msgSend((id)v9->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 1, v31);
    *v17 = objc_msgSend((id)*a3, "baseObject");
    v19 = v16 + 31488;
    v20 = *a3;
    v21 = objc_msgSend((id)*a3, "length");
    v23 = *v15++;
    v22 = v23;
    if (MTLReportFailureTypeEnabled() && v20)
    {
      if (*(_BYTE *)(v16 + 31520))
        v24 = 0;
      else
        v24 = *(_QWORD *)(v16 + 31496) == -1;
      if (v24
        && *(_QWORD *)v19 == v22
        && *(_QWORD *)(v16 + 31480) == v21
        && *(_QWORD *)(v16 + 31464) == (_QWORD)v20
        && (*(_QWORD *)(v16 + 31472) | *(_QWORD *)(v16 + 31456)) == 0
        && *(_OWORD *)(v16 + 31504) == 0
        && *(_QWORD *)(v16 + 31524) == 0)
      {
        v31 = v20;
        MTLReportFailure();
      }
    }
    *(_BYTE *)(v16 + 31448) = v21 != 0;
    *(_BYTE *)(v16 + 31449) = 0;
    *(_QWORD *)(v16 + 31456) = 0;
    *(_QWORD *)(v16 + 31464) = v20;
    *(_QWORD *)(v16 + 31472) = 0;
    *(_QWORD *)(v16 + 31480) = v21;
    *(_QWORD *)v19 = v22;
    *(_QWORD *)(v16 + 31496) = -1;
    *(_QWORD *)(v16 + 31504) = 0;
    *(_QWORD *)(v16 + 31512) = 0;
    *(_BYTE *)(v16 + 31520) = 0;
    v16 += 88;
    ++v17;
    ++a3;
    *(_DWORD *)(v19 + 36) = 0;
    *(_DWORD *)(v19 + 40) = 0;
    --v18;
    v9 = v38;
  }
  while (v18);
LABEL_49:
  objc_msgSend(-[MTLToolsObject baseObject](v9, "baseObject", v31), "setTileBuffers:offsets:withRange:", v40, v35, v36, v37);
}

- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4
{
  MTLToolsDevice *device;
  unint64_t *p_type;
  unint64_t *v9;
  unint64_t *v10;
  _MTLMessageContext v11;

  memset(&v11, 0, sizeof(v11));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxTileTextures](self->super.super.super._device, "maxTileTextures") <= a4)
  {
    -[MTLToolsDevice maxTileTextures](self->super.super.super._device, "maxTileTextures");
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_8;
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)objc_msgSend(a3, "device")))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a4 <= 0x7F)
    validateArg(MTLArgumentTypeTexture, a4, (MTLDebugFunctionArgument *)&self->_tileTextures[a4].type, &v11);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  p_type = &self->_tileTextures[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    v9 = &p_type[11 * a4];
    if (!*((_BYTE *)v9 + 72)
      && v9[6] == -1
      && v9[1] == 1
      && (id)v9[2] == a3
      && !(v9[4] | v9[3] | v9[5])
      && *(_OWORD *)(v9 + 7) == 0
      && !*(unint64_t *)((char *)v9 + 76))
    {
      MTLReportFailure();
    }
  }
  v10 = &p_type[11 * a4];
  *(_BYTE *)v10 = a3 != 0;
  *((_BYTE *)v10 + 1) = 0;
  v10[1] = 1;
  v10[2] = (unint64_t)a3;
  v10[3] = 0;
  v10[4] = 0;
  v10[5] = 0;
  v10[6] = -1;
  v10[7] = 0;
  v10[8] = 0;
  *((_BYTE *)v10 + 72) = 0;
  *((_DWORD *)v10 + 19) = 0;
  *((_DWORD *)v10 + 20) = 0;
}

- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void *v8;
  char *v9;
  MTLToolsDevice *device;
  char *v11;
  _QWORD *v12;
  NSUInteger v13;
  const void *v14;
  BOOL v15;
  char *v21;
  const void *v22;
  unint64_t v23;
  _MTLMessageContext v24;
  _BYTE v25[1024];
  uint64_t v26;

  length = a4.length;
  location = a4.location;
  v26 = *MEMORY[0x24BDAC8D0];
  memset(&v24, 0, sizeof(v24));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length <= -[MTLToolsDevice maxTileTextures](self->super.super.super._device, "maxTileTextures"))
  {
    if (length)
      goto LABEL_5;
LABEL_38:
    _MTLMessageContextEnd();
    goto LABEL_39;
  }
  v22 = (const void *)(location + length);
  v23 = -[MTLToolsDevice maxTileTextures](self->super.super.super._device, "maxTileTextures");
  _MTLMessageContextPush_();
  if (!length)
    goto LABEL_38;
LABEL_5:
  v8 = 0;
  v9 = (char *)self + 88 * location;
  do
  {
    if (a3[(_QWORD)v8])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (device = self->super.super.super._device,
            device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v8], "device", CFSTR("textures[%lu] is not an MTLTexture."))))
      {
        v22 = v8;
        _MTLMessageContextPush_();
      }
    }
    if ((unint64_t)v8 + location <= 0x7F)
      validateArg(MTLArgumentTypeTexture, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 34216), &v24);
    v8 = (char *)v8 + 1;
    v9 += 88;
  }
  while ((const void *)length != v8);
  _MTLMessageContextEnd();
  v11 = (char *)self + 88 * location;
  v12 = v25;
  v13 = length;
  do
  {
    objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 1, v22, v23);
    *v12 = objc_msgSend((id)*a3, "baseObject");
    v14 = *a3;
    if (MTLReportFailureTypeEnabled())
    {
      if (v11[34288])
        v15 = 0;
      else
        v15 = *((_QWORD *)v11 + 4283) == -1;
      if (v15
        && *((_QWORD *)v11 + 4278) == 1
        && *((_QWORD *)v11 + 4279) == (_QWORD)v14
        && (*((_QWORD *)v11 + 4281) | *((_QWORD *)v11 + 4280) | *((_QWORD *)v11 + 4282)) == 0
        && *((_OWORD *)v11 + 2142) == 0
        && *(_QWORD *)(v11 + 34292) == 0)
      {
        v22 = v14;
        MTLReportFailure();
      }
    }
    v21 = v11 + 34216;
    v11[34216] = v14 != 0;
    v11[34217] = 0;
    *((_QWORD *)v11 + 4278) = 1;
    *((_QWORD *)v11 + 4279) = v14;
    *((_QWORD *)v11 + 4280) = 0;
    *((_QWORD *)v11 + 4281) = 0;
    *((_QWORD *)v11 + 4282) = 0;
    *((_QWORD *)v11 + 4283) = -1;
    *((_QWORD *)v11 + 4284) = 0;
    *((_QWORD *)v11 + 4285) = 0;
    v11[34288] = 0;
    v11 += 88;
    ++v12;
    ++a3;
    *((_DWORD *)v21 + 19) = 0;
    *((_DWORD *)v21 + 20) = 0;
    --v13;
  }
  while (v13);
LABEL_39:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setTileTextures:withRange:", v25, location, length);
}

- (void)setTileSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  MTLToolsDevice *device;
  unint64_t *p_type;
  unint64_t *v9;
  unint64_t *v10;
  _MTLMessageContext v11;

  memset(&v11, 0, sizeof(v11));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxTileSamplers](self->super.super.super._device, "maxTileSamplers") <= a4)
  {
    -[MTLToolsDevice maxTileSamplers](self->super.super.super._device, "maxTileSamplers");
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_8;
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)objc_msgSend(a3, "device")))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a4 <= 0xF)
    validateArg(MTLArgumentTypeSampler, a4, (MTLDebugFunctionArgument *)&self->_tileSamplers[a4].type, &v11);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 0);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileSamplerState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  p_type = &self->_tileSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    v9 = &p_type[11 * a4];
    if (!*((_BYTE *)v9 + 72)
      && v9[6] == -1
      && v9[1] == 2
      && (id)v9[2] == a3
      && !(v9[4] | v9[3] | v9[5])
      && *(_OWORD *)(v9 + 7) == 0
      && !*(unint64_t *)((char *)v9 + 76))
    {
      MTLReportFailure();
    }
  }
  v10 = &p_type[11 * a4];
  *(_BYTE *)v10 = a3 != 0;
  *((_BYTE *)v10 + 1) = 0;
  v10[1] = 2;
  v10[2] = (unint64_t)a3;
  v10[3] = 0;
  v10[4] = 0;
  v10[5] = 0;
  v10[6] = -1;
  v10[7] = 0;
  v10[8] = 0;
  *((_BYTE *)v10 + 72) = 0;
  *((_DWORD *)v10 + 19) = 0;
  *((_DWORD *)v10 + 20) = 0;
}

- (void)setTileSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void *v8;
  char *v9;
  MTLToolsDevice *device;
  char *v11;
  _QWORD *v12;
  NSUInteger v13;
  const void *v14;
  BOOL v15;
  char *v21;
  const void *v22;
  unint64_t v23;
  _MTLMessageContext v24;
  _BYTE v25[128];
  uint64_t v26;

  length = a4.length;
  location = a4.location;
  v26 = *MEMORY[0x24BDAC8D0];
  memset(&v24, 0, sizeof(v24));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length <= -[MTLToolsDevice maxTileSamplers](self->super.super.super._device, "maxTileSamplers"))
  {
    if (length)
      goto LABEL_5;
LABEL_38:
    _MTLMessageContextEnd();
    goto LABEL_39;
  }
  v22 = (const void *)(location + length);
  v23 = -[MTLToolsDevice maxTileSamplers](self->super.super.super._device, "maxTileSamplers");
  _MTLMessageContextPush_();
  if (!length)
    goto LABEL_38;
LABEL_5:
  v8 = 0;
  v9 = (char *)self + 88 * location;
  do
  {
    if (a3[(_QWORD)v8])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (device = self->super.super.super._device,
            device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v8], "device", CFSTR("samplers[%lu] is not an MTLSamplerState."))))
      {
        v22 = v8;
        _MTLMessageContextPush_();
      }
    }
    if ((unint64_t)v8 + location <= 0xF)
      validateArg(MTLArgumentTypeSampler, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 45480), &v24);
    v8 = (char *)v8 + 1;
    v9 += 88;
  }
  while ((const void *)length != v8);
  _MTLMessageContextEnd();
  v11 = (char *)self + 88 * location;
  v12 = v25;
  v13 = length;
  do
  {
    objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 0, v22, v23);
    *v12 = objc_msgSend((id)*a3, "baseObject");
    v14 = *a3;
    if (MTLReportFailureTypeEnabled())
    {
      if (v11[45552])
        v15 = 0;
      else
        v15 = *((_QWORD *)v11 + 5691) == -1;
      if (v15
        && *((_QWORD *)v11 + 5686) == 2
        && *((_QWORD *)v11 + 5687) == (_QWORD)v14
        && (*((_QWORD *)v11 + 5689) | *((_QWORD *)v11 + 5688) | *((_QWORD *)v11 + 5690)) == 0
        && *((_OWORD *)v11 + 2846) == 0
        && *(_QWORD *)(v11 + 45556) == 0)
      {
        v22 = v14;
        MTLReportFailure();
      }
    }
    v21 = v11 + 45480;
    v11[45480] = v14 != 0;
    v11[45481] = 0;
    *((_QWORD *)v11 + 5686) = 2;
    *((_QWORD *)v11 + 5687) = v14;
    *((_QWORD *)v11 + 5688) = 0;
    *((_QWORD *)v11 + 5689) = 0;
    *((_QWORD *)v11 + 5690) = 0;
    *((_QWORD *)v11 + 5691) = -1;
    *((_QWORD *)v11 + 5692) = 0;
    *((_QWORD *)v11 + 5693) = 0;
    v11[45552] = 0;
    v11 += 88;
    ++v12;
    ++a3;
    *((_DWORD *)v21 + 19) = 0;
    *((_DWORD *)v21 + 20) = 0;
    --v13;
  }
  while (v13);
LABEL_39:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setTileSamplerStates:withRange:", v25, location, length);
}

- (void)setTileSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  MTLToolsDevice *device;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  unint64_t *p_type;
  unint64_t *v17;
  unint64_t *v18;
  _MTLMessageContext v19;

  memset(&v19, 0, sizeof(v19));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxTileSamplers](self->super.super.super._device, "maxTileSamplers") <= a6)
  {
    -[MTLToolsDevice maxTileSamplers](self->super.super.super._device, "maxTileSamplers");
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_8;
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)objc_msgSend(a3, "device")))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a6 <= 0xF)
    validateArg(MTLArgumentTypeSampler, a6, (MTLDebugFunctionArgument *)&self->_tileSamplers[a6].type, &v19);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 0);
  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  v13 = objc_msgSend(a3, "baseObject");
  *(float *)&v14 = a4;
  *(float *)&v15 = a5;
  objc_msgSend(v12, "setTileSamplerState:lodMinClamp:lodMaxClamp:atIndex:", v13, a6, v14, v15);
  p_type = &self->_tileSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    v17 = &p_type[11 * a6];
    if (*((_DWORD *)v17 + 20) == LODWORD(a5)
      && *((_DWORD *)v17 + 19) == LODWORD(a4)
      && *((_BYTE *)v17 + 72)
      && v17[6] == -1
      && v17[1] == 2
      && (id)v17[2] == a3
      && !(v17[4] | v17[3] | v17[5])
      && *(_OWORD *)(v17 + 7) == 0)
    {
      MTLReportFailure();
    }
  }
  v18 = &p_type[11 * a6];
  *(_BYTE *)v18 = a3 != 0;
  *((_BYTE *)v18 + 1) = 0;
  v18[1] = 2;
  v18[2] = (unint64_t)a3;
  v18[3] = 0;
  v18[4] = 0;
  v18[5] = 0;
  v18[6] = -1;
  v18[7] = 0;
  v18[8] = 0;
  *((_BYTE *)v18 + 72) = 1;
  *((float *)v18 + 19) = a4;
  *((float *)v18 + 20) = a5;
}

- (void)setTileSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  const void *v10;
  NSUInteger v11;
  char *v12;
  MTLToolsDevice *device;
  NSUInteger v14;
  uint64_t v15;
  _QWORD *v16;
  const float *v17;
  const float *v18;
  _DWORD *v19;
  const void *v20;
  int v21;
  int v22;
  const void *v30;
  unint64_t v31;
  NSUInteger v34;
  MTLDebugRenderCommandEncoder *v35;
  _MTLMessageContext v36;
  _BYTE v37[128];
  uint64_t v38;

  length = a6.length;
  location = a6.location;
  v38 = *MEMORY[0x24BDAC8D0];
  memset(&v36, 0, sizeof(v36));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length > -[MTLToolsDevice maxTileSamplers](self->super.super.super._device, "maxTileSamplers"))
  {
    v30 = (const void *)(location + length);
    v31 = -[MTLToolsDevice maxTileSamplers](self->super.super.super._device, "maxTileSamplers");
    _MTLMessageContextPush_();
  }
  v34 = length;
  v35 = self;
  if (length)
  {
    v10 = 0;
    v11 = location;
    v12 = (char *)self + 88 * location;
    do
    {
      if (a3[(_QWORD)v10])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (device = v35->super.super.super._device,
              device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v10], "device", CFSTR("samplers[%lu] is not an MTLSamplerState."))))
        {
          v30 = v10;
          _MTLMessageContextPush_();
        }
      }
      if ((unint64_t)v10 + location <= 0xF)
        validateArg(MTLArgumentTypeSampler, (unint64_t)v10 + location, (MTLDebugFunctionArgument *)(v12 + 45480), &v36);
      v10 = (char *)v10 + 1;
      v12 += 88;
    }
    while ((const void *)length != v10);
    _MTLMessageContextEnd();
    v14 = length;
    v15 = (uint64_t)&v35->_attachmentInfo[1] + 88 * location;
    v16 = v37;
    v18 = a4;
    v17 = a5;
    do
    {
      objc_msgSend((id)v35->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 0, v30, v31);
      *v16 = objc_msgSend((id)*a3, "baseObject");
      v19 = (_DWORD *)(v15 + 45480);
      v20 = *a3;
      v21 = *(_DWORD *)v18;
      v22 = *(_DWORD *)v17;
      if (MTLReportFailureTypeEnabled())
      {
        if (*v19 == v22
          && *(_DWORD *)(v15 + 45476) == v21
          && *(_BYTE *)(v15 + 45472) != 0
          && *(_QWORD *)(v15 + 45448) == -1
          && *(_QWORD *)(v15 + 45408) == 2
          && *(_QWORD *)(v15 + 45416) == (_QWORD)v20
          && (*(_QWORD *)(v15 + 45432) | *(_QWORD *)(v15 + 45424) | *(_QWORD *)(v15 + 45440)) == 0
          && *(_OWORD *)(v15 + 45456) == 0)
        {
          v30 = v20;
          MTLReportFailure();
        }
      }
      *(_BYTE *)(v15 + 45400) = v20 != 0;
      *(_BYTE *)(v15 + 45401) = 0;
      *(_QWORD *)(v15 + 45408) = 2;
      *(_QWORD *)(v15 + 45416) = v20;
      *(_QWORD *)(v15 + 45424) = 0;
      *(_QWORD *)(v15 + 45432) = 0;
      *(_QWORD *)(v15 + 45440) = 0;
      *(_QWORD *)(v15 + 45448) = -1;
      *(_QWORD *)(v15 + 45456) = 0;
      *(_QWORD *)(v15 + 45464) = 0;
      v15 += 88;
      *((_BYTE *)v19 - 8) = 1;
      ++v17;
      ++v18;
      *(v19 - 1) = v21;
      *v19 = v22;
      ++v16;
      ++a3;
      --v14;
    }
    while (v14);
  }
  else
  {
    v11 = location;
    _MTLMessageContextEnd();
  }
  objc_msgSend(-[MTLToolsObject baseObject](v35, "baseObject", v30), "setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v37, a4, a5, v11, v34);
}

- (void)dispatchThreadsPerTile:(id *)a3
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v3;

  v3 = *a3;
  -[MTLDebugRenderCommandEncoder _dispatchThreadsPerTile:inRegion:withRenderTargetArrayIndex:](self, "_dispatchThreadsPerTile:inRegion:withRenderTargetArrayIndex:", &v3, 0, 0);
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v4;

  v4 = *a3;
  -[MTLDebugRenderCommandEncoder _dispatchThreadsPerTile:inRegion:withRenderTargetArrayIndex:](self, "_dispatchThreadsPerTile:inRegion:withRenderTargetArrayIndex:", &v4, a4, 0);
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4 withRenderTargetArrayIndex:(unsigned int)a5
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5;
  unsigned int v6;

  v6 = a5;
  v5 = *a3;
  -[MTLDebugRenderCommandEncoder _dispatchThreadsPerTile:inRegion:withRenderTargetArrayIndex:](self, "_dispatchThreadsPerTile:inRegion:withRenderTargetArrayIndex:", &v5, a4, &v6);
}

- (void)_validateDispatchThreadsPerTile:(id *)a3 context:(_MTLMessageContext *)a4
{
  unint64_t var0;
  unint64_t v8;
  unint64_t v9;
  unint64_t var1;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *peakPerSampleStorage;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  __int128 v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t var2;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  const char *v34;
  MTLToolsDevice *device;
  __int128 v36;

  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled())
  {
    if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
      _MTLMessageContextPush_();
    if (objc_msgSend((id)self->_peakPerSampleStorage, "tileDescriptor"))
    {
      if (-[MTLRenderPipelineState threadgroupSizeMatchesTileSize](-[MTLDebugRenderCommandEncoder renderPipelineState](self, "renderPipelineState"), "threadgroupSizeMatchesTileSize"))
      {
        var0 = a3->var0;
        if (var0 != -[MTLToolsRenderCommandEncoder tileWidth](self, "tileWidth")
          || (v8 = a3->var1, v8 != -[MTLToolsRenderCommandEncoder tileHeight](self, "tileHeight")))
        {
          v9 = a3->var0;
          var1 = a3->var1;
          v28 = -[MTLToolsRenderCommandEncoder tileWidth](self, "tileWidth");
          v31 = -[MTLToolsRenderCommandEncoder tileHeight](self, "tileHeight");
          v19 = v9;
          v24 = var1;
          _MTLMessageContextPush_();
        }
      }
      if (!-[MTLToolsDevice supportsNonSquareTileShaders](self->super.super.super._device, "supportsNonSquareTileShaders", v19, v24, v28, v31)&& (-[MTLRenderPipelineState threadgroupSizeMatchesTileSize](-[MTLDebugRenderCommandEncoder renderPipelineState](self, "renderPipelineState"), "threadgroupSizeMatchesTileSize") & 1) == 0)
      {
        v11 = a3->var0;
        if (v11 != -[MTLToolsRenderCommandEncoder tileWidth](self, "tileWidth")
          || (v12 = a3->var1, v12 != -[MTLToolsRenderCommandEncoder tileHeight](self, "tileHeight")))
        {
          if (a3->var0 != a3->var1)
          {
            v29 = a3->var0;
            v32 = a3->var1;
            v20 = a3->var0;
            v25 = v32;
            _MTLMessageContextPush_();
          }
        }
      }
      v13 = a3->var2 * ((a3->var0 & 1) + a3->var0) * ((a3->var1 & 1) + a3->var1);
      if (v13 > -[MTLRenderPipelineState maxTotalThreadsPerThreadgroup](-[MTLDebugRenderCommandEncoder renderPipelineState](self, "renderPipelineState", v20, v25, v29, v32), "maxTotalThreadsPerThreadgroup"))
      {
        v36 = *(_OWORD *)&a3->var0;
        var2 = a3->var2;
        v33 = -[MTLRenderPipelineState maxTotalThreadsPerThreadgroup](-[MTLDebugRenderCommandEncoder renderPipelineState](self, "renderPipelineState"), "maxTotalThreadsPerThreadgroup");
        v21 = v36;
        _MTLMessageContextPush_();
      }
      peakPerSampleStorage = (void *)self->_peakPerSampleStorage;
      if (peakPerSampleStorage
        && self->_resolvedRasterSampleCount
        && (objc_msgSend(peakPerSampleStorage, "isImageBlockLayoutInputCompatibleWithOutputOf:") & 1) == 0)
      {
        _MTLMessageContextPush_();
      }
      v15 = a3->var0;
      if (!(a3->var1 * a3->var0 * a3->var2))
      {
        v21 = *(_OWORD *)&a3->var0;
        var2 = a3->var2;
        _MTLMessageContextPush_();
        v15 = a3->var0;
      }
      if (v15 > -[MTLToolsRenderCommandEncoder tileWidth](self, "tileWidth", v21, var2, v33))
      {
        v22 = a3->var0;
        v26 = -[MTLToolsRenderCommandEncoder tileWidth](self, "tileWidth");
        _MTLMessageContextPush_();
      }
      v16 = a3->var1;
      if (v16 > -[MTLToolsRenderCommandEncoder tileHeight](self, "tileHeight", v22, v26))
      {
        v23 = a3->var1;
        v27 = -[MTLToolsRenderCommandEncoder tileHeight](self, "tileHeight");
        _MTLMessageContextPush_();
      }
      if (a3->var2 != 1)
      {
        v23 = a3->var2;
        _MTLMessageContextPush_();
      }
      v34 = (const char *)-[MTLToolsRetainingContainer protectionOptions](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer", v23, v27), "protectionOptions");
      device = self->super.super.super._device;
      v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)self->_peakPerSampleStorage, "tileDescriptor"), "tileFunction"), "name");
      v18 = (void *)objc_msgSend((id)objc_msgSend((id)self->_peakPerSampleStorage, "reflection"), "tileArguments");
      -[MTLToolsDevice maxFragmentBuffers](self->super.super.super._device, "maxFragmentBuffers");
      -[MTLToolsDevice maxFragmentTextures](self->super.super.super._device, "maxFragmentTextures");
      -[MTLToolsDevice maxFragmentSamplers](self->super.super.super._device, "maxFragmentSamplers");
      validateFunctionArguments(device, (uint64_t)CFSTR("Tile"), v17, v18, (uint64_t)&self->_tileBuffers[0].type, (uint64_t)&self->_tileTextures[0].type, (uint64_t)&self->_tileSamplers[0].type, 0, 0, 0, 0, self->_commandBuffer, v34, (uint64_t)&self->_threadgroupMemoryArguments[0].type, -[MTLToolsDevice maxComputeLocalMemorySizes](self->super.super.super._device, "maxComputeLocalMemorySizes"), 1, 0, (uint64_t)a4, LOBYTE(self->_depthBias));
    }
    else
    {
      _MTLMessageContextPush_();
      _MTLMessageContextEnd();
    }
  }
}

- (void)_dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4 withRenderTargetArrayIndex:(unsigned int *)a5
{
  id v9;
  __int128 v10;
  __int128 v11;
  id v12;
  __int128 v13;
  __int128 v14;
  unint64_t v15;
  _OWORD v16[3];
  __int128 v17;
  unint64_t v18;
  _OWORD v19[3];
  __int128 v20;
  unint64_t var2;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22;
  _OWORD v23[3];
  uint64_t v24;

  v24 = 0;
  memset(v23, 0, sizeof(v23));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  v22 = *a3;
  -[MTLDebugRenderCommandEncoder _validateDispatchThreadsPerTile:context:](self, "_validateDispatchThreadsPerTile:context:", &v22, v23);
  _MTLMessageContextEnd();
  if (a4)
  {
    v9 = -[MTLToolsObject baseObject](self, "baseObject");
    v10 = *(_OWORD *)&a3->var0;
    if (a5)
    {
      var2 = a3->var2;
      v11 = *(_OWORD *)&a4->var0.var2;
      v19[0] = *(_OWORD *)&a4->var0.var0;
      v19[1] = v11;
      v19[2] = *(_OWORD *)&a4->var1.var1;
      v20 = v10;
      objc_msgSend(v9, "dispatchThreadsPerTile:inRegion:withRenderTargetArrayIndex:", &v20, v19, *a5);
    }
    else
    {
      v18 = a3->var2;
      v13 = *(_OWORD *)&a4->var0.var2;
      v16[0] = *(_OWORD *)&a4->var0.var0;
      v16[1] = v13;
      v16[2] = *(_OWORD *)&a4->var1.var1;
      v17 = v10;
      objc_msgSend(v9, "dispatchThreadsPerTile:inRegion:", &v17, v16);
    }
  }
  else
  {
    v12 = -[MTLToolsObject baseObject](self, "baseObject");
    v14 = *(_OWORD *)&a3->var0;
    v15 = a3->var2;
    objc_msgSend(v12, "dispatchThreadsPerTile:", &v14);
  }
  LODWORD(self->_visibilityOffsets) |= 0x80000006;
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MTLDebugFunctionArgument *p_type;
  unint64_t *v10;
  unint64_t *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _MTLMessageContext v19;

  memset(&v19, 0, sizeof(v19));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (a5 <= 0x1E)
  {
    p_type = (MTLDebugFunctionArgument *)&self->_threadgroupMemoryArguments[a5].type;
    if (p_type->isValid
      && BYTE1(self->_threadgroupMemoryArguments[a5].type)
      && ((uint64_t)self->_visibilityOffsets & 0x80000000) == 0)
    {
      _MTLMessageContextPush_();
      p_type = (MTLDebugFunctionArgument *)&self->_threadgroupMemoryArguments[a5].type;
    }
    validateArg(MTLArgumentTypeThreadgroupMemory, a5, p_type, &v19);
  }
  if (-[MTLToolsDevice maxComputeLocalMemorySizes](self->super.super.super._device, "maxComputeLocalMemorySizes") <= a5)
  {
    v13 = a5;
    v16 = -[MTLToolsDevice maxComputeLocalMemorySizes](self->super.super.super._device, "maxComputeLocalMemorySizes");
    _MTLMessageContextPush_();
  }
  if (a4 + a3 > objc_msgSend((id)self->_frontFacingWinding, "threadgroupMemoryLength", v13, v16))
  {
    v14 = a4 + a3;
    v17 = objc_msgSend((id)self->_frontFacingWinding, "threadgroupMemoryLength");
    _MTLMessageContextPush_();
  }
  if (a3
     % -[MTLToolsDevice maxComputeThreadgroupMemoryAlignmentBytes](self->super.super.super._device, "maxComputeThreadgroupMemoryAlignmentBytes", v14, v17))
  {
    v15 = a3;
    v18 = -[MTLToolsDevice maxComputeThreadgroupMemoryAlignmentBytes](self->super.super.super._device, "maxComputeThreadgroupMemoryAlignmentBytes");
    _MTLMessageContextPush_();
  }
  if (a4
     % -[MTLToolsDevice maxComputeThreadgroupMemoryAlignmentBytes](self->super.super.super._device, "maxComputeThreadgroupMemoryAlignmentBytes", v15, v18))
  {
    -[MTLToolsDevice maxComputeThreadgroupMemoryAlignmentBytes](self->super.super.super._device, "maxComputeThreadgroupMemoryAlignmentBytes");
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setThreadgroupMemoryLength:offset:atIndex:", a3, a4, a5);
  v10 = &self->_threadgroupMemoryArguments[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    v11 = &v10[11 * a5];
    if (!*((_BYTE *)v11 + 72)
      && v11[8] == a4
      && v11[7] == a3
      && v11[6] == -1
      && v11[1] == 3
      && !v11[2]
      && !(v11[4] | v11[3] | v11[5])
      && !*(unint64_t *)((char *)v11 + 76))
    {
      MTLReportFailure();
    }
  }
  v12 = &v10[11 * a5];
  *(_BYTE *)v12 = a3 != 0;
  *((_BYTE *)v12 + 1) = 0;
  v12[1] = 3;
  *((_OWORD *)v12 + 1) = 0u;
  *((_OWORD *)v12 + 2) = 0u;
  v12[6] = -1;
  v12[7] = a3;
  v12[8] = a4;
  *((_BYTE *)v12 + 72) = 0;
  *((_DWORD *)v12 + 19) = 0;
  *((_DWORD *)v12 + 20) = 0;
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if (a4 >= 8)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResource:usage:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)validateFunctionTableUseResource:(id)a3 stages:(unint64_t)a4 context:(_MTLMessageContext *)a5 selectorName:(id)a6
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !MTLDebugStageIsRenderStage(objc_msgSend(a3, "stage"), a4))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ called with stages (0x%lx), but %s resource was created for stage %@"), a6, a4, "MTLVisibleFunctionTable", MTLDebugStageToString(objc_msgSend(a3, "stage")));
    _MTLMessageContextPush_();
  }
}

- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  unint64_t v9;
  _OWORD v10[3];
  uint64_t v11;

  v11 = 0;
  memset(v10, 0, sizeof(v10));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if (a4 >= 8)
  {
    v9 = a4;
    _MTLMessageContextPush_();
  }
  if (a5 >= 0x20)
  {
    v9 = a5;
    goto LABEL_9;
  }
  if (!a5)
LABEL_9:
    _MTLMessageContextPush_();
  -[MTLDebugRenderCommandEncoder validateFunctionTableUseResource:stages:context:selectorName:](self, "validateFunctionTableUseResource:stages:context:selectorName:", a3, a5, v10, CFSTR("useResource:usage:stages:"), v9);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResource:usage:stages:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  void *__p[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (a5 < 8)
  {
    if (a4)
      goto LABEL_3;
LABEL_11:
    _MTLMessageContextEnd();
    std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
    goto LABEL_12;
  }
  v13 = a5;
  _MTLMessageContextPush_();
  if (!a4)
    goto LABEL_11;
LABEL_3:
  v9 = 0;
  do
  {
    if (!a3[v9])
    {
      v13 = v9;
      _MTLMessageContextPush_();
    }
    ++v9;
  }
  while (a4 != v9);
  _MTLMessageContextEnd();
  std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
  v10 = 0;
  do
  {
    v11 = objc_msgSend((id)a3[v10], "baseObject", v13);
    *((_QWORD *)__p[0] + v10) = v11;
    objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3[v10++], 1, 1);
  }
  while (a4 != v10);
LABEL_12:
  v12 = -[MTLToolsObject baseObject](self, "baseObject", v13);
  objc_msgSend(v12, "useResources:count:usage:", __p[0], a4, a5);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *__p[3];
  _OWORD v16[3];
  uint64_t v17;

  v17 = 0;
  memset(v16, 0, sizeof(v16));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (a5 >= 8)
    _MTLMessageContextPush_();
  if (a6 < 0x20 && a6)
  {
    if (a4)
      goto LABEL_6;
LABEL_14:
    std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
    goto LABEL_15;
  }
  _MTLMessageContextPush_();
  if (!a4)
    goto LABEL_14;
LABEL_6:
  v11 = 0;
  do
  {
    if (!a3[v11])
      _MTLMessageContextPush_();
    ++v11;
  }
  while (a4 != v11);
  std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
  v12 = 0;
  do
  {
    -[MTLDebugRenderCommandEncoder validateFunctionTableUseResource:stages:context:selectorName:](self, "validateFunctionTableUseResource:stages:context:selectorName:", a3[v12], a6, v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("useResources:count:usage:stages: (index = %lu)"), v12));
    v13 = objc_msgSend((id)a3[v12], "baseObject");
    *((_QWORD *)__p[0] + v12) = v13;
    objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3[v12++], 1, 1);
  }
  while (a4 != v12);
LABEL_15:
  _MTLMessageContextEnd();
  v14 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v14, "useResources:count:usage:stages:", __p[0], a4, a5, a6);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)useHeap:(id)a3
{
  if (!a3)
    MTLReportFailure();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useHeap:", objc_msgSend(a3, "baseObject"));
}

- (void)useHeap:(id)a3 stages:(unint64_t)a4
{
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if (a4 >= 0x20 || !a4)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useHeap:stages:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *__p[3];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (a4)
  {
    v7 = 0;
    do
    {
      if (!a3[v7])
      {
        v11 = v7;
        _MTLMessageContextPush_();
      }
      ++v7;
    }
    while (a4 != v7);
    _MTLMessageContextEnd();
    std::vector<objc_object  {objcproto7MTLHeap}*>::vector(__p, a4);
    v8 = 0;
    do
    {
      v9 = objc_msgSend((id)a3[v8], "baseObject", v11);
      *((_QWORD *)__p[0] + v8) = v9;
      objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3[v8++], 1, 1);
    }
    while (a4 != v8);
  }
  else
  {
    _MTLMessageContextEnd();
    std::vector<objc_object  {objcproto7MTLHeap}*>::vector(__p, 0);
  }
  v10 = -[MTLToolsObject baseObject](self, "baseObject", v11);
  objc_msgSend(v10, "useHeaps:count:", __p[0], a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  void *__p[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (a5 >= 0x20)
  {
    v13 = a5;
  }
  else if (a5)
  {
    if (a4)
      goto LABEL_4;
LABEL_13:
    _MTLMessageContextEnd();
    std::vector<objc_object  {objcproto7MTLHeap}*>::vector(__p, a4);
    goto LABEL_14;
  }
  _MTLMessageContextPush_();
  if (!a4)
    goto LABEL_13;
LABEL_4:
  v9 = 0;
  do
  {
    if (!a3[v9])
    {
      v13 = v9;
      _MTLMessageContextPush_();
    }
    ++v9;
  }
  while (a4 != v9);
  _MTLMessageContextEnd();
  std::vector<objc_object  {objcproto7MTLHeap}*>::vector(__p, a4);
  v10 = 0;
  do
  {
    v11 = objc_msgSend((id)a3[v10], "baseObject", v13);
    *((_QWORD *)__p[0] + v10) = v11;
    objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3[v10++], 1, 1);
  }
  while (a4 != v10);
LABEL_14:
  v12 = -[MTLToolsObject baseObject](self, "baseObject", v13);
  objc_msgSend(v12, "useHeaps:count:", __p[0], a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setViewport:(id *)a3
{
  _MTLMessageContext *v5;
  __int128 v6;
  int visibilityOffsets;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  int v9;
  id v10;
  __int128 v11;
  _OWORD v12[3];
  _OWORD v13[3];
  MTLViewport v14;
  uint64_t v15;

  v15 = 0;
  memset(&v14, 0, sizeof(v14));
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  v6 = *(_OWORD *)&a3->var2;
  v13[0] = *(_OWORD *)&a3->var0;
  v13[1] = v6;
  v13[2] = *(_OWORD *)&a3->var4;
  validateMTLViewport((double *)v13, &v14, v5);
  visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x40000) != 0)
  {
    end = self->_viewports.__end_;
    if (($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(self->_viewports.__end_cap_.__value_ - end) == ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)48
      && !memcmp(end, a3, 0x30uLL))
    {
      _MTLMessageContextPush_();
      visibilityOffsets = (int)self->_visibilityOffsets;
    }
  }
  v9 = visibilityOffsets | 0x40000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x40000;
  if ((visibilityOffsets & 8) == 0)
  {
    _MTLMessageContextPush_();
    v9 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v9 & 0xFFFFFFF7;
  _MTLMessageContextEnd();
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  v11 = *(_OWORD *)&a3->var2;
  v12[0] = *(_OWORD *)&a3->var0;
  v12[1] = v11;
  v12[2] = *(_OWORD *)&a3->var4;
  objc_msgSend(v10, "setViewport:", v12);
  std::vector<MTLViewport>::assign((char **)&self->_viewports.__end_, 1uLL, (__int128 *)a3);
}

- (void)setViewports:(id *)a3 count:(unint64_t)a4
{
  _MTLMessageContext *v7;
  _BOOL4 v8;
  unint64_t v9;
  const $54B668FA3CFF7C50914A1C899F2834C0 *v10;
  __int128 v11;
  char v12;
  int visibilityOffsets;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  int64_t v15;
  int v16;
  char *p_end;
  __int128 v18[2];
  uint64_t v19;
  uint64_t v20;
  _OWORD v21[3];
  MTLViewport v22;
  uint64_t v23;

  v23 = 0;
  memset(&v22, 0, sizeof(v22));
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) == 0)
  {
    if (a3)
      goto LABEL_3;
LABEL_8:
    _MTLMessageContextPush_();
    goto LABEL_9;
  }
  _MTLMessageContextPush_();
  if (!a3)
    goto LABEL_8;
LABEL_3:
  v8 = a4 != 0;
  if (!a4)
  {
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v9 = 0;
  v10 = a3;
  do
  {
    v11 = *(_OWORD *)&v10->var2;
    v21[0] = *(_OWORD *)&v10->var0;
    v21[1] = v11;
    v21[2] = *(_OWORD *)&v10->var4;
    validateMTLViewport((double *)v21, &v22, v7);
    ++v9;
    ++v10;
  }
  while (v9 < a4);
LABEL_10:
  v12 = objc_msgSend((id)self->_frontFacingWinding, "rasterizationRateMap") != 0;
  if (a4 - 1 >= -[MTLToolsDevice maxViewportCount](self->super.super.super._device, "maxViewportCount") >> v12)
    _MTLMessageContextPush_();
  visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x40000) != 0)
  {
    if (a3)
    {
      end = self->_viewports.__end_;
      v15 = self->_viewports.__end_cap_.__value_ - end;
      if (0xAAAAAAAAAAAAAAABLL * (v15 >> 4) == a4 && !memcmp(end, a3, v15))
      {
        _MTLMessageContextPush_();
        visibilityOffsets = (int)self->_visibilityOffsets;
      }
    }
  }
  v16 = visibilityOffsets | 0x40000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x40000;
  if ((visibilityOffsets & 8) == 0)
  {
    _MTLMessageContextPush_();
    v16 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v16 & 0xFFFFFFF7;
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setViewports:count:", a3, a4);
  p_end = (char *)&self->_viewports.__end_;
  if (v8)
  {
    std::vector<MTLViewport>::__assign_with_size[abi:ne180100]<MTLViewport const*,MTLViewport const*>(p_end, (char *)a3, (uint64_t)&a3[a4], a4);
  }
  else
  {
    memset(v18, 0, sizeof(v18));
    v19 = 0;
    v20 = 0x3FF0000000000000;
    std::vector<MTLViewport>::assign((char **)p_end, 1uLL, v18);
  }
}

- (void)setFrontFacingWinding:(unint64_t)a3
{
  int visibilityOffsets;
  int v6;

  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (a3 >= 2)
    _MTLMessageContextPush_();
  visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x80000) != 0 && self->_cullMode == a3)
  {
    _MTLMessageContextPush_();
    visibilityOffsets = (int)self->_visibilityOffsets;
  }
  v6 = visibilityOffsets | 0x80000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x80000;
  if ((visibilityOffsets & 0x10) == 0)
  {
    _MTLMessageContextPush_();
    v6 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v6 & 0xFFFFFFEF;
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", 0, 0, 0, 0, 0, 0, 0), "setFrontFacingWinding:", a3);
  self->_cullMode = a3;
}

- (void)setCullMode:(unint64_t)a3
{
  int visibilityOffsets;
  int v6;

  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (a3 >= 3)
    _MTLMessageContextPush_();
  visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x100000) != 0 && self->_depthClipMode == a3)
  {
    _MTLMessageContextPush_();
    visibilityOffsets = (int)self->_visibilityOffsets;
  }
  v6 = visibilityOffsets | 0x100000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x100000;
  if ((visibilityOffsets & 0x20) == 0)
  {
    _MTLMessageContextPush_();
    v6 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v6 & 0xFFFFFFDF;
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", 0, 0, 0, 0, 0, 0, 0), "setCullMode:", a3);
  self->_depthClipMode = a3;
}

- (void)setDepthClipMode:(unint64_t)a3
{
  int visibilityOffsets;
  int v6;

  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (a3 >= 2)
    _MTLMessageContextPush_();
  visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x200000) != 0 && self->_triangleFillMode == a3)
  {
    _MTLMessageContextPush_();
    visibilityOffsets = (int)self->_visibilityOffsets;
  }
  v6 = visibilityOffsets | 0x200000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x200000;
  if ((visibilityOffsets & 0x40) == 0)
  {
    _MTLMessageContextPush_();
    v6 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v6 & 0xFFFFFFBF;
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", 0, 0, 0, 0, 0, 0, 0), "setDepthClipModeSPI:", a3);
  self->_triangleFillMode = a3;
}

- (void)setLineWidth:(float)a3
{
  int visibilityOffsets;
  int v7;
  id v8;
  double v9;

  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (a3 < 1.0 || a3 > 16.0)
    _MTLMessageContextPush_();
  visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x400000) != 0 && LODWORD(self->_depthBiasSlopeScale) == LODWORD(a3))
  {
    _MTLMessageContextPush_();
    visibilityOffsets = (int)self->_visibilityOffsets;
  }
  v7 = visibilityOffsets | 0x400000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x400000;
  if ((visibilityOffsets & 0x80) == 0)
  {
    _MTLMessageContextPush_();
    v7 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v7 & 0xFFFFFF7F;
  _MTLMessageContextEnd();
  v8 = -[MTLToolsObject baseObject](self, "baseObject");
  *(float *)&v9 = a3;
  objc_msgSend(v8, "setLineWidth:", v9);
  self->_depthBiasSlopeScale = a3;
}

- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5
{
  int visibilityOffsets;
  BOOL v10;
  int v12;
  id v13;
  double v14;
  double v15;
  double v16;

  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (MTLReportFailureTypeEnabled())
  {
    visibilityOffsets = (int)self->_visibilityOffsets;
    if ((visibilityOffsets & 0x800000) != 0)
    {
      v10 = LODWORD(self->_depthBiasClamp) == LODWORD(a3) && self->_frontStencilRef == LODWORD(a4);
      if (v10 && self->_backStencilRef == LODWORD(a5))
      {
        _MTLMessageContextPush_();
        visibilityOffsets = (int)self->_visibilityOffsets;
      }
    }
    v12 = visibilityOffsets | 0x800000;
    LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x800000;
    if ((visibilityOffsets & 0x100) == 0)
    {
      _MTLMessageContextPush_();
      v12 = (int)self->_visibilityOffsets;
    }
    LODWORD(self->_visibilityOffsets) = v12 & 0xFFFFFEFF;
  }
  _MTLMessageContextEnd();
  v13 = -[MTLToolsObject baseObject](self, "baseObject", 0, 0, 0, 0, 0, 0, 0);
  *(float *)&v14 = a3;
  *(float *)&v15 = a4;
  *(float *)&v16 = a5;
  objc_msgSend(v13, "setDepthBias:slopeScale:clamp:", v14, v15, v16);
  self->_depthBiasClamp = a3;
  *(float *)&self->_frontStencilRef = a4;
  *(float *)&self->_backStencilRef = a5;
}

- (void)setScissorRect:(id *)a3
{
  int visibilityOffsets;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;
  int v14;
  id v15;
  __int128 v16;
  _OWORD v17[2];
  _MTLMessageContext v18;

  memset(&v18, 0, sizeof(v18));
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  validateMTLScissorRect(self, (const MTLScissorRect *)a3, &v18);
  visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x1000000) != 0)
  {
    end = self->_scissorRects.__end_;
    if (($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(self->_scissorRects.__end_cap_.__value_ - end) == ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)32)
    {
      v7 = *(_QWORD *)end;
      v8 = *((_QWORD *)end + 1);
      v10 = *((_QWORD *)end + 2);
      v9 = *((_QWORD *)end + 3);
      v11 = v7 == a3->var0 && v8 == a3->var1;
      v12 = v11 && v10 == a3->var2;
      if (v12 && v9 == a3->var3)
      {
        _MTLMessageContextPush_();
        visibilityOffsets = (int)self->_visibilityOffsets;
      }
    }
  }
  v14 = visibilityOffsets | 0x1000000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x1000000;
  if ((visibilityOffsets & 0x200) == 0)
  {
    _MTLMessageContextPush_();
    v14 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v14 & 0xFFFFFDFF;
  _MTLMessageContextEnd();
  v15 = -[MTLToolsObject baseObject](self, "baseObject");
  v16 = *(_OWORD *)&a3->var2;
  v17[0] = *(_OWORD *)&a3->var0;
  v17[1] = v16;
  objc_msgSend(v15, "setScissorRect:", v17);
  std::vector<MTLScissorRect>::assign((char **)&self->_scissorRects.__end_, 1uLL, a3);
}

- (void)setScissorRects:(id *)a3 count:(unint64_t)a4
{
  char v7;
  unint64_t v8;
  BOOL v9;
  int v10;
  const $3CC19D079FD0B010EE84973AA846B91B *v11;
  unint64_t v12;
  int visibilityOffsets;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  int64_t v15;
  int v16;
  char *p_end;
  _OWORD v18[2];
  _MTLMessageContext v19;

  memset(&v19, 0, sizeof(v19));
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
  {
    _MTLMessageContextPush_();
    if (a3)
      goto LABEL_3;
LABEL_26:
    _MTLMessageContextPush_();
    goto LABEL_3;
  }
  if (!a3)
    goto LABEL_26;
LABEL_3:
  v7 = objc_msgSend((id)self->_frontFacingWinding, "rasterizationRateMap") != 0;
  v8 = -[MTLToolsDevice maxViewportCount](self->super.super.super._device, "maxViewportCount") >> v7;
  if (!a4 || v8 < a4)
    _MTLMessageContextPush_();
  if (a3)
    v9 = a4 == 0;
  else
    v9 = 1;
  v10 = !v9;
  if (!v9 && v8 >= a4)
  {
    v11 = a3;
    v12 = a4;
    do
    {
      validateMTLScissorRect(self, (const MTLScissorRect *)v11++, &v19);
      --v12;
    }
    while (v12);
  }
  visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x1000000) != 0)
  {
    if (a3)
    {
      end = self->_scissorRects.__end_;
      v15 = self->_scissorRects.__end_cap_.__value_ - end;
      if (v15 >> 5 == a4 && !memcmp(end, a3, v15))
      {
        _MTLMessageContextPush_();
        visibilityOffsets = (int)self->_visibilityOffsets;
      }
    }
  }
  v16 = visibilityOffsets | 0x1000000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x1000000;
  if ((visibilityOffsets & 0x200) == 0)
  {
    _MTLMessageContextPush_();
    v16 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v16 & 0xFFFFFDFF;
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setScissorRects:count:", a3, a4);
  p_end = (char *)&self->_scissorRects.__end_;
  if (v10)
  {
    std::vector<MTLScissorRect>::__assign_with_size[abi:ne180100]<MTLScissorRect const*,MTLScissorRect const*>(p_end, (char *)a3, (uint64_t)&a3[a4], a4);
  }
  else
  {
    memset(v18, 0, sizeof(v18));
    std::vector<MTLScissorRect>::assign((char **)p_end, 1uLL, v18);
  }
}

- (void)setTransformFeedbackState:(unint64_t)a3
{
  _MTLMessageContextBegin_();
  if (a3 >= 2)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTransformFeedbackState:", a3);
}

- (void)setVertexAmplificationMode:(unint64_t)a3 value:(unint64_t)a4
{
  unint64_t amplificationValue;
  unint64_t v8;
  uint8x8_t v9;
  int visibilityOffsets;
  int v11;

  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  amplificationValue = self->_amplificationValue;
  v8 = a4;
  if (!amplificationValue)
  {
LABEL_6:
    if (!v8)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (amplificationValue == 1)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)a4);
    v9.i16[0] = vaddlv_u8(v9);
    v8 = v9.u32[0];
    goto LABEL_6;
  }
  _MTLMessageContextPush_();
  v8 = a4;
  if (!a4)
  {
LABEL_10:
    -[MTLToolsDevice maxVertexAmplificationFactor](self->super.super.super._device, "maxVertexAmplificationFactor");
    _MTLMessageContextPush_();
    goto LABEL_11;
  }
LABEL_9:
  if (v8 > -[MTLToolsDevice maxVertexAmplificationFactor](self->super.super.super._device, "maxVertexAmplificationFactor"))goto LABEL_10;
LABEL_11:
  visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x40000000) != 0 && self->_vertexAmplificationCount == a4)
  {
    _MTLMessageContextPush_();
    visibilityOffsets = (int)self->_visibilityOffsets;
  }
  v11 = visibilityOffsets | 0x40000000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x40000000;
  if ((visibilityOffsets & 0x8000) == 0)
  {
    _MTLMessageContextPush_();
    v11 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v11 & 0xFFFF7FFF;
  _MTLMessageContextEnd();
  self->_amplificationValue = a3;
  self->_vertexAmplificationCount = a4;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexAmplificationMode:value:", a3, a4);
}

- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4
{
  int visibilityOffsets;
  int v8;

  _MTLMessageContextBegin_();
  if ((-[MTLDevice supportsVertexAmplification](-[MTLToolsObject device](self, "device"), "supportsVertexAmplification") & 1) == 0)_MTLMessageContextPush_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if ((-[MTLDevice supportsVertexAmplificationCount:](-[MTLToolsObject device](self, "device"), "supportsVertexAmplificationCount:", a3) & 1) == 0)_MTLMessageContextPush_();
  visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x40000000) != 0 && self->_updatedFences.__map_.__first_ == (__begin_ ***)a3)
  {
    _MTLMessageContextPush_();
    visibilityOffsets = (int)self->_visibilityOffsets;
  }
  v8 = visibilityOffsets | 0x40000000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x40000000;
  if ((visibilityOffsets & 0x8000) == 0)
  {
    _MTLMessageContextPush_();
    v8 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v8 & 0xFFFF7FFF;
  _MTLMessageContextEnd();
  self->_updatedFences.__map_.__first_ = (__begin_ ***)a3;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexAmplificationCount:viewMappings:", a3, a4);
}

- (void)setTriangleFrontFillMode:(unint64_t)a3 backFillMode:(unint64_t)a4
{
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (a3 >= 3)
    _MTLMessageContextPush_();
  if (a4 >= 3)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", 0, 0, 0, 0, 0, 0, 0), "setTriangleFrontFillMode:backFillMode:", a3, a4);
  self->_renderPipelineState = (MTLRenderPipelineState *)a3;
}

- (void)setTriangleFillMode:(unint64_t)a3
{
  int visibilityOffsets;
  int v6;

  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (a3 >= 3)
    _MTLMessageContextPush_();
  visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x2000000) != 0 && self->_renderPipelineState == (MTLRenderPipelineState *)a3)
  {
    _MTLMessageContextPush_();
    visibilityOffsets = (int)self->_visibilityOffsets;
  }
  v6 = visibilityOffsets | 0x2000000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x2000000;
  if ((visibilityOffsets & 0x400) == 0)
  {
    _MTLMessageContextPush_();
    v6 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v6 & 0xFFFFFBFF;
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", 0, 0, 0, 0, 0, 0, 0), "setTriangleFillMode:", a3);
  self->_renderPipelineState = (MTLRenderPipelineState *)a3;
}

- (void)setDepthStencilState:(id)a3
{
  MTLToolsDevice *device;
  int visibilityOffsets;
  int v7;

  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
  {
    _MTLMessageContextPush_();
    if (a3)
      goto LABEL_3;
LABEL_5:
    _MTLMessageContextPush_();
    goto LABEL_6;
  }
  if (!a3)
    goto LABEL_5;
LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device", 0, 0, 0, 0, 0, 0, 0))
    goto LABEL_5;
LABEL_6:
  visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x4000000) != 0 && self->_defaultDepthStencilDescriptor == a3)
  {
    _MTLMessageContextPush_();
    visibilityOffsets = (int)self->_visibilityOffsets;
  }
  v7 = visibilityOffsets | 0x4000000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x4000000;
  if ((visibilityOffsets & 0x800) == 0)
  {
    _MTLMessageContextPush_();
    v7 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v7 & 0xFFFFF7FF;
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 0);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthStencilState:", objc_msgSend(a3, "baseObject"));
  self->_defaultDepthStencilDescriptor = (MTLDepthStencilDescriptor *)a3;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x80u;
}

- (void)setStencilReferenceValue:(unsigned int)a3
{
  uint64_t v3;
  int visibilityOffsets;
  int v6;

  v3 = *(_QWORD *)&a3;
  _MTLMessageContextBegin_();
  visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x10000) != 0)
  {
    _MTLMessageContextPush_();
    visibilityOffsets = (int)self->_visibilityOffsets;
  }
  if ((visibilityOffsets & 0x8000000) != 0
    && LODWORD(self->_blendColorRed) == (_DWORD)v3
    && LODWORD(self->_blendColorGreen) == (_DWORD)v3)
  {
    _MTLMessageContextPush_();
    visibilityOffsets = (int)self->_visibilityOffsets;
  }
  v6 = visibilityOffsets | 0x8000000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x8000000;
  if ((visibilityOffsets & 0x1000) == 0)
  {
    _MTLMessageContextPush_();
    v6 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v6 & 0xFFFFEFFF;
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", 0, 0, 0, 0, 0, 0, 0), "setStencilReferenceValue:", v3);
  LODWORD(self->_blendColorRed) = v3;
  LODWORD(self->_blendColorGreen) = v3;
}

- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  int visibilityOffsets;
  int v8;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  _MTLMessageContextBegin_();
  visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x10000) != 0)
  {
    _MTLMessageContextPush_();
    visibilityOffsets = (int)self->_visibilityOffsets;
  }
  if ((visibilityOffsets & 0x8000000) != 0
    && LODWORD(self->_blendColorRed) == (_DWORD)v5
    && LODWORD(self->_blendColorGreen) == (_DWORD)v4)
  {
    _MTLMessageContextPush_();
    visibilityOffsets = (int)self->_visibilityOffsets;
  }
  v8 = visibilityOffsets | 0x8000000;
  LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x8000000;
  if ((visibilityOffsets & 0x1000) == 0)
  {
    _MTLMessageContextPush_();
    v8 = (int)self->_visibilityOffsets;
  }
  LODWORD(self->_visibilityOffsets) = v8 & 0xFFFFEFFF;
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", 0, 0, 0, 0, 0, 0, 0), "setStencilFrontReferenceValue:backReferenceValue:", v5, v4);
  LODWORD(self->_blendColorRed) = v5;
  LODWORD(self->_blendColorGreen) = v4;
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  void *v7;

  _MTLMessageContextBegin_();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    _MTLMessageContextPush_();
  if (a4 >= 8)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  v7 = (void *)objc_msgSend((id)objc_msgSend((id)self->_frontFacingWinding, "colorAttachments"), "_descriptorAtIndex:", a4);
  _MTLDebugValidateDeferredStoreActionOnDevice(self->super.super.super._device, a3, v7, a4, HIDWORD(self->_visibilityOffsets));
  objc_msgSend(v7, "setStoreAction:", a3);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setColorStoreAction:atIndex:", a3, a4);
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  void *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    MTLReportFailure();
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)self->_frontFacingWinding, "colorAttachments"), "_descriptorAtIndex:", 8);
  _MTLDebugValidateDeferredStoreActionOnDevice(self->super.super.super._device, a3, v5, 8uLL, HIDWORD(self->_visibilityOffsets));
  objc_msgSend(v5, "setStoreAction:", a3);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthStoreAction:", a3);
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  void *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    MTLReportFailure();
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)self->_frontFacingWinding, "colorAttachments"), "_descriptorAtIndex:", 9);
  _MTLDebugValidateDeferredStoreActionOnDevice(self->super.super.super._device, a3, v5, 9uLL, HIDWORD(self->_visibilityOffsets));
  objc_msgSend(v5, "setStoreAction:", a3);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilStoreAction:", a3);
}

- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4
{
  void *v7;

  _MTLMessageContextBegin_();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    _MTLMessageContextPush_();
  if (a4 >= 8)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  v7 = (void *)objc_msgSend((id)objc_msgSend((id)self->_frontFacingWinding, "colorAttachments"), "_descriptorAtIndex:", a4);
  _MTLDebugValidateDeferredStoreActionOptionsOnDevice(self->super.super.super._device, a3, v7, a4, HIDWORD(self->_visibilityOffsets));
  objc_msgSend(v7, "setStoreActionOptions:", a3);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setColorStoreActionOptions:atIndex:", a3, a4);
}

- (void)setDepthStoreActionOptions:(unint64_t)a3
{
  void *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    MTLReportFailure();
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)self->_frontFacingWinding, "colorAttachments"), "_descriptorAtIndex:", 8);
  _MTLDebugValidateDeferredStoreActionOptionsOnDevice(self->super.super.super._device, a3, v5, 8, HIDWORD(self->_visibilityOffsets));
  objc_msgSend(v5, "setStoreActionOptions:", a3);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthStoreActionOptions:", a3);
}

- (void)setStencilStoreActionOptions:(unint64_t)a3
{
  void *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    MTLReportFailure();
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)self->_frontFacingWinding, "colorAttachments"), "_descriptorAtIndex:", 9);
  _MTLDebugValidateDeferredStoreActionOptionsOnDevice(self->super.super.super._device, a3, v5, 9, HIDWORD(self->_visibilityOffsets));
  objc_msgSend(v5, "setStoreActionOptions:", a3);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilStoreActionOptions:", a3);
}

- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  unsigned int v12;
  BOOL v13;
  char **v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int visibilityOffsets;
  int v20;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unsigned int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  if (a3 == 2)
  {
    -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
    MTLValidateFeatureSupport();
  }
  v30 = 0;
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (a3 >= 3)
    _MTLMessageContextPush_();
  if ((a4 & 7) != 0)
  {
    v22 = a4;
    v24 = 8;
    _MTLMessageContextPush_();
  }
  if (-[MTLToolsDevice maxVisibilityQueryOffset](self->super.super.super._device, "maxVisibilityQueryOffset", v22, v24) < a4)
  {
    v23 = a4;
    v25 = -[MTLToolsDevice maxVisibilityQueryOffset](self->super.super.super._device, "maxVisibilityQueryOffset");
    _MTLMessageContextPush_();
  }
  if (a3)
  {
    begin = self->_viewports.__begin_;
    if (begin)
    {
      v10 = (char *)*((_QWORD *)begin + 1);
      v8 = (char *)begin + 8;
      v9 = v10;
      if (v10)
      {
        v11 = v8;
        do
        {
          v12 = *((_DWORD *)v9 + 7);
          v13 = v12 >= a4;
          if (v12 >= a4)
            v14 = (char **)v9;
          else
            v14 = (char **)(v9 + 8);
          if (v13)
            v11 = v9;
          v9 = *v14;
        }
        while (*v14);
        if (v11 != v8 && *((_DWORD *)v11 + 7) <= a4)
        {
          v23 = a4;
          _MTLMessageContextPush_();
        }
      }
    }
    else
    {
      v15 = operator new();
      *(_QWORD *)(v15 + 16) = 0;
      *(_QWORD *)(v15 + 8) = 0;
      *(_QWORD *)v15 = v15 + 8;
      self->_viewports.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v15;
    }
    v16 = objc_msgSend((id)self->_frontFacingWinding, "_descriptorPrivate", v23, v25);
    v17 = *(void **)(v16 + 8);
    if (!v17)
    {
      _MTLMessageContextPush_();
      v17 = *(void **)(v16 + 8);
    }
    if (a4 + 8 > objc_msgSend(v17, "length"))
    {
      objc_msgSend(*(id *)(v16 + 8), "length");
      _MTLMessageContextPush_();
    }
  }
  if (MTLReportFailureTypeEnabled())
  {
    visibilityOffsets = (int)self->_visibilityOffsets;
    if ((visibilityOffsets & 0x10000000) != 0 && self->_visibilityResultOffset == a3 && self->_width == a4)
    {
      _MTLMessageContextPush_();
      visibilityOffsets = (int)self->_visibilityOffsets;
    }
    v20 = visibilityOffsets | 0x10000000;
    LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x10000000;
    if ((visibilityOffsets & 0x2000) == 0)
    {
      _MTLMessageContextPush_();
      v20 = (int)self->_visibilityOffsets;
    }
    LODWORD(self->_visibilityOffsets) = v20 & 0xFFFFDFFF;
  }
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibilityResultMode:offset:", a3, a4);
  if (a3)
  {
    v21 = self->_viewports.__begin_;
    v26 = a4;
    std::__tree<unsigned int>::__emplace_hint_unique_key_args<unsigned int,unsigned int>((uint64_t **)v21, (uint64_t *)v21 + 1, &v26, &v26);
  }
  self->_visibilityResultOffset = a3;
  self->_width = a4;
}

- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  int visibilityOffsets;
  BOOL v12;
  BOOL v13;
  int v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;

  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (MTLReportFailureTypeEnabled())
  {
    visibilityOffsets = (int)self->_visibilityOffsets;
    if ((visibilityOffsets & 0x20000000) != 0)
    {
      v12 = LODWORD(self->_blendColorBlue) == LODWORD(a3) && LODWORD(self->_blendColorAlpha) == LODWORD(a4);
      v13 = v12 && LODWORD(self->_tessellationFactorScale) == LODWORD(a5);
      if (v13 && LODWORD(self->_descriptor) == LODWORD(a6))
      {
        _MTLMessageContextPush_();
        visibilityOffsets = (int)self->_visibilityOffsets;
      }
    }
    v15 = visibilityOffsets | 0x20000000;
    LODWORD(self->_visibilityOffsets) = visibilityOffsets | 0x20000000;
    if ((visibilityOffsets & 0x4000) == 0)
    {
      _MTLMessageContextPush_();
      v15 = (int)self->_visibilityOffsets;
    }
    LODWORD(self->_visibilityOffsets) = v15 & 0xFFFFBFFF;
  }
  _MTLMessageContextEnd();
  v16 = -[MTLToolsObject baseObject](self, "baseObject", 0, 0, 0, 0, 0, 0, 0);
  *(float *)&v17 = a3;
  *(float *)&v18 = a4;
  *(float *)&v19 = a5;
  *(float *)&v20 = a6;
  objc_msgSend(v16, "setBlendColorRed:green:blue:alpha:", v17, v18, v19, v20);
  self->_blendColorBlue = a3;
  self->_blendColorAlpha = a4;
  self->_tessellationFactorScale = a5;
  *(float *)&self->_descriptor = a6;
}

- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 atIndex:(unint64_t)a7
{
  void *v13;
  _QWORD **v14;
  unint64_t v15;
  uint64_t v16;

  if (a7 >= 8)
  {
    v15 = a7;
    v16 = 8;
    MTLReportFailure();
  }
  v13 = (void *)objc_msgSend(*(id *)objc_msgSend((id)self->_frontFacingWinding, "_descriptorPrivate", v15, v16), "_descriptorAtIndex:", a7);
  v14 = (_QWORD **)objc_msgSend(v13, "_descriptorPrivate");
  _MTLMessageContextBegin_();
  _MTLValidateResolveTextureWithContext(-[MTLToolsObject device](self, "device"), (uint64_t *)a3, a7, -[MTLDebugRenderCommandEncoder width](self, "width"), -[MTLDebugRenderCommandEncoder height](self, "height"), a4, a5, a6, *v14, (char)self->_vertexBuiltinArguments);
  _MTLMessageContextEnd();
  objc_msgSend(v13, "setResolveTexture:", a3);
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setColorResolveTexture:slice:depthPlane:level:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5, a6, a7);
}

- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7 atIndex:(unint64_t)a8
{
  void *v14;
  _QWORD **v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL4 v18;

  v18 = a7;
  if (a8 >= 8)
  {
    v16 = a8;
    v17 = 8;
    MTLReportFailure();
  }
  v14 = (void *)objc_msgSend(*(id *)objc_msgSend((id)self->_frontFacingWinding, "_descriptorPrivate", v16, v17), "_descriptorAtIndex:", a8);
  v15 = (_QWORD **)objc_msgSend(v14, "_descriptorPrivate");
  _MTLMessageContextBegin_();
  _MTLValidateResolveTextureWithContext(-[MTLToolsObject device](self, "device"), (uint64_t *)a3, a8, -[MTLDebugRenderCommandEncoder width](self, "width"), -[MTLDebugRenderCommandEncoder height](self, "height"), a4, a5, a6, *v15, (char)self->_vertexBuiltinArguments);
  _MTLMessageContextEnd();
  objc_msgSend(v14, "setResolveTexture:", a3);
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setColorResolveTexture:slice:depthPlane:level:yInvert:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5, a6, v18, a8);
}

- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6
{
  void *v11;
  _QWORD **v12;

  v11 = (void *)objc_msgSend(*(id *)objc_msgSend((id)self->_frontFacingWinding, "_descriptorPrivate"), "_descriptorAtIndex:", 8);
  v12 = (_QWORD **)objc_msgSend(v11, "_descriptorPrivate");
  _MTLMessageContextBegin_();
  _MTLValidateResolveTextureWithContext(-[MTLToolsObject device](self, "device"), (uint64_t *)a3, 8uLL, -[MTLDebugRenderCommandEncoder width](self, "width"), -[MTLDebugRenderCommandEncoder height](self, "height"), a4, a5, a6, *v12, (char)self->_vertexBuiltinArguments);
  _MTLMessageContextEnd();
  objc_msgSend(v11, "setResolveTexture:", a3);
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthResolveTexture:slice:depthPlane:level:", objc_msgSend(a3, "baseObject"), a4, a5, a6);
}

- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7
{
  void *v12;
  _QWORD **v13;
  _BOOL4 v14;

  v14 = a7;
  v12 = (void *)objc_msgSend(*(id *)objc_msgSend((id)self->_frontFacingWinding, "_descriptorPrivate"), "_descriptorAtIndex:", 8);
  v13 = (_QWORD **)objc_msgSend(v12, "_descriptorPrivate");
  _MTLMessageContextBegin_();
  _MTLValidateResolveTextureWithContext(-[MTLToolsObject device](self, "device"), (uint64_t *)a3, 8uLL, -[MTLDebugRenderCommandEncoder width](self, "width"), -[MTLDebugRenderCommandEncoder height](self, "height"), a4, a5, a6, *v13, (char)self->_vertexBuiltinArguments);
  _MTLMessageContextEnd();
  objc_msgSend(v12, "setResolveTexture:", a3);
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthResolveTexture:slice:depthPlane:level:yInvert:", objc_msgSend(a3, "baseObject"), a4, a5, a6, v14);
}

- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6
{
  void *v11;
  _QWORD **v12;

  v11 = (void *)objc_msgSend(*(id *)objc_msgSend((id)self->_frontFacingWinding, "_descriptorPrivate"), "_descriptorAtIndex:", 9);
  v12 = (_QWORD **)objc_msgSend(v11, "_descriptorPrivate");
  _MTLMessageContextBegin_();
  _MTLValidateResolveTextureWithContext(-[MTLToolsObject device](self, "device"), (uint64_t *)a3, 9uLL, -[MTLDebugRenderCommandEncoder width](self, "width"), -[MTLDebugRenderCommandEncoder height](self, "height"), a4, a5, a6, *v12, (char)self->_vertexBuiltinArguments);
  _MTLMessageContextEnd();
  objc_msgSend(v11, "setResolveTexture:", a3);
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilResolveTexture:slice:depthPlane:level:", objc_msgSend(a3, "baseObject"), a4, a5, a6);
}

- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7
{
  void *v12;
  _QWORD **v13;
  _BOOL4 v14;

  v14 = a7;
  v12 = (void *)objc_msgSend(*(id *)objc_msgSend((id)self->_frontFacingWinding, "_descriptorPrivate"), "_descriptorAtIndex:", 9);
  v13 = (_QWORD **)objc_msgSend(v12, "_descriptorPrivate");
  _MTLMessageContextBegin_();
  _MTLValidateResolveTextureWithContext(-[MTLToolsObject device](self, "device"), (uint64_t *)a3, 9uLL, -[MTLDebugRenderCommandEncoder width](self, "width"), -[MTLDebugRenderCommandEncoder height](self, "height"), a4, a5, a6, *v13, (char)self->_vertexBuiltinArguments);
  _MTLMessageContextEnd();
  objc_msgSend(v12, "setResolveTexture:", a3);
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilResolveTexture:slice:depthPlane:level:yInvert:", objc_msgSend(a3, "baseObject"), a4, a5, a6, v14);
}

- (void)validateCommonDrawErrors:(unint64_t)a3 instanceCount:(unint64_t)a4 baseInstance:(unint64_t)a5 maxVertexID:(unint64_t)a6
{
  unint64_t v11;
  uint64_t v12;
  void *peakPerSampleStorage;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t *p_type;
  unint64_t v21;
  uint64_t v22;
  unint64_t *v23;
  int v24;
  const char *v25;
  unint64_t *v26;
  const char **v27;
  const char *v28;
  const char *v30;
  uint64_t v31;
  MTLDevice *v32;

  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  v11 = a3 - 5;
  if (a3 >= 5 && (v11 > 4 || !LOBYTE(self->_vertexBuiltinArguments)))
    _MTLMessageContextPush_();
  v12 = objc_msgSend((id)self->_frontFacingWinding, "rasterizationRateMap");
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && v12)
    _MTLMessageContextPush_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
  {
    _MTLMessageContextPush_();
    if (a4)
      goto LABEL_10;
  }
  else if (a4)
  {
    goto LABEL_10;
  }
  v30 = 0;
  _MTLMessageContextPush_();
LABEL_10:
  peakPerSampleStorage = (void *)self->_peakPerSampleStorage;
  if (!peakPerSampleStorage || !objc_msgSend(peakPerSampleStorage, "descriptor"))
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  v14 = (void *)objc_msgSend((id)self->_peakPerSampleStorage, "descriptor");
  v15 = objc_msgSend((id)self->_peakPerSampleStorage, "attachmentWriteMask");
  self->_objectThreadsPerTG.width |= ((-[MTLDepthStencilDescriptor attachmentWriteMask](self->_defaultDepthStencilDescriptor, "attachmentWriteMask") << 32) | 0xFFFFFFFFLL) & v15;
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  switch(objc_msgSend(v14, "inputPrimitiveTopology"))
  {
    case 0:
      goto LABEL_19;
    case 1:
      if (a3)
        goto LABEL_52;
      goto LABEL_19;
    case 2:
      if (a3 - 3 < 0xFFFFFFFFFFFFFFFELL)
        goto LABEL_52;
      goto LABEL_19;
    case 3:
      if (v11 >= 0xFFFFFFFFFFFFFFFELL)
        goto LABEL_19;
LABEL_52:
      _MTLMessageContextPush_();
LABEL_19:
      v16 = self->_peakPerSampleStorage;
      v17 = a5 + a4;
      if (*(_QWORD *)(v16 + 40) < a6)
      {
        v30 = (const char *)a6;
        _MTLMessageContextPush_();
      }
      if (*(_QWORD *)(v16 + 48) < v17)
      {
        v30 = (const char *)v17;
        _MTLMessageContextPush_();
      }
      if ((self->_openGLModeEnabled & 3) == 0)
        goto LABEL_47;
      v18 = self->_peakPerSampleStorage;
      v32 = -[MTLToolsObject device](self, "device");
      if (!*(_QWORD *)(v18 + 152))
        goto LABEL_47;
      v19 = 0;
      p_type = &self->_vertexBuffers[0].type;
      v21 = v18;
      break;
    default:
      abort();
  }
  do
  {
    v22 = *(_QWORD *)(v21 + 160);
    v23 = &p_type[11 * v22];
    if (!*(_BYTE *)v23 || p_type[11 * v22 + 1])
    {
      v30 = "buffer";
      v31 = *(_QWORD *)(v21 + 160);
      _MTLMessageContextPush_();
      v24 = *(unsigned __int8 *)v23;
      BYTE1(p_type[11 * v22]) = 1;
      if (!v24)
        goto LABEL_31;
    }
    else
    {
      BYTE1(p_type[11 * v22]) = 1;
    }
    if (!p_type[11 * v22 + 1])
    {
      v25 = *(const char **)(v21 + 168);
      if (v25 == (const char *)-1)
        goto LABEL_37;
      if (!v25)
        goto LABEL_31;
      if (p_type[11 * v22 + 6] != -1)
      {
        v30 = (const char *)p_type[11 * v22 + 6];
        v31 = *(_QWORD *)(v21 + 160);
        _MTLMessageContextPush_();
        v25 = *(const char **)(v21 + 168);
        if (v25 == (const char *)-1)
        {
LABEL_37:
          v26 = &p_type[11 * v22];
          v28 = (const char *)v26[6];
          v27 = (const char **)(v26 + 6);
          v25 = v28;
          if (v28 == (const char *)-1)
          {
            v30 = *(const char **)(v21 + 160);
            _MTLMessageContextPush_();
            v25 = *(const char **)(v21 + 168);
            if (v25 == (const char *)-1)
              v25 = *v27;
          }
        }
      }
      if ((-[MTLDevice supportsUnalignedVertexFetch](v32, "supportsUnalignedVertexFetch", v30, v31) & 1) == 0
        && (unint64_t)(v25 + 1) >= 2
        && (v25 & 3) != 0)
      {
        v30 = v25;
        v31 = *(_QWORD *)(v21 + 160);
        _MTLMessageContextPush_();
      }
    }
LABEL_31:
    ++v19;
    v21 += 16;
  }
  while (*(_QWORD *)(v18 + 152) > v19);
LABEL_47:
  objc_msgSend((id)self->_peakPerSampleStorage, "reflection", v30);
  -[MTLToolsDevice maxFragmentBuffers](self->super.super.super._device, "maxFragmentBuffers");
  -[MTLToolsDevice maxVertexTextures](self->super.super.super._device, "maxVertexTextures");
  -[MTLToolsDevice maxFragmentTextures](self->super.super.super._device, "maxFragmentTextures");
  if (objc_msgSend((id)self->_peakPerSampleStorage, "isMeshShaderPipeline"))
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  -[MTLDebugRenderCommandEncoder validateCommonDrawErrors:](self, "validateCommonDrawErrors:", 3);
}

- (void)validateCommonDrawErrors:(unint64_t)a3
{
  char v3;
  void *v5;
  int64_t v6;
  void *peakPerSampleStorage;
  unint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  __begin_ ***first;
  void *frontFacingWinding;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t i;
  void *v25;
  void *v26;
  MTLDebugRenderTargetAttachmentInfo *v27;
  void *v28;
  void *v29;
  BOOL v30;
  MTLDebugRenderTargetAttachmentInfo *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  MTLDebugRenderTargetAttachmentInfo *v35;
  uint64_t v36;
  __begin_ ***v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  MTLToolsDevice *device;
  MTLToolsDevice *v47;
  MTLToolsDevice *v48;
  MTLToolsDevice *v49;
  void *v50;
  const char *v51;
  _OWORD v52[3];
  uint64_t v53;
  _QWORD v54[6];

  v3 = a3;
  v54[4] = *MEMORY[0x24BDAC8D0];
  v53 = 0;
  memset(v52, 0, sizeof(v52));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  v5 = (void *)objc_msgSend((id)self->_peakPerSampleStorage, "descriptor");
  v6 = self->_scissorRects.__end_cap_.__value_ - self->_scissorRects.__end_;
  if (v6 != 32
    && 0xAAAAAAAAAAAAAAABLL * ((self->_viewports.__end_cap_.__value_ - self->_viewports.__end_) >> 4) != v6 >> 5)
  {
    v36 = v6 >> 5;
    v38 = 0xAAAAAAAAAAAAAAABLL * ((self->_viewports.__end_cap_.__value_ - self->_viewports.__end_) >> 4);
    _MTLMessageContextPush_();
  }
  if (self->_openGLModeEnabled)
  {
    -[MTLDebugRenderCommandEncoder updatePipelineData](self, "updatePipelineData");
    peakPerSampleStorage = (void *)self->_peakPerSampleStorage;
    if (peakPerSampleStorage
      && self->_resolvedRasterSampleCount
      && (objc_msgSend(peakPerSampleStorage, "isImageBlockLayoutInputCompatibleWithOutputOf:") & 1) == 0)
    {
      _MTLMessageContextPush_();
      if (!v5)
        goto LABEL_14;
    }
    else if (!v5)
    {
      goto LABEL_14;
    }
    if (objc_msgSend((id)objc_msgSend(v5, "vertexFunction", v36, v38), "renderTargetArrayIndexType")
      && !objc_msgSend((id)self->_frontFacingWinding, "renderTargetArrayLength"))
    {
      _MTLMessageContextPush_();
    }
  }
LABEL_14:
  v50 = (void *)-[MTLDepthStencilDescriptor descriptor](self->_defaultDepthStencilDescriptor, "descriptor", v36, v38);
  v51 = (const char *)-[MTLToolsRetainingContainer protectionOptions](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "protectionOptions");
  if ((v3 & 1) != 0 && (self->_openGLModeEnabled & 0xE) != 0)
  {
    memset(v54, 0, 31);
    v9 = self->_peakPerSampleStorage;
    if (-[MTLToolsDevice supportsUnalignedVertexFetch](self->super.super.super._device, "supportsUnalignedVertexFetch"))
    {
      v10 = *(_QWORD *)(v9 + 152);
      if (v10)
      {
        v11 = (uint64_t *)(v9 + 160);
        do
        {
          v12 = *v11;
          v11 += 2;
          *((_BYTE *)v54 + v12) = 1;
          --v10;
        }
        while (v10);
      }
    }
    device = self->super.super.super._device;
    v43 = objc_msgSend((id)objc_msgSend(v5, "vertexFunction"), "name");
    v40 = (void *)objc_msgSend((id)objc_msgSend((id)self->_peakPerSampleStorage, "reflection"), "vertexArguments");
    -[MTLToolsDevice maxVertexTextures](self->super.super.super._device, "maxVertexTextures");
    -[MTLToolsDevice maxVertexSamplers](self->super.super.super._device, "maxVertexSamplers");
    validateFunctionArguments(device, (uint64_t)CFSTR("Vertex"), v43, v40, (uint64_t)&self->_vertexBuffers[0].type, (uint64_t)&self->_vertexTextures[0].type, (uint64_t)&self->_vertexSamplers[0].type, 0, 0, 0, 0, self->_commandBuffer, v51, (uint64_t)&self->_threadgroupMemoryArguments[0].type, -[MTLToolsDevice maxComputeLocalMemorySizes](self->super.super.super._device, "maxComputeLocalMemorySizes"), 1, (uint64_t)v54, (uint64_t)v52, LOBYTE(self->_depthBias));
  }
  if ((v3 & 2) != 0 && (self->_openGLModeEnabled & 0x70) != 0)
  {
    v47 = self->super.super.super._device;
    v13 = (void *)objc_msgSend(v5, "fragmentFunction");
    if (!v13)
      v13 = (void *)objc_msgSend((id)objc_msgSend((id)self->_peakPerSampleStorage, "meshDescriptor"), "fragmentFunction");
    v44 = objc_msgSend(v13, "name");
    v41 = (void *)objc_msgSend((id)objc_msgSend((id)self->_peakPerSampleStorage, "reflection"), "fragmentArguments");
    -[MTLToolsDevice maxFragmentBuffers](self->super.super.super._device, "maxFragmentBuffers");
    -[MTLToolsDevice maxFragmentTextures](self->super.super.super._device, "maxFragmentTextures");
    -[MTLToolsDevice maxFragmentSamplers](self->super.super.super._device, "maxFragmentSamplers");
    validateFunctionArguments(v47, (uint64_t)CFSTR("Fragment"), v44, v41, (uint64_t)&self->_fragmentBuffers[0].type, (uint64_t)&self->_fragmentTextures[0].type, (uint64_t)&self->_fragmentSamplers[0].type, (void *)objc_msgSend((id)self->_frontFacingWinding, "colorAttachments"), (void *)objc_msgSend((id)objc_msgSend((id)self->_peakPerSampleStorage, "descriptor"), "colorAttachments"), objc_msgSend((id)self->_frontFacingWinding, "renderTargetArrayLength"), v50, self->_commandBuffer, v51, (uint64_t)&self->_threadgroupMemoryArguments[0].type, -[MTLToolsDevice maxComputeLocalMemorySizes](self->super.super.super._device, "maxComputeLocalMemorySizes"), 1, 0, (uint64_t)v52, LOBYTE(self->_depthBias));
  }
  if ((v3 & 8) != 0)
  {
    if ((*(&self->_openGLModeEnabled + 1) & 7) != 0)
    {
      v48 = self->super.super.super._device;
      v45 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)self->_peakPerSampleStorage, "meshDescriptor"), "objectFunction"), "name");
      v42 = (void *)objc_msgSend((id)objc_msgSend((id)self->_peakPerSampleStorage, "reflection"), "objectArguments");
      -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers");
      -[MTLToolsDevice maxComputeTextures](self->super.super.super._device, "maxComputeTextures");
      -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers");
      validateFunctionArguments(v48, (uint64_t)CFSTR("Object"), v45, v42, (uint64_t)&self->_objectBuffers[0].type, (uint64_t)&self->_objectTextures[0].type, (uint64_t)&self->_objectSamplers[0].type, 0, 0, 0, 0, self->_commandBuffer, v51, (uint64_t)&self->_objectThreadgroupMemoryLengths[0].type, -[MTLToolsDevice maxComputeLocalMemorySizes](self->super.super.super._device, "maxComputeLocalMemorySizes"), 0, 0, (uint64_t)v52, LOBYTE(self->_depthBias));
    }
    objc_msgSend((id)self->_peakPerSampleStorage, "_validateThreadgroupSize:stage:context:", &self->_objectThreadsPerTG.height, 8, v52);
  }
  if ((v3 & 0x10) != 0)
  {
    if ((*(&self->_openGLModeEnabled + 1) & 0x70) != 0)
    {
      v49 = self->super.super.super._device;
      v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)self->_peakPerSampleStorage, "meshDescriptor"), "meshFunction"), "name");
      v15 = (void *)objc_msgSend((id)objc_msgSend((id)self->_peakPerSampleStorage, "reflection"), "meshArguments");
      -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers");
      -[MTLToolsDevice maxComputeTextures](self->super.super.super._device, "maxComputeTextures");
      -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers");
      validateFunctionArguments(v49, (uint64_t)CFSTR("Mesh"), v14, v15, (uint64_t)&self->_meshBuffers[0].type, (uint64_t)&self->_meshTextures[0].type, (uint64_t)&self->_meshSamplers[0].type, 0, 0, 0, 0, self->_commandBuffer, v51, 0, 0, 0, 0, (uint64_t)v52, LOBYTE(self->_depthBias));
    }
    objc_msgSend((id)self->_peakPerSampleStorage, "_validateThreadgroupSize:stage:context:", &self->_meshThreadsPerTG.height, 16, v52);
    if ((objc_msgSend((id)self->_peakPerSampleStorage, "isMeshShaderPipeline") & 1) == 0)
      _MTLMessageContextPush_();
  }
  v16 = objc_msgSend((id)objc_msgSend((id)self->_peakPerSampleStorage, "descriptor"), "maxVertexAmplificationCount");
  v17 = (void *)objc_msgSend((id)self->_peakPerSampleStorage, "meshDescriptor");
  if (v17)
    v16 = objc_msgSend(v17, "maxVertexAmplificationCount");
  first = self->_updatedFences.__map_.__first_;
  if (!first || v16 && v16 < (unint64_t)first)
  {
    v37 = self->_updatedFences.__map_.__first_;
    v39 = v16;
    _MTLMessageContextPush_();
  }
  frontFacingWinding = (void *)self->_frontFacingWinding;
  v20 = (void *)-[MTLDepthStencilDescriptor descriptor](self->_defaultDepthStencilDescriptor, "descriptor", v37, v39);
  if (v20)
  {
    v21 = v20;
    if (objc_msgSend(v20, "depthCompareFunction") != 7
      && objc_msgSend(v21, "depthCompareFunction")
      && !objc_msgSend((id)objc_msgSend(frontFacingWinding, "depthAttachment"), "texture"))
    {
      _MTLMessageContextPush_();
    }
    if (objc_msgSend(v21, "isDepthWriteEnabled")
      && !objc_msgSend((id)objc_msgSend(frontFacingWinding, "depthAttachment"), "texture"))
    {
      _MTLMessageContextPush_();
    }
    if (usesStencilTexture((MTLStencilDescriptor *)objc_msgSend(v21, "frontFaceStencil"))
      && !objc_msgSend((id)objc_msgSend(frontFacingWinding, "stencilAttachment"), "texture"))
    {
      _MTLMessageContextPush_();
    }
    if (usesStencilTexture((MTLStencilDescriptor *)objc_msgSend(v21, "backFaceStencil"))
      && !objc_msgSend((id)objc_msgSend(frontFacingWinding, "stencilAttachment"), "texture"))
    {
      _MTLMessageContextPush_();
    }
  }
  _MTLMessageContextEnd();
  LODWORD(self->_visibilityOffsets) = (uint64_t)self->_visibilityOffsets & 0x7FFF0001 | 0xFFFE;
  if (self->_openGLModeEnabled < 0)
  {
    v22 = objc_msgSend((id)self->_frontFacingWinding, "renderTargetArrayLength");
    v23 = (void *)objc_msgSend((id)objc_msgSend((id)self->_peakPerSampleStorage, "descriptor"), "colorAttachments");
    if (!v23)
      v23 = (void *)objc_msgSend((id)objc_msgSend((id)self->_peakPerSampleStorage, "meshDescriptor"), "colorAttachments");
    for (i = 0; i != 8; ++i)
    {
      v25 = (void *)objc_msgSend((id)objc_msgSend((id)self->_frontFacingWinding, "colorAttachments"), "_descriptorAtIndex:", i);
      if (v25)
      {
        v26 = v25;
        if (objc_msgSend(v25, "texture"))
        {
          if (objc_msgSend(v26, "storeAction") == 1
            && objc_msgSend((id)objc_msgSend(v23, "objectAtIndexedSubscript:", i), "writeMask"))
          {
            v27 = -[MTLDebugRenderTargetAttachmentInfo initWithDesc:renderTargetArrayLength:]([MTLDebugRenderTargetAttachmentInfo alloc], "initWithDesc:renderTargetArrayLength:", objc_msgSend(v26, "_descriptorPrivate"), v22);
            -[MTLDebugCommandBuffer addObject:](self->_commandBuffer, "addObject:", v27);

          }
        }
      }
    }
    v28 = (void *)objc_msgSend((id)objc_msgSend((id)self->_frontFacingWinding, "colorAttachments"), "_descriptorAtIndex:", 8);
    v29 = v28;
    if (v28 && objc_msgSend(v28, "texture"))
    {
      v30 = objc_msgSend(v29, "storeAction") != 1 || v50 == 0;
      if (!v30 && objc_msgSend(v50, "isDepthWriteEnabled"))
      {
        v31 = -[MTLDebugRenderTargetAttachmentInfo initWithDesc:renderTargetArrayLength:]([MTLDebugRenderTargetAttachmentInfo alloc], "initWithDesc:renderTargetArrayLength:", objc_msgSend(v29, "_descriptorPrivate"), v22);
        -[MTLDebugCommandBuffer addObject:](self->_commandBuffer, "addObject:", v31);

      }
    }
    v32 = (void *)objc_msgSend((id)objc_msgSend((id)self->_frontFacingWinding, "colorAttachments"), "_descriptorAtIndex:", 9);
    if (v32)
    {
      v33 = v32;
      if (objc_msgSend(v32, "texture"))
      {
        if (objc_msgSend(v33, "storeAction") == 1)
        {
          v34 = objc_msgSend(v33, "texture");
          if (v34 != objc_msgSend(v29, "texture")
            && v50
            && (writesStencilTexture((MTLStencilDescriptor *)objc_msgSend(v50, "backFaceStencil"))
             || writesStencilTexture((MTLStencilDescriptor *)objc_msgSend(v50, "frontFaceStencil"))))
          {
            v35 = -[MTLDebugRenderTargetAttachmentInfo initWithDesc:renderTargetArrayLength:]([MTLDebugRenderTargetAttachmentInfo alloc], "initWithDesc:renderTargetArrayLength:", objc_msgSend(v33, "_descriptorPrivate"), v22);
            -[MTLDebugCommandBuffer addObject:](self->_commandBuffer, "addObject:", v35);

          }
        }
      }
    }
    objc_msgSend((id)self->_maxVertexBuffers, "addActiveRenderTargets:", self->_commandBuffer);
  }
  *(_DWORD *)&self->_openGLModeEnabled = 0;
}

- (void)_validateAllFunctionArguments:(_MTLMessageContext *)a3
{
  unint64_t v5;
  unint64_t *p_type;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t *v32;

  v5 = 0;
  p_type = &self->_vertexBuffers[0].type;
  do
  {
    validateArg(MTLArgumentTypeBuffer, v5++, (MTLDebugFunctionArgument *)p_type, a3);
    p_type += 11;
  }
  while (v5 != 36);
  v7 = 0;
  v8 = &self->_vertexTextures[0].type;
  do
  {
    validateArg(MTLArgumentTypeTexture, v7++, (MTLDebugFunctionArgument *)v8, a3);
    v8 += 11;
  }
  while (v7 != 128);
  v9 = 0;
  v10 = &self->_vertexSamplers[0].type;
  do
  {
    validateArg(MTLArgumentTypeSampler, v9++, (MTLDebugFunctionArgument *)v10, a3);
    v10 += 11;
  }
  while (v9 != 16);
  v11 = 0;
  v12 = &self->_fragmentBuffers[0].type;
  do
  {
    validateArg(MTLArgumentTypeBuffer, v11++, (MTLDebugFunctionArgument *)v12, a3);
    v12 += 11;
  }
  while (v11 != 31);
  v13 = 0;
  v14 = &self->_fragmentTextures[0].type;
  do
  {
    validateArg(MTLArgumentTypeTexture, v13++, (MTLDebugFunctionArgument *)v14, a3);
    v14 += 11;
  }
  while (v13 != 128);
  v15 = 0;
  v16 = &self->_fragmentSamplers[0].type;
  do
  {
    validateArg(MTLArgumentTypeSampler, v15++, (MTLDebugFunctionArgument *)v16, a3);
    v16 += 11;
  }
  while (v15 != 16);
  v17 = 0;
  v18 = &self->_threadgroupMemoryArguments[0].type;
  do
  {
    validateArg(MTLArgumentTypeThreadgroupMemory, v17++, (MTLDebugFunctionArgument *)v18, a3);
    v18 += 11;
  }
  while (v17 != 31);
  v19 = 0;
  v20 = &self->_objectBuffers[0].type;
  do
  {
    validateArg(MTLArgumentTypeBuffer, v19++, (MTLDebugFunctionArgument *)v20, a3);
    v20 += 11;
  }
  while (v19 != 31);
  v21 = 0;
  v22 = &self->_objectTextures[0].type;
  do
  {
    validateArg(MTLArgumentTypeTexture, v21++, (MTLDebugFunctionArgument *)v22, a3);
    v22 += 11;
  }
  while (v21 != 128);
  v23 = 0;
  v24 = &self->_objectSamplers[0].type;
  do
  {
    validateArg(MTLArgumentTypeSampler, v23++, (MTLDebugFunctionArgument *)v24, a3);
    v24 += 11;
  }
  while (v23 != 16);
  v25 = 0;
  v26 = &self->_objectThreadgroupMemoryLengths[0].type;
  do
  {
    validateArg(MTLArgumentTypeThreadgroupMemory, v25++, (MTLDebugFunctionArgument *)v26, a3);
    v26 += 11;
  }
  while (v25 != 31);
  v27 = 0;
  v28 = &self->_meshBuffers[0].type;
  do
  {
    validateArg(MTLArgumentTypeBuffer, v27++, (MTLDebugFunctionArgument *)v28, a3);
    v28 += 11;
  }
  while (v27 != 31);
  v29 = 0;
  v30 = &self->_meshTextures[0].type;
  do
  {
    validateArg(MTLArgumentTypeTexture, v29++, (MTLDebugFunctionArgument *)v30, a3);
    v30 += 11;
  }
  while (v29 != 128);
  v31 = 0;
  v32 = &self->_meshSamplers[0].type;
  do
  {
    validateArg(MTLArgumentTypeSampler, v31++, (MTLDebugFunctionArgument *)v32, a3);
    v32 += 11;
  }
  while (v31 != 16);
}

- (void)validateDrawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 function:(const char *)a7
{
  unint64_t v12;

  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled())
  {
    if (a5 <= 1)
      v12 = 1;
    else
      v12 = a5;
    -[MTLDebugRenderCommandEncoder validateCommonDrawErrors:instanceCount:baseInstance:maxVertexID:](self, "validateCommonDrawErrors:instanceCount:baseInstance:maxVertexID:", a3, a6, 0, a4 + v12 - 1);
    -[MTLToolsObject device](self, "device");
    _MTLMessageContextBegin_();
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)self->_peakPerSampleStorage, "descriptor"), "vertexFunction"), "patchType"))
    {
      _MTLMessageContextPush_();
    }
    _MTLMessageContextEnd();
  }
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6
{
  -[MTLDebugRenderCommandEncoder validateDrawPrimitives:vertexStart:vertexCount:instanceCount:function:](self, "validateDrawPrimitives:vertexStart:vertexCount:instanceCount:function:", a3, a4, a5, a6, "-[MTLDebugRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:instanceCount:]");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:vertexStart:vertexCount:instanceCount:", a3, a4, a5, a6);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  -[MTLDebugRenderCommandEncoder validateDrawPrimitives:vertexStart:vertexCount:instanceCount:function:](self, "validateDrawPrimitives:vertexStart:vertexCount:instanceCount:function:", a3, a4, a5, 1, "-[MTLDebugRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:]");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:vertexStart:vertexCount:", a3, a4, a5);
}

- (void)validateDrawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 function:(const char *)a9
{
  char v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled())
  {
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
    v18 = 0u;
    -[MTLToolsObject device](self, "device");
    _MTLMessageContextBegin_();
    _MTLDebugValidateIndexBufferWithContext((uint64_t)self->super.super.super._device, a5, a6, (uint64_t)"indexBuffer", a7, 1, a4, (uint64_t *)&v18);
    if (a5)
    {
      if (a5 == 1)
      {
        v16 = 32;
      }
      else
      {
        _MTLMessageContextPush_();
        v16 = 0;
      }
    }
    else
    {
      v16 = 16;
    }
    v17 = ~(-1 << v16);
    _MTLMessageContextEnd();
    -[MTLDebugRenderCommandEncoder validateCommonDrawErrors:instanceCount:baseInstance:maxVertexID:](self, "validateCommonDrawErrors:instanceCount:baseInstance:maxVertexID:", a3, a8, 0, v17);
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
    v18 = 0u;
    -[MTLToolsObject device](self, "device");
    _MTLMessageContextBegin_();
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)self->_peakPerSampleStorage, "descriptor"), "vertexFunction"), "patchType"))
    {
      _MTLMessageContextPush_();
    }
    _MTLMessageContextEnd();
  }
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8
{
  -[MTLDebugRenderCommandEncoder validateDrawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:function:](self, "validateDrawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:function:", "-[MTLDebugRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:]");
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a6, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7, a8);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7
{
  -[MTLDebugRenderCommandEncoder validateDrawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:function:](self, "validateDrawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:function:", a3, a4, a5, a6, a7, 1, "-[MTLDebugRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:]");
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a6, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  unint64_t v13;
  const char *v14;

  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled())
  {
    -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
    MTLValidateFeatureSupport();
    if (a5 <= 1)
      v13 = 1;
    else
      v13 = a5;
    -[MTLDebugRenderCommandEncoder validateCommonDrawErrors:instanceCount:baseInstance:maxVertexID:](self, "validateCommonDrawErrors:instanceCount:baseInstance:maxVertexID:", a3, a6, a7, a4 + v13 - 1);
    -[MTLToolsObject device](self, "device");
    _MTLMessageContextBegin_();
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)self->_peakPerSampleStorage, "descriptor"), "vertexFunction"), "patchType"))
    {
      v14 = "-[MTLDebugRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:]";
      _MTLMessageContextPush_();
    }
    _MTLMessageContextEnd();
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v14), "drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:", a3, a4, a5, a6, a7);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  char v17;
  uint64_t v18;
  const char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled())
  {
    -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
    MTLValidateFeatureSupport();
    v23 = 0;
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
    -[MTLToolsObject device](self, "device");
    _MTLMessageContextBegin_();
    _MTLDebugValidateIndexBufferWithContext((uint64_t)self->super.super.super._device, a5, a6, (uint64_t)"indexBuffer", a7, 1, a4, (uint64_t *)&v20);
    if (a5)
    {
      if (a5 == 1)
      {
        v17 = 32;
      }
      else
      {
        _MTLMessageContextPush_();
        v17 = 0;
      }
    }
    else
    {
      v17 = 16;
    }
    v18 = ~(-1 << v17);
    _MTLMessageContextEnd();
    -[MTLDebugRenderCommandEncoder validateCommonDrawErrors:instanceCount:baseInstance:maxVertexID:](self, "validateCommonDrawErrors:instanceCount:baseInstance:maxVertexID:", a3, a8, a10, v18);
    v23 = 0;
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
    -[MTLToolsObject device](self, "device");
    _MTLMessageContextBegin_();
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)self->_peakPerSampleStorage, "descriptor"), "vertexFunction"), "patchType"))
    {
      v19 = "-[MTLDebugRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:inst"
            "anceCount:baseVertex:baseInstance:]";
      _MTLMessageContextPush_();
    }
    _MTLMessageContextEnd();
  }
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a6, 1, 1, v19);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7, a8, a9, a10);
}

- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  const char *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled())
  {
    -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
    MTLValidateFeatureSupport();
    v13 = 0;
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
    -[MTLToolsObject device](self, "device");
    _MTLMessageContextBegin_();
    validateIndirectBuffer((uint64_t)self->super.super.super._device, a4, a5, 16, (uint64_t)"sizeof(MTLDrawPrimitivesIndirectArguments)", (uint64_t *)&v10);
    _MTLMessageContextEnd();
    -[MTLDebugRenderCommandEncoder validateCommonDrawErrors:instanceCount:baseInstance:maxVertexID:](self, "validateCommonDrawErrors:instanceCount:baseInstance:maxVertexID:", a3, 1, 0, 1);
    v13 = 0;
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
    -[MTLToolsObject device](self, "device");
    _MTLMessageContextBegin_();
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)self->_peakPerSampleStorage, "descriptor"), "vertexFunction"), "patchType"))
    {
      v9 = "-[MTLDebugRenderCommandEncoder drawPrimitives:indirectBuffer:indirectBufferOffset:]";
      _MTLMessageContextPush_();
    }
    _MTLMessageContextEnd();
  }
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a4, 1, 1, v9);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:indirectBuffer:indirectBufferOffset:", a3, objc_msgSend(a4, "baseObject"), a5);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8
{
  char v15;
  uint64_t v16;
  const char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled())
  {
    -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
    MTLValidateFeatureSupport();
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
    v18 = 0u;
    -[MTLToolsObject device](self, "device");
    _MTLMessageContextBegin_();
    validateIndirectBuffer((uint64_t)self->super.super.super._device, a7, a8, 20, (uint64_t)"sizeof(MTLDrawIndexedPrimitivesIndirectArguments)", (uint64_t *)&v18);
    _MTLDebugValidateIndexBufferWithContext((uint64_t)self->super.super.super._device, a4, a5, (uint64_t)"indexBuffer", a6, 0, 0, (uint64_t *)&v18);
    if (a4)
    {
      if (a4 == 1)
      {
        v15 = 32;
      }
      else
      {
        _MTLMessageContextPush_();
        v15 = 0;
      }
    }
    else
    {
      v15 = 16;
    }
    v16 = ~(-1 << v15);
    _MTLMessageContextEnd();
    -[MTLDebugRenderCommandEncoder validateCommonDrawErrors:instanceCount:baseInstance:maxVertexID:](self, "validateCommonDrawErrors:instanceCount:baseInstance:maxVertexID:", a3, 1, 0, v16);
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
    v18 = 0u;
    -[MTLToolsObject device](self, "device");
    _MTLMessageContextBegin_();
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)self->_peakPerSampleStorage, "descriptor"), "vertexFunction"), "patchType"))
    {
      v17 = "-[MTLDebugRenderCommandEncoder drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:"
            "indirectBufferOffset:]";
      _MTLMessageContextPush_();
    }
    _MTLMessageContextEnd();
  }
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a5, 1, 1, v17);
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a7, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, a4, objc_msgSend(a5, "baseObject"), a6, objc_msgSend(a7, "baseObject"), a8);
}

- (void)setObjectBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unint64_t *p_type;
  unint64_t v10;
  unint64_t v11;
  _MTLMessageContext v12;

  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  memset(&v12, 0, sizeof(v12));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers") <= a5)
  {
    v10 = a5;
    v11 = -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers");
    _MTLMessageContextPush_();
  }
  if (-[MTLToolsDevice maxComputeInlineDataSize](self->super.super.super._device, "maxComputeInlineDataSize", v10, v11) < a4)
  {
    -[MTLToolsDevice maxComputeInlineDataSize](self->super.super.super._device, "maxComputeInlineDataSize");
    _MTLMessageContextPush_();
  }
  if (a5 <= 0x1E)
    validateArg(MTLArgumentTypeBuffer, a5, (MTLDebugFunctionArgument *)&self->_objectBuffers[a5].type, &v12);
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectBytes:length:atIndex:", a3, a4, a5);
  MTLReportFailureTypeEnabled();
  p_type = &self->_objectBuffers[a5].type;
  *(_BYTE *)p_type = a4 != 0;
  *((_BYTE *)p_type + 1) = 0;
  p_type[1] = 0;
  p_type[2] = 0;
  p_type[3] = 0;
  p_type[4] = a4;
  *(_OWORD *)(p_type + 5) = xmmword_22CEAB6E0;
  p_type[7] = 0;
  p_type[8] = 0;
  *((_BYTE *)p_type + 72) = 0;
  *((_DWORD *)p_type + 19) = 0;
  *((_DWORD *)p_type + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x100u;
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MTLToolsDevice *device;
  unint64_t v10;
  unint64_t *p_type;
  unint64_t *v12;
  unint64_t *v13;
  _MTLMessageContext v14;

  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  memset(&v14, 0, sizeof(v14));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers") > a5)
  {
    if (a3)
      goto LABEL_5;
LABEL_12:
    if (!a4)
      goto LABEL_13;
    goto LABEL_10;
  }
  -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers");
  _MTLMessageContextPush_();
  if (!a3)
    goto LABEL_12;
LABEL_5:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_10:
    _MTLMessageContextPush_();
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    _MTLMessageContextPush_();
  v10 = *((_QWORD *)a3 + 8);
  if (v10 <= a4)
    _MTLMessageContextPush_();
LABEL_14:
  if (a5 <= 0x1E)
    validateArg(MTLArgumentTypeBuffer, a5, (MTLDebugFunctionArgument *)&self->_objectBuffers[a5].type, &v14);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
  p_type = &self->_objectBuffers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    if (a3)
    {
      v12 = &p_type[11 * a5];
      if (!*((_BYTE *)v12 + 72)
        && v12[6] == -1
        && v12[5] == a4
        && v12[4] == v10
        && (id)v12[2] == a3
        && !(v12[3] | v12[1])
        && *(_OWORD *)(v12 + 7) == 0
        && !*(unint64_t *)((char *)v12 + 76))
      {
        MTLReportFailure();
      }
    }
  }
  v13 = &p_type[11 * a5];
  *(_BYTE *)v13 = v10 != 0;
  *((_BYTE *)v13 + 1) = 0;
  v13[1] = 0;
  v13[2] = (unint64_t)a3;
  v13[3] = 0;
  v13[4] = v10;
  v13[5] = a4;
  v13[6] = -1;
  v13[7] = 0;
  v13[8] = 0;
  *((_BYTE *)v13 + 72) = 0;
  *((_DWORD *)v13 + 19) = 0;
  *((_DWORD *)v13 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x100u;
}

- (void)setObjectBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  MTLDebugFunctionArgument *p_type;
  baseLevel *v8;
  id *p_object;
  baseLevel *object;
  unint64_t *v11;
  unint64_t *v12;
  void *v13;
  void **v14;
  void *v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t *v18;
  _MTLMessageContext v19;

  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  memset(&v19, 0, sizeof(v19));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers") <= a4)
  {
    -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers");
    _MTLMessageContextPush_();
  }
  if (a4 <= 0x1E)
  {
    p_type = (MTLDebugFunctionArgument *)&self->_objectBuffers[a4].type;
    validateArg(MTLArgumentTypeBuffer, a4, p_type, &v19);
    object = p_type->object;
    p_object = (id *)&p_type->object;
    v8 = object;
    if (!object)
    {
LABEL_9:
      _MTLMessageContextPush_();
      goto LABEL_10;
    }
    if (-[baseLevel length](v8, "length") <= a3)
    {
      objc_msgSend(*p_object, "length");
      goto LABEL_9;
    }
  }
LABEL_10:
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectBufferOffset:atIndex:", a3, a4);
  v11 = &self->_objectBuffers[0].type;
  v12 = &self->_objectBuffers[a4].type;
  v15 = (void *)v12[2];
  v14 = (void **)(v12 + 2);
  v13 = v15;
  v16 = objc_msgSend(v15, "length");
  if (MTLReportFailureTypeEnabled())
  {
    if (v13)
    {
      v17 = &v11[11 * a4];
      if (!*((_BYTE *)v17 + 72)
        && v17[6] == -1
        && v17[5] == a3
        && v17[4] == v16
        && *v14 == v13
        && !(v17[3] | v17[1])
        && *(_OWORD *)(v17 + 7) == 0
        && !*(unint64_t *)((char *)v17 + 76))
      {
        MTLReportFailure();
      }
    }
  }
  v18 = &v11[11 * a4];
  *(_BYTE *)v18 = v16 != 0;
  *((_BYTE *)v18 + 1) = 0;
  v18[1] = 0;
  v18[2] = (unint64_t)v13;
  v18[3] = 0;
  v18[4] = v16;
  v18[5] = a3;
  v18[6] = -1;
  v18[7] = 0;
  v18[8] = 0;
  *((_BYTE *)v18 + 72) = 0;
  *((_DWORD *)v18 + 19) = 0;
  *((_DWORD *)v18 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x100u;
}

- (void)setObjectBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  MTLDebugRenderCommandEncoder *v8;
  const void *v9;
  char *v10;
  MTLToolsDevice *device;
  uint64_t v12;
  _QWORD *v13;
  const unint64_t *v14;
  uint64_t v15;
  MTLDebugRenderCommandEncoder *v16;
  uint64_t v17;
  const void *v18;
  unint64_t v19;
  BOOL v20;
  const void *v27;
  uint64_t v28;
  const void *v29;
  uint64_t v30;
  NSUInteger v31;
  NSUInteger v32;
  _MTLMessageContext v34;
  _BYTE v35[248];
  uint64_t v36;

  length = a5.length;
  location = a5.location;
  v8 = self;
  v36 = *MEMORY[0x24BDAC8D0];
  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  memset(&v34, 0, sizeof(v34));
  -[MTLToolsObject device](v8, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(v8->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length > -[MTLToolsDevice maxComputeBuffers](v8->super.super.super._device, "maxComputeBuffers"))
  {
    v27 = (const void *)(location + length);
    v28 = -[MTLToolsDevice maxComputeBuffers](v8->super.super.super._device, "maxComputeBuffers");
    _MTLMessageContextPush_();
  }
  v31 = location;
  v32 = length;
  if (!length)
  {
    _MTLMessageContextEnd();
    goto LABEL_52;
  }
  v9 = 0;
  v10 = (char *)v8 + 88 * location;
  do
  {
    if (!a3[(_QWORD)v9])
    {
      if (!a4[(_QWORD)v9])
        goto LABEL_17;
      v27 = v9;
      v28 = a4[(_QWORD)v9];
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v27 = v9;
      goto LABEL_16;
    }
    device = v8->super.super.super._device;
    if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v9], "device"))
    {
      v27 = v9;
      _MTLMessageContextPush_();
    }
    if (a4[(_QWORD)v9] >= *((_QWORD *)a3[(_QWORD)v9] + 8))
    {
      v29 = v9;
      v30 = *((_QWORD *)a3[(_QWORD)v9] + 8);
      v27 = v9;
      v28 = a4[(_QWORD)v9];
LABEL_16:
      _MTLMessageContextPush_();
    }
LABEL_17:
    if ((unint64_t)v9 + location <= 0x1E)
      validateArg(MTLArgumentTypeBuffer, (unint64_t)v9 + location, (MTLDebugFunctionArgument *)(v10 + 49616), &v34);
    v9 = (char *)v9 + 1;
    v10 += 88;
  }
  while ((const void *)length != v9);
  _MTLMessageContextEnd();
  v12 = (uint64_t)(&v8->super.super._commandBuffer + 11 * location);
  v13 = v35;
  v14 = a4;
  do
  {
    if (*a3)
      v15 = *((_QWORD *)*a3 + 8);
    else
      v15 = 0;
    v16 = v8;
    objc_msgSend((id)v8->_maxVertexBuffers, "addObject:retained:purgeable:", v27, v28, v29, v30);
    *v13 = objc_msgSend((id)*a3, "baseObject");
    v17 = v12 + 49616;
    v18 = *a3;
    v19 = *v14;
    if (MTLReportFailureTypeEnabled() && v18)
    {
      if (*(_BYTE *)(v12 + 49648))
        v20 = 0;
      else
        v20 = *(_QWORD *)(v12 + 49624) == -1;
      if (v20
        && *(_QWORD *)v17 == v19
        && *(_QWORD *)(v12 + 49608) == v15
        && *(_QWORD *)(v12 + 49592) == (_QWORD)v18
        && (*(_QWORD *)(v12 + 49600) | *(_QWORD *)(v12 + 49584)) == 0
        && *(_OWORD *)(v12 + 49632) == 0
        && *(_QWORD *)(v12 + 49652) == 0)
      {
        v27 = v18;
        MTLReportFailure();
      }
    }
    *(_BYTE *)(v12 + 49576) = v15 != 0;
    *(_BYTE *)(v12 + 49577) = 0;
    *(_QWORD *)(v12 + 49584) = 0;
    *(_QWORD *)(v12 + 49592) = v18;
    *(_QWORD *)(v12 + 49600) = 0;
    *(_QWORD *)(v12 + 49608) = v15;
    *(_QWORD *)v17 = v19;
    *(_QWORD *)(v12 + 49624) = -1;
    *(_QWORD *)(v12 + 49632) = 0;
    *(_QWORD *)(v12 + 49640) = 0;
    *(_BYTE *)(v12 + 49648) = 0;
    v12 += 88;
    ++v14;
    ++v13;
    ++a3;
    *(_DWORD *)(v17 + 36) = 0;
    *(_DWORD *)(v17 + 40) = 0;
    --length;
    v8 = v16;
  }
  while (length);
LABEL_52:
  objc_msgSend(-[MTLToolsObject baseObject](v8, "baseObject", v27), "setObjectBuffers:offsets:withRange:", v35, a4, v31, v32);
  *(_DWORD *)&v8->_openGLModeEnabled |= 0x100u;
}

- (void)setObjectTexture:(id)a3 atIndex:(unint64_t)a4
{
  MTLToolsDevice *device;
  unint64_t *p_type;
  unint64_t *v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  _MTLMessageContext v13;

  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  memset(&v13, 0, sizeof(v13));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxComputeTextures](self->super.super.super._device, "maxComputeTextures") <= a4)
  {
    v11 = a4;
    v12 = -[MTLToolsDevice maxComputeTextures](self->super.super.super._device, "maxComputeTextures");
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_10;
  }
  else if (!a3)
  {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    _MTLMessageContextPush_();
  if (objc_msgSend(a3, "storageMode", v11, v12) == 3)
LABEL_9:
    _MTLMessageContextPush_();
LABEL_10:
  if (a4 <= 0x7F)
    validateArg(MTLArgumentTypeTexture, a4, (MTLDebugFunctionArgument *)&self->_objectTextures[a4].type, &v13);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  p_type = &self->_objectTextures[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    v9 = &p_type[11 * a4];
    if (!*((_BYTE *)v9 + 72)
      && v9[6] == -1
      && v9[1] == 1
      && (id)v9[2] == a3
      && !(v9[4] | v9[3] | v9[5])
      && *(_OWORD *)(v9 + 7) == 0
      && !*(unint64_t *)((char *)v9 + 76))
    {
      MTLReportFailure();
    }
  }
  v10 = &p_type[11 * a4];
  *(_BYTE *)v10 = a3 != 0;
  *((_BYTE *)v10 + 1) = 0;
  v10[1] = 1;
  v10[2] = (unint64_t)a3;
  v10[3] = 0;
  v10[4] = 0;
  v10[5] = 0;
  v10[6] = -1;
  v10[7] = 0;
  v10[8] = 0;
  *((_BYTE *)v10 + 72) = 0;
  *((_DWORD *)v10 + 19) = 0;
  *((_DWORD *)v10 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x200u;
}

- (void)setObjectTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void *v8;
  char *v9;
  MTLToolsDevice *device;
  char *v11;
  _QWORD *v12;
  NSUInteger v13;
  const void *v14;
  BOOL v15;
  char *v21;
  const void *v22;
  unint64_t v23;
  _MTLMessageContext v24;
  _BYTE v25[1024];
  uint64_t v26;

  length = a4.length;
  location = a4.location;
  v26 = *MEMORY[0x24BDAC8D0];
  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  memset(&v24, 0, sizeof(v24));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length <= -[MTLToolsDevice maxComputeTextures](self->super.super.super._device, "maxComputeTextures"))
  {
    if (length)
      goto LABEL_5;
LABEL_40:
    _MTLMessageContextEnd();
    goto LABEL_41;
  }
  v22 = (const void *)(location + length);
  v23 = -[MTLToolsDevice maxComputeTextures](self->super.super.super._device, "maxComputeTextures");
  _MTLMessageContextPush_();
  if (!length)
    goto LABEL_40;
LABEL_5:
  v8 = 0;
  v9 = (char *)self + 88 * location;
  do
  {
    if (a3[(_QWORD)v8])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_11;
      device = self->super.super.super._device;
      if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v8], "device", CFSTR("textures[%lu] is not an MTLTexture.")))
      {
        v22 = v8;
        _MTLMessageContextPush_();
      }
      if (objc_msgSend((id)a3[(_QWORD)v8], "storageMode", v22, v23) == 3)
      {
LABEL_11:
        v22 = v8;
        _MTLMessageContextPush_();
      }
    }
    if ((unint64_t)v8 + location <= 0x7F)
      validateArg(MTLArgumentTypeTexture, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 52344), &v24);
    v8 = (char *)v8 + 1;
    v9 += 88;
  }
  while ((const void *)length != v8);
  _MTLMessageContextEnd();
  v11 = (char *)self + 88 * location;
  v12 = v25;
  v13 = length;
  do
  {
    objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 1, v22);
    *v12 = objc_msgSend((id)*a3, "baseObject");
    v14 = *a3;
    if (MTLReportFailureTypeEnabled())
    {
      if (v11[52416])
        v15 = 0;
      else
        v15 = *((_QWORD *)v11 + 6549) == -1;
      if (v15
        && *((_QWORD *)v11 + 6544) == 1
        && *((_QWORD *)v11 + 6545) == (_QWORD)v14
        && (*((_QWORD *)v11 + 6547) | *((_QWORD *)v11 + 6546) | *((_QWORD *)v11 + 6548)) == 0
        && *((_OWORD *)v11 + 3275) == 0
        && *(_QWORD *)(v11 + 52420) == 0)
      {
        v22 = v14;
        MTLReportFailure();
      }
    }
    v21 = v11 + 52344;
    v11[52344] = v14 != 0;
    v11[52345] = 0;
    *((_QWORD *)v11 + 6544) = 1;
    *((_QWORD *)v11 + 6545) = v14;
    *((_QWORD *)v11 + 6546) = 0;
    *((_QWORD *)v11 + 6547) = 0;
    *((_QWORD *)v11 + 6548) = 0;
    *((_QWORD *)v11 + 6549) = -1;
    *((_QWORD *)v11 + 6550) = 0;
    *((_QWORD *)v11 + 6551) = 0;
    v11[52416] = 0;
    v11 += 88;
    ++v12;
    ++a3;
    *((_DWORD *)v21 + 19) = 0;
    *((_DWORD *)v21 + 20) = 0;
    --v13;
  }
  while (v13);
LABEL_41:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setObjectTextures:withRange:", v25, location, length);
  *(_DWORD *)&self->_openGLModeEnabled |= 0x200u;
}

- (void)setObjectSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  MTLToolsDevice *device;
  unint64_t *p_type;
  unint64_t *v9;
  unint64_t *v10;
  _MTLMessageContext v11;

  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  memset(&v11, 0, sizeof(v11));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers") <= a4)
  {
    -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers");
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_8;
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)objc_msgSend(a3, "device")))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a4 <= 0xF)
    validateArg(MTLArgumentTypeSampler, a4, (MTLDebugFunctionArgument *)&self->_objectSamplers[a4].type, &v11);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 0);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectSamplerState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  p_type = &self->_objectSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    v9 = &p_type[11 * a4];
    if (!*((_BYTE *)v9 + 72)
      && v9[6] == -1
      && v9[1] == 2
      && (id)v9[2] == a3
      && !(v9[4] | v9[3] | v9[5])
      && *(_OWORD *)(v9 + 7) == 0
      && !*(unint64_t *)((char *)v9 + 76))
    {
      MTLReportFailure();
    }
  }
  v10 = &p_type[11 * a4];
  *(_BYTE *)v10 = a3 != 0;
  *((_BYTE *)v10 + 1) = 0;
  v10[1] = 2;
  v10[2] = (unint64_t)a3;
  v10[3] = 0;
  v10[4] = 0;
  v10[5] = 0;
  v10[6] = -1;
  v10[7] = 0;
  v10[8] = 0;
  *((_BYTE *)v10 + 72) = 0;
  *((_DWORD *)v10 + 19) = 0;
  *((_DWORD *)v10 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x400u;
}

- (void)setObjectSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void *v8;
  char *v9;
  MTLToolsDevice *device;
  char *v11;
  _QWORD *v12;
  NSUInteger v13;
  const void *v14;
  BOOL v15;
  char *v21;
  const void *v22;
  unint64_t v23;
  _MTLMessageContext v24;
  _BYTE v25[128];
  uint64_t v26;

  length = a4.length;
  location = a4.location;
  v26 = *MEMORY[0x24BDAC8D0];
  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  memset(&v24, 0, sizeof(v24));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length <= -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers"))
  {
    if (length)
      goto LABEL_5;
LABEL_38:
    _MTLMessageContextEnd();
    goto LABEL_39;
  }
  v22 = (const void *)(location + length);
  v23 = -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers");
  _MTLMessageContextPush_();
  if (!length)
    goto LABEL_38;
LABEL_5:
  v8 = 0;
  v9 = (char *)self + 88 * location;
  do
  {
    if (a3[(_QWORD)v8])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (device = self->super.super.super._device,
            device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v8], "device", CFSTR("samplers[%lu] is not an MTLSamplerState."))))
      {
        v22 = v8;
        _MTLMessageContextPush_();
      }
    }
    if ((unint64_t)v8 + location <= 0xF)
      validateArg(MTLArgumentTypeSampler, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 63608), &v24);
    v8 = (char *)v8 + 1;
    v9 += 88;
  }
  while ((const void *)length != v8);
  _MTLMessageContextEnd();
  v11 = (char *)self + 88 * location;
  v12 = v25;
  v13 = length;
  do
  {
    objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 0, v22, v23);
    *v12 = objc_msgSend((id)*a3, "baseObject");
    v14 = *a3;
    if (MTLReportFailureTypeEnabled())
    {
      if (v11[63680])
        v15 = 0;
      else
        v15 = *((_QWORD *)v11 + 7957) == -1;
      if (v15
        && *((_QWORD *)v11 + 7952) == 2
        && *((_QWORD *)v11 + 7953) == (_QWORD)v14
        && (*((_QWORD *)v11 + 7955) | *((_QWORD *)v11 + 7954) | *((_QWORD *)v11 + 7956)) == 0
        && *((_OWORD *)v11 + 3979) == 0
        && *(_QWORD *)(v11 + 63684) == 0)
      {
        v22 = v14;
        MTLReportFailure();
      }
    }
    v21 = v11 + 63608;
    v11[63608] = v14 != 0;
    v11[63609] = 0;
    *((_QWORD *)v11 + 7952) = 2;
    *((_QWORD *)v11 + 7953) = v14;
    *((_QWORD *)v11 + 7954) = 0;
    *((_QWORD *)v11 + 7955) = 0;
    *((_QWORD *)v11 + 7956) = 0;
    *((_QWORD *)v11 + 7957) = -1;
    *((_QWORD *)v11 + 7958) = 0;
    *((_QWORD *)v11 + 7959) = 0;
    v11[63680] = 0;
    v11 += 88;
    ++v12;
    ++a3;
    *((_DWORD *)v21 + 19) = 0;
    *((_DWORD *)v21 + 20) = 0;
    --v13;
  }
  while (v13);
LABEL_39:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setObjectSamplerStates:withRange:", v25, location, length);
  *(_DWORD *)&self->_openGLModeEnabled |= 0x400u;
}

- (void)setObjectSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  MTLToolsDevice *device;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  unint64_t *p_type;
  unint64_t *v17;
  unint64_t *v18;
  _MTLMessageContext v19;

  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  memset(&v19, 0, sizeof(v19));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers") <= a6)
  {
    -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers");
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_8;
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)objc_msgSend(a3, "device")))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a6 <= 0xF)
    validateArg(MTLArgumentTypeSampler, a6, (MTLDebugFunctionArgument *)&self->_objectSamplers[a6].type, &v19);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 0);
  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  v13 = objc_msgSend(a3, "baseObject");
  *(float *)&v14 = a4;
  *(float *)&v15 = a5;
  objc_msgSend(v12, "setObjectSamplerState:lodMinClamp:lodMaxClamp:atIndex:", v13, a6, v14, v15);
  p_type = &self->_objectSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    v17 = &p_type[11 * a6];
    if (*((_DWORD *)v17 + 20) == LODWORD(a5)
      && *((_DWORD *)v17 + 19) == LODWORD(a4)
      && *((_BYTE *)v17 + 72)
      && v17[6] == -1
      && v17[1] == 2
      && (id)v17[2] == a3
      && !(v17[4] | v17[3] | v17[5])
      && *(_OWORD *)(v17 + 7) == 0)
    {
      MTLReportFailure();
    }
  }
  v18 = &p_type[11 * a6];
  *(_BYTE *)v18 = a3 != 0;
  *((_BYTE *)v18 + 1) = 0;
  v18[1] = 2;
  v18[2] = (unint64_t)a3;
  v18[3] = 0;
  v18[4] = 0;
  v18[5] = 0;
  v18[6] = -1;
  v18[7] = 0;
  v18[8] = 0;
  *((_BYTE *)v18 + 72) = 1;
  *((float *)v18 + 19) = a4;
  *((float *)v18 + 20) = a5;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x400u;
}

- (void)setObjectSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  const void *v10;
  NSUInteger v11;
  char *v12;
  MTLToolsDevice *device;
  NSUInteger v14;
  uint64_t v15;
  _QWORD *v16;
  const float *v17;
  const float *v18;
  _DWORD *v19;
  const void *v20;
  int v21;
  int v22;
  const void *v30;
  unint64_t v31;
  NSUInteger v34;
  MTLDebugRenderCommandEncoder *v35;
  _MTLMessageContext v36;
  _BYTE v37[128];
  uint64_t v38;

  length = a6.length;
  location = a6.location;
  v38 = *MEMORY[0x24BDAC8D0];
  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  memset(&v36, 0, sizeof(v36));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length > -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers"))
  {
    v30 = (const void *)(location + length);
    v31 = -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers");
    _MTLMessageContextPush_();
  }
  v34 = length;
  v35 = self;
  if (length)
  {
    v10 = 0;
    v11 = location;
    v12 = (char *)self + 88 * location;
    do
    {
      if (a3[(_QWORD)v10])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (device = v35->super.super.super._device,
              device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v10], "device", CFSTR("samplers[%lu] is not an MTLSamplerState."))))
        {
          v30 = v10;
          _MTLMessageContextPush_();
        }
      }
      if ((unint64_t)v10 + location <= 0xF)
        validateArg(MTLArgumentTypeSampler, (unint64_t)v10 + location, (MTLDebugFunctionArgument *)(v12 + 63608), &v36);
      v10 = (char *)v10 + 1;
      v12 += 88;
    }
    while ((const void *)length != v10);
    _MTLMessageContextEnd();
    v14 = length;
    v15 = (uint64_t)&v35->_attachmentInfo[1] + 88 * location;
    v16 = v37;
    v18 = a4;
    v17 = a5;
    do
    {
      objc_msgSend((id)v35->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 0, v30, v31);
      *v16 = objc_msgSend((id)*a3, "baseObject");
      v19 = (_DWORD *)(v15 + 63608);
      v20 = *a3;
      v21 = *(_DWORD *)v18;
      v22 = *(_DWORD *)v17;
      if (MTLReportFailureTypeEnabled())
      {
        if (*v19 == v22
          && *(_DWORD *)(v15 + 63604) == v21
          && *(_BYTE *)(v15 + 63600) != 0
          && *(_QWORD *)(v15 + 63576) == -1
          && *(_QWORD *)(v15 + 63536) == 2
          && *(_QWORD *)(v15 + 63544) == (_QWORD)v20
          && (*(_QWORD *)(v15 + 63560) | *(_QWORD *)(v15 + 63552) | *(_QWORD *)(v15 + 63568)) == 0
          && *(_OWORD *)(v15 + 63584) == 0)
        {
          v30 = v20;
          MTLReportFailure();
        }
      }
      *(_BYTE *)(v15 + 63528) = v20 != 0;
      *(_BYTE *)(v15 + 63529) = 0;
      *(_QWORD *)(v15 + 63536) = 2;
      *(_QWORD *)(v15 + 63544) = v20;
      *(_QWORD *)(v15 + 63552) = 0;
      *(_QWORD *)(v15 + 63560) = 0;
      *(_QWORD *)(v15 + 63568) = 0;
      *(_QWORD *)(v15 + 63576) = -1;
      *(_QWORD *)(v15 + 63584) = 0;
      *(_QWORD *)(v15 + 63592) = 0;
      v15 += 88;
      *((_BYTE *)v19 - 8) = 1;
      ++v17;
      ++v18;
      *(v19 - 1) = v21;
      *v19 = v22;
      ++v16;
      ++a3;
      --v14;
    }
    while (v14);
  }
  else
  {
    v11 = location;
    _MTLMessageContextEnd();
  }
  objc_msgSend(-[MTLToolsObject baseObject](v35, "baseObject", v30), "setObjectSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v37, a4, a5, v11, v34);
  *(_DWORD *)&v35->_openGLModeEnabled |= 0x400u;
}

- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  unint64_t *p_type;
  unint64_t *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _MTLMessageContext v14;

  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  memset(&v14, 0, sizeof(v14));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxComputeLocalMemorySizes](self->super.super.super._device, "maxComputeLocalMemorySizes") <= a4)
  {
    v10 = a4;
    v12 = -[MTLToolsDevice maxComputeLocalMemorySizes](self->super.super.super._device, "maxComputeLocalMemorySizes");
    _MTLMessageContextPush_();
  }
  if (-[MTLToolsDevice maxThreadgroupMemoryLength](self->super.super.super._device, "maxThreadgroupMemoryLength", v10, v12) < a3)
  {
    v11 = a3;
    v13 = -[MTLToolsDevice maxThreadgroupMemoryLength](self->super.super.super._device, "maxThreadgroupMemoryLength");
    _MTLMessageContextPush_();
  }
  if (a3
     % -[MTLToolsDevice maxComputeThreadgroupMemoryAlignmentBytes](self->super.super.super._device, "maxComputeThreadgroupMemoryAlignmentBytes", v11, v13))
  {
    -[MTLToolsDevice maxComputeThreadgroupMemoryAlignmentBytes](self->super.super.super._device, "maxComputeThreadgroupMemoryAlignmentBytes");
    _MTLMessageContextPush_();
  }
  if (a4 <= 0x1E)
    validateArg(MTLArgumentTypeThreadgroupMemory, a4, (MTLDebugFunctionArgument *)&self->_objectThreadgroupMemoryLengths[a4].type, &v14);
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectThreadgroupMemoryLength:atIndex:", a3, a4);
  p_type = &self->_objectThreadgroupMemoryLengths[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    v8 = &p_type[11 * a4];
    if (!*((_BYTE *)v8 + 72)
      && !v8[8]
      && v8[7] == a3
      && v8[6] == -1
      && v8[1] == 3
      && !v8[2]
      && !(v8[4] | v8[3] | v8[5])
      && !*(unint64_t *)((char *)v8 + 76))
    {
      MTLReportFailure();
    }
  }
  v9 = &p_type[11 * a4];
  *(_BYTE *)v9 = a3 != 0;
  *((_BYTE *)v9 + 1) = 0;
  v9[1] = 3;
  *((_OWORD *)v9 + 1) = 0u;
  *((_OWORD *)v9 + 2) = 0u;
  v9[6] = -1;
  v9[7] = a3;
  v9[8] = 0;
  *((_BYTE *)v9 + 72) = 0;
  *((_DWORD *)v9 + 19) = 0;
  *((_DWORD *)v9 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x800u;
}

- (void)setMeshBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unint64_t *p_type;
  unint64_t v10;
  unint64_t v11;
  _MTLMessageContext v12;

  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  memset(&v12, 0, sizeof(v12));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers") <= a5)
  {
    v10 = a5;
    v11 = -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers");
    _MTLMessageContextPush_();
  }
  if (-[MTLToolsDevice maxComputeInlineDataSize](self->super.super.super._device, "maxComputeInlineDataSize", v10, v11) < a4)
  {
    -[MTLToolsDevice maxComputeInlineDataSize](self->super.super.super._device, "maxComputeInlineDataSize");
    _MTLMessageContextPush_();
  }
  if (a5 <= 0x1E)
    validateArg(MTLArgumentTypeBuffer, a5, (MTLDebugFunctionArgument *)&self->_meshBuffers[a5].type, &v12);
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshBytes:length:atIndex:", a3, a4, a5);
  MTLReportFailureTypeEnabled();
  p_type = &self->_meshBuffers[a5].type;
  *(_BYTE *)p_type = a4 != 0;
  *((_BYTE *)p_type + 1) = 0;
  p_type[1] = 0;
  p_type[2] = 0;
  p_type[3] = 0;
  p_type[4] = a4;
  *(_OWORD *)(p_type + 5) = xmmword_22CEAB6E0;
  p_type[7] = 0;
  p_type[8] = 0;
  *((_BYTE *)p_type + 72) = 0;
  *((_DWORD *)p_type + 19) = 0;
  *((_DWORD *)p_type + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x1000u;
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MTLToolsDevice *device;
  unint64_t v10;
  unint64_t *p_type;
  unint64_t *v12;
  unint64_t *v13;
  _MTLMessageContext v14;

  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  memset(&v14, 0, sizeof(v14));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers") > a5)
  {
    if (a3)
      goto LABEL_5;
LABEL_12:
    if (!a4)
      goto LABEL_13;
    goto LABEL_10;
  }
  -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers");
  _MTLMessageContextPush_();
  if (!a3)
    goto LABEL_12;
LABEL_5:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_10:
    _MTLMessageContextPush_();
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    _MTLMessageContextPush_();
  v10 = *((_QWORD *)a3 + 8);
  if (v10 <= a4)
    _MTLMessageContextPush_();
LABEL_14:
  if (a5 <= 0x1E)
    validateArg(MTLArgumentTypeBuffer, a5, (MTLDebugFunctionArgument *)&self->_meshBuffers[a5].type, &v14);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
  p_type = &self->_meshBuffers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    if (a3)
    {
      v12 = &p_type[11 * a5];
      if (!*((_BYTE *)v12 + 72)
        && v12[6] == -1
        && v12[5] == a4
        && v12[4] == v10
        && (id)v12[2] == a3
        && !(v12[3] | v12[1])
        && *(_OWORD *)(v12 + 7) == 0
        && !*(unint64_t *)((char *)v12 + 76))
      {
        MTLReportFailure();
      }
    }
  }
  v13 = &p_type[11 * a5];
  *(_BYTE *)v13 = v10 != 0;
  *((_BYTE *)v13 + 1) = 0;
  v13[1] = 0;
  v13[2] = (unint64_t)a3;
  v13[3] = 0;
  v13[4] = v10;
  v13[5] = a4;
  v13[6] = -1;
  v13[7] = 0;
  v13[8] = 0;
  *((_BYTE *)v13 + 72) = 0;
  *((_DWORD *)v13 + 19) = 0;
  *((_DWORD *)v13 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x1000u;
}

- (void)setMeshBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  MTLDebugFunctionArgument *p_type;
  baseLevel *v8;
  id *p_object;
  baseLevel *object;
  unint64_t *v11;
  unint64_t *v12;
  void *v13;
  void **v14;
  void *v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t *v18;
  _MTLMessageContext v19;

  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  memset(&v19, 0, sizeof(v19));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers") <= a4)
  {
    -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers");
    _MTLMessageContextPush_();
  }
  if (a4 <= 0x1E)
  {
    p_type = (MTLDebugFunctionArgument *)&self->_meshBuffers[a4].type;
    validateArg(MTLArgumentTypeBuffer, a4, p_type, &v19);
    object = p_type->object;
    p_object = (id *)&p_type->object;
    v8 = object;
    if (!object)
    {
LABEL_9:
      _MTLMessageContextPush_();
      goto LABEL_10;
    }
    if (-[baseLevel length](v8, "length") <= a3)
    {
      objc_msgSend(*p_object, "length");
      goto LABEL_9;
    }
  }
LABEL_10:
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshBufferOffset:atIndex:", a3, a4);
  v11 = &self->_meshBuffers[0].type;
  v12 = &self->_meshBuffers[a4].type;
  v15 = (void *)v12[2];
  v14 = (void **)(v12 + 2);
  v13 = v15;
  v16 = objc_msgSend(v15, "length");
  if (MTLReportFailureTypeEnabled())
  {
    if (v13)
    {
      v17 = &v11[11 * a4];
      if (!*((_BYTE *)v17 + 72)
        && v17[6] == -1
        && v17[5] == a3
        && v17[4] == v16
        && *v14 == v13
        && !(v17[3] | v17[1])
        && *(_OWORD *)(v17 + 7) == 0
        && !*(unint64_t *)((char *)v17 + 76))
      {
        MTLReportFailure();
      }
    }
  }
  v18 = &v11[11 * a4];
  *(_BYTE *)v18 = v16 != 0;
  *((_BYTE *)v18 + 1) = 0;
  v18[1] = 0;
  v18[2] = (unint64_t)v13;
  v18[3] = 0;
  v18[4] = v16;
  v18[5] = a3;
  v18[6] = -1;
  v18[7] = 0;
  v18[8] = 0;
  *((_BYTE *)v18 + 72) = 0;
  *((_DWORD *)v18 + 19) = 0;
  *((_DWORD *)v18 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x1000u;
}

- (void)setMeshBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  MTLDebugRenderCommandEncoder *v8;
  const void *v9;
  char *v10;
  MTLToolsDevice *device;
  uint64_t v12;
  _QWORD *v13;
  const unint64_t *v14;
  uint64_t v15;
  MTLDebugRenderCommandEncoder *v16;
  uint64_t v17;
  const void *v18;
  unint64_t v19;
  BOOL v20;
  const void *v27;
  uint64_t v28;
  const void *v29;
  uint64_t v30;
  NSUInteger v31;
  NSUInteger v32;
  _MTLMessageContext v34;
  _BYTE v35[248];
  uint64_t v36;

  length = a5.length;
  location = a5.location;
  v8 = self;
  v36 = *MEMORY[0x24BDAC8D0];
  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  memset(&v34, 0, sizeof(v34));
  -[MTLToolsObject device](v8, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(v8->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length > -[MTLToolsDevice maxComputeBuffers](v8->super.super.super._device, "maxComputeBuffers"))
  {
    v27 = (const void *)(location + length);
    v28 = -[MTLToolsDevice maxComputeBuffers](v8->super.super.super._device, "maxComputeBuffers");
    _MTLMessageContextPush_();
  }
  v31 = length;
  if (!length)
  {
    _MTLMessageContextEnd();
    goto LABEL_52;
  }
  v9 = 0;
  v10 = (char *)v8 + 88 * location;
  do
  {
    if (!a3[(_QWORD)v9])
    {
      if (!a4[(_QWORD)v9])
        goto LABEL_15;
      v27 = v9;
      v28 = a4[(_QWORD)v9];
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v27 = v9;
      _MTLMessageContextPush_();
    }
    device = v8->super.super.super._device;
    if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v9], "device", v27, v28, v29, v30))
    {
      v27 = v9;
      _MTLMessageContextPush_();
    }
    if (a4[(_QWORD)v9] >= *((_QWORD *)a3[(_QWORD)v9] + 8))
    {
      v29 = v9;
      v30 = *((_QWORD *)a3[(_QWORD)v9] + 8);
      v27 = v9;
      v28 = a4[(_QWORD)v9];
LABEL_20:
      _MTLMessageContextPush_();
    }
LABEL_15:
    if ((unint64_t)v9 + location <= 0x1E)
      validateArg(MTLArgumentTypeBuffer, (unint64_t)v9 + location, (MTLDebugFunctionArgument *)(v10 + 67744), &v34);
    v9 = (char *)v9 + 1;
    v10 += 88;
  }
  while ((const void *)length != v9);
  _MTLMessageContextEnd();
  v12 = (uint64_t)(&v8->super.super._commandBuffer + 11 * location);
  v32 = location;
  v13 = v35;
  v14 = a4;
  do
  {
    if (*a3)
      v15 = *((_QWORD *)*a3 + 8);
    else
      v15 = 0;
    v16 = v8;
    objc_msgSend((id)v8->_maxVertexBuffers, "addObject:retained:purgeable:", v27);
    *v13 = objc_msgSend((id)*a3, "baseObject");
    v17 = v12 + 67744;
    v18 = *a3;
    v19 = *v14;
    if (MTLReportFailureTypeEnabled() && v18)
    {
      if (*(_BYTE *)(v12 + 67776))
        v20 = 0;
      else
        v20 = *(_QWORD *)(v12 + 67752) == -1;
      if (v20
        && *(_QWORD *)v17 == v19
        && *(_QWORD *)(v12 + 67736) == v15
        && *(_QWORD *)(v12 + 67720) == (_QWORD)v18
        && (*(_QWORD *)(v12 + 67728) | *(_QWORD *)(v12 + 67712)) == 0
        && *(_OWORD *)(v12 + 67760) == 0
        && *(_QWORD *)(v12 + 67780) == 0)
      {
        v27 = v18;
        MTLReportFailure();
      }
    }
    *(_BYTE *)(v12 + 67704) = v15 != 0;
    *(_BYTE *)(v12 + 67705) = 0;
    *(_QWORD *)(v12 + 67712) = 0;
    *(_QWORD *)(v12 + 67720) = v18;
    *(_QWORD *)(v12 + 67728) = 0;
    *(_QWORD *)(v12 + 67736) = v15;
    *(_QWORD *)v17 = v19;
    *(_QWORD *)(v12 + 67752) = -1;
    *(_QWORD *)(v12 + 67760) = 0;
    *(_QWORD *)(v12 + 67768) = 0;
    *(_BYTE *)(v12 + 67776) = 0;
    v12 += 88;
    ++v14;
    ++v13;
    ++a3;
    *(_DWORD *)(v17 + 36) = 0;
    *(_DWORD *)(v17 + 40) = 0;
    --length;
    v8 = v16;
    location = v32;
  }
  while (length);
LABEL_52:
  objc_msgSend(-[MTLToolsObject baseObject](v8, "baseObject", v27), "setMeshBuffers:offsets:withRange:", v35, a4, location, v31);
  *(_DWORD *)&v8->_openGLModeEnabled |= 0x1000u;
}

- (void)setMeshTexture:(id)a3 atIndex:(unint64_t)a4
{
  MTLToolsDevice *device;
  unint64_t *p_type;
  unint64_t *v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  _MTLMessageContext v13;

  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  memset(&v13, 0, sizeof(v13));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxComputeTextures](self->super.super.super._device, "maxComputeTextures") <= a4)
  {
    v11 = a4;
    v12 = -[MTLToolsDevice maxComputeTextures](self->super.super.super._device, "maxComputeTextures");
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_10;
  }
  else if (!a3)
  {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    _MTLMessageContextPush_();
  if (objc_msgSend(a3, "storageMode", v11, v12) == 3)
LABEL_9:
    _MTLMessageContextPush_();
LABEL_10:
  if (a4 <= 0x7F)
    validateArg(MTLArgumentTypeTexture, a4, (MTLDebugFunctionArgument *)&self->_meshTextures[a4].type, &v13);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  p_type = &self->_meshTextures[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    v9 = &p_type[11 * a4];
    if (!*((_BYTE *)v9 + 72)
      && v9[6] == -1
      && v9[1] == 1
      && (id)v9[2] == a3
      && !(v9[4] | v9[3] | v9[5])
      && *(_OWORD *)(v9 + 7) == 0
      && !*(unint64_t *)((char *)v9 + 76))
    {
      MTLReportFailure();
    }
  }
  v10 = &p_type[11 * a4];
  *(_BYTE *)v10 = a3 != 0;
  *((_BYTE *)v10 + 1) = 0;
  v10[1] = 1;
  v10[2] = (unint64_t)a3;
  v10[3] = 0;
  v10[4] = 0;
  v10[5] = 0;
  v10[6] = -1;
  v10[7] = 0;
  v10[8] = 0;
  *((_BYTE *)v10 + 72) = 0;
  *((_DWORD *)v10 + 19) = 0;
  *((_DWORD *)v10 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x2000u;
}

- (void)setMeshTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void *v8;
  char *v9;
  MTLToolsDevice *device;
  char *v11;
  _QWORD *v12;
  NSUInteger v13;
  const void *v14;
  BOOL v15;
  char *v21;
  const void *v22;
  unint64_t v23;
  _MTLMessageContext v24;
  _BYTE v25[1024];
  uint64_t v26;

  length = a4.length;
  location = a4.location;
  v26 = *MEMORY[0x24BDAC8D0];
  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  memset(&v24, 0, sizeof(v24));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length <= -[MTLToolsDevice maxComputeTextures](self->super.super.super._device, "maxComputeTextures"))
  {
    if (length)
      goto LABEL_5;
LABEL_40:
    _MTLMessageContextEnd();
    goto LABEL_41;
  }
  v22 = (const void *)(location + length);
  v23 = -[MTLToolsDevice maxComputeTextures](self->super.super.super._device, "maxComputeTextures");
  _MTLMessageContextPush_();
  if (!length)
    goto LABEL_40;
LABEL_5:
  v8 = 0;
  v9 = (char *)self + 88 * location;
  do
  {
    if (a3[(_QWORD)v8])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_11;
      device = self->super.super.super._device;
      if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v8], "device", CFSTR("textures[%lu] is not an MTLTexture.")))
      {
        v22 = v8;
        _MTLMessageContextPush_();
      }
      if (objc_msgSend((id)a3[(_QWORD)v8], "storageMode", v22, v23) == 3)
      {
LABEL_11:
        v22 = v8;
        _MTLMessageContextPush_();
      }
    }
    if ((unint64_t)v8 + location <= 0x7F)
      validateArg(MTLArgumentTypeTexture, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 70472), &v24);
    v8 = (char *)v8 + 1;
    v9 += 88;
  }
  while ((const void *)length != v8);
  _MTLMessageContextEnd();
  v11 = (char *)self + 88 * location;
  v12 = v25;
  v13 = length;
  do
  {
    objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 1, v22);
    *v12 = objc_msgSend((id)*a3, "baseObject");
    v14 = *a3;
    if (MTLReportFailureTypeEnabled())
    {
      if (v11[70544])
        v15 = 0;
      else
        v15 = *((_QWORD *)v11 + 8815) == -1;
      if (v15
        && *((_QWORD *)v11 + 8810) == 1
        && *((_QWORD *)v11 + 8811) == (_QWORD)v14
        && (*((_QWORD *)v11 + 8813) | *((_QWORD *)v11 + 8812) | *((_QWORD *)v11 + 8814)) == 0
        && *((_OWORD *)v11 + 4408) == 0
        && *(_QWORD *)(v11 + 70548) == 0)
      {
        v22 = v14;
        MTLReportFailure();
      }
    }
    v21 = v11 + 70472;
    v11[70472] = v14 != 0;
    v11[70473] = 0;
    *((_QWORD *)v11 + 8810) = 1;
    *((_QWORD *)v11 + 8811) = v14;
    *((_QWORD *)v11 + 8812) = 0;
    *((_QWORD *)v11 + 8813) = 0;
    *((_QWORD *)v11 + 8814) = 0;
    *((_QWORD *)v11 + 8815) = -1;
    *((_QWORD *)v11 + 8816) = 0;
    *((_QWORD *)v11 + 8817) = 0;
    v11[70544] = 0;
    v11 += 88;
    ++v12;
    ++a3;
    *((_DWORD *)v21 + 19) = 0;
    *((_DWORD *)v21 + 20) = 0;
    --v13;
  }
  while (v13);
LABEL_41:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setMeshTextures:withRange:", v25, location, length);
  *(_DWORD *)&self->_openGLModeEnabled |= 0x2000u;
}

- (void)setMeshSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  MTLToolsDevice *device;
  unint64_t *p_type;
  unint64_t *v9;
  unint64_t *v10;
  _MTLMessageContext v11;

  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  memset(&v11, 0, sizeof(v11));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers") <= a4)
  {
    -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers");
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_8;
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)objc_msgSend(a3, "device")))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a4 <= 0xF)
    validateArg(MTLArgumentTypeSampler, a4, (MTLDebugFunctionArgument *)&self->_meshSamplers[a4].type, &v11);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 0);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshSamplerState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  p_type = &self->_meshSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    v9 = &p_type[11 * a4];
    if (!*((_BYTE *)v9 + 72)
      && v9[6] == -1
      && v9[1] == 2
      && (id)v9[2] == a3
      && !(v9[4] | v9[3] | v9[5])
      && *(_OWORD *)(v9 + 7) == 0
      && !*(unint64_t *)((char *)v9 + 76))
    {
      MTLReportFailure();
    }
  }
  v10 = &p_type[11 * a4];
  *(_BYTE *)v10 = a3 != 0;
  *((_BYTE *)v10 + 1) = 0;
  v10[1] = 2;
  v10[2] = (unint64_t)a3;
  v10[3] = 0;
  v10[4] = 0;
  v10[5] = 0;
  v10[6] = -1;
  v10[7] = 0;
  v10[8] = 0;
  *((_BYTE *)v10 + 72) = 0;
  *((_DWORD *)v10 + 19) = 0;
  *((_DWORD *)v10 + 20) = 0;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x4000u;
}

- (void)setMeshSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void *v8;
  char *v9;
  MTLToolsDevice *device;
  char *v11;
  _QWORD *v12;
  NSUInteger v13;
  const void *v14;
  BOOL v15;
  char *v21;
  const void *v22;
  unint64_t v23;
  _MTLMessageContext v24;
  _BYTE v25[128];
  uint64_t v26;

  length = a4.length;
  location = a4.location;
  v26 = *MEMORY[0x24BDAC8D0];
  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  memset(&v24, 0, sizeof(v24));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length <= -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers"))
  {
    if (length)
      goto LABEL_5;
LABEL_38:
    _MTLMessageContextEnd();
    goto LABEL_39;
  }
  v22 = (const void *)(location + length);
  v23 = -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers");
  _MTLMessageContextPush_();
  if (!length)
    goto LABEL_38;
LABEL_5:
  v8 = 0;
  v9 = (char *)self + 88 * location;
  do
  {
    if (a3[(_QWORD)v8])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (device = self->super.super.super._device,
            device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v8], "device", CFSTR("samplers[%lu] is not an MTLSamplerState."))))
      {
        v22 = v8;
        _MTLMessageContextPush_();
      }
    }
    if ((unint64_t)v8 + location <= 0xF)
      validateArg(MTLArgumentTypeSampler, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 81736), &v24);
    v8 = (char *)v8 + 1;
    v9 += 88;
  }
  while ((const void *)length != v8);
  _MTLMessageContextEnd();
  v11 = (char *)self + 88 * location;
  v12 = v25;
  v13 = length;
  do
  {
    objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 0, v22, v23);
    *v12 = objc_msgSend((id)*a3, "baseObject");
    v14 = *a3;
    if (MTLReportFailureTypeEnabled())
    {
      if (v11[81808])
        v15 = 0;
      else
        v15 = *((_QWORD *)v11 + 10223) == -1;
      if (v15
        && *((_QWORD *)v11 + 10218) == 2
        && *((_QWORD *)v11 + 10219) == (_QWORD)v14
        && (*((_QWORD *)v11 + 10221) | *((_QWORD *)v11 + 10220) | *((_QWORD *)v11 + 10222)) == 0
        && *((_OWORD *)v11 + 5112) == 0
        && *(_QWORD *)(v11 + 81812) == 0)
      {
        v22 = v14;
        MTLReportFailure();
      }
    }
    v21 = v11 + 81736;
    v11[81736] = v14 != 0;
    v11[81737] = 0;
    *((_QWORD *)v11 + 10218) = 2;
    *((_QWORD *)v11 + 10219) = v14;
    *((_QWORD *)v11 + 10220) = 0;
    *((_QWORD *)v11 + 10221) = 0;
    *((_QWORD *)v11 + 10222) = 0;
    *((_QWORD *)v11 + 10223) = -1;
    *((_QWORD *)v11 + 10224) = 0;
    *((_QWORD *)v11 + 10225) = 0;
    v11[81808] = 0;
    v11 += 88;
    ++v12;
    ++a3;
    *((_DWORD *)v21 + 19) = 0;
    *((_DWORD *)v21 + 20) = 0;
    --v13;
  }
  while (v13);
LABEL_39:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setMeshSamplerStates:withRange:", v25, location, length);
  *(_DWORD *)&self->_openGLModeEnabled |= 0x4000u;
}

- (void)setMeshSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  MTLToolsDevice *device;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  unint64_t *p_type;
  unint64_t *v17;
  unint64_t *v18;
  _MTLMessageContext v19;

  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  memset(&v19, 0, sizeof(v19));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers") <= a6)
  {
    -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers");
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_8;
  }
  else if (!a3)
  {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)objc_msgSend(a3, "device")))
  {
    _MTLMessageContextPush_();
  }
LABEL_8:
  if (a6 <= 0xF)
    validateArg(MTLArgumentTypeSampler, a6, (MTLDebugFunctionArgument *)&self->_meshSamplers[a6].type, &v19);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 0);
  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  v13 = objc_msgSend(a3, "baseObject");
  *(float *)&v14 = a4;
  *(float *)&v15 = a5;
  objc_msgSend(v12, "setMeshSamplerState:lodMinClamp:lodMaxClamp:atIndex:", v13, a6, v14, v15);
  p_type = &self->_meshSamplers[0].type;
  if (MTLReportFailureTypeEnabled())
  {
    v17 = &p_type[11 * a6];
    if (*((_DWORD *)v17 + 20) == LODWORD(a5)
      && *((_DWORD *)v17 + 19) == LODWORD(a4)
      && *((_BYTE *)v17 + 72)
      && v17[6] == -1
      && v17[1] == 2
      && (id)v17[2] == a3
      && !(v17[4] | v17[3] | v17[5])
      && *(_OWORD *)(v17 + 7) == 0)
    {
      MTLReportFailure();
    }
  }
  v18 = &p_type[11 * a6];
  *(_BYTE *)v18 = a3 != 0;
  *((_BYTE *)v18 + 1) = 0;
  v18[1] = 2;
  v18[2] = (unint64_t)a3;
  v18[3] = 0;
  v18[4] = 0;
  v18[5] = 0;
  v18[6] = -1;
  v18[7] = 0;
  v18[8] = 0;
  *((_BYTE *)v18 + 72) = 1;
  *((float *)v18 + 19) = a4;
  *((float *)v18 + 20) = a5;
  *(_DWORD *)&self->_openGLModeEnabled |= 0x4000u;
}

- (void)setMeshSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  const void *v10;
  NSUInteger v11;
  char *v12;
  MTLToolsDevice *device;
  NSUInteger v14;
  uint64_t v15;
  _QWORD *v16;
  const float *v17;
  const float *v18;
  _DWORD *v19;
  const void *v20;
  int v21;
  int v22;
  const void *v30;
  unint64_t v31;
  NSUInteger v34;
  MTLDebugRenderCommandEncoder *v35;
  _MTLMessageContext v36;
  _BYTE v37[128];
  uint64_t v38;

  length = a6.length;
  location = a6.location;
  v38 = *MEMORY[0x24BDAC8D0];
  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  memset(&v36, 0, sizeof(v36));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length > -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers"))
  {
    v30 = (const void *)(location + length);
    v31 = -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers");
    _MTLMessageContextPush_();
  }
  v34 = length;
  v35 = self;
  if (length)
  {
    v10 = 0;
    v11 = location;
    v12 = (char *)self + 88 * location;
    do
    {
      if (a3[(_QWORD)v10])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (device = v35->super.super.super._device,
              device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v10], "device", CFSTR("samplers[%lu] is not an MTLSamplerState."))))
        {
          v30 = v10;
          _MTLMessageContextPush_();
        }
      }
      if ((unint64_t)v10 + location <= 0xF)
        validateArg(MTLArgumentTypeSampler, (unint64_t)v10 + location, (MTLDebugFunctionArgument *)(v12 + 81736), &v36);
      v10 = (char *)v10 + 1;
      v12 += 88;
    }
    while ((const void *)length != v10);
    _MTLMessageContextEnd();
    v14 = length;
    v15 = (uint64_t)&v35->_attachmentInfo[1] + 88 * location;
    v16 = v37;
    v18 = a4;
    v17 = a5;
    do
    {
      objc_msgSend((id)v35->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 0, v30, v31);
      *v16 = objc_msgSend((id)*a3, "baseObject");
      v19 = (_DWORD *)(v15 + 81736);
      v20 = *a3;
      v21 = *(_DWORD *)v18;
      v22 = *(_DWORD *)v17;
      if (MTLReportFailureTypeEnabled())
      {
        if (*v19 == v22
          && *(_DWORD *)(v15 + 81732) == v21
          && *(_BYTE *)(v15 + 81728) != 0
          && *(_QWORD *)(v15 + 81704) == -1
          && *(_QWORD *)(v15 + 81664) == 2
          && *(_QWORD *)(v15 + 81672) == (_QWORD)v20
          && (*(_QWORD *)(v15 + 81688) | *(_QWORD *)(v15 + 81680) | *(_QWORD *)(v15 + 81696)) == 0
          && *(_OWORD *)(v15 + 81712) == 0)
        {
          v30 = v20;
          MTLReportFailure();
        }
      }
      *(_BYTE *)(v15 + 81656) = v20 != 0;
      *(_BYTE *)(v15 + 81657) = 0;
      *(_QWORD *)(v15 + 81664) = 2;
      *(_QWORD *)(v15 + 81672) = v20;
      *(_QWORD *)(v15 + 81680) = 0;
      *(_QWORD *)(v15 + 81688) = 0;
      *(_QWORD *)(v15 + 81696) = 0;
      *(_QWORD *)(v15 + 81704) = -1;
      *(_QWORD *)(v15 + 81712) = 0;
      *(_QWORD *)(v15 + 81720) = 0;
      v15 += 88;
      *((_BYTE *)v19 - 8) = 1;
      ++v17;
      ++v18;
      *(v19 - 1) = v21;
      *v19 = v22;
      ++v16;
      ++a3;
      --v14;
    }
    while (v14);
  }
  else
  {
    v11 = location;
    _MTLMessageContextEnd();
  }
  objc_msgSend(-[MTLToolsObject baseObject](v35, "baseObject", v30), "setMeshSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v37, a4, a5, v11, v34);
  *(_DWORD *)&v35->_openGLModeEnabled |= 0x4000u;
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  unint64_t var2;
  unint64_t v10;
  id v11;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v14;

  var2 = a4->var2;
  *(_OWORD *)&self->_objectThreadsPerTG.height = *(_OWORD *)&a4->var0;
  self->_meshThreadsPerTG.width = var2;
  v10 = a5->var2;
  *(_OWORD *)&self->_meshThreadsPerTG.height = *(_OWORD *)&a5->var0;
  *(_QWORD *)&self->_allowsNullBufferBinds = v10;
  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  -[MTLDebugRenderCommandEncoder validateCommonDrawErrors:](self, "validateCommonDrawErrors:", 26);
  v11 = -[MTLToolsObject baseObject](self, "baseObject");
  v14 = *a3;
  v13 = *a4;
  v12 = *a5;
  objc_msgSend(v11, "drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", &v14, &v13, &v12);
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  unint64_t var2;
  unint64_t v10;
  id v11;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v14;

  var2 = a4->var2;
  *(_OWORD *)&self->_objectThreadsPerTG.height = *(_OWORD *)&a4->var0;
  self->_meshThreadsPerTG.width = var2;
  v10 = a5->var2;
  *(_OWORD *)&self->_meshThreadsPerTG.height = *(_OWORD *)&a5->var0;
  *(_QWORD *)&self->_allowsNullBufferBinds = v10;
  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  -[MTLDebugRenderCommandEncoder validateCommonDrawErrors:](self, "validateCommonDrawErrors:", 26);
  v11 = -[MTLToolsObject baseObject](self, "baseObject");
  v14 = *a3;
  v13 = *a4;
  v12 = *a5;
  objc_msgSend(v11, "drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", &v14, &v13, &v12);
}

- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6
{
  unint64_t var2;
  unint64_t v12;
  id v13;
  uint64_t v14;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v15;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v16;
  _OWORD v17[3];
  uint64_t v18;

  var2 = a5->var2;
  *(_OWORD *)&self->_objectThreadsPerTG.height = *(_OWORD *)&a5->var0;
  self->_meshThreadsPerTG.width = var2;
  v12 = a6->var2;
  *(_OWORD *)&self->_meshThreadsPerTG.height = *(_OWORD *)&a6->var0;
  *(_QWORD *)&self->_allowsNullBufferBinds = v12;
  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  -[MTLDebugRenderCommandEncoder validateCommonDrawErrors:](self, "validateCommonDrawErrors:", 26);
  v18 = 0;
  memset(v17, 0, sizeof(v17));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  validateIndirectBuffer((uint64_t)self->super.super.super._device, a3, a4, 12, (uint64_t)"sizeof(MTLDispatchThreadgroupsIndirectArguments)", (uint64_t *)v17);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  v13 = -[MTLToolsObject baseObject](self, "baseObject");
  v14 = objc_msgSend(a3, "baseObject");
  v16 = *a5;
  v15 = *a6;
  objc_msgSend(v13, "drawMeshThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", v14, a4, &v16, &v15);
}

- (void)updateFence:(id)a3 afterStages:(unint64_t)a4
{
  id v7;

  if (!a4)
    MTLReportFailure();
  v7 = a3;
  std::deque<objc_object *>::push_back(&self->_updatedFences.__map_.var0, &v7);
  LODWORD(self->_visibilityOffsets) |= 2u;
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 0);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateFence:afterStages:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4
{
  NSMutableSet *storingRenderTargets;
  uint64_t v8;
  unsigned int v9;

  if (!a4)
    MTLReportFailure();
  -[MTLToolsObject device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  storingRenderTargets = self->_storingRenderTargets;
  if (storingRenderTargets)
  {
    v8 = 0;
    v9 = 1;
    do
    {
      if ((*(__end_cap_ ***)((char *)self->_updatedFences.__map_.var1
                            + (((self->_updatedFences.__size_.__value_ + v8) >> 6) & 0x3FFFFFFFFFFFFF8)))[(self->_updatedFences.__size_.__value_ + v8) & 0x1FF] == a3)
      {
        _MTLMessageContextPush_();
        storingRenderTargets = self->_storingRenderTargets;
      }
      v8 = v9;
    }
    while ((unint64_t)storingRenderTargets > v9++);
  }
  _MTLMessageContextEnd();
  LODWORD(self->_visibilityOffsets) |= 2u;
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 0);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitForFence:beforeStages:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)endEncoding_private
{
  void *frontFacingWinding;
  void *v4;
  unint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char isKindOfClass;
  int visibilityOffsets;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _OWORD v23[3];
  uint64_t v24;
  _OWORD v25[2];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  memset(v23, 0, sizeof(v23));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (self->_commandBuffer)
  {
    objc_msgSend((id)self->_maxVertexBuffers, "addActiveRenderTargets:");

    self->_commandBuffer = 0;
  }
  frontFacingWinding = (void *)self->_frontFacingWinding;
  if (!frontFacingWinding)
    goto LABEL_46;
  v4 = (void *)objc_msgSend(frontFacingWinding, "colorAttachments");
  for (i = 0; i != 10; ++i)
  {
    v6 = (void *)objc_msgSend(v4, "_descriptorAtIndex:", i);
    if (!v6)
      continue;
    v7 = v6;
    v8 = objc_msgSend(v6, "texture");
    if (!v8)
      continue;
    v9 = (void *)v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (i > 7)
      {
        v10 = objc_msgSend(v7, "storeAction");
        if (i == 8)
        {
          if (v10 != 4)
            goto LABEL_15;
        }
        else if (v10 != 4)
        {
          goto LABEL_15;
        }
      }
      else
      {
        if (objc_msgSend(v7, "storeAction") != 4)
          goto LABEL_15;
        v19 = i;
      }
      _MTLMessageContextPush_();
LABEL_15:
      if (objc_msgSend(v9, "storageMode", v19) == 3
        && objc_msgSend(v7, "storeAction")
        && objc_msgSend(v7, "storeAction") != 2)
      {
        _MTLMessageContextPush_();
      }
      v11 = MTLReportFailureTypeEnabled();
      if (i <= 7 && v11 && ((HIDWORD(self->_visibilityOffsets) >> i) & 1) != 0)
        -[MTLToolsRetainingContainer validateStoreLoadTransition:atIndex:renderTargetArrayLength:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "validateStoreLoadTransition:atIndex:renderTargetArrayLength:", v7, i, objc_msgSend((id)self->_frontFacingWinding, "renderTargetArrayLength"));
      v12 = -[MTLToolsRetainingContainer protectionOptions](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "protectionOptions");
      v13 = objc_msgSend(v9, "protectionOptions");
      if ((objc_msgSend(v7, "loadAction") == 1
         || objc_msgSend(v7, "storeAction") != 4 && objc_msgSend(v7, "storeAction"))
        && (v13 & ~v12) != 0)
      {
        v21 = objc_msgSend(v9, "protectionOptions");
        v22 = v12;
        v20 = i;
        _MTLMessageContextPush_();
      }
      if (objc_msgSend(v7, "storeAction", v20, v21, v22) != 4 && objc_msgSend(v7, "storeAction") && (v12 & ~v13) != 0)
      {
        v21 = objc_msgSend(v9, "protectionOptions");
        v22 = v12;
        v19 = i;
        _MTLMessageContextPush_();
      }
    }
    if (objc_msgSend(v7, "loadAction", v19) == 2 && objc_msgSend(v7, "storeAction"))
      LODWORD(self->_visibilityOffsets) |= 2u;
  }
  v14 = (void *)objc_msgSend(v4, "_descriptorAtIndex:", 8);
  v15 = objc_msgSend(v4, "_descriptorAtIndex:", 9);
  if (v14)
  {
    v16 = (void *)v15;
    if (v15)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      _MTLValidateDepthStencilStoreStateWithContext(objc_msgSend(v14, "storeAction"), objc_msgSend(v16, "storeAction"), *(_QWORD *)(objc_msgSend(v16, "_descriptorPrivate") + 104), isKindOfClass & 1);
    }
  }
  visibilityOffsets = (int)self->_visibilityOffsets;
  if ((visibilityOffsets & 0x10000) != 0)
  {
    _MTLMessageContextPush_();
    if (((uint64_t)self->_visibilityOffsets & 2) == 0)
      goto LABEL_52;
  }
  else
  {
    if ((visibilityOffsets & 2) != 0)
      goto LABEL_43;
LABEL_52:
    _MTLMessageContextPush_();
  }
LABEL_43:
  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled())
    -[MTLDebugRenderCommandEncoder _validateAllFunctionArguments:](self, "_validateAllFunctionArguments:", v23);
LABEL_46:
  _MTLMessageContextEnd();
  -[MTLDebugRenderCommandEncoder _setDefaults](self, "_setDefaults");
  LODWORD(self->_visibilityOffsets) |= 0x10001u;
  if (-[MTLToolsDevice storeValidationEnabled](self->super.super.super._device, "storeValidationEnabled"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MTLToolsObject mergeAttachmentWriteMask:](self->super.super.super._parent, "mergeAttachmentWriteMask:", self->_objectThreadsPerTG.width);
    }
    else
    {
      v25[0] = xmmword_22CEAB824;
      v25[1] = unk_22CEAB834;
      -[MTLDevice clearRenderEncoder:writeMask:withCheckerboard:](-[MTLToolsObject device](self, "device"), "clearRenderEncoder:writeMask:withCheckerboard:", self, self->_objectThreadsPerTG.width, v25);
    }
  }
}

- (void)endEncoding
{
  -[MTLDebugRenderCommandEncoder endEncoding_private](self, "endEncoding_private");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  -[MTLDebugRenderCommandEncoder endEncoding_private](self, "endEncoding_private");
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncodingAndRetrieveProgramAddressTable");
}

- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5
{
  unint64_t v9;
  unint64_t v10;

  validateSupportsTessellation(self->super.super.super._device);
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (a3)
  {
    _MTLDebugValidateBuffer((uint64_t)self->super.super.super._device, a3);
    if ((a4 & 3) == 0)
      goto LABEL_5;
  }
  else if (!a4)
  {
    goto LABEL_5;
  }
  v10 = a4;
  _MTLMessageContextPush_();
LABEL_5:
  if ((a5 & 3) != 0)
  {
    v10 = a5;
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  v9 = objc_msgSend(a3, "length");
  if (MTLReportFailureTypeEnabled()
    && a3
    && !LOBYTE(self->_tessellationFactorBufferArgument.lodMaxClamp)
    && self->_tessellationFactorBufferArgument.threadgroupMemoryLength == -1
    && self->_tessellationFactorBufferArgument.bufferAttributeStride == a4
    && self->_tessellationFactorBufferArgument.bufferOffset == v9
    && (id)self->_tessellationFactorBufferArgument.var0 == a3
    && !(self->_tessellationFactorBufferArgument.bufferLength | (unint64_t)self->_tessellationFactorBufferArgument.object)
    && *(_OWORD *)&self->_tessellationFactorBufferArgument.threadgroupMemoryOffset == 0
    && !*(_QWORD *)(&self->_tessellationFactorBufferArgument.lodMaxClamp + 1))
  {
    v10 = (unint64_t)a3;
    MTLReportFailure();
  }
  LOBYTE(self->_tessellationFactorBufferArgument.type) = v9 != 0;
  BYTE1(self->_tessellationFactorBufferArgument.type) = 0;
  self->_tessellationFactorBufferArgument.object = 0;
  self->_tessellationFactorBufferArgument.var0 = (unint64_t)a3;
  self->_tessellationFactorBufferArgument.bufferLength = 0;
  self->_tessellationFactorBufferArgument.bufferOffset = v9;
  self->_tessellationFactorBufferArgument.bufferAttributeStride = a4;
  self->_tessellationFactorBufferArgument.threadgroupMemoryLength = -1;
  self->_tessellationFactorBufferArgument.threadgroupMemoryOffset = 0;
  *(_QWORD *)&self->_tessellationFactorBufferArgument.hasLodClamp = 0;
  LOBYTE(self->_tessellationFactorBufferArgument.lodMaxClamp) = 0;
  *((_DWORD *)&self->_tessellationFactorBufferArgument.lodMaxClamp + 1) = 0;
  LODWORD(self[1].super.super.super.super.isa) = 0;
  *(_QWORD *)&self->_tessellationFactorBufferArgument.isValid = a5;
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1, v10);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTessellationFactorBuffer:offset:instanceStride:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)setTessellationFactorScale:(float)a3
{
  id v7;
  double v8;
  double v9;

  validateSupportsTessellation(self->super.super.super._device);
  if (SLODWORD(a3) <= -1 || ((LODWORD(a3) & 0x7FFFFFFFu) - 0x800000) >> 24 >= 0x7F)
  {
    v9 = a3;
    MTLReportFailure();
  }
  *((float *)&self->_descriptor + 1) = a3;
  v7 = -[MTLToolsObject baseObject](self, "baseObject", *(_QWORD *)&v9);
  *(float *)&v8 = a3;
  objc_msgSend(v7, "setTessellationFactorScale:", v8);
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9
{
  void *v16;
  uint64_t v17;

  -[MTLDebugRenderCommandEncoder validateCommonDrawErrors:instanceCount:baseInstance:maxVertexID:](self, "validateCommonDrawErrors:instanceCount:baseInstance:maxVertexID:", 3, a8, a9, 1);
  v16 = (void *)objc_msgSend((id)self->_peakPerSampleStorage, "descriptor");
  if (!LOBYTE(self->_vertexBuiltinArguments))
    validateCommonTessellationErrors(self->super.super.super._device, v16, (uint64_t)&self->_tessellationFactorBufferArgument.type, *(_QWORD *)&self->_tessellationFactorBufferArgument.isValid, a3, 0, 0, (uint64_t)"-[MTLDebugRenderCommandEncoder drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:]", a4, a5, a9, a8);
  _MTLDebugValidatePatchIndexBuffer((uint64_t)self->super.super.super._device, a6, (uint64_t)"patchIndexBuffer", a7, 1, a4, a5, v17, a8);
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a6, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7, a8);
}

- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7
{
  void *v13;
  uint64_t v14;
  _OWORD v15[3];
  uint64_t v16;

  -[MTLDebugRenderCommandEncoder validateCommonDrawErrors:instanceCount:baseInstance:maxVertexID:](self, "validateCommonDrawErrors:instanceCount:baseInstance:maxVertexID:", 3, 1, 0, 1);
  v13 = (void *)objc_msgSend((id)self->_peakPerSampleStorage, "descriptor");
  if (!LOBYTE(self->_vertexBuiltinArguments))
    validateCommonTessellationErrors(self->super.super.super._device, v13, (uint64_t)&self->_tessellationFactorBufferArgument.type, *(_QWORD *)&self->_tessellationFactorBufferArgument.isValid, a3, 1, 0, (uint64_t)"-[MTLDebugRenderCommandEncoder drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:]", 0, 0, 0, 0);
  v16 = 0;
  memset(v15, 0, sizeof(v15));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  _MTLDebugValidatePatchIndexBufferWithContext((unint64_t)self->super.super.super._device, a4, (uint64_t)"patchIndexBuffer", a5, 0, 0, 0, v14, 0, (uint64_t *)v15);
  validateIndirectBuffer((uint64_t)self->super.super.super._device, a6, a7, 16, (uint64_t)"sizeof(MTLDrawPatchIndirectArguments)", (uint64_t *)v15);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a4, 1, 1);
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a6, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, objc_msgSend(a4, "baseObject"), a5, objc_msgSend(a6, "baseObject"), a7);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11
{
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD v21[3];
  uint64_t v22;

  -[MTLDebugRenderCommandEncoder validateCommonDrawErrors:instanceCount:baseInstance:maxVertexID:](self, "validateCommonDrawErrors:instanceCount:baseInstance:maxVertexID:", 3, a10, a11, 1);
  v17 = (void *)objc_msgSend((id)self->_peakPerSampleStorage, "descriptor");
  if (!LOBYTE(self->_vertexBuiltinArguments))
    validateCommonTessellationErrors(self->super.super.super._device, v17, (uint64_t)&self->_tessellationFactorBufferArgument.type, *(_QWORD *)&self->_tessellationFactorBufferArgument.isValid, a3, 0, 1, (uint64_t)"-[MTLDebugRenderCommandEncoder drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:]", a4, a5, a11, a10);
  v22 = 0;
  memset(v21, 0, sizeof(v21));
  _MTLMessageContextBegin_();
  _MTLDebugValidatePatchIndexBufferWithContext((unint64_t)self->super.super.super._device, a6, (uint64_t)"patchIndexBuffer", a7, 1, a4, a5, v18, a10, (uint64_t *)v21);
  if (a3)
  {
    v19 = _MTLTessellationControlPointIndexTypeToMTLIndexType((MTLTessellationControlPointIndexType)objc_msgSend(v17, "tessellationControlPointIndexType"));
    _MTLDebugValidateIndexBufferWithContext((uint64_t)self->super.super.super._device, v19, a8, (uint64_t)"controlPointIndexBuffer", a9, a6 == 0, (a5 + a4) * a3, (uint64_t *)v21);
  }
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a6, 1, 1);
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a8, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7, objc_msgSend(a8, "baseObject"), a9, a10, a11);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9
{
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD v19[3];
  uint64_t v20;

  -[MTLDebugRenderCommandEncoder validateCommonDrawErrors:instanceCount:baseInstance:maxVertexID:](self, "validateCommonDrawErrors:instanceCount:baseInstance:maxVertexID:", 3, 1, 0, 1);
  v15 = (void *)objc_msgSend((id)self->_peakPerSampleStorage, "descriptor");
  if (!LOBYTE(self->_vertexBuiltinArguments))
    validateCommonTessellationErrors(self->super.super.super._device, v15, (uint64_t)&self->_tessellationFactorBufferArgument.type, *(_QWORD *)&self->_tessellationFactorBufferArgument.isValid, a3, 1, 1, (uint64_t)"-[MTLDebugRenderCommandEncoder drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:]", 0, 0, 0, 0);
  v20 = 0;
  memset(v19, 0, sizeof(v19));
  _MTLMessageContextBegin_();
  _MTLDebugValidatePatchIndexBufferWithContext((unint64_t)self->super.super.super._device, a4, (uint64_t)"patchIndexBuffer", a5, 0, 0, 0, v16, 0, (uint64_t *)v19);
  validateIndirectBuffer((uint64_t)self->super.super.super._device, a8, a9, 16, (uint64_t)"sizeof(MTLDrawPatchIndirectArguments)", (uint64_t *)v19);
  if (a3)
  {
    v17 = _MTLTessellationControlPointIndexTypeToMTLIndexType((MTLTessellationControlPointIndexType)objc_msgSend(v15, "tessellationControlPointIndexType"));
    _MTLDebugValidateIndexBufferWithContext((uint64_t)self->super.super.super._device, v17, a6, (uint64_t)"controlPointIndexBuffer", a7, 0, 0, (uint64_t *)v19);
  }
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a4, 1, 1);
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a6, 1, 1);
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a8, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, objc_msgSend(a4, "baseObject"), a5, objc_msgSend(a6, "baseObject"), a7, objc_msgSend(a8, "baseObject"), a9);
}

- (void)filterCounterRangeWithFirstBatch:(unsigned int)a3 lastBatch:(unsigned int)a4 filterIndex:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  if (a3 > a4)
  {
    v9 = *(_QWORD *)&a3;
    v10 = *(_QWORD *)&a4;
    MTLReportFailure();
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v9, v10), "filterCounterRangeWithFirstBatch:lastBatch:filterIndex:", v7, v6, v5);
}

- (void)textureBarrier
{
  MTLReportFailure();
}

- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5
{
  _OWORD v9[3];
  uint64_t v10;

  v10 = 0;
  memset(v9, 0, sizeof(v9));
  _MTLMessageContextBegin_();
  validateCommonBarrier((uint64_t)self->super.super.super._device, (uint64_t)v9, a3, a4, a5);
  if (!-[MTLToolsDevice supportsPartialRenderMemoryBarrier](self->super.super.super._device, "supportsPartialRenderMemoryBarrier"))goto LABEL_5;
  if ((a3 & 4) != 0)
    _MTLMessageContextPush_();
  if ((a4 & 6) != 0)
LABEL_5:
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "memoryBarrierWithScope:afterStages:beforeStages:", a3, a4, a5);
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6
{
  uint64_t *p_device;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  const void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *__p[3];
  _OWORD v30[3];
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v31 = 0;
  memset(v30, 0, sizeof(v30));
  p_device = (uint64_t *)&self->super.super.super._device;
  _MTLMessageContextBegin_();
  validateCommonBarrier(*p_device, (uint64_t)v30, 3uLL, a5, a6);
  if (!a3 || !a4)
    _MTLMessageContextPush_();
  if (-[MTLToolsDevice supportsPartialRenderMemoryBarrier](self->super.super.super._device, "supportsPartialRenderMemoryBarrier"))
  {
    if ((a5 & 6) != 0)
    {
      v21 = a5;
      _MTLMessageContextPush_();
    }
  }
  else
  {
    _MTLMessageContextPush_();
  }
  std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
  v22 = a5;
  v23 = a6;
  if (a4)
  {
    v11 = 0;
    do
    {
      v12 = (void *)a3[v11];
      if (!v12)
      {
        v21 = v11;
        MTLReportFailure();
        v12 = (void *)a3[v11];
      }
      v13 = objc_msgSend(v12, "baseObject", v21);
      *((_QWORD *)__p[0] + v11) = v13;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = a3[v11];
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v15 = (void *)-[MTLDebugCommandBuffer allObjects](self->_commandBuffer, "allObjects");
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v26 != v17)
                objc_enumerationMutation(v15);
              v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
              if ((const void *)objc_msgSend(v19, "attachmentTexture") == v14)
                -[MTLDebugCommandBuffer removeObject:](self->_commandBuffer, "removeObject:", v19);
            }
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
          }
          while (v16);
        }
      }
      ++v11;
    }
    while (v11 != a4);
  }
  _MTLMessageContextEnd();
  v20 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v20, "memoryBarrierWithResources:count:afterStages:beforeStages:", __p[0], a4, v22, v23);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSRange v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  NSRange v17;
  NSRange v18;

  length = a4.length;
  location = a4.location;
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  _MTLMessageContextBegin_();
  v18.length = objc_msgSend(a3, "size");
  v17.location = location;
  v17.length = length;
  v18.location = 0;
  v8 = NSIntersectionRange(v17, v18);
  if (v8.location != location || v8.length != length)
  {
    v10 = length;
    v11 = objc_msgSend(a3, "size");
    v9 = location;
    _MTLMessageContextPush_();
  }
  if (objc_msgSend((id)objc_msgSend(a3, "descriptor", v9, v10, v11), "inheritPipelineState")
    && (-[MTLRenderPipelineState supportIndirectCommandBuffers](-[MTLDebugRenderCommandEncoder renderPipelineState](self, "renderPipelineState"), "supportIndirectCommandBuffers") & 1) == 0)
  {
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  v12.receiver = self;
  v12.super_class = (Class)MTLDebugRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder executeCommandsInBuffer:withRange:](&v12, sel_executeCommandsInBuffer_withRange_, a3, location, length);
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  objc_super v9;

  if (objc_msgSend((id)objc_msgSend(a3, "descriptor"), "inheritPipelineState")
    && (-[MTLRenderPipelineState supportIndirectCommandBuffers](-[MTLDebugRenderCommandEncoder renderPipelineState](self, "renderPipelineState"), "supportIndirectCommandBuffers") & 1) == 0)
  {
    MTLReportFailure();
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:](&v9, sel_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_, a3, a4, a5);
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  _BOOL8 v5;
  MTLToolsDevice *device;

  v5 = a5;
  _MTLMessageContextBegin_();
  if (-[MTLToolsDevice supportsCounterSampling:](self->super.super.super._device, "supportsCounterSampling:", 1))
  {
    if (!a3)
      goto LABEL_9;
  }
  else
  {
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_9;
  }
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C522D0) & 1) == 0)
  {
LABEL_8:
    _MTLMessageContextPush_();
    goto LABEL_9;
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    _MTLMessageContextPush_();
  if (objc_msgSend(a3, "sampleCount") <= a4)
  {
    objc_msgSend(a3, "sampleCount");
    goto LABEL_8;
  }
LABEL_9:
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 0);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampleCountersInBuffer:atSampleIndex:withBarrier:", objc_msgSend(a3, "baseObject"), a4, v5);
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4 maxBuffers:(unint64_t)a5 buffers:(MTLDebugFunctionArgument *)a6 buffersLength:(unint64_t)a7 stage:(unint64_t)a8
{
  MTLToolsDevice *device;
  uint64_t v16;
  MTLDebugFunctionArgument *v17;
  int64x2_t v18;
  MTLDebugFunctionArgument *v19;
  unint64_t v20;
  unint64_t v21;
  _MTLMessageContext v22;

  memset(&v22, 0, sizeof(v22));
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (a4 >= a5)
  {
    v20 = a4;
    v21 = a5;
    _MTLMessageContextPush_();
  }
  if ((objc_msgSend((id)-[MTLDevice baseObject](-[MTLToolsObject device](self, "device", v20, v21, v22.var0, v22.var1, *(_QWORD *)&v22.var2, v22.var3, v22.var4, v22.var5, v22.var6), "baseObject"), "supportsFunctionPointers") & 1) != 0)
  {
    if (!a3)
      goto LABEL_10;
  }
  else
  {
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_10;
  }
  if (!objc_msgSend(a3, "conformsToProtocol:", &unk_255C57818)
    || (device = self->super.super.super._device, device != (MTLToolsDevice *)objc_msgSend(a3, "device")))
  {
    _MTLMessageContextPush_();
  }
LABEL_10:
  if (a4 < a7)
    validateArg(MTLArgumentTypeVisibleFunctionTable, a4, &a6[a4], &v22);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  switch(a8)
  {
    case 2uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 3uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 4uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 5uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 6uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    default:
      break;
  }
  v16 = objc_msgSend(a3, "functionCount");
  if (MTLReportFailureTypeEnabled())
  {
    v17 = &a6[a4];
    v18.i64[0] = v17->type;
    v18.i64[1] = v17->var0;
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v18, (int64x2_t)xmmword_22CEAB6F0), (int32x4_t)vceqq_s64(*(int64x2_t *)&v17->bufferLength, (int64x2_t)(unint64_t)v16))))) & 1) == 0&& v17->bufferAttributeStride == -1&& *(_OWORD *)&v17->threadgroupMemoryLength == 0&& v17->object == a3&& a3&& !*(_QWORD *)&v17->lodMinClamp&& !v17->hasLodClamp)
    {
      MTLReportFailure();
    }
  }
  v19 = &a6[a4];
  v19->isValid = v16 != 0;
  v19->hasBeenUsed = 0;
  v19->type = 5;
  v19->object = (baseLevel *)a3;
  v19->var0 = 0;
  v19->bufferLength = v16;
  *(_OWORD *)&v19->bufferOffset = xmmword_22CEAB6E0;
  v19->threadgroupMemoryLength = 0;
  v19->threadgroupMemoryOffset = 0;
  v19->hasLodClamp = 0;
  v19->lodMinClamp = 0.0;
  v19->lodMaxClamp = 0.0;
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4 maxBuffers:(unint64_t)a5 buffers:(MTLDebugFunctionArgument *)a6 buffersLength:(unint64_t)a7 stage:(unint64_t)a8
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v14;
  MTLDebugFunctionArgument *v15;
  void *v16;
  MTLToolsDevice *device;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  NSUInteger v22;
  const void *v23;
  uint64_t v24;
  int64x2_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  const __CFString *v32;
  unint64_t v33;
  NSUInteger v34;
  int64x2_t v35;
  __int128 v36;
  _MTLMessageContext v37;
  uint64_t v38;

  *(_QWORD *)&v36 = a6;
  length = a4.length;
  location = a4.location;
  v38 = *MEMORY[0x24BDAC8D0];
  memset(&v37, 0, sizeof(v37));
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length > a5)
    _MTLMessageContextPush_();
  v35.i64[0] = a5;
  if ((objc_msgSend((id)-[MTLDevice baseObject](-[MTLToolsObject device](self, "device"), "baseObject"), "supportsFunctionPointers") & 1) == 0)_MTLMessageContextPush_();
  v33 = a8;
  v34 = location;
  if (length)
  {
    v14 = 0;
    v15 = (MTLDebugFunctionArgument *)(v36 + 88 * location);
    do
    {
      v16 = (void *)a3[v14];
      if (v16)
      {
        if ((objc_msgSend(v16, "conformsToProtocol:", &unk_255C57818) & 1) != 0)
        {
          device = self->super.super.super._device;
          if (device != (MTLToolsDevice *)objc_msgSend((id)a3[v14], "device"))
            _MTLMessageContextPush_();
          location = v34;
          if (!objc_msgSend((id)a3[v14], "stage") || objc_msgSend((id)a3[v14], "stage") == v33)
            goto LABEL_17;
          v32 = MTLDebugStageToString(objc_msgSend((id)a3[v14], "stage"));
          MTLDebugStageToString(v33);
        }
        _MTLMessageContextPush_();
      }
LABEL_17:
      if (location + v14 < a7)
        validateArg(MTLArgumentTypeVisibleFunctionTable, location + v14, v15, &v37);
      ++v14;
      ++v15;
    }
    while (length != v14);
  }
  v18 = _MTLMessageContextEnd();
  v31 = (uint64_t)&v31;
  MEMORY[0x24BDAC7A8](v18);
  v32 = (const __CFString *)((char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (length)
  {
    v20 = v36 + 88 * v34 + 40;
    v35 = (int64x2_t)xmmword_22CEAB6F0;
    v36 = xmmword_22CEAB6E0;
    v21 = (__CFString *)v32;
    v22 = length;
    do
    {
      objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 1);
      v21->isa = (void *)objc_msgSend((id)*a3, "baseObject");
      v23 = *a3;
      v24 = objc_msgSend((id)*a3, "functionCount");
      if (MTLReportFailureTypeEnabled())
      {
        v25.i64[0] = *(_QWORD *)(v20 - 32);
        v25.i64[1] = *(_QWORD *)(v20 - 16);
        if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v25, v35), (int32x4_t)vceqq_s64(*(int64x2_t *)(v20 - 8), (int64x2_t)(unint64_t)v24))))) & 1) == 0&& *(_QWORD *)(v20 + 8) == -1&& *(_OWORD *)(v20 + 16) == 0&& *(const void **)(v20 - 24) == v23&& v23&& !*(_QWORD *)(v20 + 36)&& !*(_BYTE *)(v20 + 32))
        {
          MTLReportFailure();
        }
      }
      *(_WORD *)(v20 - 40) = v24 != 0;
      *(_QWORD *)(v20 - 32) = 5;
      *(_QWORD *)(v20 - 24) = v23;
      *(_QWORD *)(v20 - 16) = 0;
      *(_QWORD *)(v20 - 8) = v24;
      *(_OWORD *)v20 = v36;
      *(_QWORD *)(v20 + 16) = 0;
      *(_QWORD *)(v20 + 24) = 0;
      *(_BYTE *)(v20 + 32) = 0;
      v21 = (__CFString *)((char *)v21 + 8);
      ++a3;
      *(_DWORD *)(v20 + 36) = 0;
      *(_DWORD *)(v20 + 40) = 0;
      v20 += 88;
      --v22;
    }
    while (v22);
  }
  switch(v33)
  {
    case 2uLL:
      v26 = -[MTLToolsObject baseObject](self, "baseObject");
      objc_msgSend(v26, "setVertexVisibleFunctionTables:withBufferRange:", v32, v34, length);
      break;
    case 3uLL:
      v27 = -[MTLToolsObject baseObject](self, "baseObject");
      objc_msgSend(v27, "setFragmentVisibleFunctionTables:withBufferRange:", v32, v34, length);
      break;
    case 4uLL:
      v28 = -[MTLToolsObject baseObject](self, "baseObject");
      objc_msgSend(v28, "setTileVisibleFunctionTables:withBufferRange:", v32, v34, length);
      break;
    case 5uLL:
      v29 = -[MTLToolsObject baseObject](self, "baseObject");
      objc_msgSend(v29, "setObjectVisibleFunctionTables:withBufferRange:", v32, v34, length);
      break;
    case 6uLL:
      v30 = -[MTLToolsObject baseObject](self, "baseObject");
      objc_msgSend(v30, "setMeshVisibleFunctionTables:withBufferRange:", v32, v34, length);
      break;
    default:
      return;
  }
}

- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLDebugRenderCommandEncoder setVisibleFunctionTable:atBufferIndex:maxBuffers:buffers:buffersLength:stage:](self, "setVisibleFunctionTable:atBufferIndex:maxBuffers:buffers:buffersLength:stage:", a3, a4, self->_attachmentWriteMask, &self->_vertexBuffers[0].type, 36, 2);
}

- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLDebugRenderCommandEncoder setVisibleFunctionTables:withBufferRange:maxBuffers:buffers:buffersLength:stage:](self, "setVisibleFunctionTables:withBufferRange:maxBuffers:buffers:buffersLength:stage:", a3, a4.location, a4.length, self->_attachmentWriteMask, &self->_vertexBuffers[0].type, 36, 2);
}

- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLDebugRenderCommandEncoder setVisibleFunctionTable:atBufferIndex:maxBuffers:buffers:buffersLength:stage:](self, "setVisibleFunctionTable:atBufferIndex:maxBuffers:buffers:buffersLength:stage:", a3, a4, -[MTLToolsDevice maxFragmentBuffers](self->super.super.super._device, "maxFragmentBuffers"), &self->_fragmentBuffers[0].type, 31, 3);
}

- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLDebugRenderCommandEncoder setVisibleFunctionTables:withBufferRange:maxBuffers:buffers:buffersLength:stage:](self, "setVisibleFunctionTables:withBufferRange:maxBuffers:buffers:buffersLength:stage:", a3, a4.location, a4.length, -[MTLToolsDevice maxFragmentBuffers](self->super.super.super._device, "maxFragmentBuffers"), &self->_fragmentBuffers[0].type, 31, 3);
}

- (void)setTileVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLDebugRenderCommandEncoder setVisibleFunctionTable:atBufferIndex:maxBuffers:buffers:buffersLength:stage:](self, "setVisibleFunctionTable:atBufferIndex:maxBuffers:buffers:buffersLength:stage:", a3, a4, -[MTLToolsDevice maxTileBuffers](self->super.super.super._device, "maxTileBuffers"), &self->_tileBuffers[0].type, 31, 4);
}

- (void)setTileVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLDebugRenderCommandEncoder setVisibleFunctionTables:withBufferRange:maxBuffers:buffers:buffersLength:stage:](self, "setVisibleFunctionTables:withBufferRange:maxBuffers:buffers:buffersLength:stage:", a3, a4.location, a4.length, -[MTLToolsDevice maxTileBuffers](self->super.super.super._device, "maxTileBuffers"), &self->_tileBuffers[0].type, 31, 4);
}

- (void)setObjectVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLDebugRenderCommandEncoder setVisibleFunctionTable:atBufferIndex:maxBuffers:buffers:buffersLength:stage:](self, "setVisibleFunctionTable:atBufferIndex:maxBuffers:buffers:buffersLength:stage:", a3, a4, -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers"), &self->_objectBuffers[0].type, 36, 5);
}

- (void)setObjectVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLDebugRenderCommandEncoder setVisibleFunctionTables:withBufferRange:maxBuffers:buffers:buffersLength:stage:](self, "setVisibleFunctionTables:withBufferRange:maxBuffers:buffers:buffersLength:stage:", a3, a4.location, a4.length, -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers"), &self->_objectBuffers[0].type, 36, 5);
}

- (void)setMeshVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLDebugRenderCommandEncoder setVisibleFunctionTable:atBufferIndex:maxBuffers:buffers:buffersLength:stage:](self, "setVisibleFunctionTable:atBufferIndex:maxBuffers:buffers:buffersLength:stage:", a3, a4, -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers"), &self->_meshBuffers[0].type, 36, 6);
}

- (void)setMeshVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLDebugRenderCommandEncoder setVisibleFunctionTables:withBufferRange:maxBuffers:buffers:buffersLength:stage:](self, "setVisibleFunctionTables:withBufferRange:maxBuffers:buffers:buffersLength:stage:", a3, a4.location, a4.length, -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers"), &self->_meshBuffers[0].type, 36, 6);
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4 maxBuffers:(unint64_t)a5 buffers:(MTLDebugFunctionArgument *)a6 buffersLength:(unint64_t)a7 stage:(unint64_t)a8
{
  MTLToolsDevice *device;
  uint64_t v16;
  MTLDebugFunctionArgument *v17;
  int64x2_t v18;
  MTLDebugFunctionArgument *v19;
  unint64_t v20;
  unint64_t v21;
  _MTLMessageContext v22;

  memset(&v22, 0, sizeof(v22));
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (a4 >= a5)
  {
    v20 = a4;
    v21 = a5;
    _MTLMessageContextPush_();
    if (!a3)
      goto LABEL_12;
  }
  else if (!a3)
  {
    goto LABEL_12;
  }
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C6D340, v20, v21, v22.var0, v22.var1, *(_QWORD *)&v22.var2, v22.var3, v22.var4, v22.var5, v22.var6) & 1) == 0)
  {
LABEL_11:
    _MTLMessageContextPush_();
    goto LABEL_12;
  }
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    _MTLMessageContextPush_();
  if (objc_msgSend(a3, "stage") && objc_msgSend(a3, "stage") != a8)
  {
    v20 = (unint64_t)MTLDebugStageToString(objc_msgSend(a3, "stage"));
    v21 = (unint64_t)MTLDebugStageToString(a8);
    goto LABEL_11;
  }
LABEL_12:
  if (a4 < a7)
    validateArg(MTLArgumentTypeBuffer, a4, &a6[a4], &v22);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  switch(a8)
  {
    case 2uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexIntersectionFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 3uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentIntersectionFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 4uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileIntersectionFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 5uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectIntersectionFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 6uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshIntersectionFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    default:
      break;
  }
  v16 = objc_msgSend(a3, "functionCount", v20, v21);
  if (MTLReportFailureTypeEnabled())
  {
    v17 = &a6[a4];
    v18.i64[0] = v17->type;
    v18.i64[1] = v17->var0;
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v18, (int64x2_t)xmmword_22CEAB700), (int32x4_t)vceqq_s64(*(int64x2_t *)&v17->bufferLength, (int64x2_t)(unint64_t)v16))))) & 1) == 0&& v17->bufferAttributeStride == -1&& *(_OWORD *)&v17->threadgroupMemoryLength == 0&& v17->object == a3&& a3&& !*(_QWORD *)&v17->lodMinClamp&& !v17->hasLodClamp)
    {
      MTLReportFailure();
    }
  }
  v19 = &a6[a4];
  v19->isValid = v16 != 0;
  v19->hasBeenUsed = 0;
  v19->type = 6;
  v19->object = (baseLevel *)a3;
  v19->var0 = 0;
  v19->bufferLength = v16;
  *(_OWORD *)&v19->bufferOffset = xmmword_22CEAB6E0;
  v19->threadgroupMemoryLength = 0;
  v19->threadgroupMemoryOffset = 0;
  v19->hasLodClamp = 0;
  v19->lodMinClamp = 0.0;
  v19->lodMaxClamp = 0.0;
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4 maxBuffers:(unint64_t)a5 buffers:(MTLDebugFunctionArgument *)a6 buffersLength:(unint64_t)a7 stage:(unint64_t)a8
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v14;
  MTLDebugFunctionArgument *v15;
  void *v16;
  MTLToolsDevice *device;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  NSUInteger v22;
  const void *v23;
  uint64_t v24;
  int64x2_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  const __CFString *v32;
  unint64_t v33;
  NSUInteger v34;
  int64x2_t v35;
  __int128 v36;
  _MTLMessageContext v37;
  uint64_t v38;

  *(_QWORD *)&v36 = a6;
  length = a4.length;
  location = a4.location;
  v38 = *MEMORY[0x24BDAC8D0];
  memset(&v37, 0, sizeof(v37));
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (location + length > a5)
    _MTLMessageContextPush_();
  v34 = location;
  v35.i64[0] = a5;
  v33 = a8;
  if (length)
  {
    v14 = 0;
    v15 = (MTLDebugFunctionArgument *)(v36 + 88 * location);
    do
    {
      v16 = (void *)a3[v14];
      if (v16)
      {
        if ((objc_msgSend(v16, "conformsToProtocol:", &unk_255C6D340) & 1) != 0)
        {
          device = self->super.super.super._device;
          if (device != (MTLToolsDevice *)objc_msgSend((id)a3[v14], "device"))
            _MTLMessageContextPush_();
          location = v34;
          if (!objc_msgSend((id)a3[v14], "stage") || objc_msgSend((id)a3[v14], "stage") == v33)
            goto LABEL_15;
          v32 = MTLDebugStageToString(objc_msgSend((id)a3[v14], "stage"));
          MTLDebugStageToString(v33);
        }
        _MTLMessageContextPush_();
      }
LABEL_15:
      if (location + v14 < a7)
        validateArg(MTLArgumentTypeBuffer, location + v14, v15, &v37);
      ++v14;
      ++v15;
    }
    while (length != v14);
  }
  v18 = _MTLMessageContextEnd();
  v31 = (uint64_t)&v31;
  MEMORY[0x24BDAC7A8](v18);
  v32 = (const __CFString *)((char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (length)
  {
    v20 = v36 + 88 * v34 + 40;
    v35 = (int64x2_t)xmmword_22CEAB700;
    v36 = xmmword_22CEAB6E0;
    v21 = (__CFString *)v32;
    v22 = length;
    do
    {
      objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", *a3, 1, 1);
      v21->isa = (void *)objc_msgSend((id)*a3, "baseObject");
      v23 = *a3;
      v24 = objc_msgSend((id)*a3, "functionCount");
      if (MTLReportFailureTypeEnabled())
      {
        v25.i64[0] = *(_QWORD *)(v20 - 32);
        v25.i64[1] = *(_QWORD *)(v20 - 16);
        if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v25, v35), (int32x4_t)vceqq_s64(*(int64x2_t *)(v20 - 8), (int64x2_t)(unint64_t)v24))))) & 1) == 0&& *(_QWORD *)(v20 + 8) == -1&& *(_OWORD *)(v20 + 16) == 0&& *(const void **)(v20 - 24) == v23&& v23&& !*(_QWORD *)(v20 + 36)&& !*(_BYTE *)(v20 + 32))
        {
          MTLReportFailure();
        }
      }
      *(_WORD *)(v20 - 40) = v24 != 0;
      *(_QWORD *)(v20 - 32) = 6;
      *(_QWORD *)(v20 - 24) = v23;
      *(_QWORD *)(v20 - 16) = 0;
      *(_QWORD *)(v20 - 8) = v24;
      *(_OWORD *)v20 = v36;
      *(_QWORD *)(v20 + 16) = 0;
      *(_QWORD *)(v20 + 24) = 0;
      *(_BYTE *)(v20 + 32) = 0;
      v21 = (__CFString *)((char *)v21 + 8);
      ++a3;
      *(_DWORD *)(v20 + 36) = 0;
      *(_DWORD *)(v20 + 40) = 0;
      v20 += 88;
      --v22;
    }
    while (v22);
  }
  switch(v33)
  {
    case 2uLL:
      v26 = -[MTLToolsObject baseObject](self, "baseObject");
      objc_msgSend(v26, "setVertexIntersectionFunctionTables:withBufferRange:", v32, v34, length);
      break;
    case 3uLL:
      v27 = -[MTLToolsObject baseObject](self, "baseObject");
      objc_msgSend(v27, "setFragmentIntersectionFunctionTables:withBufferRange:", v32, v34, length);
      break;
    case 4uLL:
      v28 = -[MTLToolsObject baseObject](self, "baseObject");
      objc_msgSend(v28, "setTileIntersectionFunctionTables:withBufferRange:", v32, v34, length);
      break;
    case 5uLL:
      v29 = -[MTLToolsObject baseObject](self, "baseObject");
      objc_msgSend(v29, "setObjectIntersectionFunctionTables:withBufferRange:", v32, v34, length);
      break;
    case 6uLL:
      v30 = -[MTLToolsObject baseObject](self, "baseObject");
      objc_msgSend(v30, "setMeshIntersectionFunctionTables:withBufferRange:", v32, v34, length);
      break;
    default:
      return;
  }
}

- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLDebugRenderCommandEncoder setIntersectionFunctionTable:atBufferIndex:maxBuffers:buffers:buffersLength:stage:](self, "setIntersectionFunctionTable:atBufferIndex:maxBuffers:buffers:buffersLength:stage:", a3, a4, self->_attachmentWriteMask, &self->_vertexBuffers[0].type, 36, 2);
}

- (void)setVertexIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLDebugRenderCommandEncoder setIntersectionFunctionTables:withBufferRange:maxBuffers:buffers:buffersLength:stage:](self, "setIntersectionFunctionTables:withBufferRange:maxBuffers:buffers:buffersLength:stage:", a3, a4.location, a4.length, self->_attachmentWriteMask, &self->_vertexBuffers[0].type, 36, 2);
}

- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLDebugRenderCommandEncoder setIntersectionFunctionTable:atBufferIndex:maxBuffers:buffers:buffersLength:stage:](self, "setIntersectionFunctionTable:atBufferIndex:maxBuffers:buffers:buffersLength:stage:", a3, a4, -[MTLToolsDevice maxFragmentBuffers](self->super.super.super._device, "maxFragmentBuffers"), &self->_fragmentBuffers[0].type, 31, 3);
}

- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLDebugRenderCommandEncoder setIntersectionFunctionTables:withBufferRange:maxBuffers:buffers:buffersLength:stage:](self, "setIntersectionFunctionTables:withBufferRange:maxBuffers:buffers:buffersLength:stage:", a3, a4.location, a4.length, -[MTLToolsDevice maxFragmentBuffers](self->super.super.super._device, "maxFragmentBuffers"), &self->_fragmentBuffers[0].type, 31, 3);
}

- (void)setTileIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLDebugRenderCommandEncoder setIntersectionFunctionTable:atBufferIndex:maxBuffers:buffers:buffersLength:stage:](self, "setIntersectionFunctionTable:atBufferIndex:maxBuffers:buffers:buffersLength:stage:", a3, a4, -[MTLToolsDevice maxTileBuffers](self->super.super.super._device, "maxTileBuffers"), &self->_tileBuffers[0].type, 31, 4);
}

- (void)setTileIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLDebugRenderCommandEncoder setIntersectionFunctionTables:withBufferRange:maxBuffers:buffers:buffersLength:stage:](self, "setIntersectionFunctionTables:withBufferRange:maxBuffers:buffers:buffersLength:stage:", a3, a4.location, a4.length, -[MTLToolsDevice maxTileBuffers](self->super.super.super._device, "maxTileBuffers"), &self->_tileBuffers[0].type, 31, 4);
}

- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4 maxBuffers:(unint64_t)a5 buffers:(MTLDebugFunctionArgument *)a6 buffersLength:(unint64_t)a7 stage:(unint64_t)a8
{
  uint64_t v15;
  MTLDebugFunctionArgument *v16;
  int64x2_t v17;
  MTLDebugFunctionArgument *v18;
  unint64_t v19;
  unint64_t v20;
  _MTLMessageContext v21;

  memset(&v21, 0, sizeof(v21));
  _MTLMessageContextBegin_();
  if ((BYTE2(self->_visibilityOffsets) & 1) != 0)
    _MTLMessageContextPush_();
  if (a4 >= a5)
  {
    v19 = a4;
    v20 = a5;
    _MTLMessageContextPush_();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 1, (uint64_t)CFSTR("Acceleration structure"));
  if (a4 < a7)
    validateArg(MTLArgumentTypePrimitiveAccelerationStructure, a4, &a6[a4], &v21);
  _MTLMessageContextEnd();
  objc_msgSend((id)self->_maxVertexBuffers, "addObject:retained:purgeable:", a3, 1, 1);
  switch(a8)
  {
    case 2uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexAccelerationStructure:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 3uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentAccelerationStructure:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 4uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileAccelerationStructure:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 5uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectAccelerationStructure:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    case 6uLL:
      objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshAccelerationStructure:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
      break;
    default:
      break;
  }
  v15 = objc_msgSend(a3, "size", v19, v20, v21.var0, v21.var1, *(_QWORD *)&v21.var2, v21.var3, v21.var4, v21.var5, v21.var6);
  if (MTLReportFailureTypeEnabled())
  {
    v16 = &a6[a4];
    v17.i64[0] = v16->type;
    v17.i64[1] = v16->var0;
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v17, (int64x2_t)xmmword_22CEAB6D0), (int32x4_t)vceqq_s64(*(int64x2_t *)&v16->bufferLength, (int64x2_t)(unint64_t)v15))))) & 1) == 0&& v16->bufferAttributeStride == -1&& *(_OWORD *)&v16->threadgroupMemoryLength == 0&& v16->object == a3&& a3&& !*(_QWORD *)&v16->lodMinClamp&& !v16->hasLodClamp)
    {
      MTLReportFailure();
    }
  }
  v18 = &a6[a4];
  v18->isValid = v15 != 0;
  v18->hasBeenUsed = 0;
  v18->type = 4;
  v18->object = (baseLevel *)a3;
  v18->var0 = 0;
  v18->bufferLength = v15;
  *(_OWORD *)&v18->bufferOffset = xmmword_22CEAB6E0;
  v18->threadgroupMemoryLength = 0;
  v18->threadgroupMemoryOffset = 0;
  v18->hasLodClamp = 0;
  v18->lodMinClamp = 0.0;
  v18->lodMaxClamp = 0.0;
}

- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLDebugRenderCommandEncoder setAccelerationStructure:atBufferIndex:maxBuffers:buffers:buffersLength:stage:](self, "setAccelerationStructure:atBufferIndex:maxBuffers:buffers:buffersLength:stage:", a3, a4, self->_attachmentWriteMask, &self->_vertexBuffers[0].type, 36, 2);
}

- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLDebugRenderCommandEncoder setAccelerationStructure:atBufferIndex:maxBuffers:buffers:buffersLength:stage:](self, "setAccelerationStructure:atBufferIndex:maxBuffers:buffers:buffersLength:stage:", a3, a4, -[MTLToolsDevice maxFragmentBuffers](self->super.super.super._device, "maxFragmentBuffers"), &self->_fragmentBuffers[0].type, 31, 3);
}

- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLDebugRenderCommandEncoder setAccelerationStructure:atBufferIndex:maxBuffers:buffers:buffersLength:stage:](self, "setAccelerationStructure:atBufferIndex:maxBuffers:buffers:buffersLength:stage:", a3, a4, -[MTLToolsDevice maxTileBuffers](self->super.super.super._device, "maxTileBuffers"), &self->_tileBuffers[0].type, 31, 4);
}

- (void)setObjectIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLDebugRenderCommandEncoder setIntersectionFunctionTable:atBufferIndex:maxBuffers:buffers:buffersLength:stage:](self, "setIntersectionFunctionTable:atBufferIndex:maxBuffers:buffers:buffersLength:stage:", a3, a4, self->_attachmentWriteMask, &self->_vertexBuffers[0].type, 36, 5);
}

- (void)setObjectIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLDebugRenderCommandEncoder setIntersectionFunctionTables:withBufferRange:maxBuffers:buffers:buffersLength:stage:](self, "setIntersectionFunctionTables:withBufferRange:maxBuffers:buffers:buffersLength:stage:", a3, a4.location, a4.length, self->_attachmentWriteMask, &self->_vertexBuffers[0].type, 36, 5);
}

- (void)setObjectAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLDebugRenderCommandEncoder setAccelerationStructure:atBufferIndex:maxBuffers:buffers:buffersLength:stage:](self, "setAccelerationStructure:atBufferIndex:maxBuffers:buffers:buffersLength:stage:", a3, a4, self->_attachmentWriteMask, &self->_vertexBuffers[0].type, 36, 5);
}

- (void)setMeshIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLDebugRenderCommandEncoder setIntersectionFunctionTable:atBufferIndex:maxBuffers:buffers:buffersLength:stage:](self, "setIntersectionFunctionTable:atBufferIndex:maxBuffers:buffers:buffersLength:stage:", a3, a4, self->_attachmentWriteMask, &self->_vertexBuffers[0].type, 36, 6);
}

- (void)setMeshIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLDebugRenderCommandEncoder setIntersectionFunctionTables:withBufferRange:maxBuffers:buffers:buffersLength:stage:](self, "setIntersectionFunctionTables:withBufferRange:maxBuffers:buffers:buffersLength:stage:", a3, a4.location, a4.length, self->_attachmentWriteMask, &self->_vertexBuffers[0].type, 36, 6);
}

- (void)setMeshAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLDebugRenderCommandEncoder setAccelerationStructure:atBufferIndex:maxBuffers:buffers:buffersLength:stage:](self, "setAccelerationStructure:atBufferIndex:maxBuffers:buffers:buffersLength:stage:", a3, a4, self->_attachmentWriteMask, &self->_vertexBuffers[0].type, 36, 6);
}

- (void)enableNullBufferBinds:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  LOBYTE(self->_depthBias) = a3;
  -[MTLToolsObject baseObject](self, "baseObject");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "enableNullBufferBinds:", v3);
}

- (void)useResidencySet:(id)a3
{
  objc_super v5;

  if (!a3)
    MTLReportFailure();
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder useResidencySet:](&v5, sel_useResidencySet_, a3);
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
  v9.super_class = (Class)MTLDebugRenderCommandEncoder;
  -[MTLToolsRenderCommandEncoder useResidencySets:count:](&v9, sel_useResidencySets_count_, a3, a4, v8);
}

- (unint64_t)attachmentWriteMask
{
  return self->_objectThreadsPerTG.width;
}

- (MTLRenderPassDescriptor)descriptor
{
  return (MTLRenderPassDescriptor *)self->_frontFacingWinding;
}

- (unint64_t)frontFacingWinding
{
  return self->_cullMode;
}

- (unint64_t)cullMode
{
  return self->_depthClipMode;
}

- (unint64_t)depthClipMode
{
  return self->_triangleFillMode;
}

- (float)lineWidth
{
  return self->_depthBiasSlopeScale;
}

- (float)depthBias
{
  return self->_depthBiasClamp;
}

- (float)depthBiasSlopeScale
{
  return *(float *)&self->_frontStencilRef;
}

- (float)depthBiasClamp
{
  return *(float *)&self->_backStencilRef;
}

- (unint64_t)triangleFillMode
{
  return (unint64_t)self->_renderPipelineState;
}

- (MTLRenderPipelineState)renderPipelineState
{
  return (MTLRenderPipelineState *)self->_peakPerSampleStorage;
}

- (unint64_t)peakPerSampleStorage
{
  return self->_resolvedSampleCount;
}

- (unint64_t)resolvedSampleCount
{
  return (unint64_t)self->_depthStencilState;
}

- (MTLDepthStencilState)depthStencilState
{
  return (MTLDepthStencilState *)self->_defaultDepthStencilDescriptor;
}

- (MTLDepthStencilDescriptor)defaultDepthStencilDescriptor
{
  return (MTLDepthStencilDescriptor *)self->_visibilityResultMode;
}

- (unsigned)frontStencilRef
{
  return LODWORD(self->_blendColorRed);
}

- (unsigned)backStencilRef
{
  return LODWORD(self->_blendColorGreen);
}

- (unint64_t)visibilityResultMode
{
  return self->_visibilityResultOffset;
}

- (unint64_t)visibilityResultOffset
{
  return self->_width;
}

- (float)blendColorRed
{
  return self->_blendColorBlue;
}

- (float)blendColorGreen
{
  return self->_blendColorAlpha;
}

- (float)blendColorBlue
{
  return self->_tessellationFactorScale;
}

- (float)blendColorAlpha
{
  return *(float *)&self->_descriptor;
}

- (unint64_t)width
{
  return self->_height;
}

- (unint64_t)height
{
  return self->_tessellationFactorBufferInstanceStride;
}

- (MTLDebugFunctionArgument)tessellationFactorBufferArgument
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[949].threadgroupMemoryOffset;
  *(_OWORD *)&retstr->bufferLength = *(_OWORD *)&self[949].bufferAttributeStride;
  *(_OWORD *)&retstr->bufferAttributeStride = v3;
  *(_OWORD *)&retstr->threadgroupMemoryOffset = *(_OWORD *)&self[949].lodMaxClamp;
  *(_QWORD *)&retstr->lodMaxClamp = self[950].type;
  v4 = *(_OWORD *)&self[949].bufferLength;
  *(_OWORD *)&retstr->isValid = *(_OWORD *)&self[949].object;
  *(_OWORD *)&retstr->object = v4;
  return self;
}

- (unint64_t)tessellationFactorBufferInstanceStride
{
  return *(_QWORD *)&self->_tessellationFactorBufferArgument.isValid;
}

- (float)tessellationFactorScale
{
  return *((float *)&self->_descriptor + 1);
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v4;

  std::deque<objc_object *>::~deque[abi:ne180100](&self->_updatedFences.__map_.var0);
  end = self->_scissorRects.__end_;
  if (end)
  {
    self->_scissorRects.__end_cap_.__value_ = end;
    operator delete(end);
  }
  v4 = self->_viewports.__end_;
  if (v4)
  {
    self->_viewports.__end_cap_.__value_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;

  v2 = 248;
  v3 = 36;
  do
  {
    v4 = (char *)self + v2;
    *((_QWORD *)v4 + 3) = 0;
    *((_QWORD *)v4 + 4) = 0;
    *((_QWORD *)v4 + 5) = 0;
    *((_QWORD *)v4 + 6) = -1;
    *((_DWORD *)v4 + 19) = 0;
    *((_DWORD *)v4 + 20) = 0;
    *((_QWORD *)v4 + 7) = 0;
    *((_QWORD *)v4 + 8) = 0;
    v2 += 88;
    v4[72] = 0;
    --v3;
  }
  while (v3);
  v5 = 3416;
  v6 = 128;
  do
  {
    v7 = (char *)self + v5;
    *((_QWORD *)v7 + 3) = 0;
    *((_QWORD *)v7 + 4) = 0;
    *((_QWORD *)v7 + 5) = 0;
    *((_QWORD *)v7 + 6) = -1;
    *((_DWORD *)v7 + 19) = 0;
    *((_DWORD *)v7 + 20) = 0;
    *((_QWORD *)v7 + 7) = 0;
    *((_QWORD *)v7 + 8) = 0;
    v5 += 88;
    v7[72] = 0;
    --v6;
  }
  while (v6);
  v8 = 14680;
  v9 = 16;
  do
  {
    v10 = (char *)self + v8;
    *((_QWORD *)v10 + 3) = 0;
    *((_QWORD *)v10 + 4) = 0;
    *((_QWORD *)v10 + 5) = 0;
    *((_QWORD *)v10 + 6) = -1;
    *((_DWORD *)v10 + 19) = 0;
    *((_DWORD *)v10 + 20) = 0;
    *((_QWORD *)v10 + 7) = 0;
    *((_QWORD *)v10 + 8) = 0;
    v8 += 88;
    v10[72] = 0;
    --v9;
  }
  while (v9);
  v11 = 16088;
  v12 = 31;
  do
  {
    v13 = (char *)self + v11;
    *((_QWORD *)v13 + 3) = 0;
    *((_QWORD *)v13 + 4) = 0;
    *((_QWORD *)v13 + 5) = 0;
    *((_QWORD *)v13 + 6) = -1;
    *((_DWORD *)v13 + 19) = 0;
    *((_DWORD *)v13 + 20) = 0;
    *((_QWORD *)v13 + 7) = 0;
    *((_QWORD *)v13 + 8) = 0;
    v11 += 88;
    v13[72] = 0;
    --v12;
  }
  while (v12);
  v14 = 18816;
  v15 = 128;
  do
  {
    v16 = (char *)self + v14;
    *((_QWORD *)v16 + 3) = 0;
    *((_QWORD *)v16 + 4) = 0;
    *((_QWORD *)v16 + 5) = 0;
    *((_QWORD *)v16 + 6) = -1;
    *((_DWORD *)v16 + 19) = 0;
    *((_DWORD *)v16 + 20) = 0;
    *((_QWORD *)v16 + 7) = 0;
    *((_QWORD *)v16 + 8) = 0;
    v14 += 88;
    v16[72] = 0;
    --v15;
  }
  while (v15);
  v17 = 30080;
  v18 = 16;
  do
  {
    v19 = (char *)self + v17;
    *((_QWORD *)v19 + 3) = 0;
    *((_QWORD *)v19 + 4) = 0;
    *((_QWORD *)v19 + 5) = 0;
    *((_QWORD *)v19 + 6) = -1;
    *((_DWORD *)v19 + 19) = 0;
    *((_DWORD *)v19 + 20) = 0;
    *((_QWORD *)v19 + 7) = 0;
    *((_QWORD *)v19 + 8) = 0;
    v17 += 88;
    v19[72] = 0;
    --v18;
  }
  while (v18);
  v20 = 31488;
  v21 = 31;
  do
  {
    v22 = (char *)self + v20;
    *((_QWORD *)v22 + 3) = 0;
    *((_QWORD *)v22 + 4) = 0;
    *((_QWORD *)v22 + 5) = 0;
    *((_QWORD *)v22 + 6) = -1;
    *((_DWORD *)v22 + 19) = 0;
    *((_DWORD *)v22 + 20) = 0;
    *((_QWORD *)v22 + 7) = 0;
    *((_QWORD *)v22 + 8) = 0;
    v20 += 88;
    v22[72] = 0;
    --v21;
  }
  while (v21);
  v23 = 34216;
  v24 = 128;
  do
  {
    v25 = (char *)self + v23;
    *((_QWORD *)v25 + 3) = 0;
    *((_QWORD *)v25 + 4) = 0;
    *((_QWORD *)v25 + 5) = 0;
    *((_QWORD *)v25 + 6) = -1;
    *((_DWORD *)v25 + 19) = 0;
    *((_DWORD *)v25 + 20) = 0;
    *((_QWORD *)v25 + 7) = 0;
    *((_QWORD *)v25 + 8) = 0;
    v23 += 88;
    v25[72] = 0;
    --v24;
  }
  while (v24);
  v26 = 45480;
  v27 = 16;
  do
  {
    v28 = (char *)self + v26;
    *((_QWORD *)v28 + 3) = 0;
    *((_QWORD *)v28 + 4) = 0;
    *((_QWORD *)v28 + 5) = 0;
    *((_QWORD *)v28 + 6) = -1;
    *((_DWORD *)v28 + 19) = 0;
    *((_DWORD *)v28 + 20) = 0;
    *((_QWORD *)v28 + 7) = 0;
    *((_QWORD *)v28 + 8) = 0;
    v26 += 88;
    v28[72] = 0;
    --v27;
  }
  while (v27);
  v29 = 46888;
  v30 = 31;
  do
  {
    v31 = (char *)self + v29;
    *((_QWORD *)v31 + 3) = 0;
    *((_QWORD *)v31 + 4) = 0;
    *((_QWORD *)v31 + 5) = 0;
    *((_QWORD *)v31 + 6) = -1;
    *((_DWORD *)v31 + 19) = 0;
    *((_DWORD *)v31 + 20) = 0;
    *((_QWORD *)v31 + 7) = 0;
    *((_QWORD *)v31 + 8) = 0;
    v29 += 88;
    v31[72] = 0;
    --v30;
  }
  while (v30);
  v32 = 49616;
  v33 = 31;
  do
  {
    v34 = (char *)self + v32;
    *((_QWORD *)v34 + 3) = 0;
    *((_QWORD *)v34 + 4) = 0;
    *((_QWORD *)v34 + 5) = 0;
    *((_QWORD *)v34 + 6) = -1;
    *((_DWORD *)v34 + 19) = 0;
    *((_DWORD *)v34 + 20) = 0;
    *((_QWORD *)v34 + 7) = 0;
    *((_QWORD *)v34 + 8) = 0;
    v32 += 88;
    v34[72] = 0;
    --v33;
  }
  while (v33);
  v35 = 52344;
  v36 = 128;
  do
  {
    v37 = (char *)self + v35;
    *((_QWORD *)v37 + 3) = 0;
    *((_QWORD *)v37 + 4) = 0;
    *((_QWORD *)v37 + 5) = 0;
    *((_QWORD *)v37 + 6) = -1;
    *((_DWORD *)v37 + 19) = 0;
    *((_DWORD *)v37 + 20) = 0;
    *((_QWORD *)v37 + 7) = 0;
    *((_QWORD *)v37 + 8) = 0;
    v35 += 88;
    v37[72] = 0;
    --v36;
  }
  while (v36);
  v38 = 63608;
  v39 = 16;
  do
  {
    v40 = (char *)self + v38;
    *((_QWORD *)v40 + 3) = 0;
    *((_QWORD *)v40 + 4) = 0;
    *((_QWORD *)v40 + 5) = 0;
    *((_QWORD *)v40 + 6) = -1;
    *((_DWORD *)v40 + 19) = 0;
    *((_DWORD *)v40 + 20) = 0;
    *((_QWORD *)v40 + 7) = 0;
    *((_QWORD *)v40 + 8) = 0;
    v38 += 88;
    v40[72] = 0;
    --v39;
  }
  while (v39);
  v41 = 65016;
  v42 = 31;
  do
  {
    v43 = (char *)self + v41;
    *((_QWORD *)v43 + 3) = 0;
    *((_QWORD *)v43 + 4) = 0;
    *((_QWORD *)v43 + 5) = 0;
    *((_QWORD *)v43 + 6) = -1;
    *((_DWORD *)v43 + 19) = 0;
    *((_DWORD *)v43 + 20) = 0;
    *((_QWORD *)v43 + 7) = 0;
    *((_QWORD *)v43 + 8) = 0;
    v41 += 88;
    v43[72] = 0;
    --v42;
  }
  while (v42);
  v44 = 67744;
  v45 = 31;
  do
  {
    v46 = (char *)self + v44;
    *((_QWORD *)v46 + 3) = 0;
    *((_QWORD *)v46 + 4) = 0;
    *((_QWORD *)v46 + 5) = 0;
    *((_QWORD *)v46 + 6) = -1;
    *((_DWORD *)v46 + 19) = 0;
    *((_DWORD *)v46 + 20) = 0;
    *((_QWORD *)v46 + 7) = 0;
    *((_QWORD *)v46 + 8) = 0;
    v44 += 88;
    v46[72] = 0;
    --v45;
  }
  while (v45);
  v47 = 70472;
  v48 = 128;
  do
  {
    v49 = (char *)self + v47;
    *((_QWORD *)v49 + 3) = 0;
    *((_QWORD *)v49 + 4) = 0;
    *((_QWORD *)v49 + 5) = 0;
    *((_QWORD *)v49 + 6) = -1;
    *((_DWORD *)v49 + 19) = 0;
    *((_DWORD *)v49 + 20) = 0;
    *((_QWORD *)v49 + 7) = 0;
    *((_QWORD *)v49 + 8) = 0;
    v47 += 88;
    v49[72] = 0;
    --v48;
  }
  while (v48);
  v50 = 81736;
  v51 = 16;
  do
  {
    v52 = (char *)self + v50;
    *((_QWORD *)v52 + 3) = 0;
    *((_QWORD *)v52 + 4) = 0;
    *((_QWORD *)v52 + 5) = 0;
    *((_QWORD *)v52 + 6) = -1;
    *((_DWORD *)v52 + 19) = 0;
    *((_DWORD *)v52 + 20) = 0;
    *((_QWORD *)v52 + 7) = 0;
    *((_QWORD *)v52 + 8) = 0;
    v50 += 88;
    v52[72] = 0;
    --v51;
  }
  while (v51);
  *((_QWORD *)self + 10396) = 0;
  *((_QWORD *)self + 10397) = 0;
  *((_QWORD *)self + 10395) = 0;
  *((_QWORD *)self + 10399) = 0;
  *((_QWORD *)self + 10400) = 0;
  *((_QWORD *)self + 10398) = 0;
  *((_OWORD *)self + 5202) = 0u;
  *((_OWORD *)self + 5203) = 0u;
  *((_OWORD *)self + 5204) = 0u;
  *((_QWORD *)self + 10444) = 0;
  *((_QWORD *)self + 10445) = 0;
  *((_QWORD *)self + 10446) = 0;
  *((_QWORD *)self + 10447) = -1;
  *((_DWORD *)self + 20901) = 0;
  *((_DWORD *)self + 20902) = 0;
  *((_BYTE *)self + 83600) = 0;
  *((_QWORD *)self + 10448) = 0;
  *((_QWORD *)self + 10449) = 0;
  return self;
}

@end
