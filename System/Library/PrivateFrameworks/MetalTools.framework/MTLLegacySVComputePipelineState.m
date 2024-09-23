@implementation MTLLegacySVComputePipelineState

- (void)_initConstantsBuffer:(id)a3 device:(id)a4
{
  void *v7;
  id v8;
  MTLLegacySVPipelineStateInfoEncoder *v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *binaryFunctionData;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend((id)objc_msgSend(a3, "debugInstrumentationData"), "globalConstantsData");
  self->_threadgroupArgumentOffset = objc_msgSend((id)objc_msgSend(a3, "debugInstrumentationData"), "threadgroupArgumentOffset");
  self->_activeThreadgroupMask = objc_msgSend((id)objc_msgSend(a3, "debugInstrumentationData"), "activeThreadgroupMask");
  if (objc_msgSend(v7, "length"))
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v8, "appendData:", v7);
      self->_constantOffset = 0;
      objc_msgSend(v7, "length");
    }
    -[MTLLegacySVImageData setConstantData:](self->_kernelFunctionData, "setConstantData:", v8);

  }
  if (self->_supportsIndirectCommandBuffers
    && (HIBYTE(self->super.super._device[2].dynamicLibraryObjectCache) & 0x20) != 0)
  {
    v9 = -[MTLLegacySVPipelineStateInfoEncoder initWithDevice:]([MTLLegacySVPipelineStateInfoEncoder alloc], "initWithDevice:", self->super.super._device);
    v10 = (void *)objc_msgSend((id)objc_msgSend(a4, "baseObject"), "newBufferWithLength:options:", -[MTLLegacySVPipelineStateInfoEncoder encodedLength](v9, "encodedLength"), 0);
    self->_indirectStateBuffer = -[MTLLegacySVBuffer initWithBuffer:device:offset:length:track:]([MTLLegacySVBuffer alloc], "initWithBuffer:device:offset:length:track:", v10, a4, 0, objc_msgSend(v10, "length"), 0);

    -[MTLLegacySVPipelineStateInfoEncoder setArgumentBuffer:offset:](v9, "setArgumentBuffer:offset:", self->_indirectStateBuffer, 0);
    -[MTLLegacySVPipelineStateInfoEncoder setComputePipelineState:](v9, "setComputePipelineState:", self);

    if (self->_supportsIndirectCommandBuffers)
    {
      v11 = *((_QWORD *)self->_kernelFunctionData + 1);
      if (v11)
        LegacySVGlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, v11);
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      binaryFunctionData = self->_binaryFunctionData;
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](binaryFunctionData, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v19 != v15)
              objc_enumerationMutation(binaryFunctionData);
            v17 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i) + 8);
            if (v17)
              LegacySVGlobalResidentBufferList::addBuffer((uint64_t)&self->super.super._device[4]._memorySize, v17);
          }
          v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](binaryFunctionData, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v14);
      }
    }
    LegacySVGlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, (uint64_t)self->_indirectStateBuffer);
  }
}

- (MTLLegacySVComputePipelineState)initWithComputePipelineState:(id)a3 descriptor:(id)a4 unwrappedDescriptor:(id)a5 reflection:(id)a6 device:(id)a7 pipelineOptions:(unint64_t)a8
{
  MTLLegacySVComputePipelineState *v14;
  uint64_t v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  id v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v43.receiver = self;
  v43.super_class = (Class)MTLLegacySVComputePipelineState;
  v14 = -[MTLToolsObject initWithBaseObject:parent:](&v43, sel_initWithBaseObject_parent_, a3, a7);
  if (v14)
  {
    v34 = a6;
    v15 = objc_msgSend(a4, "computeFunction");
    v14->_kernelFunctionData = -[MTLLegacySVImageData initWithFunction:debugInstrumentationData:]([MTLLegacySVImageData alloc], "initWithFunction:debugInstrumentationData:", v15, objc_msgSend(a3, "debugInstrumentationData"));
    if ((BYTE4(v14->super.super._device[2].sourceLibraryObjectCache) & 2) != 0)
    {
      v16 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
      v14->_retainedFunctions = v16;
      -[NSMutableArray addObject:](v16, "addObject:", v15);
    }
    v14->_supportsIndirectCommandBuffers = objc_msgSend(a4, "supportIndirectCommandBuffers");
    v17 = 1;
    if ((a8 & 0x800000000) == 0)
      v17 = 2;
    v14->_shaderValidation = v17;
    v14->_shaderValidationState = v17;
    v18 = objc_msgSend((id)objc_msgSend(a4, "preloadedLibraries"), "count");
    v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "linkedFunctions"), "binaryFunctions"), "count") + v18;
    if (v19)
    {
      v32 = a5;
      v14->_binaryFunctionData = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v19);
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v20 = (void *)objc_msgSend((id)objc_msgSend(a4, "linkedFunctions"), "binaryFunctions");
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v40;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v40 != v23)
              objc_enumerationMutation(v20);
            -[NSMutableArray addObject:](v14->_binaryFunctionData, "addObject:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v24++) + 48), v32);
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        }
        while (v22);
      }
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v25 = (void *)objc_msgSend(a4, "preloadedLibraries", v32);
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      a5 = v33;
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v36;
        do
        {
          v29 = 0;
          do
          {
            if (*(_QWORD *)v36 != v28)
              objc_enumerationMutation(v25);
            -[NSMutableArray addObject:](v14->_binaryFunctionData, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v29++), "imageData"));
          }
          while (v27 != v29);
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        }
        while (v27);
      }
    }
    v14->_internalReflection = (MTLComputePipelineReflection *)v34;
    if (objc_msgSend((id)objc_msgSend(a3, "debugInstrumentationData"), "userReflectionData"))
    {
      v30 = objc_msgSend(a5, "newSerializedComputeDataWithFlags:options:", 0, 3);
      v14->_userReflection = (MTLComputePipelineReflection *)objc_msgSend(objc_alloc(MEMORY[0x24BDDD558]), "initWithSerializedData:serializedStageInputDescriptor:device:options:flags:", objc_msgSend((id)objc_msgSend(a3, "debugInstrumentationData"), "userReflectionData"), v30, objc_msgSend(a7, "baseObject"), 3, 0);
      dispatch_release(v30);
    }
    -[MTLComputePipelineReflection setPerformanceStatistics:](v14->_userReflection, "setPerformanceStatistics:", -[MTLComputePipelineReflection performanceStatistics](v14->_internalReflection, "performanceStatistics"));
    -[MTLLegacySVComputePipelineState _initConstantsBuffer:device:](v14, "_initConstantsBuffer:device:", a3, a7);
  }
  return v14;
}

- (MTLLegacySVComputePipelineState)initWithComputePipelineState:(id)a3 binaryFunctions:(id)a4 withState:(id)a5 device:(id)a6 pipelineOptions:(unint64_t)a7
{
  MTLLegacySVComputePipelineState *v11;
  MTLLegacySVComputePipelineState *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)MTLLegacySVComputePipelineState;
  v11 = -[MTLToolsObject initWithBaseObject:parent:](&v27, sel_initWithBaseObject_parent_, a3, a6);
  v12 = v11;
  if (v11)
  {
    v22 = a7;
    if ((BYTE4(v11->super.super._device[2].sourceLibraryObjectCache) & 2) != 0)
    {
      v13 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(*((id *)a5 + 16), "count") + objc_msgSend(a4, "count"));
      v12->_retainedFunctions = v13;
      -[NSMutableArray addObjectsFromArray:](v13, "addObjectsFromArray:", a4);
      -[NSMutableArray addObjectsFromArray:](v12->_retainedFunctions, "addObjectsFromArray:", *((_QWORD *)a5 + 16));
    }
    v12->_kernelFunctionData = (MTLLegacySVImageData *)*((id *)a5 + 6);
    v14 = objc_msgSend(*((id *)a5 + 9), "count");
    v15 = objc_msgSend(a4, "count") + v14;
    if (v15)
      v12->_binaryFunctionData = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v15);
    if (*((_QWORD *)a5 + 9))
      -[NSMutableArray addObjectsFromArray:](v12->_binaryFunctionData, "addObjectsFromArray:");
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(a4);
          -[NSMutableArray addObject:](v12->_binaryFunctionData, "addObject:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19++) + 48));
        }
        while (v17 != v19);
        v17 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v17);
    }
    v12->_userReflection = (MTLComputePipelineReflection *)*((id *)a5 + 8);
    v12->_internalReflection = (MTLComputePipelineReflection *)*((id *)a5 + 7);
    v12->_supportsIndirectCommandBuffers = objc_msgSend(a5, "supportIndirectCommandBuffers");
    v20 = 1;
    if ((v22 & 0x800000000) == 0)
      v20 = 2;
    v12->_shaderValidation = v20;
    v12->_shaderValidationState = v20;
    -[MTLLegacySVComputePipelineState _initConstantsBuffer:device:](v12, "_initConstantsBuffer:device:", a3, v12->super.super._device);
  }
  return v12;
}

- (void)releaseReflection
{

  self->_internalReflection = 0;
  self->_userReflection = 0;
}

- (MTLComputePipelineReflection)internalReflection
{
  return self->_internalReflection;
}

- (MTLComputePipelineReflection)userReflection
{
  return self->_userReflection;
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
{
  id result;
  id v6;
  MTLLegacySVVisibleFunctionTable *v7;

  result = (id)-[MTLToolsObject newVisibleFunctionTableWithDescriptor:](self->super.super._baseObject, "newVisibleFunctionTableWithDescriptor:");
  if (result)
  {
    v6 = result;
    v7 = -[MTLLegacySVVisibleFunctionTable initWithVisibleFunctionTable:descriptor:computePipeline:]([MTLLegacySVVisibleFunctionTable alloc], "initWithVisibleFunctionTable:descriptor:computePipeline:", result, a3, self);

    return v7;
  }
  return result;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  id result;
  id v6;
  MTLLegacySVIntersectionFunctionTable *v7;

  result = (id)-[MTLToolsObject newIntersectionFunctionTableWithDescriptor:](self->super.super._baseObject, "newIntersectionFunctionTableWithDescriptor:");
  if (result)
  {
    v6 = result;
    v7 = -[MTLLegacySVIntersectionFunctionTable initWithIntersectionFunctionTable:device:descriptor:computePipelineState:]([MTLLegacySVIntersectionFunctionTable alloc], "initWithIntersectionFunctionTable:device:descriptor:computePipelineState:", result, -[MTLToolsComputePipelineState device](self, "device"), a3, self);

    return v7;
  }
  return result;
}

- (id)functionHandleWithFunction:(id)a3
{
  uint64_t v5;
  MTLToolsObjectCache *functionHandleObjectCache;
  uint64_t v8;
  uint64_t v9;
  MTLLegacySVFunctionHandle *(*v10)(_QWORD *);
  void *v11;
  uint64_t v12;
  MTLLegacySVComputePipelineState *v13;
  id v14;

  v5 = -[MTLToolsObject functionHandleWithFunction:](self->super.super._baseObject, "functionHandleWithFunction:", objc_msgSend(a3, "baseObject"));
  functionHandleObjectCache = self->super.super._device->functionHandleObjectCache;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __62__MTLLegacySVComputePipelineState_functionHandleWithFunction___block_invoke;
  v11 = &unk_24F795418;
  v12 = v5;
  v13 = self;
  v14 = a3;
  return -[MTLToolsObjectCache getCachedObjectForKey:onMiss:](functionHandleObjectCache, "getCachedObjectForKey:onMiss:");
}

MTLLegacySVFunctionHandle *__62__MTLLegacySVComputePipelineState_functionHandleWithFunction___block_invoke(_QWORD *a1)
{
  return -[MTLLegacySVFunctionHandle initWithFunctionHandle:computePiplineState:function:]([MTLLegacySVFunctionHandle alloc], "initWithFunctionHandle:computePiplineState:function:", a1[4], a1[5], a1[6]);
}

- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  MTLLegacySVComputePipelineState *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(a3);
        objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11++), "baseObject"));
      }
      while (v9 != v11);
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  v12 = (void *)-[MTLToolsObject newComputePipelineStateWithAdditionalBinaryFunctions:error:](self->super.super._baseObject, "newComputePipelineStateWithAdditionalBinaryFunctions:error:", v7, a4);

  if (!objc_msgSend(v12, "debugInstrumentationData"))
    objc_msgSend(v12, "setDebugInstrumentationData:", -[MTLToolsComputePipelineState debugInstrumentationData](self, "debugInstrumentationData"));
  v13 = -[MTLLegacySVComputePipelineState initWithComputePipelineState:binaryFunctions:withState:device:pipelineOptions:]([MTLLegacySVComputePipelineState alloc], "initWithComputePipelineState:binaryFunctions:withState:device:pipelineOptions:", v12, a3, self, self->super.super._device, 0);

  return v13;
}

- (MTLLegacySVImageData)kernelFunctionData
{
  return self->_kernelFunctionData;
}

- (MTLLegacySVBuffer)globalConstantsBuffer
{
  MTLLegacySVImageData *kernelFunctionData;

  kernelFunctionData = self->_kernelFunctionData;
  if (kernelFunctionData)
    return (MTLLegacySVBuffer *)*((_QWORD *)kernelFunctionData + 1);
  else
    return 0;
}

- (unint64_t)constantOffset
{
  return self->_constantOffset;
}

- (unint64_t)staticThreadgroupMemoryLength
{
  uint64_t v3;

  v3 = -[MTLToolsObject staticThreadgroupMemoryLength](self->super.super._baseObject, "staticThreadgroupMemoryLength");
  return v3
       + -[MTLDebugInstrumentationData threadgroupArgumentOffset](-[MTLToolsComputePipelineState debugInstrumentationData](self, "debugInstrumentationData"), "threadgroupArgumentOffset");
}

- (MTLLegacySVBuffer)indirectStateBuffer
{
  return self->_indirectStateBuffer;
}

- (void)dealloc
{
  uint64_t v3;
  NSMutableArray *binaryFunctionData;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self->_supportsIndirectCommandBuffers)
  {
    v3 = *((_QWORD *)self->_kernelFunctionData + 1);
    if (v3)
      LegacySVGlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, v3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    binaryFunctionData = self->_binaryFunctionData;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](binaryFunctionData, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(binaryFunctionData);
          v9 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i) + 8);
          if (v9)
            LegacySVGlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, v9);
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](binaryFunctionData, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
    LegacySVGlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, (uint64_t)self->_indirectStateBuffer);

  }
  v10.receiver = self;
  v10.super_class = (Class)MTLLegacySVComputePipelineState;
  -[MTLToolsComputePipelineState dealloc](&v10, sel_dealloc);
}

- (int64_t)shaderValidation
{
  return self->_shaderValidation;
}

- (int64_t)shaderValidationState
{
  return self->_shaderValidationState;
}

- (NSArray)binaryFunctionData
{
  return &self->_binaryFunctionData->super;
}

- (int)maxCallStackDepth
{
  return self->_maxCallStackDepth;
}

@end
