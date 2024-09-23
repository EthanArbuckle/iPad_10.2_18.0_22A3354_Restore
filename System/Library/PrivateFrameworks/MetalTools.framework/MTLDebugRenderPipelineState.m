@implementation MTLDebugRenderPipelineState

- (MTLDebugRenderPipelineState)initWithPipelineState:(id)a3 reflection:(id)a4 parent:(id)a5 descriptor:(id)a6
{
  MTLDebugRenderPipelineState *v8;
  MTLRenderPipelineDescriptor *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTLDebugRenderPipelineState;
  v8 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:](&v12, sel_initWithBaseObject_parent_, a3, a5);
  if (v8)
  {
    v9 = (MTLRenderPipelineDescriptor *)objc_msgSend(a6, "copy");
    v8->_descriptor = v9;
    -[MTLRenderPipelineDescriptor setBinaryArchives:](v9, "setBinaryArchives:", 0);
    v10 = MEMORY[0x24BDBD1A8];
    -[MTLRenderPipelineDescriptor setVertexPreloadedLibraries:](v8->_descriptor, "setVertexPreloadedLibraries:", MEMORY[0x24BDBD1A8]);
    -[MTLRenderPipelineDescriptor setFragmentPreloadedLibraries:](v8->_descriptor, "setFragmentPreloadedLibraries:", v10);
    v8->_reflection = (MTLRenderPipelineReflection *)a4;
    -[MTLDebugRenderPipelineState _updateCachedPipelineState](v8, "_updateCachedPipelineState");
  }
  return v8;
}

- (MTLDebugRenderPipelineState)initWithPipelineState:(id)a3 reflection:(id)a4 parent:(id)a5 tileDescriptor:(id)a6
{
  MTLDebugRenderPipelineState *v8;
  MTLTileRenderPipelineDescriptor *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTLDebugRenderPipelineState;
  v8 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:](&v11, sel_initWithBaseObject_parent_, a3, a5);
  if (v8)
  {
    v9 = (MTLTileRenderPipelineDescriptor *)objc_msgSend(a6, "copy");
    v8->_tileDescriptor = v9;
    -[MTLTileRenderPipelineDescriptor setBinaryArchives:](v9, "setBinaryArchives:", 0);
    -[MTLTileRenderPipelineDescriptor setPreloadedLibraries:](v8->_tileDescriptor, "setPreloadedLibraries:", MEMORY[0x24BDBD1A8]);
    v8->_reflection = (MTLRenderPipelineReflection *)a4;
    -[MTLDebugRenderPipelineState _updateCachedTilePipelineState](v8, "_updateCachedTilePipelineState");
  }
  return v8;
}

- (void)_updateCachedTilePipelineState
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = -[MTLTileRenderPipelineDescriptor _descriptorPrivate](self->_tileDescriptor, "_descriptorPrivate");
  v4 = 0;
  self->_rasterSampleCount = *(_QWORD *)(v3 + 8);
  do
  {
    v5 = (void *)objc_msgSend(*(id *)v3, "objectAtIndexedSubscript:", v4);
    if (v5)
      v5 = (void *)objc_msgSend(v5, "pixelFormat");
    self->_colorPixelFormat[v4++] = (unint64_t)v5;
  }
  while (v4 != 8);
  self->_threadgroupSizeMatchesTileSize = *(_BYTE *)(v3 + 32);
}

- (id)_findMasterStruct:(id)a3 includeImageBlockData:(BOOL)a4
{
  _BOOL4 v4;
  id result;
  uint64_t v7;
  uint64_t v8;

  if (!a3)
    return 0;
  v4 = a4;
  result = (id)objc_msgSend(a3, "count");
  if (!result)
    return result;
  v7 = 0;
  while (1)
  {
    v8 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v7), "type");
    if (v8 == 16)
      break;
    if (v8 == 17)
      goto LABEL_11;
LABEL_8:
    if (objc_msgSend(a3, "count") <= (unint64_t)++v7)
      return 0;
  }
  if (!v4)
    goto LABEL_8;
LABEL_11:
  result = (id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v7), "imageBlockMasterStructMembers");
  if (!result)
    return (id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v7), "dataTypeDescription");
  return result;
}

- (id)outputImageBlockData
{
  id result;

  result = -[MTLDebugRenderPipelineState _findMasterStruct:includeImageBlockData:](self, "_findMasterStruct:includeImageBlockData:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", -[MTLRenderPipelineReflection imageBlockDataReturn](self->_reflection, "imageBlockDataReturn"), 0), 1);
  if (!result)
    return -[MTLDebugRenderPipelineState _findMasterStruct:includeImageBlockData:](self, "_findMasterStruct:includeImageBlockData:", -[MTLRenderPipelineReflection tileArguments](self->_reflection, "tileArguments"), 0);
  return result;
}

- (BOOL)isImageBlockLayoutInputCompatibleWithOutputOf:(id)a3
{
  id v5;
  void *v6;

  v5 = -[MTLDebugRenderPipelineState _findMasterStruct:includeImageBlockData:](self, "_findMasterStruct:includeImageBlockData:", -[MTLRenderPipelineReflection tileArguments](-[MTLDebugRenderPipelineState reflection](self, "reflection"), "tileArguments"), 1);
  if (!v5)
    v5 = -[MTLDebugRenderPipelineState _findMasterStruct:includeImageBlockData:](self, "_findMasterStruct:includeImageBlockData:", -[MTLRenderPipelineReflection fragmentArguments](-[MTLDebugRenderPipelineState reflection](self, "reflection"), "fragmentArguments"), 1);
  v6 = (void *)objc_msgSend(a3, "outputImageBlockData");
  if (v6 && v5)
    return objc_msgSend(v6, "isStructLayoutThreadSafeWith:", v5);
  else
    return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLDebugRenderPipelineState;
  -[MTLToolsRenderPipelineState dealloc](&v3, sel_dealloc);
}

- (BOOL)rasterizationEnabled
{
  if (self->_descriptor)
    return -[MTLRenderPipelineDescriptor isRasterizationEnabled](self->_descriptor, "isRasterizationEnabled");
  else
    return self->_tileDescriptor != 0;
}

- (void)_updateCachedPipelineState
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  $364A35BF9FFEAB6CE0837D517FBED70B *v16;
  unint64_t *p_maxInstanceCount;
  unint64_t *p_maxVertexCount;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t *p_maxPatchCount;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = -[MTLRenderPipelineDescriptor _descriptorPrivate](self->_descriptor, "_descriptorPrivate");
  v4 = 0;
  v5 = 0;
  v6 = 0;
  self->_rasterSampleCount = *(_QWORD *)(v3 + 184);
  do
  {
    v7 = (_QWORD *)objc_msgSend((id)objc_msgSend(*(id *)v3, "_descriptorAtIndex:", v5), "_descriptorPrivate");
    if (v7)
    {
      v8 = *v7 >> 36;
      self->_colorPixelFormat[v5] = v8;
      if (v8)
        v6 = (((*v7 >> 27) & 0xFLL) << v4) | v6 & ~(15 << v4);
    }
    else
    {
      self->_colorPixelFormat[v5] = 0;
    }
    ++v5;
    v4 += 4;
  }
  while (v5 != 8);
  v9 = *(_QWORD *)(v3 + 72);
  self->_depthPixelFormat = v9;
  if (v9)
    v10 = v6 | 0x100000000;
  else
    v10 = v6;
  v11 = *(_QWORD *)(v3 + 80);
  self->_stencilPixelFormat = v11;
  if (v11)
    v10 |= 0x600000000uLL;
  self->_attachmentWriteMask = v10;
  v12 = *(void **)(v3 + 272);
  if (v12)
  {
    v13 = (void *)objc_msgSend(v12, "layouts");
    v14 = 0;
    self->_vertexDescriptorLayoutCount = 0;
    do
    {
      v15 = objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", v14), "stride");
      if (v15)
      {
        v16 = &self->_vertexDescriptorLayouts[self->_vertexDescriptorLayoutCount];
        v16->bufferIndex = v14;
        v16->bufferStride = v15;
        ++self->_vertexDescriptorLayoutCount;
      }
      ++v14;
    }
    while (v14 != 31);
  }
  p_maxInstanceCount = &self->_maxInstanceCount;
  self->_maxInstanceCount = 0xFFFFFFFFLL;
  p_maxPatchCount = &self->_maxPatchCount;
  self->_maxPatchCount = 0xFFFFFFFFLL;
  p_maxVertexCount = &self->_maxVertexCount;
  self->_maxVertexCount = 0xFFFFFFFFLL;
  v19 = (void *)-[MTLRenderPipelineReflection vertexBuiltInArguments](self->_reflection, "vertexBuiltInArguments");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v32;
LABEL_19:
    v23 = 0;
    while (2)
    {
      if (*(_QWORD *)v32 != v22)
        objc_enumerationMutation(v19);
      v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v23);
      v25 = __ROR8__(objc_msgSend(v24, "builtInDataType") - 29, 2);
      if (v25 > 3)
        v26 = 0xFFFFFFFFLL;
      else
        v26 = qword_22CEAB8A0[v25];
      v27 = objc_msgSend(v24, "builtInType");
      v28 = p_maxVertexCount;
      switch(v27)
      {
        case 1:
        case 3:
          goto LABEL_29;
        case 2:
        case 4:
          v28 = p_maxInstanceCount;
          goto LABEL_29;
        default:
          if (v27 != 13)
            goto LABEL_32;
          v28 = p_maxPatchCount;
LABEL_29:
          v29 = *v28;
          if (*v28 >= v26)
            v29 = v26;
          *v28 = v29;
LABEL_32:
          if (v21 != ++v23)
            continue;
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          if (!v21)
            return;
          goto LABEL_19;
      }
    }
  }
}

- (id)formattedDescription:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLDebugRenderPipelineState;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), -[MTLToolsObject description](&v4, sel_description), -[MTLRenderPipelineDescriptor formattedDescription:](self->_descriptor, "formattedDescription:", a3 + 4));
}

- (id)description
{
  return -[MTLDebugRenderPipelineState formattedDescription:](self, "formattedDescription:", 0);
}

- (id)getParameter:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getParameter:", a3);
}

- (BOOL)isAncestorOf:(id)a3
{
  void *v3;
  id v5;
  MTLDebugRenderPipelineState *v6;
  BOOL v7;

  if (self == a3)
    return 1;
  v3 = a3;
  v5 = a3;
  while (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    v6 = (MTLDebugRenderPipelineState *)objc_msgSend(v3, "parent");

    v3 = v6;
    if (v6 == self)
    {
      v7 = 1;
      v3 = self;
      goto LABEL_8;
    }
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (void)validateHandleForSetFunction:(id)a3
{
  id v5;

  objc_msgSend(a3, "function");
  v5 = (id)objc_msgSend(a3, "parent");
  if ((objc_msgSend(v5, "isAncestorOf:", self) & 1) == 0
    && !-[MTLDebugRenderPipelineState isAncestorOf:](self, "isAncestorOf:", v5))
  {
    objc_msgSend((id)objc_msgSend(a3, "name"), "UTF8String");
    MTLReportFailure();
  }

}

- (id)validateBinaryFunctions:(id)a3 stage:(unint64_t)a4
{
  MTLDevice *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  const __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = -[MTLToolsRenderPipelineState device](self, "device");
  if (!objc_msgSend(a3, "count"))
    return 0;
  if ((objc_msgSend((id)-[MTLDevice baseObject](v6, "baseObject"), "supportsFunctionPointers") & 1) == 0)
  {
    v14 = MTLDebugStageToString(a4);
    MTLReportFailure();
  }
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a3, "count", v14));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(a3);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "baseObject", v15, v16);
        objc_msgSend(v7, "addObject:", v12);
        if (!objc_msgSend(v12, "precompiledOutput"))
        {
          v15 = objc_msgSend((id)objc_msgSend(v12, "name"), "UTF8String");
          v16 = MTLDebugStageToString(a4);
          MTLReportFailure();
        }
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  return v7;
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 fragmentAdditionalBinaryFunctions:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  MTLDebugRenderPipelineState *v16;
  uint64_t v18;
  uint64_t v19;

  if (objc_msgSend(a3, "count")
    && !-[MTLRenderPipelineDescriptor supportAddingVertexBinaryFunctions](-[MTLDebugRenderPipelineState descriptor](self, "descriptor"), "supportAddingVertexBinaryFunctions"))
  {
    MTLReportFailure();
  }
  if (objc_msgSend(a4, "count")
    && !-[MTLRenderPipelineDescriptor supportAddingFragmentBinaryFunctions](-[MTLDebugRenderPipelineState descriptor](self, "descriptor"), "supportAddingFragmentBinaryFunctions"))
  {
    MTLReportFailure();
  }
  v9 = -[MTLDebugRenderPipelineState validateBinaryFunctions:stage:](self, "validateBinaryFunctions:stage:", a3, 2);
  v10 = -[MTLDebugRenderPipelineState validateBinaryFunctions:stage:](self, "validateBinaryFunctions:stage:", a4, 3);
  v19 = 0;
  if (!a5)
    a5 = (id *)&v19;
  v11 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithAdditionalBinaryFunctions:fragmentAdditionalBinaryFunctions:error:", v9, v10, a5);
  v12 = (void *)v11;
  if (v19)
  {
    v18 = v19;
    MTLReportFailure();
    if (v12)
      goto LABEL_11;
    return 0;
  }
  if (!v11)
    return 0;
LABEL_11:
  v13 = (void *)-[MTLRenderPipelineDescriptor copy](self->_descriptor, "copy", v18);
  v14 = objc_alloc_init(MEMORY[0x24BDDD638]);
  objc_msgSend(v14, "setBinaryFunctions:", a3);
  objc_msgSend(v13, "setVertexLinkedFunctions:", v14);

  v15 = objc_alloc_init(MEMORY[0x24BDDD638]);
  objc_msgSend(v15, "setBinaryFunctions:", a4);
  objc_msgSend(v13, "setFragmentLinkedFunctions:", v15);

  v16 = -[MTLDebugRenderPipelineState initWithPipelineState:reflection:parent:descriptor:]([MTLDebugRenderPipelineState alloc], "initWithPipelineState:reflection:parent:descriptor:", v12, self->_reflection, self, v13);
  return v16;
}

- (id)newTileRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  MTLDebugRenderPipelineState *v12;
  uint64_t v14;
  uint64_t v15;

  if (!-[MTLTileRenderPipelineDescriptor supportAddingBinaryFunctions](-[MTLDebugRenderPipelineState tileDescriptor](self, "tileDescriptor"), "supportAddingBinaryFunctions"))MTLReportFailure();
  v7 = -[MTLDebugRenderPipelineState validateBinaryFunctions:stage:](self, "validateBinaryFunctions:stage:", a3, 4);
  v15 = 0;
  if (!a4)
    a4 = (id *)&v15;
  v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTileRenderPipelineStateWithAdditionalBinaryFunctions:error:", v7, a4);
  v9 = (void *)v8;
  if (v15)
  {
    v14 = v15;
    MTLReportFailure();
    if (v9)
      goto LABEL_7;
    return 0;
  }
  if (!v8)
    return 0;
LABEL_7:
  v10 = (void *)-[MTLTileRenderPipelineDescriptor copy](self->_tileDescriptor, "copy", v14);
  v11 = objc_alloc_init(MEMORY[0x24BDDD638]);
  objc_msgSend(v11, "setBinaryFunctions:", a3);
  objc_msgSend(v10, "setLinkedFunctions:", v11);

  v12 = -[MTLDebugRenderPipelineState initWithPipelineState:reflection:parent:tileDescriptor:]([MTLDebugRenderPipelineState alloc], "initWithPipelineState:reflection:parent:tileDescriptor:", v9, self->_reflection, self, v10);
  return v12;
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  MTLDebugRenderPipelineState *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  MTLDebugRenderPipelineState *v18;
  uint64_t v20;

  v7 = objc_msgSend((id)objc_msgSend(a3, "tileAdditionalBinaryFunctions"), "count") != 0;
  v8 = objc_msgSend((id)objc_msgSend(a3, "vertexAdditionalBinaryFunctions"), "count")
    || objc_msgSend((id)objc_msgSend(a3, "fragmentAdditionalBinaryFunctions"), "count")
    || objc_msgSend((id)objc_msgSend(a3, "objectAdditionalBinaryFunctions"), "count")
    || objc_msgSend((id)objc_msgSend(a3, "meshAdditionalBinaryFunctions"), "count") != 0;
  if (v8 == v7)
    MTLReportFailure();
  if (objc_msgSend((id)objc_msgSend(a3, "tileAdditionalBinaryFunctions"), "count")
    && !-[MTLTileRenderPipelineDescriptor supportAddingBinaryFunctions](-[MTLDebugRenderPipelineState tileDescriptor](self, "tileDescriptor"), "supportAddingBinaryFunctions"))
  {
    MTLReportFailure();
  }
  if (objc_msgSend((id)objc_msgSend(a3, "fragmentAdditionalBinaryFunctions"), "count")
    && !-[MTLRenderPipelineDescriptor supportAddingFragmentBinaryFunctions](-[MTLDebugRenderPipelineState descriptor](self, "descriptor"), "supportAddingFragmentBinaryFunctions"))
  {
    MTLReportFailure();
  }
  if (objc_msgSend((id)objc_msgSend(a3, "vertexAdditionalBinaryFunctions"), "count")
    && !-[MTLRenderPipelineDescriptor supportAddingVertexBinaryFunctions](-[MTLDebugRenderPipelineState descriptor](self, "descriptor"), "supportAddingVertexBinaryFunctions"))
  {
    MTLReportFailure();
  }
  if (objc_msgSend((id)objc_msgSend(a3, "objectAdditionalBinaryFunctions"), "count")
    && (-[MTLRenderPipelineDescriptor supportAddingObjectBinaryFunctions](-[MTLDebugRenderPipelineState descriptor](self, "descriptor"), "supportAddingObjectBinaryFunctions") & 1) == 0)
  {
    MTLReportFailure();
  }
  if (objc_msgSend((id)objc_msgSend(a3, "meshAdditionalBinaryFunctions"), "count")
    && (-[MTLRenderPipelineDescriptor supportAddingMeshBinaryFunctions](-[MTLDebugRenderPipelineState descriptor](self, "descriptor"), "supportAddingMeshBinaryFunctions") & 1) == 0)
  {
    MTLReportFailure();
  }
  v9 = (id)objc_opt_new();
  objc_msgSend(v9, "setVertexAdditionalBinaryFunctions:", -[MTLDebugRenderPipelineState validateBinaryFunctions:stage:](self, "validateBinaryFunctions:stage:", objc_msgSend(a3, "vertexAdditionalBinaryFunctions"), 2));
  objc_msgSend(v9, "setFragmentAdditionalBinaryFunctions:", -[MTLDebugRenderPipelineState validateBinaryFunctions:stage:](self, "validateBinaryFunctions:stage:", objc_msgSend(a3, "fragmentAdditionalBinaryFunctions"), 3));
  objc_msgSend(v9, "setTileAdditionalBinaryFunctions:", -[MTLDebugRenderPipelineState validateBinaryFunctions:stage:](self, "validateBinaryFunctions:stage:", objc_msgSend(a3, "tileAdditionalBinaryFunctions"), 4));
  objc_msgSend(v9, "setObjectAdditionalBinaryFunctions:", -[MTLDebugRenderPipelineState validateBinaryFunctions:stage:](self, "validateBinaryFunctions:stage:", objc_msgSend(a3, "objectAdditionalBinaryFunctions"), 5));
  objc_msgSend(v9, "setMeshAdditionalBinaryFunctions:", -[MTLDebugRenderPipelineState validateBinaryFunctions:stage:](self, "validateBinaryFunctions:stage:", objc_msgSend(a3, "meshAdditionalBinaryFunctions"), 6));
  v20 = 0;
  if (!a4)
    a4 = (id *)&v20;
  v10 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithAdditionalBinaryFunctions:error:", v9, a4);
  if (objc_msgSend((id)objc_msgSend(a3, "tileAdditionalBinaryFunctions"), "count"))
  {
    v11 = (void *)-[MTLTileRenderPipelineDescriptor copy](self->_tileDescriptor, "copy");
    v12 = (id)objc_opt_new();
    objc_msgSend(v12, "setBinaryFunctions:", objc_msgSend(a3, "tileAdditionalBinaryFunctions"));
    objc_msgSend(v11, "setLinkedFunctions:", v12);
    v13 = -[MTLDebugRenderPipelineState initWithPipelineState:reflection:parent:tileDescriptor:]([MTLDebugRenderPipelineState alloc], "initWithPipelineState:reflection:parent:tileDescriptor:", v10, self->_reflection, self, v11);
  }
  else
  {
    v11 = (void *)-[MTLRenderPipelineDescriptor copy](self->_descriptor, "copy");
    v14 = (id)objc_opt_new();
    objc_msgSend(v14, "setBinaryFunctions:", objc_msgSend(a3, "vertexAdditionalBinaryFunctions"));
    objc_msgSend(v11, "setVertexLinkedFunctions:", v14);
    v15 = (id)objc_opt_new();
    objc_msgSend(v15, "setBinaryFunctions:", objc_msgSend(a3, "fragmentAdditionalBinaryFunctions"));
    objc_msgSend(v11, "setFragmentLinkedFunctions:", v15);
    v16 = (id)objc_opt_new();
    objc_msgSend(v16, "setBinaryFunctions:", objc_msgSend(a3, "objectAdditionalBinaryFunctions"));
    objc_msgSend(v11, "setObjectLinkedFunctions:", v16);
    v17 = (id)objc_opt_new();
    objc_msgSend(v17, "setBinaryFunctions:", objc_msgSend(a3, "meshAdditionalBinaryFunctions"));
    objc_msgSend(v11, "setMeshLinkedFunctions:", v17);
    v13 = -[MTLDebugRenderPipelineState initWithPipelineState:reflection:parent:descriptor:]([MTLDebugRenderPipelineState alloc], "initWithPipelineState:reflection:parent:descriptor:", v10, self->_reflection, self, v11);
  }
  v18 = v13;

  return v18;
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4 selector:(SEL)a5
{
  id result;

  if ((objc_msgSend((id)-[MTLDevice baseObject](-[MTLToolsRenderPipelineState device](self, "device"), "baseObject"), "supportsFunctionPointers") & 1) != 0)
  {
    if (a3)
      goto LABEL_3;
  }
  else
  {
    MTLReportFailure();
    if (a3)
    {
LABEL_3:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_4;
    }
  }
  MTLReportFailure();
LABEL_4:
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "performSelector:withObject:", a5, a3);
  if (result)
    return -[MTLDebugVisibleFunctionTable initWithVisibleFunctionTable:parent:descriptor:pipelineState:stage:]([MTLDebugVisibleFunctionTable alloc], "initWithVisibleFunctionTable:parent:descriptor:pipelineState:stage:", result, self, a3, self, a4);
  return result;
}

- (id)newVisibleFunctionTableFromVertexStageWithDescriptor:(id)a3
{
  return -[MTLDebugRenderPipelineState newVisibleFunctionTableWithDescriptor:stage:selector:](self, "newVisibleFunctionTableWithDescriptor:stage:selector:", a3, 2, a2);
}

- (id)newVisibleFunctionTableFromFragmentStageWithDescriptor:(id)a3
{
  return -[MTLDebugRenderPipelineState newVisibleFunctionTableWithDescriptor:stage:selector:](self, "newVisibleFunctionTableWithDescriptor:stage:selector:", a3, 3, a2);
}

- (id)newVisibleFunctionTableFromTileStageWithDescriptor:(id)a3
{
  return -[MTLDebugRenderPipelineState newVisibleFunctionTableWithDescriptor:stage:selector:](self, "newVisibleFunctionTableWithDescriptor:stage:selector:", a3, 4, a2);
}

- (id)newVisibleFunctionTableFromObjectStageWithDescriptor:(id)a3
{
  return -[MTLDebugRenderPipelineState newVisibleFunctionTableWithDescriptor:stage:selector:](self, "newVisibleFunctionTableWithDescriptor:stage:selector:", a3, 5, a2);
}

- (id)newVisibleFunctionTableFromMeshStageWithDescriptor:(id)a3
{
  return -[MTLDebugRenderPipelineState newVisibleFunctionTableWithDescriptor:stage:selector:](self, "newVisibleFunctionTableWithDescriptor:stage:selector:", a3, 6, a2);
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  id result;
  id v8;
  MTLDebugVisibleFunctionTable *v9;

  if (a4 <= 0x10 && ((1 << a4) & 0x10116) != 0)
  {
    if (a3)
      goto LABEL_4;
  }
  else
  {
    MTLReportFailure();
    if (a3)
    {
LABEL_4:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_5;
    }
  }
  MTLReportFailure();
LABEL_5:
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newVisibleFunctionTableWithDescriptor:stage:", a3, a4);
  if (result)
  {
    v8 = result;
    v9 = -[MTLDebugVisibleFunctionTable initWithVisibleFunctionTable:parent:descriptor:pipelineState:stage:]([MTLDebugVisibleFunctionTable alloc], "initWithVisibleFunctionTable:parent:descriptor:pipelineState:stage:", result, self, a3, self, MTLRenderStagesToDebugStage(a4));

    return v9;
  }
  return result;
}

- (id)functionHandleToDebugFunctionHandle:(id)a3 parentFunction:(id)a4 stage:(unint64_t)a5
{
  void *v9;
  _QWORD v11[8];

  v9 = *(void **)(objc_msgSend(a4, "device") + 48);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __88__MTLDebugRenderPipelineState_functionHandleToDebugFunctionHandle_parentFunction_stage___block_invoke;
  v11[3] = &unk_24F794938;
  v11[4] = a3;
  v11[5] = self;
  v11[6] = a4;
  v11[7] = a5;
  return (id)objc_msgSend(v9, "getCachedObjectForKey:onMiss:", a3, v11);
}

MTLDebugFunctionHandle *__88__MTLDebugRenderPipelineState_functionHandleToDebugFunctionHandle_parentFunction_stage___block_invoke(_QWORD *a1)
{
  return -[MTLDebugFunctionHandle initWithBaseObject:parent:function:stage:]([MTLDebugFunctionHandle alloc], "initWithBaseObject:parent:function:stage:", a1[4], a1[5], a1[6], a1[7]);
}

- (id)functionHandleWithFunction:(id)a3 stage:(unint64_t)a4 selector:(SEL)a5
{
  if (!a3 || (objc_msgSend(a3, "conformsToProtocol:", &unk_255C6A2E8) & 1) == 0)
    MTLReportFailure();
  return -[MTLDebugRenderPipelineState functionHandleToDebugFunctionHandle:parentFunction:stage:](self, "functionHandleToDebugFunctionHandle:parentFunction:stage:", objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "performSelector:withObject:", a5, objc_msgSend(a3, "baseObject")), a3, a4);
}

- (id)vertexFunctionHandleWithFunction:(id)a3
{
  return -[MTLDebugRenderPipelineState functionHandleWithFunction:stage:selector:](self, "functionHandleWithFunction:stage:selector:", a3, 2, a2);
}

- (id)fragmentFunctionHandleWithFunction:(id)a3
{
  return -[MTLDebugRenderPipelineState functionHandleWithFunction:stage:selector:](self, "functionHandleWithFunction:stage:selector:", a3, 3, a2);
}

- (id)tileFunctionHandleWithFunction:(id)a3
{
  return -[MTLDebugRenderPipelineState functionHandleWithFunction:stage:selector:](self, "functionHandleWithFunction:stage:selector:", a3, 4, a2);
}

- (id)objectFunctionHandleWithFunction:(id)a3
{
  return -[MTLDebugRenderPipelineState functionHandleWithFunction:stage:selector:](self, "functionHandleWithFunction:stage:selector:", a3, 5, a2);
}

- (id)meshFunctionHandleWithFunction:(id)a3
{
  return -[MTLDebugRenderPipelineState functionHandleWithFunction:stage:selector:](self, "functionHandleWithFunction:stage:selector:", a3, 6, a2);
}

- (id)functionHandleWithFunction:(id)a3 stage:(unint64_t)a4
{
  if (a4 <= 0x10 && ((1 << a4) & 0x10116) != 0)
  {
    if (!a3)
    {
LABEL_7:
      MTLReportFailure();
      return -[MTLDebugRenderPipelineState functionHandleToDebugFunctionHandle:parentFunction:stage:](self, "functionHandleToDebugFunctionHandle:parentFunction:stage:", objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "functionHandleWithFunction:stage:", objc_msgSend(a3, "baseObject"), a4), a3, MTLRenderStagesToDebugStage(a4));
    }
  }
  else
  {
    MTLReportFailure();
    if (!a3)
      goto LABEL_7;
  }
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C6A2E8) & 1) == 0)
    goto LABEL_7;
  return -[MTLDebugRenderPipelineState functionHandleToDebugFunctionHandle:parentFunction:stage:](self, "functionHandleToDebugFunctionHandle:parentFunction:stage:", objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "functionHandleWithFunction:stage:", objc_msgSend(a3, "baseObject"), a4), a3, MTLRenderStagesToDebugStage(a4));
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 withStage:(unint64_t)a4 selector:(SEL)a5
{
  id result;

  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    MTLReportFailure();
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "performSelector:withObject:", a5, a3);
  if (result)
    return -[MTLDebugIntersectionFunctionTable initWithIntersectionFunctionTable:parent:descriptor:stage:]([MTLDebugIntersectionFunctionTable alloc], "initWithIntersectionFunctionTable:parent:descriptor:stage:", result, self, a3, a4);
  return result;
}

- (id)newVertexIntersectionFunctionTableWithDescriptor:(id)a3
{
  return -[MTLDebugRenderPipelineState newIntersectionFunctionTableWithDescriptor:withStage:selector:](self, "newIntersectionFunctionTableWithDescriptor:withStage:selector:", a3, 2, a2);
}

- (id)newFragmentIntersectionFunctionTableWithDescriptor:(id)a3
{
  return -[MTLDebugRenderPipelineState newIntersectionFunctionTableWithDescriptor:withStage:selector:](self, "newIntersectionFunctionTableWithDescriptor:withStage:selector:", a3, 3, a2);
}

- (id)newTileIntersectionFunctionTableWithDescriptor:(id)a3
{
  return -[MTLDebugRenderPipelineState newIntersectionFunctionTableWithDescriptor:withStage:selector:](self, "newIntersectionFunctionTableWithDescriptor:withStage:selector:", a3, 4, a2);
}

- (id)newObjectIntersectionFunctionTableWithDescriptor:(id)a3
{
  return -[MTLDebugRenderPipelineState newIntersectionFunctionTableWithDescriptor:withStage:selector:](self, "newIntersectionFunctionTableWithDescriptor:withStage:selector:", a3, 5, a2);
}

- (id)newMeshIntersectionFunctionTableWithDescriptor:(id)a3
{
  return -[MTLDebugRenderPipelineState newIntersectionFunctionTableWithDescriptor:withStage:selector:](self, "newIntersectionFunctionTableWithDescriptor:withStage:selector:", a3, 6, a2);
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  id result;
  id v8;
  MTLDebugIntersectionFunctionTable *v9;

  if (a4 <= 0x10 && ((1 << a4) & 0x10116) != 0)
  {
    if (a3)
      goto LABEL_4;
  }
  else
  {
    MTLReportFailure();
    if (a3)
    {
LABEL_4:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_5;
    }
  }
  MTLReportFailure();
LABEL_5:
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIntersectionFunctionTableWithDescriptor:stage:", a3, a4);
  if (result)
  {
    v8 = result;
    v9 = -[MTLDebugIntersectionFunctionTable initWithIntersectionFunctionTable:parent:descriptor:stage:]([MTLDebugIntersectionFunctionTable alloc], "initWithIntersectionFunctionTable:parent:descriptor:stage:", result, self, a3, MTLRenderStagesToDebugStage(a4));

    return v9;
  }
  return result;
}

- (BOOL)isMeshShaderPipeline
{
  return -[MTLRenderPipelineDescriptor meshFunction](self->_descriptor, "meshFunction") || self->_meshDescriptor != 0;
}

- (MTLDebugRenderPipelineState)initWithPipelineState:(id)a3 reflection:(id)a4 parent:(id)a5 meshDescriptor:(id)a6
{
  MTLDebugRenderPipelineState *v8;
  MTLMeshRenderPipelineDescriptor *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTLDebugRenderPipelineState;
  v8 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:](&v12, sel_initWithBaseObject_parent_, a3, a5);
  if (v8)
  {
    v9 = (MTLMeshRenderPipelineDescriptor *)objc_msgSend(a6, "copy");
    v8->_meshDescriptor = v9;
    -[MTLMeshRenderPipelineDescriptor setBinaryArchives:](v9, "setBinaryArchives:", 0);
    v10 = MEMORY[0x24BDBD1A8];
    -[MTLMeshRenderPipelineDescriptor setObjectPreloadedLibraries:](v8->_meshDescriptor, "setObjectPreloadedLibraries:", MEMORY[0x24BDBD1A8]);
    -[MTLMeshRenderPipelineDescriptor setMeshPreloadedLibraries:](v8->_meshDescriptor, "setMeshPreloadedLibraries:", v10);
    -[MTLMeshRenderPipelineDescriptor setFragmentPreloadedLibraries:](v8->_meshDescriptor, "setFragmentPreloadedLibraries:", v10);
    v8->_reflection = (MTLRenderPipelineReflection *)a4;
    -[MTLDebugRenderPipelineState _updateCachedMeshPipelineState](v8, "_updateCachedMeshPipelineState");
  }
  return v8;
}

- (void)_updateCachedMeshPipelineState
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;

  v3 = -[MTLMeshRenderPipelineDescriptor _descriptorPrivate](self->_meshDescriptor, "_descriptorPrivate");
  v4 = 0;
  v5 = 0;
  v6 = 0;
  self->_rasterSampleCount = *(_QWORD *)(v3 + 32);
  do
  {
    v7 = (_QWORD *)objc_msgSend((id)objc_msgSend(*(id *)v3, "_descriptorAtIndex:", v5), "_descriptorPrivate");
    if (v7)
    {
      v8 = *v7 >> 36;
      self->_colorPixelFormat[v5] = v8;
      if (v8)
        v6 = (((*v7 >> 27) & 0xFLL) << v4) | v6 & ~(15 << v4);
    }
    else
    {
      self->_colorPixelFormat[v5] = 0;
    }
    ++v5;
    v4 += 4;
  }
  while (v5 != 8);
  v9 = *(_QWORD *)(v3 + 8);
  self->_depthPixelFormat = v9;
  v10 = v6 | 0x100000000;
  v11 = v9 == 0;
  v12 = *(_QWORD *)(v3 + 16);
  self->_stencilPixelFormat = v12;
  if (v11)
    v10 = v6;
  if (v12)
    v13 = v10 | 0x600000000;
  else
    v13 = v10;
  self->_attachmentWriteMask = v13;
  self->_vertexDescriptorLayoutCount = 0;
  self->_maxInstanceCount = 0;
  self->_maxPatchCount = 0;
  self->_maxVertexCount = 0;
}

- (void)_validateThreadgroupSize:(id *)a3 stage:(unint64_t)a4 context:(_MTLMessageContext *)a5
{
  void *meshDescriptor;
  unint64_t v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  int v12;

  meshDescriptor = self->_meshDescriptor;
  if (!meshDescriptor)
    meshDescriptor = self->_descriptor;
  if (a4 == 16)
  {
    if (!objc_msgSend(meshDescriptor, "meshFunction", a3, 16, a5))
      return;
    v8 = -[MTLToolsObject maxTotalThreadsPerMeshThreadgroup](self->super.super._baseObject, "maxTotalThreadsPerMeshThreadgroup");
    v9 = objc_msgSend(meshDescriptor, "meshThreadgroupSizeIsMultipleOfThreadExecutionWidth");
    v10 = -[MTLToolsObject meshThreadExecutionWidth](self->super.super._baseObject, "meshThreadExecutionWidth");
  }
  else
  {
    if (a4 != 8 || !objc_msgSend(meshDescriptor, "objectFunction", a3, 8, a5))
      return;
    v8 = -[MTLToolsObject maxTotalThreadsPerObjectThreadgroup](self->super.super._baseObject, "maxTotalThreadsPerObjectThreadgroup");
    v9 = objc_msgSend(meshDescriptor, "objectThreadgroupSizeIsMultipleOfThreadExecutionWidth");
    v10 = -[MTLToolsObject objectThreadExecutionWidth](self->super.super._baseObject, "objectThreadExecutionWidth");
  }
  v11 = a3->var1 * a3->var0 * a3->var2;
  if (v11 > v8)
    _MTLMessageContextPush_();
  if (v10)
    v12 = v9;
  else
    v12 = 0;
  if (v12 == 1)
  {
    if (v11 % v10)
      _MTLMessageContextPush_();
  }
}

- (int64_t)shaderValidation
{
  id v2;

  v2 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 2;
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    v2 = (id)objc_msgSend(v2, "baseObject");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 2;
  }
  return objc_msgSend(v2, "shaderValidation");
}

- (int64_t)shaderValidationState
{
  id v2;

  v2 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 2;
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    v2 = (id)objc_msgSend(v2, "baseObject");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 2;
  }
  return objc_msgSend(v2, "shaderValidationState");
}

- (unint64_t)attachmentWriteMask
{
  return self->_attachmentWriteMask;
}

- (MTLRenderPipelineDescriptor)descriptor
{
  return self->_descriptor;
}

- (MTLRenderPipelineReflection)reflection
{
  return self->_reflection;
}

- (MTLTileRenderPipelineDescriptor)tileDescriptor
{
  return self->_tileDescriptor;
}

- (MTLMeshRenderPipelineDescriptor)meshDescriptor
{
  return self->_meshDescriptor;
}

@end
