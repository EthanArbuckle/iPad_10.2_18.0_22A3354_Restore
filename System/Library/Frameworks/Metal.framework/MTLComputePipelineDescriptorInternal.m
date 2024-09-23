@implementation MTLComputePipelineDescriptorInternal

- (id)gpuCompilerSPIOptions
{
  return self->_private.gpuCompilerSPIOptions;
}

- (id)newSerializedComputeData
{
  return -[MTLComputePipelineDescriptorInternal newSerializedComputeDataWithFlags:options:](self, "newSerializedComputeDataWithFlags:options:", 0, 0);
}

- (id)linkedFunctions
{
  MTLComputePipelineDescriptorPrivate *p_private;
  id result;

  p_private = &self->_private;
  result = self->_private.linkedFunctions;
  if (!result)
  {
    result = objc_alloc_init(MTLLinkedFunctionsInternal);
    p_private->linkedFunctions = (MTLLinkedFunctions *)result;
  }
  return result;
}

- (id)computeFunction
{
  return self->_private.computeFunction;
}

- (BOOL)supportAddingBinaryFunctions
{
  return self->_private.supportAddingBinaryFunctions;
}

- (unint64_t)maxCallStackDepth
{
  return self->_private.maxStackCallDepth;
}

- (BOOL)needsCustomBorderColorSamplers
{
  return self->_private.needsCustomBorderColorSamplers;
}

- (BOOL)threadGroupSizeIsMultipleOfThreadExecutionWidth
{
  return self->_private.threadGroupSizeIsMultipleOfThreadExecutionWidth;
}

- (unint64_t)maxTotalThreadsPerThreadgroup
{
  return self->_private.maxTotalThreadsPerThreadgroup;
}

- (BOOL)supportIndirectCommandBuffers
{
  return self->_private.supportIndirectCommandBuffers;
}

- (int64_t)textureWriteRoundingMode
{
  return self->_private.textureWriteRoundingMode;
}

- (id)label
{
  return self->_private.label;
}

- (id)pipelineLibrary
{
  return self->_private.pipelineLibrary;
}

- (id)binaryArchives
{
  return self->_private.binaryArchives;
}

- (id)preloadedLibraries
{
  return self->_private.var0.preloadedLibraries;
}

- (id)driverCompilerOptions
{
  return self->_private.driverCompilerOptions;
}

- (id)buffers
{
  return self->_private.buffers;
}

- (unint64_t)maxAccelerationStructureTraversalDepth
{
  return self->_private.maxAccelerationStructureTraversalDepth;
}

- (MTLComputePipelineDescriptorInternal)init
{
  MTLComputePipelineDescriptorInternal *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLComputePipelineDescriptorInternal;
  v2 = -[MTLComputePipelineDescriptorInternal init](&v4, sel_init);
  if (v2)
  {
    v2->_private.buffers = objc_alloc_init(MTLPipelineBufferDescriptorArrayInternal);
    v2->_private.supportAddingBinaryFunctions = 0;
    v2->_private.functionPointers = 0;
    v2->_private.linkedFunctions = 0;
    v2->_private.maxStackCallDepth = 1;
    v2->_private.var0.preloadedLibraries = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    v2->_private.shaderValidation = 0;
    v2->_private.shaderValidationState = 0;
    v2->_private.profileControl = 0;
    v2->_private.maxAccelerationStructureTraversalDepth = 0;
  }
  return v2;
}

- (void)dealloc
{
  MTLComputePipelineDescriptorPrivate *p_private;
  objc_super v4;

  p_private = &self->_private;

  v4.receiver = self;
  v4.super_class = (Class)MTLComputePipelineDescriptorInternal;
  -[MTLComputePipelineDescriptorInternal dealloc](&v4, sel_dealloc);
}

- (void)setComputeFunction:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v9;
  id v10;
  MTLComputePipelineDescriptorPrivate *p_private;
  const __CFString *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (!a3)
  {
    v12 = CFSTR("computeFunction must not be nil.");
    v13 = 0;
    v14 = 800;
LABEL_9:
    MTLReportFailure(v13, "-[MTLComputePipelineDescriptorInternal setComputeFunction:]", v14, (uint64_t)v12, v3, v4, v5, v6, v19);
    goto LABEL_4;
  }
  v9 = MTLFunctionTypeString(3);
  if (MTLFailureTypeGetEnabled(1uLL) && (objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCE6A58) & 1) == 0)
    MTLReportFailure(1uLL, "-[MTLComputePipelineDescriptorInternal setComputeFunction:]", 804, (uint64_t)CFSTR("computeFunction is not a MTLFunction."), v15, v16, v17, v18, v19);
  if (objc_msgSend(a3, "functionType") != 3)
  {
    v19 = (uint64_t)v9;
    v12 = CFSTR("computeFunction functionType is not a %@.");
    v13 = 1;
    v14 = 805;
    goto LABEL_9;
  }
LABEL_4:
  v10 = a3;
  p_private = &self->_private;

  p_private->computeFunction = (MTLFunction *)a3;
}

- (BOOL)validateWithDevice:(id)a3 error:(id *)a4
{
  MTLComputePipelineDescriptorPrivate *p_private;

  p_private = &self->_private;
  if ((*((_BYTE *)&self->_private + 137) & 4) == 0)
    objc_msgSend(a3, "registerComputePipelineDescriptor:", self, a4);
  validateWithDevice(a3, (uint64_t)p_private);
  return 1;
}

- (id)profileControl
{
  return self->_private.profileControl;
}

- (void)setThreadGroupSizeIsMultipleOfThreadExecutionWidth:(BOOL)a3
{
  self->_private.threadGroupSizeIsMultipleOfThreadExecutionWidth = a3;
}

- (void)setPipelineLibrary:(id)a3
{
  MTLComputePipelineDescriptorPrivate *p_private;
  MTLPipelineLibrary *pipelineLibrary;

  p_private = &self->_private;
  pipelineLibrary = self->_private.pipelineLibrary;
  if (pipelineLibrary != a3)
  {

    p_private->pipelineLibrary = (MTLPipelineLibrary *)a3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t maxStackCallDepth;
  uint64_t v9;
  char v10;
  uint64_t v11;
  unint64_t maxAccelerationStructureTraversalDepth;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (v5)
  {
    *(_QWORD *)(v5 + 16) = -[NSString copyWithZone:](self->_private.label, "copyWithZone:", a3);
    *(_QWORD *)(v6 + 24) = self->_private.computeFunction;
    *(_QWORD *)(v6 + 48) = -[NSDictionary copy](self->_private.driverCompilerOptions, "copy");
    *(_QWORD *)(v6 + 56) = -[NSDictionary copy](self->_private.gpuCompilerSPIOptions, "copy");
    *(_QWORD *)(v6 + 160) = -[NSArray copy](self->_private.functionPointers, "copy");
    v7 = -[MTLLinkedFunctions copy](self->_private.linkedFunctions, "copy");
    maxStackCallDepth = self->_private.maxStackCallDepth;
    *(_QWORD *)(v6 + 168) = v7;
    *(_QWORD *)(v6 + 176) = maxStackCallDepth;
    *(_BYTE *)(v6 + 184) = self->_private.supportAddingBinaryFunctions;
    *(_QWORD *)(v6 + 40) = -[MTLStageInputOutputDescriptor copyWithZone:](self->_private.stageInputDescriptor, "copyWithZone:", a3);
    *(_QWORD *)(v6 + 72) = -[NSArray copy](self->_private.binaryArchives, "copy");
    *(_QWORD *)(v6 + 80) = -[NSArray copy](self->_private.var0.preloadedLibraries, "copy");
    v9 = 0;
    *(_QWORD *)(v6 + 88) = self->_private.pipelineLibrary;
    *(_BYTE *)(v6 + 32) = self->_private.threadGroupSizeIsMultipleOfThreadExecutionWidth;
    *(_WORD *)(v6 + 34) = self->_private.maxTotalThreadsPerThreadgroup;
    do
    {
      *(_QWORD *)(*(_QWORD *)(v6 + 64) + 8 + v9 * 8) = -[MTLPipelineBufferDescriptorInternal copyWithZone:](self->_private.buffers->_descriptors[v9], "copyWithZone:", a3);
      ++v9;
    }
    while (v9 != 31);
    *(_BYTE *)(v6 + 96) = self->_private.supportIndirectCommandBuffers;
    *(_QWORD *)(v6 + 120) = self->_private.textureWriteRoundingMode;
    *(_BYTE *)(v6 + 128) = self->_private.forceResourceIndex;
    *(_QWORD *)(v6 + 136) = self->_private.resourceIndex;
    v10 = *(_BYTE *)(v6 + 153) & 0xFE | *((_BYTE *)&self->_private + 137) & 1;
    *(_BYTE *)(v6 + 153) = v10;
    *(_BYTE *)(v6 + 153) = v10 & 0xFD | *((_BYTE *)&self->_private + 137) & 2;
    *(_QWORD *)(v6 + 144) = self->_private.pluginData;
    *(_BYTE *)(v6 + 152) = self->_private.needsCustomBorderColorSamplers;
    v11 = -[MTLProfileControl copy](self->_private.profileControl, "copy");
    maxAccelerationStructureTraversalDepth = self->_private.maxAccelerationStructureTraversalDepth;
    *(_QWORD *)(v6 + 192) = v11;
    *(_QWORD *)(v6 + 200) = maxAccelerationStructureTraversalDepth;
    *(_OWORD *)(v6 + 104) = *(_OWORD *)&self->_private.shaderValidation;
    *(_BYTE *)(v6 + 153) = *(_BYTE *)(v6 + 153) & 0xFB | *((_BYTE *)&self->_private + 137) & 4;
  }
  return (id)v6;
}

- (id)newSerializedComputeDataWithFlags:(unint64_t)a3 options:(unint64_t)a4
{
  MTLComputePipelineDescriptorPrivate *p_private;
  unsigned int v5;
  NSArray *functionPointers;
  MTLLinkedFunctions *linkedFunctions;
  uint64_t v8;
  MTLStageInputOutputDescriptor *stageInputDescriptor;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  size_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  const void **v21;
  size_t v22;
  const void **v23;
  NSObject *v25;
  uint64_t __src;
  uint64_t v27;
  int v28;
  void *buffer_ptr;
  size_t size_ptr;

  buffer_ptr = 0;
  size_ptr = 0;
  __src = 0;
  v27 = 0;
  p_private = &self->_private;
  v5 = (a4 >> 23) & 2 | (a3 >> 4) & 4 | (8 * (*((_BYTE *)&self->_private + 137) & 1)) & 0xEF | (16 * ((*((unsigned __int8 *)&self->_private + 137) >> 1) & 1));
  v28 = 0;
  v27 = v5;
  functionPointers = self->_private.functionPointers;
  if (functionPointers && -[NSArray count](functionPointers, "count"))
  {
    v5 |= 0x20u;
    LODWORD(v27) = v5;
  }
  linkedFunctions = p_private->linkedFunctions;
  if (linkedFunctions
    && (-[MTLLinkedFunctions functions](linkedFunctions, "functions")
     && -[NSArray count](-[MTLLinkedFunctions functions](p_private->linkedFunctions, "functions"), "count")
     || -[MTLLinkedFunctions privateFunctions](p_private->linkedFunctions, "privateFunctions")
     && -[NSArray count](-[MTLLinkedFunctions privateFunctions](p_private->linkedFunctions, "privateFunctions"), "count")))
  {
    v5 |= 0x20u;
    LODWORD(v27) = v5;
  }
  if ((v5 & 0x20) != 0)
    v8 = 20;
  else
    v8 = 12;
  stageInputDescriptor = p_private->stageInputDescriptor;
  if (stageInputDescriptor
    && (v10 = -[MTLStageInputOutputDescriptor newSerializedDescriptor](stageInputDescriptor, "newSerializedDescriptor")) != 0)
  {
    v11 = v10;
    v5 |= 1u;
    LODWORD(v27) = v5;
    v12 = dispatch_data_create_map(v10, (const void **)&buffer_ptr, &size_ptr);
    v13 = size_ptr + v8;
    dispatch_release(v11);
  }
  else
  {
    v12 = 0;
    v13 = v8;
  }
  v14 = MTLSerializePluginDataDictionary((void *)objc_msgSend((id)-[MTLFunction device](p_private->computeFunction, "device"), "pluginData"), 0);
  v15 = v14;
  if (v14)
  {
    LODWORD(__src) = v13;
    v16 = v13;
    v13 += v14;
  }
  else
  {
    v16 = 0;
  }
  v17 = MTLSerializePluginDataDictionary(p_private->pluginData, 0);
  v18 = v17;
  if (v17)
  {
    HIDWORD(__src) = v13;
    v13 += v17;
  }
  if ((v5 & 0x20) != 0)
  {
    v25 = v12;
    v20 = v16;
    v21 = (const void **)_MTLPopulateLinkedFunctionExtraData(p_private->linkedFunctions);
    v22 = (size_t)v21[2];
    HIDWORD(v27) = v13;
    v28 = v22;
    v19 = (char *)malloc_type_malloc(v22 + v13, 0x7521392BuLL);
    memcpy(&v19[v13], *v21, v22);
    free((void *)*v21);
    v23 = v21;
    v16 = v20;
    v12 = v25;
    MEMORY[0x186DABFBC](v23, 0x1010C40113C0ABBLL);
    v13 += v22;
  }
  else
  {
    v19 = (char *)malloc_type_malloc(v13, 0xBFAD01F5uLL);
  }
  memcpy(v19, &__src, v8);
  if (v12)
  {
    memcpy(&v19[v8], buffer_ptr, size_ptr);
    dispatch_release(v12);
  }
  if (v15)
    MTLSerializePluginDataDictionary((void *)objc_msgSend((id)-[MTLFunction device](p_private->computeFunction, "device"), "pluginData"), &v19[v16]);
  if (v18)
    MTLSerializePluginDataDictionary(p_private->pluginData, &v19[HIDWORD(__src)]);
  return dispatch_data_create(v19, v13, 0, (dispatch_block_t)*MEMORY[0x1E0C80CE0]);
}

- (void)setTextureWriteRoundingMode:(int64_t)a3
{
  self->_private.textureWriteRoundingMode = a3;
}

- (void)setLabel:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSString *label;
  const __CFString *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    v10 = CFSTR("label is not a NSString.");
    v11 = 1;
    v12 = 777;
  }
  else
  {
    v10 = CFSTR("label must not be nil.");
    v11 = 0;
    v12 = 774;
  }
  MTLReportFailure(v11, "-[MTLComputePipelineDescriptorInternal setLabel:]", v12, (uint64_t)v10, v3, v4, v5, v6, v13);
LABEL_3:
  label = self->_private.label;
  if (label != a3)
  {

    self->_private.label = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)setDriverCompilerOptions:(id)a3
{
  MTLComputePipelineDescriptorPrivate *p_private;
  NSDictionary *driverCompilerOptions;

  p_private = &self->_private;
  driverCompilerOptions = self->_private.driverCompilerOptions;
  if (driverCompilerOptions != a3)
  {

    p_private->driverCompilerOptions = (NSDictionary *)objc_msgSend(a3, "copy");
  }
}

- (void)setLinkedFunctions:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  MTLComputePipelineDescriptorPrivate *p_private;
  MTLLinkedFunctions *linkedFunctions;
  uint64_t v11;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLComputePipelineDescriptorInternal setLinkedFunctions:]", 889, (uint64_t)CFSTR("linkedFunctions is not a MTLLinkedFunctions."), v5, v6, v7, v8, v11);
  }
  p_private = &self->_private;
  linkedFunctions = p_private->linkedFunctions;
  if (linkedFunctions != a3)
  {

    p_private->linkedFunctions = (MTLLinkedFunctions *)objc_msgSend(a3, "copy");
  }
}

- (void)setStageInputDescriptor:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  MTLComputePipelineDescriptorPrivate *p_private;
  MTLStageInputOutputDescriptor *stageInputDescriptor;
  uint64_t v11;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLComputePipelineDescriptorInternal setStageInputDescriptor:]", 821, (uint64_t)CFSTR("stageInputDescriptor is not a MTLStageInputOutputDescriptor."), v5, v6, v7, v8, v11);
  }
  p_private = &self->_private;
  stageInputDescriptor = p_private->stageInputDescriptor;
  if (stageInputDescriptor != a3)
  {

    p_private->stageInputDescriptor = (MTLStageInputOutputDescriptor *)objc_msgSend(a3, "copy");
  }
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  MTLComputePipelineDescriptorPrivate *p_private;
  MTLPipelineBufferDescriptorInternal *v10;
  uint64_t v11;
  NSArray *preloadedLibraries;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSArray *binaryArchives;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  const __CFString *label;
  MTLFunction *computeFunction;
  uint64_t v29;
  uint64_t v30;
  MTLLinkedFunctions *linkedFunctions;
  uint64_t v32;
  const __CFString *v33;
  uint64_t pipelineLibrary;
  id v35;
  void *v36;
  void *v38;
  MTLComputePipelineDescriptorPrivate *v39;
  MTLComputePipelineDescriptorInternal *v40;
  objc_super v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[60];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = a3 + 8;
  objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 8, CFSTR(" "), 0);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 31);
  v8 = 0;
  v40 = self;
  p_private = &self->_private;
  do
  {
    v10 = self->_private.buffers->_descriptors[v8];
    if (v10)
      v11 = MTLPipelineBufferDescriptorDescription(v10);
    else
      v11 = MTLPipelineBufferDescriptorDefaultDescription();
    objc_msgSend(v7, "addObject:", v11);
    ++v8;
  }
  while (v8 != 31);
  v38 = v7;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  preloadedLibraries = self->_private.var0.preloadedLibraries;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](preloadedLibraries, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v47 != v16)
          objc_enumerationMutation(preloadedLibraries);
        v18 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        if (v15)
          objc_msgSend(v15, "appendString:", v5);
        else
          v15 = (id)objc_opt_new();
        objc_msgSend(v15, "appendString:", objc_msgSend(v18, "formattedDescription:", v6));
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](preloadedLibraries, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v39 = p_private;
  binaryArchives = p_private->binaryArchives;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](binaryArchives, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v43 != v23)
          objc_enumerationMutation(binaryArchives);
        v25 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
        if (v22)
          objc_msgSend(v22, "appendString:", v5);
        else
          v22 = (id)objc_opt_new();
        objc_msgSend(v22, "appendString:", objc_msgSend(v25, "formattedDescription:", v6));
      }
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](binaryArchives, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v21);
  }
  else
  {
    v22 = 0;
  }
  v26 = (void *)MEMORY[0x1E0C99DE8];
  v50[0] = v5;
  v50[1] = CFSTR("label =");
  label = CFSTR("<none>");
  computeFunction = v39->computeFunction;
  if (v39->label)
    label = (const __CFString *)v39->label;
  v50[2] = label;
  v50[3] = v5;
  v50[4] = CFSTR("computeFunction =");
  v29 = -[MTLFunction formattedDescription:](computeFunction, "formattedDescription:", v6);
  if (!v29)
    v29 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v50[5] = v29;
  v50[6] = v5;
  v50[7] = CFSTR("threadGroupSizeIsMultipleOfThreadExecutionWidth =");
  v50[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v39->threadGroupSizeIsMultipleOfThreadExecutionWidth);
  v50[9] = v5;
  v50[10] = CFSTR("maxTotalThreadsPerThreadgroup =");
  v50[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v39->maxTotalThreadsPerThreadgroup);
  v50[12] = v5;
  v50[13] = CFSTR("supportIndirectCommandBuffers =");
  v50[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v39->supportIndirectCommandBuffers);
  v50[15] = v5;
  v50[16] = CFSTR("textureWriteRoundingMode =");
  v50[17] = MTLRoundingModeString(v39->textureWriteRoundingMode);
  v50[18] = v5;
  v50[19] = CFSTR("stageInputDescriptor =");
  v30 = -[MTLStageInputOutputDescriptor formattedDescription:](v39->stageInputDescriptor, "formattedDescription:", v6);
  if (!v30)
    v30 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v50[20] = v30;
  v50[21] = v5;
  v50[22] = CFSTR("linkedFunctions =");
  linkedFunctions = v39->linkedFunctions;
  if (linkedFunctions)
    v32 = -[MTLLinkedFunctions formattedDescription:](linkedFunctions, "formattedDescription:", v6);
  else
    v32 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v50[23] = v32;
  v50[24] = v5;
  v33 = CFSTR("NO");
  if (v39->supportAddingBinaryFunctions)
    v33 = CFSTR("YES");
  v50[25] = CFSTR("supportAddingBinaryFunctions =");
  v50[26] = v33;
  v50[27] = v5;
  v50[28] = CFSTR("maxCallStackDepth =");
  v50[29] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v39->maxStackCallDepth);
  v50[30] = v5;
  v50[31] = CFSTR("pipelineLibrary =");
  pipelineLibrary = (uint64_t)v39->pipelineLibrary;
  if (!pipelineLibrary)
    pipelineLibrary = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v50[32] = pipelineLibrary;
  v50[33] = v5;
  v35 = (id)MEMORY[0x1E0C9AA60];
  if (v15)
    v35 = v15;
  v50[34] = CFSTR("preloadedLibraries =");
  v50[35] = v35;
  v50[36] = v5;
  v50[37] = CFSTR("binaryArchives =");
  if (!v22)
    v22 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v50[38] = v22;
  v50[39] = v5;
  v50[40] = CFSTR("Needs custom border color samplers = ");
  v50[41] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v39->needsCustomBorderColorSamplers);
  v50[42] = v5;
  v50[43] = CFSTR("buffers = ");
  v50[44] = v38;
  v50[45] = v5;
  v50[46] = CFSTR("forceResourceIndex =");
  v50[47] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v39->forceResourceIndex);
  v50[48] = v5;
  v50[49] = CFSTR("resourceIndex =");
  v50[50] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v39->resourceIndex);
  v50[51] = v5;
  v50[52] = CFSTR("maxAccelerationStructureTraversalDepth =");
  v50[53] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v39->maxAccelerationStructureTraversalDepth);
  v50[54] = v5;
  v50[55] = CFSTR("shaderValidation =");
  v50[56] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v39->shaderValidation);
  v50[57] = v5;
  v50[58] = CFSTR("shaderValidationState =");
  v50[59] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v39->shaderValidationState);
  v36 = (void *)objc_msgSend(v26, "arrayWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 60));
  v41.receiver = v40;
  v41.super_class = (Class)MTLComputePipelineDescriptorInternal;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), -[MTLComputePipelineDescriptorInternal description](&v41, sel_description), objc_msgSend(v36, "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLComputePipelineDescriptorInternal formattedDescription:](self, "formattedDescription:", 0);
}

- (void)reset
{
  MTLComputePipelineDescriptorPrivate *p_private;
  uint64_t v3;

  p_private = &self->_private;

  v3 = 0;
  p_private->label = 0;
  p_private->supportIndirectCommandBuffers = 0;
  p_private->textureWriteRoundingMode = 0;
  do
  {

    p_private->buffers->_descriptors[v3++] = 0;
  }
  while (v3 != 31);
  *((_BYTE *)p_private + 137) &= 0xFCu;
  p_private->needsCustomBorderColorSamplers = 0;

  p_private->binaryArchives = 0;
  p_private->var0.preloadedLibraries = 0;

  p_private->linkedFunctions = 0;
  p_private->forceResourceIndex = 0;
  p_private->resourceIndex = 0;

  p_private->pluginData = 0;
  p_private->supportAddingBinaryFunctions = 0;
  p_private->maxStackCallDepth = 1;

  p_private->shaderValidation = 0;
  p_private->shaderValidationState = 0;
  p_private->profileControl = 0;
  p_private->maxAccelerationStructureTraversalDepth = 0;
}

- (id)stageInputDescriptor
{
  MTLComputePipelineDescriptorPrivate *p_private;
  id result;

  p_private = &self->_private;
  result = self->_private.stageInputDescriptor;
  if (!result)
  {
    result = objc_alloc_init(MTLStageInputOutputDescriptorInternal);
    p_private->stageInputDescriptor = (MTLStageInputOutputDescriptor *)result;
  }
  return result;
}

- (void)setGpuCompilerSPIOptions:(id)a3
{
  MTLComputePipelineDescriptorPrivate *p_private;
  NSDictionary *gpuCompilerSPIOptions;

  p_private = &self->_private;
  gpuCompilerSPIOptions = self->_private.gpuCompilerSPIOptions;
  if (gpuCompilerSPIOptions != a3)
  {

    p_private->gpuCompilerSPIOptions = (NSDictionary *)objc_msgSend(a3, "copy");
  }
}

- (id)functionPointers
{
  return self->_private.functionPointers;
}

- (void)setFunctionPointers:(id)a3
{
  MTLComputePipelineDescriptorPrivate *p_private;
  NSArray *functionPointers;

  p_private = &self->_private;
  functionPointers = self->_private.functionPointers;
  if (functionPointers != a3)
  {

    p_private->functionPointers = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (void)setSupportAddingBinaryFunctions:(BOOL)a3
{
  self->_private.supportAddingBinaryFunctions = a3;
}

- (void)setMaxCallStackDepth:(unint64_t)a3
{
  self->_private.maxStackCallDepth = a3;
}

- (void)setMaxAccelerationStructureTraversalDepth:(unint64_t)a3
{
  self->_private.maxAccelerationStructureTraversalDepth = a3;
}

- (void)setBinaryArchives:(id)a3
{
  MTLComputePipelineDescriptorPrivate *p_private;
  NSArray *binaryArchives;

  p_private = &self->_private;
  binaryArchives = self->_private.binaryArchives;
  if (binaryArchives != a3)
  {

    p_private->binaryArchives = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (void)setPreloadedLibraries:(id)a3
{
  MTLComputePipelineDescriptorPrivate *p_private;
  NSArray *preloadedLibraries;

  p_private = &self->_private;
  preloadedLibraries = self->_private.var0.preloadedLibraries;
  if (preloadedLibraries != a3)
  {

    p_private->var0.preloadedLibraries = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (id)insertLibraries
{
  return self->_private.var0.preloadedLibraries;
}

- (void)setInsertLibraries:(id)a3
{
  if (!a3)
    a3 = (id)MEMORY[0x1E0C9AA60];
  -[MTLComputePipelineDescriptorInternal setPreloadedLibraries:](self, "setPreloadedLibraries:", a3);
}

- (void)setMaxTotalThreadsPerThreadgroup:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int16 v7;

  v7 = a3;
  if (a3 >= 0x10000)
    MTLReportFailure(0, "-[MTLComputePipelineDescriptorInternal setMaxTotalThreadsPerThreadgroup:]", 1022, (uint64_t)CFSTR("max total threads must be less than or equal to %d."), v3, v4, v5, v6, 0xFFFFLL);
  self->_private.maxTotalThreadsPerThreadgroup = v7;
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

- (void)setTextureWriteFPRoundingMode:(int64_t)a3
{
  self->_private.textureWriteRoundingMode = a3;
}

- (int64_t)textureWriteFPRoundingMode
{
  return self->_private.textureWriteRoundingMode;
}

- (BOOL)forceResourceIndex
{
  return self->_private.forceResourceIndex;
}

- (void)setForceResourceIndex:(BOOL)a3
{
  self->_private.forceResourceIndex = a3;
}

- (unint64_t)resourceIndex
{
  return self->_private.resourceIndex;
}

- (void)setResourceIndex:(unint64_t)a3
{
  self->_private.resourceIndex = a3;
}

- (BOOL)openGLModeEnabled
{
  return *((_BYTE *)&self->_private + 137) & 1;
}

- (void)setOpenGLModeEnabled:(BOOL)a3
{
  *((_BYTE *)&self->_private + 137) = *((_BYTE *)&self->_private + 137) & 0xFE | a3;
}

- (BOOL)openCLModeEnabled
{
  return (*((unsigned __int8 *)&self->_private + 137) >> 1) & 1;
}

- (void)setOpenCLModeEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)&self->_private + 137) = *((_BYTE *)&self->_private + 137) & 0xFD | v3;
}

- (BOOL)internalPipeline
{
  return (*((unsigned __int8 *)&self->_private + 137) >> 2) & 1;
}

- (void)setInternalPipeline:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)&self->_private + 137) = *((_BYTE *)&self->_private + 137) & 0xFB | v3;
}

- (void)setNeedsCustomBorderColorSamplers:(BOOL)a3
{
  self->_private.needsCustomBorderColorSamplers = a3;
}

- (void)setProfileControl:(id)a3
{
  MTLComputePipelineDescriptorPrivate *p_private;
  MTLProfileControl *profileControl;

  p_private = &self->_private;
  profileControl = self->_private.profileControl;
  if (profileControl != a3)
  {

    p_private->profileControl = (MTLProfileControl *)objc_msgSend(a3, "copy");
  }
}

- (const)_descriptorPrivate
{
  return &self->_private;
}

- (id)pluginData
{
  return self->_private.pluginData;
}

- (void)setPluginData:(id)a3
{
  MTLComputePipelineDescriptorPrivate *p_private;
  NSDictionary *pluginData;

  p_private = &self->_private;
  pluginData = self->_private.pluginData;
  if (pluginData != a3)
  {

    p_private->pluginData = (NSDictionary *)a3;
  }
}

- (unint64_t)hash
{
  MTLComputePipelineDescriptorPrivate *p_private;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t descriptors;
  uint64_t v7;
  uint64_t *v8;
  NSDictionary *pluginData;
  uint64_t v10;
  unint64_t maxAccelerationStructureTraversalDepth;
  _QWORD v13[2];
  char v14;
  unsigned __int16 maxTotalThreadsPerThreadgroup;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t maxStackCallDepth;
  _BYTE v23[248];
  _BOOL4 supportIndirectCommandBuffers;
  int textureWriteRoundingMode;
  BOOL forceResourceIndex;
  unint64_t resourceIndex;
  BOOL needsCustomBorderColorSamplers;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  __int128 v34;

  p_private = &self->_private;
  bzero(v13, 0x1A8uLL);
  v13[0] = -[NSString hash](p_private->label, "hash");
  v13[1] = -[MTLFunction hash](p_private->computeFunction, "hash");
  v14 = v14 & 0xFE | p_private->threadGroupSizeIsMultipleOfThreadExecutionWidth;
  maxTotalThreadsPerThreadgroup = p_private->maxTotalThreadsPerThreadgroup;
  supportIndirectCommandBuffers = p_private->supportIndirectCommandBuffers;
  textureWriteRoundingMode = p_private->textureWriteRoundingMode;
  v16 = -[MTLStageInputOutputDescriptor hash](p_private->stageInputDescriptor, "hash");
  v17 = -[NSDictionary hash](p_private->driverCompilerOptions, "hash");
  v18 = -[NSDictionary hash](p_private->gpuCompilerSPIOptions, "hash");
  v19 = -[NSArray hash](p_private->functionPointers, "hash");
  v3 = -[MTLLinkedFunctions hash](p_private->linkedFunctions, "hash");
  v4 = 0;
  v5 = -(uint64_t)p_private->supportAddingBinaryFunctions;
  v20 = v3;
  v21 = v5;
  maxStackCallDepth = p_private->maxStackCallDepth;
  descriptors = (uint64_t)p_private->buffers->_descriptors;
  do
  {
    v7 = *(_QWORD *)(descriptors + v4);
    if (v7)
      v8 = (uint64_t *)(v7 + 8);
    else
      v8 = &_MTLDefaultPipelineBufferPrivate;
    *(_QWORD *)&v23[v4] = *v8;
    v4 += 8;
  }
  while (v4 != 248);
  forceResourceIndex = p_private->forceResourceIndex;
  pluginData = p_private->pluginData;
  resourceIndex = p_private->resourceIndex;
  needsCustomBorderColorSamplers = p_private->needsCustomBorderColorSamplers;
  v29 = -[NSDictionary hash](pluginData, "hash");
  v30 = MTLHashArray(p_private->var0.preloadedLibraries, 1, 1);
  v31 = MTLHashArray(p_private->binaryArchives, 1, 0);
  v10 = -[MTLProfileControl hash](p_private->profileControl, "hash");
  maxAccelerationStructureTraversalDepth = p_private->maxAccelerationStructureTraversalDepth;
  v32 = v10;
  v33 = maxAccelerationStructureTraversalDepth;
  v34 = *(_OWORD *)&p_private->shaderValidation;
  return _MTLHashState((int *)v13, 0x1A8uLL);
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  int v6;
  MTLComputePipelineDescriptorPrivate *p_private;
  void **v8;
  MTLFunction *computeFunction;
  MTLStageInputOutputDescriptor *stageInputDescriptor;
  NSDictionary *driverCompilerOptions;
  NSDictionary *gpuCompilerSPIOptions;
  NSArray *functionPointers;
  uint64_t v14;
  MTLPipelineBufferDescriptorInternal *v15;
  MTLPipelineBufferDescriptorInternal *v16;
  BOOL v17;
  NSDictionary *pluginData;
  int v19;
  MTLProfileControl *profileControl;

  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    Class = object_getClass(self);
    if (Class != object_getClass(a3))
    {
LABEL_3:
      LOBYTE(v6) = 0;
      return v6;
    }
    p_private = &self->_private;
    v8 = (void **)((char *)a3 + 16);
    if (p_private->label == *v8 || (v6 = -[NSString isEqual:](p_private->label, "isEqual:")) != 0)
    {
      computeFunction = p_private->computeFunction;
      if (computeFunction == v8[1] || (v6 = -[MTLFunction isEqual:](computeFunction, "isEqual:")) != 0)
      {
        stageInputDescriptor = p_private->stageInputDescriptor;
        if (stageInputDescriptor == v8[3]
          || (v6 = -[MTLStageInputOutputDescriptor isEqual:](stageInputDescriptor, "isEqual:")) != 0)
        {
          driverCompilerOptions = p_private->driverCompilerOptions;
          if (driverCompilerOptions == v8[4] || (v6 = -[NSDictionary isEqual:](driverCompilerOptions, "isEqual:")) != 0)
          {
            gpuCompilerSPIOptions = p_private->gpuCompilerSPIOptions;
            if (gpuCompilerSPIOptions == v8[5]
              || (v6 = -[NSDictionary isEqual:](gpuCompilerSPIOptions, "isEqual:")) != 0)
            {
              functionPointers = p_private->functionPointers;
              if (functionPointers == v8[18] || (v6 = -[NSArray isEqual:](functionPointers, "isEqual:")) != 0)
              {
                v6 = MTLCompareFunctionList(p_private->linkedFunctions, v8[19]);
                if (v6)
                {
                  if (p_private->supportAddingBinaryFunctions == *((unsigned __int8 *)v8 + 168)
                    && (void *)p_private->maxStackCallDepth == v8[20]
                    && p_private->threadGroupSizeIsMultipleOfThreadExecutionWidth == *((unsigned __int8 *)v8 + 16)
                    && p_private->maxTotalThreadsPerThreadgroup == *((unsigned __int16 *)v8 + 9)
                    && p_private->supportIndirectCommandBuffers == *((unsigned __int8 *)v8 + 80)
                    && (void *)p_private->textureWriteRoundingMode == v8[13])
                  {
                    v14 = 0;
                    while (1)
                    {
                      v15 = p_private->buffers->_descriptors[v14];
                      v16 = *(MTLPipelineBufferDescriptorInternal **)((char *)v8[6] + v14 * 8 + 8);
                      if (v15 != v16)
                      {
                        v17 = !v15 || v16 == 0;
                        if (v17 || v15->_private.var0.var1.var0 != v16->_private.var0.var1.var0)
                          break;
                      }
                      if (++v14 == 31)
                      {
                        if (p_private->forceResourceIndex != *((unsigned __int8 *)v8 + 112)
                          || (void *)p_private->resourceIndex != v8[15]
                          || p_private->needsCustomBorderColorSamplers != *((unsigned __int8 *)v8 + 136))
                        {
                          goto LABEL_3;
                        }
                        pluginData = p_private->pluginData;
                        if (pluginData == v8[16] || (v6 = -[NSDictionary isEqual:](pluginData, "isEqual:")) != 0)
                        {
                          v6 = MTLCompareArray(p_private->var0.preloadedLibraries, v8[8], 1, 1);
                          if (v6)
                          {
                            v19 = MTLCompareArray(p_private->binaryArchives, v8[7], 1, 0);
                            LOBYTE(v6) = 0;
                            if (v19)
                            {
                              profileControl = p_private->profileControl;
                              if (profileControl == v8[22]
                                || (v6 = -[MTLProfileControl isEqual:](profileControl, "isEqual:")) != 0)
                              {
                                if ((void *)p_private->maxAccelerationStructureTraversalDepth == v8[23]
                                  && (void *)p_private->shaderValidation == v8[11])
                                {
                                  LOBYTE(v6) = p_private->shaderValidationState == (_QWORD)v8[12];
                                  return v6;
                                }
                                goto LABEL_3;
                              }
                            }
                          }
                        }
                        return v6;
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
  return v6;
}

- (void)validateWithDevice:(id)a3
{
  objc_msgSend(a3, "registerComputePipelineDescriptor:", self);
  validateWithDevice(a3, (uint64_t)&self->_private);
}

@end
