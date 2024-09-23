@implementation DYMTLIndirectArgumentBufferManager

- (DYMTLIndirectArgumentBufferManager)initWithFunctionPlayer:(id)a3
{
  id v5;
  DYMTLIndirectArgumentBufferManager *v6;
  DYMTLIndirectArgumentBufferManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DYMTLIndirectArgumentBufferManager;
  v6 = -[DYMTLIndirectArgumentBufferManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    v7->_resourcePatchingTypesInitialized = 0;
  }

  return v7;
}

- (void)initializeResourcePatchingTypes
{
  objc_object *v3;
  uint64_t v4;
  unint64_t *resourcePatchingType;
  uint64_t v6;
  id v7;

  if (!self->_resourcePatchingTypesInitialized)
  {
    self->_resourcePatchingTypesInitialized = 1;
    -[DYMTLIndirectArgumentBufferManager device](self, "device");
    v3 = (objc_object *)objc_claimAutoreleasedReturnValue();
    DYMTLGetOriginalObject(v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v4 = 0;
    resourcePatchingType = self->_resourcePatchingType;
    do
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = objc_msgSend(v7, "resourcePatchingTypeForResourceType:", v4);
      else
        v6 = 2;
      resourcePatchingType[v4++] = v6;
    }
    while (v4 != 6);

  }
}

- (void)writePatchingTableAsJson:(id)a3
{
  -[DYIABPatcher writePatchingTableAsJson:](self->_patcher, "writePatchingTableAsJson:", a3);
}

- (void)readPatchingTable:(id)a3
{
  -[DYIABPatcher readPatchingTable:](self->_patcher, "readPatchingTable:", a3);
}

- (void)processCommandBuffer:(unint64_t)a3 functionIndex:(unsigned int)a4 ancestorMapData:(const void *)a5 indirectArgumentBuffersData:(const void *)a6 resourceMapsData:(const void *)a7 driverDecodingData:(id)a8
{
  id v15;
  vector<DYCommandBufferUID, std::allocator<DYCommandBufferUID>> *p_commandBufferIds;
  DYCommandBufferUID *begin;
  DYCommandBufferUID *end;
  DYCommandBufferUID *v19;
  DYCommandBufferUID *v20;
  DYCommandBufferUID *value;
  DYCommandBufferUID *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  DYCommandBufferUID *v28;
  DYCommandBufferUID *v29;
  DYCommandBufferUID *v30;
  DYCommandBufferUID *v31;
  DYMTLIndirectArgumentBufferManager *begin_node;
  DYMTLFunctionPlayer *player;
  DYMTLIndirectArgumentBufferManager *currentCommandBuffer;
  BOOL v35;
  DYCommandBufferUID v36;

  v15 = a8;
  -[DYMTLIndirectArgumentBufferManager initializeResourcePatchingTypes](self, "initializeResourcePatchingTypes");
  self->_currentCommandBuffer = a3;
  self->_currentCommandBufferFunctionIndex = a4;
  objc_storeStrong((id *)&self->_currentDeviceDecodingData, a8);
  v36.objectId = a3;
  *(_QWORD *)&v36.functionIndex = a4 + 1;
  begin = self->_commandBufferIds.__begin_;
  end = self->_commandBufferIds.__end_;
  p_commandBufferIds = &self->_commandBufferIds;
  if (begin == end)
  {
    v19 = self->_commandBufferIds.__begin_;
    v20 = v19;
  }
  else
  {
    while (!DYCommandBufferUID::operator==((uint64_t)begin, (uint64_t)&v36))
    {
      if (++begin == end)
      {
        begin = end;
        break;
      }
    }
    v19 = self->_commandBufferIds.__end_;
    v20 = begin;
    begin = v19;
  }
  if (v20 == begin)
  {
    value = self->_commandBufferIds.__end_cap_.__value_;
    if (begin >= value)
    {
      v23 = v19 - p_commandBufferIds->__begin_;
      v24 = v23 + 1;
      if ((unint64_t)(v23 + 1) >> 60)
        std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
      v25 = (char *)value - (char *)p_commandBufferIds->__begin_;
      if (v25 >> 3 > v24)
        v24 = v25 >> 3;
      if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF0)
        v26 = 0xFFFFFFFFFFFFFFFLL;
      else
        v26 = v24;
      if (v26)
        v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>>((uint64_t)&self->_commandBufferIds.__end_cap_, v26);
      else
        v27 = 0;
      v28 = (DYCommandBufferUID *)&v27[16 * v23];
      v29 = (DYCommandBufferUID *)&v27[16 * v26];
      *v28 = v36;
      v22 = v28 + 1;
      v31 = self->_commandBufferIds.__begin_;
      v30 = self->_commandBufferIds.__end_;
      if (v30 != v31)
      {
        do
        {
          v28[-1] = v30[-1];
          --v28;
          --v30;
        }
        while (v30 != v31);
        v30 = p_commandBufferIds->__begin_;
      }
      self->_commandBufferIds.__begin_ = v28;
      self->_commandBufferIds.__end_ = v22;
      self->_commandBufferIds.__end_cap_.__value_ = v29;
      if (v30)
        operator delete(v30);
    }
    else
    {
      *begin = v36;
      v22 = begin + 1;
    }
    self->_commandBufferIds.__end_ = v22;
    -[DYMTLIndirectArgumentBufferManager uploadDriverDecodingData:](self, "uploadDriverDecodingData:", v15, v36);
    -[DYMTLIndirectArgumentBufferManager processAncestorMapData:](self, "processAncestorMapData:", a5);
    -[DYMTLIndirectArgumentBufferManager processIndirectArgumentBuffersData:](self, "processIndirectArgumentBuffersData:", a6);
    -[DYMTLIndirectArgumentBufferManager processResourceMapsData:](self, "processResourceMapsData:", a7);
    -[DYMTLIndirectArgumentBufferManager resolveIABDecodingOperations](self, "resolveIABDecodingOperations");
    begin_node = (DYMTLIndirectArgumentBufferManager *)self->_deviceResourcesBuffers.__tree_.__begin_node_;
    if (begin_node != (DYMTLIndirectArgumentBufferManager *)&self->_deviceResourcesBuffers.__tree_.__pair1_)
    {
      do
      {
        -[DYMTLIndirectArgumentBufferManager encodeIndirectArgumentsForBuffer:decodingMap:](self, "encodeIndirectArgumentsForBuffer:decodingMap:", begin_node->_currentDeviceDecodingData, &self->_decodingMap);
        player = begin_node->_player;
        if (player)
        {
          do
          {
            currentCommandBuffer = (DYMTLIndirectArgumentBufferManager *)player;
            player = (DYMTLFunctionPlayer *)player->super.super.isa;
          }
          while (player);
        }
        else
        {
          do
          {
            currentCommandBuffer = (DYMTLIndirectArgumentBufferManager *)begin_node->_currentCommandBuffer;
            v35 = currentCommandBuffer->super.isa == (Class)begin_node;
            begin_node = currentCommandBuffer;
          }
          while (!v35);
        }
        begin_node = currentCommandBuffer;
      }
      while (currentCommandBuffer != (DYMTLIndirectArgumentBufferManager *)&self->_deviceResourcesBuffers.__tree_.__pair1_);
    }
  }
  else
  {
    self->_traceProcessed = 1;
  }

}

- (id)device
{
  return -[DYMTLFunctionPlayer device](self->_player, "device");
}

- (id)queue
{
  return -[DYMTLFunctionPlayer commandQueue](self->_player, "commandQueue");
}

- (id)objectWithId:(unint64_t)a3
{
  void *v3;
  unint64_t v5;
  unint64_t *v6;

  v5 = a3;
  v3 = -[DYMTLFunctionPlayer objectMap](self->_player, "objectMap");
  v6 = &v5;
  return (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)v3, &v5, (uint64_t)&std::piecewise_construct, &v6)[3];
}

- (void)uploadDriverDecodingData:(id)a3
{
  id v4;
  objc_object *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4 && v4 != (id)MEMORY[0x24BDAC990])
  {
    v7 = v4;
    -[DYMTLIndirectArgumentBufferManager device](self, "device");
    v5 = (objc_object *)objc_claimAutoreleasedReturnValue();
    DYMTLGetOriginalObject(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "setIndirectArgumentBufferDecodingData:", v7);

    v4 = v7;
  }

}

- (void)processAncestorMapData:(const void *)a3
{
  _QWORD v4[3];
  void **v5;

  memset(v4, 0, sizeof(v4));
  GPUTools::MTL::Utils::MakeDYMTLMutableBufferAncestorMaps();
  std::vector<std::vector<std::unordered_map<unsigned long long,std::unordered_map<unsigned long long,unsigned long long>>>>::push_back[abi:ne180100]((uint64_t *)&self->_ancestorMaps, (uint64_t)v4);
  v5 = (void **)v4;
  std::vector<std::unordered_map<unsigned long long,std::unordered_map<unsigned long long,unsigned long long>>>::__destroy_vector::operator()[abi:ne180100](&v5);
}

- (void)processIndirectArgumentBuffersData:(const void *)a3
{
  _QWORD v4[3];
  void **v5;

  memset(v4, 0, sizeof(v4));
  GPUTools::MTL::Utils::MakeDYMTLIndirectArgumentBufferInfos();
  std::vector<std::vector<std::vector<GPUTools::MTL::Utils::DYMTLIndirectArgumentBufferInfo>>>::push_back[abi:ne180100]((uint64_t *)&self->_indirectArgumentBuffers, (uint64_t)v4);
  v5 = (void **)v4;
  std::vector<std::vector<GPUTools::MTL::Utils::DYMTLIndirectArgumentBufferInfo>>::__destroy_vector::operator()[abi:ne180100](&v5);
}

- (void)processResourceMapsData:(const void *)a3
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t **p_bufferVitualAddressMap;
  unordered_map<unsigned long long, unsigned long long, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, unsigned long long>>> *p_bufferLengthMap;
  uint64_t v8;
  uint64_t *v9;
  _OWORD *v10;
  unint64_t v11;
  _OWORD *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t i;
  uint64_t *v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  _QWORD *v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *j;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t **v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v60;
  __int128 v61;
  unint64_t *v62;

  v58 = *(_DWORD *)a3;
  v3 = (uint64_t *)((char *)a3 + 16);
  v4 = *((_QWORD *)a3 + 1);
  if (v4)
  {
    v5 = 0;
    p_bufferVitualAddressMap = (uint64_t **)&self->_bufferVitualAddressMap;
    p_bufferLengthMap = &self->_bufferLengthMap;
    do
    {
      v8 = *v3;
      v60 = v3[1];
      *(_QWORD *)&v61 = v8;
      *((_QWORD *)&v61 + 1) = v3[2];
      v62 = (unint64_t *)&v60;
      v9 = std::__tree<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(p_bufferVitualAddressMap, (unint64_t *)&v60, (uint64_t)&std::piecewise_construct, (uint64_t **)&v62);
      v10 = (_OWORD *)v9[6];
      v11 = v9[7];
      if ((unint64_t)v10 >= v11)
      {
        v13 = v9[5];
        v14 = ((uint64_t)v10 - v13) >> 4;
        v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) >> 60)
          std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
        v16 = v11 - v13;
        if (v16 >> 3 > v15)
          v15 = v16 >> 3;
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0)
          v17 = 0xFFFFFFFFFFFFFFFLL;
        else
          v17 = v15;
        if (v17)
          v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>>((uint64_t)(v9 + 7), v17);
        else
          v18 = 0;
        v19 = &v18[16 * v14];
        *(_OWORD *)v19 = v61;
        v21 = (char *)v9[5];
        v20 = (char *)v9[6];
        v22 = v19;
        if (v20 != v21)
        {
          do
          {
            *((_OWORD *)v22 - 1) = *((_OWORD *)v20 - 1);
            v22 -= 16;
            v20 -= 16;
          }
          while (v20 != v21);
          v20 = (char *)v9[5];
        }
        v12 = v19 + 16;
        v9[5] = (uint64_t)v22;
        v9[6] = (uint64_t)(v19 + 16);
        v9[7] = (uint64_t)&v18[16 * v17];
        if (v20)
          operator delete(v20);
      }
      else
      {
        *v10 = v61;
        v12 = v10 + 1;
      }
      v3 += 3;
      v9[6] = (uint64_t)v12;
      v23 = *((_QWORD *)&v61 + 1);
      v62 = (unint64_t *)&v61;
      std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)p_bufferLengthMap, (unint64_t *)&v61, (uint64_t)&std::piecewise_construct, &v62)[3] = v23;
      ++v5;
    }
    while (v5 != v4);
  }
  v24 = v3 + 1;
  v25 = *v3;
  if (*v3)
  {
    do
    {
      v27 = *v24;
      v26 = (uint64_t *)v24[1];
      v24 += 2;
      v62 = (unint64_t *)v26;
      *(_QWORD *)&v61 = &v62;
      std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_textureMap, (unint64_t *)&v62, (uint64_t)&std::piecewise_construct, (_QWORD **)&v61)[3] = v27;
      --v25;
    }
    while (v25);
    v3 = v24 - 1;
  }
  v28 = *v24;
  v29 = v3 + 2;
  if (v28)
  {
    for (i = 0; i != v28; ++i)
    {
      v32 = v3[2];
      v31 = (uint64_t *)v3[3];
      v3 = v29;
      v62 = (unint64_t *)v31;
      *(_QWORD *)&v61 = &v62;
      v33 = std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<unsigned long long>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<unsigned long long>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<unsigned long long>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<unsigned long long>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_samplerMap, (unint64_t *)&v62, (uint64_t)&std::piecewise_construct, (uint64_t **)&v61);
      v34 = v33;
      v35 = (char *)v33[4];
      v36 = (uint64_t)(v33 + 5);
      v37 = v33[5];
      if ((unint64_t)v35 >= v37)
      {
        v39 = (char *)v33[3];
        v40 = (v35 - v39) >> 3;
        if ((unint64_t)(v40 + 1) >> 61)
          std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
        v41 = v37 - (_QWORD)v39;
        v42 = (uint64_t)(v37 - (_QWORD)v39) >> 2;
        if (v42 <= v40 + 1)
          v42 = v40 + 1;
        if (v41 >= 0x7FFFFFFFFFFFFFF8)
          v43 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v43 = v42;
        if (v43)
        {
          v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(v36, v43);
          v39 = (char *)v34[3];
          v35 = (char *)v34[4];
        }
        else
        {
          v44 = 0;
        }
        v45 = &v44[8 * v40];
        *(_QWORD *)v45 = v32;
        v38 = v45 + 8;
        while (v35 != v39)
        {
          v46 = *((_QWORD *)v35 - 1);
          v35 -= 8;
          *((_QWORD *)v45 - 1) = v46;
          v45 -= 8;
        }
        v34[3] = v45;
        v34[4] = v38;
        v34[5] = &v44[8 * v43];
        if (v39)
          operator delete(v39);
      }
      else
      {
        *(_QWORD *)v35 = v32;
        v38 = v35 + 8;
      }
      v34[4] = v38;
      v29 = v3 + 2;
    }
  }
  if (v58 > 0x16)
  {
    v47 = v29 + 1;
    v48 = *v29;
    if (*v29)
    {
      do
      {
        v50 = *v47;
        v49 = (uint64_t *)v47[1];
        v47 += 2;
        v62 = (unint64_t *)v49;
        *(_QWORD *)&v61 = &v62;
        std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_renderPipelineMap, (unint64_t *)&v62, (uint64_t)&std::piecewise_construct, (_QWORD **)&v61)[3] = v50;
        --v48;
      }
      while (v48);
      v29 = v47 - 1;
    }
    v51 = *v47;
    for (j = v29 + 2; v51; --v51)
    {
      v54 = *j;
      v53 = (uint64_t *)j[1];
      j += 2;
      v62 = (unint64_t *)v53;
      *(_QWORD *)&v61 = &v62;
      std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_computePipelineMap, (unint64_t *)&v62, (uint64_t)&std::piecewise_construct, (_QWORD **)&v61)[3] = v54;
    }
    v55 = *j;
    if (*j)
    {
      v56 = (uint64_t **)(j + 2);
      do
      {
        v57 = (uint64_t)*(v56 - 1);
        v62 = (unint64_t *)*v56;
        *(_QWORD *)&v61 = &v62;
        std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_indirectCommandBufferMap, (unint64_t *)&v62, (uint64_t)&std::piecewise_construct, (_QWORD **)&v61)[3] = v57;
        v56 += 2;
        --v55;
      }
      while (v55);
    }
  }
}

- (void)resolveIABDecodingOperations
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t **v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t **v25;
  char *v26;
  char **v27;
  BOOL v28;
  _QWORD *i;
  _QWORD *v30;
  _QWORD *v31;
  unint64_t v32;
  _QWORD *v33;
  const void *v34;
  size_t v35;
  const void *v36;
  void *v37;
  id v38;
  char *v39;
  char *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t *v51;
  unint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  char *v56;
  int64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  _QWORD *end;
  uint64_t v65;
  _QWORD *v66;
  id v67;
  unint64_t v68;
  void *v69;
  char *v70;
  unint64_t v71;
  __int128 v72;
  uint64_t v73;
  void *__p;
  char *v75;
  char *v76;
  unint64_t *v77;

  end = self->_indirectArgumentBuffers.__end_;
  v4 = *(end - 3);
  v3 = *(end - 2);
  if (v3 != v4)
  {
    v5 = 0;
    do
    {
      v6 = v4 + 24 * v5;
      v7 = *(_QWORD **)v6;
      v65 = v5;
      v66 = *(_QWORD **)(v6 + 8);
      if (*(_QWORD **)v6 != v66)
      {
        do
        {
          if (v7[2])
          {
            __p = 0;
            v75 = 0;
            v76 = 0;
            v72 = *(_OWORD *)(v7 + 1);
            v9 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&v76, 1uLL);
            v10 = (char *)__p;
            v11 = v75;
            *(_QWORD *)v9 = v7[3];
            v12 = v9 + 8;
            v13 = v9;
            while (v11 != v10)
            {
              v14 = *((_QWORD *)v11 - 1);
              v11 -= 8;
              *((_QWORD *)v13 - 1) = v14;
              v13 -= 8;
            }
            __p = v13;
            v75 = v9 + 8;
            v76 = &v9[8 * v8];
            if (v10)
              operator delete(v10);
            v75 = v12;
            LOBYTE(v73) = 1;
            v69 = v7;
            v15 = (uint64_t **)std::__hash_table<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_decodingMap, v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v69);
            std::__tree<DYMTLIABDecodingOp>::__emplace_unique_key_args<DYMTLIABDecodingOp,DYMTLIABDecodingOp const&>(v15 + 3, (uint64_t)&v72, (uint64_t)&v72);
            if (__p)
            {
              v75 = (char *)__p;
              operator delete(__p);
            }
            v70 = 0;
            v71 = 0;
            v69 = &v70;
            -[DYMTLIndirectArgumentBufferManager findAncestorsForBuffer:commandBufferIndex:commandEncoderIndex:callIndex:ancestors:](self, "findAncestorsForBuffer:commandBufferIndex:commandEncoderIndex:callIndex:ancestors:", *v7, -1- 0x5555555555555555* (((char *)self->_indirectArgumentBuffers.__end_ - (char *)self->_indirectArgumentBuffers.__begin_) >> 3), v65, v7[4], &v69, end);
            v16 = (char *)v69;
            if (v69 != &v70)
            {
              do
              {
                v68 = *((_QWORD *)v16 + 4);
                __p = 0;
                v75 = 0;
                v76 = 0;
                v17 = v7[2];
                *(_QWORD *)&v72 = 0;
                *((_QWORD *)&v72 + 1) = v17;
                v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&v76, 1uLL);
                v20 = (char *)__p;
                v21 = v75;
                *(_QWORD *)v19 = v7[3];
                v22 = v19 + 8;
                v23 = v19;
                while (v21 != v20)
                {
                  v24 = *((_QWORD *)v21 - 1);
                  v21 -= 8;
                  *((_QWORD *)v23 - 1) = v24;
                  v23 -= 8;
                }
                __p = v23;
                v75 = v19 + 8;
                v76 = &v19[8 * v18];
                if (v20)
                  operator delete(v20);
                v75 = v22;
                LOBYTE(v73) = 0;
                v77 = &v68;
                v25 = (uint64_t **)std::__hash_table<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_decodingMap, &v68, (uint64_t)&std::piecewise_construct, (uint64_t **)&v77);
                std::__tree<DYMTLIABDecodingOp>::__emplace_unique_key_args<DYMTLIABDecodingOp,DYMTLIABDecodingOp const&>(v25 + 3, (uint64_t)&v72, (uint64_t)&v72);
                if (__p)
                {
                  v75 = (char *)__p;
                  operator delete(__p);
                }
                v26 = (char *)*((_QWORD *)v16 + 1);
                if (v26)
                {
                  do
                  {
                    v27 = (char **)v26;
                    v26 = *(char **)v26;
                  }
                  while (v26);
                }
                else
                {
                  do
                  {
                    v27 = (char **)*((_QWORD *)v16 + 2);
                    v28 = *v27 == v16;
                    v16 = (char *)v27;
                  }
                  while (!v28);
                }
                v16 = (char *)v27;
              }
              while (v27 != &v70);
            }
            std::__tree<BufferEntry>::destroy((uint64_t)&v69, v70);
          }
          v7 += 5;
        }
        while (v7 != v66);
        v4 = *(end - 3);
        v3 = *(end - 2);
      }
      v5 = v65 + 1;
    }
    while (v65 + 1 < 0xAAAAAAAAAAAAAAABLL * ((v3 - v4) >> 3));
  }
  for (i = self->_decodingMap.__table_.__p1_.__value_.__next_; i; i = (_QWORD *)*i)
  {
    *((_QWORD *)&v72 + 1) = 0;
    v73 = 0;
    v71 = 0;
    *(_QWORD *)&v72 = (char *)&v72 + 8;
    v69 = 0;
    v70 = 0;
    v30 = (_QWORD *)i[3];
    if (v30 != i + 4)
    {
      v31 = 0;
      v32 = 0;
      do
      {
        v33 = v30 + 4;
        if (v31
          && v30[5] == v31[1]
          && (v34 = (const void *)v30[7],
              v35 = v30[8] - (_QWORD)v34,
              v36 = (const void *)v31[3],
              v35 == v31[4] - (_QWORD)v36)
          && !memcmp(v34, v36, v35))
        {
          v51 = (uint64_t *)v69;
          if (v70 == v69)
          {
LABEL_62:
            std::__tree<DYMTLIABDecodingOp>::__emplace_unique_key_args<DYMTLIABDecodingOp,DYMTLIABDecodingOp const&>((uint64_t **)&v72, (uint64_t)(v30 + 4), (uint64_t)(v30 + 4));
            v54 = v70;
            if ((unint64_t)v70 >= v71)
            {
              v56 = (char *)v69;
              v57 = (v70 - (_BYTE *)v69) >> 3;
              v58 = v57 + 1;
              if ((unint64_t)(v57 + 1) >> 61)
                std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
              v59 = v71 - (_QWORD)v69;
              if ((uint64_t)(v71 - (_QWORD)v69) >> 2 > v58)
                v58 = v59 >> 2;
              if ((unint64_t)v59 >= 0x7FFFFFFFFFFFFFF8)
                v60 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v60 = v58;
              if (v60)
              {
                v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&v71, v60);
                v56 = (char *)v69;
                v54 = v70;
              }
              else
              {
                v61 = 0;
              }
              v62 = &v61[8 * v57];
              *(_QWORD *)v62 = *v33;
              v55 = v62 + 8;
              while (v54 != v56)
              {
                v63 = *((_QWORD *)v54 - 1);
                v54 -= 8;
                *((_QWORD *)v62 - 1) = v63;
                v62 -= 8;
              }
              v69 = v62;
              v70 = v55;
              v71 = (unint64_t)&v61[8 * v60];
              if (v56)
                operator delete(v56);
            }
            else
            {
              *(_QWORD *)v70 = *v33;
              v55 = v54 + 8;
            }
            v70 = v55;
          }
          else
          {
            v52 = (v70 - (_BYTE *)v69) >> 3;
            if (v52 <= 1)
              v52 = 1;
            while (1)
            {
              v53 = *v51++;
              if (!((*v33 - v53) % v32))
                break;
              if (!--v52)
                goto LABEL_62;
            }
          }
        }
        else
        {
          v67 = 0;
          -[DYMTLIndirectArgumentBufferManager argumentEncoderForDecodingOperation:reflectionStructType:](self, "argumentEncoderForDecodingOperation:reflectionStructType:", v30 + 4, &v67, end);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v67;
          v32 = objc_msgSend(v37, "encodedLength");
          std::__tree<DYMTLIABDecodingOp>::__emplace_unique_key_args<DYMTLIABDecodingOp,DYMTLIABDecodingOp const&>((uint64_t **)&v72, (uint64_t)(v30 + 4), (uint64_t)(v30 + 4));
          v39 = (char *)v69;
          v70 = (char *)v69;
          if ((unint64_t)v69 >= v71)
          {
            v41 = (uint64_t)(v71 - (_QWORD)v69) >> 2;
            if (v41 <= 1)
              v41 = 1;
            if (v71 - (unint64_t)v69 >= 0x7FFFFFFFFFFFFFF8)
              v42 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v42 = v41;
            v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&v71, v42);
            v45 = (char *)v69;
            v46 = v70;
            *(_QWORD *)v44 = *v33;
            v40 = v44 + 8;
            v47 = v44;
            while (v46 != v45)
            {
              v48 = *((_QWORD *)v46 - 1);
              v46 -= 8;
              *((_QWORD *)v47 - 1) = v48;
              v47 -= 8;
            }
            v69 = v47;
            v70 = v44 + 8;
            v71 = (unint64_t)&v44[8 * v43];
            if (v45)
              operator delete(v45);
          }
          else
          {
            *(_QWORD *)v69 = *v33;
            v40 = v39 + 8;
          }
          v70 = v40;

          v31 = v30 + 4;
        }
        v49 = (_QWORD *)v30[1];
        if (v49)
        {
          do
          {
            v50 = v49;
            v49 = (_QWORD *)*v49;
          }
          while (v49);
        }
        else
        {
          do
          {
            v50 = (_QWORD *)v30[2];
            v28 = *v50 == (_QWORD)v30;
            v30 = v50;
          }
          while (!v28);
        }
        v30 = v50;
      }
      while (v50 != i + 4);
    }
    std::__tree<DYMTLIABDecodingOp>::swap(i + 3, (uint64_t)&v72);
    if (v69)
    {
      v70 = (char *)v69;
      operator delete(v69);
    }
    std::__tree<DYMTLIABDecodingOp>::destroy((uint64_t)&v72, *((_QWORD **)&v72 + 1));
  }
}

- (void)findAncestorsForBuffer:(unint64_t)a3 commandBufferIndex:(unint64_t)a4 commandEncoderIndex:(unint64_t)a5 callIndex:(unint64_t)a6 ancestors:(void *)a7
{
  _QWORD *v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t i;
  _QWORD *v18;
  _QWORD *v19;
  unint64_t *v20;
  _QWORD *v21;
  unint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  BOOL v25;
  _QWORD *v26;
  unint64_t v27;

  v27 = a3;
  if (a4)
  {
    v12 = (char *)a7 + 8;
    v13 = a4;
    do
    {
      v14 = (char *)self->_ancestorMaps.__begin_ + 24 * v13;
      v15 = v14[1] - *v14;
      if (v15)
      {
        v16 = -1 - 0x3333333333333333 * (v15 >> 3);
        for (i = v13 == a4 ? a5 : v16; i; --i)
        {
          v18 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>((_QWORD *)(*v14 + 40 * i), &v27);
          if (v18)
          {
            v19 = (_QWORD *)v18[5];
            if (v13 == a4 && i == a5)
            {
              for (; v19; v19 = (_QWORD *)*v19)
              {
                if (v19[3] <= a6)
                {
                  v20 = v19 + 2;
                  v21 = (_QWORD *)*v12;
                  if (!*v12)
                    goto LABEL_24;
                  v22 = *v20;
                  v23 = v12;
                  do
                  {
                    v24 = v21[4];
                    v25 = v24 >= v22;
                    if (v24 >= v22)
                      v26 = v21;
                    else
                      v26 = v21 + 1;
                    if (v25)
                      v23 = v21;
                    v21 = (_QWORD *)*v26;
                  }
                  while (*v26);
                  if (v23 == v12 || v22 < v23[4])
                  {
LABEL_24:
                    std::__tree<unsigned long long>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t **)a7, v20, v19 + 2);
                    -[DYMTLIndirectArgumentBufferManager findAncestorsForBuffer:commandBufferIndex:commandEncoderIndex:callIndex:ancestors:](self, "findAncestorsForBuffer:commandBufferIndex:commandEncoderIndex:callIndex:ancestors:", v19[2], a4, a5, v19[3], a7);
                  }
                }
              }
            }
            else
            {
              for (; v19; v19 = (_QWORD *)*v19)
              {
                std::__tree<unsigned long long>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t **)a7, v19 + 2, v19 + 2);
                -[DYMTLIndirectArgumentBufferManager findAncestorsForBuffer:commandBufferIndex:commandEncoderIndex:callIndex:ancestors:](self, "findAncestorsForBuffer:commandBufferIndex:commandEncoderIndex:callIndex:ancestors:", v19[2], v13, i, v19[3], a7);
              }
            }
          }
        }
      }
      --v13;
    }
    while (v13);
  }
}

- (void)encodeIndirectArgumentsForBuffer:(unint64_t)a3 decodingMap:(void *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;

  v19 = a3;
  if (std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(a4, &v19))
  {
    -[DYMTLIndirectArgumentBufferManager objectWithId:](self, "objectWithId:", v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "storageMode");
      if (!v8)
      {
        v14 = 0;
        v15 = objc_msgSend(objc_retainAutorelease(v7), "contents");
        if (v15)
          goto LABEL_11;
LABEL_8:

        return;
      }
      if (v8 == 2)
      {
        -[DYMTLIndirectArgumentBufferManager queue](self, "queue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "commandBuffer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "blitCommandEncoder");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "device");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "newBufferWithLength:options:", objc_msgSend(v7, "length"), 0);

        objc_msgSend(v11, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v7, 0, v13, 0, objc_msgSend(v7, "length"));
        objc_msgSend(v11, "endEncoding");
        objc_msgSend(v10, "commit");
        objc_msgSend(v10, "waitUntilCompleted");
        v14 = objc_retainAutorelease(v13);
        v15 = objc_msgSend(v14, "contents");

        if (!v15)
          goto LABEL_8;
LABEL_11:
        -[DYMTLIndirectArgumentBufferManager encodeIndirectArgumentsForBuffer:data:decodingMap:](self, "encodeIndirectArgumentsForBuffer:data:decodingMap:", v19, v15, a4);
        if (objc_msgSend(v7, "storageMode") == 2)
        {
          -[DYMTLIndirectArgumentBufferManager queue](self, "queue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "commandBuffer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "blitCommandEncoder");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v14, 0, v7, 0, objc_msgSend(v7, "length"));
          objc_msgSend(v18, "endEncoding");
          objc_msgSend(v17, "commit");
          objc_msgSend(v17, "waitUntilCompleted");

        }
        goto LABEL_8;
      }
    }
    v14 = 0;
    goto LABEL_8;
  }
}

- (void)encodeIndirectArgumentsForBuffer:(unint64_t)a3 data:(void *)a4
{
  -[DYMTLIndirectArgumentBufferManager encodeIndirectArgumentsForBuffer:data:decodingMap:](self, "encodeIndirectArgumentsForBuffer:data:decodingMap:", a3, a4, &self->_decodingMap);
}

- (void)encodeIndirectArgumentsForBuffer:(unint64_t)a3 data:(void *)a4 decodingMap:(void *)a5
{
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  BOOL v13;
  DYCommandBufferUID *begin;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t **v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD **v26;
  unint64_t *i;
  _QWORD *v28;
  _QWORD *v29;
  unint64_t *v30;
  unordered_map<unsigned long long, std::set<DYMTLIABDecodingOp>, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, std::set<DYMTLIABDecodingOp>>>> *p_decodingMap;
  _QWORD *v32;
  __int128 v33;
  char v34;
  void *__p;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  _QWORD **v39;
  _QWORD *v40[2];
  __int128 v41;
  __int128 v42;
  int v43;
  __int128 v44;
  __int128 v45;
  int v46;
  unint64_t v47;
  unint64_t *v48;

  v47 = a3;
  if (self->_currentCommandBuffer)
  {
    v7 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(a5, &v47);
    if (v7)
    {
      v44 = 0u;
      v45 = 0u;
      v46 = 1065353216;
      v8 = (_QWORD *)v7[3];
      v9 = v7 + 4;
      if (v8 != v7 + 4)
      {
        do
        {
          v10 = (void *)MEMORY[0x242623ED8]();
          -[DYMTLIndirectArgumentBufferManager executeIABDecodingOp:bufferId:data:indirectDecodingMap:](self, "executeIABDecodingOp:bufferId:data:indirectDecodingMap:", v8 + 4, v47, a4, &v44);
          objc_autoreleasePoolPop(v10);
          v11 = (_QWORD *)v8[1];
          if (v11)
          {
            do
            {
              v12 = v11;
              v11 = (_QWORD *)*v11;
            }
            while (v11);
          }
          else
          {
            do
            {
              v12 = (_QWORD *)v8[2];
              v13 = *v12 == (_QWORD)v8;
              v8 = v12;
            }
            while (!v13);
          }
          v8 = v12;
        }
        while (v12 != v9);
      }
      if (!self->_traceProcessed)
      {
        begin = self->_commandBufferIds.__begin_;
        if (self->_commandBufferIds.__end_ == begin)
        {
          v16 = 0;
        }
        else
        {
          v15 = 0;
          v16 = 0;
          do
          {
            *(_QWORD *)&v33 = self->_currentCommandBuffer;
            DWORD2(v33) = self->_currentCommandBufferFunctionIndex;
            if (DYCommandBufferUID::operator==((uint64_t)&begin[v15], (uint64_t)&v33))
              break;
            ++v16;
            begin = self->_commandBufferIds.__begin_;
            ++v15;
          }
          while (v16 < self->_commandBufferIds.__end_ - begin);
        }
        v41 = 0u;
        v42 = 0u;
        v43 = 1065353216;
        v17 = (_QWORD *)v45;
        if ((_QWORD)v45)
        {
          do
          {
            v18 = v17[2];
            v40[0] = 0;
            v40[1] = 0;
            v39 = v40;
            -[DYMTLIndirectArgumentBufferManager findAncestorsForBuffer:commandBufferIndex:commandEncoderIndex:callIndex:ancestors:](self, "findAncestorsForBuffer:commandBufferIndex:commandEncoderIndex:callIndex:ancestors:", v18, v16, -1- 0x5555555555555555* ((uint64_t)(*((_QWORD *)self->_indirectArgumentBuffers.__begin_ + 3 * v16 + 1)- *((_QWORD *)self->_indirectArgumentBuffers.__begin_ + 3 * v16)) >> 3), -1, &v39);
            v19 = v39;
            if (v39 != v40)
            {
              v20 = v17 + 4;
              do
              {
                v38 = v19[4];
                v21 = (_QWORD *)v17[3];
                if (v21 != v20)
                {
                  do
                  {
                    v33 = *((_OWORD *)v21 + 2);
                    v34 = *((_BYTE *)v21 + 48);
                    v36 = 0;
                    v37 = 0;
                    __p = 0;
                    std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>(&__p, (const void *)v21[7], v21[8], (uint64_t)(v21[8] - v21[7]) >> 3);
                    v34 = 0;
                    v48 = &v38;
                    v22 = (uint64_t **)std::__hash_table<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&v41, &v38, (uint64_t)&std::piecewise_construct, (uint64_t **)&v48);
                    std::__tree<DYMTLIABDecodingOp>::__emplace_unique_key_args<DYMTLIABDecodingOp,DYMTLIABDecodingOp const&>(v22 + 3, (uint64_t)&v33, (uint64_t)&v33);
                    if (__p)
                    {
                      v36 = __p;
                      operator delete(__p);
                    }
                    v23 = (_QWORD *)v21[1];
                    if (v23)
                    {
                      do
                      {
                        v24 = v23;
                        v23 = (_QWORD *)*v23;
                      }
                      while (v23);
                    }
                    else
                    {
                      do
                      {
                        v24 = (_QWORD *)v21[2];
                        v13 = *v24 == (_QWORD)v21;
                        v21 = v24;
                      }
                      while (!v13);
                    }
                    v21 = v24;
                  }
                  while (v24 != v20);
                }
                v25 = (_QWORD *)v19[1];
                if (v25)
                {
                  do
                  {
                    v26 = (_QWORD **)v25;
                    v25 = (_QWORD *)*v25;
                  }
                  while (v25);
                }
                else
                {
                  do
                  {
                    v26 = (_QWORD **)v19[2];
                    v13 = *v26 == v19;
                    v19 = v26;
                  }
                  while (!v13);
                }
                v19 = v26;
              }
              while (v26 != v40);
            }
            std::__tree<BufferEntry>::destroy((uint64_t)&v39, v40[0]);
            v17 = (_QWORD *)*v17;
          }
          while (v17);
          for (i = (unint64_t *)v42; i; i = (unint64_t *)*i)
          {
            *(_QWORD *)&v33 = i + 2;
            v28 = std::__hash_table<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&v44, i + 2, (uint64_t)&std::piecewise_construct, (uint64_t **)&v33);
            std::set<DYMTLIABDecodingOp>::insert[abi:ne180100]<std::__tree_const_iterator<DYMTLIABDecodingOp,std::__tree_node<DYMTLIABDecodingOp,void *> *,long>>(v28 + 3, (_QWORD *)i[3], i + 4);
          }
          v29 = (_QWORD *)v45;
          if ((_QWORD)v45)
          {
            do
            {
              -[DYMTLIndirectArgumentBufferManager encodeIndirectArgumentsForBuffer:decodingMap:](self, "encodeIndirectArgumentsForBuffer:decodingMap:", v29[2], &v44);
              v29 = (_QWORD *)*v29;
            }
            while (v29);
            v30 = (unint64_t *)v45;
            if ((_QWORD)v45)
            {
              p_decodingMap = &self->_decodingMap;
              do
              {
                *(_QWORD *)&v33 = v30 + 2;
                v32 = std::__hash_table<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)p_decodingMap, v30 + 2, (uint64_t)&std::piecewise_construct, (uint64_t **)&v33);
                std::set<DYMTLIABDecodingOp>::insert[abi:ne180100]<std::__tree_const_iterator<DYMTLIABDecodingOp,std::__tree_node<DYMTLIABDecodingOp,void *> *,long>>(v32 + 3, (_QWORD *)v30[3], v30 + 4);
                v30 = (unint64_t *)*v30;
              }
              while (v30);
            }
          }
        }
        std::__hash_table<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>>>::~__hash_table((uint64_t)&v41);
      }
      std::__hash_table<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>>>::~__hash_table((uint64_t)&v44);
    }
  }
  else
  {
    std::__tree<unsigned long long>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t **)&self->_deviceResourcesBuffers, &v47, (uint64_t *)&v47);
  }
}

- (void)executeIABDecodingOp:(const void *)a3 bufferId:(unint64_t)a4 data:(void *)a5 indirectDecodingMap:(void *)a6
{
  objc_object *v9;
  id v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int v23;
  unint64_t v24;
  char *v25;
  id v26;
  void *v27;
  char *v28;
  unint64_t v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v36;
  objc_object *v37;
  id v38;
  unint64_t v39;

  v38 = 0;
  v39 = a4;
  -[DYMTLIndirectArgumentBufferManager argumentEncoderForDecodingOperation:reflectionStructType:](self, "argumentEncoderForDecodingOperation:reflectionStructType:", a3, &v38);
  v9 = (objc_object *)objc_claimAutoreleasedReturnValue();
  v10 = v38;
  v11 = v10;
  v37 = v9;
  if (v9)
  {
    if (v10)
    {
      v12 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_bufferLengthMap.__table_.__bucket_list_.__ptr_.__value_, &v39);
      if (v12)
      {
        DYMTLGetOriginalObject(v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "layout");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = -[objc_object encodedLength](v9, "encodedLength");
        v15 = v12[3];
        if (v14 - 1 >= v15)
        {
LABEL_22:

          goto LABEL_23;
        }
        v29 = v14;
        v33 = v11;
        v31 = -[DYMTLFunctionPlayer objectMap](self->_player, "objectMap");
        -[DYMTLIndirectArgumentBufferManager device](self, "device");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(v16, "newBufferWithBytes:length:options:", a5, v15, 0);

        v17 = objc_msgSend(v34, "hashOffset");
        -[DYMTLIndirectArgumentBufferManager device](self, "device");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v18, "supportsArgumentBuffersTier2");

        v30 = objc_msgSend(v34, "hashValue");
        v19 = v29;
        v27 = a5;
        if (!*((_BYTE *)a3 + 16))
        {
          v24 = 0;
          v25 = (char *)a5 + v17;
          do
          {
            if ((v36 & 1) != 0 || *(_DWORD *)&v25[v24] == v30)
              rencodeBufferData(v39, v37, v34, v33, (uint64_t)a6, (uint64_t)&self->_bufferVitualAddressMap, (uint64_t)&self->_textureMap, (uint64_t)&self->_samplerMap, (uint64_t)&self->_usedSamplersMap, (uint64_t)&self->_renderPipelineMap, (uint64_t)&self->_computePipelineMap, (uint64_t)&self->_indirectCommandBufferMap, (uint64_t)v31, (uint64_t)&self->_replayerBufferBaseVirtualAddressMap, (uint64_t)&self->_replayerTextureMap, (uint64_t)&self->_replayerSamplerMap, (uint64_t)&self->_replayerRenderPipelineMap, (uint64_t)&self->_replayerComputePipelineMap, (uint64_t)&self->_replayerIndirectCommandBufferMap,
                (uint64_t)a3,
                (uint64_t)&self->_encodedResourcesMap,
                v32,
                v24,
                (uint64_t)self->_resourcePatchingType,
                self->_patcher,
                self->_currentCommandBuffer,
                self->_currentCommandBufferFunctionIndex);
            ++v24;
          }
          while (v24 <= v15 - v29);
          goto LABEL_21;
        }
        v20 = *(_QWORD *)a3;
        if (*(_QWORD *)a3)
        {
          v21 = v20 % v29;
          v22 = v15 - v29;
          if (v20 % v29 > v15 - v29)
          {
LABEL_21:
            v26 = objc_retainAutorelease(v32);
            v11 = v33;
            memcpy(v27, (const void *)objc_msgSend(v26, "contents"), v15);
            -[objc_object setArgumentBuffer:offset:](v37, "setArgumentBuffer:offset:", 0, 0);

            goto LABEL_22;
          }
          v23 = v17;
        }
        else
        {
          v23 = v17;
          v21 = 0;
          v22 = v15 - v29;
        }
        v28 = (char *)a5 + v23;
        do
        {
          if ((v36 & 1) != 0 || *(_DWORD *)&v28[v21] == v30)
          {
            rencodeBufferData(v39, v37, v34, v33, (uint64_t)a6, (uint64_t)&self->_bufferVitualAddressMap, (uint64_t)&self->_textureMap, (uint64_t)&self->_samplerMap, (uint64_t)&self->_usedSamplersMap, (uint64_t)&self->_renderPipelineMap, (uint64_t)&self->_computePipelineMap, (uint64_t)&self->_indirectCommandBufferMap, (uint64_t)v31, (uint64_t)&self->_replayerBufferBaseVirtualAddressMap, (uint64_t)&self->_replayerTextureMap, (uint64_t)&self->_replayerSamplerMap, (uint64_t)&self->_replayerRenderPipelineMap, (uint64_t)&self->_replayerComputePipelineMap, (uint64_t)&self->_replayerIndirectCommandBufferMap,
              (uint64_t)a3,
              (uint64_t)&self->_encodedResourcesMap,
              v32,
              v21,
              (uint64_t)self->_resourcePatchingType,
              self->_patcher,
              self->_currentCommandBuffer,
              self->_currentCommandBufferFunctionIndex);
            v19 = v29;
          }
          v21 += v19;
        }
        while (v21 <= v22);
        goto LABEL_21;
      }
    }
  }
LABEL_23:

}

- (id)findStructTypeForArgumentIndex:(unint64_t)a3 inStructType:(id)a4
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v14;
  _QWORD v15[3];
  _QWORD *v16;
  _QWORD v17[3];
  _QWORD *v18;
  _QWORD v19[3];
  _QWORD *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v4 = a4;
  v18 = 0;
  v15[0] = &off_250D6F498;
  v15[1] = v17;
  v15[2] = v15;
  v16 = v15;
  v5 = operator new(0x20uLL);
  *v5 = &off_250D6F4E0;
  v5[1] = &v14;
  v5[2] = v17;
  v5[3] = v15;
  v20 = v5;
  std::__function::__value_func<MTLStructType * ()(MTLStructType *,unsigned long)>::swap[abi:ne180100](v19, v17);
  v6 = v20;
  if (v20 == v19)
  {
    v7 = 4;
    v6 = v19;
  }
  else
  {
    if (!v20)
      goto LABEL_6;
    v7 = 5;
  }
  (*(void (**)(_QWORD *))(*v6 + 8 * v7))(v6);
LABEL_6:
  std::function<MTLStructType * ()(MTLStructType *,unsigned long)>::operator()((uint64_t)v17, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  if (v16 == v15)
  {
    v10 = 4;
    v9 = v15;
  }
  else
  {
    if (!v16)
      goto LABEL_11;
    v10 = 5;
  }
  (*(void (**)(_QWORD *))(*v9 + 8 * v10))(v9);
LABEL_11:
  v11 = v18;
  if (v18 == v17)
  {
    v12 = 4;
    v11 = v17;
    goto LABEL_15;
  }
  if (v18)
  {
    v12 = 5;
LABEL_15:
    (*(void (**)(_QWORD *))(*v11 + 8 * v12))(v11);
  }

  return v8;
}

- (id)argumentEncoderForDecodingOperation:(const void *)a3 reflectionStructType:(id *)a4
{
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v17;

  -[DYMTLIndirectArgumentBufferManager device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[DYMTLIndirectArgumentBufferManager objectWithId:](self, "objectWithId:", *((_QWORD *)a3 + 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 || (v9 = (uint64_t *)*((_QWORD *)a3 + 3), v10 = (uint64_t *)*((_QWORD *)a3 + 4), v9 == v10))
    {
      v11 = 0;
    }
    else
    {
      v11 = 0;
      do
      {
        if (!v11)
        {
          v12 = *v9;
          v17 = 0;
          v11 = (void *)objc_msgSend(v8, "newArgumentEncoderWithBufferIndex:reflection:", v12, &v17);
          v13 = v17;
          objc_msgSend(v13, "bufferStructType");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
            *a4 = objc_retainAutorelease(v14);

        }
        ++v9;
      }
      while (v9 != v10);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)notifyReplayerTargetIndirectArgumentBuffers:(void *)a3
{
  char *v3;
  char *v4;
  uint64_t *p_replayerIABs;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  DYMTLReplayerIAB *end;
  DYMTLReplayerIAB *v13;
  char *v14;
  char *v15;
  BOOL v16;
  __compressed_pair<DYMTLReplayerIAB *, std::allocator<DYMTLReplayerIAB>> *p_end_cap;
  void **v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;

  v3 = (char *)a3 + 8;
  v4 = *(char **)a3;
  if (*(void **)a3 != (char *)a3 + 8)
  {
    p_end_cap = &self->_replayerIABs.__end_cap_;
    p_replayerIABs = (uint64_t *)&self->_replayerIABs;
    do
    {
      v21 = 0u;
      v22 = 0u;
      *(_QWORD *)&v21 = *((id *)v4 + 4);
      v7 = *((_QWORD *)v4 + 5);
      v8 = *((_QWORD *)v4 + 6);
      while (v7 != v8)
      {
        v19 = 0;
        v20 = 0;
        v9 = *(void **)(v7 + 8);
        v18 = *(void ***)v7;
        v19 = v9;
        objc_storeStrong(&v20, *(id *)(v7 + 16));
        v10 = v22;
        if ((unint64_t)v22 >= *((_QWORD *)&v22 + 1))
        {
          v11 = std::vector<DYMTLReplayerIAB::Usage>::__push_back_slow_path<DYMTLReplayerIAB::Usage const&>((uint64_t *)&v21 + 1, (uint64_t)&v18);
        }
        else
        {
          *(_QWORD *)v22 = v18;
          *(_QWORD *)(v10 + 8) = v19;
          *(_QWORD *)(v10 + 16) = v20;
          v11 = v10 + 24;
        }
        *(_QWORD *)&v22 = v11;

        v7 += 24;
      }
      end = self->_replayerIABs.__end_;
      if (end >= self->_replayerIABs.__end_cap_.__value_)
      {
        v13 = (DYMTLReplayerIAB *)std::vector<DYMTLReplayerIAB>::__push_back_slow_path<DYMTLReplayerIAB const&>(p_replayerIABs, (uint64_t)&v21);
      }
      else
      {
        std::allocator<DYMTLReplayerIAB>::construct[abi:ne180100]<DYMTLReplayerIAB,DYMTLReplayerIAB const&>((uint64_t)p_end_cap, self->_replayerIABs.__end_, (uint64_t)&v21);
        v13 = (DYMTLReplayerIAB *)((char *)end + 32);
        self->_replayerIABs.__end_ = (DYMTLReplayerIAB *)((char *)end + 32);
      }
      self->_replayerIABs.__end_ = v13;
      v18 = (void **)&v21 + 1;
      std::vector<DYMTLReplayerIAB::Usage>::__destroy_vector::operator()[abi:ne180100](&v18);

      v14 = (char *)*((_QWORD *)v4 + 1);
      if (v14)
      {
        do
        {
          v15 = v14;
          v14 = *(char **)v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          v15 = (char *)*((_QWORD *)v4 + 2);
          v16 = *(_QWORD *)v15 == (_QWORD)v4;
          v4 = v15;
        }
        while (!v16);
      }
      v4 = v15;
    }
    while (v15 != v3);
  }
}

- (void)notifyReplayerTargetCommandBuffersFinished
{
  vector<DYMTLReplayerIAB, std::allocator<DYMTLReplayerIAB>> *p_replayerIABs;
  DYMTLReplayerIAB *begin;
  DYMTLReplayerIAB *end;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;

  p_replayerIABs = &self->_replayerIABs;
  begin = self->_replayerIABs.__begin_;
  end = self->_replayerIABs.__end_;
  if (begin != end)
  {
    do
    {
      -[DYMTLIndirectArgumentBufferManager blitBufferFromGPU:](self, "blitBufferFromGPU:", *(_QWORD *)begin);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (_QWORD *)*((_QWORD *)begin + 1);
      v8 = (_QWORD *)*((_QWORD *)begin + 2);
      while (v7 != v8)
      {
        -[DYMTLIndirectArgumentBufferManager decodeReplayerIAB:offset:function:argument:](self, "decodeReplayerIAB:offset:function:argument:", v6, *v7, v7[1], v7[2]);
        v7 += 3;
      }

      begin = (DYMTLReplayerIAB *)((char *)begin + 32);
    }
    while (begin != end);
    begin = p_replayerIABs->__begin_;
  }
  std::vector<DYMTLReplayerIAB>::__base_destruct_at_end[abi:ne180100]((uint64_t)p_replayerIABs, (uint64_t)begin);
}

- (id)blitBufferFromGPU:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "storageMode"))
  {
    objc_msgSend(v4, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "newBufferWithLength:options:", objc_msgSend(v4, "length"), 0);
    -[DYMTLIndirectArgumentBufferManager queue](self, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "commandBuffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "blitCommandEncoder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v4, 0, v6, 0, objc_msgSend(v4, "length"));
    objc_msgSend(v9, "endEncoding");
    objc_msgSend(v8, "commit");
    objc_msgSend(v8, "waitUntilCompleted");

  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (void)decodeReplayerIAB:(id)a3 offset:(unint64_t)a4 function:(id)a5 argument:(id)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  id v13;
  id v14;
  _QWORD *v15;
  unint64_t *v16;
  id **v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  id **v25;
  id *v26;
  _QWORD *v27;
  unint64_t *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t *v33;
  id *v34;
  uint64_t v35;
  id *v36;
  _QWORD *v37;
  unint64_t *v38;
  id **v39;
  void **v40;
  void **v41;
  void *v42;
  void **v43;
  void *v44;
  _QWORD **v45;
  id v46;
  _QWORD *v47;
  void **v48;
  uint64_t **v49;
  uint64_t v50;
  void *v51;
  void *v52;
  _QWORD *v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  id **v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t *v66;
  id **v67;
  id **v68;
  id **v69;
  id **v70;
  id *v71;
  id **v72;
  BOOL v73;
  id **v74;
  id *v75;
  id **v76;
  _QWORD *v77;
  void *v78;
  _QWORD *v79;
  DYMTLIndirectArgumentBufferManager *v80;
  void *v81;
  objc_object *v82;
  void *v83;
  unordered_map<unsigned long long, unsigned long long, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, unsigned long long>>> *p_replayerIndirectCommandBufferMap;
  unordered_map<unsigned long long, unsigned long long, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, unsigned long long>>> *p_replayerComputePipelineMap;
  unordered_map<unsigned long long, unsigned long long, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, unsigned long long>>> *p_replayerRenderPipelineMap;
  unordered_map<unsigned long long, unsigned long long, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, unsigned long long>>> *p_replayerSamplerMap;
  unordered_map<unsigned long long, unsigned long long, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, unsigned long long>>> *p_replayerTextureMap;
  map<unsigned long long, unsigned long long, std::less<unsigned long long>, std::allocator<std::pair<const unsigned long long, unsigned long long>>> *p_replayerBufferBaseVirtualAddressMap;
  map<unsigned long long, std::vector<DYMTLOriginalProcessBuffer>, std::less<unsigned long long>, std::allocator<std::pair<const unsigned long long, std::vector<DYMTLOriginalProcessBuffer>>>> *p_bufferVitualAddressMap;
  unint64_t v91;
  unint64_t v92;
  void *v93;
  id v94;
  objc_object *v95;
  _QWORD **v96;
  _QWORD *v97[2];
  uint64_t v98;
  id **v99;
  unint64_t v100;
  void **v101;
  id v102;
  id v103;
  uint64_t *v104;
  id *v105;
  id *v106;
  void **p_begin_node;
  map<unsigned long long, std::vector<DYMTLOriginalProcessBuffer>, std::less<unsigned long long>, std::allocator<std::pair<const unsigned long long, std::vector<DYMTLOriginalProcessBuffer>>>> *v108;
  unordered_map<unsigned long long, unsigned long long, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, unsigned long long>>> *v109;
  unordered_map<unsigned long long, unsigned long long, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, unsigned long long>>> *v110;
  unordered_map<unsigned long long, unsigned long long, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, unsigned long long>>> *v111;
  unordered_map<unsigned long long, unsigned long long, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, unsigned long long>>> *v112;
  unordered_map<unsigned long long, unsigned long long, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, unsigned long long>>> *v113;
  _BYTE v114[24];
  _BYTE *v115;
  _QWORD v116[3];
  _QWORD *v117;
  id *v118;
  id *v119;
  id *v120;
  unint64_t *v121;
  uint64_t v122;

  v122 = *MEMORY[0x24BDAC8D0];
  v95 = (objc_object *)a3;
  v10 = a5;
  v94 = a6;
  v81 = v10;
  v82 = (objc_object *)objc_msgSend(v10, "newArgumentEncoderWithBufferIndex:", objc_msgSend(v94, "index"));
  DYMTLGetOriginalObject(v82);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layout");
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  v92 = -[objc_object encodedLength](v82, "encodedLength");
  v91 = -[objc_object length](v95, "length");
  -[objc_object device](v95, "device");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_currentDeviceDecodingData && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v83, "setIndirectArgumentBufferDecodingData:", 0);
  v98 = 0;
  v99 = 0;
  v100 = 0;
  v79 = -[DYMTLFunctionPlayer objectMap](self->_player, "objectMap");
  v80 = self;
  v12 = a4 % v92;
  if (a4 % v92 < v91)
  {
    p_replayerBufferBaseVirtualAddressMap = &self->_replayerBufferBaseVirtualAddressMap;
    p_bufferVitualAddressMap = &self->_bufferVitualAddressMap;
    p_replayerSamplerMap = &self->_replayerSamplerMap;
    p_replayerTextureMap = &self->_replayerTextureMap;
    p_replayerComputePipelineMap = &self->_replayerComputePipelineMap;
    p_replayerRenderPipelineMap = &self->_replayerRenderPipelineMap;
    p_replayerIndirectCommandBufferMap = &self->_replayerIndirectCommandBufferMap;
    do
    {
      DYMTLGetOriginalObject(v95);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v102 = (id)v12;
      v103 = v13;
      v101 = v93;
      v14 = v94;
      v104 = (uint64_t *)&v101;
      v105 = &v103;
      v106 = &v102;
      p_begin_node = &p_replayerBufferBaseVirtualAddressMap->__tree_.__begin_node_;
      v108 = p_bufferVitualAddressMap;
      v109 = p_replayerTextureMap;
      v110 = p_replayerSamplerMap;
      v111 = p_replayerRenderPipelineMap;
      v112 = p_replayerComputePipelineMap;
      v113 = p_replayerIndirectCommandBufferMap;
      v117 = 0;
      v15 = operator new(0x20uLL);
      *v15 = &off_250D6F358;
      v15[1] = v116;
      v15[2] = v114;
      v15[3] = &v104;
      v115 = v15;
      v16 = (unint64_t *)operator new(0x20uLL);
      *v16 = (unint64_t)&off_250D6F3A0;
      v16[1] = (unint64_t)v116;
      v16[2] = (unint64_t)v114;
      v16[3] = (unint64_t)&v104;
      v121 = v16;
      std::__function::__value_func<void ()(NSArray<MTLStructMember *> *,std::map<unsigned long long,unsigned long long> &,unsigned long)>::swap[abi:ne180100](&v118, v116);
      v17 = (id **)v121;
      if (v121 == (unint64_t *)&v118)
      {
        v17 = &v118;
        v18 = 4;
      }
      else
      {
        if (!v121)
          goto LABEL_11;
        v18 = 5;
      }
      ((void (*)(void))(*v17)[v18])();
LABEL_11:
      v97[0] = 0;
      v97[1] = 0;
      v96 = v97;
      objc_msgSend(v14, "bufferStructType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "members");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      std::function<void ()(NSArray<MTLStructMember *> *,std::map<unsigned long long,unsigned long long> &,unsigned long)>::operator()((uint64_t)v116, v20, (uint64_t)&v96, 0);

      v21 = v115;
      if (v115 == v114)
      {
        v21 = v114;
        v22 = 4;
      }
      else
      {
        if (!v115)
          goto LABEL_16;
        v22 = 5;
      }
      (*(void (**)(void))(*v21 + 8 * v22))();
LABEL_16:
      v23 = v117;
      if (v117 == v116)
      {
        v23 = v116;
        v24 = 4;
        goto LABEL_20;
      }
      if (v117)
      {
        v24 = 5;
LABEL_20:
        (*(void (**)(void))(*v23 + 8 * v24))();
      }

      v118 = (id *)v12;
      std::map<unsigned long long,unsigned long long>::map[abi:ne180100]((uint64_t *)&v119, (uint64_t)&v96);
      v25 = v99;
      if ((unint64_t)v99 >= v100)
      {
        v29 = ((uint64_t)v99 - v98) >> 5;
        v30 = v29 + 1;
        if ((unint64_t)(v29 + 1) >> 59)
          std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
        v31 = v100 - v98;
        if ((uint64_t)(v100 - v98) >> 4 > v30)
          v30 = v31 >> 4;
        if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFE0)
          v32 = 0x7FFFFFFFFFFFFFFLL;
        else
          v32 = v30;
        v108 = (map<unsigned long long, std::vector<DYMTLOriginalProcessBuffer>, std::less<unsigned long long>, std::allocator<std::pair<const unsigned long long, std::vector<DYMTLOriginalProcessBuffer>>>> *)&v100;
        v33 = (uint64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<DYMTLReplayerIAB>>((uint64_t)&v100, v32);
        v34 = (id *)&v33[4 * v29];
        v104 = v33;
        v105 = v34;
        p_begin_node = (void **)&v33[4 * v35];
        *v34 = v118;
        v34[1] = v119;
        v36 = v120;
        v34[2] = v120;
        v37 = v34 + 2;
        v38 = v121;
        v34[3] = v121;
        if (v38)
        {
          v36[2] = v37;
          v119 = (id *)&v120;
          v120 = 0;
          v121 = 0;
        }
        else
        {
          v34[1] = v37;
        }
        v106 = v34 + 4;
        std::vector<std::pair<unsigned long long,std::map<unsigned long long,unsigned long long>>>::__swap_out_circular_buffer(&v98, &v104);
        v39 = v99;
        std::__split_buffer<std::pair<unsigned long long,std::map<unsigned long long,unsigned long long>>>::~__split_buffer((void **)&v104);
      }
      else
      {
        *v99 = v118;
        v25[1] = v119;
        v26 = v120;
        v25[2] = v120;
        v27 = v25 + 2;
        v28 = v121;
        v25[3] = (id *)v121;
        if (v28)
        {
          v26[2] = v27;
          v119 = (id *)&v120;
          v120 = 0;
          v121 = 0;
        }
        else
        {
          v25[1] = (id *)v27;
        }
        v39 = v25 + 4;
      }
      v99 = v39;
      std::__tree<BufferEntry>::destroy((uint64_t)&v119, v120);
      std::__tree<BufferEntry>::destroy((uint64_t)&v96, v97[0]);
      v12 += v92;
    }
    while (v12 < v91);
  }
  if (v80->_currentDeviceDecodingData)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v83, "setIndirectArgumentBufferDecodingData:", v80->_currentDeviceDecodingData);
      v40 = (void **)v98;
      v41 = (void **)v99;
      if ((id **)v98 != v99)
      {
        do
        {
          DYMTLGetOriginalObject(v95);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = *v40;
          v43 = v40 + 1;
          v45 = v42;
          v96 = v45;
          v103 = v44;
          v102 = v93;
          v46 = v94;
          v101 = v43;
          v117 = 0;
          v118 = (id *)&v101;
          v119 = &v102;
          v120 = (id *)&v96;
          v121 = (unint64_t *)&v103;
          v47 = operator new(0x20uLL);
          *v47 = &off_250D6F3E8;
          v47[1] = v116;
          v47[2] = v114;
          v47[3] = &v118;
          v115 = v47;
          v48 = (void **)operator new(0x20uLL);
          *v48 = &off_250D6F430;
          v48[1] = v116;
          v48[2] = v114;
          v48[3] = &v118;
          p_begin_node = v48;
          std::__function::__value_func<void ()(NSArray<MTLStructMember *> *,unsigned long)>::swap[abi:ne180100](&v104, v116);
          v49 = (uint64_t **)p_begin_node;
          if (p_begin_node == (void **)&v104)
          {
            v49 = &v104;
            v50 = 4;
          }
          else
          {
            if (!p_begin_node)
              goto LABEL_45;
            v50 = 5;
          }
          ((void (*)(void))(*v49)[v50])();
LABEL_45:
          objc_msgSend(v46, "bufferStructType");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "members");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          std::function<void ()(NSArray<MTLStructMember *> *,unsigned long)>::operator()((uint64_t)v116, v52, 0);

          v53 = v115;
          if (v115 == v114)
          {
            v53 = v114;
            v54 = 4;
          }
          else
          {
            if (!v115)
              goto LABEL_50;
            v54 = 5;
          }
          (*(void (**)(void))(*v53 + 8 * v54))();
LABEL_50:
          v55 = v117;
          if (v117 == v116)
          {
            v55 = v116;
            v56 = 4;
            goto LABEL_54;
          }
          if (v117)
          {
            v56 = 5;
LABEL_54:
            (*(void (**)(void))(*v55 + 8 * v56))();
          }

          v40 = v43 + 3;
        }
        while (v40 != v41);
      }
    }
  }
  v118 = 0;
  v57 = objc_msgSend(v81, "functionType");
  switch(v57)
  {
    case 1:
      v58 = objc_msgSend(v94, "index");
      v59 = (_QWORD *)MEMORY[0x24BE394C8];
      break;
    case 2:
      v58 = objc_msgSend(v94, "index");
      v59 = (_QWORD *)MEMORY[0x24BE39498];
      break;
    case 3:
      v58 = objc_msgSend(v94, "index");
      v59 = (_QWORD *)MEMORY[0x24BE394A0];
      break;
    default:
      goto LABEL_63;
  }
  v118 = (id *)(v58 + *v59);
LABEL_63:
  v60 = v98;
  v61 = v99;
  if ((id **)v98 == v99)
  {
    std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__erase_unique<unsigned long long>(v79, (unint64_t *)&v118);
  }
  else
  {
    v62 = *(_QWORD *)(v98 + 24);
    -[objc_object device](v95, "device");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (void *)objc_msgSend(v63, "newBufferWithLength:options:", 8 * (v62 + (((uint64_t)v61 - v60) >> 5) * v62 + (((uint64_t)v61 - v60) >> 5)) + 16, 0);

    v65 = objc_retainAutorelease(v64);
    v66 = (uint64_t *)objc_msgSend(v65, "contents");
    v68 = (id **)v98;
    v67 = v99;
    *v66 = ((uint64_t)v99 - v98) >> 5;
    v69 = (id **)(v66 + 2);
    v66[1] = (uint64_t)v68[3];
    v70 = (id **)v68[1];
    if (v70 != v68 + 2)
    {
      do
      {
        *v69++ = v70[4];
        v71 = v70[1];
        if (v71)
        {
          do
          {
            v72 = (id **)v71;
            v71 = (id *)*v71;
          }
          while (v71);
        }
        else
        {
          do
          {
            v72 = (id **)v70[2];
            v73 = *v72 == (id *)v70;
            v70 = v72;
          }
          while (!v73);
        }
        v70 = v72;
      }
      while (v72 != v68 + 2);
    }
    while (v68 != v67)
    {
      *v69++ = *v68;
      v74 = (id **)v68[1];
      if (v74 != v68 + 2)
      {
        do
        {
          *v69 = v74[5];
          v75 = v74[1];
          if (v75)
          {
            do
            {
              v76 = (id **)v75;
              v75 = (id *)*v75;
            }
            while (v75);
          }
          else
          {
            do
            {
              v76 = (id **)v74[2];
              v73 = *v76 == (id *)v74;
              v74 = v76;
            }
            while (!v73);
          }
          ++v69;
          v74 = v76;
        }
        while (v76 != v68 + 2);
      }
      v68 += 4;
    }
    v104 = (uint64_t *)&v118;
    v77 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)v79, (unint64_t *)&v118, (uint64_t)&std::piecewise_construct, &v104);
    v78 = (void *)v77[3];
    v77[3] = v65;

  }
  v104 = &v98;
  std::vector<std::pair<unsigned long long,std::map<unsigned long long,unsigned long long>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v104);

}

- (void)bufferVitualAddressMap
{
  return &self->_bufferVitualAddressMap;
}

- (void)textureMap
{
  return &self->_textureMap;
}

- (void)samplerMap
{
  return &self->_samplerMap;
}

- (void)replayerBufferBaseVirtualAddressMap
{
  return &self->_replayerBufferBaseVirtualAddressMap;
}

- (void)replayerTextureMap
{
  return &self->_replayerTextureMap;
}

- (void)replayerSamplerMap
{
  return &self->_replayerSamplerMap;
}

- (void).cxx_destruct
{
  DYCommandBufferUID *begin;
  void **p_begin;

  objc_storeStrong((id *)&self->_patcher, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_replayerIndirectCommandBufferMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_replayerComputePipelineMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_replayerRenderPipelineMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_replayerSamplerMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_replayerTextureMap);
  std::__tree<BufferEntry>::destroy((uint64_t)&self->_replayerBufferBaseVirtualAddressMap, (_QWORD *)self->_replayerBufferBaseVirtualAddressMap.__tree_.__pair1_.__value_.__left_);
  p_begin = (void **)&self->_replayerIABs.__begin_;
  std::vector<DYMTLReplayerIAB>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  std::__tree<BufferEntry>::destroy((uint64_t)&self->_deviceResourcesBuffers, (_QWORD *)self->_deviceResourcesBuffers.__tree_.__pair1_.__value_.__left_);
  std::__hash_table<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::set<DYMTLIABDecodingOp>>>>::~__hash_table((uint64_t)&self->_decodingMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,std::unordered_map<unsigned long long,std::unordered_map<unsigned long long,unsigned long long>>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<unsigned long long,std::unordered_map<unsigned long long,unsigned long long>>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<unsigned long long,std::unordered_map<unsigned long long,unsigned long long>>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unordered_map<unsigned long long,std::unordered_map<unsigned long long,unsigned long long>>>>>::~__hash_table((uint64_t)&self->_encodedResourcesMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::~__hash_table((uint64_t)&self->_usedSamplersMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_indirectCommandBufferMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_computePipelineMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_renderPipelineMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<OffsetPair>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<OffsetPair>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<OffsetPair>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<OffsetPair>>>>::~__hash_table((uint64_t)&self->_samplerMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_textureMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_bufferLengthMap);
  std::__tree<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>>>::destroy((uint64_t)&self->_bufferVitualAddressMap, (_QWORD *)self->_bufferVitualAddressMap.__tree_.__pair1_.__value_.__left_);
  p_begin = &self->_indirectArgumentBuffers.__begin_;
  std::vector<std::vector<std::vector<GPUTools::MTL::Utils::DYMTLIndirectArgumentBufferInfo>>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = &self->_ancestorMaps.__begin_;
  std::vector<std::vector<std::unordered_map<unsigned long long,std::unordered_map<unsigned long long,unsigned long long>>>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  begin = self->_commandBufferIds.__begin_;
  if (begin)
  {
    self->_commandBufferIds.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_currentDeviceDecodingData, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = (char *)self + 120;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_DWORD *)self + 42) = 1065353216;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_DWORD *)self + 52) = 1065353216;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *((_DWORD *)self + 62) = 1065353216;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((_DWORD *)self + 72) = 1065353216;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *((_DWORD *)self + 82) = 1065353216;
  *((_OWORD *)self + 21) = 0u;
  *((_OWORD *)self + 22) = 0u;
  *((_DWORD *)self + 92) = 1065353216;
  *(_OWORD *)((char *)self + 376) = 0u;
  *(_OWORD *)((char *)self + 392) = 0u;
  *((_DWORD *)self + 102) = 1065353216;
  *((_OWORD *)self + 26) = 0u;
  *((_OWORD *)self + 27) = 0u;
  *((_DWORD *)self + 112) = 1065353216;
  *(_OWORD *)((char *)self + 456) = 0u;
  *(_OWORD *)((char *)self + 472) = 0u;
  *((_DWORD *)self + 122) = 1065353216;
  *(_OWORD *)((char *)self + 504) = 0u;
  *((_QWORD *)self + 62) = (char *)self + 504;
  *((_QWORD *)self + 67) = 0;
  *(_OWORD *)((char *)self + 520) = 0u;
  *(_OWORD *)((char *)self + 552) = 0u;
  *((_QWORD *)self + 68) = (char *)self + 552;
  *(_OWORD *)((char *)self + 568) = 0u;
  *(_OWORD *)((char *)self + 584) = 0u;
  *((_DWORD *)self + 150) = 1065353216;
  *((_OWORD *)self + 38) = 0u;
  *((_OWORD *)self + 39) = 0u;
  *((_DWORD *)self + 160) = 1065353216;
  *(_OWORD *)((char *)self + 648) = 0u;
  *(_OWORD *)((char *)self + 664) = 0u;
  *((_DWORD *)self + 170) = 1065353216;
  *((_OWORD *)self + 43) = 0u;
  *((_OWORD *)self + 44) = 0u;
  *((_DWORD *)self + 180) = 1065353216;
  *(_OWORD *)((char *)self + 728) = 0u;
  *(_OWORD *)((char *)self + 744) = 0u;
  *((_DWORD *)self + 190) = 1065353216;
  return self;
}

- (void)findStructTypeForArgumentIndex:inStructType:
{
  JUMPOUT(0x242623D28);
}

- (__n128)findStructTypeForArgumentIndex:inStructType:
{
  __n128 result;

  *(_QWORD *)a2 = &off_250D6F4E0;
  result = *(__n128 *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (id)findStructTypeForArgumentIndex:inStructType:
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = *a2;
  v5 = *a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  objc_msgSend(v4, "members");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___ZZ82__DYMTLIndirectArgumentBufferManager_findStructTypeForArgumentIndex_inStructType__ENK3__1clEP13MTLStructTypem_block_invoke;
  v9[3] = &unk_250D6F520;
  v9[4] = &v12;
  v9[5] = v5;
  v10 = *(_OWORD *)(a1 + 8);
  v11 = *(_QWORD *)(a1 + 24);
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

@end
