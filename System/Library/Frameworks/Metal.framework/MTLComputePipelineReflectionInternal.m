@implementation MTLComputePipelineReflectionInternal

- (MTLComputePipelineReflectionInternal)initWithSerializedData:(id)a3 serializedStageInputDescriptor:(id)a4 device:(id)a5 options:(unint64_t)a6 flags:(id)a7
{
  return -[MTLComputePipelineReflectionInternal initWithSerializedData:dynamicLibraries:serializedStageInputDescriptor:device:options:flags:](self, "initWithSerializedData:dynamicLibraries:serializedStageInputDescriptor:device:options:flags:", a3, 0, a4, a5, a6, *(_QWORD *)&a7);
}

- (id)arguments
{
  return self->_arguments;
}

- (MTLComputePipelineReflectionInternal)initWithSerializedData:(id)a3 dynamicLibraries:(id)a4 serializedStageInputDescriptor:(id)a5 device:(id)a6 options:(unint64_t)a7 flags:(id)a8
{
  uint64_t v8;
  MTLComputePipelineReflectionInternal *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  MTLBufferBindingInternal *v23;
  int DynamicLibraryReflectionData;
  uint64_t v25;
  int v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t v54;
  objc_super v55;
  _BYTE v56[128];
  uint64_t v57;

  v8 = *(_QWORD *)&a8;
  v57 = *MEMORY[0x1E0C80C00];
  v55.receiver = self;
  v55.super_class = (Class)MTLComputePipelineReflectionInternal;
  v14 = -[MTLComputePipelineReflectionInternal init](&v55, sel_init);
  *(_QWORD *)&v14->_flags = v8;
  v15 = MTLNewReflectionData(a3);
  v16 = MTLNewReflectionPluginData(a3);
  ReflectionValidator<MTLVertexReflectionReader>::Validate();
  v17 = ReflectionReaderFactory<MTLComputeReflectionReader>::Create(a7, v15);
  (*(void (**)(uint64_t *, id, NSObject *, id))(*v17 + 16))(v17, a6, v15, a5);
  MTLArgumentDeserializer::deserializePluginData(v17[1], v16);
  if (v15)
    dispatch_release(v15);
  if (v16)
    dispatch_release(v16);
  v18 = v17[1];
  v19 = *(_DWORD *)(v18 + 16);
  v20 = *(_DWORD *)(v18 + 36);
  LODWORD(v14->_pluginReturnData) = *(_DWORD *)(v18 + 40);
  v21 = v19 - v20;
  v14->_constantSamplerUniqueIdentifiers = (NSArray *)*(id *)(v18 + 48);
  if (v19 == v20 && LODWORD(v14->_pluginReturnData) == -1)
    v22 = 0;
  else
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", *(_QWORD *)(v17[1] + 8), (v19 - v20));
  v14->_arguments = (NSArray *)v22;
  if (LODWORD(v14->_pluginReturnData) != -1)
  {
    LOBYTE(v44) = 0;
    v23 = -[MTLBufferBindingInternal initWithName:type:access:isActive:locationIndex:arraySize:dataType:pixelFormat:aluType:isConstantBuffer:dataSize:alignment:]([MTLBufferBindingInternal alloc], "initWithName:type:access:isActive:locationIndex:arraySize:dataType:pixelFormat:aluType:isConstantBuffer:dataSize:alignment:", CFSTR("__resource_tracking_impl_trace_buffer"), 0, 1, 1, LODWORD(v14->_pluginReturnData), 0, 45, 0, 45, v44, 1, 1);
    -[MTLBindingInternal setIsArgument:](v23, "setIsArgument:", 1);
    -[NSArray addObject:](v14->_arguments, "addObject:", v23);

  }
  v52 = 0;
  v53 = 0;
  v54 = 0;
  if (a4)
  {
    v51 = 0;
    std::vector<MTLRasterizationRateLayerDescriptor *>::resize((uint64_t)&v52, objc_msgSend(a4, "count"), &v51);
    DynamicLibraryReflectionData = readDynamicLibraryReflectionData((uint64_t)a6, (uint64_t)v52, a4, a7);
  }
  else
  {
    DynamicLibraryReflectionData = 0;
  }
  v25 = *(unsigned int *)(v17[1] + 32);
  v26 = -[NSArray count](v14->_arguments, "count");
  v27 = *(unsigned int *)(v17[1] + 36);
  if ((_DWORD)v25 + DynamicLibraryReflectionData + v26)
  {
    v45 = *(unsigned int *)(v17[1] + 36);
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (v25 + DynamicLibraryReflectionData + v26));
    objc_msgSend(v28, "addObjectsFromArray:", v14->_arguments);
    if ((_DWORD)v25)
    {
      v29 = 0;
      do
      {
        objc_msgSend(v28, "addObject:", *(_QWORD *)(*(_QWORD *)(v17[1] + 24) + v29));
        v29 += 8;
      }
      while (8 * v25 != v29);
    }
    v46 = v21;
    v30 = v52;
    v31 = v53;
    while (v30 != v31)
    {
      v32 = *v30;
      if (*v30)
      {
        v33 = *(unsigned int *)(*(_QWORD *)(v32 + 8) + 32);
        if ((_DWORD)v33)
        {
          v34 = 0;
          v35 = 8 * v33;
          do
          {
            v36 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v32 + 8) + 24) + v34);
            if ((objc_msgSend(v28, "containsObject:", v36) & 1) == 0)
              objc_msgSend(v28, "addObject:", v36);
            v34 += 8;
          }
          while (v35 != v34);
        }
      }
      ++v30;
    }
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v37 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    v21 = v46;
    if (v37)
    {
      v38 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v48 != v38)
            objc_enumerationMutation(v28);
          _MTLFixIABReflectionOffsets(*(void **)(*((_QWORD *)&v47 + 1) + 8 * i), a6);
        }
        v37 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      }
      while (v37);
    }
    v14[1].super.super.isa = (Class)v28;
    v27 = v45;
  }
  if ((_DWORD)v27)
    v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", *(_QWORD *)(v17[1] + 8) + 8 * v21, v27);
  else
    v40 = 0;
  v14->_builtInArguments = (NSArray *)v40;
  (*(void (**)(uint64_t *))(*v17 + 8))(v17);
  v41 = v52;
  v42 = v53;
  if (v52 != v53)
  {
    do
    {
      if (*v41)
        (*(void (**)(uint64_t))(*(_QWORD *)*v41 + 8))(*v41);
      ++v41;
    }
    while (v41 != v42);
    v41 = v52;
  }
  if (v41)
  {
    v53 = v41;
    operator delete(v41);
  }
  return v14;
}

- (MTLComputePipelineReflectionInternal)initWithSerializedData:(id)a3 device:(id)a4 options:(unint64_t)a5 flags:(id)a6
{
  return -[MTLComputePipelineReflectionInternal initWithSerializedData:dynamicLibraries:serializedStageInputDescriptor:device:options:flags:](self, "initWithSerializedData:dynamicLibraries:serializedStageInputDescriptor:device:options:flags:", a3, 0, 0, a4, a5, *(_QWORD *)&a6);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLComputePipelineReflectionInternal;
  -[MTLComputePipelineReflectionInternal dealloc](&v3, sel_dealloc);
}

- (id)performanceStatistics
{
  return self->_performanceStatistics;
}

- (void)setPerformanceStatistics:(id)a3
{
  id v5;

  v5 = a3;

  self->_performanceStatistics = (NSDictionary *)a3;
}

- ($CC87CEEC7FB96912C0F1D2377F1A8E9C)usageFlags
{
  return ($CC87CEEC7FB96912C0F1D2377F1A8E9C)*(_QWORD *)&self->_flags;
}

- (unsigned)traceBufferIndex
{
  return self->_pluginReturnData;
}

- (id)pluginReturnData
{
  return self->_constantSamplerUniqueIdentifiers;
}

- (id)constantSamplerUniqueIdentifiers
{
  return self->_constantSamplerDescriptors;
}

- (id)constantSamplerDescriptors
{
  return self->_bindings;
}

- (void)setConstantSamplerUniqueIdentifiers:(id)a3
{
  NSArray *constantSamplerDescriptors;

  constantSamplerDescriptors = self->_constantSamplerDescriptors;
  if (constantSamplerDescriptors != a3)
  {

    self->_constantSamplerDescriptors = (NSArray *)a3;
  }
}

- (void)setConstantSamplerDescriptorsFromBitmasks:(unint64_t *)a3 count:(unint64_t)a4
{

  self->_bindings = (NSArray *)_MTLCreateConstantSamplerDescriptorsFromBitmasks(a4, a3);
}

- (void)setConstantSamplerDescriptorsFromBitmasks:(unint64_t *)a3 stride:(unsigned int)a4 count:(unint64_t)a5
{

  self->_bindings = (NSArray *)_MTLCreateConstantSamplerDescriptorsFromBitmasksStrided(a5, a4, a3);
}

- (id)bindings
{
  if (self[1].super.super.isa)
    return self[1].super.super.isa;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (id)builtInArguments
{
  return self->_builtInArguments;
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  const __CFString *v16;
  MTLComputePipelineReflectionInternal *v18;
  Class obj;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[3];
  _BYTE v26[128];
  _QWORD v27[5];

  v27[3] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = a3 + 8;
  v7 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", v6, CFSTR(" "), 0);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 128);
  v27[0] = v5;
  v27[1] = CFSTR("Compute Bindings =");
  v27[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[objc_class count](self[1].super.super.isa, "count"));
  objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v18 = self;
  obj = self[1].super.super.isa;
  v9 = -[objc_class countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "isArgument");
        v16 = CFSTR("Global");
        if (v15)
          v16 = CFSTR("Argument");
        v25[0] = v7;
        v25[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %u:"), v16, v11 + i);
        v25[2] = objc_msgSend(v14, "formattedDescription:", v6);
        objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3));
      }
      v10 = -[objc_class countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      v11 = (v11 + i);
    }
    while (v10);
  }
  v20.receiver = v18;
  v20.super_class = (Class)MTLComputePipelineReflectionInternal;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), -[MTLComputePipelineReflectionInternal description](&v20, sel_description), objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLComputePipelineReflectionInternal formattedDescription:](self, "formattedDescription:", 0);
}

@end
