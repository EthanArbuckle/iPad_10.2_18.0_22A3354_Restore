@implementation AGXA10FamilyRenderPipeline

- (AGXA10FamilyRenderPipeline)initWithDevice:(id)a3 pipelineStateDescriptor:(id)a4
{
  AGXA10FamilyRenderPipeline *v5;
  AGXA10FamilyFragmentProgram *v6;
  AGXA10FamilyFragmentProgram *v7;
  AGXA10FamilyVertexProgram *v8;
  AGXA10FamilyVertexProgram *v9;
  AGXA10FamilyObjectProgram *v10;
  AGXA10FamilyObjectProgram *v11;
  AGXA10FamilyMeshProgram *v12;
  AGXA10FamilyMeshProgram *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AGXA10FamilyRenderPipeline;
  v5 = -[_MTLRenderPipelineState initWithDevice:pipelineStateDescriptor:](&v15, sel_initWithDevice_pipelineStateDescriptor_, a3);
  if (v5)
  {
    v6 = (AGXA10FamilyFragmentProgram *)objc_msgSend((id)objc_msgSend(a4, "fragmentFunction"), "vendorPrivate");
    v5->_fp = v6;
    v7 = v6;
    v8 = (AGXA10FamilyVertexProgram *)objc_msgSend((id)objc_msgSend(a4, "vertexFunction"), "vendorPrivate");
    v5->_vp = v8;
    v9 = v8;
    v10 = (AGXA10FamilyObjectProgram *)objc_msgSend((id)objc_msgSend(a4, "objectFunction"), "vendorPrivate");
    v5->_op = v10;
    v11 = v10;
    v12 = (AGXA10FamilyMeshProgram *)objc_msgSend((id)objc_msgSend(a4, "meshFunction"), "vendorPrivate");
    v5->_mp = v12;
    v13 = v12;
  }
  return v5;
}

- (AGXA10FamilyRenderPipeline)initWithDevice:(id)a3 meshRenderPipelineStateDescriptor:(id)a4 objectThreadExecutionWidth:(unint64_t)a5 meshThreadExecutionWidth:(unint64_t)a6
{
  AGXA10FamilyRenderPipeline *v7;
  AGXA10FamilyFragmentProgram *v8;
  AGXA10FamilyFragmentProgram *v9;
  AGXA10FamilyObjectProgram *v10;
  AGXA10FamilyObjectProgram *v11;
  AGXA10FamilyMeshProgram *v12;
  AGXA10FamilyMeshProgram *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AGXA10FamilyRenderPipeline;
  v7 = -[_MTLRenderPipelineState initWithDevice:meshRenderPipelineStateDescriptor:objectThreadExecutionWidth:meshThreadExecutionWidth:](&v15, sel_initWithDevice_meshRenderPipelineStateDescriptor_objectThreadExecutionWidth_meshThreadExecutionWidth_, a3, a4, a5, a6);
  if (v7)
  {
    v8 = (AGXA10FamilyFragmentProgram *)objc_msgSend((id)objc_msgSend(a4, "fragmentFunction"), "vendorPrivate");
    v7->_fp = v8;
    v9 = v8;
    v10 = (AGXA10FamilyObjectProgram *)objc_msgSend((id)objc_msgSend(a4, "objectFunction"), "vendorPrivate");
    v7->_op = v10;
    v11 = v10;
    v12 = (AGXA10FamilyMeshProgram *)objc_msgSend((id)objc_msgSend(a4, "meshFunction"), "vendorPrivate");
    v7->_mp = v12;
    v13 = v12;
  }
  return v7;
}

- (AGXA10FamilyRenderPipeline)initWithDevice:(id)a3 meshRenderPipelineStateDescriptor:(id)a4 objectThreadExecutionWidth:(unint64_t)a5 meshThreadExecutionWidth:(unint64_t)a6 maxTotalThreadgroupsPerMeshGrid:(unint64_t)a7
{
  AGXA10FamilyRenderPipeline *v8;
  AGXA10FamilyFragmentProgram *v9;
  AGXA10FamilyFragmentProgram *v10;
  AGXA10FamilyObjectProgram *v11;
  AGXA10FamilyObjectProgram *v12;
  AGXA10FamilyMeshProgram *v13;
  AGXA10FamilyMeshProgram *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AGXA10FamilyRenderPipeline;
  v8 = -[_MTLRenderPipelineState initWithDevice:meshRenderPipelineStateDescriptor:objectThreadExecutionWidth:meshThreadExecutionWidth:maxTotalThreadgroupsPerMeshGrid:](&v16, sel_initWithDevice_meshRenderPipelineStateDescriptor_objectThreadExecutionWidth_meshThreadExecutionWidth_maxTotalThreadgroupsPerMeshGrid_, a3, a4, a5, a6, a7);
  if (v8)
  {
    v9 = (AGXA10FamilyFragmentProgram *)objc_msgSend((id)objc_msgSend(a4, "fragmentFunction"), "vendorPrivate");
    v8->_fp = v9;
    v10 = v9;
    v11 = (AGXA10FamilyObjectProgram *)objc_msgSend((id)objc_msgSend(a4, "objectFunction"), "vendorPrivate");
    v8->_op = v11;
    v12 = v11;
    v13 = (AGXA10FamilyMeshProgram *)objc_msgSend((id)objc_msgSend(a4, "meshFunction"), "vendorPrivate");
    v8->_mp = v13;
    v14 = v13;
  }
  return v8;
}

- (AGXA10FamilyRenderPipeline)initWithParent:(id)a3
{
  AGXA10FamilyRenderPipeline *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AGXA10FamilyRenderPipeline;
  v4 = -[_MTLRenderPipelineState initWithParent:](&v6, sel_initWithParent_);
  if (v4)
    v4->_basePipeline = (AGXA10FamilyRenderPipeline *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_vp = 0;
  self->_fp = 0;

  self->_basePipeline = 0;
  self->_op = 0;

  self->_mp = 0;
  v3.receiver = self;
  v3.super_class = (Class)AGXA10FamilyRenderPipeline;
  -[_MTLRenderPipelineState dealloc](&v3, sel_dealloc);
}

- (id)newVertexShaderDebugInfo
{
  VertexProgramVariant *vertex_variant;
  id v3;
  char *v4;
  uint64_t v5;

  vertex_variant = self->_impl.vertex_variant;
  if (!vertex_variant)
    return 0;
  if (*((char *)vertex_variant + 895) < 0)
  {
    if (*((_QWORD *)vertex_variant + 110))
      goto LABEL_4;
    return 0;
  }
  if (!*((_BYTE *)vertex_variant + 895))
    return 0;
LABEL_4:
  v3 = objc_alloc(MEMORY[0x24BDBCE50]);
  if (*((char *)vertex_variant + 895) < 0)
  {
    v4 = (char *)*((_QWORD *)vertex_variant + 109);
    v5 = *((_QWORD *)vertex_variant + 110);
  }
  else
  {
    v4 = (char *)vertex_variant + 872;
    v5 = *((unsigned __int8 *)vertex_variant + 895);
  }
  return (id)objc_msgSend(v3, "initWithBytes:length:", v4, v5);
}

- (id)newFragmentShaderDebugInfo
{
  FragmentProgramVariant *fragment_variant;
  id v3;
  char *v4;
  uint64_t v5;

  fragment_variant = self->_impl.fragment_variant;
  if (!fragment_variant)
    return 0;
  if (*((char *)fragment_variant + 895) < 0)
  {
    if (*((_QWORD *)fragment_variant + 110))
      goto LABEL_4;
    return 0;
  }
  if (!*((_BYTE *)fragment_variant + 895))
    return 0;
LABEL_4:
  v3 = objc_alloc(MEMORY[0x24BDBCE50]);
  if (*((char *)fragment_variant + 895) < 0)
  {
    v4 = (char *)*((_QWORD *)fragment_variant + 109);
    v5 = *((_QWORD *)fragment_variant + 110);
  }
  else
  {
    v4 = (char *)fragment_variant + 872;
    v5 = *((unsigned __int8 *)fragment_variant + 895);
  }
  return (id)objc_msgSend(v3, "initWithBytes:length:", v4, v5);
}

- (id)newMeshShaderDebugInfo
{
  MeshProgramVariant *mesh_variant;
  id v3;
  char *v4;
  uint64_t v5;

  mesh_variant = self->_impl.mesh_variant;
  if (!mesh_variant)
    return 0;
  if (*((char *)mesh_variant + 895) < 0)
  {
    if (*((_QWORD *)mesh_variant + 110))
      goto LABEL_4;
    return 0;
  }
  if (!*((_BYTE *)mesh_variant + 895))
    return 0;
LABEL_4:
  v3 = objc_alloc(MEMORY[0x24BDBCE50]);
  if (*((char *)mesh_variant + 895) < 0)
  {
    v4 = (char *)*((_QWORD *)mesh_variant + 109);
    v5 = *((_QWORD *)mesh_variant + 110);
  }
  else
  {
    v4 = (char *)mesh_variant + 872;
    v5 = *((unsigned __int8 *)mesh_variant + 895);
  }
  return (id)objc_msgSend(v3, "initWithBytes:length:", v4, v5);
}

- (id)newObjectShaderDebugInfo
{
  ObjectProgramVariant *object_variant;
  id v3;
  char *v4;
  uint64_t v5;

  object_variant = self->_impl.object_variant;
  if (!object_variant)
    return 0;
  if (*((char *)object_variant + 895) < 0)
  {
    if (*((_QWORD *)object_variant + 110))
      goto LABEL_4;
    return 0;
  }
  if (!*((_BYTE *)object_variant + 895))
    return 0;
LABEL_4:
  v3 = objc_alloc(MEMORY[0x24BDBCE50]);
  if (*((char *)object_variant + 895) < 0)
  {
    v4 = (char *)*((_QWORD *)object_variant + 109);
    v5 = *((_QWORD *)object_variant + 110);
  }
  else
  {
    v4 = (char *)object_variant + 872;
    v5 = *((unsigned __int8 *)object_variant + 895);
  }
  return (id)objc_msgSend(v3, "initWithBytes:length:", v4, v5);
}

- (unsigned)getVertexShaderTelemetryID
{
  VertexProgramVariant *vertex_variant;

  vertex_variant = self->_impl.vertex_variant;
  if (vertex_variant)
    return *((_DWORD *)vertex_variant + 106);
  else
    return 0;
}

- (unsigned)getFragmentShaderTelemetryID
{
  FragmentProgramVariant *fragment_variant;

  fragment_variant = self->_impl.fragment_variant;
  if (fragment_variant)
    return *((_DWORD *)fragment_variant + 106);
  else
    return 0;
}

- (unint64_t)maxTotalThreadsPerThreadgroup
{
  TileProgramVariant *tile_variant;

  tile_variant = self->_impl.tile_variant;
  if (tile_variant)
    return *((unsigned int *)tile_variant + 784);
  else
    return 0;
}

- (unint64_t)maxTotalThreadsPerObjectThreadgroup
{
  ObjectProgramVariant *object_variant;

  object_variant = self->_impl.object_variant;
  if (object_variant)
    return *((unsigned int *)object_variant + 747);
  else
    return 0;
}

- (unint64_t)maxTotalThreadsPerMeshThreadgroup
{
  MeshProgramVariant *mesh_variant;

  mesh_variant = self->_impl.mesh_variant;
  if (mesh_variant)
    return *((unsigned int *)mesh_variant + 749);
  else
    return 0;
}

- (unint64_t)staticThreadgroupMemoryLength
{
  return 0;
}

- (unint64_t)imageBlockSampleLength
{
  return 0;
}

- (unint64_t)imageBlockMemoryLengthForDimensions:(id *)a3
{
  return 0;
}

- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3
{
  return 0;
}

- (unint64_t)imageblockSampleLength
{
  return 0;
}

- (unint64_t)uniqueIdentifier
{
  unint64_t result;

  result = (unint64_t)&self->_impl;
  if (*(_BYTE *)(result + 837))
    return *(_QWORD *)(result + 1000);
  return result;
}

- (unint64_t)resourceIndex
{
  return 0;
}

- (unint64_t)allocatedSize
{
  RenderPipeline *p_impl;
  VertexProgramVariant *vertex_variant;
  TileProgramVariant *tile_variant;
  FragmentProgramVariant *fragment_variant;

  p_impl = &self->_impl;
  vertex_variant = self->_impl.vertex_variant;
  if (vertex_variant)
    LODWORD(vertex_variant) = *((_DWORD *)vertex_variant + 954) + *((_DWORD *)vertex_variant + 707);
  tile_variant = self->_impl.tile_variant;
  if (tile_variant)
    LODWORD(tile_variant) = *((_DWORD *)tile_variant + 711);
  fragment_variant = p_impl->fragment_variant;
  if (p_impl->fragment_variant)
    LODWORD(fragment_variant) = *((_DWORD *)fragment_variant + 711);
  return (int)tile_variant + (int)vertex_variant + (int)fragment_variant + (self->_anon_1b8[541] << 7);
}

- (id)vertexFunctionHandleWithFunction:(id)a3
{
  id result;

  result = std::__hash_table<std::__hash_value_type<objc_object  {objcproto11MTLFunction}*,RetainedObjCPointer<AGXA10FamilyFunctionHandle *>>,std::__unordered_map_hasher<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXA10FamilyFunctionHandle *>,std::hash<objc_object  {objcproto11MTLFunction}>,std::equal_to<objc_object  {objcproto11MTLFunction}>,true>,std::__unordered_map_equal<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXA10FamilyFunctionHandle *>,std::equal_to,std::hash,true>,std::allocator<RetainedObjCPointer<AGXA10FamilyFunctionHandle *>>>::find<objc_object  {objcproto11MTLFunction}>(&self->_anon_1b8[1336], (unint64_t)a3);
  if (result)
    return (id)*((_QWORD *)result + 3);
  return result;
}

- (id)fragmentFunctionHandleWithFunction:(id)a3
{
  id result;

  result = std::__hash_table<std::__hash_value_type<objc_object  {objcproto11MTLFunction}*,RetainedObjCPointer<AGXA10FamilyFunctionHandle *>>,std::__unordered_map_hasher<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXA10FamilyFunctionHandle *>,std::hash<objc_object  {objcproto11MTLFunction}>,std::equal_to<objc_object  {objcproto11MTLFunction}>,true>,std::__unordered_map_equal<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXA10FamilyFunctionHandle *>,std::equal_to,std::hash,true>,std::allocator<RetainedObjCPointer<AGXA10FamilyFunctionHandle *>>>::find<objc_object  {objcproto11MTLFunction}>(&self->_anon_1b8[1376], (unint64_t)a3);
  if (result)
    return (id)*((_QWORD *)result + 3);
  return result;
}

- (id)tileFunctionHandleWithFunction:(id)a3
{
  id result;

  result = std::__hash_table<std::__hash_value_type<objc_object  {objcproto11MTLFunction}*,RetainedObjCPointer<AGXA10FamilyFunctionHandle *>>,std::__unordered_map_hasher<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXA10FamilyFunctionHandle *>,std::hash<objc_object  {objcproto11MTLFunction}>,std::equal_to<objc_object  {objcproto11MTLFunction}>,true>,std::__unordered_map_equal<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXA10FamilyFunctionHandle *>,std::equal_to,std::hash,true>,std::allocator<RetainedObjCPointer<AGXA10FamilyFunctionHandle *>>>::find<objc_object  {objcproto11MTLFunction}>(&self->_anon_1b8[1416], (unint64_t)a3);
  if (result)
    return (id)*((_QWORD *)result + 3);
  return result;
}

- (id)objectFunctionHandleWithFunction:(id)a3
{
  id result;

  result = std::__hash_table<std::__hash_value_type<objc_object  {objcproto11MTLFunction}*,RetainedObjCPointer<AGXA10FamilyFunctionHandle *>>,std::__unordered_map_hasher<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXA10FamilyFunctionHandle *>,std::hash<objc_object  {objcproto11MTLFunction}>,std::equal_to<objc_object  {objcproto11MTLFunction}>,true>,std::__unordered_map_equal<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXA10FamilyFunctionHandle *>,std::equal_to,std::hash,true>,std::allocator<RetainedObjCPointer<AGXA10FamilyFunctionHandle *>>>::find<objc_object  {objcproto11MTLFunction}>(&self->_anon_1b8[1456], (unint64_t)a3);
  if (result)
    return (id)*((_QWORD *)result + 3);
  return result;
}

- (id)meshFunctionHandleWithFunction:(id)a3
{
  id result;

  result = std::__hash_table<std::__hash_value_type<objc_object  {objcproto11MTLFunction}*,RetainedObjCPointer<AGXA10FamilyFunctionHandle *>>,std::__unordered_map_hasher<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXA10FamilyFunctionHandle *>,std::hash<objc_object  {objcproto11MTLFunction}>,std::equal_to<objc_object  {objcproto11MTLFunction}>,true>,std::__unordered_map_equal<objc_object  {objcproto11MTLFunction},RetainedObjCPointer<AGXA10FamilyFunctionHandle *>,std::equal_to,std::hash,true>,std::allocator<RetainedObjCPointer<AGXA10FamilyFunctionHandle *>>>::find<objc_object  {objcproto11MTLFunction}>(&self->_anon_1b8[1496], (unint64_t)a3);
  if (result)
    return (id)*((_QWORD *)result + 3);
  return result;
}

- (unint64_t)objectThreadExecutionWidth
{
  return 32;
}

- (unint64_t)meshThreadExecutionWidth
{
  return 32;
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  AGXA10FamilyRenderPipeline *basePipeline;
  AGXA10FamilyRenderPipeline *v8;
  MTLDevice *v9;
  uint64_t v10;
  int8x8_t **p_impl;
  void *v12;
  void *v13;
  void *v14;
  unint64_t prime;
  uint64_t v16;
  int8x8_t v17;
  uint8x8_t v18;
  unint64_t v19;
  uint64_t v22;
  unint64_t v23;
  int8x8_t v24;
  unint64_t v25;
  uint8x8_t v26;
  uint64_t v27;
  unint64_t v28;
  int8x8_t v29;
  unint64_t v30;
  uint8x8_t v31;
  uint64_t v32;
  int8x8_t v33;

  if (objc_msgSend((id)objc_msgSend(a3, "objectAdditionalBinaryFunctions"), "count")
    || objc_msgSend((id)objc_msgSend(a3, "meshAdditionalBinaryFunctions"), "count"))
  {
    if (self->_basePipeline)
      basePipeline = self->_basePipeline;
    else
      basePipeline = self;
    v8 = -[AGXA10FamilyRenderPipeline initWithParent:]([AGXA10FamilyRenderPipeline alloc], "initWithParent:", basePipeline);
    v9 = -[_MTLRenderPipelineState device](self, "device");
    if (v8)
    {
      v10 = (uint64_t)v9;
      p_impl = (int8x8_t **)&v8->_impl;
      v12 = (void *)objc_msgSend(a3, "meshAdditionalBinaryFunctions");
      v13 = (void *)objc_msgSend(a3, "objectAdditionalBinaryFunctions");
      v14 = (void *)objc_msgSend(a3, "fragmentAdditionalBinaryFunctions");
      AGX::RenderPipeline<AGX::G9::ObjClasses,AGX::G9::Classes,AGX::G9::Encoders>::copyStateAndFunctionsFromOriginal((uint64_t)&v8->_impl, v10, (uint64_t)&self->_impl, objc_msgSend(v12, "count") + objc_msgSend(v13, "count") + objc_msgSend(v14, "count"));
      prime = vcvtps_u32_f32((float)(unint64_t)(objc_msgSend(v12, "count") + *(_QWORD *)&v8->_anon_1b8[1520])/ *(float *)&v8->_anon_1b8[1528]);
      if (prime == 1)
      {
        prime = 2;
      }
      else if ((prime & (prime - 1)) != 0)
      {
        prime = std::__next_prime(prime);
      }
      v17 = *(int8x8_t *)&v8->_anon_1b8[1504];
      if (prime > *(_QWORD *)&v17)
        goto LABEL_15;
      if (prime < *(_QWORD *)&v17)
      {
        v18 = (uint8x8_t)vcnt_s8(v17);
        v18.i16[0] = vaddlv_u8(v18);
        v19 = vcvtps_u32_f32((float)*(unint64_t *)&v8->_anon_1b8[1520] / *(float *)&v8->_anon_1b8[1528]);
        if (*(_QWORD *)&v17 < 3uLL || v18.u32[0] > 1uLL)
        {
          v19 = std::__next_prime(v19);
        }
        else
        {
          v22 = 1 << -(char)__clz(v19 - 1);
          if (v19 >= 2)
            v19 = v22;
        }
        if (prime <= v19)
          prime = v19;
        if (prime < *(_QWORD *)&v17)
LABEL_15:
          std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__do_rehash<true>((uint64_t)&v8->_anon_1b8[1496], prime);
      }
      v23 = vcvtps_u32_f32((float)(unint64_t)(objc_msgSend(v13, "count") + *(_QWORD *)&v8->_anon_1b8[1480])/ *(float *)&v8->_anon_1b8[1488]);
      if (v23 == 1)
      {
        v23 = 2;
      }
      else if ((v23 & (v23 - 1)) != 0)
      {
        v23 = std::__next_prime(v23);
      }
      v24 = *(int8x8_t *)&v8->_anon_1b8[1464];
      if (v23 > *(_QWORD *)&v24)
        goto LABEL_35;
      if (v23 < *(_QWORD *)&v24)
      {
        v25 = vcvtps_u32_f32((float)*(unint64_t *)&v8->_anon_1b8[1480] / *(float *)&v8->_anon_1b8[1488]);
        if (*(_QWORD *)&v24 < 3uLL || (v26 = (uint8x8_t)vcnt_s8(v24), v26.i16[0] = vaddlv_u8(v26), v26.u32[0] > 1uLL))
        {
          v25 = std::__next_prime(v25);
        }
        else
        {
          v27 = 1 << -(char)__clz(v25 - 1);
          if (v25 >= 2)
            v25 = v27;
        }
        if (v23 <= v25)
          v23 = v25;
        if (v23 < *(_QWORD *)&v24)
LABEL_35:
          std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__do_rehash<true>((uint64_t)&v8->_anon_1b8[1456], v23);
      }
      v28 = vcvtps_u32_f32((float)(unint64_t)(objc_msgSend(v14, "count") + *(_QWORD *)&v8->_anon_1b8[1400])/ *(float *)&v8->_anon_1b8[1408]);
      if (v28 == 1)
      {
        v28 = 2;
      }
      else if ((v28 & (v28 - 1)) != 0)
      {
        v28 = std::__next_prime(v28);
      }
      v29 = *(int8x8_t *)&v8->_anon_1b8[1384];
      if (v28 > *(_QWORD *)&v29)
        goto LABEL_51;
      if (v28 < *(_QWORD *)&v29)
      {
        v30 = vcvtps_u32_f32((float)*(unint64_t *)&v8->_anon_1b8[1400] / *(float *)&v8->_anon_1b8[1408]);
        if (*(_QWORD *)&v29 < 3uLL || (v31 = (uint8x8_t)vcnt_s8(v29), v31.i16[0] = vaddlv_u8(v31), v31.u32[0] > 1uLL))
        {
          v30 = std::__next_prime(v30);
        }
        else
        {
          v32 = 1 << -(char)__clz(v30 - 1);
          if (v30 >= 2)
            v30 = v32;
        }
        if (v28 <= v30)
          v28 = v30;
        if (v28 < *(_QWORD *)&v29)
LABEL_51:
          std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__do_rehash<true>((uint64_t)&v8->_anon_1b8[1376], v28);
      }
      if (*p_impl)
      {
        v33 = (*p_impl)[393];
        *(int8x8_t *)&v8->_anon_1b8[564] = vorr_s8(vand_s8(*(int8x8_t *)&v8->_anon_1b8[564], (int8x8_t)0xF8FFFFFFFC1FFFFFLL), v33);
        *(_DWORD *)&v8->_anon_1b8[576] = *(_DWORD *)&v8->_anon_1b8[576] & 0xF8FFFFFF | v33.i32[1];
      }
    }
    else
    {
      if (a4)
      {
        v16 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Failed to allocate a new mesh pipeline"), *MEMORY[0x24BDD0FC8]);
        *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("AGXMetalA10"), 1, v16);
      }
      return 0;
    }
    return v8;
  }
  else if (objc_msgSend((id)objc_msgSend(a3, "tileAdditionalBinaryFunctions"), "count"))
  {
    return -[_MTLRenderPipelineState newTileRenderPipelineStateWithAdditionalBinaryFunctions:error:](self, "newTileRenderPipelineStateWithAdditionalBinaryFunctions:error:", objc_msgSend(a3, "tileAdditionalBinaryFunctions"), a4);
  }
  else
  {
    return -[AGXA10FamilyRenderPipeline newRenderPipelineStateWithAdditionalBinaryFunctions:fragmentAdditionalBinaryFunctions:error:](self, "newRenderPipelineStateWithAdditionalBinaryFunctions:fragmentAdditionalBinaryFunctions:error:", objc_msgSend(a3, "vertexAdditionalBinaryFunctions"), objc_msgSend(a3, "fragmentAdditionalBinaryFunctions"), a4);
  }
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 fragmentAdditionalBinaryFunctions:(id)a4 error:(id *)a5
{
  AGXA10FamilyRenderPipeline *basePipeline;
  AGXA10FamilyRenderPipeline *v10;
  MTLDevice *v11;
  RenderPipeline *p_impl;
  unint64_t prime;
  uint64_t v14;
  int8x8_t v15;
  uint8x8_t v16;
  unint64_t v17;
  uint64_t v19;
  unint64_t v20;
  int8x8_t v21;
  unint64_t v22;
  uint8x8_t v23;
  uint64_t v24;
  int8x8_t *fragment_variant;
  int8x8_t v26;
  int8x8_t v27;
  unsigned int v28;
  uint64_t v29;
  unsigned int v30;
  unsigned int v31;

  if (self->_basePipeline)
    basePipeline = self->_basePipeline;
  else
    basePipeline = self;
  v10 = -[AGXA10FamilyRenderPipeline initWithParent:]([AGXA10FamilyRenderPipeline alloc], "initWithParent:", basePipeline);
  v11 = -[_MTLRenderPipelineState device](self, "device");
  if (v10)
  {
    p_impl = &v10->_impl;
    AGX::RenderPipeline<AGX::G9::ObjClasses,AGX::G9::Classes,AGX::G9::Encoders>::copyStateAndFunctionsFromOriginal((uint64_t)&v10->_impl, (uint64_t)v11, (uint64_t)&self->_impl, objc_msgSend(a4, "count") + objc_msgSend(a3, "count"));
    prime = vcvtps_u32_f32((float)(unint64_t)(objc_msgSend(a3, "count") + *(_QWORD *)&v10->_anon_1b8[1360])/ *(float *)&v10->_anon_1b8[1368]);
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
    }
    v15 = *(int8x8_t *)&v10->_anon_1b8[1344];
    if (prime > *(_QWORD *)&v15)
      goto LABEL_25;
    if (prime < *(_QWORD *)&v15)
    {
      v16 = (uint8x8_t)vcnt_s8(v15);
      v16.i16[0] = vaddlv_u8(v16);
      v17 = vcvtps_u32_f32((float)*(unint64_t *)&v10->_anon_1b8[1360] / *(float *)&v10->_anon_1b8[1368]);
      if (*(_QWORD *)&v15 < 3uLL || v16.u32[0] > 1uLL)
      {
        v17 = std::__next_prime(v17);
      }
      else
      {
        v19 = 1 << -(char)__clz(v17 - 1);
        if (v17 >= 2)
          v17 = v19;
      }
      if (prime <= v17)
        prime = v17;
      if (prime < *(_QWORD *)&v15)
LABEL_25:
        std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__do_rehash<true>((uint64_t)&v10->_anon_1b8[1336], prime);
    }
    v20 = vcvtps_u32_f32((float)(unint64_t)(objc_msgSend(a4, "count") + *(_QWORD *)&v10->_anon_1b8[1400])/ *(float *)&v10->_anon_1b8[1408]);
    if (v20 == 1)
    {
      v20 = 2;
    }
    else if ((v20 & (v20 - 1)) != 0)
    {
      v20 = std::__next_prime(v20);
    }
    v21 = *(int8x8_t *)&v10->_anon_1b8[1384];
    if (v20 > *(_QWORD *)&v21)
      goto LABEL_41;
    if (v20 < *(_QWORD *)&v21)
    {
      v22 = vcvtps_u32_f32((float)*(unint64_t *)&v10->_anon_1b8[1400] / *(float *)&v10->_anon_1b8[1408]);
      if (*(_QWORD *)&v21 < 3uLL || (v23 = (uint8x8_t)vcnt_s8(v21), v23.i16[0] = vaddlv_u8(v23), v23.u32[0] > 1uLL))
      {
        v22 = std::__next_prime(v22);
      }
      else
      {
        v24 = 1 << -(char)__clz(v22 - 1);
        if (v22 >= 2)
          v22 = v24;
      }
      if (v20 <= v22)
        v20 = v22;
      if (v20 < *(_QWORD *)&v21)
LABEL_41:
        std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__do_rehash<true>((uint64_t)&v10->_anon_1b8[1376], v20);
    }
    fragment_variant = (int8x8_t *)p_impl->fragment_variant;
    if (p_impl->fragment_variant)
    {
      v26 = fragment_variant[393];
      v27 = vorr_s8(vand_s8(*(int8x8_t *)&v10->_anon_1b8[564], (int8x8_t)0xF8FFFFFFFC1FFFFFLL), v26);
      *(int8x8_t *)&v10->_anon_1b8[564] = v27;
      v28 = *(_DWORD *)&v10->_anon_1b8[576] & 0xF8EFFFFF;
      v29 = fragment_variant[403].u8[6];
      if (v29 == 3)
        v30 = 255;
      else
        v30 = byte_232D767D0[v29];
      v31 = v30 >> (((unsigned __int32)v27.i32[1] >> 17) & 7);
      *(_DWORD *)&v10->_anon_1b8[568] = v27.i32[1] & 0xFFEFFFFF | ((v31 & 1) << 20);
      *(_DWORD *)&v10->_anon_1b8[576] = ((v31 & 1) << 20) | v28 | v26.i32[1] & 0xFFEFFFFF;
    }
  }
  else
  {
    if (a5)
    {
      v14 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Failed to allocate a new pipeline"), *MEMORY[0x24BDD0FC8]);
      *a5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("AGXMetalA10"), 1, v14);
    }
    return 0;
  }
  return v10;
}

- (id)pipelineBinaries
{
  RenderPipeline *p_impl;
  id v3;
  id v4;
  FragmentProgramVariant *fragment_variant;
  id v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __IOSurface *iosurface;
  __IOSurface *i;
  uint64_t v13;
  id v14;
  VertexProgramVariant *vertex_variant;
  id v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  MeshProgramVariant *mesh_variant;
  MeshProgramVariant *j;
  uint64_t v23;
  id v24;
  TileProgramVariant *tile_variant;
  id v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  __IOSurface *v31;
  __IOSurface *k;
  uint64_t v33;
  id v34;
  ObjectProgramVariant *object_variant;
  id v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  __IOSurface *v41;
  __IOSurface *m;
  uint64_t v43;
  id v44;
  MeshProgramVariant *v45;
  id v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  __IOSurface *v51;
  __IOSurface *n;
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x24BDAC8D0];
  p_impl = &self->_impl;
  if (!self->_impl.fragment_variant
    && !self->_impl.vertex_variant
    && !self->_impl.tile_variant
    && !self->_impl.object_variant
    && !self->_impl.mesh_variant)
  {
    return 0;
  }
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (p_impl->fragment_variant)
  {
    v4 = objc_alloc(MEMORY[0x24BDDD7E0]);
    fragment_variant = p_impl->fragment_variant;
    if (*((char *)p_impl->fragment_variant + 895) < 0)
    {
      if (*((_QWORD *)fragment_variant + 110))
        goto LABEL_9;
    }
    else if (*((_BYTE *)p_impl->fragment_variant + 895))
    {
LABEL_9:
      v6 = objc_alloc(MEMORY[0x24BDBCE50]);
      if (*((char *)fragment_variant + 895) < 0)
      {
        v7 = (char *)*((_QWORD *)fragment_variant + 109);
        v8 = *((_QWORD *)fragment_variant + 110);
      }
      else
      {
        v7 = (char *)fragment_variant + 872;
        v8 = *((unsigned __int8 *)fragment_variant + 895);
      }
      v9 = objc_msgSend(v6, "initWithBytes:length:", v7, v8);
      fragment_variant = p_impl->fragment_variant;
      goto LABEL_15;
    }
    v9 = 0;
LABEL_15:
    v59[0] = objc_msgSend(v4, "initWithBinary:uniqueIdentifier:debugIdentifier:", v9, *((_QWORD *)fragment_variant + 53), *((unsigned int *)fragment_variant + 104));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 1), CFSTR("fragment"));
    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    iosurface = p_impl[5].resource_info[1].iosurface;
    for (i = p_impl[5].resource_info[2].iosurface; iosurface != i; iosurface = (__IOSurface *)((char *)iosurface + 16))
      objc_msgSend(v10, "addObject:", objc_msgSend(objc_alloc(MEMORY[0x24BDDD7E0]), "initWithBinary:uniqueIdentifier:debugIdentifier:", 0, 0, 0));
    v13 = objc_msgSend(v10, "copy");

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("fragment-dynamic-libraries"));
  }
  if (!p_impl->vertex_variant)
    goto LABEL_30;
  v14 = objc_alloc(MEMORY[0x24BDDD7E0]);
  vertex_variant = p_impl->vertex_variant;
  if (*((char *)vertex_variant + 895) < 0)
  {
    if (*((_QWORD *)vertex_variant + 110))
      goto LABEL_21;
  }
  else if (*((_BYTE *)vertex_variant + 895))
  {
LABEL_21:
    v16 = objc_alloc(MEMORY[0x24BDBCE50]);
    if (*((char *)vertex_variant + 895) < 0)
    {
      v17 = (char *)*((_QWORD *)vertex_variant + 109);
      v18 = *((_QWORD *)vertex_variant + 110);
    }
    else
    {
      v17 = (char *)vertex_variant + 872;
      v18 = *((unsigned __int8 *)vertex_variant + 895);
    }
    v19 = objc_msgSend(v16, "initWithBytes:length:", v17, v18);
    vertex_variant = p_impl->vertex_variant;
    goto LABEL_27;
  }
  v19 = 0;
LABEL_27:
  v58 = objc_msgSend(v14, "initWithBinary:uniqueIdentifier:debugIdentifier:", v19, *((_QWORD *)vertex_variant + 53), *((unsigned int *)vertex_variant + 104));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v58, 1), CFSTR("vertex"));
  v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  mesh_variant = p_impl[5].mesh_variant;
  for (j = *(MeshProgramVariant **)&p_impl[5].vertex_spill_params.spill_size_per_instance;
        mesh_variant != j;
        mesh_variant = (MeshProgramVariant *)((char *)mesh_variant + 16))
  {
    objc_msgSend(v20, "addObject:", objc_msgSend(objc_alloc(MEMORY[0x24BDDD7E0]), "initWithBinary:uniqueIdentifier:debugIdentifier:", 0, 0, 0));
  }
  v23 = objc_msgSend(v20, "copy");

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("vertex-dynamic-libraries"));
LABEL_30:
  if (!p_impl->tile_variant)
    goto LABEL_42;
  v24 = objc_alloc(MEMORY[0x24BDDD7E0]);
  tile_variant = p_impl->tile_variant;
  if (*((char *)tile_variant + 895) < 0)
  {
    if (*((_QWORD *)tile_variant + 110))
      goto LABEL_33;
  }
  else if (*((_BYTE *)tile_variant + 895))
  {
LABEL_33:
    v26 = objc_alloc(MEMORY[0x24BDBCE50]);
    if (*((char *)tile_variant + 895) < 0)
    {
      v27 = (char *)*((_QWORD *)tile_variant + 109);
      v28 = *((_QWORD *)tile_variant + 110);
    }
    else
    {
      v27 = (char *)tile_variant + 872;
      v28 = *((unsigned __int8 *)tile_variant + 895);
    }
    v29 = objc_msgSend(v26, "initWithBytes:length:", v27, v28);
    tile_variant = p_impl->tile_variant;
    goto LABEL_39;
  }
  v29 = 0;
LABEL_39:
  v57 = objc_msgSend(v24, "initWithBinary:uniqueIdentifier:debugIdentifier:", v29, *((_QWORD *)tile_variant + 53), *((unsigned int *)tile_variant + 104));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1), CFSTR("tile"));
  v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v31 = p_impl[5].resource_info[4].iosurface;
  for (k = p_impl[5].resource_info[5].iosurface; v31 != k; v31 = (__IOSurface *)((char *)v31 + 16))
    objc_msgSend(v30, "addObject:", objc_msgSend(objc_alloc(MEMORY[0x24BDDD7E0]), "initWithBinary:uniqueIdentifier:debugIdentifier:", 0, 0, 0));
  v33 = objc_msgSend(v30, "copy");

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("tile-dynamic-libraries"));
LABEL_42:
  if (!p_impl->object_variant)
    goto LABEL_54;
  v34 = objc_alloc(MEMORY[0x24BDDD7E0]);
  object_variant = p_impl->object_variant;
  if (*((char *)object_variant + 895) < 0)
  {
    if (*((_QWORD *)object_variant + 110))
      goto LABEL_45;
  }
  else if (*((_BYTE *)object_variant + 895))
  {
LABEL_45:
    v36 = objc_alloc(MEMORY[0x24BDBCE50]);
    if (*((char *)object_variant + 895) < 0)
    {
      v37 = (char *)*((_QWORD *)object_variant + 109);
      v38 = *((_QWORD *)object_variant + 110);
    }
    else
    {
      v37 = (char *)object_variant + 872;
      v38 = *((unsigned __int8 *)object_variant + 895);
    }
    v39 = objc_msgSend(v36, "initWithBytes:length:", v37, v38);
    object_variant = p_impl->object_variant;
    goto LABEL_51;
  }
  v39 = 0;
LABEL_51:
  v56 = objc_msgSend(v34, "initWithBinary:uniqueIdentifier:debugIdentifier:", v39, *((_QWORD *)object_variant + 53), *((unsigned int *)object_variant + 104));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1), CFSTR("object"));
  v40 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v41 = p_impl[5].resource_info[7].iosurface;
  for (m = p_impl[5].resource_info[8].iosurface; v41 != m; v41 = (__IOSurface *)((char *)v41 + 16))
    objc_msgSend(v40, "addObject:", objc_msgSend(objc_alloc(MEMORY[0x24BDDD7E0]), "initWithBinary:uniqueIdentifier:debugIdentifier:", 0, 0, 0));
  v43 = objc_msgSend(v40, "copy");

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("object-dynamic-libraries"));
LABEL_54:
  if (p_impl->mesh_variant)
  {
    v44 = objc_alloc(MEMORY[0x24BDDD7E0]);
    v45 = p_impl->mesh_variant;
    if (*((char *)v45 + 895) < 0)
    {
      if (*((_QWORD *)v45 + 110))
        goto LABEL_57;
    }
    else if (*((_BYTE *)v45 + 895))
    {
LABEL_57:
      v46 = objc_alloc(MEMORY[0x24BDBCE50]);
      if (*((char *)v45 + 895) < 0)
      {
        v47 = (char *)*((_QWORD *)v45 + 109);
        v48 = *((_QWORD *)v45 + 110);
      }
      else
      {
        v47 = (char *)v45 + 872;
        v48 = *((unsigned __int8 *)v45 + 895);
      }
      v49 = objc_msgSend(v46, "initWithBytes:length:", v47, v48);
      v45 = p_impl->mesh_variant;
LABEL_63:
      v55 = objc_msgSend(v44, "initWithBinary:uniqueIdentifier:debugIdentifier:", v49, *((_QWORD *)v45 + 53), *((unsigned int *)v45 + 104));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 1), CFSTR("mesh"));
      v50 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v51 = p_impl[5].resource_info[10].iosurface;
      for (n = p_impl[5].resource_info[11].iosurface; v51 != n; v51 = (__IOSurface *)((char *)v51 + 16))
        objc_msgSend(v50, "addObject:", objc_msgSend(objc_alloc(MEMORY[0x24BDDD7E0]), "initWithBinary:uniqueIdentifier:debugIdentifier:", 0, 0, 0));
      v53 = objc_msgSend(v50, "copy");

      objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("mesh-dynamic-libraries"));
      return (id)objc_msgSend(v3, "copy");
    }
    v49 = 0;
    goto LABEL_63;
  }
  return (id)objc_msgSend(v3, "copy");
}

- (id)newVisibleFunctionTableFromVertexStageWithDescriptor:(id)a3
{
  MTLDevice *v5;
  uint64_t v7;

  v5 = -[_MTLRenderPipelineState device](self, "device");
  LODWORD(v7) = 1;
  return -[AGXA10FamilyVisibleFunctionTable initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:]([AGXA10FamilyVisibleFunctionTable alloc], "initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:", v5, objc_msgSend(a3, "functionCount"), 0, *(unsigned __int8 *)(*((_QWORD *)v5 + 101) + 6725), objc_msgSend(a3, "resourceIndex"), self, v7);
}

- (id)newVisibleFunctionTableFromFragmentStageWithDescriptor:(id)a3
{
  MTLDevice *v5;
  uint64_t v7;

  v5 = -[_MTLRenderPipelineState device](self, "device");
  LODWORD(v7) = 2;
  return -[AGXA10FamilyVisibleFunctionTable initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:]([AGXA10FamilyVisibleFunctionTable alloc], "initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:", v5, objc_msgSend(a3, "functionCount"), 0, *(unsigned __int8 *)(*((_QWORD *)v5 + 101) + 6725), objc_msgSend(a3, "resourceIndex"), self, v7);
}

- (id)newVisibleFunctionTableFromTileStageWithDescriptor:(id)a3
{
  MTLDevice *v5;
  uint64_t v7;

  v5 = -[_MTLRenderPipelineState device](self, "device");
  LODWORD(v7) = 3;
  return -[AGXA10FamilyVisibleFunctionTable initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:]([AGXA10FamilyVisibleFunctionTable alloc], "initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:type:", v5, objc_msgSend(a3, "functionCount"), 0, *(unsigned __int8 *)(*((_QWORD *)v5 + 101) + 6725), objc_msgSend(a3, "resourceIndex"), self, v7);
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  MTLDevice *v7;

  v7 = -[_MTLRenderPipelineState device](self, "device");
  return -[AGXA10FamilyVisibleFunctionTable initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:stage:]([AGXA10FamilyVisibleFunctionTable alloc], "initWithDevice:functionCount:options:isSuballocDisabled:resourceIndex:pipelineState:stage:", v7, objc_msgSend(a3, "functionCount"), 0, *(unsigned __int8 *)(*((_QWORD *)v7 + 101) + 6725), objc_msgSend(a3, "resourceIndex"), self, a4);
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  id v7;
  id v8;
  void *v9;

  if (!-[MTLDevice requiresRaytracingEmulation](-[_MTLRenderPipelineState device](self, "device"), "requiresRaytracingEmulation"))return 0;
  v7 = objc_alloc_init(MEMORY[0x24BDDD778]);
  objc_msgSend(v7, "setFunctionCount:", objc_msgSend(a3, "functionCount"));
  objc_msgSend(v7, "setResourceIndex:", objc_msgSend(a3, "resourceIndex"));
  objc_msgSend(v7, "setForceResourceIndex:", objc_msgSend(a3, "forceResourceIndex"));
  v8 = 0;
  if (a4 <= 0x10 && ((1 << a4) & 0x10116) != 0)
    v8 = -[AGXA10FamilyRenderPipeline newVisibleFunctionTableWithDescriptor:stage:](self, "newVisibleFunctionTableWithDescriptor:stage:", v7, a4);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE515E8]), "initWithVisibleFunctionTable:", v8);
  return v9;
}

- (unint64_t)maxTileStorageLength
{
  return self->_maxTileStorageLength;
}

- (void).cxx_destruct
{
  AGX::RenderPipeline<AGX::G9::ObjClasses,AGX::G9::Classes,AGX::G9::Encoders>::~RenderPipeline((uint64_t *)&self->_impl);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 57) = 0u;
  *(_QWORD *)((char *)self + 925) = 0;
  *((_QWORD *)self + 117) = 0x3F80000000000001;
  *((_QWORD *)self + 118) = 0x1FFFFFFFFLL;
  *((_WORD *)self + 476) = 1;
  *(_OWORD *)((char *)self + 956) = xmmword_232D73520;
  *((_BYTE *)self + 984) = 0;
  *((_BYTE *)self + 988) = 0;
  *((_QWORD *)self + 124) = 0;
  *(_QWORD *)((char *)self + 972) = 0;
  *(_DWORD *)((char *)self + 979) = 0;
  *(_OWORD *)((char *)self + 1000) = xmmword_232D73530;
  *((_QWORD *)self + 127) = 3840;
  *((_DWORD *)self + 256) = 2162688;
  *((_DWORD *)self + 258) = 1184;
  *((_DWORD *)self + 257) = 507307272;
  *(_OWORD *)((char *)self + 1144) = 0u;
  *(_OWORD *)((char *)self + 1160) = 0u;
  *(_OWORD *)((char *)self + 1176) = 0u;
  *((_QWORD *)self + 160) = 0;
  *((_QWORD *)self + 161) = 0;
  *((_BYTE *)self + 1296) = 0;
  *(_OWORD *)((char *)self + 1304) = 0u;
  *(_OWORD *)((char *)self + 1320) = 0u;
  *(_OWORD *)((char *)self + 1336) = 0u;
  *(_OWORD *)((char *)self + 1349) = 0u;
  *((_QWORD *)self + 171) = 0;
  *((_QWORD *)self + 172) = 0;
  *((_BYTE *)self + 1384) = 0;
  *((_OWORD *)self + 87) = 0u;
  *((_OWORD *)self + 88) = 0u;
  *((_OWORD *)self + 89) = 0u;
  *(_OWORD *)((char *)self + 1437) = 0u;
  *((_QWORD *)self + 183) = 0;
  *((_QWORD *)self + 182) = 0;
  *((_BYTE *)self + 1472) = 0;
  *(_OWORD *)((char *)self + 1525) = 0u;
  *(_OWORD *)((char *)self + 1496) = 0u;
  *(_OWORD *)((char *)self + 1512) = 0u;
  *(_OWORD *)((char *)self + 1480) = 0u;
  *((_BYTE *)self + 1560) = 0;
  *((_QWORD *)self + 194) = 0;
  *((_QWORD *)self + 193) = 0;
  *(_OWORD *)((char *)self + 1613) = 0u;
  *((_OWORD *)self + 100) = 0u;
  *((_OWORD *)self + 99) = 0u;
  *((_OWORD *)self + 98) = 0u;
  *((_BYTE *)self + 1648) = 0;
  *((_QWORD *)self + 205) = 0;
  *((_QWORD *)self + 204) = 0;
  *((_DWORD *)self + 284) = 0;
  *((_OWORD *)self + 69) = 0u;
  *((_OWORD *)self + 70) = 0u;
  *((_OWORD *)self + 67) = 0u;
  *((_OWORD *)self + 68) = 0u;
  *((_OWORD *)self + 65) = 0u;
  *((_OWORD *)self + 66) = 0u;
  *(_QWORD *)((char *)self + 1269) = 0;
  *(_OWORD *)((char *)self + 1240) = 0u;
  *(_OWORD *)((char *)self + 1256) = 0u;
  *(_OWORD *)((char *)self + 1208) = 0u;
  *(_OWORD *)((char *)self + 1224) = 0u;
  *((_QWORD *)self + 225) = 0;
  *(_OWORD *)((char *)self + 1768) = 0u;
  *(_OWORD *)((char *)self + 1784) = 0u;
  *(_OWORD *)((char *)self + 1736) = 0u;
  *(_OWORD *)((char *)self + 1752) = 0u;
  *(_OWORD *)((char *)self + 1704) = 0u;
  *(_OWORD *)((char *)self + 1720) = 0u;
  *(_OWORD *)((char *)self + 1672) = 0u;
  *(_OWORD *)((char *)self + 1688) = 0u;
  *(_OWORD *)((char *)self + 1656) = 0u;
  *((_DWORD *)self + 452) = 1065353216;
  *(_OWORD *)((char *)self + 1832) = 0u;
  *(_OWORD *)((char *)self + 1816) = 0u;
  *((_DWORD *)self + 462) = 1065353216;
  *((_OWORD *)self + 117) = 0u;
  *((_OWORD *)self + 116) = 0u;
  *((_DWORD *)self + 472) = 1065353216;
  *(_OWORD *)((char *)self + 1912) = 0u;
  *(_OWORD *)((char *)self + 1896) = 0u;
  *((_DWORD *)self + 482) = 1065353216;
  *((_OWORD *)self + 122) = 0u;
  *((_OWORD *)self + 121) = 0u;
  *((_DWORD *)self + 492) = 1065353216;
  *(_OWORD *)((char *)self + 1976) = 0u;
  *(_OWORD *)((char *)self + 1992) = 0u;
  *((_DWORD *)self + 502) = 1065353216;
  *((_QWORD *)self + 256) = 0;
  *((_OWORD *)self + 127) = 0u;
  *((_OWORD *)self + 126) = 0u;
  *((_DWORD *)self + 514) = 1065353216;
  *(_OWORD *)((char *)self + 2328) = 0u;
  *(_OWORD *)((char *)self + 2344) = 0u;
  *(_OWORD *)((char *)self + 2296) = 0u;
  *(_OWORD *)((char *)self + 2312) = 0u;
  *(_OWORD *)((char *)self + 2264) = 0u;
  *(_OWORD *)((char *)self + 2280) = 0u;
  *(_OWORD *)((char *)self + 2232) = 0u;
  *(_OWORD *)((char *)self + 2248) = 0u;
  *(_OWORD *)((char *)self + 2200) = 0u;
  *(_OWORD *)((char *)self + 2216) = 0u;
  *(_OWORD *)((char *)self + 2168) = 0u;
  *(_OWORD *)((char *)self + 2184) = 0u;
  *(_OWORD *)((char *)self + 2136) = 0u;
  *(_OWORD *)((char *)self + 2152) = 0u;
  *(_OWORD *)((char *)self + 2104) = 0u;
  *(_OWORD *)((char *)self + 2120) = 0u;
  *(_OWORD *)((char *)self + 2072) = 0u;
  *(_OWORD *)((char *)self + 2088) = 0u;
  return self;
}

@end
