@implementation MTLRenderPipelineDescriptorInternal

- (BOOL)validateWithDevice:(id)a3 error:(id *)a4
{
  MTLRenderPipelineDescriptorPrivate *p_private;
  char v8;
  uint64_t v9;
  uint64_t v10;

  p_private = &self->_private;
  v8 = objc_msgSend(a3, "supportsTextureSampleCount:", self->_private.var0.sampleCount);
  if ((v8 & 1) != 0)
  {
    if ((*((_BYTE *)&p_private->var2.var0 + 4) & 0x10) == 0)
      objc_msgSend(a3, "registerRenderPipelineDescriptor:", self);
    validateWithDevice((id *)a3, (uint64_t)p_private);
  }
  else
  {
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rasterSampleCount (%lu) is not supported by device."), p_private->var0.sampleCount);
    v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v9, *MEMORY[0x1E0CB2D50]);
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PipelineError"), 1, v10);
  }
  return v8;
}

- (id)label
{
  return self->_private.label;
}

- (BOOL)supportIndirectCommandBuffers
{
  return self->_private.supportIndirectCommandBuffers;
}

- (id)fragmentLinkedFunctions
{
  MTLRenderPipelineDescriptorPrivate *p_private;
  id result;
  unint64_t *p_fragmentLinkedFunctions;

  p_private = &self->_private;
  result = self->_private.fragmentLinkedFunctions;
  if (!result)
  {
    p_fragmentLinkedFunctions = (unint64_t *)&p_private->fragmentLinkedFunctions;
    result = objc_alloc_init(MTLLinkedFunctions);
    while (!__ldaxr(p_fragmentLinkedFunctions))
    {
      if (!__stlxr((unint64_t)result, p_fragmentLinkedFunctions))
      {
        *p_fragmentLinkedFunctions = (unint64_t)result;
        return result;
      }
    }
    __clrex();

    return (id)*p_fragmentLinkedFunctions;
  }
  return result;
}

- (id)vertexLinkedFunctions
{
  MTLRenderPipelineDescriptorPrivate *p_private;
  id result;
  unint64_t *p_vertexLinkedFunctions;

  p_private = &self->_private;
  result = self->_private.vertexLinkedFunctions;
  if (!result)
  {
    p_vertexLinkedFunctions = (unint64_t *)&p_private->vertexLinkedFunctions;
    result = objc_alloc_init(MTLLinkedFunctions);
    while (!__ldaxr(p_vertexLinkedFunctions))
    {
      if (!__stlxr((unint64_t)result, p_vertexLinkedFunctions))
      {
        *p_vertexLinkedFunctions = (unint64_t)result;
        return result;
      }
    }
    __clrex();

    return (id)*p_vertexLinkedFunctions;
  }
  return result;
}

- (id)meshFunction
{
  return self->_private.meshFunction;
}

- (id)vertexFunction
{
  return self->_private.vertexFunction;
}

- (id)fragmentFunction
{
  return self->_private.fragmentFunction;
}

- (BOOL)needsCustomBorderColorSamplers
{
  return self->_private.needsCustomBorderColorSamplers;
}

- (BOOL)isRasterizationEnabled
{
  return (LOBYTE(self->_private.var2.miscHash[0]) >> 2) & 1;
}

- (int64_t)textureWriteRoundingMode
{
  return self->_private.textureWriteRoundingMode;
}

- (BOOL)supportAddingVertexBinaryFunctions
{
  return self->_private.supportAddingVertexBinaryFunctions;
}

- (id)objectFunction
{
  return self->_private.objectFunction;
}

- (unint64_t)tessellationPartitionMode
{
  return self->_private.tessellationPartitionMode;
}

- (BOOL)supportAddingFragmentBinaryFunctions
{
  return self->_private.supportAddingFragmentBinaryFunctions;
}

- (unint64_t)maxVertexAmplificationCount
{
  return self->_private.maxVertexAmplificationCount;
}

- (BOOL)openGLModeEnabled
{
  return LOBYTE(self->_private.var2.miscHash[0]) >> 7;
}

- (unint64_t)tessellationFactorStepFunction
{
  return self->_private.tessellationFactorStepFunction;
}

- (unint64_t)tessellationFactorFormat
{
  return self->_private.tessellationFactorFormat;
}

- (BOOL)isTessellationFactorScaleEnabled
{
  return self->_private.tessellationFactorScaleEnabled;
}

- (unint64_t)sampleMask
{
  return self->_private.sampleMask;
}

- (float)sampleCoverage
{
  return self->_private.var1.sampleCoverage;
}

- (unint64_t)rasterSampleCount
{
  return self->_private.var0.sampleCount;
}

- (unsigned)clipDistanceEnableMask
{
  return self->_private.var2.miscHash[0] >> 15;
}

- (unsigned)vertexDepthCompareClampMask
{
  return self->_private.vertexDepthCompareClampMask;
}

- (unint64_t)vertexAmplificationMode
{
  return (*(_QWORD *)&self->_private.var2 >> 10) & 1;
}

- (unint64_t)inputPrimitiveTopology
{
  return (*(_QWORD *)&self->_private.var2 >> 3) & 3;
}

- (unint64_t)tessellationOutputWindingOrder
{
  return self->_private.tessellationOutputWindingOrder;
}

- (unint64_t)maxTessellationFactor
{
  return self->_private.maxTessellationFactor;
}

- (unint64_t)logicOperation
{
  return (*(_QWORD *)&self->_private.var2 >> 27) & 0xFLL;
}

- (BOOL)isPointSmoothEnabled
{
  return (BYTE1(self->_private.var2.miscHash[0]) >> 6) & 1;
}

- (BOOL)isLogicOperationEnabled
{
  return *((unsigned __int8 *)&self->_private.var2.var0 + 3) >> 7;
}

- (BOOL)isDepthStencilWriteDisabled
{
  return (LOBYTE(self->_private.var2.miscHash[0]) >> 6) & 1;
}

- (BOOL)isAlphaToOneEnabled
{
  return (LOBYTE(self->_private.var2.miscHash[0]) >> 1) & 1;
}

- (BOOL)isAlphaToCoverageEnabled
{
  return self->_private.var2.miscHash[0] & 1;
}

- (BOOL)isAlphaTestEnabled
{
  return (*((unsigned __int8 *)&self->_private.var2.var0 + 3) >> 2) & 1;
}

- (unsigned)fragmentDepthCompareClampMask
{
  return self->_private.fragmentDepthCompareClampMask;
}

- (unint64_t)alphaTestFunction
{
  return (*(_QWORD *)&self->_private.var2 >> 23) & 7;
}

- (unint64_t)tessellationControlPointIndexType
{
  return self->_private.tessellationControlPointIndexType;
}

- (unint64_t)stencilAttachmentPixelFormat
{
  return self->_private.stencilAttachmentPixelFormat;
}

- (BOOL)sampleCoverageInvert
{
  return BYTE1(self->_private.var2.miscHash[0]) & 1;
}

- (unint64_t)depthAttachmentPixelFormat
{
  return self->_private.depthAttachmentPixelFormat;
}

- (unint64_t)colorSampleCount
{
  return self->_private.colorSampleCount;
}

- (id)gpuCompilerSPIOptions
{
  return self->_private.gpuCompilerSPIOptions;
}

- (const)_descriptorPrivate
{
  return &self->_private;
}

- (void)dealloc
{
  MTLRenderPipelineDescriptorPrivate *p_private;
  objc_super v4;

  p_private = &self->_private;

  v4.receiver = self;
  v4.super_class = (Class)MTLRenderPipelineDescriptorInternal;
  -[MTLRenderPipelineDescriptorInternal dealloc](&v4, sel_dealloc);
}

- (id)pipelineLibrary
{
  return self->_private.pipelineLibrary;
}

- (id)binaryArchives
{
  return self->_private.binaryArchives;
}

- (id)driverCompilerOptions
{
  return self->_private.driverCompilerOptions;
}

- (id)profileControl
{
  return self->_private.profileControl;
}

- (BOOL)supportAddingObjectBinaryFunctions
{
  return self->_private.supportAddingObjectBinaryFunctions;
}

- (BOOL)supportAddingMeshBinaryFunctions
{
  return self->_private.supportAddingMeshBinaryFunctions;
}

- (unint64_t)maxVertexCallStackDepth
{
  return self->_private.maxVertexStackCallDepth;
}

- (unint64_t)maxObjectCallStackDepth
{
  return self->_private.maxObjectStackCallDepth;
}

- (unint64_t)maxMeshCallStackDepth
{
  return self->_private.maxMeshStackCallDepth;
}

- (unint64_t)maxFragmentCallStackDepth
{
  return self->_private.maxFragmentStackCallDepth;
}

- (id)fragmentPreloadedLibraries
{
  return self->_private.fragmentPreloadedLibraries;
}

- (id)vertexBuffers
{
  return self->_private.vertexBuffers;
}

- (id)vertexPreloadedLibraries
{
  return self->_private.vertexPreloadedLibraries;
}

- (id)objectPreloadedLibraries
{
  return self->_private.objectPreloadedLibraries;
}

- (id)meshPreloadedLibraries
{
  return self->_private.meshPreloadedLibraries;
}

- (unint64_t)maxAccelerationStructureTraversalDepth
{
  return self->_private.maxAccelerationStructureTraversalDepth;
}

- (unsigned)explicitVisibilityGroupID
{
  return self->_private.explicitVisibilityGroupID;
}

- (id)fragmentBuffers
{
  return self->_private.fragmentBuffers;
}

- (id)newSerializedFragmentDataWithFlags:(unint64_t)a3 options:(unint64_t)a4
{
  return createSerializedFragmentData<MTLRenderPipelineDescriptorPrivate>(a3, a4, (uint64_t)&self->_private);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MTLRenderPipelineDescriptorPrivate *p_private;
  _QWORD *v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  unint64_t depth;
  __int128 v14;
  unint64_t maxTotalThreadsPerMeshThreadgroup;
  __int128 v16;
  uint64_t j;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (v5)
  {
    v7 = 0;
    p_private = &self->_private;
    v9 = (_QWORD *)(v5 + 48);
    do
    {
      *(_QWORD *)(*v9 + 8 + v7 * 8) = -[MTLRenderPipelineColorAttachmentDescriptorInternal copyWithZone:](p_private->attachments->_descriptors[v7], "copyWithZone:", a3);
      ++v7;
    }
    while (v7 != 8);
    *(_OWORD *)(v6 + 120) = *(_OWORD *)&p_private->depthAttachmentPixelFormat;
    *(_OWORD *)(v6 + 136) = *(_OWORD *)&p_private->tessellationPartitionMode;
    *(_BYTE *)(v6 + 152) = p_private->tessellationFactorScaleEnabled;
    *(_OWORD *)(v6 + 160) = *(_OWORD *)&p_private->tessellationFactorFormat;
    *(_OWORD *)(v6 + 176) = *(_OWORD *)&p_private->tessellationFactorStepFunction;
    *(_BYTE *)(v6 + 200) = p_private->supportIndirectCommandBuffers;
    *(_QWORD *)(v6 + 224) = p_private->textureWriteRoundingMode;
    *(_QWORD *)(v6 + 272) = *(_QWORD *)(v6 + 272) & 0xFFFFFFFEFFFFFFFFLL | ((HIDWORD(*(_QWORD *)&p_private->var2) & 1) << 32);
    *(_QWORD *)(v6 + 288) = p_private->resourceIndex;
    *(_QWORD *)(v6 + 192) = p_private->postVertexDumpBufferIndex;
    *(_QWORD *)(v6 + 280) = *(_QWORD *)&p_private->vertexDepthCompareClampMask;
    *(_BYTE *)(v6 + 520) = p_private->needsCustomBorderColorSamplers;
    *(_QWORD *)(v6 + 232) = p_private->var0.sampleCount;
    *(_QWORD *)(v6 + 240) = p_private->sampleMask;
    *(_DWORD *)(v6 + 248) = p_private->var1.sampleCoverageHash;
    *(_QWORD *)(v6 + 264) = p_private->colorSampleCount;
    *(_DWORD *)(v6 + 272) = p_private->var2.miscHash[0];
    *(_DWORD *)(v6 + 276) = p_private->var2.miscHash[1];
    *(_QWORD *)(v6 + 296) = -[NSString copyWithZone:](p_private->label, "copyWithZone:", a3);
    *(_QWORD *)(v6 + 488) = p_private->pipelineLibrary;
    *(_QWORD *)(v6 + 320) = -[MTLVertexDescriptorInternal copyWithZone:](p_private->vertexDescriptor, "copyWithZone:", a3);
    *(_QWORD *)(v6 + 304) = p_private->vertexFunction;
    v10 = 0;
    *(_QWORD *)(v6 + 312) = p_private->fragmentFunction;
    do
    {
      *(_QWORD *)(*(_QWORD *)(v6 + 456) + 8 + v10 * 8) = -[MTLPipelineBufferDescriptorInternal copyWithZone:](p_private->vertexBuffers->_descriptors[v10], "copyWithZone:", a3);
      ++v10;
    }
    while (v10 != 31);
    for (i = 0; i != 31; ++i)
      *(_QWORD *)(*(_QWORD *)(v6 + 464) + 8 + i * 8) = -[MTLPipelineBufferDescriptorInternal copyWithZone:](p_private->fragmentBuffers->_descriptors[i], "copyWithZone:", a3);
    *(_QWORD *)(v6 + 472) = -[NSDictionary copy](p_private->driverCompilerOptions, "copy");
    *(_QWORD *)(v6 + 480) = -[NSDictionary copy](p_private->gpuCompilerSPIOptions, "copy");
    *(_DWORD *)(v6 + 524) = p_private->maxVertexAmplificationCount;
    *(_QWORD *)(v6 + 512) = p_private->pluginData;
    *(_QWORD *)(v6 + 528) = -[NSArray copy](p_private->binaryArchives, "copy");
    *(_QWORD *)(v6 + 328) = p_private->objectFunction;
    v12 = 0;
    *(_QWORD *)(v6 + 336) = p_private->meshFunction;
    depth = p_private->objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.depth;
    *(_OWORD *)(v6 + 344) = *(_OWORD *)&p_private->objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.width;
    *(_QWORD *)(v6 + 360) = depth;
    v14 = *(_OWORD *)&p_private->meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.width;
    *(_QWORD *)(v6 + 384) = p_private->meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.depth;
    *(_OWORD *)(v6 + 368) = v14;
    maxTotalThreadsPerMeshThreadgroup = p_private->maxTotalThreadsPerMeshThreadgroup;
    *(_QWORD *)(v6 + 440) = p_private->maxTotalThreadsPerObjectThreadgroup;
    *(_QWORD *)(v6 + 448) = maxTotalThreadsPerMeshThreadgroup;
    v16 = *(_OWORD *)&p_private->maxPipelineChildren.width;
    *(_QWORD *)(v6 + 408) = p_private->maxPipelineChildren.depth;
    *(_OWORD *)(v6 + 392) = v16;
    *(_QWORD *)(v6 + 416) = p_private->pipelineMemoryLength;
    do
    {
      *(_QWORD *)(*(_QWORD *)(v6 + 424) + 8 + v12 * 8) = -[MTLPipelineBufferDescriptorInternal copyWithZone:](p_private->objectBuffers->_descriptors[v12], "copyWithZone:", a3);
      ++v12;
    }
    while (v12 != 31);
    for (j = 0; j != 31; ++j)
      *(_QWORD *)(*(_QWORD *)(v6 + 432) + 8 + j * 8) = -[MTLPipelineBufferDescriptorInternal copyWithZone:](p_private->meshBuffers->_descriptors[j], "copyWithZone:", a3);
    *(_QWORD *)(v6 + 536) = -[MTLLinkedFunctions copy](p_private->vertexLinkedFunctions, "copy");
    *(_QWORD *)(v6 + 544) = -[MTLLinkedFunctions copy](p_private->fragmentLinkedFunctions, "copy");
    *(_QWORD *)(v6 + 552) = -[MTLLinkedFunctions copy](p_private->objectLinkedFunctions, "copy");
    *(_QWORD *)(v6 + 560) = -[MTLLinkedFunctions copy](p_private->meshLinkedFunctions, "copy");
    *(_QWORD *)(v6 + 568) = -[NSArray copy](p_private->vertexPreloadedLibraries, "copy");
    *(_QWORD *)(v6 + 576) = -[NSArray copy](p_private->fragmentPreloadedLibraries, "copy");
    *(_QWORD *)(v6 + 584) = -[NSArray copy](p_private->objectPreloadedLibraries, "copy");
    *(_QWORD *)(v6 + 592) = -[NSArray copy](p_private->meshPreloadedLibraries, "copy");
    *(_QWORD *)(v6 + 600) = p_private->maxVertexStackCallDepth;
    *(_QWORD *)(v6 + 608) = p_private->maxFragmentStackCallDepth;
    *(_WORD *)(v6 + 616) = *(_WORD *)&p_private->supportAddingVertexBinaryFunctions;
    *(_OWORD *)(v6 + 624) = *(_OWORD *)&p_private->maxMeshStackCallDepth;
    *(_WORD *)(v6 + 640) = *(_WORD *)&p_private->supportAddingMeshBinaryFunctions;
    *(_QWORD *)(v6 + 648) = -[MTLProfileControl copy](p_private->profileControl, "copy");
    *(_DWORD *)(v6 + 656) = p_private->explicitVisibilityGroupID;
    *(_QWORD *)(v6 + 664) = p_private->maxAccelerationStructureTraversalDepth;
    *(_OWORD *)(v6 + 208) = *(_OWORD *)&p_private->shaderValidation;
    *(_QWORD *)(v6 + 272) = *(_QWORD *)(v6 + 272) & 0xFFFFFFEFFFFFFFFFLL | (((*(_QWORD *)&p_private->var2 >> 36) & 1) << 36);
  }
  return (id)v6;
}

- (MTLRenderPipelineDescriptorInternal)init
{
  MTLRenderPipelineDescriptorInternal *v2;
  MTLRenderPipelineDescriptorInternal *v3;
  uint64_t v4;
  $65165931DE83DC9F336BFC9DC178100F var2;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLRenderPipelineDescriptorInternal;
  v2 = -[MTLRenderPipelineDescriptorInternal init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_private.var2 = 0;
    v2->_private.attachments = objc_alloc_init(MTLRenderPipelineColorAttachmentDescriptorArrayInternal);
    v3->_private.depthAttachmentPixelFormat = 0;
    v3->_private.stencilAttachmentPixelFormat = 0;
    v3->_private.tessellationPartitionMode = 0;
    v3->_private.maxTessellationFactor = 16;
    v3->_private.tessellationFactorScaleEnabled = 0;
    *(_OWORD *)&v3->_private.tessellationFactorFormat = 0u;
    *(_OWORD *)&v3->_private.tessellationFactorStepFunction = 0u;
    v3->_private.postVertexDumpBufferIndex = 0;
    *(_OWORD *)&v3->_private.var0.sampleCount = xmmword_18281B390;
    v3->_private.var1.sampleCoverageHash = 1065353216;
    v4 = *(_QWORD *)&v3->_private.var2 | 0x7F8004;
    v3->_private.colorSampleCount = 0;
    v3->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)v4;
    v3->_private.vertexBuffers = objc_alloc_init(MTLPipelineBufferDescriptorArrayInternal);
    v3->_private.fragmentBuffers = objc_alloc_init(MTLPipelineBufferDescriptorArrayInternal);
    v3->_private.supportIndirectCommandBuffers = 0;
    var2 = v3->_private.var2;
    v3->_private.resourceIndex = 0;
    v3->_private.explicitVisibilityGroupID = -1;
    v3->_private.textureWriteRoundingMode = 0;
    v3->_private.maxVertexAmplificationCount = 1;
    v3->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&var2 & 0xFFFFFFFCFFFFFFFFLL);
    v3->_private.objectBuffers = objc_alloc_init(MTLPipelineBufferDescriptorArrayInternal);
    v3->_private.meshBuffers = objc_alloc_init(MTLPipelineBufferDescriptorArrayInternal);
    *(_WORD *)&v3->_private.supportAddingVertexBinaryFunctions = 0;
    *(_OWORD *)&v3->_private.vertexLinkedFunctions = 0u;
    *(_OWORD *)&v3->_private.objectLinkedFunctions = 0u;
    v3->_private.maxVertexStackCallDepth = 1;
    v3->_private.maxFragmentStackCallDepth = 1;
    *(_WORD *)&v3->_private.supportAddingMeshBinaryFunctions = 0;
    *(int64x2_t *)&v3->_private.maxMeshStackCallDepth = vdupq_n_s64(1uLL);
    v3->_private.vertexPreloadedLibraries = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    v3->_private.fragmentPreloadedLibraries = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    v3->_private.objectPreloadedLibraries = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    v3->_private.meshPreloadedLibraries = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    v3->_private.profileControl = 0;
    v3->_private.maxAccelerationStructureTraversalDepth = 0;
    v3->_private.shaderValidation = 0;
    v3->_private.shaderValidationState = 0;
  }
  return v3;
}

- (void)setRasterSampleCount:(unint64_t)a3
{
  self->_private.var0.sampleCount = a3;
}

- (id)meshLinkedFunctions
{
  MTLRenderPipelineDescriptorPrivate *p_private;
  id result;
  unint64_t *p_meshLinkedFunctions;

  p_private = &self->_private;
  result = self->_private.meshLinkedFunctions;
  if (!result)
  {
    p_meshLinkedFunctions = (unint64_t *)&p_private->meshLinkedFunctions;
    result = objc_alloc_init(MTLLinkedFunctions);
    while (!__ldaxr(p_meshLinkedFunctions))
    {
      if (!__stlxr((unint64_t)result, p_meshLinkedFunctions))
      {
        *p_meshLinkedFunctions = (unint64_t)result;
        return result;
      }
    }
    __clrex();

    return (id)*p_meshLinkedFunctions;
  }
  return result;
}

- (id)objectLinkedFunctions
{
  MTLRenderPipelineDescriptorPrivate *p_private;
  id result;
  unint64_t *p_objectLinkedFunctions;

  p_private = &self->_private;
  result = self->_private.objectLinkedFunctions;
  if (!result)
  {
    p_objectLinkedFunctions = (unint64_t *)&p_private->objectLinkedFunctions;
    result = objc_alloc_init(MTLLinkedFunctions);
    while (!__ldaxr(p_objectLinkedFunctions))
    {
      if (!__stlxr((unint64_t)result, p_objectLinkedFunctions))
      {
        *p_objectLinkedFunctions = (unint64_t)result;
        return result;
      }
    }
    __clrex();

    return (id)*p_objectLinkedFunctions;
  }
  return result;
}

- (void)setMaxVertexAmplificationCount:(unint64_t)a3
{
  self->_private.maxVertexAmplificationCount = a3;
}

- (id)newSerializedVertexDataWithFlags:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5
{
  unsigned int v5;
  MTLRenderPipelineDescriptorPrivate *p_private;
  unsigned int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  $65165931DE83DC9F336BFC9DC178100F var2;
  int v13;
  unsigned int v14;
  MTLLinkedFunctions *vertexLinkedFunctions;
  uint64_t v16;
  MTLVertexDescriptorInternal *vertexDescriptor;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  size_t v21;
  MTLFunction *fragmentFunction;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const void **v30;
  const void *v31;
  char *v32;
  char *v33;
  size_t v35;
  void *v36;
  uint64_t __src;
  uint64_t v38;
  unsigned int v39;
  size_t size_ptr;
  void *buffer_ptr;

  v5 = a3;
  size_ptr = 0;
  buffer_ptr = 0;
  __src = 0;
  v38 = 0;
  v39 = 0;
  p_private = &self->_private;
  v7 = ((a4 >> 14) | (self->_private.var2.miscHash[0] << 12)) & 0x80400 | (self->_private.var2.miscHash[0] >> 2) & 1;
  v8 = -[MTLFunction patchType](self->_private.vertexFunction, "patchType");
  v9 = v5 & 0x18 | v7;
  if (v8)
  {
    if ((((v5 >> 3) | (v5 >> 4)) & 1) == 0)
    {
LABEL_3:
      v10 = 0;
      goto LABEL_6;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  v10 = 4;
LABEL_6:
  v11 = v10 | v9;
  var2 = p_private->var2;
  v13 = v9 | 4;
  if ((*(_QWORD *)&var2 & 0x200000000) != 0)
    v13 = v7 | 0x1C;
  if ((*(_QWORD *)&var2 & 0x200000080) == 0)
    v13 = v11;
  v14 = v13 & 0x8049F | (32 * ((var2.miscHash[0] >> 3) & 3)) & 0xFFF804FF | ((p_private->tessellationControlPointIndexType & 3) << 8) & 0x7FF | (LODWORD(p_private->postVertexDumpBufferIndex) << 11);
  LODWORD(v38) = v14;
  vertexLinkedFunctions = p_private->vertexLinkedFunctions;
  if (vertexLinkedFunctions
    && (-[MTLLinkedFunctions functions](vertexLinkedFunctions, "functions")
     && -[NSArray count](-[MTLLinkedFunctions functions](p_private->vertexLinkedFunctions, "functions"), "count")
     || -[MTLLinkedFunctions privateFunctions](p_private->vertexLinkedFunctions, "privateFunctions")
     && -[NSArray count](-[MTLLinkedFunctions privateFunctions](p_private->vertexLinkedFunctions, "privateFunctions"), "count")))
  {
    v14 |= 0x100000u;
    LODWORD(v38) = v14;
  }
  if ((v14 & 0x100000) != 0)
    v16 = 20;
  else
    v16 = 12;
  if ((v14 & 4) != 0
    && (vertexDescriptor = p_private->vertexDescriptor) != 0
    && (v18 = -[MTLVertexDescriptorInternal newSerializedDescriptor](vertexDescriptor, "newSerializedDescriptor")) != 0)
  {
    v19 = v18;
    v14 |= 2u;
    LODWORD(v38) = v14;
    v20 = dispatch_data_create_map(v18, (const void **)&buffer_ptr, &size_ptr);
    v21 = size_ptr + v16;
    dispatch_release(v19);
  }
  else
  {
    v20 = 0;
    v21 = v16;
  }
  v35 = 0;
  v36 = 0;
  fragmentFunction = p_private->fragmentFunction;
  if (fragmentFunction && (v23 = -[MTLFunction functionInputs](fragmentFunction, "functionInputs")) != 0)
  {
    v24 = dispatch_data_create_map(v23, (const void **)&v36, &v35);
    v21 += v35;
    v14 |= 0x80u;
    LODWORD(v38) = v14;
  }
  else
  {
    v24 = 0;
  }
  v25 = (void *)-[MTLFunction device](p_private->vertexFunction, "device");
  if (!v25)
    v25 = (void *)-[MTLFunction device](p_private->meshFunction, "device");
  v26 = MTLSerializePluginDataDictionary((void *)objc_msgSend(v25, "pluginData"), 0);
  v27 = v26;
  if (v26)
  {
    LODWORD(__src) = v21;
    v21 += v26;
  }
  v28 = MTLSerializePluginDataDictionary(p_private->pluginData, 0);
  v29 = v28;
  if (v28)
  {
    HIDWORD(__src) = v21;
    v21 += v28;
  }
  if ((v14 & 0x100000) != 0)
  {
    v30 = (const void **)_MTLPopulateLinkedFunctionExtraData(p_private->vertexLinkedFunctions);
    v31 = v30[2];
    HIDWORD(v38) = v21;
    v39 = v31;
    v21 += v31;
  }
  else
  {
    v30 = 0;
  }
  v32 = (char *)malloc_type_malloc(v21, 0xF6397F46uLL);
  memcpy(v32, &__src, v16);
  v33 = &v32[v16];
  if (v20)
  {
    memcpy(v33, buffer_ptr, size_ptr);
    v33 += size_ptr;
    dispatch_release(v20);
  }
  if (v24)
  {
    memcpy(v33, v36, v35);
    v33 += v35;
    dispatch_release(v24);
  }
  if (v27)
    v33 += MTLSerializePluginDataDictionary((void *)objc_msgSend(v25, "pluginData"), v33);
  if (v29)
    MTLSerializePluginDataDictionary(p_private->pluginData, v33);
  if ((v38 & 0x100000) != 0)
  {
    memcpy(&v32[HIDWORD(v38)], *v30, v39);
    free((void *)*v30);
    MEMORY[0x186DABFBC](v30, 0x1010C40113C0ABBLL);
  }
  return dispatch_data_create(v32, v21, 0, (dispatch_block_t)*MEMORY[0x1E0C80CE0]);
}

void __43__MTLRenderPipelineDescriptorInternal_hash__block_invoke()
{
  MTLVertexDescriptor *v0;

  v0 = objc_alloc_init(MTLVertexDescriptor);
  -[MTLRenderPipelineDescriptorInternal hash]::defaultVertexDescriptorHash = -[MTLVertexDescriptor hash](v0, "hash");

}

- (unint64_t)hash
{
  MTLRenderPipelineDescriptorPrivate *p_private;
  uint64_t v4;
  uint64_t descriptors;
  uint64_t v6;
  uint64_t *v7;
  unint64_t maxTessellationFactor;
  int16x8_t v9;
  int32x2_t v10;
  NSString *label;
  $65165931DE83DC9F336BFC9DC178100F var2;
  unint64_t v13;
  MTLVertexDescriptorInternal *vertexDescriptor;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  unint64_t maxTotalThreadsPerMeshThreadgroup;
  unint64_t pipelineMemoryLength;
  int v36[16];
  int32x2_t v37;
  char tessellationPartitionMode;
  char v39;
  BOOL tessellationFactorScaleEnabled;
  unsigned __int32 v41;
  char postVertexDumpBufferIndex;
  BOOL needsCustomBorderColorSamplers;
  char colorSampleCount;
  BOOL supportIndirectCommandBuffers;
  unint64_t resourceIndex;
  int textureWriteRoundingMode;
  uint64_t v48;
  $65165931DE83DC9F336BFC9DC178100F v49;
  unint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE v56[496];
  uint64_t v57;
  uint64_t v58;
  unsigned int maxVertexAmplificationCount;
  uint64_t v60;
  uint64_t v61;
  _BYTE v62[281];
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  unint64_t depth;
  __int128 v67;
  unint64_t v68;
  __int128 v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t maxTotalThreadsPerObjectThreadgroup;
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
  unint64_t maxVertexStackCallDepth;
  unint64_t maxFragmentStackCallDepth;
  uint64_t v86;
  uint64_t v87;
  __int128 v88;
  uint64_t v89;
  unsigned int explicitVisibilityGroupID;
  unint64_t maxAccelerationStructureTraversalDepth;
  __int128 v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  if (-[MTLRenderPipelineDescriptorInternal hash]::onceToken != -1)
    dispatch_once(&-[MTLRenderPipelineDescriptorInternal hash]::onceToken, &__block_literal_global_18);
  p_private = &self->_private;
  bzero(v36, 0x5C0uLL);
  v4 = 0;
  descriptors = (uint64_t)p_private->attachments->_descriptors;
  do
  {
    v6 = *(_QWORD *)(descriptors + v4 * 4);
    if (v6)
      v7 = (uint64_t *)(v6 + 8);
    else
      v7 = &_MTLDefaultRenderPipelineAttachmentPrivate;
    *(_QWORD *)&v36[v4] = *v7;
    v4 += 2;
  }
  while (v4 != 16);
  v37 = vmovn_s64(*(int64x2_t *)&p_private->depthAttachmentPixelFormat);
  maxTessellationFactor = p_private->maxTessellationFactor;
  tessellationPartitionMode = p_private->tessellationPartitionMode;
  v39 = maxTessellationFactor;
  tessellationFactorScaleEnabled = p_private->tessellationFactorScaleEnabled;
  v9 = *(int16x8_t *)&p_private->tessellationFactorFormat;
  v10 = vmovn_s64(*(int64x2_t *)&p_private->tessellationFactorStepFunction);
  *(int32x2_t *)v9.i8 = vmovn_s64((int64x2_t)v9);
  v9.i16[1] = v9.i16[2];
  v9.i16[2] = v10.i16[0];
  v9.i16[3] = v10.i16[2];
  v41 = vmovn_s16(v9).u32[0];
  supportIndirectCommandBuffers = p_private->supportIndirectCommandBuffers;
  label = p_private->label;
  resourceIndex = p_private->resourceIndex;
  textureWriteRoundingMode = p_private->textureWriteRoundingMode;
  postVertexDumpBufferIndex = p_private->postVertexDumpBufferIndex;
  needsCustomBorderColorSamplers = p_private->needsCustomBorderColorSamplers;
  var2 = p_private->var2;
  colorSampleCount = p_private->colorSampleCount;
  v48 = *(_QWORD *)&p_private->vertexDepthCompareClampMask;
  v13 = LOBYTE(p_private->var0.sampleCount) | ((unint64_t)(unsigned __int16)LODWORD(p_private->sampleMask) << 8) | ((unint64_t)p_private->var1.sampleCoverageHash << 32);
  v51 = 0;
  v49 = var2;
  v50 = v13;
  v52 = -[NSString hash](label, "hash");
  v53 = -[MTLFunction hash](p_private->vertexFunction, "hash");
  v54 = -[MTLFunction hash](p_private->fragmentFunction, "hash");
  vertexDescriptor = p_private->vertexDescriptor;
  if (vertexDescriptor)
    v15 = -[MTLVertexDescriptorInternal hash](vertexDescriptor, "hash");
  else
    v15 = -[MTLRenderPipelineDescriptorInternal hash]::defaultVertexDescriptorHash;
  v16 = 0;
  v55 = v15;
  v17 = (uint64_t)p_private->vertexBuffers->_descriptors;
  do
  {
    v18 = *(_QWORD *)(v17 + v16);
    if (v18)
      v19 = (uint64_t *)(v18 + 8);
    else
      v19 = &_MTLDefaultPipelineBufferPrivate;
    *(_QWORD *)&v56[v16] = *v19;
    v16 += 8;
  }
  while (v16 != 248);
  v20 = 0;
  v21 = (uint64_t)p_private->fragmentBuffers->_descriptors;
  do
  {
    v22 = *(_QWORD *)(v21 + v20);
    if (v22)
      v23 = (uint64_t *)(v22 + 8);
    else
      v23 = &_MTLDefaultPipelineBufferPrivate;
    *(_QWORD *)&v56[v20 + 248] = *v23;
    v20 += 8;
  }
  while (v20 != 248);
  v57 = -[NSDictionary hash](p_private->driverCompilerOptions, "hash");
  v58 = -[NSDictionary hash](p_private->gpuCompilerSPIOptions, "hash");
  maxVertexAmplificationCount = p_private->maxVertexAmplificationCount;
  v60 = -[NSDictionary hash](p_private->pluginData, "hash");
  v24 = MTLHashArray(p_private->binaryArchives, 1, 0);
  v25 = 0;
  v61 = v24;
  v26 = (uint64_t)p_private->objectBuffers->_descriptors;
  do
  {
    v27 = *(_QWORD *)(v26 + v25);
    if (v27)
      v28 = (uint64_t *)(v27 + 8);
    else
      v28 = &_MTLDefaultPipelineBufferPrivate;
    *(_QWORD *)&v62[v25] = *v28;
    v25 += 8;
  }
  while (v25 != 248);
  v29 = 0;
  v30 = (uint64_t)p_private->meshBuffers->_descriptors;
  do
  {
    v31 = *(_QWORD *)(v30 + v29);
    if (v31)
      v32 = (uint64_t *)(v31 + 8);
    else
      v32 = &_MTLDefaultPipelineBufferPrivate;
    *(_QWORD *)&v62[v29 + 248] = *v32;
    v29 += 8;
  }
  while (v29 != 248);
  v63 = -[MTLFunction hash](p_private->objectFunction, "hash");
  v64 = -[MTLFunction hash](p_private->meshFunction, "hash");
  v65 = *(_OWORD *)&p_private->objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.width;
  depth = p_private->objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.depth;
  v67 = *(_OWORD *)&p_private->meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.width;
  v68 = p_private->meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.depth;
  maxTotalThreadsPerMeshThreadgroup = p_private->maxTotalThreadsPerMeshThreadgroup;
  maxTotalThreadsPerObjectThreadgroup = p_private->maxTotalThreadsPerObjectThreadgroup;
  v73 = maxTotalThreadsPerMeshThreadgroup;
  v69 = *(_OWORD *)&p_private->maxPipelineChildren.width;
  pipelineMemoryLength = p_private->pipelineMemoryLength;
  v70 = p_private->maxPipelineChildren.depth;
  v71 = pipelineMemoryLength;
  v74 = -[MTLLinkedFunctions hash](p_private->vertexLinkedFunctions, "hash");
  v75 = -[MTLLinkedFunctions hash](p_private->fragmentLinkedFunctions, "hash");
  v76 = -[MTLLinkedFunctions hash](p_private->objectLinkedFunctions, "hash");
  v77 = -[MTLLinkedFunctions hash](p_private->meshLinkedFunctions, "hash");
  v78 = MTLHashArray(p_private->vertexPreloadedLibraries, 1, 1);
  v79 = MTLHashArray(p_private->fragmentPreloadedLibraries, 1, 1);
  v80 = MTLHashArray(p_private->objectPreloadedLibraries, 1, 1);
  v81 = MTLHashArray(p_private->meshPreloadedLibraries, 1, 1);
  v82 = -(uint64_t)p_private->supportAddingVertexBinaryFunctions;
  v83 = -(uint64_t)p_private->supportAddingFragmentBinaryFunctions;
  maxVertexStackCallDepth = p_private->maxVertexStackCallDepth;
  maxFragmentStackCallDepth = p_private->maxFragmentStackCallDepth;
  v86 = -(uint64_t)p_private->supportAddingMeshBinaryFunctions;
  v87 = -(uint64_t)p_private->supportAddingObjectBinaryFunctions;
  v88 = *(_OWORD *)&p_private->maxMeshStackCallDepth;
  v89 = -[MTLProfileControl hash](p_private->profileControl, "hash");
  explicitVisibilityGroupID = p_private->explicitVisibilityGroupID;
  maxAccelerationStructureTraversalDepth = p_private->maxAccelerationStructureTraversalDepth;
  v92 = *(_OWORD *)&p_private->shaderValidation;
  return _MTLHashState(v36, 0x5C0uLL);
}

- (void)setVertexDescriptor:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  MTLRenderPipelineDescriptorPrivate *p_private;
  MTLVertexDescriptorInternal *vertexDescriptor;
  uint64_t v11;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setVertexDescriptor:]", 3743, (uint64_t)CFSTR("vertexDescriptor is not a MTLVertexDescriptor."), v5, v6, v7, v8, v11);
  }
  p_private = &self->_private;
  vertexDescriptor = p_private->vertexDescriptor;
  if (vertexDescriptor != a3)
  {

    p_private->vertexDescriptor = (MTLVertexDescriptorInternal *)objc_msgSend(a3, "copy");
  }
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  int v6;
  uint64_t v7;
  MTLRenderPipelineDescriptorPrivate *p_private;
  char *v9;
  MTLRenderPipelineColorAttachmentDescriptorInternal *v10;
  MTLRenderPipelineColorAttachmentDescriptorInternal *v11;
  BOOL v12;
  uint64_t v13;
  MTLPipelineBufferDescriptorInternal *v14;
  MTLPipelineBufferDescriptorInternal *v15;
  BOOL v16;
  uint64_t v17;
  MTLPipelineBufferDescriptorInternal *v18;
  MTLPipelineBufferDescriptorInternal *v19;
  BOOL v20;
  NSString *label;
  MTLFunction *vertexFunction;
  MTLFunction *fragmentFunction;
  NSDictionary *driverCompilerOptions;
  NSDictionary *gpuCompilerSPIOptions;
  NSDictionary *pluginData;
  int v27;
  MTLFunction *objectFunction;
  MTLFunction *meshFunction;
  uint64_t v30;
  MTLPipelineBufferDescriptorInternal *v31;
  MTLPipelineBufferDescriptorInternal *v32;
  BOOL v33;
  uint64_t v34;
  MTLPipelineBufferDescriptorInternal *v35;
  MTLPipelineBufferDescriptorInternal *v36;
  BOOL v37;
  BOOL v38;
  BOOL v40;
  BOOL v42;
  MTLProfileControl *profileControl;

  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    Class = object_getClass(self);
    if (Class == object_getClass(a3))
    {
      v7 = 0;
      p_private = &self->_private;
      v9 = (char *)a3 + 48;
      while (1)
      {
        v10 = p_private->attachments->_descriptors[v7];
        v11 = *(MTLRenderPipelineColorAttachmentDescriptorInternal **)(*(_QWORD *)v9 + 8 + v7 * 8);
        if (v10 != v11)
        {
          v12 = !v10 || v11 == 0;
          if (v12 || v10->_private.var0.var1.var0 != v11->_private.var0.var1.var0)
            break;
        }
        if (++v7 == 8)
        {
          v13 = 0;
          while (1)
          {
            v14 = p_private->vertexBuffers->_descriptors[v13];
            v15 = *(MTLPipelineBufferDescriptorInternal **)(*((_QWORD *)v9 + 51) + 8 + v13 * 8);
            if (v14 != v15)
            {
              v16 = !v14 || v15 == 0;
              if (v16 || v14->_private.var0.var1.var0 != v15->_private.var0.var1.var0)
                goto LABEL_3;
            }
            if (++v13 == 31)
            {
              v17 = 0;
              while (1)
              {
                v18 = p_private->fragmentBuffers->_descriptors[v17];
                v19 = *(MTLPipelineBufferDescriptorInternal **)(*((_QWORD *)v9 + 52) + 8 + v17 * 8);
                if (v18 != v19)
                {
                  v20 = !v18 || v19 == 0;
                  if (v20 || v18->_private.var0.var1.var0 != v19->_private.var0.var1.var0)
                    goto LABEL_3;
                }
                if (++v17 == 31)
                {
                  if (p_private->depthAttachmentPixelFormat != *((_QWORD *)v9 + 9)
                    || p_private->stencilAttachmentPixelFormat != *((_QWORD *)v9 + 10)
                    || p_private->tessellationPartitionMode != *((_QWORD *)v9 + 11)
                    || p_private->maxTessellationFactor != *((_QWORD *)v9 + 12)
                    || p_private->tessellationFactorScaleEnabled != v9[104]
                    || p_private->tessellationFactorFormat != *((_QWORD *)v9 + 14)
                    || p_private->tessellationControlPointIndexType != *((_QWORD *)v9 + 15)
                    || p_private->tessellationFactorStepFunction != *((_QWORD *)v9 + 16)
                    || p_private->tessellationOutputWindingOrder != *((_QWORD *)v9 + 17)
                    || p_private->supportIndirectCommandBuffers != v9[152]
                    || p_private->textureWriteRoundingMode != *((_QWORD *)v9 + 22)
                    || p_private->resourceIndex != *((_QWORD *)v9 + 30)
                    || p_private->postVertexDumpBufferIndex != *((_QWORD *)v9 + 18)
                    || p_private->vertexDepthCompareClampMask != *((_DWORD *)v9 + 58)
                    || p_private->fragmentDepthCompareClampMask != *((_DWORD *)v9 + 59)
                    || p_private->needsCustomBorderColorSamplers != v9[472]
                    || p_private->var0.sampleCount != *((_QWORD *)v9 + 23)
                    || p_private->sampleMask != *((_QWORD *)v9 + 24)
                    || p_private->var1.sampleCoverage != *((float *)v9 + 50)
                    || p_private->colorSampleCount != *((_QWORD *)v9 + 27)
                    || p_private->var2.miscHash[0] != *((_DWORD *)v9 + 56)
                    || p_private->var2.miscHash[1] != *((_DWORD *)v9 + 57))
                  {
                    goto LABEL_3;
                  }
                  label = p_private->label;
                  if (label == *((NSString **)v9 + 31) || (v6 = -[NSString isEqual:](label, "isEqual:")) != 0)
                  {
                    vertexFunction = p_private->vertexFunction;
                    if (vertexFunction == *((MTLFunction **)v9 + 32)
                      || (v6 = -[MTLFunction isEqual:](vertexFunction, "isEqual:")) != 0)
                    {
                      fragmentFunction = p_private->fragmentFunction;
                      if (fragmentFunction == *((MTLFunction **)v9 + 33)
                        || (v6 = -[MTLFunction isEqual:](fragmentFunction, "isEqual:")) != 0)
                      {
                        v6 = MTLVertexDescriptorEquivalent(p_private->vertexDescriptor, *((MTLVertexDescriptorInternal **)v9 + 34));
                        if (v6)
                        {
                          driverCompilerOptions = p_private->driverCompilerOptions;
                          if (driverCompilerOptions == *((NSDictionary **)v9 + 53)
                            || (v6 = -[NSDictionary isEqual:](driverCompilerOptions, "isEqual:")) != 0)
                          {
                            gpuCompilerSPIOptions = p_private->gpuCompilerSPIOptions;
                            if (gpuCompilerSPIOptions == *((NSDictionary **)v9 + 54)
                              || (v6 = -[NSDictionary isEqual:](gpuCompilerSPIOptions, "isEqual:")) != 0)
                            {
                              if (p_private->maxVertexAmplificationCount != *((_DWORD *)v9 + 119))
                                goto LABEL_3;
                              pluginData = p_private->pluginData;
                              if (pluginData == *((NSDictionary **)v9 + 58)
                                || (v6 = -[NSDictionary isEqual:](pluginData, "isEqual:")) != 0)
                              {
                                v27 = MTLCompareArray(p_private->binaryArchives, *((void **)v9 + 60), 1, 0);
                                LOBYTE(v6) = 0;
                                if (v27)
                                {
                                  objectFunction = p_private->objectFunction;
                                  if (objectFunction == *((MTLFunction **)v9 + 35)
                                    || (v6 = -[MTLFunction isEqual:](objectFunction, "isEqual:")) != 0)
                                  {
                                    meshFunction = p_private->meshFunction;
                                    if (meshFunction == *((MTLFunction **)v9 + 36)
                                      || (v6 = -[MTLFunction isEqual:](meshFunction, "isEqual:")) != 0)
                                    {
                                      v30 = 0;
                                      while (1)
                                      {
                                        v31 = p_private->objectBuffers->_descriptors[v30];
                                        v32 = *(MTLPipelineBufferDescriptorInternal **)(*((_QWORD *)v9 + 47)
                                                                                      + 8
                                                                                      + v30 * 8);
                                        if (v31 != v32)
                                        {
                                          v33 = !v31 || v32 == 0;
                                          if (v33 || v31->_private.var0.var1.var0 != v32->_private.var0.var1.var0)
                                            goto LABEL_3;
                                        }
                                        if (++v30 == 31)
                                        {
                                          v34 = 0;
                                          while (1)
                                          {
                                            v35 = p_private->meshBuffers->_descriptors[v34];
                                            v36 = *(MTLPipelineBufferDescriptorInternal **)(*((_QWORD *)v9 + 48)
                                                                                          + 8
                                                                                          + v34 * 8);
                                            if (v35 != v36)
                                            {
                                              v37 = !v35 || v36 == 0;
                                              if (v37 || v35->_private.var0.var1.var0 != v36->_private.var0.var1.var0)
                                                goto LABEL_3;
                                            }
                                            if (++v34 == 31)
                                            {
                                              if (p_private->pipelineMemoryLength == *((_QWORD *)v9 + 46)
                                                && p_private->maxTotalThreadsPerObjectThreadgroup == *((_QWORD *)v9 + 49)
                                                && p_private->maxTotalThreadsPerMeshThreadgroup == *((_QWORD *)v9 + 50))
                                              {
                                                v38 = p_private->objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.width == *((_QWORD *)v9 + 37)
                                                   && p_private->objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.height == *((_QWORD *)v9 + 38);
                                                if (v38
                                                  && p_private->objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.depth == *((_QWORD *)v9 + 39))
                                                {
                                                  v40 = p_private->meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.width == *((_QWORD *)v9 + 40)
                                                     && p_private->meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.height == *((_QWORD *)v9 + 41);
                                                  if (v40
                                                    && p_private->meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.depth == *((_QWORD *)v9 + 42))
                                                  {
                                                    v42 = p_private->maxPipelineChildren.width == *((_QWORD *)v9 + 43)
                                                       && p_private->maxPipelineChildren.height == *((_QWORD *)v9 + 44);
                                                    if (v42
                                                      && p_private->maxPipelineChildren.depth == *((_QWORD *)v9 + 45))
                                                    {
                                                      v6 = MTLCompareFunctionList(p_private->vertexLinkedFunctions, *((void **)v9 + 61));
                                                      if (!v6)
                                                        return v6;
                                                      v6 = MTLCompareFunctionList(p_private->fragmentLinkedFunctions, *((void **)v9 + 62));
                                                      if (!v6)
                                                        return v6;
                                                      v6 = MTLCompareFunctionList(p_private->objectLinkedFunctions, *((void **)v9 + 63));
                                                      if (!v6)
                                                        return v6;
                                                      v6 = MTLCompareFunctionList(p_private->meshLinkedFunctions, *((void **)v9 + 64));
                                                      if (!v6)
                                                        return v6;
                                                      v6 = MTLCompareArray(p_private->vertexPreloadedLibraries, *((void **)v9 + 65), 1, 1);
                                                      if (!v6)
                                                        return v6;
                                                      v6 = MTLCompareArray(p_private->fragmentPreloadedLibraries, *((void **)v9 + 66), 1, 1);
                                                      if (!v6)
                                                        return v6;
                                                      v6 = MTLCompareArray(p_private->objectPreloadedLibraries, *((void **)v9 + 67), 1, 1);
                                                      if (!v6)
                                                        return v6;
                                                      v6 = MTLCompareArray(p_private->meshPreloadedLibraries, *((void **)v9 + 68), 1, 1);
                                                      if (!v6)
                                                        return v6;
                                                      if (p_private->supportAddingVertexBinaryFunctions == v9[568]
                                                        && p_private->supportAddingFragmentBinaryFunctions == v9[569]
                                                        && p_private->maxVertexStackCallDepth == *((_QWORD *)v9 + 69)
                                                        && p_private->maxFragmentStackCallDepth == *((_QWORD *)v9 + 70)
                                                        && p_private->supportAddingMeshBinaryFunctions == v9[592]
                                                        && p_private->supportAddingObjectBinaryFunctions == v9[593]
                                                        && p_private->maxMeshStackCallDepth == *((_QWORD *)v9 + 72)
                                                        && p_private->maxObjectStackCallDepth == *((_QWORD *)v9 + 73))
                                                      {
                                                        profileControl = p_private->profileControl;
                                                        if (profileControl != *((MTLProfileControl **)v9 + 75))
                                                        {
                                                          v6 = -[MTLProfileControl isEqual:](profileControl, "isEqual:");
                                                          if (!v6)
                                                            return v6;
                                                        }
                                                        if (p_private->explicitVisibilityGroupID == *((_DWORD *)v9 + 152)
                                                          && p_private->maxAccelerationStructureTraversalDepth == *((_QWORD *)v9 + 77)
                                                          && p_private->shaderValidation == *((_QWORD *)v9 + 20))
                                                        {
                                                          LOBYTE(v6) = p_private->shaderValidationState == *((_QWORD *)v9 + 21);
                                                          return v6;
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                              goto LABEL_3;
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                  return v6;
                }
              }
            }
          }
        }
      }
    }
LABEL_3:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)setRasterizationEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&self->_private.var2 & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (void)setPipelineLibrary:(id)a3
{
  MTLRenderPipelineDescriptorPrivate *p_private;
  MTLPipelineLibrary *pipelineLibrary;

  p_private = &self->_private;
  pipelineLibrary = self->_private.pipelineLibrary;
  if (pipelineLibrary != a3)
  {

    p_private->pipelineLibrary = (MTLPipelineLibrary *)a3;
  }
}

- (id)colorAttachments
{
  return self->_private.attachments;
}

- (void)setFragmentFunction:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  MTLRenderPipelineDescriptorPrivate *p_private;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a3)
  {
    if (MTLFailureTypeGetEnabled(1uLL) && (objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCE6A58) & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setFragmentFunction:]", 3568, (uint64_t)CFSTR("fragmentFunction is not a MTLFunction."), v11, v12, v13, v14, v15);
    if (objc_msgSend(a3, "functionType") != 2)
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setFragmentFunction:]", 3569, (uint64_t)CFSTR("fragmentFunction functionType is not a MTLFunctionTypeFragment."), v5, v6, v7, v8, v15);
  }
  v9 = a3;
  p_private = &self->_private;

  p_private->fragmentFunction = (MTLFunction *)a3;
}

- (void)setVertexFunction:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  MTLRenderPipelineDescriptorPrivate *p_private;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a3)
  {
    if (MTLFailureTypeGetEnabled(1uLL) && (objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCE6A58) & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setVertexFunction:]", 3551, (uint64_t)CFSTR("vertexFunction is not a MTLFunction."), v11, v12, v13, v14, v15);
    if (objc_msgSend(a3, "functionType") != 1)
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setVertexFunction:]", 3552, (uint64_t)CFSTR("vertexFunction functionType is not a MTLFunctionTypeVertex."), v5, v6, v7, v8, v15);
  }
  v9 = a3;
  p_private = &self->_private;

  p_private->vertexFunction = (MTLFunction *)a3;
}

- (void)setLabel:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  MTLRenderPipelineDescriptorPrivate *p_private;
  NSString *label;
  const __CFString *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    v11 = CFSTR("label is not a NSString.");
    v12 = 1;
    v13 = 3538;
  }
  else
  {
    v11 = CFSTR("label must not be nil.");
    v12 = 0;
    v13 = 3535;
  }
  MTLReportFailure(v12, "-[MTLRenderPipelineDescriptorInternal setLabel:]", v13, (uint64_t)v11, v3, v4, v5, v6, v14);
LABEL_3:
  p_private = &self->_private;
  label = p_private->label;
  if (label != a3)
  {

    p_private->label = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)setDepthAttachmentPixelFormat:(unint64_t)a3
{
  self->_private.depthAttachmentPixelFormat = a3;
}

- (void)setStencilAttachmentPixelFormat:(unint64_t)a3
{
  self->_private.stencilAttachmentPixelFormat = a3;
}

- (id)vertexDescriptor
{
  MTLRenderPipelineDescriptorPrivate *p_private;
  id result;

  p_private = &self->_private;
  result = self->_private.vertexDescriptor;
  if (!result)
  {
    result = objc_alloc_init(MTLVertexDescriptorInternal);
    p_private->vertexDescriptor = (MTLVertexDescriptorInternal *)result;
  }
  return result;
}

- (void)setInputPrimitiveTopology:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v7 = a3;
  if (a3 >= 4)
    MTLReportFailure(0, "-[MTLRenderPipelineDescriptorInternal setInputPrimitiveTopology:]", 3026, (uint64_t)CFSTR("inputPrimitiveTopology value (%u) is invalid"), v3, v4, v5, v6, a3);
  self->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&self->_private.var2 & 0xFFFFFFFFFFFFFFE7 | (8 * (v7 & 3)));
}

- (void)setAlphaToCoverageEnabled:(BOOL)a3
{
  self->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&self->_private.var2 & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (void)setBinaryArchives:(id)a3
{
  MTLRenderPipelineDescriptorPrivate *p_private;
  NSArray *binaryArchives;

  p_private = &self->_private;
  binaryArchives = self->_private.binaryArchives;
  if (binaryArchives != a3)
  {

    p_private->binaryArchives = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  MTLRenderPipelineDescriptorPrivate *p_private;
  const __CFString *label;
  double v10;
  uint64_t v11;
  unint64_t tessellationPartitionMode;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  unint64_t tessellationControlPointIndexType;
  unint64_t tessellationFactorFormat;
  unint64_t tessellationFactorStepFunction;
  const __CFString *v20;
  const __CFString *v21;
  unint64_t tessellationOutputWindingOrder;
  MTLFunction *vertexFunction;
  uint64_t v24;
  MTLFunction *fragmentFunction;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t i;
  _QWORD *v30;
  MTLPipelineLibrary *pipelineLibrary;
  uint64_t j;
  MTLPipelineBufferDescriptorInternal *v33;
  uint64_t v34;
  uint64_t k;
  MTLPipelineBufferDescriptorInternal *v36;
  uint64_t v37;
  MTLLinkedFunctions *vertexLinkedFunctions;
  uint64_t v39;
  MTLLinkedFunctions *fragmentLinkedFunctions;
  uint64_t v41;
  const __CFString *v42;
  const __CFString *v43;
  MTLRenderPipelineDescriptorInternal *v45;
  objc_super v46;
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[97];

  v58[95] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = a3 + 8;
  objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 8, CFSTR(" "), 0);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 128);
  v58[0] = v5;
  v58[1] = CFSTR("label =");
  v45 = self;
  p_private = &self->_private;
  label = CFSTR("<none>");
  if (self->_private.label)
    label = (const __CFString *)self->_private.label;
  v58[2] = label;
  v58[3] = v5;
  v58[4] = CFSTR("Alpha to Coverage =");
  v58[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_private.var2.miscHash[0] & 1);
  v58[6] = v5;
  v58[7] = CFSTR("Alpha to One =");
  v58[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (self->_private.var2.miscHash[0] >> 1) & 1);
  v58[9] = v5;
  v58[10] = CFSTR("Rasterization Enabled =");
  v58[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (self->_private.var2.miscHash[0] >> 2) & 1);
  v58[12] = v5;
  v58[13] = CFSTR("Sample Coverage =");
  LODWORD(v10) = self->_private.var1.sampleCoverageHash;
  v58[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v58[15] = v5;
  v58[16] = CFSTR("Sample Mask =");
  v58[17] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%lx"), self->_private.sampleMask);
  v58[18] = v5;
  v58[19] = CFSTR("Raster Sample Count =");
  v58[20] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_private.var0.sampleCount);
  v58[21] = v5;
  v11 = *(uint64_t *)((char *)off_1E0FE5218 + (*(_QWORD *)&self->_private.var2 & 0x18));
  v58[22] = CFSTR("Input Primitive Topology =");
  v58[23] = v11;
  v58[24] = v5;
  v58[25] = CFSTR("Depth Attachment Format =");
  v58[26] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", MTLPixelFormatGetName(self->_private.depthAttachmentPixelFormat));
  v58[27] = v5;
  v58[28] = CFSTR("Stencil Attachment Format =");
  v58[29] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", MTLPixelFormatGetName(self->_private.stencilAttachmentPixelFormat));
  v58[30] = v5;
  v58[31] = CFSTR("tessellationPartitionMode =");
  tessellationPartitionMode = self->_private.tessellationPartitionMode;
  v13 = CFSTR("Unknown");
  v14 = CFSTR("Unknown");
  if (tessellationPartitionMode <= 3)
    v14 = off_1E0FE5270[tessellationPartitionMode];
  v58[32] = v14;
  v58[33] = v5;
  v58[34] = CFSTR("maxTessellationFactor =");
  v58[35] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", p_private->maxTessellationFactor);
  v58[36] = v5;
  v58[37] = CFSTR("tessellationFactorScaleEnabled =");
  v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_private->tessellationFactorScaleEnabled);
  v16 = CFSTR("MTLTessellationFactorFormatFloat_SPI");
  v58[38] = v15;
  v58[39] = v5;
  tessellationFactorFormat = p_private->tessellationFactorFormat;
  tessellationControlPointIndexType = p_private->tessellationControlPointIndexType;
  if (tessellationFactorFormat != 1)
    v16 = CFSTR("Unknown");
  if (!tessellationFactorFormat)
    v16 = CFSTR("MTLTessellationFactorFormatHalf");
  v58[40] = CFSTR("tessellationFactorFormat =");
  v58[41] = v16;
  v58[42] = v5;
  v58[43] = CFSTR("tessellationControlPointIndexType =");
  if (tessellationControlPointIndexType <= 2)
    v13 = off_1E0FE5238[tessellationControlPointIndexType];
  v58[44] = v13;
  v58[45] = v5;
  v58[46] = CFSTR("tessellationFactorStepFunction =");
  tessellationFactorStepFunction = p_private->tessellationFactorStepFunction;
  v20 = CFSTR("Unknown");
  v21 = CFSTR("Unknown");
  if (tessellationFactorStepFunction <= 3)
    v21 = off_1E0FE5250[tessellationFactorStepFunction];
  tessellationOutputWindingOrder = p_private->tessellationOutputWindingOrder;
  if (tessellationOutputWindingOrder == 1)
    v20 = CFSTR("MTLWindingCounterClockwise");
  v58[47] = v21;
  v58[48] = v5;
  if (!tessellationOutputWindingOrder)
    v20 = CFSTR("MTLWindingClockwise");
  v58[49] = CFSTR("tessellationOutputWindingOrder =");
  v58[50] = v20;
  v58[51] = v5;
  v58[52] = CFSTR("Vertex Function =");
  vertexFunction = p_private->vertexFunction;
  if (vertexFunction)
    v24 = -[MTLFunction formattedDescription:](vertexFunction, "formattedDescription:", v6);
  else
    v24 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v58[53] = v24;
  v58[54] = v5;
  v58[55] = CFSTR("Fragment Function =");
  fragmentFunction = p_private->fragmentFunction;
  if (fragmentFunction)
    v26 = -[MTLFunction formattedDescription:](fragmentFunction, "formattedDescription:", v6);
  else
    v26 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v58[56] = v26;
  v58[57] = v5;
  v58[58] = CFSTR("Vertex Array:");
  v27 = MTLVertexDescriptorDescription((uint64_t)p_private->vertexDescriptor, v6);
  if (!v27)
    v27 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v58[59] = v27;
  v58[60] = v5;
  v28 = CFSTR("MTLVertexAmplificationModeCount");
  if ((*(_QWORD *)&p_private->var2 & 0x400) != 0)
    v28 = CFSTR("MTLVertexAmplificationModeMask");
  v58[61] = CFSTR("Vertex Amplification Mode =");
  v58[62] = v28;
  v58[63] = v5;
  v58[64] = CFSTR("Max Vertex Amplification Count =");
  v58[65] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", p_private->maxVertexAmplificationCount);
  v58[66] = v5;
  v58[67] = CFSTR("supportIndirectCommandBuffers =");
  v58[68] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_private->supportIndirectCommandBuffers);
  v58[69] = v5;
  v58[70] = CFSTR("shaderValidation =");
  v58[71] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", p_private->shaderValidation);
  v58[72] = v5;
  v58[73] = CFSTR("shaderValidationState =");
  v58[74] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", p_private->shaderValidationState);
  v58[75] = v5;
  v58[76] = CFSTR("textureWriteRoundingMode =");
  v58[77] = MTLRoundingModeString(p_private->textureWriteRoundingMode);
  v58[78] = v5;
  v58[79] = CFSTR("forceResourceIndex =");
  v58[80] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", p_private->var2.miscHash[1] & 1);
  v58[81] = v5;
  v58[82] = CFSTR("resourceIndex =");
  v58[83] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", p_private->resourceIndex);
  v58[84] = v5;
  v58[85] = CFSTR("Vertex   Depth Compare Clamp Mask =");
  v58[86] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), p_private->vertexDepthCompareClampMask);
  v58[87] = v5;
  v58[88] = CFSTR("Fragment Depth Compare Clamp Mask =");
  v58[89] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), p_private->fragmentDepthCompareClampMask);
  v58[90] = v5;
  v58[91] = CFSTR("Needs custom border color samplers = ");
  v58[92] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_private->needsCustomBorderColorSamplers);
  v58[93] = v5;
  v58[94] = CFSTR("Color Attachments:");
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 95));
  for (i = 0; i != 8; ++i)
  {
    if (p_private->attachments->_descriptors[i])
    {
      v57[0] = v5;
      v57[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Color Attachment %u:"), i);
      v57[2] = pipelineColorAttachmentFormattedDescription(v6, p_private->attachments->_descriptors[i]);
      v30 = v57;
    }
    else
    {
      v56[0] = v5;
      v56[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Color Attachment %u:"), i);
      v56[2] = pipelineColorAttachmentDefaultFormattedDescription(v6);
      v30 = v56;
    }
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3));
  }
  pipelineLibrary = p_private->pipelineLibrary;
  if (pipelineLibrary)
  {
    v55[0] = v5;
    v55[1] = CFSTR("Pipeline Library:");
    v55[2] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), pipelineLibrary);
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 3));
  }
  for (j = 0; j != 31; ++j)
  {
    objc_msgSend(v7, "addObject:", v5);
    objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Vertex Buffer %u:"), j));
    v33 = p_private->vertexBuffers->_descriptors[j];
    if (v33)
      v34 = pipelineBufferFormattedDescription(v6, v33);
    else
      v34 = pipelineBufferDefaultFormattedDescription(v6);
    objc_msgSend(v7, "addObject:", v34);
  }
  for (k = 0; k != 31; ++k)
  {
    objc_msgSend(v7, "addObject:", v5);
    objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fragment Buffer %u:"), k));
    v36 = p_private->fragmentBuffers->_descriptors[k];
    if (v36)
      v37 = pipelineBufferFormattedDescription(v6, v36);
    else
      v37 = pipelineBufferDefaultFormattedDescription(v6);
    objc_msgSend(v7, "addObject:", v37);
  }
  v54[0] = v5;
  v54[1] = CFSTR("vertexLinkedFunctions =");
  vertexLinkedFunctions = p_private->vertexLinkedFunctions;
  if (vertexLinkedFunctions)
    v39 = -[MTLLinkedFunctions formattedDescription:](vertexLinkedFunctions, "formattedDescription:", v6);
  else
    v39 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v54[2] = v39;
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3));
  v53[0] = v5;
  v53[1] = CFSTR("fragmentLinkedFunctions =");
  fragmentLinkedFunctions = p_private->fragmentLinkedFunctions;
  if (fragmentLinkedFunctions)
    v41 = -[MTLLinkedFunctions formattedDescription:](fragmentLinkedFunctions, "formattedDescription:", v6);
  else
    v41 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v53[2] = v41;
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3));
  v52[0] = v5;
  v52[1] = CFSTR("supportAddingVertexBinaryFunctions =");
  if (p_private->supportAddingVertexBinaryFunctions)
    v42 = CFSTR("YES");
  else
    v42 = CFSTR("NO");
  v52[2] = v42;
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 3));
  v51[0] = v5;
  v51[1] = CFSTR("maxVertexCallStackDepth =");
  v51[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", p_private->maxVertexStackCallDepth);
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 3));
  v50[0] = v5;
  v50[1] = CFSTR("supportAddingFragmentBinaryFunctions =");
  if (p_private->supportAddingFragmentBinaryFunctions)
    v43 = CFSTR("YES");
  else
    v43 = CFSTR("NO");
  v50[2] = v43;
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 3));
  v49[0] = v5;
  v49[1] = CFSTR("maxFragmentCallStackDepth =");
  v49[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", p_private->maxFragmentStackCallDepth);
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3));
  v48[0] = v5;
  v48[1] = CFSTR("explicitVisibilityGroupID =");
  v48[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", p_private->explicitVisibilityGroupID);
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3));
  v47[0] = v5;
  v47[1] = CFSTR("maxAccelerationStructureTraversalDepth =");
  v47[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", p_private->maxAccelerationStructureTraversalDepth);
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3));
  v46.receiver = v45;
  v46.super_class = (Class)MTLRenderPipelineDescriptorInternal;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), -[MTLRenderPipelineDescriptorInternal description](&v46, sel_description), objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLRenderPipelineDescriptorInternal formattedDescription:](self, "formattedDescription:", 0);
}

- (BOOL)forceSoftwareVertexFetch
{
  return (*((unsigned __int8 *)&self->_private.var2.var0 + 4) >> 1) & 1;
}

- (void)setForceSoftwareVertexFetch:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&self->_private.var2 & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (void)setTessellationPartitionMode:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;

  if (a3 >= 4)
    MTLReportFailure(0, "validateMTLTessellationPartitionMode", 2451, (uint64_t)CFSTR("tessellationPartitionMode is not a valid MTLTessellationPartitionMode."), v3, v4, v5, v6, v9);
  self->_private.tessellationPartitionMode = a3;
}

- (void)setMaxTessellationFactor:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;

  if (a3 - 65 <= 0xFFFFFFFFFFFFFFBFLL)
    MTLReportFailure(0, "validateMaxTessellationFactor", 2506, (uint64_t)CFSTR("maxTessellationFactor must be >= 1 and <= 64"), v3, v4, v5, v6, v9);
  self->_private.maxTessellationFactor = a3;
}

- (void)setTessellationFactorScaleEnabled:(BOOL)a3
{
  self->_private.tessellationFactorScaleEnabled = a3;
}

- (void)setTessellationFactorFormat:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;

  if (a3 >= 2)
    MTLReportFailure(0, "validateMTLTessellationFactorFormat", 2521, (uint64_t)CFSTR("tessellationFactorFormat is not a valid MTLTessellationFactorFormat."), v3, v4, v5, v6, v9);
  self->_private.tessellationFactorFormat = a3;
}

- (void)setTessellationControlPointIndexType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;

  if (a3 >= 3)
    MTLReportFailure(0, "validateMTLTessellationControlPointIndexType", 2553, (uint64_t)CFSTR("tessellationControlPointIndexType is not a valid MTLTessellationControlPointIndexType."), v3, v4, v5, v6, v9);
  self->_private.tessellationControlPointIndexType = a3;
}

- (void)setTessellationFactorStepFunction:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;

  if (a3 >= 4)
    MTLReportFailure(0, "validateMTLTessellationFactorStepFunction", 2584, (uint64_t)CFSTR("tessellationFactorStepFunction is not a valid MTLTessellationFactorStepFunction."), v3, v4, v5, v6, v9);
  self->_private.tessellationFactorStepFunction = a3;
}

- (void)setTessellationOutputWindingOrder:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;

  if (a3 >= 2)
    MTLReportFailure(0, "validateMTLWinding", 2614, (uint64_t)CFSTR("tessellationOutputWindingOrder is not a valid MTLWinding."), v3, v4, v5, v6, v9);
  self->_private.tessellationOutputWindingOrder = a3;
}

- (void)setSupportIndirectCommandBuffers:(BOOL)a3
{
  self->_private.supportIndirectCommandBuffers = a3;
}

- (void)setShaderValidation:(int64_t)a3
{
  self->_private.shaderValidation = a3;
}

- (int64_t)shaderValidation
{
  return self->_private.shaderValidation;
}

- (void)setShaderValidationState:(int64_t)a3
{
  self->_private.shaderValidationState = a3;
}

- (int64_t)shaderValidationState
{
  return self->_private.shaderValidationState;
}

- (void)setTextureWriteRoundingMode:(int64_t)a3
{
  self->_private.textureWriteRoundingMode = a3;
}

- (uint64_t)setTextureWriteFPRoundingMode:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 224) = a2;
  return result;
}

- (uint64_t)textureWriteFPRoundingMode
{
  if (result)
    return *(_QWORD *)(result + 224);
  return result;
}

- (BOOL)forceResourceIndex
{
  return *((_BYTE *)&self->_private.var2.var0 + 4) & 1;
}

- (void)setForceResourceIndex:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&self->_private.var2 & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (unint64_t)resourceIndex
{
  return self->_private.resourceIndex;
}

- (void)setResourceIndex:(unint64_t)a3
{
  self->_private.resourceIndex = a3;
}

- (unint64_t)postVertexDumpBufferIndex
{
  return self->_private.postVertexDumpBufferIndex;
}

- (void)setPostVertexDumpBufferIndex:(unint64_t)a3
{
  self->_private.postVertexDumpBufferIndex = a3;
}

- (void)setSampleMask:(unint64_t)a3
{
  self->_private.sampleMask = a3;
}

- (void)setSampleCoverage:(float)a3
{
  self->_private.var1.sampleCoverage = a3;
}

- (void)setAlphaToOneEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&self->_private.var2 & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (void)setVertexAmplificationMode:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v7 = a3;
  if (a3 >= 2)
    MTLReportFailure(0, "-[MTLRenderPipelineDescriptorInternal setVertexAmplificationMode:]", 2923, (uint64_t)CFSTR("vertexAmplificationMode value %lu is invalid"), v3, v4, v5, v6, a3);
  self->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&self->_private.var2 & 0xFFFFFFFFFFFFFBFFLL | ((unint64_t)(v7 & 1) << 10));
}

- (void)setColorSampleCount:(unint64_t)a3
{
  self->_private.colorSampleCount = a3;
}

- (void)setLogicOperationEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&self->_private.var2 & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (void)setLogicOperation:(unint64_t)a3
{
  self->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&self->_private.var2 & 0xFFFFFFFF87FFFFFFLL | ((a3 & 0xF) << 27));
}

- (void)setAlphaTestEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&self->_private.var2 & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (void)setAlphaTestFunction:(unint64_t)a3
{
  self->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&self->_private.var2 & 0xFFFFFFFFFC7FFFFFLL | ((a3 & 7) << 23));
}

- (void)setClipDistanceEnableMask:(unsigned __int8)a3
{
  self->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&self->_private.var2 & 0xFFFFFFFFFF807FFFLL | ((unint64_t)a3 << 15));
}

- (void)setPointSmoothEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&self->_private.var2 & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)isPointCoordLowerLeft
{
  return (BYTE1(self->_private.var2.miscHash[0]) >> 5) & 1;
}

- (void)setPointCoordLowerLeft:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&self->_private.var2 & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)isPointSizeOutputVS
{
  return (BYTE1(self->_private.var2.miscHash[0]) >> 4) & 1;
}

- (void)setPointSizeOutputVS:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&self->_private.var2 & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)isTwoSideEnabled
{
  return (BYTE1(self->_private.var2.miscHash[0]) >> 3) & 1;
}

- (void)setTwoSideEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&self->_private.var2 & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (void)setVertexDepthCompareClampMask:(unsigned int)a3
{
  self->_private.vertexDepthCompareClampMask = a3;
}

- (void)setFragmentDepthCompareClampMask:(unsigned int)a3
{
  self->_private.fragmentDepthCompareClampMask = a3;
}

- (id)pluginData
{
  return self->_private.pluginData;
}

- (void)setPluginData:(id)a3
{
  MTLRenderPipelineDescriptorPrivate *p_private;
  NSDictionary *pluginData;

  p_private = &self->_private;
  pluginData = self->_private.pluginData;
  if (pluginData != a3)
  {

    p_private->pluginData = (NSDictionary *)a3;
  }
}

- (void)setOpenGLModeEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&self->_private.var2 & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (uint64_t)internalPipeline
{
  if (result)
    return (*(unsigned __int8 *)(result + 276) >> 4) & 1;
  return result;
}

- (uint64_t)setInternalPipeline:(uint64_t)result
{
  uint64_t v2;

  if (result)
  {
    v2 = 0x1000000000;
    if (!a2)
      v2 = 0;
    *(_QWORD *)(result + 272) = *(_QWORD *)(result + 272) & 0xFFFFFFEFFFFFFFFFLL | v2;
  }
  return result;
}

- (void)setNeedsCustomBorderColorSamplers:(BOOL)a3
{
  self->_private.needsCustomBorderColorSamplers = a3;
}

- (void)setSampleCoverageInvert:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&self->_private.var2 & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (void)setDepthStencilWriteDisabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&self->_private.var2 & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (void)setVertexLinkedFunctions:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  MTLRenderPipelineDescriptorPrivate *p_private;
  uint64_t v10;
  MTLLinkedFunctions *vertexLinkedFunctions;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setVertexLinkedFunctions:]", 3067, (uint64_t)CFSTR("linkedFunctions is not a MTLLinkedFunctions."), v5, v6, v7, v8, v10);
  }
  p_private = &self->_private;
  if (p_private->vertexLinkedFunctions != a3)
  {
    vertexLinkedFunctions = p_private->vertexLinkedFunctions;
    p_private->vertexLinkedFunctions = (MTLLinkedFunctions *)objc_msgSend(a3, "copy");

  }
}

- (void)setFragmentLinkedFunctions:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  MTLRenderPipelineDescriptorPrivate *p_private;
  uint64_t v10;
  MTLLinkedFunctions *fragmentLinkedFunctions;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setFragmentLinkedFunctions:]", 3095, (uint64_t)CFSTR("linkedFunctions is not a MTLLinkedFunctions."), v5, v6, v7, v8, v10);
  }
  p_private = &self->_private;
  if (p_private->fragmentLinkedFunctions != a3)
  {
    fragmentLinkedFunctions = p_private->fragmentLinkedFunctions;
    p_private->fragmentLinkedFunctions = (MTLLinkedFunctions *)objc_msgSend(a3, "copy");

  }
}

- (void)setObjectLinkedFunctions:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  MTLRenderPipelineDescriptorPrivate *p_private;
  uint64_t v10;
  MTLLinkedFunctions *objectLinkedFunctions;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setObjectLinkedFunctions:]", 3124, (uint64_t)CFSTR("linkedFunctions is not a MTLLinkedFunctions."), v5, v6, v7, v8, v10);
  }
  p_private = &self->_private;
  if (p_private->objectLinkedFunctions != a3)
  {
    objectLinkedFunctions = p_private->objectLinkedFunctions;
    p_private->objectLinkedFunctions = (MTLLinkedFunctions *)objc_msgSend(a3, "copy");

  }
}

- (void)setMeshLinkedFunctions:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  MTLRenderPipelineDescriptorPrivate *p_private;
  uint64_t v10;
  MTLLinkedFunctions *meshLinkedFunctions;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setMeshLinkedFunctions:]", 3152, (uint64_t)CFSTR("linkedFunctions is not a MTLLinkedFunctions."), v5, v6, v7, v8, v10);
  }
  p_private = &self->_private;
  if (p_private->meshLinkedFunctions != a3)
  {
    meshLinkedFunctions = p_private->meshLinkedFunctions;
    p_private->meshLinkedFunctions = (MTLLinkedFunctions *)objc_msgSend(a3, "copy");

  }
}

- (void)setVertexPreloadedLibraries:(id)a3
{
  MTLRenderPipelineDescriptorPrivate *p_private;
  NSArray *vertexPreloadedLibraries;

  p_private = &self->_private;
  vertexPreloadedLibraries = self->_private.vertexPreloadedLibraries;
  if (vertexPreloadedLibraries != a3)
  {

    p_private->vertexPreloadedLibraries = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (void)setFragmentPreloadedLibraries:(id)a3
{
  MTLRenderPipelineDescriptorPrivate *p_private;
  NSArray *fragmentPreloadedLibraries;

  p_private = &self->_private;
  fragmentPreloadedLibraries = self->_private.fragmentPreloadedLibraries;
  if (fragmentPreloadedLibraries != a3)
  {

    p_private->fragmentPreloadedLibraries = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (void)setObjectPreloadedLibraries:(id)a3
{
  MTLRenderPipelineDescriptorPrivate *p_private;
  NSArray *objectPreloadedLibraries;

  p_private = &self->_private;
  objectPreloadedLibraries = self->_private.objectPreloadedLibraries;
  if (objectPreloadedLibraries != a3)
  {

    p_private->objectPreloadedLibraries = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (void)setMeshPreloadedLibraries:(id)a3
{
  MTLRenderPipelineDescriptorPrivate *p_private;
  NSArray *meshPreloadedLibraries;

  p_private = &self->_private;
  meshPreloadedLibraries = self->_private.meshPreloadedLibraries;
  if (meshPreloadedLibraries != a3)
  {

    p_private->meshPreloadedLibraries = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (id)insertVertexLibraries
{
  return self->_private.vertexPreloadedLibraries;
}

- (void)setInsertVertexLibraries:(id)a3
{
  if (!a3)
    a3 = (id)MEMORY[0x1E0C9AA60];
  -[MTLRenderPipelineDescriptorInternal setVertexPreloadedLibraries:](self, "setVertexPreloadedLibraries:", a3);
}

- (id)insertFragmentLibraries
{
  return self->_private.fragmentPreloadedLibraries;
}

- (void)setInsertFragmentLibraries:(id)a3
{
  if (!a3)
    a3 = (id)MEMORY[0x1E0C9AA60];
  -[MTLRenderPipelineDescriptorInternal setFragmentPreloadedLibraries:](self, "setFragmentPreloadedLibraries:", a3);
}

- (id)insertObjectLibraries
{
  return self->_private.objectPreloadedLibraries;
}

- (void)setInsertObjectLibraries:(id)a3
{
  if (!a3)
    a3 = (id)MEMORY[0x1E0C9AA60];
  -[MTLRenderPipelineDescriptorInternal setObjectPreloadedLibraries:](self, "setObjectPreloadedLibraries:", a3);
}

- (id)insertMeshLibraries
{
  return self->_private.meshPreloadedLibraries;
}

- (void)setInsertMeshLibraries:(id)a3
{
  if (!a3)
    a3 = (id)MEMORY[0x1E0C9AA60];
  -[MTLRenderPipelineDescriptorInternal setMeshPreloadedLibraries:](self, "setMeshPreloadedLibraries:", a3);
}

- (void)setSupportAddingVertexBinaryFunctions:(BOOL)a3
{
  self->_private.supportAddingVertexBinaryFunctions = a3;
}

- (void)setSupportAddingFragmentBinaryFunctions:(BOOL)a3
{
  self->_private.supportAddingFragmentBinaryFunctions = a3;
}

- (void)setMaxVertexCallStackDepth:(unint64_t)a3
{
  self->_private.maxVertexStackCallDepth = a3;
}

- (void)setMaxFragmentCallStackDepth:(unint64_t)a3
{
  self->_private.maxFragmentStackCallDepth = a3;
}

- (void)setSupportAddingMeshBinaryFunctions:(BOOL)a3
{
  self->_private.supportAddingMeshBinaryFunctions = a3;
}

- (void)setSupportAddingObjectBinaryFunctions:(BOOL)a3
{
  self->_private.supportAddingObjectBinaryFunctions = a3;
}

- (void)setMaxMeshCallStackDepth:(unint64_t)a3
{
  self->_private.maxMeshStackCallDepth = a3;
}

- (void)setMaxObjectCallStackDepth:(unint64_t)a3
{
  self->_private.maxObjectStackCallDepth = a3;
}

- (void)setExplicitVisibilityGroupID:(unsigned int)a3
{
  self->_private.explicitVisibilityGroupID = a3;
}

- (void)setProfileControl:(id)a3
{
  MTLRenderPipelineDescriptorPrivate *p_private;
  MTLProfileControl *profileControl;

  p_private = &self->_private;
  profileControl = self->_private.profileControl;
  if (profileControl != a3)
  {

    p_private->profileControl = (MTLProfileControl *)objc_msgSend(a3, "copy");
  }
}

- (void)setMaxAccelerationStructureTraversalDepth:(unint64_t)a3
{
  self->_private.maxAccelerationStructureTraversalDepth = a3;
}

- (void)reset
{
  uint64_t v2;
  MTLRenderPipelineDescriptorPrivate *p_private;
  unint64_t *rtBlendDescHash;
  $65165931DE83DC9F336BFC9DC178100F var2;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t j;

  v2 = 0;
  p_private = &self->_private;
  self->_private.var2 = 0;
  rtBlendDescHash = self->_private.rtBlendDescHash;
  do
  {

    p_private->attachments->_descriptors[v2] = 0;
    rtBlendDescHash[v2++] = 0;
  }
  while (v2 != 8);
  p_private->depthAttachmentPixelFormat = 0;
  p_private->stencilAttachmentPixelFormat = 0;
  p_private->tessellationPartitionMode = 0;
  p_private->maxTessellationFactor = 16;
  p_private->tessellationFactorScaleEnabled = 0;
  p_private->supportIndirectCommandBuffers = 0;
  *(_OWORD *)&p_private->tessellationFactorFormat = 0u;
  *(_OWORD *)&p_private->tessellationFactorStepFunction = 0u;
  var2 = p_private->var2;
  *(_QWORD *)&p_private->vertexDepthCompareClampMask = 0;
  p_private->resourceIndex = 0;
  p_private->postVertexDumpBufferIndex = 0;
  *(_OWORD *)&p_private->textureWriteRoundingMode = xmmword_182809F60;
  p_private->sampleMask = -1;
  p_private->var1.sampleCoverageHash = 1065353216;
  p_private->maxVertexAmplificationCount = 1;
  p_private->colorSampleCount = 0;
  p_private->var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&var2 & 0xFFFFFFFE84007FFBLL | 0x13FF8004);
  p_private->needsCustomBorderColorSamplers = 0;

  v6 = 0;
  p_private->label = 0;
  do
  {

    p_private->vertexBuffers->_descriptors[v6++] = 0;
  }
  while (v6 != 31);
  for (i = 0; i != 31; ++i)
  {

    p_private->fragmentBuffers->_descriptors[i] = 0;
  }

  p_private->vertexFunction = 0;
  p_private->fragmentFunction = 0;

  p_private->vertexDescriptor = 0;
  p_private->objectFunction = 0;

  v8 = 0;
  p_private->meshFunction = 0;
  p_private->objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.width = 0;
  p_private->objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.height = 0;
  p_private->objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.depth = 0;
  p_private->meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.width = 0;
  p_private->meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.height = 0;
  p_private->maxTotalThreadsPerObjectThreadgroup = 0;
  p_private->maxTotalThreadsPerMeshThreadgroup = 0;
  p_private->meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.depth = 0;
  p_private->maxPipelineChildren.width = 0;
  p_private->maxPipelineChildren.depth = 0;
  p_private->pipelineMemoryLength = 0;
  p_private->maxPipelineChildren.height = 0;
  do
  {

    p_private->objectBuffers->_descriptors[v8++] = 0;
  }
  while (v8 != 31);
  for (j = 0; j != 31; ++j)
  {

    p_private->meshBuffers->_descriptors[j] = 0;
  }

  p_private->pluginData = 0;
  p_private->binaryArchives = 0;

  p_private->vertexLinkedFunctions = 0;
  p_private->fragmentLinkedFunctions = 0;

  p_private->objectLinkedFunctions = 0;
  p_private->meshLinkedFunctions = 0;

  p_private->vertexPreloadedLibraries = 0;
  p_private->fragmentPreloadedLibraries = 0;

  p_private->objectPreloadedLibraries = 0;
  p_private->meshPreloadedLibraries = 0;
  *(_WORD *)&p_private->supportAddingVertexBinaryFunctions = 0;
  p_private->maxVertexStackCallDepth = 1;
  p_private->maxFragmentStackCallDepth = 1;
  *(_WORD *)&p_private->supportAddingMeshBinaryFunctions = 0;
  *(int64x2_t *)&p_private->maxMeshStackCallDepth = vdupq_n_s64(1uLL);

  p_private->profileControl = 0;
  p_private->explicitVisibilityGroupID = -1;
  p_private->maxAccelerationStructureTraversalDepth = 0;
  p_private->shaderValidation = 0;
  p_private->shaderValidationState = 0;
}

- (uint64_t)fastBlendDescriptorAtIndex:(uint64_t)a3
{
  uint64_t v9;

  if (result)
  {
    v9 = result;
    if (a2 >= 8)
      MTLReportFailure(0, "-[MTLRenderPipelineDescriptorInternal fastBlendDescriptorAtIndex:]", 3524, (uint64_t)CFSTR("index must be < %lu."), a5, a6, a7, a8, 8);
    return *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 + 8 * a2);
  }
  return result;
}

- (void)setObjectFunction:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  MTLRenderPipelineDescriptorPrivate *p_private;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a3)
  {
    if (MTLFailureTypeGetEnabled(1uLL) && (objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCE6A58) & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setObjectFunction:]", 3586, (uint64_t)CFSTR("objectFunction is not a MTLFunction."), v11, v12, v13, v14, v15);
    if (objc_msgSend(a3, "functionType") != 8)
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setObjectFunction:]", 3587, (uint64_t)CFSTR("objectFunction functionType is not MTLFunctionTypeObject."), v5, v6, v7, v8, v15);
  }
  v9 = a3;
  p_private = &self->_private;

  p_private->objectFunction = (MTLFunction *)a3;
}

- (void)setMeshFunction:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  MTLRenderPipelineDescriptorPrivate *p_private;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a3)
  {
    if (MTLFailureTypeGetEnabled(1uLL) && (objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCE6A58) & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setMeshFunction:]", 3603, (uint64_t)CFSTR("meshFunction is not a MTLFunction."), v11, v12, v13, v14, v15);
    if (objc_msgSend(a3, "functionType") != 7)
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setMeshFunction:]", 3604, (uint64_t)CFSTR("meshFunction functionType is not MTLFunctionTypeMesh."), v5, v6, v7, v8, v15);
  }
  v9 = a3;
  p_private = &self->_private;

  p_private->meshFunction = (MTLFunction *)a3;
}

- (id)objectBuffers
{
  return self->_private.objectBuffers;
}

- (id)meshBuffers
{
  return self->_private.meshBuffers;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)objectThreadsPerThreadgroup
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)((char *)self + 344);
  return self;
}

- (void)setObjectThreadsPerThreadgroup:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_private.objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.depth = a3->var2;
  *(_OWORD *)&self->_private.objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.width = v3;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)meshThreadsPerThreadgroup
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)((char *)self + 368);
  return self;
}

- (void)setMeshThreadsPerThreadgroup:(id *)a3
{
  unint64_t var2;

  var2 = a3->var2;
  *(_OWORD *)&self->_private.meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.width = *(_OWORD *)&a3->var0;
  self->_private.meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.depth = var2;
}

- (unint64_t)maxTotalThreadsPerObjectThreadgroup
{
  return self->_private.maxTotalThreadsPerObjectThreadgroup;
}

- (void)setMaxTotalThreadsPerObjectThreadgroup:(unint64_t)a3
{
  self->_private.maxTotalThreadsPerObjectThreadgroup = a3;
}

- (unint64_t)maxTotalThreadsPerMeshThreadgroup
{
  return self->_private.maxTotalThreadsPerMeshThreadgroup;
}

- (void)setMaxTotalThreadsPerMeshThreadgroup:(unint64_t)a3
{
  self->_private.maxTotalThreadsPerMeshThreadgroup = a3;
}

- (BOOL)objectThreadgroupSizeIsMultipleOfThreadExecutionWidth
{
  return (*((unsigned __int8 *)&self->_private.var2.var0 + 4) >> 2) & 1;
}

- (void)setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&self->_private.var2 & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)meshThreadgroupSizeIsMultipleOfThreadExecutionWidth
{
  return (*((unsigned __int8 *)&self->_private.var2.var0 + 4) >> 3) & 1;
}

- (void)setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_private.var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(_QWORD *)&self->_private.var2 & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (unint64_t)pipelineMemoryLength
{
  return self->_private.pipelineMemoryLength;
}

- (void)setPipelineMemoryLength:(unint64_t)a3
{
  self->_private.pipelineMemoryLength = a3;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)maxPipelineChildren
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)((char *)self + 392);
  return self;
}

- (void)setMaxPipelineChildren:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_private.maxPipelineChildren.depth = a3->var2;
  *(_OWORD *)&self->_private.maxPipelineChildren.width = v3;
}

- (void)attachVertexDescriptor:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  MTLRenderPipelineDescriptorPrivate *p_private;
  MTLVertexDescriptorInternal *vertexDescriptor;
  uint64_t v11;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal attachVertexDescriptor:]", 3730, (uint64_t)CFSTR("vertexDescriptor is not a MTLVertexDescriptor."), v5, v6, v7, v8, v11);
  }
  p_private = &self->_private;
  vertexDescriptor = p_private->vertexDescriptor;
  if (vertexDescriptor != a3)
  {

    p_private->vertexDescriptor = (MTLVertexDescriptorInternal *)a3;
  }
}

- (void)setDriverCompilerOptions:(id)a3
{
  MTLRenderPipelineDescriptorPrivate *p_private;
  NSDictionary *driverCompilerOptions;

  p_private = &self->_private;
  driverCompilerOptions = self->_private.driverCompilerOptions;
  if (driverCompilerOptions != a3)
  {

    p_private->driverCompilerOptions = (NSDictionary *)objc_msgSend(a3, "copy");
  }
}

- (void)setGpuCompilerSPIOptions:(id)a3
{
  MTLRenderPipelineDescriptorPrivate *p_private;
  NSDictionary *gpuCompilerSPIOptions;

  p_private = &self->_private;
  gpuCompilerSPIOptions = self->_private.gpuCompilerSPIOptions;
  if (gpuCompilerSPIOptions != a3)
  {

    p_private->gpuCompilerSPIOptions = (NSDictionary *)objc_msgSend(a3, "copy");
  }
}

- (void)validateWithDevice:(id)a3
{
  objc_msgSend(a3, "registerRenderPipelineDescriptor:", self);
  validateWithDevice((id *)a3, (uint64_t)&self->_private);
}

- (id)serializeFragmentData
{
  return createSerializedFragmentData<MTLRenderPipelineDescriptorPrivate>(0, 0, (uint64_t)&self->_private);
}

- (id)newSerializedVertexDataWithFlags:(unint64_t)a3 error:(id *)a4
{
  return -[MTLRenderPipelineDescriptorInternal newSerializedVertexDataWithFlags:options:error:](self, "newSerializedVertexDataWithFlags:options:error:", a3, 0, a4);
}

- (id)newSerializedObjectDataWithFlags:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5
{
  id result;

  result = (id)newMeshSerializedObjectOrMeshData(0, a3, a4, &self->_private);
  if (a5)
    *a5 = 0;
  return result;
}

- (id)newSerializedMeshDataWithFlags:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5
{
  id result;

  result = (id)newMeshSerializedObjectOrMeshData(0, a3, a4, &self->_private);
  if (a5)
    *a5 = 0;
  return result;
}

@end
