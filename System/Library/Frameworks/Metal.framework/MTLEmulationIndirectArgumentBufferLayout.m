@implementation MTLEmulationIndirectArgumentBufferLayout

- (MTLEmulationIndirectArgumentBufferLayout)initWithStructType:(id)a3
{
  MTLEmulationIndirectArgumentBufferLayout *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t textureIndices;
  uint64_t constantIndices;
  uint64_t intersectionFunctionTableIndices;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  BOOL v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37[8];
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)MTLEmulationIndirectArgumentBufferLayout;
  v4 = -[_MTLIndirectArgumentBufferLayout init](&v38, sel_init);
  if (v4)
  {
    v5 = operator new();
    *(_OWORD *)v5 = 0u;
    *(_OWORD *)(v5 + 16) = 0u;
    *(_DWORD *)(v5 + 32) = 1065353216;
    v4->_bufferIndices = (void *)v5;
    v6 = operator new();
    *(_OWORD *)v6 = 0u;
    *(_OWORD *)(v6 + 16) = 0u;
    *(_DWORD *)(v6 + 32) = 1065353216;
    v4->_textureIndices = (void *)v6;
    v7 = operator new();
    *(_OWORD *)v7 = 0u;
    *(_OWORD *)(v7 + 16) = 0u;
    *(_DWORD *)(v7 + 32) = 1065353216;
    v4->_samplerIndices = (void *)v7;
    v8 = operator new();
    *(_OWORD *)v8 = 0u;
    *(_OWORD *)(v8 + 16) = 0u;
    *(_DWORD *)(v8 + 32) = 1065353216;
    v4->_constantIndices = (void *)v8;
    v9 = operator new();
    *(_OWORD *)v9 = 0u;
    *(_OWORD *)(v9 + 16) = 0u;
    *(_DWORD *)(v9 + 32) = 1065353216;
    v4->_visibleFunctionTableIndices = (void *)v9;
    v10 = operator new();
    *(_OWORD *)v10 = 0u;
    *(_OWORD *)(v10 + 16) = 0u;
    *(_DWORD *)(v10 + 32) = 1065353216;
    v4->_intersectionFunctionTableIndices = (void *)v10;
    v11 = operator new();
    *(_OWORD *)v11 = 0u;
    *(_OWORD *)(v11 + 16) = 0u;
    *(_DWORD *)(v11 + 32) = 1065353216;
    v4->_primitiveAccelerationStructureIndices = (void *)v11;
    v12 = operator new();
    *(_OWORD *)v12 = 0u;
    *(_OWORD *)(v12 + 16) = 0u;
    *(_DWORD *)(v12 + 32) = 1065353216;
    v4->_instanceAccelerationStructureIndices = (void *)v12;
    textureIndices = (uint64_t)v4->_textureIndices;
    v37[0] = (uint64_t)v4->_bufferIndices;
    v37[1] = textureIndices;
    constantIndices = (uint64_t)v4->_constantIndices;
    v37[2] = (uint64_t)v4->_samplerIndices;
    v37[3] = constantIndices;
    intersectionFunctionTableIndices = (uint64_t)v4->_intersectionFunctionTableIndices;
    v37[4] = (uint64_t)v4->_visibleFunctionTableIndices;
    v37[5] = intersectionFunctionTableIndices;
    v37[6] = (uint64_t)v4->_primitiveAccelerationStructureIndices;
    v37[7] = v12;
    assignStructIndices(0, a3, v37);
    v35 = 0;
    v36 = 0;
    v33 = 0;
    v34 = 0;
    v31 = 0;
    v32 = 0;
    v30 = 0;
    countStructArguments((MTLStructType *)a3, &v36, &v35, &v34, &v33, &v32, &v31, &v30);
    v28 = 0;
    v29 = 0;
    getStructSizeAndAlign((MTLStructType *)a3, &v29, &v28, &v27);
    v16 = (_QWORD *)operator new();
    v16[1] = 0;
    v16[2] = 0;
    *v16 = 0;
    v4->_constantOffsets = v16;
    v26 = 0;
    assignStructOffsets((MTLStructType *)a3, &v26, (uint64_t)v16);
    v17 = v29;
    v4->_bufferOffset = v29;
    v18 = v36;
    v19 = v17 + 24 * v36;
    v4->_textureOffset = v19;
    v20 = v35;
    v4->_samplerOffset = v19 + 8 * v35;
    v21 = v34;
    v4->_stride = v19 + 8 * (v20 + v34);
    v22 = v28;
    if (v28 <= 8)
      v23 = 8;
    else
      v23 = v28;
    if (v18)
      v22 = v23;
    if (v22 <= 8)
      v24 = 8;
    else
      v24 = v22;
    if (v21 + v20)
      v22 = v24;
    v4->_alignment = v22;
    v4->_stride = (v4->_stride + v22 - 1) & -(uint64_t)v22;
  }
  return v4;
}

- (void)dealloc
{
  void *bufferIndices;
  uint64_t v4;
  void *textureIndices;
  uint64_t v6;
  void *samplerIndices;
  uint64_t v8;
  void *constantIndices;
  uint64_t v10;
  void **constantOffsets;
  void *v12;
  void *visibleFunctionTableIndices;
  uint64_t v14;
  void *intersectionFunctionTableIndices;
  uint64_t v16;
  void *primitiveAccelerationStructureIndices;
  uint64_t v18;
  void *instanceAccelerationStructureIndices;
  uint64_t v20;
  objc_super v21;

  bufferIndices = self->_bufferIndices;
  if (bufferIndices)
  {
    v4 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)bufferIndices);
    MEMORY[0x186DABFBC](v4, 0x10A0C408EF24B1CLL);
    self->_bufferIndices = 0;
  }
  textureIndices = self->_textureIndices;
  if (textureIndices)
  {
    v6 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)textureIndices);
    MEMORY[0x186DABFBC](v6, 0x10A0C408EF24B1CLL);
    self->_textureIndices = 0;
  }
  samplerIndices = self->_samplerIndices;
  if (samplerIndices)
  {
    v8 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)samplerIndices);
    MEMORY[0x186DABFBC](v8, 0x10A0C408EF24B1CLL);
    self->_samplerIndices = 0;
  }
  constantIndices = self->_constantIndices;
  if (constantIndices)
  {
    v10 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)constantIndices);
    MEMORY[0x186DABFBC](v10, 0x10A0C408EF24B1CLL);
    self->_constantIndices = 0;
  }
  constantOffsets = (void **)self->_constantOffsets;
  if (constantOffsets)
  {
    v12 = *constantOffsets;
    if (*constantOffsets)
    {
      constantOffsets[1] = v12;
      operator delete(v12);
    }
    MEMORY[0x186DABFBC](constantOffsets, 0x10C402FEFCB83);
    self->_constantOffsets = 0;
  }
  visibleFunctionTableIndices = self->_visibleFunctionTableIndices;
  if (visibleFunctionTableIndices)
  {
    v14 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)visibleFunctionTableIndices);
    MEMORY[0x186DABFBC](v14, 0x10A0C408EF24B1CLL);
  }
  intersectionFunctionTableIndices = self->_intersectionFunctionTableIndices;
  if (intersectionFunctionTableIndices)
  {
    v16 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)intersectionFunctionTableIndices);
    MEMORY[0x186DABFBC](v16, 0x10A0C408EF24B1CLL);
  }
  primitiveAccelerationStructureIndices = self->_primitiveAccelerationStructureIndices;
  if (primitiveAccelerationStructureIndices)
  {
    v18 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)primitiveAccelerationStructureIndices);
    MEMORY[0x186DABFBC](v18, 0x10A0C408EF24B1CLL);
  }
  instanceAccelerationStructureIndices = self->_instanceAccelerationStructureIndices;
  if (instanceAccelerationStructureIndices)
  {
    v20 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)instanceAccelerationStructureIndices);
    MEMORY[0x186DABFBC](v20, 0x10A0C408EF24B1CLL);
  }
  v21.receiver = self;
  v21.super_class = (Class)MTLEmulationIndirectArgumentBufferLayout;
  -[_MTLIndirectArgumentBufferLayout dealloc](&v21, sel_dealloc);
}

- (void)virtualAddressForBufferAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  uint64_t v7;

  v7 = objc_msgSend(a4, "contents");
  return *(void **)(v7 + -[MTLEmulationIndirectArgumentBufferLayout offsetForBuffer:](self, "offsetForBuffer:", a3) + 16);
}

- (unint64_t)uniqueIdentifierForTextureAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  uint64_t v7;

  v7 = objc_msgSend(a4, "contents");
  return *(_QWORD *)(v7 + -[MTLEmulationIndirectArgumentBufferLayout offsetForTexture:](self, "offsetForTexture:", a3));
}

- (unint64_t)uniqueIdentifierForSamplerAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  uint64_t v7;

  v7 = objc_msgSend(a4, "contents");
  return *(_QWORD *)(v7 + -[MTLEmulationIndirectArgumentBufferLayout offsetForSampler:](self, "offsetForSampler:", a3));
}

- (unint64_t)uniqueIdentifierForRenderPipelineAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLEmulationIndirectArgumentBufferLayout uniqueIdentifierForRenderPipelineAtIndex:inIndirectArgumentBuffer:atOffset:]", 2253, (uint64_t)CFSTR("Setting a pipeline is not supported on this hardware"), a5, v5, v6, v7, vars0);
  return 0;
}

- (unint64_t)uniqueIdentifierForComputePipelineAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLEmulationIndirectArgumentBufferLayout uniqueIdentifierForComputePipelineAtIndex:inIndirectArgumentBuffer:atOffset:]", 2261, (uint64_t)CFSTR("Setting a pipeline is not supported on this hardware"), a5, v5, v6, v7, vars0);
  return 0;
}

- (unint64_t)offsetForBuffer:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v10;

  v10 = a3;
  v8 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>((_QWORD *)self->_bufferIndices, &v10);
  if (!v8)
    MTLReportFailure(0, "-[MTLEmulationIndirectArgumentBufferLayout offsetForBuffer:]", 2271, (uint64_t)CFSTR("Invalid ID: %lu"), v4, v5, v6, v7, v10);
  return self->_bufferOffset + 24 * v8[3];
}

- (unint64_t)offsetForTexture:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v10;

  v10 = a3;
  v8 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>((_QWORD *)self->_textureIndices, &v10);
  if (!v8)
    MTLReportFailure(0, "-[MTLEmulationIndirectArgumentBufferLayout offsetForTexture:]", 2283, (uint64_t)CFSTR("Invalid ID: %lu"), v4, v5, v6, v7, v10);
  return self->_textureOffset + 8 * v8[3];
}

- (unint64_t)offsetForSampler:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v10;

  v10 = a3;
  v8 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>((_QWORD *)self->_samplerIndices, &v10);
  if (!v8)
    MTLReportFailure(0, "-[MTLEmulationIndirectArgumentBufferLayout offsetForSampler:]", 2295, (uint64_t)CFSTR("Invalid ID: %lu"), v4, v5, v6, v7, v10);
  return self->_samplerOffset + 8 * v8[3];
}

- (unint64_t)offsetForConstant:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v10;

  v10 = a3;
  v8 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>((_QWORD *)self->_constantIndices, &v10);
  if (!v8)
    MTLReportFailure(0, "-[MTLEmulationIndirectArgumentBufferLayout offsetForConstant:]", 2307, (uint64_t)CFSTR("Invalid ID: %lu"), v4, v5, v6, v7, v10);
  return *(_QWORD *)(*(_QWORD *)self->_constantOffsets + 8 * v8[3]);
}

- (unint64_t)offsetForVisibleFunctionTable:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v10;

  v10 = a3;
  v8 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>((_QWORD *)self->_visibleFunctionTableIndices, &v10);
  if (!v8)
    MTLReportFailure(0, "-[MTLEmulationIndirectArgumentBufferLayout offsetForVisibleFunctionTable:]", 2323, (uint64_t)CFSTR("Invalid ID: %lu"), v4, v5, v6, v7, v10);
  return self->_visibleFunctionTableOffset + 8 * v8[3];
}

- (unint64_t)offsetForIntersectionFunctionTable:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v10;

  v10 = a3;
  v8 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>((_QWORD *)self->_intersectionFunctionTableIndices, &v10);
  if (!v8)
    MTLReportFailure(0, "-[MTLEmulationIndirectArgumentBufferLayout offsetForIntersectionFunctionTable:]", 2336, (uint64_t)CFSTR("Invalid ID: %lu"), v4, v5, v6, v7, v10);
  return self->_intersectionFunctionTableOffset + 8 * v8[3];
}

- (unint64_t)offsetForPrimitiveAccelerationStructure:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v10;

  v10 = a3;
  v8 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>((_QWORD *)self->_primitiveAccelerationStructureIndices, &v10);
  if (!v8)
    MTLReportFailure(0, "-[MTLEmulationIndirectArgumentBufferLayout offsetForPrimitiveAccelerationStructure:]", 2348, (uint64_t)CFSTR("Invalid ID: %lu"), v4, v5, v6, v7, v10);
  return self->_primitiveAccelerationStructureOffset + 8 * v8[3];
}

- (unint64_t)offsetForInstanceAccelerationStructure:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v10;

  v10 = a3;
  v8 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>((_QWORD *)self->_instanceAccelerationStructureIndices, &v10);
  if (!v8)
    MTLReportFailure(0, "-[MTLEmulationIndirectArgumentBufferLayout offsetForInstanceAccelerationStructure:]", 2360, (uint64_t)CFSTR("Invalid ID: %lu"), v4, v5, v6, v7, v10);
  return self->_instanceAccelerationStructureOffset + 8 * v8[3];
}

- (BOOL)bufferLayoutMatchesFrontEndLayout
{
  return 0;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (unsigned)hashValue
{
  return -1;
}

- (unsigned)hashOffset
{
  return -1;
}

- (unsigned)hashMask
{
  return -2097152;
}

- (unsigned)hashSignature
{
  return 2145386496;
}

- (unint64_t)stride
{
  return self->_stride;
}

@end
