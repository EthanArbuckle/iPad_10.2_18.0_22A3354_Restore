@implementation MTLTelemetryComputePipelineState

+ (unsigned)generateUniqueID
{
  unsigned int v2;
  unsigned int result;

  do
  {
    v2 = __ldaxr(&lastUniquePipelineID);
    result = v2 + 1;
  }
  while (__stlxr(v2 + 1, &lastUniquePipelineID));
  return result;
}

- (void)accumulateUsage
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->device->queue;
  if (queue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__MTLTelemetryComputePipelineState_accumulateUsage__block_invoke;
    block[3] = &unk_24F795440;
    block[4] = self;
    dispatch_sync(queue, block);
  }
}

_QWORD *__51__MTLTelemetryComputePipelineState_accumulateUsage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  _QWORD *result;
  _DWORD *v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 56) + 472;
  v7 = (_DWORD *)(v2 + 52);
  v4 = (unsigned int *)std::__hash_table<std::__hash_value_type<unsigned int,MTLTelemetryComputePipelineUsageRec>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryComputePipelineUsageRec>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryComputePipelineUsageRec>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,MTLTelemetryComputePipelineUsageRec>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v3, (unsigned int *)(v2 + 52), (uint64_t)&std::piecewise_construct, &v7);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 512;
  v7 = v4 + 5;
  result = std::__hash_table<std::__hash_value_type<unsigned int,MTLTelemetryKernelUsageRec>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryKernelUsageRec>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryKernelUsageRec>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,MTLTelemetryKernelUsageRec>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v5, v4 + 5, (uint64_t)&std::piecewise_construct, &v7);
  ++*((_DWORD *)result + 6);
  ++v4[6];
  return result;
}

- (MTLTelemetryComputePipelineState)initWithComputePipelineState:(id)a3 reflection:(id)a4 parent:(id)a5 descriptor:(id)a6
{
  MTLTelemetryComputePipelineState *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[9];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTLTelemetryComputePipelineState;
  v9 = -[MTLToolsObject initWithBaseObject:parent:](&v14, sel_initWithBaseObject_parent_, a3, a5);
  if (v9)
  {
    if (objc_msgSend(a5, "enableTelemetry"))
    {
      v9->device = (MTLTelemetryDevice *)a5;
      *(&v9->uniqueID + 1) = +[MTLTelemetryComputePipelineState generateUniqueID](MTLTelemetryComputePipelineState, "generateUniqueID");
      v10 = objc_msgSend((id)objc_msgSend(a4, "performanceStatistics"), "objectForKey:", CFSTR("Telemetry Statistics"));
      v11 = *((_QWORD *)a5 + 91);
      if (v11)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __94__MTLTelemetryComputePipelineState_initWithComputePipelineState_reflection_parent_descriptor___block_invoke;
        block[3] = &unk_24F795468;
        block[4] = a3;
        block[5] = v9;
        block[6] = v10;
        block[7] = a5;
        block[8] = a4;
        dispatch_sync(v11, block);
      }
    }
  }
  return v9;
}

uint64_t __94__MTLTelemetryComputePipelineState_initWithComputePipelineState_reflection_parent_descriptor___block_invoke(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  unsigned int v16;
  unsigned __int8 *v17;
  int v18;
  id *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  void *__p[2];
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  unsigned int v30;
  void **v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "getComputeKernelTelemetryID");
  v30 = v2;
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(v3 + 56) + 472;
  __p[0] = (void *)(v3 + 52);
  v5 = std::__hash_table<std::__hash_value_type<unsigned int,MTLTelemetryComputePipelineUsageRec>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryComputePipelineUsageRec>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryComputePipelineUsageRec>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,MTLTelemetryComputePipelineUsageRec>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v4, (unsigned int *)(v3 + 52), (uint64_t)&std::piecewise_construct, (_DWORD **)__p);
  *((_DWORD *)v5 + 5) = v2;
  *((_DWORD *)v5 + 6) = 0;
  v6 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 48));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56) + 512;
  __p[0] = &v30;
  v8 = std::__hash_table<std::__hash_value_type<unsigned int,MTLTelemetryKernelUsageRec>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryKernelUsageRec>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryKernelUsageRec>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,MTLTelemetryKernelUsageRec>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, &v30, (uint64_t)&std::piecewise_construct, (_DWORD **)__p);
  *((_DWORD *)v8 + 6) = 0;
  v8[4] = v6;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = *(void **)(a1 + 48);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v11)
  {
    v12 = v9 + 560;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v15, "UTF8String"));
        v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v15), "unsignedIntValue");
        v31 = __p;
        v17 = std::__hash_table<std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v12, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v31);
        if (v16)
        {
          v18 = *((_DWORD *)v17 + 14);
          if (v18)
          {
            if (v16 > *((_DWORD *)v17 + 11))
              *((_DWORD *)v17 + 11) = v16;
            if (v16 >= *((_DWORD *)v17 + 10))
              goto LABEL_14;
          }
          else
          {
            *((_DWORD *)v17 + 11) = v16;
          }
          *((_DWORD *)v17 + 10) = v16;
LABEL_14:
          *((_QWORD *)v17 + 6) += v16;
          *((_DWORD *)v17 + 14) = v18 + 1;
        }
        if (v25 < 0)
          operator delete(__p[0]);
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v11);
  }
  v19 = (id *)(a1 + 64);
  v20 = objc_msgSend(*(id *)(a1 + 64), "usageFlags");
  v22 = *(_QWORD *)(a1 + 56);
  v21 = a1 + 56;
  *(_DWORD *)(*(_QWORD *)(v22 + 552) + 4) += v20 & 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v21 + 552) + 8) += (objc_msgSend(*v19, "usageFlags") >> 1) & 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v21 + 552) + 12) += (objc_msgSend(*v19, "usageFlags") >> 2) & 1;
  result = objc_msgSend(*v19, "usageFlags");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v21 + 552) + 16) += (result >> 3) & 1;
  ++**(_DWORD **)(*(_QWORD *)v21 + 552);
  return result;
}

@end
