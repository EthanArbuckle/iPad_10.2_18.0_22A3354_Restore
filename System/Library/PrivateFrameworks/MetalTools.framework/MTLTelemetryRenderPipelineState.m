@implementation MTLTelemetryRenderPipelineState

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
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  _DWORD *v9;

  v3 = *(_QWORD *)&self->uniqueID + 272;
  v9 = &self->super.super._externalReferences + 1;
  v4 = std::__hash_table<std::__hash_value_type<unsigned int,MTLTelemetryRenderPipelineUsageRec>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderPipelineUsageRec>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderPipelineUsageRec>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,MTLTelemetryRenderPipelineUsageRec>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v3, (unsigned int *)&self->super.super._externalReferences + 1, (uint64_t)&std::piecewise_construct, &v9);
  v5 = *(_QWORD *)&self->uniqueID + 312;
  v9 = v4 + 5;
  v6 = std::__hash_table<std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v5, v4 + 5, (uint64_t)&std::piecewise_construct, &v9);
  ++*((_DWORD *)v6 + 8);
  v7 = *(_QWORD *)&self->uniqueID + 312;
  v9 = v4 + 6;
  v8 = std::__hash_table<std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v7, v4 + 6, (uint64_t)&std::piecewise_construct, &v9);
  ++*((_DWORD *)v8 + 8);
  ++v4[7];
}

- (MTLTelemetryRenderPipelineState)initWithPipelineState:(id)a3 reflection:(id)a4 parent:(id)a5 descriptor:(id)a6
{
  MTLTelemetryRenderPipelineState *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  MTLTelemetryRenderPipelineState *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD block[11];
  objc_super v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v43.receiver = self;
  v43.super_class = (Class)MTLTelemetryRenderPipelineState;
  v10 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:](&v43, sel_initWithBaseObject_parent_, a3, a5);
  if (v10 && objc_msgSend(a5, "enableTelemetry"))
  {
    *(&v10->super.super._externalReferences + 1) = +[MTLTelemetryRenderPipelineState generateUniqueID](MTLTelemetryRenderPipelineState, "generateUniqueID");
    *(_QWORD *)&v10->uniqueID = a5;
    v11 = (void *)objc_msgSend(a4, "performanceStatistics");
    v12 = (void *)objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDDD358]);
    v13 = (void *)objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDDD2E8]);
    v14 = objc_msgSend(v12, "objectForKey:", CFSTR("Telemetry Statistics"));
    v15 = objc_msgSend(v13, "objectForKey:", CFSTR("Telemetry Statistics"));
    v16 = *((_QWORD *)a5 + 91);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __86__MTLTelemetryRenderPipelineState_initWithPipelineState_reflection_parent_descriptor___block_invoke;
    block[3] = &unk_24F7955D8;
    block[4] = a3;
    block[5] = v10;
    block[6] = v14;
    block[7] = v15;
    block[8] = a6;
    block[9] = a5;
    block[10] = a4;
    dispatch_sync(v16, block);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v17 = (void *)objc_msgSend(a4, "constantSamplerDescriptors");
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    if (!v18)
      goto LABEL_13;
    v19 = v18;
    v20 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v39 != v20)
          objc_enumerationMutation(v17);
        if ((unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "maxAnisotropy") >= 2)
        {
          LOBYTE(v10->device) = 1;
          goto LABEL_13;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v19);
LABEL_13:
    v33 = v10;
    v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v24 = (void *)objc_msgSend(a4, "fragmentArguments");
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    if (!v25)
      goto LABEL_25;
    v26 = v25;
    v27 = *(_QWORD *)v35;
LABEL_15:
    v28 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v27)
        objc_enumerationMutation(v24);
      v29 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v28);
      if (!objc_msgSend(v29, "isActive"))
        goto LABEL_23;
      v30 = objc_msgSend(v29, "type");
      v31 = v22;
      if (v30 == 3)
        goto LABEL_22;
      if (v30 == 2)
        break;
LABEL_23:
      if (v26 == ++v28)
      {
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
        if (!v26)
        {
LABEL_25:
          v10 = v33;
          *(_QWORD *)&v33->hasAnisoConstantSampler = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v22);
          v33->activeFragmentSamplers = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v23);

          return v10;
        }
        goto LABEL_15;
      }
    }
    v31 = v23;
LABEL_22:
    objc_msgSend(v31, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v29, "index")));
    goto LABEL_23;
  }
  return v10;
}

uint64_t __86__MTLTelemetryRenderPipelineState_initWithPipelineState_reflection_parent_descriptor___block_invoke(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  unsigned int v19;
  unsigned __int8 *v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  unsigned int v28;
  unsigned __int8 *v29;
  int v30;
  uint64_t k;
  uint64_t v32;
  unsigned int v33;
  _DWORD *v34;
  unsigned int *v35;
  unsigned int v36;
  unsigned int v37;
  _DWORD *v38;
  unsigned int *v39;
  unsigned int v40;
  id *v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t result;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void *__p[2];
  char v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  unsigned int v56;
  unsigned int v57;
  void **v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v2, "getVertexShaderTelemetryID");
  v57 = v3;
  LODWORD(v2) = objc_msgSend(v2, "getFragmentShaderTelemetryID");
  v56 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(v4 + 40) + 272;
  __p[0] = (void *)(v4 + 36);
  v6 = std::__hash_table<std::__hash_value_type<unsigned int,MTLTelemetryRenderPipelineUsageRec>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderPipelineUsageRec>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderPipelineUsageRec>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,MTLTelemetryRenderPipelineUsageRec>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v5, (unsigned int *)(v4 + 36), (uint64_t)&std::piecewise_construct, (_DWORD **)__p);
  v6[5] = v3;
  v6[6] = (_DWORD)v2;
  v6[7] = 0;
  v7 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 48));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) + 312;
  __p[0] = &v57;
  v9 = std::__hash_table<std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v8, &v57, (uint64_t)&std::piecewise_construct, (_DWORD **)__p);
  v9[3] = 1;
  *((_DWORD *)v9 + 8) = 0;
  v9[5] = v7;
  v10 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 56));
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) + 312;
  __p[0] = &v56;
  v12 = std::__hash_table<std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,MTLTelemetryRenderFuncUsageRec>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v11, &v56, (uint64_t)&std::piecewise_construct, (_DWORD **)__p);
  v12[3] = 2;
  *((_DWORD *)v12 + 8) = 0;
  v12[5] = v10;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v14 = *(void **)(a1 + 48);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v53 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v18, "UTF8String"));
        v19 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v18), "unsignedIntValue");
        v58 = __p;
        v20 = std::__hash_table<std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v13 + 360, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v58);
        if (v19)
        {
          v21 = *((_DWORD *)v20 + 14);
          if (v21)
          {
            if (v19 > *((_DWORD *)v20 + 11))
              *((_DWORD *)v20 + 11) = v19;
            if (v19 >= *((_DWORD *)v20 + 10))
              goto LABEL_14;
          }
          else
          {
            *((_DWORD *)v20 + 11) = v19;
          }
          *((_DWORD *)v20 + 10) = v19;
LABEL_14:
          *((_QWORD *)v20 + 6) += v19;
          *((_DWORD *)v20 + 14) = v21 + 1;
        }
        if (v51 < 0)
          operator delete(__p[0]);
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v15);
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v22 = *(void **)(a1 + 56);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
  if (v23)
  {
    v24 = v13 + 400;
    v25 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v47 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v27, "UTF8String"));
        v28 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v27), "unsignedIntValue");
        v58 = __p;
        v29 = std::__hash_table<std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,MTLTelemetryStatisticUIRec>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v24, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v58);
        if (v28)
        {
          v30 = *((_DWORD *)v29 + 14);
          if (v30)
          {
            if (v28 > *((_DWORD *)v29 + 11))
              *((_DWORD *)v29 + 11) = v28;
            if (v28 >= *((_DWORD *)v29 + 10))
              goto LABEL_32;
          }
          else
          {
            *((_DWORD *)v29 + 11) = v28;
          }
          *((_DWORD *)v29 + 10) = v28;
LABEL_32:
          *((_QWORD *)v29 + 6) += v28;
          *((_DWORD *)v29 + 14) = v30 + 1;
        }
        if (v51 < 0)
          operator delete(__p[0]);
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
    }
    while (v23);
  }
  for (k = 0; k != 8; ++k)
  {
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "colorAttachments"), "_descriptorAtIndex:", k), "isBlendingEnabled"))++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 352) + 4 * k);
  }
  v32 = a1 + 72;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 352) + 32) += objc_msgSend(*(id *)(a1 + 64), "isAlphaTestEnabled");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v32 + 352) + 36) += objc_msgSend(*(id *)(a1 + 64), "isAlphaToOneEnabled");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v32 + 352) + 40) += objc_msgSend(*(id *)(a1 + 64), "isAlphaToCoverageEnabled");
  v33 = objc_msgSend(*(id *)(a1 + 64), "rasterSampleCount");
  if (v33)
  {
    v34 = *(_DWORD **)(*(_QWORD *)(a1 + 72) + 352);
    if (v34[22])
    {
      if (v34[19] < v33)
      {
        v34[19] = v33;
        v34 = *(_DWORD **)(*(_QWORD *)(a1 + 72) + 352);
      }
      v36 = v34[18];
      v35 = v34 + 18;
      if (v36 <= v33)
        goto LABEL_49;
    }
    else
    {
      v34[19] = v33;
      v35 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 352) + 72);
    }
    *v35 = v33;
LABEL_49:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 352) + 80) += v33;
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 352) + 88);
  }
  v37 = objc_msgSend(*(id *)(a1 + 64), "colorSampleCount");
  if (v37)
  {
    v38 = *(_DWORD **)(*(_QWORD *)(a1 + 72) + 352);
    if (v38[16])
    {
      if (v38[13] < v37)
      {
        v38[13] = v37;
        v38 = *(_DWORD **)(*(_QWORD *)(a1 + 72) + 352);
      }
      v40 = v38[12];
      v39 = v38 + 12;
      if (v40 <= v37)
        goto LABEL_58;
    }
    else
    {
      v38[13] = v37;
      v39 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 352) + 48);
    }
    *v39 = v37;
LABEL_58:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 352) + 56) += v37;
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 352) + 64);
  }
  v41 = (id *)(a1 + 80);
  v42 = objc_msgSend(*(id *)(a1 + 80), "usageFlags");
  v44 = *(_QWORD *)(a1 + 72);
  v43 = a1 + 72;
  *(_DWORD *)(*(_QWORD *)(v44 + 352) + 96) += v42 & 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v43 + 352) + 100) += (objc_msgSend(*v41, "usageFlags") >> 1) & 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v43 + 352) + 104) += (objc_msgSend(*v41, "usageFlags") >> 2) & 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v43 + 352) + 108) += (objc_msgSend(*v41, "usageFlags") >> 3) & 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v43 + 352) + 112) += (objc_msgSend(*v41, "usageFlags") >> 4) & 1;
  result = objc_msgSend(*v41, "usageFlags");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v43 + 352) + 116) += (result >> 5) & 1;
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)v43 + 352) + 120);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (objc_msgSend(*(id *)&self->uniqueID, "enableTelemetry"))
  {

  }
  v3.receiver = self;
  v3.super_class = (Class)MTLTelemetryRenderPipelineState;
  -[MTLToolsRenderPipelineState dealloc](&v3, sel_dealloc);
}

@end
