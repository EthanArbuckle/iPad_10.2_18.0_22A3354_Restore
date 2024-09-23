@implementation MTLGPUDebugRenderPipelineState

- (void)_initConstantsBuffer:(id)a3 device:(id)a4
{
  MTLGPUDebugPipelineStateInfoEncoder *v7;
  void *v8;
  NSMutableArray *binaryFunctionData;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[MTLGPUDebugImageData setConstantData:](self->_vertexFunctionData, "setConstantData:", objc_msgSend((id)objc_msgSend(a3, "vertexDebugInstrumentationData"), "globalConstantsData"));
  -[MTLGPUDebugImageData setConstantData:](self->_fragmentFunctionData, "setConstantData:", objc_msgSend((id)objc_msgSend(a3, "fragmentDebugInstrumentationData"), "globalConstantsData"));
  -[MTLGPUDebugImageData setConstantData:](self->_tileFunctionData, "setConstantData:", objc_msgSend((id)objc_msgSend(a3, "tileDebugInstrumentationData"), "globalConstantsData"));
  -[MTLGPUDebugImageData setConstantData:](self->_objectFunctionData, "setConstantData:", objc_msgSend((id)objc_msgSend(a3, "objectDebugInstrumentationData"), "globalConstantsData"));
  -[MTLGPUDebugImageData setConstantData:](self->_meshFunctionData, "setConstantData:", objc_msgSend((id)objc_msgSend(a3, "meshDebugInstrumentationData"), "globalConstantsData"));
  if (self->_supportsIndirectCommandBuffers
    && (HIBYTE(self->super.super._device[2].dynamicLibraryObjectCache) & 0x20) != 0)
  {
    v7 = -[MTLGPUDebugPipelineStateInfoEncoder initWithDevice:]([MTLGPUDebugPipelineStateInfoEncoder alloc], "initWithDevice:", self->super.super._device);
    v8 = (void *)objc_msgSend((id)objc_msgSend(a4, "baseObject"), "newBufferWithLength:options:", -[MTLGPUDebugPipelineStateInfoEncoder encodedLength](v7, "encodedLength"), 0);
    self->_indirectStateBuffer = -[MTLGPUDebugBuffer initWithBuffer:device:offset:length:track:]([MTLGPUDebugBuffer alloc], "initWithBuffer:device:offset:length:track:", v8, a4, 0, objc_msgSend(v8, "length"), 0);

    -[MTLGPUDebugPipelineStateInfoEncoder setArgumentBuffer:offset:](v7, "setArgumentBuffer:offset:", self->_indirectStateBuffer, 0);
    -[MTLGPUDebugPipelineStateInfoEncoder setRenderPipelineState:](v7, "setRenderPipelineState:", self);

    if (-[MTLGPUDebugRenderPipelineState vertexConstantsBuffer](self, "vertexConstantsBuffer"))
      GlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, (uint64_t)-[MTLGPUDebugRenderPipelineState vertexConstantsBuffer](self, "vertexConstantsBuffer"));
    if (-[MTLGPUDebugRenderPipelineState fragmentConstantsBuffer](self, "fragmentConstantsBuffer"))
      GlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, (uint64_t)-[MTLGPUDebugRenderPipelineState fragmentConstantsBuffer](self, "fragmentConstantsBuffer"));
    if (-[MTLGPUDebugRenderPipelineState tileConstantsBuffer](self, "tileConstantsBuffer"))
      GlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, (uint64_t)-[MTLGPUDebugRenderPipelineState tileConstantsBuffer](self, "tileConstantsBuffer"));
    if (-[MTLGPUDebugRenderPipelineState objectConstantsBuffer](self, "objectConstantsBuffer"))
      GlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, (uint64_t)-[MTLGPUDebugRenderPipelineState objectConstantsBuffer](self, "objectConstantsBuffer"));
    if (-[MTLGPUDebugRenderPipelineState meshConstantsBuffer](self, "meshConstantsBuffer"))
      GlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, (uint64_t)-[MTLGPUDebugRenderPipelineState meshConstantsBuffer](self, "meshConstantsBuffer"));
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    binaryFunctionData = self->_binaryFunctionData;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](binaryFunctionData, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(binaryFunctionData);
          v14 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i) + 8);
          if (v14)
            GlobalResidentBufferList::addBuffer((uint64_t)&self->super.super._device[4]._memorySize, v14);
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](binaryFunctionData, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }
    GlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, (uint64_t)self->_indirectStateBuffer);
  }
}

- (MTLGPUDebugRenderPipelineState)initWithRenderPipelineState:(id)a3 descriptor:(id)a4 unwrappedDescriptor:(id)a5 reflection:(id)a6 device:(id)a7 pipelineOptions:(unint64_t)a8
{
  MTLGPUDebugRenderPipelineState *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  unint64_t v44;
  NSObject *v45;
  id v47;
  unint64_t v48;
  id v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v67.receiver = self;
  v67.super_class = (Class)MTLGPUDebugRenderPipelineState;
  v14 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:](&v67, sel_initWithBaseObject_parent_, a3, a7);
  if (v14)
  {
    if ((*((_BYTE *)a7 + 292) & 2) != 0)
      v14->_retainedFunctions = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
    if (objc_msgSend(a4, "vertexFunction"))
    {
      v14->_vertexMaxCallStackDepth = objc_msgSend(a4, "maxVertexCallStackDepth");
      v15 = objc_msgSend(a4, "vertexFunction");
      v14->_vertexFunctionData = -[MTLGPUDebugImageData initWithFunction:debugInstrumentationData:]([MTLGPUDebugImageData alloc], "initWithFunction:debugInstrumentationData:", v15, objc_msgSend(a3, "vertexDebugInstrumentationData"));
      -[NSMutableArray addObject:](v14->_retainedFunctions, "addObject:", v15);
    }
    if (objc_msgSend(a4, "fragmentFunction"))
    {
      v14->_fragmentMaxCallStackDepth = objc_msgSend(a4, "maxFragmentCallStackDepth");
      v16 = objc_msgSend(a4, "fragmentFunction");
      v14->_fragmentFunctionData = -[MTLGPUDebugImageData initWithFunction:debugInstrumentationData:]([MTLGPUDebugImageData alloc], "initWithFunction:debugInstrumentationData:", v16, objc_msgSend(a3, "fragmentDebugInstrumentationData"));
      -[NSMutableArray addObject:](v14->_retainedFunctions, "addObject:", v16);
    }
    if (objc_msgSend(a4, "meshFunction"))
    {
      v14->_meshMaxCallStackDepth = objc_msgSend(a4, "maxMeshCallStackDepth");
      v17 = objc_msgSend(a4, "meshFunction");
      v14->_meshFunctionData = -[MTLGPUDebugImageData initWithFunction:debugInstrumentationData:]([MTLGPUDebugImageData alloc], "initWithFunction:debugInstrumentationData:", v17, objc_msgSend(a3, "meshDebugInstrumentationData"));
      -[NSMutableArray addObject:](v14->_retainedFunctions, "addObject:", v17);
    }
    v49 = a7;
    if (objc_msgSend(a4, "objectFunction"))
    {
      v14->_objectMaxCallStackDepth = objc_msgSend(a4, "maxObjectCallStackDepth");
      v18 = objc_msgSend(a4, "objectFunction");
      v14->_objectFunctionData = -[MTLGPUDebugImageData initWithFunction:debugInstrumentationData:]([MTLGPUDebugImageData alloc], "initWithFunction:debugInstrumentationData:", v18, objc_msgSend(a3, "objectDebugInstrumentationData"));
      -[NSMutableArray addObject:](v14->_retainedFunctions, "addObject:", v18);
    }
    v14->_supportsIndirectCommandBuffers = objc_msgSend(a4, "supportIndirectCommandBuffers");
    v48 = a8;
    v19 = 1;
    if ((a8 & 0x800000000) == 0)
      v19 = 2;
    v14->_shaderValidation = v19;
    v14->_shaderValidationState = v19;
    v20 = objc_msgSend((id)objc_msgSend(a4, "vertexPreloadedLibraries"), "count");
    v21 = objc_msgSend((id)objc_msgSend(a4, "fragmentPreloadedLibraries"), "count");
    v22 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "vertexLinkedFunctions"), "binaryFunctions"), "count");
    v23 = v21
        + v20
        + v22
        + objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "fragmentLinkedFunctions"), "binaryFunctions"), "count");
    if (v23)
    {
      v47 = a5;
      v14->_binaryFunctionData = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v23);
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v24 = (void *)objc_msgSend((id)objc_msgSend(a4, "vertexLinkedFunctions"), "binaryFunctions");
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v64;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v64 != v27)
              objc_enumerationMutation(v24);
            -[NSMutableArray addObject:](v14->_binaryFunctionData, "addObject:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i) + 48));
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
        }
        while (v26);
      }
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v29 = (void *)objc_msgSend((id)objc_msgSend(a4, "fragmentLinkedFunctions"), "binaryFunctions");
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v60;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v60 != v32)
              objc_enumerationMutation(v29);
            -[NSMutableArray addObject:](v14->_binaryFunctionData, "addObject:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j) + 48));
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
        }
        while (v31);
      }
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v34 = (void *)objc_msgSend(a4, "vertexPreloadedLibraries");
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
      a5 = v47;
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v56;
        do
        {
          for (k = 0; k != v36; ++k)
          {
            if (*(_QWORD *)v56 != v37)
              objc_enumerationMutation(v34);
            -[NSMutableArray addObject:](v14->_binaryFunctionData, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * k), "imageData"));
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
        }
        while (v36);
      }
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v39 = (void *)objc_msgSend(a4, "fragmentPreloadedLibraries");
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v52;
        do
        {
          for (m = 0; m != v41; ++m)
          {
            if (*(_QWORD *)v52 != v42)
              objc_enumerationMutation(v39);
            -[NSMutableArray addObject:](v14->_binaryFunctionData, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * m), "imageData"));
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
        }
        while (v41);
      }
    }
    v14->_internalReflection = (MTLRenderPipelineReflection *)a6;
    v44 = 0x255C46000;
    if (objc_msgSend((id)objc_msgSend(a3, "vertexDebugInstrumentationData"), "userReflectionData")
      || objc_msgSend((id)objc_msgSend(a3, "fragmentDebugInstrumentationData"), "userReflectionData"))
    {
      v50 = 0;
      v45 = objc_msgSend(a5, "newSerializedVertexDataWithFlags:options:error:", 28, v48, &v50);
      v44 = 0x255C46000uLL;
      v14->_userReflection = (MTLRenderPipelineReflection *)objc_msgSend(objc_alloc(MEMORY[0x24BDDD6D0]), "initWithVertexData:vertexDynamicLibraries:fragmentData:fragmentDynamicLibraries:serializedVertexDescriptor:device:options:flags:", objc_msgSend((id)objc_msgSend(a3, "vertexDebugInstrumentationData"), "userReflectionData"), objc_msgSend((id)objc_msgSend(a3, "vertexDebugInstrumentationData"), "linkedDynamicLibraries"), objc_msgSend((id)objc_msgSend(a3, "fragmentDebugInstrumentationData"), "userReflectionData"), objc_msgSend((id)objc_msgSend(a3, "fragmentDebugInstrumentationData"), "linkedDynamicLibraries"), v45, objc_msgSend(v49, "baseObject"), v48, 0);
      objc_msgSend((id)objc_msgSend(a3, "vertexDebugInstrumentationData"), "releaseLinkedDynamicLibraries");
      objc_msgSend((id)objc_msgSend(a3, "fragmentDebugInstrumentationData"), "releaseLinkedDynamicLibraries");
      dispatch_release(v45);
    }
    objc_msgSend(*(id *)((char *)&v14->super.super.super.isa + *(int *)(v44 + 2536)), "setPerformanceStatistics:", -[MTLRenderPipelineReflection performanceStatistics](v14->_internalReflection, "performanceStatistics"));
    -[MTLGPUDebugRenderPipelineState _initConstantsBuffer:device:](v14, "_initConstantsBuffer:device:", a3, v49);
  }
  return v14;
}

- (MTLGPUDebugRenderPipelineState)initWithRenderPipelineState:(id)a3 vertexBinaryFunctions:(id)a4 fragmentBinaryFunctions:(id)a5 tileBinaryFunctions:(id)a6 objectBinaryFunctions:(id)a7 meshBinaryFunctions:(id)a8 withState:(id)a9 device:(id)a10 pipelineOptions:(unint64_t)a11
{
  MTLGPUDebugRenderPipelineState *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t n;
  uint64_t v45;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v68.receiver = self;
  v68.super_class = (Class)MTLGPUDebugRenderPipelineState;
  v17 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:](&v68, sel_initWithBaseObject_parent_, a3, a10);
  if (v17)
  {
    objc_msgSend(a4, "count");
    objc_msgSend(a5, "count");
    objc_msgSend(a6, "count");
    objc_msgSend(a7, "count");
    objc_msgSend(a8, "count");
    v17->_vertexFunctionData = (MTLGPUDebugImageData *)*((id *)a9 + 8);
    v17->_fragmentFunctionData = (MTLGPUDebugImageData *)*((id *)a9 + 9);
    v17->_tileFunctionData = (MTLGPUDebugImageData *)*((id *)a9 + 10);
    v17->_objectFunctionData = (MTLGPUDebugImageData *)*((id *)a9 + 11);
    v17->_meshFunctionData = (MTLGPUDebugImageData *)*((id *)a9 + 12);
    v18 = a8;
    v19 = objc_msgSend(*((id *)a9 + 7), "count");
    v20 = objc_msgSend(a4, "count");
    v21 = v20 + objc_msgSend(a5, "count");
    v22 = v21 + objc_msgSend(a6, "count");
    v23 = v22 + objc_msgSend(a7, "count");
    v47 = v18;
    v24 = v23 + objc_msgSend(v18, "count") + v19;
    if (v24)
      v17->_binaryFunctionData = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v24);
    if (*((_QWORD *)a9 + 7))
      -[NSMutableArray addObjectsFromArray:](v17->_binaryFunctionData, "addObjectsFromArray:");
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v25 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v65 != v27)
            objc_enumerationMutation(a4);
          -[NSMutableArray addObject:](v17->_binaryFunctionData, "addObject:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i) + 48));
        }
        v26 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
      }
      while (v26);
    }
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v29 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v61 != v31)
            objc_enumerationMutation(a5);
          -[NSMutableArray addObject:](v17->_binaryFunctionData, "addObject:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j) + 48));
        }
        v30 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
      }
      while (v30);
    }
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v33 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v57;
      do
      {
        for (k = 0; k != v34; ++k)
        {
          if (*(_QWORD *)v57 != v35)
            objc_enumerationMutation(a6);
          -[NSMutableArray addObject:](v17->_binaryFunctionData, "addObject:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k) + 48));
        }
        v34 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
      }
      while (v34);
    }
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v37 = objc_msgSend(a7, "countByEnumeratingWithState:objects:count:", &v52, v70, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v53;
      do
      {
        for (m = 0; m != v38; ++m)
        {
          if (*(_QWORD *)v53 != v39)
            objc_enumerationMutation(a7);
          -[NSMutableArray addObject:](v17->_binaryFunctionData, "addObject:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * m) + 48));
        }
        v38 = objc_msgSend(a7, "countByEnumeratingWithState:objects:count:", &v52, v70, 16);
      }
      while (v38);
    }
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v41 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v48, v69, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v49;
      do
      {
        for (n = 0; n != v42; ++n)
        {
          if (*(_QWORD *)v49 != v43)
            objc_enumerationMutation(v47);
          -[NSMutableArray addObject:](v17->_binaryFunctionData, "addObject:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * n) + 48));
        }
        v42 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v48, v69, 16);
      }
      while (v42);
    }
    v17->_userReflection = (MTLRenderPipelineReflection *)*((id *)a9 + 6);
    v17->_internalReflection = (MTLRenderPipelineReflection *)*((id *)a9 + 5);
    v17->_supportsIndirectCommandBuffers = objc_msgSend(a9, "supportIndirectCommandBuffers");
    v45 = 1;
    if ((a11 & 0x800000000) == 0)
      v45 = 2;
    v17->_shaderValidation = v45;
    v17->_shaderValidationState = v45;
    -[MTLGPUDebugRenderPipelineState _initConstantsBuffer:device:](v17, "_initConstantsBuffer:device:", a3, v17->super.super._device);
  }
  return v17;
}

- (MTLGPUDebugRenderPipelineState)initWithRenderPipelineState:(id)a3 tileDescriptor:(id)a4 reflection:(id)a5 device:(id)a6 pipelineOptions:(unint64_t)a7
{
  MTLGPUDebugRenderPipelineState *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v38.receiver = self;
  v38.super_class = (Class)MTLGPUDebugRenderPipelineState;
  v12 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:](&v38, sel_initWithBaseObject_parent_, a3, a6);
  if (v12)
  {
    if ((*((_BYTE *)a6 + 292) & 2) != 0)
      v12->_retainedFunctions = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
    v29 = a7;
    if (objc_msgSend(a4, "tileFunction", a5))
    {
      v12->_tileMaxCallStackDepth = objc_msgSend(a4, "maxCallStackDepth");
      v13 = objc_msgSend(a4, "tileFunction");
      v12->_tileFunctionData = -[MTLGPUDebugImageData initWithFunction:debugInstrumentationData:]([MTLGPUDebugImageData alloc], "initWithFunction:debugInstrumentationData:", v13, objc_msgSend(a3, "tileDebugInstrumentationData"));
      -[NSMutableArray addObject:](v12->_retainedFunctions, "addObject:", v13);
    }
    v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "linkedFunctions"), "binaryFunctions"), "count");
    v15 = objc_msgSend((id)objc_msgSend(a4, "preloadedLibraries"), "count") + v14;
    if (v15)
    {
      v12->_binaryFunctionData = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v15);
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v16 = (void *)objc_msgSend((id)objc_msgSend(a4, "linkedFunctions"), "binaryFunctions");
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v35 != v19)
              objc_enumerationMutation(v16);
            -[NSMutableArray addObject:](v12->_binaryFunctionData, "addObject:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i) + 48));
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        }
        while (v18);
      }
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v21 = (void *)objc_msgSend(a4, "preloadedLibraries");
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v31;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v31 != v24)
              objc_enumerationMutation(v21);
            -[NSMutableArray addObject:](v12->_binaryFunctionData, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "imageData"));
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        }
        while (v23);
      }
    }
    v12->_internalReflection = (MTLRenderPipelineReflection *)v28;
    v12->_supportsIndirectCommandBuffers = 0;
    v26 = 1;
    if ((v29 & 0x800000000) == 0)
      v26 = 2;
    v12->_shaderValidation = v26;
    v12->_shaderValidationState = v26;
    v12->_userReflection = (MTLRenderPipelineReflection *)objc_msgSend(objc_alloc(MEMORY[0x24BDDD6D0]), "initWithTileData:tileDynamicLibraries:functionType:device:options:flags:", objc_msgSend((id)objc_msgSend(a3, "tileDebugInstrumentationData"), "userReflectionData"), objc_msgSend((id)objc_msgSend(a3, "tileDebugInstrumentationData"), "linkedDynamicLibraries"), objc_msgSend((id)objc_msgSend(a4, "tileFunction"), "functionType"), objc_msgSend(a6, "baseObject"), 3, 0);
    objc_msgSend((id)objc_msgSend(a3, "tileDebugInstrumentationData"), "releaseLinkedDynamicLibraries");
    -[MTLRenderPipelineReflection setPerformanceStatistics:](v12->_userReflection, "setPerformanceStatistics:", -[MTLRenderPipelineReflection performanceStatistics](v12->_internalReflection, "performanceStatistics"));
    -[MTLGPUDebugRenderPipelineState _initConstantsBuffer:device:](v12, "_initConstantsBuffer:device:", a3, a6);
  }
  return v12;
}

- (MTLGPUDebugRenderPipelineState)initWithRenderPipelineState:(id)a3 meshDescriptor:(id)a4 unwrappedDescriptor:(id)a5 reflection:(id)a6 device:(id)a7 pipelineOptions:(unint64_t)a8
{
  MTLGPUDebugRenderPipelineState *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t n;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t ii;
  uint64_t v50;
  id v52;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  objc_super v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v78.receiver = self;
  v78.super_class = (Class)MTLGPUDebugRenderPipelineState;
  v12 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:](&v78, sel_initWithBaseObject_parent_, a3, a7, a5);
  if (v12)
  {
    v52 = a7;
    if ((*((_BYTE *)a7 + 292) & 2) != 0)
      v12->_retainedFunctions = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
    if (objc_msgSend(a4, "meshFunction"))
    {
      v12->_meshMaxCallStackDepth = objc_msgSend(a4, "maxMeshCallStackDepth");
      v13 = objc_msgSend(a4, "meshFunction");
      v12->_meshFunctionData = -[MTLGPUDebugImageData initWithFunction:debugInstrumentationData:]([MTLGPUDebugImageData alloc], "initWithFunction:debugInstrumentationData:", v13, objc_msgSend(a3, "meshDebugInstrumentationData"));
      -[NSMutableArray addObject:](v12->_retainedFunctions, "addObject:", v13);
    }
    if (objc_msgSend(a4, "objectFunction"))
    {
      v12->_objectMaxCallStackDepth = objc_msgSend(a4, "maxObjectCallStackDepth");
      v14 = objc_msgSend(a4, "objectFunction");
      v12->_objectFunctionData = -[MTLGPUDebugImageData initWithFunction:debugInstrumentationData:]([MTLGPUDebugImageData alloc], "initWithFunction:debugInstrumentationData:", v14, objc_msgSend(a3, "objectDebugInstrumentationData"));
      -[NSMutableArray addObject:](v12->_retainedFunctions, "addObject:", v14);
    }
    if (objc_msgSend(a4, "fragmentFunction"))
    {
      v12->_fragmentMaxCallStackDepth = objc_msgSend(a4, "maxFragmentCallStackDepth");
      v15 = objc_msgSend(a4, "fragmentFunction");
      v12->_fragmentFunctionData = -[MTLGPUDebugImageData initWithFunction:debugInstrumentationData:]([MTLGPUDebugImageData alloc], "initWithFunction:debugInstrumentationData:", v15, objc_msgSend(a3, "fragmentDebugInstrumentationData"));
      -[NSMutableArray addObject:](v12->_retainedFunctions, "addObject:", v15);
    }
    v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "meshLinkedFunctions"), "binaryFunctions"), "count");
    v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectLinkedFunctions"), "binaryFunctions"), "count")
        + v16;
    v18 = objc_msgSend((id)objc_msgSend(a4, "meshPreloadedLibraries"), "count");
    v19 = v17 + v18 + objc_msgSend((id)objc_msgSend(a4, "objectPreloadedLibraries"), "count");
    if (v19)
    {
      v12->_binaryFunctionData = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v19);
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v20 = (void *)objc_msgSend((id)objc_msgSend(a4, "meshLinkedFunctions"), "binaryFunctions");
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v75;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v75 != v23)
              objc_enumerationMutation(v20);
            -[NSMutableArray addObject:](v12->_binaryFunctionData, "addObject:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i) + 48));
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
        }
        while (v22);
      }
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v25 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectLinkedFunctions"), "binaryFunctions");
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v71;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v71 != v28)
              objc_enumerationMutation(v25);
            -[NSMutableArray addObject:](v12->_binaryFunctionData, "addObject:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j) + 48));
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
        }
        while (v27);
      }
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v30 = (void *)objc_msgSend((id)objc_msgSend(a4, "fragmentLinkedFunctions"), "binaryFunctions");
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v67;
        do
        {
          for (k = 0; k != v32; ++k)
          {
            if (*(_QWORD *)v67 != v33)
              objc_enumerationMutation(v30);
            -[NSMutableArray addObject:](v12->_binaryFunctionData, "addObject:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * k) + 48));
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
        }
        while (v32);
      }
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v35 = (void *)objc_msgSend(a4, "meshPreloadedLibraries");
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v81, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v63;
        do
        {
          for (m = 0; m != v37; ++m)
          {
            if (*(_QWORD *)v63 != v38)
              objc_enumerationMutation(v35);
            -[NSMutableArray addObject:](v12->_binaryFunctionData, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * m), "imageData"));
          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v81, 16);
        }
        while (v37);
      }
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v40 = (void *)objc_msgSend(a4, "objectPreloadedLibraries");
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v58, v80, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v59;
        do
        {
          for (n = 0; n != v42; ++n)
          {
            if (*(_QWORD *)v59 != v43)
              objc_enumerationMutation(v40);
            -[NSMutableArray addObject:](v12->_binaryFunctionData, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * n), "imageData"));
          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v58, v80, 16);
        }
        while (v42);
      }
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v45 = (void *)objc_msgSend(a4, "fragmentPreloadedLibraries");
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v54, v79, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v55;
        do
        {
          for (ii = 0; ii != v47; ++ii)
          {
            if (*(_QWORD *)v55 != v48)
              objc_enumerationMutation(v45);
            -[NSMutableArray addObject:](v12->_binaryFunctionData, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * ii), "imageData"));
          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v54, v79, 16);
        }
        while (v47);
      }
    }
    v12->_supportsIndirectCommandBuffers = objc_msgSend(a4, "supportIndirectCommandBuffers");
    v50 = 1;
    if ((a8 & 0x800000000) == 0)
      v50 = 2;
    v12->_shaderValidation = v50;
    v12->_shaderValidationState = v50;
    v12->_internalReflection = (MTLRenderPipelineReflection *)a6;
    if (objc_msgSend((id)objc_msgSend(a3, "objectDebugInstrumentationData"), "userReflectionData")
      || objc_msgSend((id)objc_msgSend(a3, "meshDebugInstrumentationData"), "userReflectionData")
      || objc_msgSend((id)objc_msgSend(a3, "fragmentDebugInstrumentationData"), "userReflectionData"))
    {
      v12->_userReflection = (MTLRenderPipelineReflection *)objc_msgSend(objc_alloc(MEMORY[0x24BDDD6D0]), "initWithObjectData:objectDynamicLibraries:meshData:meshDynamicLibraries:fragmentData:fragmentDynamicLibraries:device:options:flags:", objc_msgSend((id)objc_msgSend(a3, "objectDebugInstrumentationData"), "userReflectionData"), objc_msgSend((id)objc_msgSend(a3, "objectDebugInstrumentationData"), "linkedDynamicLibraries"), objc_msgSend((id)objc_msgSend(a3, "meshDebugInstrumentationData"), "userReflectionData"), objc_msgSend((id)objc_msgSend(a3, "meshDebugInstrumentationData"), "linkedDynamicLibraries"), objc_msgSend((id)objc_msgSend(a3, "fragmentDebugInstrumentationData"), "userReflectionData"), objc_msgSend(
                                                                (id)objc_msgSend(a3, "fragmentDebugInstrumentationData"),
                                                                "linkedDynamicLibraries"),
                                                              objc_msgSend(v52, "baseObject"),
                                                              a8,
                                                              0);
      objc_msgSend((id)objc_msgSend(a3, "objectDebugInstrumentationData"), "releaseLinkedDynamicLibraries");
      objc_msgSend((id)objc_msgSend(a3, "meshDebugInstrumentationData"), "releaseLinkedDynamicLibraries");
      objc_msgSend((id)objc_msgSend(a3, "fragmentDebugInstrumentationData"), "releaseLinkedDynamicLibraries");
    }
    -[MTLRenderPipelineReflection setPerformanceStatistics:](v12->_userReflection, "setPerformanceStatistics:", -[MTLRenderPipelineReflection performanceStatistics](v12->_internalReflection, "performanceStatistics"));
    -[MTLGPUDebugRenderPipelineState _initConstantsBuffer:device:](v12, "_initConstantsBuffer:device:", a3, v52);
  }
  return v12;
}

- (id)unwrapBinaryFunctions:(id)a3
{
  MTLDevice *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = -[MTLToolsRenderPipelineState device](self, "device");
  if (!objc_msgSend(a3, "count"))
    return 0;
  -[MTLDevice baseObject](v4, "baseObject");
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(a3);
        objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "baseObject"));
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  return v5;
}

- (id)functionHandleWithFunction:(id)a3 stage:(unint64_t)a4
{
  uint64_t v7;

  v7 = -[MTLToolsObject functionHandleWithFunction:stage:](self->super.super._baseObject, "functionHandleWithFunction:stage:", objc_msgSend(a3, "baseObject"), a4);
  return -[MTLToolsObjectCache getCachedObjectForKey:onMiss:](self->super.super._device->functionHandleObjectCache, "getCachedObjectForKey:onMiss:", MEMORY[0x24BDAC760], 3221225472, __67__MTLGPUDebugRenderPipelineState_functionHandleWithFunction_stage___block_invoke, &unk_24F794938, v7, self, a3, a4);
}

MTLGPUDebugFunctionHandle *__67__MTLGPUDebugRenderPipelineState_functionHandleWithFunction_stage___block_invoke(_QWORD *a1)
{
  return -[MTLGPUDebugFunctionHandle initWithFunctionHandle:renderPipelineState:stage:function:]([MTLGPUDebugFunctionHandle alloc], "initWithFunctionHandle:renderPipelineState:stage:function:", a1[4], a1[5], a1[7], a1[6]);
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 fragmentAdditionalBinaryFunctions:(id)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  MTLGPUDebugRenderPipelineState *v11;
  MTLGPUDebugRenderPipelineState *v12;
  uint64_t v14;

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setVertexAdditionalBinaryFunctions:", -[MTLGPUDebugRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", a3));
  objc_msgSend(v9, "setFragmentAdditionalBinaryFunctions:", -[MTLGPUDebugRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", a4));
  v14 = 0;
  if (!a5)
    a5 = (id *)&v14;
  v10 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithAdditionalBinaryFunctions:error:", v9, a5);

  if (!objc_msgSend(v10, "vertexDebugInstrumentationData"))
    objc_msgSend(v10, "setVertexDebugInstrumentationData:", -[MTLToolsRenderPipelineState vertexDebugInstrumentationData](self, "vertexDebugInstrumentationData"));
  if (!objc_msgSend(v10, "fragmentDebugInstrumentationData"))
    objc_msgSend(v10, "setFragmentDebugInstrumentationData:", -[MTLToolsRenderPipelineState fragmentDebugInstrumentationData](self, "fragmentDebugInstrumentationData"));
  v11 = [MTLGPUDebugRenderPipelineState alloc];
  v12 = -[MTLGPUDebugRenderPipelineState initWithRenderPipelineState:vertexBinaryFunctions:fragmentBinaryFunctions:tileBinaryFunctions:objectBinaryFunctions:meshBinaryFunctions:withState:device:pipelineOptions:](v11, "initWithRenderPipelineState:vertexBinaryFunctions:fragmentBinaryFunctions:tileBinaryFunctions:objectBinaryFunctions:meshBinaryFunctions:withState:device:pipelineOptions:", v10, a3, a4, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], self, self->super.super._device, 0, v14);

  return v12;
}

- (id)newTileRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  id v6;
  id *v7;
  void *v8;
  MTLGPUDebugRenderPipelineState *v9;
  MTLGPUDebugRenderPipelineState *v10;
  uint64_t v12;

  v6 = -[MTLGPUDebugRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", a3);
  v12 = 0;
  if (a4)
    v7 = a4;
  else
    v7 = (id *)&v12;
  v8 = (void *)-[MTLToolsObject newTileRenderPipelineStateWithAdditionalBinaryFunctions:error:](self->super.super._baseObject, "newTileRenderPipelineStateWithAdditionalBinaryFunctions:error:", v6, v7);

  if (!objc_msgSend(v8, "tileDebugInstrumentationData"))
    objc_msgSend(v8, "setTileDebugInstrumentationData:", objc_msgSend(v8, "tileDebugInstrumentationData"));
  v9 = [MTLGPUDebugRenderPipelineState alloc];
  v10 = -[MTLGPUDebugRenderPipelineState initWithRenderPipelineState:vertexBinaryFunctions:fragmentBinaryFunctions:tileBinaryFunctions:objectBinaryFunctions:meshBinaryFunctions:withState:device:pipelineOptions:](v9, "initWithRenderPipelineState:vertexBinaryFunctions:fragmentBinaryFunctions:tileBinaryFunctions:objectBinaryFunctions:meshBinaryFunctions:withState:device:pipelineOptions:", v8, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], v6, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], self, self->super.super._device, 0, v12);

  return v10;
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  MTLGPUDebugRenderPipelineState *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  MTLGPUDebugRenderPipelineState *v15;
  uint64_t v17;

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setVertexAdditionalBinaryFunctions:", -[MTLGPUDebugRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", objc_msgSend(a3, "vertexAdditionalBinaryFunctions")));
  objc_msgSend(v7, "setFragmentAdditionalBinaryFunctions:", -[MTLGPUDebugRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", objc_msgSend(a3, "fragmentAdditionalBinaryFunctions")));
  objc_msgSend(v7, "setTileAdditionalBinaryFunctions:", -[MTLGPUDebugRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", objc_msgSend(a3, "tileAdditionalBinaryFunctions")));
  objc_msgSend(v7, "setObjectAdditionalBinaryFunctions:", -[MTLGPUDebugRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", objc_msgSend(a3, "objectAdditionalBinaryFunctions")));
  objc_msgSend(v7, "setMeshAdditionalBinaryFunctions:", -[MTLGPUDebugRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", objc_msgSend(a3, "meshAdditionalBinaryFunctions")));
  v17 = 0;
  if (!a4)
    a4 = (id *)&v17;
  v8 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithAdditionalBinaryFunctions:error:", v7, a4);

  if (!objc_msgSend(v8, "vertexDebugInstrumentationData"))
    objc_msgSend(v8, "setVertexDebugInstrumentationData:", -[MTLToolsRenderPipelineState vertexDebugInstrumentationData](self, "vertexDebugInstrumentationData"));
  if (!objc_msgSend(v8, "fragmentDebugInstrumentationData"))
    objc_msgSend(v8, "setFragmentDebugInstrumentationData:", -[MTLToolsRenderPipelineState fragmentDebugInstrumentationData](self, "fragmentDebugInstrumentationData"));
  if (!objc_msgSend(v8, "tileDebugInstrumentationData"))
    objc_msgSend(v8, "setTileDebugInstrumentationData:", -[MTLToolsRenderPipelineState tileDebugInstrumentationData](self, "tileDebugInstrumentationData"));
  if (!objc_msgSend(v8, "objectDebugInstrumentationData"))
    objc_msgSend(v8, "setObjectDebugInstrumentationData:", -[MTLToolsRenderPipelineState objectDebugInstrumentationData](self, "objectDebugInstrumentationData"));
  if (!objc_msgSend(v8, "meshDebugInstrumentationData"))
    objc_msgSend(v8, "setMeshDebugInstrumentationData:", -[MTLToolsRenderPipelineState meshDebugInstrumentationData](self, "meshDebugInstrumentationData"));
  v9 = [MTLGPUDebugRenderPipelineState alloc];
  v10 = objc_msgSend(a3, "vertexAdditionalBinaryFunctions");
  v11 = objc_msgSend(a3, "fragmentAdditionalBinaryFunctions");
  v12 = objc_msgSend(a3, "tileAdditionalBinaryFunctions");
  v13 = objc_msgSend(a3, "objectAdditionalBinaryFunctions");
  v14 = objc_msgSend(a3, "meshAdditionalBinaryFunctions");
  v15 = -[MTLGPUDebugRenderPipelineState initWithRenderPipelineState:vertexBinaryFunctions:fragmentBinaryFunctions:tileBinaryFunctions:objectBinaryFunctions:meshBinaryFunctions:withState:device:pipelineOptions:](v9, "initWithRenderPipelineState:vertexBinaryFunctions:fragmentBinaryFunctions:tileBinaryFunctions:objectBinaryFunctions:meshBinaryFunctions:withState:device:pipelineOptions:", v8, v10, v11, v12, v13, v14, self, self->super.super._device, 0, v17);

  return v15;
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  id result;
  id v8;
  MTLGPUDebugVisibleFunctionTable *v9;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newVisibleFunctionTableWithDescriptor:stage:", a3, a4);
  if (result)
  {
    v8 = result;
    v9 = -[MTLGPUDebugVisibleFunctionTable initWithVisibleFunctionTable:descriptor:renderPipeline:stage:]([MTLGPUDebugVisibleFunctionTable alloc], "initWithVisibleFunctionTable:descriptor:renderPipeline:stage:", result, a3, self, a4);

    return v9;
  }
  return result;
}

- (id)newVisibleFunctionTableFromVertexStageWithDescriptor:(id)a3
{
  return -[MTLGPUDebugRenderPipelineState newVisibleFunctionTableWithDescriptor:stage:](self, "newVisibleFunctionTableWithDescriptor:stage:", a3, 1);
}

- (id)newVisibleFunctionTableFromFragmentStageWithDescriptor:(id)a3
{
  return -[MTLGPUDebugRenderPipelineState newVisibleFunctionTableWithDescriptor:stage:](self, "newVisibleFunctionTableWithDescriptor:stage:", a3, 2);
}

- (id)newVisibleFunctionTableFromTileStageWithDescriptor:(id)a3
{
  return -[MTLGPUDebugRenderPipelineState newVisibleFunctionTableWithDescriptor:stage:](self, "newVisibleFunctionTableWithDescriptor:stage:", a3, 4);
}

- (id)newVisibleFunctionTableFromObjectStageWithDescriptor:(id)a3
{
  return -[MTLGPUDebugRenderPipelineState newVisibleFunctionTableWithDescriptor:stage:](self, "newVisibleFunctionTableWithDescriptor:stage:", a3, 8);
}

- (id)newVisibleFunctionTableFromMeshStageWithDescriptor:(id)a3
{
  return -[MTLGPUDebugRenderPipelineState newVisibleFunctionTableWithDescriptor:stage:](self, "newVisibleFunctionTableWithDescriptor:stage:", a3, 16);
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  id result;
  id v8;
  MTLGPUDebugIntersectionFunctionTable *v9;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIntersectionFunctionTableWithDescriptor:stage:", a3, a4);
  if (result)
  {
    v8 = result;
    v9 = -[MTLGPUDebugIntersectionFunctionTable initWithIntersectionFunctionTable:device:descriptor:renderPipelineState:stage:]([MTLGPUDebugIntersectionFunctionTable alloc], "initWithIntersectionFunctionTable:device:descriptor:renderPipelineState:stage:", result, -[MTLToolsRenderPipelineState device](self, "device"), a3, self, a4);

    return v9;
  }
  return result;
}

- (id)newVertexIntersectionFunctionTableWithDescriptor:(id)a3
{
  return -[MTLGPUDebugRenderPipelineState newIntersectionFunctionTableWithDescriptor:stage:](self, "newIntersectionFunctionTableWithDescriptor:stage:", a3, 1);
}

- (id)newFragmentIntersectionFunctionTableWithDescriptor:(id)a3
{
  return -[MTLGPUDebugRenderPipelineState newIntersectionFunctionTableWithDescriptor:stage:](self, "newIntersectionFunctionTableWithDescriptor:stage:", a3, 2);
}

- (id)newTileIntersectionFunctionTableWithDescriptor:(id)a3
{
  return -[MTLGPUDebugRenderPipelineState newIntersectionFunctionTableWithDescriptor:stage:](self, "newIntersectionFunctionTableWithDescriptor:stage:", a3, 4);
}

- (id)newObjectIntersectionFunctionTableWithDescriptor:(id)a3
{
  return -[MTLGPUDebugRenderPipelineState newIntersectionFunctionTableWithDescriptor:stage:](self, "newIntersectionFunctionTableWithDescriptor:stage:", a3, 8);
}

- (id)newMeshIntersectionFunctionTableWithDescriptor:(id)a3
{
  return -[MTLGPUDebugRenderPipelineState newIntersectionFunctionTableWithDescriptor:stage:](self, "newIntersectionFunctionTableWithDescriptor:stage:", a3, 16);
}

- (void)releaseReflection
{

  self->_internalReflection = 0;
  self->_userReflection = 0;
}

- (MTLGPUDebugImageData)vertexFunctionData
{
  return self->_vertexFunctionData;
}

- (MTLGPUDebugImageData)fragmentFunctionData
{
  return self->_fragmentFunctionData;
}

- (MTLGPUDebugImageData)tileFunctionData
{
  return self->_tileFunctionData;
}

- (MTLGPUDebugImageData)objectFunctionData
{
  return self->_objectFunctionData;
}

- (MTLGPUDebugImageData)meshFunctionData
{
  return self->_meshFunctionData;
}

- (MTLRenderPipelineReflection)internalReflection
{
  return self->_internalReflection;
}

- (MTLRenderPipelineReflection)userReflection
{
  return self->_userReflection;
}

- (MTLGPUDebugBuffer)vertexConstantsBuffer
{
  MTLGPUDebugImageData *vertexFunctionData;

  vertexFunctionData = self->_vertexFunctionData;
  if (vertexFunctionData)
    return (MTLGPUDebugBuffer *)*((_QWORD *)vertexFunctionData + 1);
  else
    return 0;
}

- (MTLGPUDebugBuffer)fragmentConstantsBuffer
{
  MTLGPUDebugImageData *fragmentFunctionData;

  fragmentFunctionData = self->_fragmentFunctionData;
  if (fragmentFunctionData)
    return (MTLGPUDebugBuffer *)*((_QWORD *)fragmentFunctionData + 1);
  else
    return 0;
}

- (MTLGPUDebugBuffer)tileConstantsBuffer
{
  MTLGPUDebugImageData *tileFunctionData;

  tileFunctionData = self->_tileFunctionData;
  if (tileFunctionData)
    return (MTLGPUDebugBuffer *)*((_QWORD *)tileFunctionData + 1);
  else
    return 0;
}

- (MTLGPUDebugBuffer)objectConstantsBuffer
{
  MTLGPUDebugImageData *objectFunctionData;

  objectFunctionData = self->_objectFunctionData;
  if (objectFunctionData)
    return (MTLGPUDebugBuffer *)*((_QWORD *)objectFunctionData + 1);
  else
    return 0;
}

- (MTLGPUDebugBuffer)meshConstantsBuffer
{
  MTLGPUDebugImageData *meshFunctionData;

  meshFunctionData = self->_meshFunctionData;
  if (meshFunctionData)
    return (MTLGPUDebugBuffer *)*((_QWORD *)meshFunctionData + 1);
  else
    return 0;
}

- (MTLGPUDebugBuffer)indirectStateBuffer
{
  return self->_indirectStateBuffer;
}

- (void)dealloc
{
  NSMutableArray *binaryFunctionData;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_supportsIndirectCommandBuffers)
  {
    GlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, (uint64_t)self->_indirectStateBuffer);

    if (-[MTLGPUDebugRenderPipelineState vertexConstantsBuffer](self, "vertexConstantsBuffer"))
      GlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, (uint64_t)-[MTLGPUDebugRenderPipelineState vertexConstantsBuffer](self, "vertexConstantsBuffer"));
    if (-[MTLGPUDebugRenderPipelineState fragmentConstantsBuffer](self, "fragmentConstantsBuffer"))
      GlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, (uint64_t)-[MTLGPUDebugRenderPipelineState fragmentConstantsBuffer](self, "fragmentConstantsBuffer"));
    if (-[MTLGPUDebugRenderPipelineState tileConstantsBuffer](self, "tileConstantsBuffer"))
      GlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, (uint64_t)-[MTLGPUDebugRenderPipelineState tileConstantsBuffer](self, "tileConstantsBuffer"));
    if (-[MTLGPUDebugRenderPipelineState objectConstantsBuffer](self, "objectConstantsBuffer"))
      GlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, (uint64_t)-[MTLGPUDebugRenderPipelineState objectConstantsBuffer](self, "objectConstantsBuffer"));
    if (-[MTLGPUDebugRenderPipelineState meshConstantsBuffer](self, "meshConstantsBuffer"))
      GlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, (uint64_t)-[MTLGPUDebugRenderPipelineState meshConstantsBuffer](self, "meshConstantsBuffer"));
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    binaryFunctionData = self->_binaryFunctionData;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](binaryFunctionData, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(binaryFunctionData);
          v8 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i) + 8);
          if (v8)
            GlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, v8);
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](binaryFunctionData, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }
  }

  v9.receiver = self;
  v9.super_class = (Class)MTLGPUDebugRenderPipelineState;
  -[MTLToolsRenderPipelineState dealloc](&v9, sel_dealloc);
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

- (int)vertexMaxCallStackDepth
{
  return self->_vertexMaxCallStackDepth;
}

- (int)fragmentMaxCallStackDepth
{
  return self->_fragmentMaxCallStackDepth;
}

- (int)meshMaxCallStackDepth
{
  return self->_meshMaxCallStackDepth;
}

- (int)objectMaxCallStackDepth
{
  return self->_objectMaxCallStackDepth;
}

- (int)tileMaxCallStackDepth
{
  return self->_tileMaxCallStackDepth;
}

- (NSString)UID
{
  return self->_UID;
}

- (void)setUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

@end
