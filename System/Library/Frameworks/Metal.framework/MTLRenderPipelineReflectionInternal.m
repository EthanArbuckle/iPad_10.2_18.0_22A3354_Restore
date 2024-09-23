@implementation MTLRenderPipelineReflectionInternal

- (id)vertexArguments
{
  return self->_vertexArguments;
}

- (id)fragmentArguments
{
  return self->_fragmentArguments;
}

- (MTLRenderPipelineReflectionInternal)initWithVertexData:(id)a3 fragmentData:(id)a4 serializedVertexDescriptor:(id)a5 device:(id)a6 options:(unint64_t)a7 flags:(id)a8
{
  return -[MTLRenderPipelineReflectionInternal initWithVertexData:vertexDynamicLibraries:fragmentData:fragmentDynamicLibraries:serializedVertexDescriptor:device:options:flags:](self, "initWithVertexData:vertexDynamicLibraries:fragmentData:fragmentDynamicLibraries:serializedVertexDescriptor:device:options:flags:", a3, 0, a4, 0, a5, a6, a7, *(_QWORD *)&a8);
}

- (id)vertexBindings
{
  if (self->_vertexBindings)
    return self->_vertexBindings;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (id)fragmentBindings
{
  if (self->_fragmentBindings)
    return self->_fragmentBindings;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLRenderPipelineReflectionInternal;
  -[MTLRenderPipelineReflectionInternal dealloc](&v3, sel_dealloc);
}

- (MTLRenderPipelineReflectionInternal)initWithVertexData:(id)a3 vertexDynamicLibraries:(id)a4 fragmentData:(id)a5 fragmentDynamicLibraries:(id)a6 serializedVertexDescriptor:(id)a7 device:(id)a8 options:(unint64_t)a9 flags:(id)a10
{
  MTLRenderPipelineReflectionInternal *v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t *v20;
  _DWORD *v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  MTLBufferBindingInternal *TraceBufferBinding;
  int DynamicLibraryReflectionData;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t *v55;
  _DWORD *v56;
  int v57;
  unsigned int v58;
  int v59;
  unsigned int v60;
  MTLBufferBindingInternal *v61;
  MTLRenderPipelineReflectionInternal *v62;
  int v63;
  uint64_t v64;
  int v65;
  int v66;
  uint64_t v67;
  NSArray *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t j;
  uint64_t v81;
  uint64_t *v82;
  uint64_t *v83;
  uint64_t *v84;
  uint64_t *v85;
  uint64_t v87;
  id v88;
  unint64_t v89;
  NSObject *v90;
  MTLRenderPipelineReflectionInternal *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t *v98;
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  void *__p;
  uint64_t *v105;
  uint64_t v106;
  objc_super v107;
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v107.receiver = self;
  v107.super_class = (Class)MTLRenderPipelineReflectionInternal;
  v16 = -[MTLRenderPipelineReflectionInternal init](&v107, sel_init);
  v17 = a9;
  v16->_printStyle = 3;
  *(_QWORD *)&v16->_flags = *(_QWORD *)&a10;
  ReflectionValidator<MTLVertexReflectionReader>::Validate();
  v18 = MTLNewReflectionData(a3);
  v19 = MTLNewReflectionPluginData(a3);
  v20 = ReflectionReaderFactory<MTLVertexReflectionReader>::Create(a9, v18);
  (*(void (**)(uint64_t *, id, NSObject *, id))(*v20 + 16))(v20, a8, v18, a7);
  MTLArgumentDeserializer::deserializePluginData(v20[1], v19);
  if (v18)
    dispatch_release(v18);
  if (v19)
    dispatch_release(v19);
  v21 = (_DWORD *)v20[1];
  v16->_traceBufferIndex = v21[10];
  v22 = v21[4];
  v23 = v21[9];
  v24 = (v22 - v23);
  if (v22 == v23 && v21[10] == -1)
    v25 = 0;
  else
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", *(_QWORD *)(v20[1] + 8), v24);
  v16->_vertexArguments = (NSArray *)v25;
  v26 = *(_DWORD *)(v20[1] + 40);
  if (v26 != -1)
  {
    TraceBufferBinding = CreateTraceBufferBinding(v26);
    -[NSArray addObject:](v16->_vertexArguments, "addObject:", TraceBufferBinding);

  }
  __p = 0;
  v105 = 0;
  v106 = 0;
  v90 = a5;
  if (a4)
  {
    v97 = 0;
    std::vector<MTLRasterizationRateLayerDescriptor *>::resize((uint64_t)&__p, objc_msgSend(a4, "count"), &v97);
    DynamicLibraryReflectionData = readDynamicLibraryReflectionData((uint64_t)a8, (uint64_t)__p, a4, a9);
  }
  else
  {
    DynamicLibraryReflectionData = 0;
  }
  v29 = v20[1];
  v30 = *(unsigned int *)(v29 + 32);
  v31 = *(unsigned int *)(v29 + 36);
  v32 = DynamicLibraryReflectionData + -[NSArray count](v16->_vertexArguments, "count");
  v91 = v16;
  if ((_DWORD)v30 + v32)
  {
    v33 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (v30 + v32));
    -[NSArray addObjectsFromArray:](v33, "addObjectsFromArray:", v16->_vertexArguments);
    if ((_DWORD)v30)
    {
      v34 = 0;
      v35 = 8 * v30;
      do
      {
        -[NSArray addObject:](v33, "addObject:", *(_QWORD *)(*(_QWORD *)(v20[1] + 24) + v34));
        v34 += 8;
      }
      while (v35 != v34);
    }
    v87 = v31;
    v88 = a6;
    v36 = v24;
    v89 = a9;
    v37 = (uint64_t *)__p;
    v38 = v105;
    while (v37 != v38)
    {
      v39 = *v37;
      if (*v37)
      {
        v40 = *(unsigned int *)(*(_QWORD *)(v39 + 8) + 32);
        if ((_DWORD)v40)
        {
          v41 = 0;
          v42 = 8 * v40;
          do
          {
            v43 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v39 + 8) + 24) + v41);
            if (!-[NSArray containsObject:](v33, "containsObject:", v43, v87, v88, v89))
              -[NSArray addObject:](v33, "addObject:", v43);
            v41 += 8;
          }
          while (v42 != v41);
        }
      }
      ++v37;
    }
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    v44 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
    LODWORD(v24) = v36;
    a6 = v88;
    v17 = v89;
    v31 = v87;
    if (v44)
    {
      v45 = *(_QWORD *)v101;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v101 != v45)
            objc_enumerationMutation(v33);
          _MTLFixIABReflectionOffsets(*(void **)(*((_QWORD *)&v100 + 1) + 8 * i), a8);
        }
        v44 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
      }
      while (v44);
    }
    v16 = v91;
    v91->_vertexBindings = v33;
  }
  if ((_DWORD)v31)
    v47 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", *(_QWORD *)(v20[1] + 8) + 8 * v24, v31);
  else
    v47 = 0;
  v16->_vertexBuiltInArguments = (NSArray *)v47;
  v48 = v20[2];
  v16->_postVertexDumpStride = *(unsigned int *)(v48 + 108);
  v49 = *(unsigned int *)(v48 + 112);
  if ((_DWORD)v49)
  {
    v50 = v90;
    v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", *(_QWORD *)(v20[2] + 120), v49);
  }
  else
  {
    v51 = 0;
    v50 = v90;
  }
  v16->_postVertexDumpOutputs = (NSArray *)v51;
  ReflectionValidator<MTLVertexReflectionReader>::Validate();
  v52 = MTLNewReflectionData(v50);
  v53 = MTLNewReflectionPluginData(v50);
  v54 = v17;
  v55 = (uint64_t *)ReflectionReaderFactory<MTLFragmentReflectionReader>::Create(v17, v52);
  MTLFragmentReflectionReader::deserialize((uint64_t)v55);
  MTLArgumentDeserializer::deserializePluginData(v55[1], v53);
  if (v52)
    dispatch_release(v52);
  if (v53)
    dispatch_release(v53);
  v56 = (_DWORD *)v55[1];
  v57 = v56[4];
  v59 = v56[9];
  v58 = v56[10];
  if (v58 != -1)
    v91->_traceBufferIndex = v58;
  if (v57 != v59 || v56[10] != -1)
  {
    v91->_fragmentArguments = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", *(_QWORD *)(v55[1] + 8), (v57 - v59));
    v60 = *(_DWORD *)(v55[1] + 40);
    if (v60 != -1)
    {
      v61 = CreateTraceBufferBinding(v60);
      -[NSArray addObject:](v91->_fragmentArguments, "addObject:", v61);

    }
  }
  v97 = 0;
  v98 = 0;
  v99 = 0;
  if (a6)
  {
    v62 = v91;
    v96 = 0;
    std::vector<MTLRasterizationRateLayerDescriptor *>::resize((uint64_t)&v97, objc_msgSend(a6, "count"), &v96);
    v63 = readDynamicLibraryReflectionData((uint64_t)a8, (uint64_t)v97, a6, v54);
  }
  else
  {
    v63 = 0;
    v62 = v91;
  }
  v64 = *(unsigned int *)(v55[1] + 32);
  v65 = -[NSArray count](v62->_fragmentArguments, "count", v87, v88, v89);
  v66 = v64 + v63;
  v67 = (v64 + v63 + v65);
  if (v66 + v65)
  {
    v68 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v67);
    -[NSArray addObjectsFromArray:](v68, "addObjectsFromArray:", v62->_fragmentArguments);
    if ((_DWORD)v64)
    {
      v69 = 0;
      v70 = 8 * v64;
      do
      {
        -[NSArray addObject:](v68, "addObject:", *(_QWORD *)(*(_QWORD *)(v55[1] + 24) + v69));
        v69 += 8;
      }
      while (v70 != v69);
    }
    v71 = v97;
    v72 = v98;
    while (v71 != v72)
    {
      v73 = *v71;
      if (*v71)
      {
        v74 = *(unsigned int *)(*(_QWORD *)(v73 + 8) + 32);
        if ((_DWORD)v74)
        {
          v75 = 0;
          v76 = 8 * v74;
          do
          {
            v77 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v73 + 8) + 24) + v75);
            if (!-[NSArray containsObject:](v68, "containsObject:", v77))
              -[NSArray addObject:](v68, "addObject:", v77);
            v75 += 8;
          }
          while (v76 != v75);
        }
      }
      ++v71;
    }
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v78 = -[NSArray countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v92, v108, 16);
    if (v78)
    {
      v79 = *(_QWORD *)v93;
      do
      {
        for (j = 0; j != v78; ++j)
        {
          if (*(_QWORD *)v93 != v79)
            objc_enumerationMutation(v68);
          _MTLFixIABReflectionOffsets(*(void **)(*((_QWORD *)&v92 + 1) + 8 * j), a8);
        }
        v78 = -[NSArray countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v92, v108, 16);
      }
      while (v78);
    }
    v62 = v91;
    v91->_fragmentBindings = v68;
  }
  v81 = v55[2];
  if (*(_BYTE *)(v81 + 120))
    v62->_imageBlockDataReturn = (MTLBinding *)*(id *)(v81 + 112);
  v62->_vertexPluginReturnData = (NSData *)*(id *)(v20[1] + 48);
  v62->_fragmentPluginReturnData = (NSData *)*(id *)(v55[1] + 48);
  (*(void (**)(uint64_t *))(*v20 + 8))(v20);
  (*(void (**)(uint64_t *))(*v55 + 8))(v55);
  v82 = (uint64_t *)__p;
  v83 = v105;
  while (v82 != v83)
  {
    if (*v82)
      (*(void (**)(uint64_t))(*(_QWORD *)*v82 + 8))(*v82);
    ++v82;
  }
  v85 = v97;
  v84 = v98;
  if (v97 != v98)
  {
    do
    {
      if (*v85)
        (*(void (**)(uint64_t))(*(_QWORD *)*v85 + 8))(*v85);
      ++v85;
    }
    while (v85 != v84);
    v85 = v97;
  }
  if (v85)
  {
    v98 = v85;
    operator delete(v85);
  }
  if (__p)
  {
    v105 = (uint64_t *)__p;
    operator delete(__p);
  }
  return v91;
}

- (_QWORD)initWithReader:(void *)a3 device:(uint64_t)a4 flags:
{
  if (result)
    return -[MTLRenderPipelineReflectionInternal initWithReader:dylibReaders:dylibReaderCount:dylibGlobalBindingCount:device:flags:](result, a2, 0, 0, 0, a3, a4);
  return result;
}

- (_QWORD)initWithReader:(uint64_t)a3 dylibReaders:(unsigned int)a4 dylibReaderCount:(int)a5 dylibGlobalBindingCount:(void *)a6 device:(uint64_t)a7 flags:
{
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  int v16;
  uint64_t *v17;
  unsigned int v18;
  MTLBufferBindingInternal *TraceBufferBinding;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v45.receiver = a1;
  v45.super_class = (Class)MTLRenderPipelineReflectionInternal;
  v13 = objc_msgSendSuper2(&v45, sel_init);
  v14 = v13;
  if (v13)
  {
    v13[1] = a7;
    v13[27] = 4;
    v15 = *(_QWORD *)(a2 + 8);
    *((_DWORD *)v13 + 22) = *(_DWORD *)(v15 + 40);
    v16 = *(_DWORD *)(v15 + 16);
    v38 = *(unsigned int *)(v15 + 36);
    v40 = (v16 - v38);
    v39 = *(_QWORD *)(v15 + 8);
    v17 = *(uint64_t **)(v15 + 24);
    if (v16 || *((_DWORD *)v13 + 22) != -1)
    {
      v13[7] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", v39, v40);
      v18 = *((_DWORD *)v14 + 22);
      if (v18 != -1)
      {
        TraceBufferBinding = CreateTraceBufferBinding(v18);
        objc_msgSend((id)v14[7], "addObject:", TraceBufferBinding);

      }
    }
    v20 = *(unsigned int *)(*(_QWORD *)(a2 + 8) + 32);
    v21 = objc_msgSend((id)v14[7], "count");
    v22 = v20 + a5;
    v23 = (v20 + a5 + v21);
    if (v22 + v21)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v23);
      objc_msgSend(v24, "addObjectsFromArray:", v14[7]);
      if ((_DWORD)v20)
      {
        do
        {
          v25 = *v17++;
          objc_msgSend(v24, "addObject:", v25);
          --v20;
        }
        while (v20);
      }
      if (a4)
      {
        v26 = 0;
        v27 = a4;
        do
        {
          v28 = *(_QWORD *)(a3 + 8 * v26);
          if (v28)
          {
            v29 = *(unsigned int *)(*(_QWORD *)(v28 + 8) + 32);
            if ((_DWORD)v29)
            {
              v30 = 0;
              v31 = 8 * v29;
              do
              {
                v32 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v28 + 8) + 24) + v30);
                if ((objc_msgSend(v24, "containsObject:", v32) & 1) == 0)
                  objc_msgSend(v24, "addObject:", v32);
                v30 += 8;
              }
              while (v31 != v30);
            }
          }
          ++v26;
        }
        while (v26 != v27);
      }
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v33 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v42 != v35)
              objc_enumerationMutation(v24);
            _MTLFixIABReflectionOffsets(*(void **)(*((_QWORD *)&v41 + 1) + 8 * i), a6);
          }
          v34 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        }
        while (v34);
      }
      v14[24] = v24;
    }
    if ((_DWORD)v38)
      v14[8] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v39 + 8 * v40, v38);
  }
  return v14;
}

- (_QWORD)initWithFragmentReader:(void *)a3 device:(uint64_t)a4 flags:
{
  if (result)
    return -[MTLRenderPipelineReflectionInternal initWithFragmentReader:dylibReaders:dylibReaderCount:dylibGlobalBindingCount:device:flags:](result, a2, 0, 0, 0, a3, a4);
  return result;
}

- (_QWORD)initWithFragmentReader:(uint64_t)a3 dylibReaders:(unsigned int)a4 dylibReaderCount:(int)a5 dylibGlobalBindingCount:(void *)a6 device:(uint64_t)a7 flags:
{
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  if (!a1)
    return 0;
  v8 = -[MTLRenderPipelineReflectionInternal initWithReader:dylibReaders:dylibReaderCount:dylibGlobalBindingCount:device:flags:](a1, a2, a3, a4, a5, a6, a7);
  v9 = v8;
  if (v8)
  {
    v8[27] = 4;
    v10 = *(_QWORD *)(a2 + 16);
    if (*(_BYTE *)(v10 + 120))
      v8[9] = *(id *)(v10 + 112);
  }
  return v9;
}

- (id)initWithTileData:(void *)a3 device:(uint64_t)a4 options:(uint64_t)a5 flags:
{
  id v9;
  _QWORD *v10;
  objc_super v12;
  _QWORD v13[13];
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v12.receiver = a1;
  v12.super_class = (Class)MTLRenderPipelineReflectionInternal;
  v9 = objc_msgSendSuper2(&v12, sel_init);
  if (v9)
  {
    MTLArgumentDeserializer::MTLArgumentDeserializer((MTLArgumentDeserializer *)v13, a4);
    v13[0] = &off_1E0FE14F0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = "stageInBuffer";
    v10 = ReflectionReaderFactory<MTLComputeReflectionReader>::Create(a4, a2);
    (*(void (**)(_QWORD *, void *, NSObject *, _QWORD))(*v10 + 16))(v10, a3, a2, 0);
    -[MTLRenderPipelineReflectionInternal initWithReader:dylibReaders:dylibReaderCount:dylibGlobalBindingCount:device:flags:](v9, (uint64_t)v10, 0, 0, 0, a3, a5);
    (*(void (**)(_QWORD *))(*v10 + 8))(v10);
    MTLInputStageReflectionDeserializer::~MTLInputStageReflectionDeserializer((MTLInputStageReflectionDeserializer *)v13);
  }
  return v9;
}

- (MTLRenderPipelineReflectionInternal)initWithTileData:(id)a3 functionType:(unint64_t)a4 device:(id)a5 options:(unint64_t)a6 flags:(id)a7
{
  return -[MTLRenderPipelineReflectionInternal initWithTileData:tileDynamicLibraries:functionType:device:options:flags:](self, "initWithTileData:tileDynamicLibraries:functionType:device:options:flags:", a3, 0, a4, a5, a6, *(_QWORD *)&a7);
}

- (MTLRenderPipelineReflectionInternal)initWithTileData:(id)a3 tileDynamicLibraries:(id)a4 functionType:(unint64_t)a5 device:(id)a6 options:(unint64_t)a7 flags:(id)a8
{
  uint64_t v8;
  MTLRenderPipelineReflectionInternal *v14;
  int DynamicLibraryReflectionData;
  NSObject *v16;
  _QWORD *v17;
  char *v18;
  char *v19;
  MTLArgumentReader *v20;
  char *v21;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  objc_super v27;

  v8 = *(_QWORD *)&a8;
  v27.receiver = self;
  v27.super_class = (Class)MTLRenderPipelineReflectionInternal;
  v14 = -[MTLRenderPipelineReflectionInternal init](&v27, sel_init);
  if (!v14)
    return v14;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  if (a4)
  {
    v23 = 0;
    std::vector<MTLRasterizationRateLayerDescriptor *>::resize((uint64_t)&v24, objc_msgSend(a4, "count"), &v23);
    DynamicLibraryReflectionData = readDynamicLibraryReflectionData((uint64_t)a6, (uint64_t)v24, a4, a7);
  }
  else
  {
    DynamicLibraryReflectionData = 0;
  }
  v16 = MTLNewReflectionData(a3);
  if (a5 == 2)
  {
    ReflectionValidator<MTLVertexReflectionReader>::Validate();
    v20 = ReflectionReaderFactory<MTLFragmentReflectionReader>::Create(a7, v16);
    MTLFragmentReflectionReader::deserialize((uint64_t)v20);
    -[MTLRenderPipelineReflectionInternal initWithFragmentReader:dylibReaders:dylibReaderCount:dylibGlobalBindingCount:device:flags:](v14, (uint64_t)v20, (uint64_t)v24, (unint64_t)(v25 - v24) >> 3, DynamicLibraryReflectionData, a6, v8);
    if (v16)
      dispatch_release(v16);
    if (v20)
      (*(void (**)(MTLArgumentReader *))(*(_QWORD *)v20 + 8))(v20);
    v18 = v24;
    v21 = v25;
    if (v24 == v25)
      goto LABEL_23;
    do
    {
      if (*(_QWORD *)v18)
        (*(void (**)(_QWORD))(**(_QWORD **)v18 + 8))(*(_QWORD *)v18);
      v18 += 8;
    }
    while (v18 != v21);
  }
  else
  {
    if (a5 != 3)
      abort();
    ReflectionValidator<MTLVertexReflectionReader>::Validate();
    v17 = ReflectionReaderFactory<MTLComputeReflectionReader>::Create(a7, v16);
    (*(void (**)(_QWORD *, id, NSObject *, _QWORD))(*v17 + 16))(v17, a6, v16, 0);
    -[MTLRenderPipelineReflectionInternal initWithReader:dylibReaders:dylibReaderCount:dylibGlobalBindingCount:device:flags:](v14, (uint64_t)v17, (uint64_t)v24, (unint64_t)(v25 - v24) >> 3, DynamicLibraryReflectionData, a6, v8);
    if (v16)
      dispatch_release(v16);
    (*(void (**)(_QWORD *))(*v17 + 8))(v17);
    v18 = v24;
    v19 = v25;
    if (v24 == v25)
      goto LABEL_23;
    do
    {
      if (*(_QWORD *)v18)
        (*(void (**)(_QWORD))(**(_QWORD **)v18 + 8))(*(_QWORD *)v18);
      v18 += 8;
    }
    while (v18 != v19);
  }
  v18 = v24;
LABEL_23:
  if (v18)
  {
    v25 = v18;
    operator delete(v18);
  }
  return v14;
}

- (MTLRenderPipelineReflectionInternal)initWithObjectData:(id)a3 meshData:(id)a4 fragmentData:(id)a5 device:(id)a6 options:(unint64_t)a7 flags:(id)a8
{
  return -[MTLRenderPipelineReflectionInternal initWithObjectData:objectDynamicLibraries:meshData:meshDynamicLibraries:fragmentData:fragmentDynamicLibraries:device:options:flags:](self, "initWithObjectData:objectDynamicLibraries:meshData:meshDynamicLibraries:fragmentData:fragmentDynamicLibraries:device:options:flags:", a3, 0, a4, 0, a5, 0, a6, a7, *(_QWORD *)&a8);
}

- (MTLRenderPipelineReflectionInternal)initWithObjectData:(id)a3 objectDynamicLibraries:(id)a4 meshData:(id)a5 meshDynamicLibraries:(id)a6 fragmentData:(id)a7 fragmentDynamicLibraries:(id)a8 device:(id)a9 options:(unint64_t)a10 flags:(id)a11
{
  MTLRenderPipelineReflectionInternal *v15;
  uint64_t *v16;
  unsigned int v17;
  MTLBufferBindingInternal *TraceBufferBinding;
  int DynamicLibraryReflectionData;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  uint64_t *v38;
  uint64_t *v39;
  dispatch_data_t v40;
  NSObject *v41;
  uint64_t *v42;
  unsigned int v43;
  MTLBufferBindingInternal *v44;
  unint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  int v51;
  uint64_t v52;
  NSArray *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  uint64_t v66;
  unsigned int v67;
  uint64_t *v68;
  uint64_t *v69;
  NSObject *v70;
  NSObject *v71;
  NSObject *v72;
  uint64_t *v73;
  unsigned int v74;
  int v75;
  unsigned int v76;
  MTLBufferBindingInternal *v77;
  int v78;
  unint64_t v79;
  uint64_t v80;
  int v81;
  int v82;
  uint64_t v83;
  NSArray *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t k;
  NSObject *v90;
  uint64_t *v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unsigned int v98;
  uint64_t v99;
  MTLBinding *v100;
  uint64_t *v101;
  uint64_t *v102;
  uint64_t v104;
  dispatch_object_t v105;
  dispatch_object_t v106;
  uint64_t v109;
  id v110;
  uint64_t v111;
  NSObject *data;
  dispatch_object_t dataa;
  NSObject *object;
  NSObject *objecta;
  NSObject *v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  uint64_t v129;
  void *__p;
  uint64_t *v131;
  uint64_t v132;
  objc_super v133;
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v133.receiver = self;
  v133.super_class = (Class)MTLRenderPipelineReflectionInternal;
  v15 = -[MTLRenderPipelineReflectionInternal init](&v133, sel_init);
  *(_QWORD *)&v15->_flags = *(_QWORD *)&a11;
  v15->_printStyle = 26;
  if ((a10 & 0x200000000) != 0)
    object = MTLNewEmulationReflectionData(a3);
  else
    object = MTLNewReflectionData(a3);
  data = MTLNewReflectionPluginData(a3);
  v16 = (uint64_t *)ReflectionReaderFactory<MTLObjectReflectionReader>::Create(a10, object);
  MTLFragmentReflectionReader::deserialize((uint64_t)v16);
  MTLArgumentDeserializer::deserializePluginData(v16[1], data);
  v111 = (*(_DWORD *)(v16[1] + 16) - *(_DWORD *)(v16[1] + 36));
  if ((_DWORD)v111 || *(_DWORD *)(v16[1] + 40) != -1)
  {
    v15->_objectArguments = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", *(_QWORD *)(v16[1] + 8), v111);
    v17 = *(_DWORD *)(v16[1] + 40);
    if (v17 != -1)
    {
      TraceBufferBinding = CreateTraceBufferBinding(v17);
      -[NSArray addObject:](v15->_objectArguments, "addObject:", TraceBufferBinding);

    }
  }
  __p = 0;
  v131 = 0;
  v132 = 0;
  if (a4)
  {
    v129 = 0;
    std::vector<MTLRasterizationRateLayerDescriptor *>::resize((uint64_t)&__p, objc_msgSend(a4, "count"), &v129);
    DynamicLibraryReflectionData = readDynamicLibraryReflectionData((uint64_t)a9, (uint64_t)__p, a4, a10);
  }
  else
  {
    DynamicLibraryReflectionData = 0;
  }
  v20 = v16[1];
  v21 = *(unsigned int *)(v20 + 32);
  v22 = *(unsigned int *)(v20 + 36);
  v23 = DynamicLibraryReflectionData + -[NSArray count](v15->_objectArguments, "count");
  v110 = a7;
  if ((_DWORD)v21 + v23)
  {
    v24 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (v21 + v23));
    -[NSArray addObjectsFromArray:](v24, "addObjectsFromArray:", v15->_objectArguments);
    if ((_DWORD)v21)
    {
      v25 = 0;
      v26 = 8 * v21;
      do
      {
        -[NSArray addObject:](v24, "addObject:", *(_QWORD *)(*(_QWORD *)(v16[1] + 24) + v25));
        v25 += 8;
      }
      while (v26 != v25);
    }
    v104 = v22;
    v105 = (dispatch_object_t)a5;
    v28 = (uint64_t *)__p;
    v27 = v131;
    while (v28 != v27)
    {
      v29 = *v28;
      if (*v28)
      {
        v30 = *(unsigned int *)(*(_QWORD *)(v29 + 8) + 32);
        if ((_DWORD)v30)
        {
          v31 = 0;
          v32 = 8 * v30;
          do
          {
            v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v29 + 8) + 24) + v31);
            if (!-[NSArray containsObject:](v24, "containsObject:", v33))
              -[NSArray addObject:](v24, "addObject:", v33);
            v31 += 8;
          }
          while (v32 != v31);
        }
      }
      ++v28;
    }
    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    v34 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v125, v136, 16);
    a7 = v110;
    v22 = v104;
    a5 = v105;
    if (v34)
    {
      v35 = *(_QWORD *)v126;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v126 != v35)
            objc_enumerationMutation(v24);
          _MTLFixIABReflectionOffsets(*(void **)(*((_QWORD *)&v125 + 1) + 8 * i), a9);
        }
        v34 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v125, v136, 16);
      }
      while (v34);
    }
    v15->_objectBindings = v24;
  }
  if ((_DWORD)v22)
    v15->_objectBuiltInArguments = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", *(_QWORD *)(v16[1] + 8) + 8 * v111, v22);
  v37 = v16[1];
  v15->_traceBufferIndex = *(_DWORD *)(v37 + 40);
  v15->_objectPluginReturnData = (NSData *)*(id *)(v37 + 48);
  (*(void (**)(uint64_t *))(*v16 + 8))(v16);
  v38 = (uint64_t *)__p;
  v39 = v131;
  if (__p != v131)
  {
    do
    {
      if (*v38)
        (*(void (**)(uint64_t))(*(_QWORD *)*v38 + 8))(*v38);
      ++v38;
    }
    while (v38 != v39);
    v38 = (uint64_t *)__p;
  }
  if (v38)
  {
    v131 = v38;
    operator delete(v38);
  }
  if (object)
    dispatch_release(object);
  if (data)
    dispatch_release(data);
  if ((a10 & 0x200000000) != 0)
    v40 = MTLNewEmulationReflectionData(a5);
  else
    v40 = MTLNewReflectionData(a5);
  v41 = v40;
  objecta = MTLNewReflectionPluginData(a5);
  v42 = (uint64_t *)ReflectionReaderFactory<MTLMeshReflectionReader>::Create(a10, v41);
  MTLFragmentReflectionReader::deserialize((uint64_t)v42);
  MTLArgumentDeserializer::deserializePluginData(v42[1], objecta);
  dataa = (dispatch_object_t)(*(_DWORD *)(v42[1] + 16) - *(_DWORD *)(v42[1] + 36));
  if ((_DWORD)dataa || *(_DWORD *)(v42[1] + 40) != -1)
  {
    v15->_meshArguments = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", *(_QWORD *)(v42[1] + 8), dataa);
    v43 = *(_DWORD *)(v42[1] + 40);
    if (v43 != -1)
    {
      v44 = CreateTraceBufferBinding(v43);
      -[NSArray addObject:](v15->_meshArguments, "addObject:", v44);

    }
  }
  v106 = v41;
  __p = 0;
  v131 = 0;
  v132 = 0;
  if (a6)
  {
    v45 = objc_msgSend(a6, "count");
    v129 = 0;
    std::vector<MTLRasterizationRateLayerDescriptor *>::resize((uint64_t)&__p, v45, &v129);
    v46 = readDynamicLibraryReflectionData((uint64_t)a9, (uint64_t)__p, a6, a10);
  }
  else
  {
    v46 = 0;
  }
  v47 = v42[1];
  v48 = *(unsigned int *)(v47 + 32);
  v49 = *(unsigned int *)(v47 + 36);
  v50 = -[NSArray count](v15->_meshArguments, "count");
  v51 = v48 + v46;
  v52 = (v48 + v46 + v50);
  if (v51 + v50)
  {
    v53 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v52);
    -[NSArray addObjectsFromArray:](v53, "addObjectsFromArray:", v15->_meshArguments);
    if ((_DWORD)v48)
    {
      v54 = 0;
      v55 = 8 * v48;
      do
      {
        -[NSArray addObject:](v53, "addObject:", *(_QWORD *)(*(_QWORD *)(v42[1] + 24) + v54));
        v54 += 8;
      }
      while (v55 != v54);
    }
    v109 = v49;
    v57 = (uint64_t *)__p;
    v56 = v131;
    while (v57 != v56)
    {
      v58 = *v57;
      if (*v57)
      {
        v59 = *(unsigned int *)(*(_QWORD *)(v58 + 8) + 32);
        if ((_DWORD)v59)
        {
          v60 = 0;
          v61 = 8 * v59;
          do
          {
            v62 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v58 + 8) + 24) + v60);
            if (!-[NSArray containsObject:](v53, "containsObject:", v62))
              -[NSArray addObject:](v53, "addObject:", v62);
            v60 += 8;
          }
          while (v61 != v60);
        }
      }
      ++v57;
    }
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v63 = -[NSArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v121, v135, 16);
    v49 = v109;
    a7 = v110;
    if (v63)
    {
      v64 = *(_QWORD *)v122;
      do
      {
        for (j = 0; j != v63; ++j)
        {
          if (*(_QWORD *)v122 != v64)
            objc_enumerationMutation(v53);
          _MTLFixIABReflectionOffsets(*(void **)(*((_QWORD *)&v121 + 1) + 8 * j), a9);
        }
        v63 = -[NSArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v121, v135, 16);
      }
      while (v63);
    }
    v15->_meshBindings = v53;
  }
  if ((_DWORD)v49)
    v15->_meshBuiltInArguments = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", *(_QWORD *)(v42[1] + 8) + 8 * dataa, v49);
  v66 = v42[1];
  v67 = *(_DWORD *)(v66 + 40);
  if (v67 != -1)
    v15->_traceBufferIndex = v67;
  v15->_meshPluginReturnData = (NSData *)*(id *)(v66 + 48);
  (*(void (**)(uint64_t *))(*v42 + 8))(v42);
  v68 = (uint64_t *)__p;
  v69 = v131;
  if (__p == v131)
  {
    v70 = v106;
    if (__p)
    {
LABEL_86:
      v131 = v68;
      operator delete(v68);
    }
  }
  else
  {
    v70 = v106;
    do
    {
      if (*v68)
        (*(void (**)(uint64_t))(*(_QWORD *)*v68 + 8))(*v68);
      ++v68;
    }
    while (v68 != v69);
    v68 = (uint64_t *)__p;
    if (__p)
      goto LABEL_86;
  }
  if (v70)
    dispatch_release(v70);
  if (objecta)
    dispatch_release(objecta);
  v71 = MTLNewReflectionData(a7);
  v72 = MTLNewReflectionPluginData(a7);
  v73 = (uint64_t *)ReflectionReaderFactory<MTLFragmentReflectionReader>::Create(a10, v71);
  MTLFragmentReflectionReader::deserialize((uint64_t)v73);
  MTLArgumentDeserializer::deserializePluginData(v73[1], v72);
  v74 = *(_DWORD *)(v73[1] + 16);
  if (*(_QWORD *)(v73[1] + 36) != (v74 | 0xFFFFFFFF00000000))
  {
    v75 = *(_DWORD *)(v73[1] + 36);
    v15->_fragmentArguments = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", *(_QWORD *)(v73[1] + 8), v74 - v75);
    v76 = *(_DWORD *)(v73[1] + 40);
    if (v76 != -1)
    {
      v77 = CreateTraceBufferBinding(v76);
      -[NSArray addObject:](v15->_fragmentArguments, "addObject:", v77);

    }
  }
  __p = 0;
  v131 = 0;
  v132 = 0;
  v78 = (int)a8;
  if (a8)
  {
    v79 = objc_msgSend(a8, "count");
    v129 = 0;
    std::vector<MTLRasterizationRateLayerDescriptor *>::resize((uint64_t)&__p, v79, &v129);
    v78 = readDynamicLibraryReflectionData((uint64_t)a9, (uint64_t)__p, a8, a10);
  }
  v80 = *(unsigned int *)(v73[1] + 32);
  v81 = -[NSArray count](v15->_fragmentArguments, "count");
  v82 = v80 + v78;
  v83 = (v80 + v78 + v81);
  if (v82 + v81)
  {
    v84 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v83);
    -[NSArray addObjectsFromArray:](v84, "addObjectsFromArray:", v15->_fragmentArguments);
    if ((_DWORD)v80)
    {
      v85 = 0;
      v86 = 8 * v80;
      do
      {
        -[NSArray addObject:](v84, "addObject:", *(_QWORD *)(*(_QWORD *)(v73[1] + 24) + v85));
        v85 += 8;
      }
      while (v86 != v85);
    }
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v87 = -[NSArray countByEnumeratingWithState:objects:count:](v84, "countByEnumeratingWithState:objects:count:", &v117, v134, 16);
    if (v87)
    {
      v88 = *(_QWORD *)v118;
      do
      {
        for (k = 0; k != v87; ++k)
        {
          if (*(_QWORD *)v118 != v88)
            objc_enumerationMutation(v84);
          _MTLFixIABReflectionOffsets(*(void **)(*((_QWORD *)&v117 + 1) + 8 * k), a9);
        }
        v87 = -[NSArray countByEnumeratingWithState:objects:count:](v84, "countByEnumeratingWithState:objects:count:", &v117, v134, 16);
      }
      while (v87);
    }
    v116 = v71;
    v90 = v72;
    v91 = (uint64_t *)__p;
    v92 = v131;
    while (v91 != v92)
    {
      v93 = *v91;
      if (*v91)
      {
        v94 = *(unsigned int *)(*(_QWORD *)(v93 + 8) + 32);
        if ((_DWORD)v94)
        {
          v95 = 0;
          v96 = 8 * v94;
          do
          {
            v97 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v93 + 8) + 24) + v95);
            if (!-[NSArray containsObject:](v84, "containsObject:", v97))
              -[NSArray addObject:](v84, "addObject:", v97);
            v95 += 8;
          }
          while (v96 != v95);
        }
      }
      ++v91;
    }
    v15->_fragmentBindings = v84;
    v72 = v90;
    v71 = v116;
  }
  v98 = *(_DWORD *)(v73[1] + 40);
  if (v98 != -1)
    v15->_traceBufferIndex = v98;
  v99 = v73[2];
  if (*(_BYTE *)(v99 + 120))
    v100 = (MTLBinding *)*(id *)(v99 + 112);
  else
    v100 = 0;
  v15->_imageBlockDataReturn = v100;
  v15->_fragmentPluginReturnData = (NSData *)*(id *)(v73[1] + 48);
  (*(void (**)(uint64_t *))(*v73 + 8))(v73);
  v101 = (uint64_t *)__p;
  v102 = v131;
  if (__p != v131)
  {
    do
    {
      if (*v101)
        (*(void (**)(uint64_t))(*(_QWORD *)*v101 + 8))(*v101);
      ++v101;
    }
    while (v101 != v102);
    v101 = (uint64_t *)__p;
  }
  if (v101)
  {
    v131 = v101;
    operator delete(v101);
  }
  if (v71)
    dispatch_release(v71);
  if (v72)
    dispatch_release(v72);
  return v15;
}

- (void)setPerformanceStatistics:(id)a3
{
  id v5;

  v5 = a3;

  self->_performanceStatistics = (NSDictionary *)a3;
}

- (id)performanceStatistics
{
  return self->_performanceStatistics;
}

- (unsigned)traceBufferIndex
{
  return self->_traceBufferIndex;
}

- (id)vertexPluginReturnData
{
  return self->_vertexPluginReturnData;
}

- (id)fragmentPluginReturnData
{
  return self->_fragmentPluginReturnData;
}

- (id)constantSamplerUniqueIdentifiers
{
  return self->_constantSamplerUniqueIdentifiers;
}

- (id)constantSamplerDescriptors
{
  return self->_constantSamplerDescriptors;
}

- (void)setConstantSamplerUniqueIdentifiers:(id)a3
{
  NSArray *constantSamplerUniqueIdentifiers;

  constantSamplerUniqueIdentifiers = self->_constantSamplerUniqueIdentifiers;
  if (constantSamplerUniqueIdentifiers != a3)
  {

    self->_constantSamplerUniqueIdentifiers = (NSArray *)a3;
  }
}

- (void)setConstantSamplerDescriptorsFromBitmasks:(unint64_t *)a3 count:(unint64_t)a4
{

  self->_constantSamplerDescriptors = (NSArray *)_MTLCreateConstantSamplerDescriptorsFromBitmasks(a4, a3);
}

- (void)setConstantSamplerDescriptorsFromBitmasks:(unint64_t *)a3 stride:(unsigned int)a4 count:(unint64_t)a5
{

  self->_constantSamplerDescriptors = (NSArray *)_MTLCreateConstantSamplerDescriptorsFromBitmasksStrided(a5, a4, a3);
}

- ($A51142D07271D8AEC4984BC318786978)usageFlags
{
  return ($A51142D07271D8AEC4984BC318786978)*(_QWORD *)&self->_flags;
}

- (id)vertexBuiltInArguments
{
  return self->_vertexBuiltInArguments;
}

- (unint64_t)postVertexDumpStride
{
  return self->_postVertexDumpStride;
}

- (id)postVertexDumpOutputs
{
  return self->_postVertexDumpOutputs;
}

- (id)tileArguments
{
  return self->_tileArguments;
}

- (id)imageBlockDataReturn
{
  return self->_imageBlockDataReturn;
}

- (id)objectArguments
{
  return self->_objectArguments;
}

- (id)meshArguments
{
  return self->_meshArguments;
}

- (id)objectBuiltInArguments
{
  return self->_objectBuiltInArguments;
}

- (id)meshBuiltInArguments
{
  return self->_meshBuiltInArguments;
}

- (id)objectPluginReturnData
{
  return self->_objectPluginReturnData;
}

- (id)meshPluginReturnData
{
  return self->_meshPluginReturnData;
}

- (id)tileBindings
{
  if (self->_tileBindings)
    return self->_tileBindings;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (id)objectBindings
{
  if (self->_objectBindings)
    return self->_objectBindings;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (id)meshBindings
{
  if (self->_meshBindings)
    return self->_meshBindings;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  int v22;
  const __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  int v30;
  const __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  int v38;
  const __CFString *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t n;
  void *v45;
  int v46;
  const __CFString *v47;
  uint64_t v49;
  MTLRenderPipelineReflectionInternal *v50;
  NSArray *obj;
  NSArray *obja;
  NSArray *objb;
  NSArray *objc;
  NSArray *objd;
  objc_super v56;
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
  _QWORD v77[3];
  _BYTE v78[128];
  _QWORD v79[3];
  _QWORD v80[2];
  _QWORD v81[3];
  _BYTE v82[128];
  _QWORD v83[3];
  _QWORD v84[2];
  _QWORD v85[3];
  _BYTE v86[128];
  _QWORD v87[3];
  _QWORD v88[2];
  _QWORD v89[3];
  _BYTE v90[128];
  _QWORD v91[3];
  _QWORD v92[2];
  _QWORD v93[3];
  _BYTE v94[128];
  _QWORD v95[3];
  _QWORD v96[4];

  v96[2] = *MEMORY[0x1E0C80C00];
  v49 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v5 = a3 + 8;
  v6 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", v5, CFSTR(" "), 0);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 128);
  v50 = self;
  if ((self->_printStyle & 8) != 0)
  {
    v96[0] = v49;
    v96[1] = CFSTR("Object Bindings:");
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 2));
    v95[0] = v6;
    v95[1] = CFSTR("bindingsCount =");
    v95[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](self->_objectBindings, "count"));
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 3));
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    obj = self->_objectBindings;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v74 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "isArgument");
          v15 = CFSTR("Global");
          if (v14)
            v15 = CFSTR("Argument");
          v93[0] = v6;
          v93[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %u:"), v15, v10 + i);
          v93[2] = objc_msgSend(v13, "formattedDescription:", v5);
          objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 3));
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
        v10 = (v10 + i);
      }
      while (v9);
    }
  }
  if ((v50->_printStyle & 0x10) != 0)
  {
    v92[0] = v49;
    v92[1] = CFSTR("Mesh Bindings:");
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 2));
    v91[0] = v6;
    v91[1] = CFSTR("bindingsCount =");
    v91[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](v50->_meshBindings, "count"));
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 3));
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    obja = v50->_meshBindings;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v69, v90, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v70;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v70 != v19)
            objc_enumerationMutation(obja);
          v21 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
          v22 = objc_msgSend(v21, "isArgument");
          v23 = CFSTR("Global");
          if (v22)
            v23 = CFSTR("Argument");
          v89[0] = v6;
          v89[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %u:"), v23, v18 + j);
          v89[2] = objc_msgSend(v21, "formattedDescription:", v5);
          objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 3));
        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v69, v90, 16);
        v18 = (v18 + j);
      }
      while (v17);
    }
  }
  if ((v50->_printStyle & 1) != 0)
  {
    v88[0] = v49;
    v88[1] = CFSTR("Vertex Bindings:");
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2));
    v87[0] = v6;
    v87[1] = CFSTR("bindingsCount =");
    v87[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](v50->_vertexBindings, "count"));
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 3));
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    objb = v50->_vertexBindings;
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v65, v86, 16);
    if (v24)
    {
      v25 = v24;
      v26 = 0;
      v27 = *(_QWORD *)v66;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v66 != v27)
            objc_enumerationMutation(objb);
          v29 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * k);
          v30 = objc_msgSend(v29, "isArgument");
          v31 = CFSTR("Global");
          if (v30)
            v31 = CFSTR("Argument");
          v85[0] = v6;
          v85[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %u:"), v31, v26 + k);
          v85[2] = objc_msgSend(v29, "formattedDescription:", v5);
          objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 3));
        }
        v25 = -[NSArray countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v65, v86, 16);
        v26 = (v26 + k);
      }
      while (v25);
    }
  }
  if ((v50->_printStyle & 2) != 0)
  {
    v84[0] = v49;
    v84[1] = CFSTR("Fragment Bindings:");
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 2));
    v83[0] = v6;
    v83[1] = CFSTR("bindingsCount =");
    v83[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](v50->_fragmentBindings, "count"));
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 3));
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    objc = v50->_fragmentBindings;
    v32 = -[NSArray countByEnumeratingWithState:objects:count:](objc, "countByEnumeratingWithState:objects:count:", &v61, v82, 16);
    if (v32)
    {
      v33 = v32;
      v34 = 0;
      v35 = *(_QWORD *)v62;
      do
      {
        for (m = 0; m != v33; ++m)
        {
          if (*(_QWORD *)v62 != v35)
            objc_enumerationMutation(objc);
          v37 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * m);
          v38 = objc_msgSend(v37, "isArgument");
          v39 = CFSTR("Global");
          if (v38)
            v39 = CFSTR("Argument");
          v81[0] = v6;
          v81[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %u:"), v39, v34 + m);
          v81[2] = objc_msgSend(v37, "formattedDescription:", v5);
          objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 3));
        }
        v33 = -[NSArray countByEnumeratingWithState:objects:count:](objc, "countByEnumeratingWithState:objects:count:", &v61, v82, 16);
        v34 = (v34 + m);
      }
      while (v33);
    }
  }
  if ((v50->_printStyle & 4) != 0)
  {
    v80[0] = v49;
    v80[1] = CFSTR("Tile Bindings:");
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2));
    v79[0] = v6;
    v79[1] = CFSTR("bindingsCount =");
    v79[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](v50->_tileBindings, "count"));
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 3));
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    objd = v50->_tileBindings;
    v40 = -[NSArray countByEnumeratingWithState:objects:count:](objd, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
    if (v40)
    {
      v41 = v40;
      v42 = 0;
      v43 = *(_QWORD *)v58;
      do
      {
        for (n = 0; n != v41; ++n)
        {
          if (*(_QWORD *)v58 != v43)
            objc_enumerationMutation(objd);
          v45 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * n);
          v46 = objc_msgSend(v45, "isArgument");
          v47 = CFSTR("Global");
          if (v46)
            v47 = CFSTR("Argument");
          v77[0] = v6;
          v77[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %u:"), v47, v42 + n);
          v77[2] = objc_msgSend(v45, "formattedDescription:", v5);
          objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 3));
        }
        v41 = -[NSArray countByEnumeratingWithState:objects:count:](objd, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
        v42 = (v42 + n);
      }
      while (v41);
    }
  }
  v56.receiver = v50;
  v56.super_class = (Class)MTLRenderPipelineReflectionInternal;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), -[MTLRenderPipelineReflectionInternal description](&v56, sel_description), objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLRenderPipelineReflectionInternal formattedDescription:](self, "formattedDescription:", 0);
}

@end
