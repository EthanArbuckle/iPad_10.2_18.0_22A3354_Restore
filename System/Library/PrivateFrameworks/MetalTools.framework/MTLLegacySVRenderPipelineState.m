@implementation MTLLegacySVRenderPipelineState

- (void)_initConstantsBuffer:(id)a3 device:(id)a4
{
  MTLLegacySVPipelineStateInfoEncoder *v7;
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
  -[MTLLegacySVImageData setConstantData:](self->_vertexFunctionData, "setConstantData:", objc_msgSend((id)objc_msgSend(a3, "vertexDebugInstrumentationData"), "globalConstantsData"));
  -[MTLLegacySVImageData setConstantData:](self->_fragmentFunctionData, "setConstantData:", objc_msgSend((id)objc_msgSend(a3, "fragmentDebugInstrumentationData"), "globalConstantsData"));
  -[MTLLegacySVImageData setConstantData:](self->_tileFunctionData, "setConstantData:", objc_msgSend((id)objc_msgSend(a3, "tileDebugInstrumentationData"), "globalConstantsData"));
  -[MTLLegacySVImageData setConstantData:](self->_objectFunctionData, "setConstantData:", objc_msgSend((id)objc_msgSend(a3, "objectDebugInstrumentationData"), "globalConstantsData"));
  -[MTLLegacySVImageData setConstantData:](self->_meshFunctionData, "setConstantData:", objc_msgSend((id)objc_msgSend(a3, "meshDebugInstrumentationData"), "globalConstantsData"));
  if (self->_supportsIndirectCommandBuffers
    && (HIBYTE(self->super.super._device[2].dynamicLibraryObjectCache) & 0x20) != 0)
  {
    v7 = -[MTLLegacySVPipelineStateInfoEncoder initWithDevice:]([MTLLegacySVPipelineStateInfoEncoder alloc], "initWithDevice:", self->super.super._device);
    v8 = (void *)objc_msgSend((id)objc_msgSend(a4, "baseObject"), "newBufferWithLength:options:", -[MTLLegacySVPipelineStateInfoEncoder encodedLength](v7, "encodedLength"), 0);
    self->_indirectStateBuffer = -[MTLLegacySVBuffer initWithBuffer:device:offset:length:track:]([MTLLegacySVBuffer alloc], "initWithBuffer:device:offset:length:track:", v8, a4, 0, objc_msgSend(v8, "length"), 0);

    -[MTLLegacySVPipelineStateInfoEncoder setArgumentBuffer:offset:](v7, "setArgumentBuffer:offset:", self->_indirectStateBuffer, 0);
    -[MTLLegacySVPipelineStateInfoEncoder setRenderPipelineState:](v7, "setRenderPipelineState:", self);

    if (-[MTLLegacySVRenderPipelineState vertexConstantsBuffer](self, "vertexConstantsBuffer"))
      LegacySVGlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, (uint64_t)-[MTLLegacySVRenderPipelineState vertexConstantsBuffer](self, "vertexConstantsBuffer"));
    if (-[MTLLegacySVRenderPipelineState fragmentConstantsBuffer](self, "fragmentConstantsBuffer"))
      LegacySVGlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, (uint64_t)-[MTLLegacySVRenderPipelineState fragmentConstantsBuffer](self, "fragmentConstantsBuffer"));
    if (-[MTLLegacySVRenderPipelineState tileConstantsBuffer](self, "tileConstantsBuffer"))
      LegacySVGlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, (uint64_t)-[MTLLegacySVRenderPipelineState tileConstantsBuffer](self, "tileConstantsBuffer"));
    if (-[MTLLegacySVRenderPipelineState objectConstantsBuffer](self, "objectConstantsBuffer"))
      LegacySVGlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, (uint64_t)-[MTLLegacySVRenderPipelineState objectConstantsBuffer](self, "objectConstantsBuffer"));
    if (-[MTLLegacySVRenderPipelineState meshConstantsBuffer](self, "meshConstantsBuffer"))
      LegacySVGlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, (uint64_t)-[MTLLegacySVRenderPipelineState meshConstantsBuffer](self, "meshConstantsBuffer"));
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
            LegacySVGlobalResidentBufferList::addBuffer((uint64_t)&self->super.super._device[4]._memorySize, v14);
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](binaryFunctionData, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }
    LegacySVGlobalResidentBufferList::addBuffer((uint64_t)a4 + 552, (uint64_t)self->_indirectStateBuffer);
  }
}

- (MTLLegacySVRenderPipelineState)initWithRenderPipelineState:(id)a3 descriptor:(id)a4 unwrappedDescriptor:(id)a5 reflection:(id)a6 device:(id)a7 pipelineOptions:(unint64_t)a8
{
  _BYTE *v9;
  MTLLegacySVRenderPipelineState *v14;
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
  NSObject *v44;
  _BYTE *v46;
  unint64_t v47;
  id v48;
  uint64_t v49;
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
  objc_super v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v9 = a7;
  v71 = *MEMORY[0x24BDAC8D0];
  v66.receiver = self;
  v66.super_class = (Class)MTLLegacySVRenderPipelineState;
  v14 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:](&v66, sel_initWithBaseObject_parent_, a3, a7);
  if (v14)
  {
    if ((v9[292] & 2) != 0)
      v14->_retainedFunctions = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
    if (objc_msgSend(a4, "vertexFunction"))
    {
      v14->_vertexMaxCallStackDepth = objc_msgSend(a4, "maxVertexCallStackDepth");
      v15 = objc_msgSend(a4, "vertexFunction");
      v14->_vertexFunctionData = -[MTLLegacySVImageData initWithFunction:debugInstrumentationData:]([MTLLegacySVImageData alloc], "initWithFunction:debugInstrumentationData:", v15, objc_msgSend(a3, "vertexDebugInstrumentationData"));
      -[NSMutableArray addObject:](v14->_retainedFunctions, "addObject:", v15);
    }
    if (objc_msgSend(a4, "fragmentFunction"))
    {
      v14->_fragmentMaxCallStackDepth = objc_msgSend(a4, "maxFragmentCallStackDepth");
      v16 = objc_msgSend(a4, "fragmentFunction");
      v14->_fragmentFunctionData = -[MTLLegacySVImageData initWithFunction:debugInstrumentationData:]([MTLLegacySVImageData alloc], "initWithFunction:debugInstrumentationData:", v16, objc_msgSend(a3, "fragmentDebugInstrumentationData"));
      -[NSMutableArray addObject:](v14->_retainedFunctions, "addObject:", v16);
    }
    v48 = a6;
    if (objc_msgSend(a4, "meshFunction"))
    {
      v14->_meshMaxCallStackDepth = objc_msgSend(a4, "maxMeshCallStackDepth");
      v17 = objc_msgSend(a4, "meshFunction");
      v14->_meshFunctionData = -[MTLLegacySVImageData initWithFunction:debugInstrumentationData:]([MTLLegacySVImageData alloc], "initWithFunction:debugInstrumentationData:", v17, objc_msgSend(a3, "meshDebugInstrumentationData"));
      -[NSMutableArray addObject:](v14->_retainedFunctions, "addObject:", v17);
    }
    if (objc_msgSend(a4, "objectFunction"))
    {
      v14->_objectMaxCallStackDepth = objc_msgSend(a4, "maxObjectCallStackDepth");
      v18 = objc_msgSend(a4, "objectFunction");
      v14->_objectFunctionData = -[MTLLegacySVImageData initWithFunction:debugInstrumentationData:]([MTLLegacySVImageData alloc], "initWithFunction:debugInstrumentationData:", v18, objc_msgSend(a3, "objectDebugInstrumentationData"));
      -[NSMutableArray addObject:](v14->_retainedFunctions, "addObject:", v18);
    }
    v14->_supportsIndirectCommandBuffers = objc_msgSend(a4, "supportIndirectCommandBuffers");
    v47 = a8;
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
      v46 = v9;
      v14->_binaryFunctionData = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v23);
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v24 = (void *)objc_msgSend((id)objc_msgSend(a4, "vertexLinkedFunctions"), "binaryFunctions");
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v63 != v27)
              objc_enumerationMutation(v24);
            -[NSMutableArray addObject:](v14->_binaryFunctionData, "addObject:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i) + 48));
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
        }
        while (v26);
      }
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v29 = (void *)objc_msgSend((id)objc_msgSend(a4, "fragmentLinkedFunctions"), "binaryFunctions");
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v59;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v59 != v32)
              objc_enumerationMutation(v29);
            -[NSMutableArray addObject:](v14->_binaryFunctionData, "addObject:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j) + 48));
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
        }
        while (v31);
      }
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v34 = (void *)objc_msgSend(a4, "vertexPreloadedLibraries");
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
      v9 = v46;
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v55;
        do
        {
          for (k = 0; k != v36; ++k)
          {
            if (*(_QWORD *)v55 != v37)
              objc_enumerationMutation(v34);
            -[NSMutableArray addObject:](v14->_binaryFunctionData, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * k), "imageData"));
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
        }
        while (v36);
      }
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v39 = (void *)objc_msgSend(a4, "fragmentPreloadedLibraries");
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v51;
        do
        {
          for (m = 0; m != v41; ++m)
          {
            if (*(_QWORD *)v51 != v42)
              objc_enumerationMutation(v39);
            -[NSMutableArray addObject:](v14->_binaryFunctionData, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * m), "imageData"));
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
        }
        while (v41);
      }
    }
    v14->_internalReflection = (MTLRenderPipelineReflection *)v48;
    if (objc_msgSend((id)objc_msgSend(a3, "vertexDebugInstrumentationData"), "userReflectionData")
      || objc_msgSend((id)objc_msgSend(a3, "fragmentDebugInstrumentationData"), "userReflectionData"))
    {
      v49 = 0;
      v44 = objc_msgSend(a5, "newSerializedVertexDataWithFlags:options:error:", 28, v47, &v49);
      v14->_userReflection = (MTLRenderPipelineReflection *)objc_msgSend(objc_alloc(MEMORY[0x24BDDD6D0]), "initWithVertexData:fragmentData:serializedVertexDescriptor:device:options:flags:", objc_msgSend((id)objc_msgSend(a3, "vertexDebugInstrumentationData"), "userReflectionData"), objc_msgSend((id)objc_msgSend(a3, "fragmentDebugInstrumentationData"), "userReflectionData"), v44, objc_msgSend(v9, "baseObject"), v47, 0);
      dispatch_release(v44);
    }
    -[MTLRenderPipelineReflection setPerformanceStatistics:](v14->_userReflection, "setPerformanceStatistics:", -[MTLRenderPipelineReflection performanceStatistics](v14->_internalReflection, "performanceStatistics"));
    -[MTLLegacySVRenderPipelineState _initConstantsBuffer:device:](v14, "_initConstantsBuffer:device:", a3, v9);
  }
  return v14;
}

- (MTLLegacySVRenderPipelineState)initWithRenderPipelineState:(id)a3 vertexBinaryFunctions:(id)a4 fragmentBinaryFunctions:(id)a5 tileBinaryFunctions:(id)a6 objectBinaryFunctions:(id)a7 meshBinaryFunctions:(id)a8 withState:(id)a9 device:(id)a10 pipelineOptions:(unint64_t)a11
{
  MTLLegacySVRenderPipelineState *v17;
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
  v68.super_class = (Class)MTLLegacySVRenderPipelineState;
  v17 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:](&v68, sel_initWithBaseObject_parent_, a3, a10);
  if (v17)
  {
    objc_msgSend(a4, "count");
    objc_msgSend(a5, "count");
    objc_msgSend(a6, "count");
    objc_msgSend(a7, "count");
    objc_msgSend(a8, "count");
    v17->_vertexFunctionData = (MTLLegacySVImageData *)*((id *)a9 + 8);
    v17->_fragmentFunctionData = (MTLLegacySVImageData *)*((id *)a9 + 9);
    v17->_tileFunctionData = (MTLLegacySVImageData *)*((id *)a9 + 10);
    v17->_objectFunctionData = (MTLLegacySVImageData *)*((id *)a9 + 11);
    v17->_meshFunctionData = (MTLLegacySVImageData *)*((id *)a9 + 12);
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
    -[MTLLegacySVRenderPipelineState _initConstantsBuffer:device:](v17, "_initConstantsBuffer:device:", a3, v17->super.super._device);
  }
  return v17;
}

- (MTLLegacySVRenderPipelineState)initWithRenderPipelineState:(id)a3 tileDescriptor:(id)a4 reflection:(id)a5 device:(id)a6 pipelineOptions:(unint64_t)a7
{
  MTLLegacySVRenderPipelineState *v12;
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
  v38.super_class = (Class)MTLLegacySVRenderPipelineState;
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
      v12->_tileFunctionData = -[MTLLegacySVImageData initWithFunction:debugInstrumentationData:]([MTLLegacySVImageData alloc], "initWithFunction:debugInstrumentationData:", v13, objc_msgSend(a3, "tileDebugInstrumentationData"));
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
    v12->_userReflection = (MTLRenderPipelineReflection *)objc_msgSend(objc_alloc(MEMORY[0x24BDDD6D0]), "initWithTileData:functionType:device:options:flags:", objc_msgSend((id)objc_msgSend(a3, "tileDebugInstrumentationData"), "userReflectionData"), objc_msgSend((id)objc_msgSend(a4, "tileFunction"), "functionType"), objc_msgSend(a6, "baseObject"), 3, 0);
    -[MTLRenderPipelineReflection setPerformanceStatistics:](v12->_userReflection, "setPerformanceStatistics:", -[MTLRenderPipelineReflection performanceStatistics](v12->_internalReflection, "performanceStatistics"));
    -[MTLLegacySVRenderPipelineState _initConstantsBuffer:device:](v12, "_initConstantsBuffer:device:", a3, a6);
  }
  return v12;
}

- (MTLLegacySVRenderPipelineState)initWithRenderPipelineState:(id)a3 meshDescriptor:(id)a4 unwrappedDescriptor:(id)a5 reflection:(id)a6 device:(id)a7 pipelineOptions:(unint64_t)a8
{
  MTLLegacySVRenderPipelineState *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t n;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t ii;
  uint64_t v51;
  id v53;
  void *v54;
  unint64_t v55;
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
  __int128 v78;
  __int128 v79;
  objc_super v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v80.receiver = self;
  v80.super_class = (Class)MTLLegacySVRenderPipelineState;
  v13 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:](&v80, sel_initWithBaseObject_parent_, a3, a7, a5);
  if (v13)
  {
    v53 = a6;
    if ((*((_BYTE *)a7 + 292) & 2) != 0)
      v13->_retainedFunctions = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2, a6);
    if (objc_msgSend(a4, "meshFunction", v53))
    {
      v13->_meshMaxCallStackDepth = objc_msgSend(a4, "maxMeshCallStackDepth");
      v14 = objc_msgSend(a4, "meshFunction");
      v13->_meshFunctionData = -[MTLLegacySVImageData initWithFunction:debugInstrumentationData:]([MTLLegacySVImageData alloc], "initWithFunction:debugInstrumentationData:", v14, objc_msgSend(a3, "meshDebugInstrumentationData"));
      -[NSMutableArray addObject:](v13->_retainedFunctions, "addObject:", v14);
    }
    if (objc_msgSend(a4, "objectFunction"))
    {
      v13->_objectMaxCallStackDepth = objc_msgSend(a4, "maxObjectCallStackDepth");
      v15 = objc_msgSend(a4, "objectFunction");
      v13->_objectFunctionData = -[MTLLegacySVImageData initWithFunction:debugInstrumentationData:]([MTLLegacySVImageData alloc], "initWithFunction:debugInstrumentationData:", v15, objc_msgSend(a3, "objectDebugInstrumentationData"));
      -[NSMutableArray addObject:](v13->_retainedFunctions, "addObject:", v15);
    }
    v55 = a8;
    if (objc_msgSend(a4, "fragmentFunction"))
    {
      v13->_fragmentMaxCallStackDepth = objc_msgSend(a4, "maxFragmentCallStackDepth");
      v16 = objc_msgSend(a4, "fragmentFunction");
      v13->_fragmentFunctionData = -[MTLLegacySVImageData initWithFunction:debugInstrumentationData:]([MTLLegacySVImageData alloc], "initWithFunction:debugInstrumentationData:", v16, objc_msgSend(a3, "fragmentDebugInstrumentationData"));
      -[NSMutableArray addObject:](v13->_retainedFunctions, "addObject:", v16);
    }
    v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "meshLinkedFunctions"), "binaryFunctions"), "count");
    v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectLinkedFunctions"), "binaryFunctions"), "count")
        + v17;
    v19 = objc_msgSend((id)objc_msgSend(a4, "meshPreloadedLibraries"), "count");
    v20 = v18 + v19 + objc_msgSend((id)objc_msgSend(a4, "objectPreloadedLibraries"), "count");
    if (v20)
    {
      v13->_binaryFunctionData = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v20);
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v21 = (void *)objc_msgSend((id)objc_msgSend(a4, "meshLinkedFunctions"), "binaryFunctions");
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v77;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v77 != v24)
              objc_enumerationMutation(v21);
            -[NSMutableArray addObject:](v13->_binaryFunctionData, "addObject:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i) + 48));
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
        }
        while (v23);
      }
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v26 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectLinkedFunctions"), "binaryFunctions");
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v73;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v73 != v29)
              objc_enumerationMutation(v26);
            -[NSMutableArray addObject:](v13->_binaryFunctionData, "addObject:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * j) + 48));
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
        }
        while (v28);
      }
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v31 = (void *)objc_msgSend((id)objc_msgSend(a4, "fragmentLinkedFunctions"), "binaryFunctions");
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v69;
        do
        {
          for (k = 0; k != v33; ++k)
          {
            if (*(_QWORD *)v69 != v34)
              objc_enumerationMutation(v31);
            -[NSMutableArray addObject:](v13->_binaryFunctionData, "addObject:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * k) + 48));
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
        }
        while (v33);
      }
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v36 = (void *)objc_msgSend(a4, "meshPreloadedLibraries");
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v65;
        do
        {
          for (m = 0; m != v38; ++m)
          {
            if (*(_QWORD *)v65 != v39)
              objc_enumerationMutation(v36);
            -[NSMutableArray addObject:](v13->_binaryFunctionData, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * m), "imageData"));
          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
        }
        while (v38);
      }
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v41 = (void *)objc_msgSend(a4, "objectPreloadedLibraries");
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v61;
        do
        {
          for (n = 0; n != v43; ++n)
          {
            if (*(_QWORD *)v61 != v44)
              objc_enumerationMutation(v41);
            -[NSMutableArray addObject:](v13->_binaryFunctionData, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * n), "imageData"));
          }
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v60, v82, 16);
        }
        while (v43);
      }
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v46 = (void *)objc_msgSend(a4, "fragmentPreloadedLibraries");
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v56, v81, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v57;
        do
        {
          for (ii = 0; ii != v48; ++ii)
          {
            if (*(_QWORD *)v57 != v49)
              objc_enumerationMutation(v46);
            -[NSMutableArray addObject:](v13->_binaryFunctionData, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * ii), "imageData"));
          }
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v56, v81, 16);
        }
        while (v48);
      }
    }
    v13->_supportsIndirectCommandBuffers = objc_msgSend(a4, "supportIndirectCommandBuffers");
    v51 = 1;
    if ((v55 & 0x800000000) == 0)
      v51 = 2;
    v13->_shaderValidation = v51;
    v13->_shaderValidationState = v51;
    v13->_internalReflection = (MTLRenderPipelineReflection *)v54;
    if (objc_msgSend((id)objc_msgSend(a3, "objectDebugInstrumentationData"), "userReflectionData")
      || objc_msgSend((id)objc_msgSend(a3, "meshDebugInstrumentationData"), "userReflectionData")
      || objc_msgSend((id)objc_msgSend(a3, "fragmentDebugInstrumentationData"), "userReflectionData"))
    {
      v13->_userReflection = (MTLRenderPipelineReflection *)objc_msgSend(objc_alloc(MEMORY[0x24BDDD6D0]), "initWithObjectData:meshData:fragmentData:device:options:flags:", objc_msgSend((id)objc_msgSend(a3, "objectDebugInstrumentationData"), "userReflectionData"), objc_msgSend((id)objc_msgSend(a3, "meshDebugInstrumentationData"), "userReflectionData"), objc_msgSend((id)objc_msgSend(a3, "fragmentDebugInstrumentationData"), "userReflectionData"), objc_msgSend(a7, "baseObject"), v55, 0);
    }
    -[MTLRenderPipelineReflection setPerformanceStatistics:](v13->_userReflection, "setPerformanceStatistics:", -[MTLRenderPipelineReflection performanceStatistics](v13->_internalReflection, "performanceStatistics"));
    -[MTLLegacySVRenderPipelineState _initConstantsBuffer:device:](v13, "_initConstantsBuffer:device:", a3, a7);
  }
  return v13;
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
  return -[MTLToolsObjectCache getCachedObjectForKey:onMiss:](self->super.super._device->functionHandleObjectCache, "getCachedObjectForKey:onMiss:", MEMORY[0x24BDAC760], 3221225472, __67__MTLLegacySVRenderPipelineState_functionHandleWithFunction_stage___block_invoke, &unk_24F794938, v7, self, a3, a4);
}

MTLLegacySVFunctionHandle *__67__MTLLegacySVRenderPipelineState_functionHandleWithFunction_stage___block_invoke(_QWORD *a1)
{
  return -[MTLLegacySVFunctionHandle initWithFunctionHandle:renderPipelineState:stage:function:]([MTLLegacySVFunctionHandle alloc], "initWithFunctionHandle:renderPipelineState:stage:function:", a1[4], a1[5], a1[7], a1[6]);
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 fragmentAdditionalBinaryFunctions:(id)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  MTLLegacySVRenderPipelineState *v11;
  MTLLegacySVRenderPipelineState *v12;
  uint64_t v14;

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setVertexAdditionalBinaryFunctions:", -[MTLLegacySVRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", a3));
  objc_msgSend(v9, "setFragmentAdditionalBinaryFunctions:", -[MTLLegacySVRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", a4));
  v14 = 0;
  if (!a5)
    a5 = (id *)&v14;
  v10 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithAdditionalBinaryFunctions:error:", v9, a5);

  if (!objc_msgSend(v10, "vertexDebugInstrumentationData"))
    objc_msgSend(v10, "setVertexDebugInstrumentationData:", -[MTLToolsRenderPipelineState vertexDebugInstrumentationData](self, "vertexDebugInstrumentationData"));
  if (!objc_msgSend(v10, "fragmentDebugInstrumentationData"))
    objc_msgSend(v10, "setFragmentDebugInstrumentationData:", -[MTLToolsRenderPipelineState fragmentDebugInstrumentationData](self, "fragmentDebugInstrumentationData"));
  v11 = [MTLLegacySVRenderPipelineState alloc];
  v12 = -[MTLLegacySVRenderPipelineState initWithRenderPipelineState:vertexBinaryFunctions:fragmentBinaryFunctions:tileBinaryFunctions:objectBinaryFunctions:meshBinaryFunctions:withState:device:pipelineOptions:](v11, "initWithRenderPipelineState:vertexBinaryFunctions:fragmentBinaryFunctions:tileBinaryFunctions:objectBinaryFunctions:meshBinaryFunctions:withState:device:pipelineOptions:", v10, a3, a4, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], self, self->super.super._device, 0, v14);

  return v12;
}

- (id)newTileRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  id v6;
  id *v7;
  void *v8;
  MTLLegacySVRenderPipelineState *v9;
  MTLLegacySVRenderPipelineState *v10;
  uint64_t v12;

  v6 = -[MTLLegacySVRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", a3);
  v12 = 0;
  if (a4)
    v7 = a4;
  else
    v7 = (id *)&v12;
  v8 = (void *)-[MTLToolsObject newTileRenderPipelineStateWithAdditionalBinaryFunctions:error:](self->super.super._baseObject, "newTileRenderPipelineStateWithAdditionalBinaryFunctions:error:", v6, v7);

  if (!objc_msgSend(v8, "tileDebugInstrumentationData"))
    objc_msgSend(v8, "setTileDebugInstrumentationData:", objc_msgSend(v8, "tileDebugInstrumentationData"));
  v9 = [MTLLegacySVRenderPipelineState alloc];
  v10 = -[MTLLegacySVRenderPipelineState initWithRenderPipelineState:vertexBinaryFunctions:fragmentBinaryFunctions:tileBinaryFunctions:objectBinaryFunctions:meshBinaryFunctions:withState:device:pipelineOptions:](v9, "initWithRenderPipelineState:vertexBinaryFunctions:fragmentBinaryFunctions:tileBinaryFunctions:objectBinaryFunctions:meshBinaryFunctions:withState:device:pipelineOptions:", v8, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], v6, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], self, self->super.super._device, 0, v12);

  return v10;
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  MTLLegacySVRenderPipelineState *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  MTLLegacySVRenderPipelineState *v15;
  uint64_t v17;

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setVertexAdditionalBinaryFunctions:", -[MTLLegacySVRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", objc_msgSend(a3, "vertexAdditionalBinaryFunctions")));
  objc_msgSend(v7, "setFragmentAdditionalBinaryFunctions:", -[MTLLegacySVRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", objc_msgSend(a3, "fragmentAdditionalBinaryFunctions")));
  objc_msgSend(v7, "setTileAdditionalBinaryFunctions:", -[MTLLegacySVRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", objc_msgSend(a3, "tileAdditionalBinaryFunctions")));
  objc_msgSend(v7, "setObjectAdditionalBinaryFunctions:", -[MTLLegacySVRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", objc_msgSend(a3, "objectAdditionalBinaryFunctions")));
  objc_msgSend(v7, "setMeshAdditionalBinaryFunctions:", -[MTLLegacySVRenderPipelineState unwrapBinaryFunctions:](self, "unwrapBinaryFunctions:", objc_msgSend(a3, "meshAdditionalBinaryFunctions")));
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
  v9 = [MTLLegacySVRenderPipelineState alloc];
  v10 = objc_msgSend(a3, "vertexAdditionalBinaryFunctions");
  v11 = objc_msgSend(a3, "fragmentAdditionalBinaryFunctions");
  v12 = objc_msgSend(a3, "tileAdditionalBinaryFunctions");
  v13 = objc_msgSend(a3, "objectAdditionalBinaryFunctions");
  v14 = objc_msgSend(a3, "meshAdditionalBinaryFunctions");
  v15 = -[MTLLegacySVRenderPipelineState initWithRenderPipelineState:vertexBinaryFunctions:fragmentBinaryFunctions:tileBinaryFunctions:objectBinaryFunctions:meshBinaryFunctions:withState:device:pipelineOptions:](v9, "initWithRenderPipelineState:vertexBinaryFunctions:fragmentBinaryFunctions:tileBinaryFunctions:objectBinaryFunctions:meshBinaryFunctions:withState:device:pipelineOptions:", v8, v10, v11, v12, v13, v14, self, self->super.super._device, 0, v17);

  return v15;
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  id result;
  id v8;
  MTLLegacySVVisibleFunctionTable *v9;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newVisibleFunctionTableWithDescriptor:stage:", a3, a4);
  if (result)
  {
    v8 = result;
    v9 = -[MTLLegacySVVisibleFunctionTable initWithVisibleFunctionTable:descriptor:renderPipeline:stage:]([MTLLegacySVVisibleFunctionTable alloc], "initWithVisibleFunctionTable:descriptor:renderPipeline:stage:", result, a3, self, a4);

    return v9;
  }
  return result;
}

- (id)newVisibleFunctionTableFromVertexStageWithDescriptor:(id)a3
{
  return -[MTLLegacySVRenderPipelineState newVisibleFunctionTableWithDescriptor:stage:](self, "newVisibleFunctionTableWithDescriptor:stage:", a3, 1);
}

- (id)newVisibleFunctionTableFromFragmentStageWithDescriptor:(id)a3
{
  return -[MTLLegacySVRenderPipelineState newVisibleFunctionTableWithDescriptor:stage:](self, "newVisibleFunctionTableWithDescriptor:stage:", a3, 2);
}

- (id)newVisibleFunctionTableFromTileStageWithDescriptor:(id)a3
{
  return -[MTLLegacySVRenderPipelineState newVisibleFunctionTableWithDescriptor:stage:](self, "newVisibleFunctionTableWithDescriptor:stage:", a3, 4);
}

- (id)newVisibleFunctionTableFromObjectStageWithDescriptor:(id)a3
{
  return -[MTLLegacySVRenderPipelineState newVisibleFunctionTableWithDescriptor:stage:](self, "newVisibleFunctionTableWithDescriptor:stage:", a3, 8);
}

- (id)newVisibleFunctionTableFromMeshStageWithDescriptor:(id)a3
{
  return -[MTLLegacySVRenderPipelineState newVisibleFunctionTableWithDescriptor:stage:](self, "newVisibleFunctionTableWithDescriptor:stage:", a3, 16);
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  id result;
  id v8;
  MTLLegacySVIntersectionFunctionTable *v9;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIntersectionFunctionTableWithDescriptor:stage:", a3, a4);
  if (result)
  {
    v8 = result;
    v9 = -[MTLLegacySVIntersectionFunctionTable initWithIntersectionFunctionTable:device:descriptor:renderPipelineState:stage:]([MTLLegacySVIntersectionFunctionTable alloc], "initWithIntersectionFunctionTable:device:descriptor:renderPipelineState:stage:", result, -[MTLToolsRenderPipelineState device](self, "device"), a3, self, a4);

    return v9;
  }
  return result;
}

- (id)newVertexIntersectionFunctionTableWithDescriptor:(id)a3
{
  return -[MTLLegacySVRenderPipelineState newIntersectionFunctionTableWithDescriptor:stage:](self, "newIntersectionFunctionTableWithDescriptor:stage:", a3, 1);
}

- (id)newFragmentIntersectionFunctionTableWithDescriptor:(id)a3
{
  return -[MTLLegacySVRenderPipelineState newIntersectionFunctionTableWithDescriptor:stage:](self, "newIntersectionFunctionTableWithDescriptor:stage:", a3, 2);
}

- (id)newTileIntersectionFunctionTableWithDescriptor:(id)a3
{
  return -[MTLLegacySVRenderPipelineState newIntersectionFunctionTableWithDescriptor:stage:](self, "newIntersectionFunctionTableWithDescriptor:stage:", a3, 4);
}

- (id)newObjectIntersectionFunctionTableWithDescriptor:(id)a3
{
  return -[MTLLegacySVRenderPipelineState newIntersectionFunctionTableWithDescriptor:stage:](self, "newIntersectionFunctionTableWithDescriptor:stage:", a3, 8);
}

- (id)newMeshIntersectionFunctionTableWithDescriptor:(id)a3
{
  return -[MTLLegacySVRenderPipelineState newIntersectionFunctionTableWithDescriptor:stage:](self, "newIntersectionFunctionTableWithDescriptor:stage:", a3, 16);
}

- (void)releaseReflection
{

  self->_internalReflection = 0;
  self->_userReflection = 0;
}

- (MTLLegacySVImageData)vertexFunctionData
{
  return self->_vertexFunctionData;
}

- (MTLLegacySVImageData)fragmentFunctionData
{
  return self->_fragmentFunctionData;
}

- (MTLLegacySVImageData)tileFunctionData
{
  return self->_tileFunctionData;
}

- (MTLLegacySVImageData)objectFunctionData
{
  return self->_objectFunctionData;
}

- (MTLLegacySVImageData)meshFunctionData
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

- (MTLLegacySVBuffer)vertexConstantsBuffer
{
  MTLLegacySVImageData *vertexFunctionData;

  vertexFunctionData = self->_vertexFunctionData;
  if (vertexFunctionData)
    return (MTLLegacySVBuffer *)*((_QWORD *)vertexFunctionData + 1);
  else
    return 0;
}

- (MTLLegacySVBuffer)fragmentConstantsBuffer
{
  MTLLegacySVImageData *fragmentFunctionData;

  fragmentFunctionData = self->_fragmentFunctionData;
  if (fragmentFunctionData)
    return (MTLLegacySVBuffer *)*((_QWORD *)fragmentFunctionData + 1);
  else
    return 0;
}

- (MTLLegacySVBuffer)tileConstantsBuffer
{
  MTLLegacySVImageData *tileFunctionData;

  tileFunctionData = self->_tileFunctionData;
  if (tileFunctionData)
    return (MTLLegacySVBuffer *)*((_QWORD *)tileFunctionData + 1);
  else
    return 0;
}

- (MTLLegacySVBuffer)objectConstantsBuffer
{
  MTLLegacySVImageData *objectFunctionData;

  objectFunctionData = self->_objectFunctionData;
  if (objectFunctionData)
    return (MTLLegacySVBuffer *)*((_QWORD *)objectFunctionData + 1);
  else
    return 0;
}

- (MTLLegacySVBuffer)meshConstantsBuffer
{
  MTLLegacySVImageData *meshFunctionData;

  meshFunctionData = self->_meshFunctionData;
  if (meshFunctionData)
    return (MTLLegacySVBuffer *)*((_QWORD *)meshFunctionData + 1);
  else
    return 0;
}

- (MTLLegacySVBuffer)indirectStateBuffer
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
    LegacySVGlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, (uint64_t)self->_indirectStateBuffer);

    if (-[MTLLegacySVRenderPipelineState vertexConstantsBuffer](self, "vertexConstantsBuffer"))
      LegacySVGlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, (uint64_t)-[MTLLegacySVRenderPipelineState vertexConstantsBuffer](self, "vertexConstantsBuffer"));
    if (-[MTLLegacySVRenderPipelineState fragmentConstantsBuffer](self, "fragmentConstantsBuffer"))
      LegacySVGlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, (uint64_t)-[MTLLegacySVRenderPipelineState fragmentConstantsBuffer](self, "fragmentConstantsBuffer"));
    if (-[MTLLegacySVRenderPipelineState tileConstantsBuffer](self, "tileConstantsBuffer"))
      LegacySVGlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, (uint64_t)-[MTLLegacySVRenderPipelineState tileConstantsBuffer](self, "tileConstantsBuffer"));
    if (-[MTLLegacySVRenderPipelineState objectConstantsBuffer](self, "objectConstantsBuffer"))
      LegacySVGlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, (uint64_t)-[MTLLegacySVRenderPipelineState objectConstantsBuffer](self, "objectConstantsBuffer"));
    if (-[MTLLegacySVRenderPipelineState meshConstantsBuffer](self, "meshConstantsBuffer"))
      LegacySVGlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, (uint64_t)-[MTLLegacySVRenderPipelineState meshConstantsBuffer](self, "meshConstantsBuffer"));
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
            LegacySVGlobalResidentBufferList::removeBuffer((uint64_t)&self->super.super._device[4]._memorySize, v8);
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](binaryFunctionData, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }
  }

  v9.receiver = self;
  v9.super_class = (Class)MTLLegacySVRenderPipelineState;
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

@end
