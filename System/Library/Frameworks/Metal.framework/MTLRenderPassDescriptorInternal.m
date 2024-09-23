@implementation MTLRenderPassDescriptorInternal

- (const)_descriptorPrivate
{
  return &self->_private;
}

- (id)rasterizationRateMap
{
  return self->_private.rasterizationRateMap;
}

- (void)setRenderTargetWidth:(unint64_t)a3
{
  self->_private.renderTargetWidth = a3;
}

- (void)setRenderTargetHeight:(unint64_t)a3
{
  self->_private.renderTargetHeight = a3;
}

- (unint64_t)renderTargetArrayLength
{
  return self->_private.renderTargetArrayLength;
}

- (BOOL)pointCoordYFlipEnabled
{
  return self->_private.pointCoordYFlipEnabled;
}

- (unint64_t)threadgroupMemoryLength
{
  return self->_private.threadgroupMemoryLength;
}

- (id)sampleBufferAttachments
{
  return self->_private.sampleBufferAttachments;
}

- (void)setFineGrainedBackgroundVisibilityEnabled:(BOOL)a3
{
  self->_private.fineGrainedBackgroundVisibilityEnabled = a3;
}

- (BOOL)validate:(id)a3 width:(unint64_t *)a4 height:(unint64_t *)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t renderTargetWidth;
  unint64_t renderTargetHeight;
  MTLRasterizationRateMap *rasterizationRateMap;
  BOOL v17;
  uint64_t v18;
  float v19;
  double v20;
  double v21;
  float v22;
  float v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t defaultSampleCount;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  int *v30;
  int *v31;
  MTLRenderPassDescriptorPrivate *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  int *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  MTLRenderPassDepthAttachmentDescriptorInternal *depth_descriptor;
  MTLTextureImplementation *texture;
  unint64_t level;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  MTLRenderPassStencilAttachmentDescriptorInternal *stencil_descriptor;
  MTLTextureImplementation *v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t storeActionOptions;
  void *v63;
  unint64_t *v64;
  unint64_t *v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t tileWidth;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v90;
  unint64_t *v91;
  unint64_t *v92;
  id v93;
  unint64_t v94;
  unint64_t v95;
  MTLRenderPassDescriptorPrivate *p_private;
  _OWORD v97[3];
  uint64_t v98;

  v98 = 0;
  memset(v97, 0, sizeof(v97));
  _MTLMessageContextBegin_((uint64_t)v97, (uint64_t)"-[MTLRenderPassDescriptorInternal validate:width:height:]", 2065, (uint64_t)a3, 11, (uint64_t)"Render Pass Descriptor Validation");
  renderTargetWidth = self->_private.renderTargetWidth;
  renderTargetHeight = self->_private.renderTargetHeight;
  p_private = &self->_private;
  rasterizationRateMap = self->_private.rasterizationRateMap;
  v92 = a5;
  v93 = a3;
  v91 = a4;
  if (rasterizationRateMap)
  {
    if (renderTargetWidth)
      v17 = renderTargetHeight == 0;
    else
      v17 = 1;
    if (v17)
    {
      -[MTLRasterizationRateMap screenSize](rasterizationRateMap, "screenSize");
      renderTargetWidth = 0;
      renderTargetHeight = 0;
    }
    v18 = -[MTLRasterizationRateMap layerCount](rasterizationRateMap, "layerCount");
    v19 = (float)renderTargetWidth;
    if (-[MTLRasterizationRateMap mutability](rasterizationRateMap, "mutability") == 1)
    {
      v22 = (float)renderTargetWidth;
      v23 = (float)renderTargetHeight;
    }
    else if (v18)
    {
      v24 = 0;
      v23 = 0.0;
      v22 = 0.0;
      do
      {
        *(float *)&v20 = v19;
        *(float *)&v21 = (float)renderTargetHeight;
        -[MTLRasterizationRateMap mapScreenToPhysicalCoordinates:forLayer:](rasterizationRateMap, "mapScreenToPhysicalCoordinates:forLayer:", v24, v20, v21);
        if (v22 <= *(float *)&v20)
          v22 = *(float *)&v20;
        if (v23 <= *(float *)&v21)
          v23 = *(float *)&v21;
        ++v24;
      }
      while (v18 != v24);
    }
    else
    {
      v22 = 0.0;
      v23 = 0.0;
    }
    renderTargetWidth = vcvtas_u32_f32(v22);
    renderTargetHeight = vcvtas_u32_f32(v23);
  }
  v25 = 0;
  defaultSampleCount = 0;
  v27 = 0;
  v94 = renderTargetHeight;
  v95 = renderTargetWidth;
  if (renderTargetWidth)
    v28 = renderTargetWidth;
  else
    v28 = -1;
  if (renderTargetHeight)
    v29 = renderTargetHeight;
  else
    v29 = -1;
  v30 = &OBJC_IVAR___MTLBuiltInArgument__builtInType;
  v31 = &OBJC_IVAR___MTLBuiltInArgument__builtInType;
  v32 = p_private;
  do
  {
    v33 = *(uint64_t *)((char *)&v32->attachments->super.super.isa + v30[459] + v25);
    if (v33)
    {
      v34 = v31[456];
      if (*(_QWORD *)(v33 + v34 + 32) >= 3uLL)
      {
        _MTLMessageContextPush_((uint64_t)v97, 4, (uint64_t)CFSTR("loadAction is not a valid MTLLoadAction."), v9, v10, v11, v12, v13, v90);
        v34 = v31[456];
      }
      if (*(_QWORD *)(v33 + v34 + 40) >= 5uLL)
      {
        _MTLMessageContextPush_((uint64_t)v97, 4, (uint64_t)CFSTR("storeAction is not a valid MTLStoreAction."), v9, v10, v11, v12, v13, v90);
        v34 = v31[456];
      }
      if ((*(_QWORD *)(v33 + v34 + 48) & 0xFFFFFFFFFFFFFFFELL) != 0)
      {
        _MTLMessageContextPush_((uint64_t)v97, 4, (uint64_t)CFSTR("storeActionOptions contains unrecognized bits (%#x)"), v9, v10, v11, v12, v13, *(_QWORD *)(v33 + v34 + 48) & 0xFFFFFFFFFFFFFFFELL);
        v34 = v31[456];
      }
      v35 = v33 + v34;
      v36 = *(void **)(v33 + v34);
      if (v36)
      {
        v37 = v30;
        v38 = *(_QWORD *)(v35 + 8);
        v39 = v29;
        v40 = v28;
        v41 = v27;
        v42 = defaultSampleCount;
        v43 = objc_msgSend(v36, "width");
        v44 = objc_msgSend(v36, "height");
        v45 = v43 >> v38;
        defaultSampleCount = v42;
        v46 = v41;
        v28 = v40;
        v47 = v44 >> v38;
        if (v45 <= 1)
          v45 = 1;
        if (v47 <= 1)
          v47 = 1;
        *(_QWORD *)(v35 + 152) = v45;
        *(_QWORD *)(v35 + 160) = v47;
        if (v45 < v40)
          v28 = v45;
        if (v47 >= v39)
          v29 = v39;
        else
          v29 = v47;
        v27 = v46 + 1;
        if (!defaultSampleCount)
          defaultSampleCount = objc_msgSend(*(id *)v35, "sampleCount");
        v32 = p_private;
        v30 = v37;
        v31 = &OBJC_IVAR___MTLBuiltInArgument__builtInType;
      }
    }
    v25 += 8;
  }
  while (v25 != 64);
  depth_descriptor = v32->attachments->_depth_descriptor;
  if (depth_descriptor)
  {
    texture = depth_descriptor->_private.texture;
    if (texture)
    {
      level = depth_descriptor->_private.level;
      v51 = -[MTLTextureImplementation width](depth_descriptor->_private.texture, "width");
      v52 = -[MTLTextureImplementation height](texture, "height");
      v53 = v51 >> level;
      v54 = v52 >> level;
      if (v51 >> level <= 1)
        v53 = 1;
      if (v54 <= 1)
        v54 = 1;
      depth_descriptor->_private.width = v53;
      depth_descriptor->_private.height = v54;
      if (v53 < v28)
        v28 = v53;
      if (v54 < v29)
        v29 = v54;
      ++v27;
    }
    if (depth_descriptor->_private.loadAction >= 3)
      _MTLMessageContextPush_((uint64_t)v97, 4, (uint64_t)CFSTR("loadAction is not a valid MTLLoadAction."), v9, v10, v11, v12, v13, v90);
    v32 = p_private;
    if (depth_descriptor->_private.storeAction >= 6)
      _MTLMessageContextPush_((uint64_t)v97, 4, (uint64_t)CFSTR("storeAction is not a valid MTLStoreAction."), v9, v10, v11, v12, v13, v90);
    if ((depth_descriptor->_private.storeActionOptions & 0xFFFFFFFFFFFFFFFELL) != 0)
      _MTLMessageContextPush_((uint64_t)v97, 4, (uint64_t)CFSTR("storeActionOptions contains unrecognized bits (%#x)"), v9, v10, v11, v12, v13, depth_descriptor->_private.storeActionOptions & 0xFFFFFFFFFFFFFFFELL);
    if (depth_descriptor->_private.resolveFilter >= 3)
      _MTLMessageContextPush_((uint64_t)v97, 4, (uint64_t)CFSTR("resolveFilter is not a valid MTLMultisampleDepthResolveFilter."), v9, v10, v11, v12, v13, v90);
  }
  stencil_descriptor = v32->attachments->_stencil_descriptor;
  if (stencil_descriptor)
  {
    v56 = stencil_descriptor->_private.texture;
    if (v56)
    {
      v57 = stencil_descriptor->_private.level;
      v58 = -[MTLTextureImplementation width](stencil_descriptor->_private.texture, "width");
      v59 = -[MTLTextureImplementation height](v56, "height");
      v60 = v58 >> v57;
      v61 = v59 >> v57;
      if (v58 >> v57 <= 1)
        v60 = 1;
      if (v61 <= 1)
        v61 = 1;
      stencil_descriptor->_private.width = v60;
      stencil_descriptor->_private.height = v61;
      if (v60 < v28)
        v28 = v60;
      if (v61 < v29)
        v29 = v61;
      ++v27;
    }
    if (stencil_descriptor->_private.stencilResolveFilter >= 2)
      _MTLMessageContextPush_((uint64_t)v97, 4, (uint64_t)CFSTR("resolveFilter is not a valid MTLMultisampleStencilResolveFilter."), v9, v10, v11, v12, v13, v90);
    if (stencil_descriptor->_private.storeAction >= 5)
      _MTLMessageContextPush_((uint64_t)v97, 4, (uint64_t)CFSTR("storeAction is not a valid MTLStoreAction."), v9, v10, v11, v12, v13, v90);
    storeActionOptions = stencil_descriptor->_private.storeActionOptions;
    if ((storeActionOptions & 0xFFFFFFFFFFFFFFFELL) != 0)
      _MTLMessageContextPush_((uint64_t)v97, 4, (uint64_t)CFSTR("storeActionOptions contains unrecognized bits: %#x"), v9, v10, v11, v12, v13, storeActionOptions & 0xFFFFFFFFFFFFFFFELL);
    v64 = v92;
    v63 = v93;
    v65 = v91;
    if ((storeActionOptions & 1) != 0)
      _MTLMessageContextPush_((uint64_t)v97, 4, (uint64_t)CFSTR("Stencil attachment storeActionOptions (%#x) contains options incompatible with this attachment type: %@"), v9, v10, v11, v12, v13, storeActionOptions);
  }
  else
  {
    v64 = v92;
    v63 = v93;
    v65 = v91;
  }
  if (v27)
    v66 = v28;
  else
    v66 = v95;
  if (v27)
    v67 = v29;
  else
    v67 = v94;
  tileWidth = p_private->tileWidth;
  if (tileWidth)
  {
    v69 = p_private->tileHeight * tileWidth;
    if (defaultSampleCount)
      goto LABEL_96;
    goto LABEL_95;
  }
  v69 = objc_msgSend(v63, "minTilePixels");
  if (!defaultSampleCount)
LABEL_95:
    defaultSampleCount = p_private->var0.defaultSampleCount;
LABEL_96:
  v70 = p_private->threadgroupMemoryLength + defaultSampleCount * v69 * p_private->imageBlockSampleLength;
  v71 = objc_msgSend(v63, "maxThreadgroupMemoryLength");
  if (v70 <= v71)
    v72 = v66;
  else
    v72 = 0;
  if (v70 <= v71)
    v73 = v67;
  else
    v73 = 0;
  *v65 = v72;
  *v64 = v73;
  if (p_private->numCustomSamplePositions)
  {
    if ((objc_msgSend(v63, "areProgrammableSamplePositionsSupported") & 1) == 0)
      _MTLMessageContextPush_((uint64_t)v97, 4, (uint64_t)CFSTR("Custom sample positions were specified, but Programmable Sample Positions is not supported on this device."), v74, v75, v76, v77, v78, v90);
    if (p_private->numCustomSamplePositions && (objc_msgSend(v63, "supportsTextureSampleCount:") & 1) == 0)
      _MTLMessageContextPush_((uint64_t)v97, 4, (uint64_t)CFSTR("Custom sample positions were specified, but the device does not support the number of samples supplied."), v79, v80, v81, v82, v83, v90);
  }
  if (p_private->renderTargetArrayLength && (objc_msgSend(v63, "supportsLayeredRendering") & 1) == 0)
    _MTLMessageContextPush_((uint64_t)v97, 4, (uint64_t)CFSTR("renderTargetArrayLength > 0 specified, but Layered Rendering is not supported on this device."), v84, v85, v86, v87, v88, v90);
  _MTLMessageContextEnd((uint64_t)v97);
  return 1;
}

- (id)colorAttachments
{
  return self->_private.attachments;
}

- (id)depthAttachment
{
  MTLRenderPassDepthAttachmentDescriptorInternal *v3;
  unint64_t *p_depth_descriptor;

  if (!self->_private.attachments->_depth_descriptor)
  {
    v3 = objc_alloc_init(MTLRenderPassDepthAttachmentDescriptorInternal);
    p_depth_descriptor = (unint64_t *)&self->_private.attachments->_depth_descriptor;
    while (!__ldaxr(p_depth_descriptor))
    {
      if (!__stlxr((unint64_t)v3, p_depth_descriptor))
      {
        self->_private.attachments->_depth_descriptor = v3;
        return self->_private.attachments->_depth_descriptor;
      }
    }
    __clrex();

  }
  return self->_private.attachments->_depth_descriptor;
}

- (id)stencilAttachment
{
  MTLRenderPassStencilAttachmentDescriptorInternal *v3;
  unint64_t *p_stencil_descriptor;

  if (!self->_private.attachments->_stencil_descriptor)
  {
    v3 = objc_alloc_init(MTLRenderPassStencilAttachmentDescriptorInternal);
    p_stencil_descriptor = (unint64_t *)&self->_private.attachments->_stencil_descriptor;
    while (!__ldaxr(p_stencil_descriptor))
    {
      if (!__stlxr((unint64_t)v3, p_stencil_descriptor))
      {
        self->_private.attachments->_stencil_descriptor = v3;
        return self->_private.attachments->_stencil_descriptor;
      }
    }
    __clrex();

  }
  return self->_private.attachments->_stencil_descriptor;
}

- (MTLRenderPassDescriptorInternal)init
{
  char *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLRenderPassDescriptorInternal;
  v2 = -[MTLRenderPassDescriptorInternal init](&v4, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 5) = objc_alloc_init(MTLRenderPassColorAttachmentDescriptorArrayInternal);
    *((_QWORD *)v2 + 8) = 0;
    *((_QWORD *)v2 + 9) = 0;
    *((_QWORD *)v2 + 7) = 0;
    *(_OWORD *)(v2 + 88) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    *(_OWORD *)(v2 + 120) = 0u;
    *(_OWORD *)(v2 + 136) = 0u;
    *(_OWORD *)(v2 + 152) = 0u;
    *((_QWORD *)v2 + 21) = 0;
    *((_QWORD *)v2 + 23) = objc_alloc_init(MTLRenderPassSampleBufferAttachmentDescriptorArrayInternal);
    *((_QWORD *)v2 + 25) = 0;
  }
  return (MTLRenderPassDescriptorInternal *)v2;
}

- (void)dealloc
{
  MTLRenderPassDescriptorPrivate *p_private;
  objc_super v4;

  p_private = &self->_private;

  v4.receiver = self;
  v4.super_class = (Class)MTLRenderPassDescriptorInternal;
  -[MTLRenderPassDescriptorInternal dealloc](&v4, sel_dealloc);
}

- (void)setRenderTargetArrayLength:(unint64_t)a3
{
  self->_private.renderTargetArrayLength = a3;
}

- (void)setVisibilityResultBuffer:(id)a3
{
  MTLRenderPassDescriptorPrivate *p_private;
  MTLBuffer *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3 && MTLFailureTypeGetEnabled(1uLL) && (objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCF3A90) & 1) == 0)
    MTLReportFailure(1uLL, "-[MTLRenderPassDescriptorInternal setVisibilityResultBuffer:]", 1821, (uint64_t)CFSTR("buffer is not a MTLBuffer."), v7, v8, v9, v10, v11);
  p_private = &self->_private;
  if (p_private->visibilityResultBuffer != a3)
  {
    v6 = (MTLBuffer *)a3;

    p_private->visibilityResultBuffer = v6;
  }
}

- (void)setRasterizationRateMap:(id)a3
{
  MTLRenderPassDescriptorPrivate *p_private;
  MTLRasterizationRateMap *rasterizationRateMap;
  MTLRasterizationRateMap *v5;

  p_private = &self->_private;
  rasterizationRateMap = self->_private.rasterizationRateMap;
  if (rasterizationRateMap != a3)
  {
    v5 = rasterizationRateMap;
    p_private->rasterizationRateMap = (MTLRasterizationRateMap *)a3;

  }
}

+ (id)renderPassDescriptor
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (void)setDepthAttachment:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  MTLRenderPassColorAttachmentDescriptorArrayInternal *attachments;
  uint64_t v10;
  MTLRenderPassDepthAttachmentDescriptorInternal *depth_descriptor;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLRenderPassDescriptorInternal setDepthAttachment:]", 1362, (uint64_t)CFSTR("depthAttachment is not a MTLRenderPassDepthAttachmentDescriptor."), v5, v6, v7, v8, v10);
  }
  attachments = self->_private.attachments;
  if (attachments->_depth_descriptor != a3)
  {
    depth_descriptor = attachments->_depth_descriptor;
    self->_private.attachments->_depth_descriptor = (MTLRenderPassDepthAttachmentDescriptorInternal *)objc_msgSend(a3, "copy");

  }
}

- (void)setStencilAttachment:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  MTLRenderPassColorAttachmentDescriptorArrayInternal *attachments;
  uint64_t v10;
  MTLRenderPassStencilAttachmentDescriptorInternal *stencil_descriptor;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLRenderPassDescriptorInternal setStencilAttachment:]", 1389, (uint64_t)CFSTR("stencilAttachment is not a MTLRenderPassStencilAttachmentDescriptor."), v5, v6, v7, v8, v10);
  }
  attachments = self->_private.attachments;
  if (attachments->_stencil_descriptor != a3)
  {
    stencil_descriptor = attachments->_stencil_descriptor;
    self->_private.attachments->_stencil_descriptor = (MTLRenderPassStencilAttachmentDescriptorInternal *)objc_msgSend(a3, "copy");

  }
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  MTLRenderPassDescriptorPrivate *p_private;
  MTLRenderPassColorAttachmentDescriptorInternal *v5;
  MTLRenderPassColorAttachmentDescriptorArrayInternal *attachments;
  MTLRenderPassDepthAttachmentDescriptorInternal *depth_descriptor;
  MTLRenderPassStencilAttachmentDescriptorInternal *stencil_descriptor;
  uint64_t v9;
  int8x16_t v10;
  int8x16_t v11;
  unint64_t v12;
  MTLRasterizationRateMap *rasterizationRateMap;
  unint64_t numCustomSamplePositions;
  uint64_t i;
  MTLRenderPassSampleBufferAttachmentDescriptorInternal *v16;

  v2 = 0;
  v3 = 0;
  p_private = &self->_private;
  do
  {
    v5 = p_private->attachments->_color_descriptors[v2];
    if (v5)
      v3 ^= (unint64_t)_MTLHashState((int *)&v5->_private, 0xB0uLL) << v2;
    ++v2;
  }
  while (v2 != 8);
  attachments = p_private->attachments;
  depth_descriptor = p_private->attachments->_depth_descriptor;
  if (depth_descriptor)
  {
    v3 ^= (unint64_t)_MTLHashState((int *)&depth_descriptor->_private, 0xB0uLL) << 8;
    attachments = p_private->attachments;
  }
  stencil_descriptor = attachments->_stencil_descriptor;
  if (stencil_descriptor)
    v3 ^= (unint64_t)_MTLHashState((int *)&stencil_descriptor->_private, 0xB0uLL) << 8;
  v9 = -[MTLBuffer hash](p_private->visibilityResultBuffer, "hash");
  v10.i64[0] = p_private->defaultColorSampleCount;
  v10.i64[1] = p_private->renderTargetArrayLength;
  v11 = veorq_s8(veorq_s8(*(int8x16_t *)&p_private->renderTargetWidth, *(int8x16_t *)&p_private->tileWidth), veorq_s8(v10, *(int8x16_t *)&p_private->imageBlockSampleLength));
  v12 = *(_QWORD *)&veor_s8(*(int8x8_t *)v11.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL)) ^ p_private->var0.defaultSampleCount ^ p_private->fineGrainedBackgroundVisibilityEnabled ^ p_private->skipEmptyTilesOnClearEnabled ^ v9 ^ p_private->pointCoordYFlipEnabled ^ p_private->ditherEnabled ^ p_private->openGLModeEnabled ^ v3;
  rasterizationRateMap = p_private->rasterizationRateMap;
  if (rasterizationRateMap)
    v12 ^= -[MTLRasterizationRateMap hash](rasterizationRateMap, "hash");
  numCustomSamplePositions = p_private->numCustomSamplePositions;
  if (numCustomSamplePositions)
    v12 ^= _MTLHashState((int *)p_private->customSamplePositions, 8 * numCustomSamplePositions);
  for (i = 0; i != 4; ++i)
  {
    v16 = p_private->sampleBufferAttachments->_sampleDescriptors[i];
    if (v16)
      v12 ^= (unint64_t)_MTLHashState((int *)&v16->_private, 0x28uLL) << i;
  }
  return MTLHashArray(p_private->binaryArchives, 1, 0) ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  int v6;
  uint64_t v7;
  MTLRenderPassDescriptorPrivate *p_private;
  MTLRenderPassDescriptorPrivate *v9;
  MTLRenderPassColorAttachmentDescriptorInternal *v10;
  MTLRenderPassColorAttachmentDescriptorInternal *v11;
  BOOL v12;
  BOOL v13;
  MTLRenderPassColorAttachmentDescriptorInternal *v14;
  MTLRenderPassDescriptorPrivate *v15;
  BOOL v16;
  MTLRenderPassColorAttachmentDescriptorArrayInternal *attachments;
  MTLRenderPassDepthAttachmentDescriptorInternal *depth_descriptor;
  MTLRenderPassColorAttachmentDescriptorArrayInternal *v19;
  MTLRenderPassDepthAttachmentDescriptorInternal *v20;
  BOOL v21;
  BOOL v22;
  MTLRenderPassDepthAttachmentDescriptorInternal *v23;
  MTLRenderPassDescriptorPrivate *v24;
  BOOL v25;
  MTLRenderPassStencilAttachmentDescriptorInternal *stencil_descriptor;
  MTLRenderPassStencilAttachmentDescriptorInternal *v27;
  BOOL v28;
  BOOL v29;
  MTLRenderPassStencilAttachmentDescriptorInternal *v30;
  MTLRenderPassDescriptorPrivate *v31;
  BOOL v32;
  MTLBuffer *visibilityResultBuffer;
  unint64_t numCustomSamplePositions;
  float *p_y;
  float *v36;
  MTLRasterizationRateMap *rasterizationRateMap;
  uint64_t v38;
  MTLRenderPassSampleBufferAttachmentDescriptorArrayInternal **p_sampleBufferAttachments;
  MTLRenderPassSampleBufferAttachmentDescriptorInternal *v40;
  MTLRenderPassSampleBufferAttachmentDescriptorInternal *v41;
  BOOL v42;
  BOOL v43;
  MTLRenderPassSampleBufferAttachmentDescriptorInternal *v44;
  MTLRenderPassSampleBufferAttachmentDescriptorArrayInternal **v45;
  BOOL v46;
  char *v48;

  if (a3 == self)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  Class = object_getClass(self);
  if (Class != object_getClass(a3))
    goto LABEL_3;
  v7 = 0;
  p_private = &self->_private;
  v48 = (char *)a3;
  v9 = (MTLRenderPassDescriptorPrivate *)((char *)a3 + 40);
  do
  {
    v10 = p_private->attachments->_color_descriptors[v7];
    v11 = v9->attachments->_color_descriptors[v7];
    if (v10 == v11)
      goto LABEL_24;
    if (v10)
      v12 = v11 == 0;
    else
      v12 = 0;
    if (v12)
    {
      v14 = objc_alloc_init(MTLRenderPassColorAttachmentDescriptorInternal);
      v15 = v9;
      v11 = v14;
    }
    else
    {
      if (v10)
        v13 = 1;
      else
        v13 = v11 == 0;
      if (v13)
        goto LABEL_19;
      v14 = objc_alloc_init(MTLRenderPassColorAttachmentDescriptorInternal);
      v15 = &self->_private;
      v10 = v14;
    }
    v15->attachments->_color_descriptors[v7] = v14;
LABEL_19:
    if (v11)
      v16 = v10 == 0;
    else
      v16 = 1;
    if (v16)
      goto LABEL_3;
    v6 = equalAttachmentPrivate(&v10->_private, &v11->_private);
    if (!v6)
      return v6;
LABEL_24:
    ++v7;
  }
  while (v7 != 8);
  attachments = p_private->attachments;
  depth_descriptor = p_private->attachments->_depth_descriptor;
  v19 = v9->attachments;
  v20 = v9->attachments->_depth_descriptor;
  if (depth_descriptor == v20)
    goto LABEL_43;
  if (depth_descriptor)
    v21 = v20 == 0;
  else
    v21 = 0;
  if (v21)
  {
    v23 = objc_alloc_init(MTLRenderPassDepthAttachmentDescriptorInternal);
    v24 = v9;
    v20 = v23;
LABEL_36:
    v24->attachments->_depth_descriptor = v23;
  }
  else
  {
    if (depth_descriptor)
      v22 = 1;
    else
      v22 = v20 == 0;
    if (!v22)
    {
      v23 = objc_alloc_init(MTLRenderPassDepthAttachmentDescriptorInternal);
      v24 = &self->_private;
      depth_descriptor = v23;
      goto LABEL_36;
    }
  }
  if (v20)
    v25 = depth_descriptor == 0;
  else
    v25 = 1;
  if (v25)
    goto LABEL_3;
  v6 = equalAttachmentPrivate(&depth_descriptor->_private, &v20->_private);
  if (!v6)
    return v6;
  attachments = p_private->attachments;
  v19 = v9->attachments;
LABEL_43:
  stencil_descriptor = attachments->_stencil_descriptor;
  v27 = v19->_stencil_descriptor;
  if (stencil_descriptor == v27)
  {
LABEL_60:
    visibilityResultBuffer = self->_private.visibilityResultBuffer;
    if (visibilityResultBuffer != v9->visibilityResultBuffer)
    {
      v6 = -[MTLBuffer isEqual:](visibilityResultBuffer, "isEqual:");
      if (!v6)
        return v6;
    }
    if (self->_private.ditherEnabled != v9->ditherEnabled)
      goto LABEL_3;
    if (self->_private.renderTargetWidth != v9->renderTargetWidth)
      goto LABEL_3;
    if (self->_private.renderTargetHeight != v9->renderTargetHeight)
      goto LABEL_3;
    if (self->_private.defaultColorSampleCount != v9->defaultColorSampleCount)
      goto LABEL_3;
    if (self->_private.fineGrainedBackgroundVisibilityEnabled != v9->fineGrainedBackgroundVisibilityEnabled)
      goto LABEL_3;
    if (self->_private.skipEmptyTilesOnClearEnabled != v9->skipEmptyTilesOnClearEnabled)
      goto LABEL_3;
    if (self->_private.openGLModeEnabled != v9->openGLModeEnabled)
      goto LABEL_3;
    if (self->_private.pointCoordYFlipEnabled != v9->pointCoordYFlipEnabled)
      goto LABEL_3;
    if (self->_private.renderTargetArrayLength != v9->renderTargetArrayLength)
      goto LABEL_3;
    if (self->_private.tileWidth != v9->tileWidth)
      goto LABEL_3;
    if (self->_private.tileHeight != v9->tileHeight)
      goto LABEL_3;
    if (self->_private.imageBlockSampleLength != v9->imageBlockSampleLength)
      goto LABEL_3;
    if (self->_private.threadgroupMemoryLength != v9->threadgroupMemoryLength)
      goto LABEL_3;
    if (self->_private.var0.defaultSampleCount != v9->var0.defaultSampleCount)
      goto LABEL_3;
    numCustomSamplePositions = self->_private.numCustomSamplePositions;
    if (numCustomSamplePositions != v9->numCustomSamplePositions)
      goto LABEL_3;
    if (numCustomSamplePositions)
    {
      p_y = &self->_private.customSamplePositions[0].y;
      v36 = (float *)(v48 + 140);
      while (*(p_y - 1) == *(v36 - 1) && *p_y == *v36)
      {
        p_y += 2;
        v36 += 2;
        if (!--numCustomSamplePositions)
          goto LABEL_82;
      }
      goto LABEL_3;
    }
LABEL_82:
    rasterizationRateMap = self->_private.rasterizationRateMap;
    if (rasterizationRateMap != v9->rasterizationRateMap)
    {
      v6 = -[MTLRasterizationRateMap isEqual:](rasterizationRateMap, "isEqual:");
      if (!v6)
        return v6;
    }
    v38 = 0;
    p_sampleBufferAttachments = &self->_private.sampleBufferAttachments;
    while (1)
    {
      v40 = (*p_sampleBufferAttachments)->_sampleDescriptors[v38];
      v41 = v9->sampleBufferAttachments->_sampleDescriptors[v38];
      if (v40 != v41)
        break;
LABEL_102:
      if (++v38 == 4)
      {
        LOBYTE(v6) = MTLCompareArray(p_private->binaryArchives, v9->binaryArchives, 1, 0);
        return v6;
      }
    }
    if (v40)
      v42 = v41 == 0;
    else
      v42 = 0;
    if (v42)
    {
      v44 = objc_alloc_init(MTLRenderPassSampleBufferAttachmentDescriptorInternal);
      v45 = &v9->sampleBufferAttachments;
      v41 = v44;
    }
    else
    {
      if (v40)
        v43 = 1;
      else
        v43 = v41 == 0;
      if (v43)
        goto LABEL_97;
      v44 = objc_alloc_init(MTLRenderPassSampleBufferAttachmentDescriptorInternal);
      v45 = &p_private->sampleBufferAttachments;
      v40 = v44;
    }
    (*v45)->_sampleDescriptors[v38] = v44;
LABEL_97:
    if (v41)
      v46 = v40 == 0;
    else
      v46 = 1;
    if (v46)
      goto LABEL_3;
    v6 = equalSampleBufferPrivate(&v40->_private, &v41->_private);
    if (!v6)
      return v6;
    goto LABEL_102;
  }
  if (stencil_descriptor)
    v28 = v27 == 0;
  else
    v28 = 0;
  if (v28)
  {
    v30 = objc_alloc_init(MTLRenderPassStencilAttachmentDescriptorInternal);
    v31 = v9;
    v27 = v30;
LABEL_54:
    v31->attachments->_stencil_descriptor = v30;
  }
  else
  {
    if (stencil_descriptor)
      v29 = 1;
    else
      v29 = v27 == 0;
    if (!v29)
    {
      v30 = objc_alloc_init(MTLRenderPassStencilAttachmentDescriptorInternal);
      v31 = &self->_private;
      stencil_descriptor = v30;
      goto LABEL_54;
    }
  }
  if (v27)
    v32 = stencil_descriptor == 0;
  else
    v32 = 1;
  if (!v32)
  {
    v6 = equalAttachmentPrivate(&stencil_descriptor->_private, &v27->_private);
    if (!v6)
      return v6;
    goto LABEL_60;
  }
LABEL_3:
  LOBYTE(v6) = 0;
  return v6;
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t i;
  MTLRenderPassColorAttachmentDescriptorInternal *v7;
  const MTLRenderPassAttachmentDescriptorPrivate *p_private;
  MTLRenderPassDepthAttachmentDescriptorInternal *depth_descriptor;
  const MTLRenderPassAttachmentDescriptorPrivate *v10;
  MTLRenderPassStencilAttachmentDescriptorInternal *stencil_descriptor;
  const MTLRenderPassAttachmentDescriptorPrivate *v12;
  MTLBuffer *visibilityResultBuffer;
  const __CFString *v14;
  MTLRasterizationRateMap *rasterizationRateMap;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  float *p_y;
  double v22;
  int v23;
  double v24;
  objc_super v28;
  _QWORD v29[21];
  _QWORD v30[2];
  _QWORD v31[8];
  _QWORD v32[7];

  v32[5] = *MEMORY[0x1E0C80C00];
  v3 = a3 + 4;
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
  for (i = 0; i != 8; ++i)
  {
    v30[0] = v4;
    v30[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Color Attachment %u"), i);
    objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2));
    v7 = self->_private.attachments->_color_descriptors[i];
    if (v7)
      p_private = &v7->_private;
    else
      p_private = (const MTLRenderPassAttachmentDescriptorPrivate *)&defaultColorAttachmentPrivate;
    objc_msgSend(v5, "addObject:", colorAttachmentFormattedDescription(v3, p_private));
  }
  v29[0] = v4;
  v29[1] = CFSTR("Depth Attachment:");
  depth_descriptor = self->_private.attachments->_depth_descriptor;
  if (depth_descriptor)
    v10 = &depth_descriptor->_private;
  else
    v10 = (const MTLRenderPassAttachmentDescriptorPrivate *)&defaultDepthAttachmentPrivate;
  v29[2] = depthAttachmentFormattedDescription(v3, v10);
  v29[3] = v4;
  v29[4] = CFSTR("Stencil Attachment:");
  stencil_descriptor = self->_private.attachments->_stencil_descriptor;
  if (stencil_descriptor)
    v12 = &stencil_descriptor->_private;
  else
    v12 = (const MTLRenderPassAttachmentDescriptorPrivate *)&defaultStencilAttachmentPrivate;
  v29[5] = stencilAttachmentFormattedDescription(v3, v12);
  v29[6] = v4;
  v29[7] = CFSTR("visibilityResultBuffer =");
  visibilityResultBuffer = self->_private.visibilityResultBuffer;
  if (visibilityResultBuffer)
    v14 = (const __CFString *)-[MTLBuffer formattedDescription:](visibilityResultBuffer, "formattedDescription:", v3);
  else
    v14 = CFSTR("<null>");
  v29[8] = v14;
  v29[9] = v4;
  v29[10] = CFSTR("renderTargetArrayLength =");
  v29[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_private.renderTargetArrayLength);
  v29[12] = v4;
  v29[13] = CFSTR("renderTargetWidth =");
  v29[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_private.renderTargetWidth);
  v29[15] = v4;
  v29[16] = CFSTR("renderTargetHeight =");
  v29[17] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_private.renderTargetHeight);
  v29[18] = v4;
  v29[19] = CFSTR("rasterizationRateMap =");
  rasterizationRateMap = self->_private.rasterizationRateMap;
  if (rasterizationRateMap)
    v16 = (const __CFString *)-[MTLRasterizationRateMap formattedDescription:](rasterizationRateMap, "formattedDescription:", v3);
  else
    v16 = CFSTR("<null>");
  v29[20] = v16;
  objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 21));
  v17 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", v3, CFSTR(" "), 0);
  v18 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 8, CFSTR(" "), 0);
  v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 37);
  v32[0] = v17;
  v32[1] = CFSTR("Custom Sample Positions:");
  v32[2] = v18;
  v32[3] = CFSTR("number of positions = ");
  v32[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_private.numCustomSamplePositions);
  objc_msgSend(v19, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 5));
  if (self->_private.numCustomSamplePositions)
  {
    v20 = 0;
    p_y = &self->_private.customSamplePositions[0].y;
    do
    {
      v31[0] = v18;
      v31[1] = CFSTR("sample ");
      v31[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20);
      v31[3] = CFSTR(": <");
      *(float *)&v22 = *(p_y - 1);
      v31[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
      v31[5] = CFSTR(",");
      v23 = *(_DWORD *)p_y;
      p_y += 2;
      LODWORD(v24) = v23;
      v31[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
      v31[7] = CFSTR(">");
      objc_msgSend(v19, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 8));
      ++v20;
    }
    while (self->_private.numCustomSamplePositions > v20);
  }
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), objc_msgSend(v19, "componentsJoinedByString:", &stru_1E0FE5DC8)));
  v28.receiver = self;
  v28.super_class = (Class)MTLRenderPassDescriptorInternal;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), -[MTLRenderPassDescriptorInternal description](&v28, sel_description), objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLRenderPassDescriptorInternal formattedDescription:](self, "formattedDescription:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  MTLRenderPassDescriptorPrivate *p_private;
  uint64_t v8;
  MTLRenderPassColorAttachmentDescriptorInternal *v9;
  MTLRenderPassColorAttachmentDescriptorArrayInternal *attachments;
  MTLRenderPassDepthAttachmentDescriptorInternal *depth_descriptor;
  MTLRenderPassStencilAttachmentDescriptorInternal *stencil_descriptor;
  unint64_t v13;
  uint64_t i;
  MTLRenderPassSampleBufferAttachmentDescriptorInternal *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = 0;
  p_private = &self->_private;
  v8 = v5 + 40;
  do
  {
    v9 = p_private->attachments->_color_descriptors[v6];
    if (v9)
      *(_QWORD *)(*(_QWORD *)v8 + 8 + v6 * 8) = -[MTLRenderPassColorAttachmentDescriptorInternal copyWithZone:](v9, "copyWithZone:", a3);
    ++v6;
  }
  while (v6 != 8);
  attachments = p_private->attachments;
  depth_descriptor = p_private->attachments->_depth_descriptor;
  if (depth_descriptor)
  {
    *(_QWORD *)(*(_QWORD *)v8 + 72) = -[MTLRenderPassDepthAttachmentDescriptorInternal copyWithZone:](depth_descriptor, "copyWithZone:", a3);
    attachments = p_private->attachments;
  }
  stencil_descriptor = attachments->_stencil_descriptor;
  if (stencil_descriptor)
    *(_QWORD *)(*(_QWORD *)v8 + 80) = -[MTLRenderPassStencilAttachmentDescriptorInternal copyWithZone:](stencil_descriptor, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 48) = self->_private.visibilityResultBuffer;
  *(_OWORD *)(v5 + 56) = *(_OWORD *)&self->_private.renderTargetWidth;
  *(_QWORD *)(v5 + 72) = self->_private.defaultColorSampleCount;
  *(_DWORD *)(v5 + 80) = *(_DWORD *)&self->_private.fineGrainedBackgroundVisibilityEnabled;
  *(_BYTE *)(v5 + 192) = self->_private.pointCoordYFlipEnabled;
  *(_OWORD *)(v5 + 88) = *(_OWORD *)&self->_private.renderTargetArrayLength;
  *(_QWORD *)(v5 + 104) = self->_private.tileHeight;
  *(_OWORD *)(v5 + 120) = *(_OWORD *)&self->_private.imageBlockSampleLength;
  *(_QWORD *)(v5 + 112) = self->_private.var0.defaultSampleCount;
  *(_QWORD *)(v5 + 168) = self->_private.numCustomSamplePositions;
  if (self->_private.numCustomSamplePositions)
  {
    v13 = 0;
    do
    {
      *($38C3DEC81229B66F67FB6D350D75FF5A *)(v5 + 136 + 8 * v13) = self->_private.customSamplePositions[v13];
      ++v13;
    }
    while (self->_private.numCustomSamplePositions > v13);
  }
  for (i = 0; i != 4; ++i)
  {
    v15 = p_private->sampleBufferAttachments->_sampleDescriptors[i];
    if (v15)
      *(_QWORD *)(*(_QWORD *)(v5 + 184) + 8 + i * 8) = -[MTLRenderPassSampleBufferAttachmentDescriptorInternal copyWithZone:](v15, "copyWithZone:", a3);
  }
  *(_QWORD *)(v5 + 176) = p_private->rasterizationRateMap;
  *(_QWORD *)(v5 + 200) = -[NSArray copy](p_private->binaryArchives, "copy");
  return (id)v5;
}

- (id)visibilityResultBuffer
{
  return self->_private.visibilityResultBuffer;
}

- (unint64_t)renderTargetWidth
{
  return self->_private.renderTargetWidth;
}

- (unint64_t)renderTargetHeight
{
  return self->_private.renderTargetHeight;
}

- (void)setDefaultColorSampleCount:(unint64_t)a3
{
  self->_private.defaultColorSampleCount = a3;
}

- (unint64_t)defaultColorSampleCount
{
  return self->_private.defaultColorSampleCount;
}

- (BOOL)fineGrainedBackgroundVisibilityEnabled
{
  return self->_private.fineGrainedBackgroundVisibilityEnabled;
}

- (void)setSkipEmptyTilesOnClearEnabled:(BOOL)a3
{
  self->_private.skipEmptyTilesOnClearEnabled = a3;
}

- (BOOL)skipEmptyTilesOnClearEnabled
{
  return self->_private.skipEmptyTilesOnClearEnabled;
}

- (void)setDitherEnabled:(BOOL)a3
{
  self->_private.ditherEnabled = a3;
}

- (BOOL)ditherEnabled
{
  return self->_private.ditherEnabled;
}

- (void)setOpenGLModeEnabled:(BOOL)a3
{
  self->_private.openGLModeEnabled = a3;
}

- (BOOL)openGLModeEnabled
{
  return self->_private.openGLModeEnabled;
}

- (void)setPointCoordYFlipEnabled:(BOOL)a3
{
  self->_private.pointCoordYFlipEnabled = a3;
}

- (void)setBinaryArchives:(id)a3
{
  MTLRenderPassDescriptorPrivate *p_private;
  NSArray *binaryArchives;

  p_private = &self->_private;
  binaryArchives = self->_private.binaryArchives;
  if (binaryArchives != a3)
  {

    p_private->binaryArchives = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (id)binaryArchives
{
  return self->_private.binaryArchives;
}

- (void)setImageblockSampleLength:(unint64_t)a3
{
  self->_private.imageBlockSampleLength = a3;
}

- (unint64_t)imageblockSampleLength
{
  return self->_private.imageBlockSampleLength;
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3
{
  self->_private.threadgroupMemoryLength = a3;
}

- (void)setTileWidth:(unint64_t)a3
{
  self->_private.tileWidth = a3;
}

- (unint64_t)tileWidth
{
  return self->_private.tileWidth;
}

- (void)setTileHeight:(unint64_t)a3
{
  self->_private.tileHeight = a3;
}

- (unint64_t)tileHeight
{
  return self->_private.tileHeight;
}

- (void)setDefaultRasterSampleCount:(unint64_t)a3
{
  self->_private.var0.defaultSampleCount = a3;
}

- (unint64_t)defaultRasterSampleCount
{
  return self->_private.var0.defaultSampleCount;
}

- (void)setSamplePositions:(id *)a3 count:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const $94F468A8D4C62B317260615823C2B210 *v9;
  uint64_t v11;
  float var0;
  float var1;
  $38C3DEC81229B66F67FB6D350D75FF5A v16;

  v9 = a3;
  if (a4 <= 4 && ((1 << a4) & 0x15) != 0)
  {
    if (a3)
      goto LABEL_7;
  }
  else
  {
    MTLReportFailure(0, "-[MTLRenderPassDescriptorInternal setSamplePositions:count:]", 2030, (uint64_t)CFSTR("count (%lu) is not a supported sample count for custom positions."), v4, v5, v6, v7, a4);
    if (v9)
      goto LABEL_7;
  }
  if (a4)
  {
    MTLReportFailure(0, "-[MTLRenderPassDescriptorInternal setSamplePositions:count:]", 2032, (uint64_t)CFSTR("Non-zero count (%lu) provided with a NULL positions parameter."), v4, v5, v6, v7, a4);
    return;
  }
LABEL_7:
  if (v9 && a4 <= 4)
  {
    if (a4)
    {
      v11 = 0;
      do
      {
        var0 = v9->var0;
        if (v9->var0 < 0.0 || var0 >= 1.0)
          MTLReportFailure(0, "-[MTLRenderPassDescriptorInternal setSamplePositions:count:]", 2038, (uint64_t)CFSTR("Provided sample position x-coodinate (%f) at index %u is not within the range [0,1)."), v4, v5, v6, v7, COERCE__INT64(var0));
        var1 = v9->var1;
        if (var1 < 0.0 || var1 >= 1.0)
          MTLReportFailure(0, "-[MTLRenderPassDescriptorInternal setSamplePositions:count:]", 2039, (uint64_t)CFSTR("Provided sample position y-coodinate (%f) at index %u is not within the range [0,1)."), v4, v5, v6, v7, COERCE__INT64(var1));
        v16 = ($38C3DEC81229B66F67FB6D350D75FF5A)*v9++;
        self->_private.customSamplePositions[v11++] = v16;
      }
      while (a4 != v11);
    }
    self->_private.numCustomSamplePositions = a4;
  }
}

- (unint64_t)getSamplePositions:(id *)a3 count:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  unint64_t v12;

  if (!a3 && a4)
  {
    MTLReportFailure(0, "-[MTLRenderPassDescriptorInternal getSamplePositions:count:]", 2048, (uint64_t)CFSTR("Non-zero count (%lu) provided with a NULL positions parameter."), v4, v5, v6, v7, a4);
  }
  else if (!a4)
  {
    goto LABEL_6;
  }
  if (self->_private.numCustomSamplePositions != a4)
    MTLReportFailure(0, "-[MTLRenderPassDescriptorInternal getSamplePositions:count:]", 2049, (uint64_t)CFSTR("Non-zero count (%lu) does not match the number of programmed custom sample positions (%lu)."), v4, v5, v6, v7, a4);
LABEL_6:
  result = self->_private.numCustomSamplePositions;
  if (a3 && result == a4)
  {
    if (a4)
    {
      v12 = 0;
      do
      {
        a3[v12] = ($94F468A8D4C62B317260615823C2B210)self->_private.customSamplePositions[v12];
        ++v12;
        result = self->_private.numCustomSamplePositions;
      }
      while (result > v12);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

@end
