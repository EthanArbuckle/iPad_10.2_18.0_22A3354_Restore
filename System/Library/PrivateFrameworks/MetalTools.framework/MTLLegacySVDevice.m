@implementation MTLLegacySVDevice

- (MTLLegacySVDevice)initWithBaseObject:(id)a3 parent:(id)a4
{
  char *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  _DWORD *v16;
  char *v17;
  const char *v18;
  uint64_t i;
  FILE **v20;
  uint64_t j;
  unint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  _DWORD *v26;
  char *v27;
  const char *v28;
  uint64_t v29;
  FILE **v30;
  uint64_t k;
  unint64_t v32;
  _DWORD *v33;
  char *v34;
  char *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  int v57;
  objc_super v58;
  std::string __p;

  v58.receiver = self;
  v58.super_class = (Class)MTLLegacySVDevice;
  v5 = -[MTLToolsDevice initWithBaseObject:parent:](&v58, sel_initWithBaseObject_parent_, a3, a4);
  if (!v5)
    return (MTLLegacySVDevice *)v5;
  if (MTLLegacySVLog(void)::onceToken != -1)
    dispatch_once(&MTLLegacySVLog(void)::onceToken, &__block_literal_global_1);
  v6 = MTLLegacySVLog(void)::logObject;
  if (os_log_type_enabled((os_log_t)MTLLegacySVLog(void)::logObject, OS_LOG_TYPE_DEBUG))
    -[MTLLegacySVDevice initWithBaseObject:parent:].cold.3((uint64_t)v5, v6);
  *((_QWORD *)v5 + 81) = objc_msgSend(v5, "newInternalBufferWithLength:options:", 1, 256);
  *((_QWORD *)v5 + 33) = 0x100000008;
  *((_DWORD *)v5 + 68) = 3;
  *((_DWORD *)v5 + 70) = 1;
  objc_msgSend(a3, "supportsFamily:", 1001);
  v7 = MTLGetEnvDefault();
  *((_DWORD *)v5 + 69) = v7 != 0;
  v8 = 120403314;
  if (v7)
    v8 = 119800958;
  *(_QWORD *)(v5 + 284) = v8 | *(_QWORD *)(v5 + 284) & 0xFFFFFFFFE8000200;
  v9 = objc_msgSend(a3, "supportsArgumentBuffersTier2");
  v10 = 0x1080000000;
  if (v9)
    v10 = 0x10A0000000;
  *(_QWORD *)(v5 + 284) = v10 | *(_QWORD *)(v5 + 284) & 0xFFFFFFEF5FFFFFFFLL;
  v11 = objc_msgSend(a3, "supportsRaytracing");
  v12 = 0x100000000;
  if (!v11)
    v12 = 0;
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFEFFFFFFFFLL | v12;
  v13 = objc_msgSend(a3, "supportsFunctionPointers");
  v14 = 0x400000000;
  if (!v13)
    v14 = 0;
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFBFFFFFFFFLL | v14;
  v5[292] &= ~1u;
  v15 = objc_msgSend((id)objc_msgSend(v5, "baseObject"), "supportsArgumentBuffersTier2");
  v16 = operator new(0x20uLL);
  *(_QWORD *)v16 = "Tier1";
  v16[2] = 0;
  *((_QWORD *)v16 + 2) = "Tier2";
  v16[6] = 1;
  v17 = getenv("MTL_SHADER_VALIDATION_MODE");
  if (v17)
  {
    v18 = v17;
    for (i = 0; i != 8; i += 4)
    {
      if (!strcmp(v18, *(const char **)&v16[i]))
      {
        v15 = v16[i + 2];
        goto LABEL_22;
      }
    }
    v20 = (FILE **)MEMORY[0x24BDAC8D8];
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Invalid option for %s, valid options are:\n", "MTL_SHADER_VALIDATION_MODE");
    for (j = 0; j != 8; j += 4)
      fprintf(*v20, "\t%s\n", *(const char **)&v16[j]);
  }
LABEL_22:
  operator delete(v16);
  if (v15 == 1)
  {
    v23 = *(_QWORD *)(v5 + 284);
    *((_DWORD *)v5 + 69) = 1;
    v22 = v23 & 0xFFFFFFF9FF3ECCEBLL | 0x600C10210;
    goto LABEL_26;
  }
  if (!v15)
  {
    v22 = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFF3FEFFFLL | 0x1000;
LABEL_26:
    *(_QWORD *)(v5 + 284) = v22;
  }
  v24 = objc_msgSend(v5, "supportsGlobalVariableRelocationCompute");
  v25 = 0x40000000;
  if (!v24)
    v25 = 0;
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFBFFFFFFFLL | v25;
  v5[292] &= ~4u;
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFFFFFFFDLL | (2 * (MTLGetEnvDefault() != 0));
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFFFFFBFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 10);
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFEFFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 24);
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFFDFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 21);
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFDFFFFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 33);
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFBFFFFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 34);
  v5[292] = v5[292] & 0xF7 | (8 * (MTLGetEnvDefault() != 0));
  v26 = operator new(0x30uLL);
  *(_QWORD *)v26 = "default";
  v26[2] = 0;
  *((_QWORD *)v26 + 2) = "none";
  v26[6] = 0;
  *((_QWORD *)v26 + 4) = "full";
  v26[10] = 1;
  v27 = getenv("MTL_SHADER_VALIDATION_COMPILER_INLINING");
  if (v27)
  {
    v28 = v27;
    v29 = 0;
    while (strcmp(v28, *(const char **)&v26[v29]))
    {
      v29 += 4;
      if (v29 == 12)
      {
        v30 = (FILE **)MEMORY[0x24BDAC8D8];
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Invalid option for %s, valid options are:\n", "MTL_SHADER_VALIDATION_COMPILER_INLINING");
        for (k = 0; k != 12; k += 4)
          fprintf(*v30, "\t%s\n", *(const char **)&v26[k]);
        goto LABEL_35;
      }
    }
    v57 = v26[v29 + 2];
    operator delete(v26);
    if (!v57)
      goto LABEL_36;
    if (v57 == 1)
    {
      v32 = *(_QWORD *)(v5 + 284) | 0x10;
      goto LABEL_37;
    }
  }
  else
  {
LABEL_35:
    operator delete(v26);
LABEL_36:
    v32 = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFFFFFFEFLL;
LABEL_37:
    *(_QWORD *)(v5 + 284) = v32;
  }
  v33 = operator new(0x20uLL);
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)(v33 + 8);
  __p.__r_.__value_.__r.__words[2] = (std::string::size_type)(v33 + 8);
  *(_QWORD *)v33 = "zerofill";
  v33[2] = 1;
  *((_QWORD *)v33 + 2) = "allow";
  v33[6] = 0;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v33;
  MTLGetEnvCase<MTLBoundsCheck::FailMode>("MTL_SHADER_VALIDATION_FAIL_MODE", (_DWORD *)v5 + 69, (const char ***)&__p);
  if (__p.__r_.__value_.__r.__words[0])
  {
    __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  v5[292] |= 2u;
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFFFFFDFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 9);
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFFFFFFEFLL | (16 * (MTLGetEnvDefault() != 0));
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFFFFFFFBLL | (4 * (MTLGetEnvDefault() != 0));
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFFFFFFDFLL | (32 * (MTLGetEnvDefault() != 0));
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFFFFFFBFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 6);
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFFFFFEFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 8);
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFFFFF7FFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 11);
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFFFFFF7FLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 7);
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFFFFEFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 12);
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFFFF7FFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 15);
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFFFFDFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 13);
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFFFBFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 18);
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFFBFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 22);
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFF7FFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 23);
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFDFFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 25);
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFFBFFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 26);
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFEFFFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 28);
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFFBFFFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 30);
  v5[292] = v5[292] & 0xFE | (MTLGetEnvDefault() != 0);
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFF7FFFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 31);
  v5[292] = v5[292] & 0xFD | (2 * (MTLGetEnvDefault() != 0));
  *(_QWORD *)(v5 + 284) = *(_QWORD *)(v5 + 284) & 0xFFFFFFFEFFFFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 32);
  v5[292] = v5[292] & 0xFB | (4 * (MTLGetEnvDefault() != 0));
  *((_DWORD *)v5 + 70) = MTLGetEnvDefault();
  v34 = getenv("MTL_SHADER_VALIDATION_ENABLE_PIPELINES");
  if (v34)
  {
    v35 = v34;
    if (MTLLegacySVLog(void)::onceToken != -1)
      dispatch_once(&MTLLegacySVLog(void)::onceToken, &__block_literal_global_1);
    v36 = MTLLegacySVLog(void)::logObject;
    if (os_log_type_enabled((os_log_t)MTLLegacySVLog(void)::logObject, OS_LOG_TYPE_DEBUG))
      -[MTLGPUDebugDevice initWithBaseObject:parent:].cold.2(v36, v37, v38, v39, v40, v41, v42, v43);
    std::string::basic_string[abi:ne180100]<0>(&__p, v35);
    *((_QWORD *)v5 + 82) = MTLLegacySVParsePerPSOList(&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  v44 = getenv("MTL_SHADER_VALIDATION_DISABLE_PIPELINES");
  if (v44)
  {
    v45 = v44;
    if (MTLLegacySVLog(void)::onceToken != -1)
      dispatch_once(&MTLLegacySVLog(void)::onceToken, &__block_literal_global_1);
    v46 = MTLLegacySVLog(void)::logObject;
    if (os_log_type_enabled((os_log_t)MTLLegacySVLog(void)::logObject, OS_LOG_TYPE_DEBUG))
      -[MTLGPUDebugDevice initWithBaseObject:parent:].cold.1(v46, v47, v48, v49, v50, v51, v52, v53);
    std::string::basic_string[abi:ne180100]<0>(&__p, v45);
    *((_QWORD *)v5 + 83) = MTLLegacySVParsePerPSOList(&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  *((_QWORD *)v5 + 84) = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", v5 + 264, 28, 0);
  v54 = (void *)objc_msgSend(v5, "newModifyPluginData:", objc_msgSend(*((id *)v5 + 2), "pluginData"));
  objc_msgSend(*((id *)v5 + 2), "setPluginData:", v54);

  if ((*(_QWORD *)(v5 + 284) & 0x810000) == 0x10000)
  {
    *((_QWORD *)v5 + 85) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v55 = objc_alloc_init(MEMORY[0x24BDDD4C0]);
    objc_msgSend(v55, "setDataType:", 60);
    objc_msgSend(v55, "setArrayLength:", 31);
    objc_msgSend(v55, "setIndex:", 0);
    objc_msgSend(v55, "setAccess:", 1);
    objc_msgSend(*((id *)v5 + 85), "addObject:", v55);

  }
  if (MTLGetEnvDefault())
  {
    instrumentationHeapInit((MTLLegacySVDevice *)v5);
    indirectCommandBufferPipelineInit((MTLLegacySVDevice *)v5);
  }
  return (MTLLegacySVDevice *)v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;

  if (MTLLegacySVLog(void)::onceToken != -1)
    dispatch_once(&MTLLegacySVLog(void)::onceToken, &__block_literal_global_1);
  v3 = MTLLegacySVLog(void)::logObject;
  if (os_log_type_enabled((os_log_t)MTLLegacySVLog(void)::logObject, OS_LOG_TYPE_DEBUG))
    -[MTLGPUDebugDevice dealloc].cold.1((uint64_t)self, v3);

  v4.receiver = self;
  v4.super_class = (Class)MTLLegacySVDevice;
  -[MTLToolsDevice dealloc](&v4, sel_dealloc);
}

- (id)newStageBufferArgumentEncoder
{
  return (id)objc_msgSend(*((id *)self + 2), "newArgumentEncoderWithArguments:", *((_QWORD *)self + 85));
}

- (id)newStageArgumentBuffer
{
  return (id)objc_msgSend(*((id *)self + 2), "newBufferWithLength:options:", 0x4000, 256);
}

- (id)newInternalBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend(*((id *)self + 2), "newBufferWithLength:options:", a3, a4);
}

- (void)modifyFunctionDescriptor:(id)a3
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "pipelineOptions");
  -[MTLLegacySVDevice _modifyCompileOptions:](self, "_modifyCompileOptions:", &v5);
  objc_msgSend(a3, "setPipelineOptions:", v5 & 0xFFFFFFFFFFFEFFFCLL);
}

- (void)_modifyCompileOptions:(unint64_t *)a3
{
  unint64_t v3;

  v3 = *a3;
  *a3 |= 0x1800003uLL;
  if ((*((_BYTE *)self + 284) & 0x10) != 0)
    *a3 = v3 | 0x11800003;
}

- (id)newModifyPluginData:(id)a3
{
  id v4;
  void *v5;

  if (a3)
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", a3);
  else
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = v4;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *((_QWORD *)self + 84), CFSTR("MTLBoundsCheck::Options"));
  return v5;
}

- (void)_prepareBinaryLinkedFunctions:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_msgSend(a3, "binaryFunctions", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "prepareForBinaryFunctionUsage");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)_prepareInsertLibraries:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(a3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "prepareForUsage");
      }
      while (v5 != v7);
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (id)_modifyRenderPipelineDescriptor:(id)a3 options:(unint64_t *)a4
{
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  objc_msgSend(a3, "setForceSoftwareVertexFetch:", 1);
  objc_msgSend((id)objc_msgSend(a3, "vertexFunction"), "prepareForRenderPipelineUsage");
  objc_msgSend((id)objc_msgSend(a3, "fragmentFunction"), "prepareForRenderPipelineUsage");
  -[MTLLegacySVDevice _prepareBinaryLinkedFunctions:](self, "_prepareBinaryLinkedFunctions:", objc_msgSend(a3, "vertexLinkedFunctions"));
  -[MTLLegacySVDevice _prepareBinaryLinkedFunctions:](self, "_prepareBinaryLinkedFunctions:", objc_msgSend(a3, "fragmentLinkedFunctions"));
  objc_msgSend((id)objc_msgSend(a3, "meshFunction"), "prepareForRenderPipelineUsage");
  objc_msgSend((id)objc_msgSend(a3, "objectFunction"), "prepareForRenderPipelineUsage");
  -[MTLLegacySVDevice _prepareBinaryLinkedFunctions:](self, "_prepareBinaryLinkedFunctions:", objc_msgSend(a3, "meshLinkedFunctions"));
  v7 = (void *)MEMORY[0x22E309364](-[MTLLegacySVDevice _prepareBinaryLinkedFunctions:](self, "_prepareBinaryLinkedFunctions:", objc_msgSend(a3, "objectLinkedFunctions")));
  v8 = -[MTLLegacySVDevice loadDynamicLibrariesForFunction:insertLibraries:error:](self, "loadDynamicLibrariesForFunction:insertLibraries:error:", objc_msgSend(a3, "vertexFunction"), objc_msgSend(a3, "vertexPreloadedLibraries"), &v20);
  v9 = v20;
  if (v20)
    goto LABEL_5;
  v10 = v8;
  objc_msgSend(a3, "setVertexPreloadedLibraries:", v8);
  -[MTLLegacySVDevice _prepareInsertLibraries:](self, "_prepareInsertLibraries:", v10);
  v11 = -[MTLLegacySVDevice loadDynamicLibrariesForFunction:insertLibraries:error:](self, "loadDynamicLibrariesForFunction:insertLibraries:error:", objc_msgSend(a3, "fragmentFunction"), objc_msgSend(a3, "fragmentPreloadedLibraries"), &v20);
  v9 = v20;
  if (v20)
    goto LABEL_5;
  v12 = v11;
  objc_msgSend(a3, "setFragmentPreloadedLibraries:", v11);
  -[MTLLegacySVDevice _prepareInsertLibraries:](self, "_prepareInsertLibraries:", v12);
  v13 = -[MTLLegacySVDevice loadDynamicLibrariesForFunction:insertLibraries:error:](self, "loadDynamicLibrariesForFunction:insertLibraries:error:", objc_msgSend(a3, "meshFunction"), objc_msgSend(a3, "meshPreloadedLibraries"), &v20);
  v9 = v20;
  if (v20
    || (v14 = v13,
        objc_msgSend(a3, "setMeshPreloadedLibraries:", v13),
        -[MTLLegacySVDevice _prepareInsertLibraries:](self, "_prepareInsertLibraries:", v14),
        v15 = -[MTLLegacySVDevice loadDynamicLibrariesForFunction:insertLibraries:error:](self, "loadDynamicLibrariesForFunction:insertLibraries:error:", objc_msgSend(a3, "objectFunction"), objc_msgSend(a3, "objectPreloadedLibraries"), &v20), (v9 = v20) != 0))
  {
LABEL_5:
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v17 = v15;
    objc_msgSend(a3, "setObjectPreloadedLibraries:", v15);
    -[MTLLegacySVDevice _prepareInsertLibraries:](self, "_prepareInsertLibraries:", v17);
    objc_autoreleasePoolPop(v7);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 20);
    v19 = objc_msgSend(v18, "bytes");
    *(_BYTE *)v19 = objc_msgSend(a3, "isAlphaToCoverageEnabled");
    *(_DWORD *)(v19 + 4) = objc_msgSend(a3, "maxVertexCallStackDepth");
    *(_DWORD *)(v19 + 8) = objc_msgSend(a3, "maxFragmentCallStackDepth");
    *(_DWORD *)(v19 + 12) = objc_msgSend(a3, "maxMeshCallStackDepth");
    *(_DWORD *)(v19 + 16) = objc_msgSend(a3, "maxObjectCallStackDepth");
    v21 = CFSTR("MTLBoundsCheck::RenderPipelineData");
    v22[0] = v18;
    objc_msgSend(a3, "setPluginData:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1));

    objc_msgSend(a3, "setGpuCompilerSPIOptions:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", -[MTLLegacySVDevice setGpuCompilerSPIOptionShaderValidation:options:](self, "setGpuCompilerSPIOptionShaderValidation:options:", objc_msgSend(a3, "gpuCompilerSPIOptions"), *a4)));
    return v20;
  }
  return v9;
}

- (id)unwrapAndModifyRenderPipelineDescriptor:(id *)a3 options:(unint64_t *)a4
{
  *a3 = (id)objc_msgSend(*a3, "copy");
  -[MTLLegacySVDevice _modifyCompileOptions:](self, "_modifyCompileOptions:", a4);
  -[MTLLegacySVDevice _modifyRenderPipelineDescriptor:options:](self, "_modifyRenderPipelineDescriptor:options:", *a3, a4);
  return -[MTLToolsDevice unwrapMTLRenderPipelineDescriptor:](self, "unwrapMTLRenderPipelineDescriptor:", *a3);
}

- (id)setGpuCompilerSPIOptionShaderValidation:(id)a3 options:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(a3);
        objc_msgSend(v6, "setObject:forKey:", objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10)), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  if ((a4 & 0x800000000) != 0)
  {
    v11 = CFSTR("enable-shader-validation");
    goto LABEL_12;
  }
  if ((a4 & 0x1000000000) != 0)
  {
    v11 = CFSTR("disable-shader-validation");
LABEL_12:
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCEF8], "null"), v11);
  }
  return v6;
}

- (id)_modifyComputePipelineDescriptor:(id)a3 options:(unint64_t *)a4
{
  id v7;
  void *v8;
  void *v9;
  _DWORD *v10;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  objc_msgSend((id)objc_msgSend(a3, "computeFunction"), "prepareForComputePipelineUsage");
  v7 = -[MTLLegacySVDevice loadDynamicLibrariesForComputeDescriptor:error:](self, "loadDynamicLibrariesForComputeDescriptor:error:", a3, &v12);
  v8 = v7;
  if (v12)
  {

  }
  else
  {
    objc_msgSend(a3, "setPreloadedLibraries:", v7);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 4);
    v10 = (_DWORD *)objc_msgSend(v9, "bytes");
    *v10 = objc_msgSend(a3, "maxCallStackDepth");
    v13 = CFSTR("MTLBoundsCheck::ComputePipelineData");
    v14[0] = v9;
    objc_msgSend(a3, "setPluginData:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1));

    -[MTLLegacySVDevice _prepareInsertLibraries:](self, "_prepareInsertLibraries:", objc_msgSend(a3, "preloadedLibraries"));
    -[MTLLegacySVDevice _prepareBinaryLinkedFunctions:](self, "_prepareBinaryLinkedFunctions:", objc_msgSend(a3, "linkedFunctions"));
    objc_msgSend(a3, "setGpuCompilerSPIOptions:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", -[MTLLegacySVDevice setGpuCompilerSPIOptionShaderValidation:options:](self, "setGpuCompilerSPIOptionShaderValidation:options:", objc_msgSend(a3, "gpuCompilerSPIOptions"), *a4)));
  }
  return v12;
}

- (id)unwrapAndModifyComputePipelineDescriptor:(id *)a3 options:(unint64_t *)a4
{
  id v7;

  v7 = (id)objc_msgSend(*a3, "copy");
  *a3 = v7;
  -[MTLLegacySVDevice _modifyComputePipelineDescriptor:options:](self, "_modifyComputePipelineDescriptor:options:", v7, a4);
  -[MTLLegacySVDevice _modifyCompileOptions:](self, "_modifyCompileOptions:", a4);
  return -[MTLToolsDevice unwrapMTLComputePipelineDescriptor:](self, "unwrapMTLComputePipelineDescriptor:", *a3);
}

- (id)_modifyTilePipelineDescriptor:(id)a3 options:(unint64_t *)a4
{
  id v7;
  void *v8;
  void *v9;
  _DWORD *v10;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  objc_msgSend((id)objc_msgSend(a3, "tileFunction"), "prepareForRenderPipelineUsage");
  -[MTLLegacySVDevice _prepareBinaryLinkedFunctions:](self, "_prepareBinaryLinkedFunctions:", objc_msgSend(a3, "linkedFunctions"));
  v7 = -[MTLLegacySVDevice loadDynamicLibrariesForFunction:insertLibraries:error:](self, "loadDynamicLibrariesForFunction:insertLibraries:error:", objc_msgSend(a3, "tileFunction"), objc_msgSend(a3, "preloadedLibraries"), &v12);
  v8 = v7;
  if (v12)
  {

  }
  else
  {
    objc_msgSend(a3, "setPreloadedLibraries:", v7);

    -[MTLLegacySVDevice _prepareInsertLibraries:](self, "_prepareInsertLibraries:", objc_msgSend(a3, "preloadedLibraries"));
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 4);
    v10 = (_DWORD *)objc_msgSend(v9, "bytes");
    *v10 = objc_msgSend(a3, "maxCallStackDepth");
    v13 = CFSTR("MTLBoundsCheck::ComputePipelineData");
    v14[0] = v9;
    objc_msgSend(a3, "setPluginData:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1));

    objc_msgSend(a3, "setGpuCompilerSPIOptions:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", -[MTLLegacySVDevice setGpuCompilerSPIOptionShaderValidation:options:](self, "setGpuCompilerSPIOptionShaderValidation:options:", objc_msgSend(a3, "gpuCompilerSPIOptions"), *a4)));
  }
  return v12;
}

- (id)unwrapAndModifyTileRenderPipelineDescriptor:(id *)a3 options:(unint64_t *)a4
{
  id v7;

  v7 = (id)objc_msgSend(*a3, "copy");
  *a3 = v7;
  -[MTLLegacySVDevice _modifyTilePipelineDescriptor:options:](self, "_modifyTilePipelineDescriptor:options:", v7, a4);
  -[MTLLegacySVDevice _modifyCompileOptions:](self, "_modifyCompileOptions:", a4);
  return -[MTLToolsDevice unwrapMTLTileRenderPipelineDescriptor:](self, "unwrapMTLTileRenderPipelineDescriptor:", *a3);
}

- (void)_modifyMeshRenderPipelineDescriptor:(id)a3 options:(unint64_t *)a4
{
  void *v7;
  _BYTE *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 20);
  v8 = (_BYTE *)objc_msgSend(v7, "bytes");
  *v8 = objc_msgSend(a3, "isAlphaToCoverageEnabled");
  v9 = CFSTR("MTLBoundsCheck::RenderPipelineData");
  v10[0] = v7;
  objc_msgSend(a3, "setPluginData:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));

  objc_msgSend(a3, "setGpuCompilerSPIOptions:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", -[MTLLegacySVDevice setGpuCompilerSPIOptionShaderValidation:options:](self, "setGpuCompilerSPIOptionShaderValidation:options:", objc_msgSend(a3, "gpuCompilerSPIOptions"), *a4)));
}

- (id)unwrapAndModifyMeshRenderPipelineDescriptor:(id)a3 options:(unint64_t *)a4
{
  id v6;

  v6 = (id)objc_msgSend(a3, "copy");
  -[MTLLegacySVDevice _modifyCompileOptions:](self, "_modifyCompileOptions:", a4);
  -[MTLLegacySVDevice _modifyMeshRenderPipelineDescriptor:options:](self, "_modifyMeshRenderPipelineDescriptor:options:", v6, a4);
  return -[MTLToolsDevice unwrapMTLMeshRenderPipelineDescriptor:](self, "unwrapMTLMeshRenderPipelineDescriptor:", v6);
}

- (void)onRenderPipelineCreated:(id)a3
{
  LogInstrumentationFailures((MTLLegacySVImageData *)objc_msgSend(a3, "vertexFunctionData"), (MTLDebugInstrumentationData *)objc_msgSend(a3, "vertexDebugInstrumentationData"));
  LogInstrumentationFailures((MTLLegacySVImageData *)objc_msgSend(a3, "fragmentFunctionData"), (MTLDebugInstrumentationData *)objc_msgSend(a3, "fragmentDebugInstrumentationData"));
  LogInstrumentationFailures((MTLLegacySVImageData *)objc_msgSend(a3, "tileFunctionData"), (MTLDebugInstrumentationData *)objc_msgSend(a3, "tileDebugInstrumentationData"));
}

- (void)onComputePipelineCreated:(id)a3
{
  LogInstrumentationFailures((MTLLegacySVImageData *)objc_msgSend(a3, "kernelFunctionData"), (MTLDebugInstrumentationData *)objc_msgSend(a3, "debugInstrumentationData"));
}

- (id)newCommandQueueWithDescriptor:(id)a3
{
  void *v5;
  MTLLegacySVCommandQueue *v6;

  instrumentationHeapInit(self);
  v5 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCommandQueueWithDescriptor:", a3);
  v6 = -[MTLLegacySVCommandQueue initWithCommandQueue:device:]([MTLLegacySVCommandQueue alloc], "initWithCommandQueue:device:", v5, self);

  return v6;
}

- (id)newCommandQueue
{
  return -[MTLLegacySVDevice newCommandQueueWithDescriptor:](self, "newCommandQueueWithDescriptor:", objc_msgSend(MEMORY[0x24BDDD510], "commandQueueDescriptor"));
}

- (id)newCommandQueueWithMaxCommandBufferCount:(unint64_t)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDDD510], "commandQueueDescriptor");
  objc_msgSend(v5, "setMaxCommandBufferCount:", a3);
  return -[MTLLegacySVDevice newCommandQueueWithDescriptor:](self, "newCommandQueueWithDescriptor:", v5);
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  return -[MTLLegacySVDevice newRenderPipelineStateWithDescriptor:options:reflection:error:](self, "newRenderPipelineStateWithDescriptor:options:reflection:error:", a3, 0, 0, a4);
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  int v8;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  MTLLegacySVRenderPipelineState *v19;
  MTLLegacySVRenderPipelineState *v20;
  id v21;
  uint64_t v23;
  unint64_t v24;
  id v25;

  v8 = a4;
  v24 = a4;
  v25 = a3;
  instrumentationHeapInit(self);
  v11 = (void *)MEMORY[0x22E309364]();
  v12 = (void *)objc_msgSend(a3, "vertexFunction");
  v13 = (void *)objc_msgSend(a3, "fragmentFunction");
  v14 = objc_msgSend(a3, "label");
  v15 = objc_msgSend(a3, "shaderValidation");
  objc_msgSend(a3, "shaderValidationState");
  MTLLegacySVSetValidationChecksOptions((uint64_t)self, v12, v13, 0, v14, v15, &v24);
  v16 = -[MTLLegacySVDevice unwrapAndModifyRenderPipelineDescriptor:options:](self, "unwrapAndModifyRenderPipelineDescriptor:options:", &v25, &v24);
  v23 = 0;
  v17 = (void *)objc_msgSend(*((id *)self + 2), "newRenderPipelineStateWithDescriptor:options:reflection:error:", v16, v24, &v23, a6);
  if (a6 && *a6)
    v18 = *a6;
  if (v17)
  {
    v19 = [MTLLegacySVRenderPipelineState alloc];
    v20 = -[MTLLegacySVRenderPipelineState initWithRenderPipelineState:descriptor:unwrappedDescriptor:reflection:device:pipelineOptions:](v19, "initWithRenderPipelineState:descriptor:unwrappedDescriptor:reflection:device:pipelineOptions:", v17, v25, v16, v23, self, v24);
  }
  else
  {
    v20 = 0;
  }

  objc_autoreleasePoolPop(v11);
  if (a6 && *a6)
    v21 = *a6;
  if (v20)
  {
    if (a5 && (*(_QWORD *)&v8 & 0x40003) != 0)
    {
      *a5 = -[MTLLegacySVRenderPipelineState userReflection](v20, "userReflection");
    }
    else if ((*((_BYTE *)self + 292) & 1) == 0)
    {
      -[MTLLegacySVRenderPipelineState releaseReflection](v20, "releaseReflection");
    }
    -[MTLLegacySVDevice onRenderPipelineCreated:](self, "onRenderPipelineCreated:", v20);
  }
  return v20;
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __76__MTLLegacySVDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke;
  v4[3] = &unk_24F7945F0;
  v4[4] = a4;
  -[MTLLegacySVDevice newRenderPipelineStateWithDescriptor:options:completionHandler:](self, "newRenderPipelineStateWithDescriptor:options:completionHandler:", a3, 0, v4);
}

uint64_t __76__MTLLegacySVDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  int v6;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  id v19;

  v6 = a4;
  v18 = a4;
  v19 = a3;
  instrumentationHeapInit(self);
  v9 = (*(_QWORD *)&v6 & 0x40003) != 0;
  v10 = (void *)MEMORY[0x22E309364]();
  v11 = (void *)objc_msgSend(a3, "vertexFunction");
  v12 = (void *)objc_msgSend(a3, "fragmentFunction");
  v13 = objc_msgSend(a3, "label");
  v14 = objc_msgSend(a3, "shaderValidation");
  objc_msgSend(a3, "shaderValidationState");
  MTLLegacySVSetValidationChecksOptions((uint64_t)self, v11, v12, 0, v13, v14, &v18);
  v15 = -[MTLLegacySVDevice unwrapAndModifyRenderPipelineDescriptor:options:](self, "unwrapAndModifyRenderPipelineDescriptor:options:", &v19, &v18);
  v16 = (void *)*((_QWORD *)self + 2);
  LOBYTE(v17) = v9;
  objc_msgSend(v16, "newRenderPipelineStateWithDescriptor:options:completionHandler:", MEMORY[0x24BDAC760], 3221225472, __84__MTLLegacySVDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke, &unk_24F794640, v19, v15, self, a5, v18, v17);
  objc_autoreleasePoolPop(v10);
}

uint64_t __84__MTLLegacySVDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MTLLegacySVRenderPipelineState *v4;

  if (a2)
    v4 = -[MTLLegacySVRenderPipelineState initWithRenderPipelineState:descriptor:unwrappedDescriptor:reflection:device:pipelineOptions:]([MTLLegacySVRenderPipelineState alloc], "initWithRenderPipelineState:descriptor:unwrappedDescriptor:reflection:device:pipelineOptions:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  else
    v4 = 0;
  if (*(_BYTE *)(a1 + 72))
  {
    -[MTLLegacySVRenderPipelineState userReflection](v4, "userReflection");
  }
  else if ((*(_BYTE *)(*(_QWORD *)(a1 + 48) + 292) & 1) == 0)
  {
    -[MTLLegacySVRenderPipelineState releaseReflection](v4, "releaseReflection");
  }
  objc_msgSend(*(id *)(a1 + 48), "onRenderPipelineCreated:", v4);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  int v8;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  MTLLegacySVRenderPipelineState *v17;
  MTLLegacySVRenderPipelineState *v18;
  uint64_t v20;
  unint64_t v21;
  id v22;

  v8 = a4;
  v21 = a4;
  v22 = a3;
  instrumentationHeapInit(self);
  v11 = (void *)objc_msgSend(a3, "tileFunction");
  v12 = objc_msgSend(a3, "label");
  v13 = objc_msgSend(a3, "shaderValidation");
  objc_msgSend(a3, "shaderValidationState");
  MTLLegacySVSetValidationChecksOptions((uint64_t)self, v11, 0, 0, v12, v13, &v21);
  v14 = -[MTLLegacySVDevice unwrapAndModifyTileRenderPipelineDescriptor:options:](self, "unwrapAndModifyTileRenderPipelineDescriptor:options:", &v22, &v21);
  v20 = 0;
  v15 = objc_msgSend(*((id *)self + 2), "newRenderPipelineStateWithTileDescriptor:options:reflection:error:", v14, v21, &v20, a6);
  if (!v15)
    return 0;
  v16 = (void *)v15;
  v17 = [MTLLegacySVRenderPipelineState alloc];
  v18 = -[MTLLegacySVRenderPipelineState initWithRenderPipelineState:tileDescriptor:reflection:device:pipelineOptions:](v17, "initWithRenderPipelineState:tileDescriptor:reflection:device:pipelineOptions:", v16, v22, v20, self, v21);

  if (a5 && (*(_QWORD *)&v8 & 0x40003) != 0)
  {
    *a5 = -[MTLLegacySVRenderPipelineState userReflection](v18, "userReflection");
  }
  else if ((*((_BYTE *)self + 292) & 1) == 0)
  {
    -[MTLLegacySVRenderPipelineState releaseReflection](v18, "releaseReflection");
  }
  -[MTLLegacySVDevice onRenderPipelineCreated:](self, "onRenderPipelineCreated:", v18);
  return v18;
}

- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 completionHandler:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __80__MTLLegacySVDevice_newRenderPipelineStateWithTileDescriptor_completionHandler___block_invoke;
  v4[3] = &unk_24F7945F0;
  v4[4] = a4;
  -[MTLLegacySVDevice newRenderPipelineStateWithTileDescriptor:options:completionHandler:](self, "newRenderPipelineStateWithTileDescriptor:options:completionHandler:", a3, 0, v4);
}

uint64_t __80__MTLLegacySVDevice_newRenderPipelineStateWithTileDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 error:(id *)a4
{
  return -[MTLLegacySVDevice newRenderPipelineStateWithTileDescriptor:options:reflection:error:](self, "newRenderPipelineStateWithTileDescriptor:options:reflection:error:", a3, 0, 0, a4);
}

- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;

  v11 = a3;
  v10 = a4;
  instrumentationHeapInit(self);
  v7 = (void *)objc_msgSend(a3, "tileFunction");
  v8 = objc_msgSend(a3, "label");
  v9 = objc_msgSend(a3, "shaderValidation");
  objc_msgSend(a3, "shaderValidationState");
  MTLLegacySVSetValidationChecksOptions((uint64_t)self, v7, 0, 0, v8, v9, &v10);
  objc_msgSend(*((id *)self + 2), "newRenderPipelineStateWithTileDescriptor:options:completionHandler:", -[MTLLegacySVDevice unwrapAndModifyTileRenderPipelineDescriptor:options:](self, "unwrapAndModifyTileRenderPipelineDescriptor:options:", &v11, &v10));
}

void __88__MTLLegacySVDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MTLLegacySVRenderPipelineState *v4;
  MTLLegacySVRenderPipelineState *v5;

  if (a2)
    v4 = -[MTLLegacySVRenderPipelineState initWithRenderPipelineState:tileDescriptor:reflection:device:pipelineOptions:]([MTLLegacySVRenderPipelineState alloc], "initWithRenderPipelineState:tileDescriptor:reflection:device:pipelineOptions:", a2, *(_QWORD *)(a1 + 32), a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  else
    v4 = 0;
  v5 = v4;
  if (*(_BYTE *)(a1 + 64))
  {
    -[MTLLegacySVRenderPipelineState userReflection](v4, "userReflection");
  }
  else if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 292) & 1) == 0)
  {
    -[MTLLegacySVRenderPipelineState releaseReflection](v4, "releaseReflection");
  }
  objc_msgSend(*(id *)(a1 + 40), "onRenderPipelineCreated:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  int v8;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  MTLLegacySVRenderPipelineState *v19;
  MTLLegacySVRenderPipelineState *v20;
  uint64_t v22;
  unint64_t v23;

  v8 = a4;
  v23 = a4;
  instrumentationHeapInit(self);
  v11 = (void *)objc_msgSend(a3, "meshFunction");
  v12 = (void *)objc_msgSend(a3, "fragmentFunction");
  v13 = (void *)objc_msgSend(a3, "objectFunction");
  v14 = objc_msgSend(a3, "label");
  v15 = objc_msgSend(a3, "shaderValidation");
  objc_msgSend(a3, "shaderValidationState");
  MTLLegacySVSetValidationChecksOptions((uint64_t)self, v11, v12, v13, v14, v15, &v23);
  v16 = -[MTLLegacySVDevice unwrapAndModifyMeshRenderPipelineDescriptor:options:](self, "unwrapAndModifyMeshRenderPipelineDescriptor:options:", a3, &v23);
  v22 = 0;
  v17 = objc_msgSend(*((id *)self + 2), "newRenderPipelineStateWithMeshDescriptor:options:reflection:error:", v16, v23, &v22, a6);
  if (!v17)
    return 0;
  v18 = (void *)v17;
  v19 = [MTLLegacySVRenderPipelineState alloc];
  v20 = -[MTLLegacySVRenderPipelineState initWithRenderPipelineState:meshDescriptor:unwrappedDescriptor:reflection:device:pipelineOptions:](v19, "initWithRenderPipelineState:meshDescriptor:unwrappedDescriptor:reflection:device:pipelineOptions:", v18, a3, v16, v22, self, v23);

  if (a5 && (*(_QWORD *)&v8 & 0x40003) != 0)
  {
    *a5 = -[MTLLegacySVRenderPipelineState userReflection](v20, "userReflection");
  }
  else if ((*((_BYTE *)self + 292) & 1) == 0)
  {
    -[MTLLegacySVRenderPipelineState releaseReflection](v20, "releaseReflection");
  }
  -[MTLLegacySVDevice onRenderPipelineCreated:](self, "onRenderPipelineCreated:", v20);
  return v20;
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 completionHandler:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __80__MTLLegacySVDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler___block_invoke;
  v4[3] = &unk_24F7945F0;
  v4[4] = a4;
  -[MTLLegacySVDevice newRenderPipelineStateWithMeshDescriptor:options:completionHandler:](self, "newRenderPipelineStateWithMeshDescriptor:options:completionHandler:", a3, 0, v4);
}

uint64_t __80__MTLLegacySVDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 error:(id *)a4
{
  return -[MTLLegacySVDevice newRenderPipelineStateWithMeshDescriptor:options:reflection:error:](self, "newRenderPipelineStateWithMeshDescriptor:options:reflection:error:", a3, 0, 0, a4);
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v12 = a4;
  instrumentationHeapInit(self);
  v7 = (void *)objc_msgSend(a3, "meshFunction");
  v8 = (void *)objc_msgSend(a3, "fragmentFunction");
  v9 = (void *)objc_msgSend(a3, "objectFunction");
  v10 = objc_msgSend(a3, "label");
  v11 = objc_msgSend(a3, "shaderValidation");
  objc_msgSend(a3, "shaderValidationState");
  MTLLegacySVSetValidationChecksOptions((uint64_t)self, v7, v8, v9, v10, v11, &v12);
  -[MTLLegacySVDevice unwrapAndModifyMeshRenderPipelineDescriptor:options:](self, "unwrapAndModifyMeshRenderPipelineDescriptor:options:", a3, &v12);
  objc_msgSend(*((id *)self + 2), "newRenderPipelineStateWithMeshDescriptor:options:completionHandler:");
}

void __88__MTLLegacySVDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MTLLegacySVRenderPipelineState *v4;
  MTLLegacySVRenderPipelineState *v5;

  if (a2)
    v4 = -[MTLLegacySVRenderPipelineState initWithRenderPipelineState:meshDescriptor:unwrappedDescriptor:reflection:device:pipelineOptions:]([MTLLegacySVRenderPipelineState alloc], "initWithRenderPipelineState:meshDescriptor:unwrappedDescriptor:reflection:device:pipelineOptions:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  else
    v4 = 0;
  v5 = v4;
  if (*(_BYTE *)(a1 + 72))
  {
    -[MTLLegacySVRenderPipelineState userReflection](v4, "userReflection");
  }
  else if ((*(_BYTE *)(*(_QWORD *)(a1 + 48) + 292) & 1) == 0)
  {
    -[MTLLegacySVRenderPipelineState releaseReflection](v4, "releaseReflection");
  }
  objc_msgSend(*(id *)(a1 + 48), "onRenderPipelineCreated:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  return -[MTLLegacySVDevice newComputePipelineStateWithDescriptor:options:reflection:error:](self, "newComputePipelineStateWithDescriptor:options:reflection:error:", a3, 0, 0, a4);
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  int v8;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  MTLLegacySVComputePipelineState *v17;
  MTLLegacySVComputePipelineState *v18;
  uint64_t v20;
  unint64_t v21;
  id v22;

  v8 = a4;
  v21 = a4;
  v22 = a3;
  instrumentationHeapInit(self);
  v11 = (void *)objc_msgSend(a3, "computeFunction");
  v12 = objc_msgSend(a3, "label");
  v13 = objc_msgSend(a3, "shaderValidation");
  objc_msgSend(a3, "shaderValidationState");
  MTLLegacySVSetValidationChecksOptions((uint64_t)self, v11, 0, 0, v12, v13, &v21);
  v14 = -[MTLLegacySVDevice unwrapAndModifyComputePipelineDescriptor:options:](self, "unwrapAndModifyComputePipelineDescriptor:options:", &v22, &v21);
  v20 = 0;
  v15 = objc_msgSend(*((id *)self + 2), "newComputePipelineStateWithDescriptor:options:reflection:error:", v14, v21, &v20, a6);
  if (!v15)
    return 0;
  v16 = (void *)v15;
  v17 = [MTLLegacySVComputePipelineState alloc];
  v18 = -[MTLLegacySVComputePipelineState initWithComputePipelineState:descriptor:unwrappedDescriptor:reflection:device:pipelineOptions:](v17, "initWithComputePipelineState:descriptor:unwrappedDescriptor:reflection:device:pipelineOptions:", v16, v22, v14, v20, self, v21);

  if (a5 && (*(_QWORD *)&v8 & 0x40003) != 0)
  {
    *a5 = -[MTLLegacySVComputePipelineState userReflection](v18, "userReflection");
  }
  else if ((*((_BYTE *)self + 292) & 1) == 0)
  {
    -[MTLLegacySVComputePipelineState releaseReflection](v18, "releaseReflection");
  }
  -[MTLLegacySVDevice onComputePipelineCreated:](self, "onComputePipelineCreated:", v18);
  return v18;
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __77__MTLLegacySVDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke;
  v4[3] = &unk_24F794668;
  v4[4] = a4;
  -[MTLLegacySVDevice newComputePipelineStateWithDescriptor:options:completionHandler:](self, "newComputePipelineStateWithDescriptor:options:completionHandler:", a3, 0, v4);
}

uint64_t __77__MTLLegacySVDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  int v6;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  id v16;

  v6 = a4;
  v16 = a3;
  v15 = a4;
  instrumentationHeapInit(self);
  v9 = (*(_QWORD *)&v6 & 0x40003) != 0;
  v10 = (void *)objc_msgSend(a3, "computeFunction");
  v11 = objc_msgSend(a3, "label");
  v12 = objc_msgSend(a3, "shaderValidation");
  objc_msgSend(a3, "shaderValidationState");
  MTLLegacySVSetValidationChecksOptions((uint64_t)self, v10, 0, 0, v11, v12, &v15);
  v13 = -[MTLLegacySVDevice unwrapAndModifyComputePipelineDescriptor:options:](self, "unwrapAndModifyComputePipelineDescriptor:options:", &v16, &v15);
  LOBYTE(v14) = v9;
  objc_msgSend(*((id *)self + 2), "newComputePipelineStateWithDescriptor:options:completionHandler:", MEMORY[0x24BDAC760], 3221225472, __85__MTLLegacySVDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke, &unk_24F795388, v16, v13, self, a5, v15, v14);
}

void __85__MTLLegacySVDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MTLLegacySVComputePipelineState *v4;
  MTLLegacySVComputePipelineState *v5;

  if (a2)
    v4 = -[MTLLegacySVComputePipelineState initWithComputePipelineState:descriptor:unwrappedDescriptor:reflection:device:pipelineOptions:]([MTLLegacySVComputePipelineState alloc], "initWithComputePipelineState:descriptor:unwrappedDescriptor:reflection:device:pipelineOptions:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  else
    v4 = 0;
  v5 = v4;
  if (*(_BYTE *)(a1 + 72))
  {
    -[MTLLegacySVComputePipelineState userReflection](v4, "userReflection");
  }
  else if ((*(_BYTE *)(*(_QWORD *)(a1 + 48) + 292) & 1) == 0)
  {
    -[MTLLegacySVComputePipelineState releaseReflection](v4, "releaseReflection");
  }
  objc_msgSend(*(id *)(a1 + 48), "onComputePipelineCreated:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (id)newComputePipelineStateWithFunction:(id)a3 error:(id *)a4
{
  void *v7;
  id v8;

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setComputeFunction:", a3);
  v8 = -[MTLLegacySVDevice newComputePipelineStateWithDescriptor:error:](self, "newComputePipelineStateWithDescriptor:error:", v7, a4);

  return v8;
}

- (void)newComputePipelineStateWithFunction:(id)a3 completionHandler:(id)a4
{
  id v7;

  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "setComputeFunction:", a3);
  -[MTLLegacySVDevice newComputePipelineStateWithDescriptor:completionHandler:](self, "newComputePipelineStateWithDescriptor:completionHandler:", v7, a4);

}

- (void)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v9;

  v9 = (id)objc_opt_new();
  objc_msgSend(v9, "setComputeFunction:", a3);
  -[MTLLegacySVDevice newComputePipelineStateWithDescriptor:options:completionHandler:](self, "newComputePipelineStateWithDescriptor:options:completionHandler:", v9, a4, a5);

}

- (id)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  void *v11;
  id v12;

  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setComputeFunction:", a3);
  v12 = -[MTLLegacySVDevice newComputePipelineStateWithDescriptor:options:reflection:error:](self, "newComputePipelineStateWithDescriptor:options:reflection:error:", v11, a4, a5, a6);

  return v12;
}

- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCommandCount:(unint64_t)a4 options:(unint64_t)a5
{
  void *v10;
  void *v11;
  MTLLegacySVIndirectCommandBuffer *v12;

  if ((*((_BYTE *)self + 287) & 0x20) != 0)
  {
    indirectCommandBufferPipelineInit(self);
    v10 = (void *)objc_msgSend(a3, "copy");
    objc_msgSend(v10, "setMaxVertexBufferBindCount:", 31);
    objc_msgSend(v10, "setMaxFragmentBufferBindCount:", 31);
    objc_msgSend(v10, "setMaxKernelBufferBindCount:", 31);
    if ((objc_msgSend(v10, "inheritPipelineState") & 1) == 0)
      objc_msgSend(v10, "setInheritBuffers:", 0);
    if ((objc_msgSend(v10, "commandTypes") & 0x60) != 0)
      objc_msgSend(v10, "setInheritBuffers:", 0);
    v11 = (void *)objc_msgSend(*((id *)self + 2), "newIndirectCommandBufferWithDescriptor:maxCommandCount:options:", v10, a4, a5 & 0xFFFFFFFFFFFFFF0FLL);
    v12 = -[MTLLegacySVIndirectCommandBuffer initWithIndirectCommandBuffer:descriptor:maxCommandCount:resourceOptions:device:]([MTLLegacySVIndirectCommandBuffer alloc], "initWithIndirectCommandBuffer:descriptor:maxCommandCount:resourceOptions:device:", v11, a3, a4, a5, self);

    return v12;
  }
  else
  {
    MTLReportFailure();
    return 0;
  }
}

- (MTLRenderPipelineState)ICB_Inherit_PSO_VertexPipelineState
{
  return (MTLRenderPipelineState *)*((_QWORD *)self + 88);
}

- (MTLRenderPipelineState)ICB_Inherit_None_VertexPipelineState
{
  return (MTLRenderPipelineState *)*((_QWORD *)self + 89);
}

- (MTLRenderPipelineState)ICB_Inherit_Buffers_VertexPipelineState
{
  return (MTLRenderPipelineState *)*((_QWORD *)self + 90);
}

- (MTLDepthStencilState)ICB_DepthStencilState
{
  return (MTLDepthStencilState *)*((_QWORD *)self + 91);
}

- (MTLComputePipelineState)ICB_Inherit_PSO_ComputePipelineState
{
  return (MTLComputePipelineState *)*((_QWORD *)self + 92);
}

- (MTLComputePipelineState)ICB_Inherit_None_ComputePipelineState
{
  return (MTLComputePipelineState *)*((_QWORD *)self + 93);
}

- (MTLComputePipelineState)ICB_Inherit_Buffers_ComputePipelineState
{
  return (MTLComputePipelineState *)*((_QWORD *)self + 94);
}

- (MTLComputePipelineState)ICB_Inherit_Both_ComputePipelineState
{
  return (MTLComputePipelineState *)*((_QWORD *)self + 95);
}

- (id)newLibraryWithCIFiltersForComputePipeline:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  MTLLegacySVLibrary *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  instrumentationHeapInit(self);
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(a3);
        objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "baseObject"));
      }
      v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }
  v14 = objc_opt_respondsToSelector();
  v15 = (void *)*((_QWORD *)self + 2);
  if ((v14 & 1) != 0)
    v16 = (void *)objc_msgSend(v15, "newLibraryWithCIFiltersForComputePipeline:imageFilterFunctionInfo:error:", v9, a4, a5);
  else
    v16 = (void *)objc_msgSend(v15, "newLibraryWithCIFilters:imageFilterFunctionInfo:error:", v9, a4, a5);
  v17 = v16;
  if (!v16)
    return 0;
  objc_msgSend(v16, "setShaderValidationEnabled:", 1);
  v18 = -[MTLLegacySVLibrary initWithLibrary:device:]([MTLLegacySVLibrary alloc], "initWithLibrary:device:", v17, self);

  return v18;
}

- (id)newLibraryWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  MTLLegacySVLibrary *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  instrumentationHeapInit(self);
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(a3);
        objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13++), "baseObject"));
      }
      while (v11 != v13);
      v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }
  v14 = (void *)objc_msgSend(*((id *)self + 2), "newLibraryWithImageFilterFunctionsSPI:imageFilterFunctionInfo:error:", v9, a4, a5);
  if (!v14)
    return 0;
  v15 = v14;
  objc_msgSend(v14, "setShaderValidationEnabled:", 1);
  v16 = -[MTLLegacySVLibrary initWithLibrary:device:]([MTLLegacySVLibrary alloc], "initWithLibrary:device:", v15, self);

  return v16;
}

- (id)newLibraryWithCIFilters:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  MTLLegacySVLibrary *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  instrumentationHeapInit(self);
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(a3);
        objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13++), "baseObject"));
      }
      while (v11 != v13);
      v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }
  v14 = (void *)objc_msgSend(*((id *)self + 2), "newLibraryWithCIFilters:imageFilterFunctionInfo:error:", v9, a4, a5);
  if (!v14)
    return 0;
  v15 = v14;
  objc_msgSend(v14, "setShaderValidationEnabled:", 1);
  v16 = -[MTLLegacySVLibrary initWithLibrary:device:]([MTLLegacySVLibrary alloc], "initWithLibrary:device:", v15, self);

  return v16;
}

- (id)newDefaultLibrary
{
  id result;
  id v4;
  MTLLegacySVLibrary *v5;

  instrumentationHeapInit(self);
  result = (id)objc_msgSend(*((id *)self + 2), "newDefaultLibrary");
  if (result)
  {
    v4 = result;
    objc_msgSend(result, "setShaderValidationEnabled:", 1);
    v5 = -[MTLLegacySVLibrary initWithLibrary:device:]([MTLLegacySVLibrary alloc], "initWithLibrary:device:", v4, self);

    return v5;
  }
  return result;
}

- (id)newDefaultLibraryWithBundle:(id)a3 error:(id *)a4
{
  id result;
  id v8;
  MTLLegacySVLibrary *v9;

  instrumentationHeapInit(self);
  result = (id)objc_msgSend(*((id *)self + 2), "newDefaultLibraryWithBundle:error:", a3, a4);
  if (result)
  {
    v8 = result;
    objc_msgSend(result, "setShaderValidationEnabled:", 1);
    v9 = -[MTLLegacySVLibrary initWithLibrary:device:]([MTLLegacySVLibrary alloc], "initWithLibrary:device:", v8, self);

    return v9;
  }
  return result;
}

- (id)newLibraryWithDAG:(id)a3 functions:(id)a4 error:(id *)a5
{
  void *v8;
  uint64_t v9;
  unsigned int v10;
  void *v12;
  void *v13;
  MTLLegacySVLibrary *v14;

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", a4);
  if (objc_msgSend(v8, "count"))
  {
    v9 = 0;
    v10 = 1;
    do
    {
      objc_msgSend(v8, "setObject:atIndexedSubscript:", objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", v9), "baseObject"), v9);
      v9 = v10;
    }
    while (objc_msgSend(v8, "count") > (unint64_t)v10++);
  }
  instrumentationHeapInit(self);
  v12 = (void *)objc_msgSend(*((id *)self + 2), "newLibraryWithDAG:functions:error:", a3, v8, a5);
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, "setShaderValidationEnabled:", 1);
    v14 = -[MTLLegacySVLibrary initWithLibrary:device:]([MTLLegacySVLibrary alloc], "initWithLibrary:device:", v13, self);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)unwrapStitchedLibraryDescriptor:(id)a3
{
  void *v4;
  uint64_t v5;
  unsigned int v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", objc_msgSend(a3, "functions"));
  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
    v6 = 1;
    do
    {
      objc_msgSend(v4, "setObject:atIndexedSubscript:", objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", v5), "baseObject"), v5);
      v5 = v6;
    }
    while (objc_msgSend(v4, "count") > (unint64_t)v6++);
  }
  objc_msgSend(a3, "setFunctions:", v4);

  return a3;
}

- (id)newLibraryWithStitchedDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  id result;
  id v8;
  MTLLegacySVLibrary *v9;

  v6 = -[MTLLegacySVDevice unwrapStitchedLibraryDescriptor:](self, "unwrapStitchedLibraryDescriptor:", a3);
  instrumentationHeapInit(self);
  result = (id)objc_msgSend(*((id *)self + 2), "newLibraryWithStitchedDescriptor:error:", v6, a4);
  if (result)
  {
    v8 = result;
    objc_msgSend(result, "setShaderValidationEnabled:", 1);
    v9 = -[MTLLegacySVLibrary initWithLibrary:device:]([MTLLegacySVLibrary alloc], "initWithLibrary:device:", v8, self);

    return v9;
  }
  return result;
}

- (void)newLibraryWithStitchedDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[6];

  v6 = -[MTLLegacySVDevice unwrapStitchedLibraryDescriptor:](self, "unwrapStitchedLibraryDescriptor:", a3);
  v7 = (void *)*((_QWORD *)self + 2);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__MTLLegacySVDevice_newLibraryWithStitchedDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_24F7946B8;
  v8[4] = self;
  v8[5] = a4;
  objc_msgSend(v7, "newLibraryWithStitchedDescriptor:completionHandler:", v6, v8);
}

uint64_t __72__MTLLegacySVDevice_newLibraryWithStitchedDescriptor_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "setShaderValidationEnabled:", 1);
    -[MTLLegacySVLibrary initWithLibrary:device:]([MTLLegacySVLibrary alloc], "initWithLibrary:device:", a2, *(_QWORD *)(a1 + 32));
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)newLibraryWithStitchedDescriptorSPI:(id)a3 error:(id *)a4
{
  id v6;
  id result;
  id v8;
  MTLLegacySVLibrary *v9;

  v6 = -[MTLLegacySVDevice unwrapStitchedLibraryDescriptor:](self, "unwrapStitchedLibraryDescriptor:", a3);
  instrumentationHeapInit(self);
  result = (id)objc_msgSend(*((id *)self + 2), "newLibraryWithStitchedDescriptorSPI:error:", v6, a4);
  if (result)
  {
    v8 = result;
    objc_msgSend(result, "setShaderValidationEnabled:", 1);
    v9 = -[MTLLegacySVLibrary initWithLibrary:device:]([MTLLegacySVLibrary alloc], "initWithLibrary:device:", v8, self);

    return v9;
  }
  return result;
}

- (id)newDagStringWithGraphs:(id)a3
{
  return (id)objc_msgSend(*((id *)self + 2), "newDagStringWithGraphs:", a3);
}

- (id)newLibraryWithFile:(id)a3 error:(id *)a4
{
  id result;
  id v8;
  MTLLegacySVLibrary *v9;

  instrumentationHeapInit(self);
  result = (id)objc_msgSend(*((id *)self + 2), "newLibraryWithFile:error:", a3, a4);
  if (result)
  {
    v8 = result;
    objc_msgSend(result, "setShaderValidationEnabled:", 1);
    v9 = -[MTLLegacySVLibrary initWithLibrary:device:]([MTLLegacySVLibrary alloc], "initWithLibrary:device:", v8, self);

    return v9;
  }
  return result;
}

- (id)newLibraryWithData:(id)a3 error:(id *)a4
{
  id result;
  id v8;
  MTLLegacySVLibrary *v9;

  instrumentationHeapInit(self);
  result = (id)objc_msgSend(*((id *)self + 2), "newLibraryWithData:error:", a3, a4);
  if (result)
  {
    v8 = result;
    objc_msgSend(result, "setShaderValidationEnabled:", 1);
    v9 = -[MTLLegacySVLibrary initWithLibrary:device:]([MTLLegacySVLibrary alloc], "initWithLibrary:device:", v8, self);

    return v9;
  }
  return result;
}

- (id)newLibraryWithURL:(id)a3 error:(id *)a4
{
  id result;
  id v8;
  MTLLegacySVLibrary *v9;

  instrumentationHeapInit(self);
  result = (id)objc_msgSend(*((id *)self + 2), "newLibraryWithURL:error:", a3, a4);
  if (result)
  {
    v8 = result;
    objc_msgSend(result, "setShaderValidationEnabled:", 1);
    v9 = -[MTLLegacySVLibrary initWithLibrary:device:]([MTLLegacySVLibrary alloc], "initWithLibrary:device:", v8, self);

    return v9;
  }
  return result;
}

- (id)newLibraryWithSource:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v8;
  id result;
  id v10;
  MTLLegacySVLibrary *v11;

  v8 = DebugCompileOptions((MTLGPUDebugDevice *)self, (MTLCompileOptions *)a4);
  instrumentationHeapInit(self);
  result = (id)objc_msgSend(*((id *)self + 2), "newLibraryWithSource:options:error:", a3, v8, a5);
  if (result)
  {
    v10 = result;
    objc_msgSend(result, "setShaderValidationEnabled:", 1);
    v11 = -[MTLLegacySVLibrary initWithLibrary:device:]([MTLLegacySVLibrary alloc], "initWithLibrary:device:", v10, self);

    return v11;
  }
  return result;
}

- (void)newLibraryWithSource:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  void *v8;
  void *v9;
  _QWORD v10[6];

  v8 = DebugCompileOptions((MTLGPUDebugDevice *)self, (MTLCompileOptions *)a4);
  v9 = (void *)*((_QWORD *)self + 2);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__MTLLegacySVDevice_newLibraryWithSource_options_completionHandler___block_invoke;
  v10[3] = &unk_24F7946B8;
  v10[4] = self;
  v10[5] = a5;
  objc_msgSend(v9, "newLibraryWithSource:options:completionHandler:", a3, v8, v10);
}

uint64_t __68__MTLLegacySVDevice_newLibraryWithSource_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    -[MTLLegacySVLibrary initWithLibrary:device:]([MTLLegacySVLibrary alloc], "initWithLibrary:device:", a2, *(_QWORD *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)newDynamicLibraryWithURL:(id)a3 error:(id *)a4
{
  return -[MTLLegacySVDevice newDynamicLibraryWithURL:options:error:](self, "newDynamicLibraryWithURL:options:error:", a3, 2, a4);
}

- (id)newDynamicLibraryFromURL:(id)a3 error:(id *)a4
{
  return -[MTLLegacySVDevice newDynamicLibraryWithURL:options:error:](self, "newDynamicLibraryWithURL:options:error:", a3, 2, a4);
}

- (id)newDynamicLibraryWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  MTLLegacySVDevice *v14;
  _QWORD v15[6];

  v8 = a4 | 2;
  v14 = self;
  instrumentationHeapInit(self);
  v9 = objc_msgSend(*((id *)self + 2), "newDynamicLibraryWithURL:options:error:", a3, v8, a5);
  if (!v9)
    return 0;
  v10 = (void *)v9;
  v11 = (void *)*((_QWORD *)self + 7);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = ___ZZL18WrapDynamicLibraryIZ60__MTLLegacySVDevice_newDynamicLibraryWithURL_options_error__E4__13EP25MTLLegacySVDynamicLibraryP17MTLLegacySVDeviceT_ENKUlS5_E_clIPU28objcproto17MTLDynamicLibrary11objc_objectEEDaS5__block_invoke;
  v15[3] = &unk_24F794758;
  v15[4] = v10;
  v15[5] = &v14;
  v12 = (void *)objc_msgSend(v11, "getCachedObjectForKey:onMiss:", v10, v15);

  return v12;
}

- (id)newDynamicLibrary:(id)a3 error:(id *)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  MTLLegacySVDevice *v12;
  _QWORD v13[6];

  v12 = self;
  instrumentationHeapInit(self);
  v7 = objc_msgSend(*((id *)self + 2), "newDynamicLibrary:error:", objc_msgSend(a3, "baseObject"), a4);
  if (!v7)
    return 0;
  v8 = (void *)v7;
  v9 = (void *)*((_QWORD *)self + 7);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = ___ZZL18WrapDynamicLibraryIZ45__MTLLegacySVDevice_newDynamicLibrary_error__E4__14EP25MTLLegacySVDynamicLibraryP17MTLLegacySVDeviceT_ENKUlS5_E_clIPU28objcproto17MTLDynamicLibrary11objc_objectEEDaS5__block_invoke;
  v13[3] = &unk_24F794758;
  v13[4] = v8;
  v13[5] = &v12;
  v10 = (void *)objc_msgSend(v9, "getCachedObjectForKey:onMiss:", v8, v13);

  return v10;
}

- (id)newDynamicLibrary:(id)a3 computeDescriptor:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  MTLLegacySVDevice *v15;
  _QWORD v16[6];

  v14 = a4;
  v15 = self;
  instrumentationHeapInit(self);
  v16[0] = 0;
  v8 = -[MTLLegacySVDevice unwrapAndModifyComputePipelineDescriptor:options:](self, "unwrapAndModifyComputePipelineDescriptor:options:", &v14, v16);
  MTLDynamicLibraryLoadOptionsFromPipelineOptions();
  v9 = objc_msgSend(*((id *)self + 2), "newDynamicLibrary:computeDescriptor:error:", objc_msgSend(a3, "baseObject", v14, v15), v8, a5);
  if (!v9)
    return 0;
  v10 = (void *)v9;
  v11 = (void *)*((_QWORD *)self + 7);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = ___ZZL18WrapDynamicLibraryIZ63__MTLLegacySVDevice_newDynamicLibrary_computeDescriptor_error__E4__15EP25MTLLegacySVDynamicLibraryP17MTLLegacySVDeviceT_ENKUlS5_E_clIPU28objcproto17MTLDynamicLibrary11objc_objectEEDaS5__block_invoke;
  v16[3] = &unk_24F794758;
  v16[4] = v10;
  v16[5] = &v15;
  v12 = (void *)objc_msgSend(v11, "getCachedObjectForKey:onMiss:", v10, v16);

  return v12;
}

- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 error:(id *)a4
{
  return -[MTLLegacySVDevice loadDynamicLibrariesForFunction:insertLibraries:options:error:](self, "loadDynamicLibrariesForFunction:insertLibraries:options:error:", objc_msgSend(a3, "computeFunction"), objc_msgSend(a3, "preloadedLibraries"), 0, a4);
}

- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return -[MTLLegacySVDevice loadDynamicLibrariesForFunction:insertLibraries:options:error:](self, "loadDynamicLibrariesForFunction:insertLibraries:options:error:", objc_msgSend(a3, "computeFunction"), objc_msgSend(a3, "preloadedLibraries"), 0, a5);
}

- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 error:(id *)a5
{
  return -[MTLLegacySVDevice loadDynamicLibrariesForFunction:insertLibraries:options:error:](self, "loadDynamicLibrariesForFunction:insertLibraries:options:error:", a3, a4, 0, a5);
}

- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *context;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  MTLLegacySVDevice *v39;
  _QWORD v40[6];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  context = (void *)MEMORY[0x22E309364](self, a2);
  v11 = a5 | 2;
  if (a4)
  {
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(a4, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v13 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(a4);
          objc_msgSend(v12, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "baseObject"));
        }
        v14 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      }
      while (v14);
    }
  }
  else
  {
    v12 = 0;
  }
  v18 = (void *)objc_msgSend(*((id *)self + 2), "loadDynamicLibrariesForFunction:insertLibraries:options:error:", objc_msgSend(a3, "baseObject"), v12, v11, a6);
  if (v18)
  {
    v19 = v18;
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v18, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          v39 = self;
          instrumentationHeapInit(self);
          v25 = v24;
          if (v25)
          {
            v26 = v25;
            v27 = (void *)*((_QWORD *)self + 7);
            v40[0] = MEMORY[0x24BDAC760];
            v40[1] = 3221225472;
            v40[2] = ___ZZL18WrapDynamicLibraryIZ83__MTLLegacySVDevice_loadDynamicLibrariesForFunction_insertLibraries_options_error__E4__16EP25MTLLegacySVDynamicLibraryP17MTLLegacySVDeviceT_ENKUlS5_E_clIPU28objcproto17MTLDynamicLibrary11objc_objectEEDaS5__block_invoke;
            v40[3] = &unk_24F794758;
            v40[4] = v26;
            v40[5] = &v39;
            v28 = objc_msgSend(v27, "getCachedObjectForKey:onMiss:", v26, v40);

          }
          else
          {
            v28 = 0;
          }
          objc_msgSend(v17, "addObject:", v28);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      }
      while (v21);
    }

  }
  else
  {
    v17 = 0;
  }
  objc_autoreleasePoolPop(context);
  return v17;
}

- (id)newBinaryArchiveWithDescriptor:(id)a3 error:(id *)a4
{
  id result;
  id v6;
  MTLLegacySVBinaryArchive *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBinaryArchiveWithDescriptor:error:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLLegacySVBinaryArchive initWithBinaryArchive:device:]([MTLLegacySVBinaryArchive alloc], "initWithBinaryArchive:device:", result, self);

    return v7;
  }
  return result;
}

- (id)newBinaryLibraryWithOptions:(unint64_t)a3 url:(id)a4 error:(id *)a5
{
  id result;
  id v7;
  MTLLegacySVBinaryArchive *v8;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBinaryLibraryWithOptions:url:error:", a3, a4, a5);
  if (result)
  {
    v7 = result;
    v8 = -[MTLLegacySVBinaryArchive initWithBinaryArchive:device:]([MTLLegacySVBinaryArchive alloc], "initWithBinaryArchive:device:", result, self);

    return v8;
  }
  return result;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  id result;
  id v8;
  MTLLegacySVBuffer *v9;

  instrumentationHeapInit(self);
  result = (id)objc_msgSend(*((id *)self + 2), "newBufferWithLength:options:", a3, a4);
  if (result)
  {
    v8 = result;
    v9 = -[MTLLegacySVBuffer initWithBuffer:device:]([MTLLegacySVBuffer alloc], "initWithBuffer:device:", result, self);

    return v9;
  }
  return result;
}

- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  id result;
  id v10;
  MTLLegacySVBuffer *v11;

  instrumentationHeapInit(self);
  result = (id)objc_msgSend(*((id *)self + 2), "newBufferWithBytes:length:options:", a3, a4, a5);
  if (result)
  {
    v10 = result;
    v11 = -[MTLLegacySVBuffer initWithBuffer:device:]([MTLLegacySVBuffer alloc], "initWithBuffer:device:", result, self);

    return v11;
  }
  return result;
}

- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 deallocator:(id)a6
{
  id result;
  id v12;
  MTLLegacySVBuffer *v13;

  instrumentationHeapInit(self);
  result = (id)objc_msgSend(*((id *)self + 2), "newBufferWithBytesNoCopy:length:options:deallocator:", a3, a4, a5, a6);
  if (result)
  {
    v12 = result;
    v13 = -[MTLLegacySVBuffer initWithBuffer:device:]([MTLLegacySVBuffer alloc], "initWithBuffer:device:", result, self);

    return v13;
  }
  return result;
}

- (id)newBufferWithIOSurface:(__IOSurface *)a3
{
  id result;
  id v6;
  MTLLegacySVBuffer *v7;

  instrumentationHeapInit(self);
  result = (id)objc_msgSend(*((id *)self + 2), "newBufferWithIOSurface:", a3);
  if (result)
  {
    v6 = result;
    v7 = -[MTLLegacySVBuffer initWithBuffer:device:]([MTLLegacySVBuffer alloc], "initWithBuffer:device:", result, self);

    return v7;
  }
  return result;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 gpuAddress:(unint64_t)a5
{
  return 0;
}

- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 gpuAddress:(unint64_t)a6
{
  return 0;
}

- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 gpuAddress:(unint64_t)a6 deallocator:(id)a7
{
  return 0;
}

- (id)newBufferWithDescriptor:(id)a3
{
  id result;
  id v6;
  MTLLegacySVBuffer *v7;

  instrumentationHeapInit(self);
  result = (id)objc_msgSend(*((id *)self + 2), "newBufferWithDescriptor:", a3);
  if (result)
  {
    v6 = result;
    v7 = -[MTLLegacySVBuffer initWithBuffer:device:]([MTLLegacySVBuffer alloc], "initWithBuffer:device:", result, self);

    return v7;
  }
  return result;
}

- (id)newHeapWithDescriptor:(id)a3
{
  id result;
  id v6;
  MTLLegacySVHeap *v7;

  instrumentationHeapInit(self);
  result = (id)objc_msgSend(*((id *)self + 2), "newHeapWithDescriptor:", a3);
  if (result)
  {
    v6 = result;
    v7 = -[MTLLegacySVHeap initWithHeap:descriptor:device:]([MTLLegacySVHeap alloc], "initWithHeap:descriptor:device:", result, a3, self);

    return v7;
  }
  return result;
}

- (id)newTextureWithDescriptor:(id)a3
{
  id result;
  id v5;
  MTLLegacySVTexture *v6;

  result = (id)objc_msgSend(*((id *)self + 2), "newTextureWithDescriptor:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLLegacySVTexture initWithTexture:heap:device:]([MTLLegacySVTexture alloc], "initWithTexture:heap:device:", result, 0, self);

    return v6;
  }
  return result;
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5
{
  id result;
  id v7;
  MTLLegacySVTexture *v8;

  result = (id)objc_msgSend(*((id *)self + 2), "newTextureWithDescriptor:iosurface:plane:", a3, a4, a5);
  if (result)
  {
    v7 = result;
    v8 = -[MTLLegacySVTexture initWithTexture:heap:device:]([MTLLegacySVTexture alloc], "initWithTexture:heap:device:", result, 0, self);

    return v8;
  }
  return result;
}

- (id)newSharedTextureWithHandle:(id)a3
{
  id result;
  id v5;
  MTLLegacySVTexture *v6;

  result = (id)objc_msgSend(*((id *)self + 2), "newSharedTextureWithHandle:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLLegacySVTexture initWithTexture:heap:device:]([MTLLegacySVTexture alloc], "initWithTexture:heap:device:", result, 0, self);

    return v6;
  }
  return result;
}

- (id)newSharedTextureWithDescriptor:(id)a3
{
  id result;
  id v5;
  MTLLegacySVTexture *v6;

  result = (id)objc_msgSend(*((id *)self + 2), "newSharedTextureWithDescriptor:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLLegacySVTexture initWithTexture:heap:device:]([MTLLegacySVTexture alloc], "initWithTexture:heap:device:", result, 0, self);

    return v6;
  }
  return result;
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5 slice:(unint64_t)a6
{
  id result;
  id v8;
  MTLLegacySVTexture *v9;

  result = (id)objc_msgSend(*((id *)self + 2), "newTextureWithDescriptor:iosurface:plane:slice:", a3, a4, a5, a6);
  if (result)
  {
    v8 = result;
    v9 = -[MTLLegacySVTexture initWithTexture:heap:device:]([MTLLegacySVTexture alloc], "initWithTexture:heap:device:", result, 0, self);

    return v9;
  }
  return result;
}

- (id)newTextureWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 descriptor:(id)a5 deallocator:(id)a6
{
  id result;
  id v8;
  MTLLegacySVTexture *v9;

  result = (id)objc_msgSend(*((id *)self + 2), "newTextureWithBytesNoCopy:length:descriptor:deallocator:", a3, a4, a5, a6);
  if (result)
  {
    v8 = result;
    v9 = -[MTLLegacySVTexture initWithTexture:heap:device:]([MTLLegacySVTexture alloc], "initWithTexture:heap:device:", result, 0, self);

    return v9;
  }
  return result;
}

- (id)newArgumentEncoderWithArguments:(id)a3 structType:(id *)a4
{
  objc_super v7;

  if ((*((_BYTE *)self + 286) & 0x80) != 0)
  {
    if (a4)
      *a4 = (id)MTLCreateStructTypeFromArgumentDescriptors();
    return -[MTLLegacySVDevice newArgumentEncoderWithArguments:](self, "newArgumentEncoderWithArguments:", a3);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MTLLegacySVDevice;
    return -[MTLToolsDevice newArgumentEncoderWithArguments:structType:](&v7, sel_newArgumentEncoderWithArguments_structType_, a3, a4);
  }
}

- (id)newArgumentEncoderWithArguments:(id)a3
{
  void *v5;
  unint64_t v6;
  char v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  int Alignment;
  int v19;
  unsigned int v20;
  uint64_t v21;
  id v22;
  void *v23;
  MTLLegacySVArgumentEncoder *v24;
  objc_super v25;

  if ((*((_BYTE *)self + 286) & 0x80) != 0)
  {
    v5 = (void *)objc_msgSend(a3, "mutableCopy");
    if (objc_msgSend(v5, "count"))
    {
      v6 = 0;
      v7 = 0;
      do
      {
        v8 = (void *)objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
        v9 = objc_msgSend(v8, "constantBlockAlignment") != 0;
        v10 = objc_msgSend(v8, "dataType");
        if ((unint64_t)(v10 - 60) <= 0x3A && ((1 << (v10 - 60)) & 0x600000000000001) != 0)
          objc_msgSend(v8, "setDataType:", 30);
        v7 |= v9;
        ++v6;
      }
      while (objc_msgSend(v5, "count") > v6);
      if ((v7 & 1) != 0 && objc_msgSend(v5, "count"))
      {
        v12 = 0;
        v13 = 0;
        do
        {
          v14 = v12 + 1;
          v15 = (void *)objc_msgSend(v5, "objectAtIndexedSubscript:", v12);
          v16 = objc_msgSend(v15, "dataType");
          if ((unint64_t)(v16 - 58) > 0x16 || ((1 << (v16 - 58)) & 0x700007) == 0)
          {
            Alignment = objc_msgSend(v15, "constantBlockAlignment");
            objc_msgSend(v15, "setConstantBlockAlignment:", 0);
            if (!Alignment)
            {
              objc_msgSend(v15, "dataType");
              Alignment = MTLDataTypeGetAlignment();
            }
            v19 = (v13 + Alignment - 1) & -Alignment;
            v20 = v19 - v13;
            if (v19 != v13)
            {
              v21 = v19 - v13;
              do
              {
                v22 = objc_alloc_init(MEMORY[0x24BDDD4C0]);
                objc_msgSend(v22, "setDataType:", 45);
                objc_msgSend(v22, "setIndex:", objc_msgSend(v5, "count"));
                objc_msgSend(v5, "insertObject:atIndex:", v22, v12);

                ++v12;
                --v21;
              }
              while (v21);
              v14 += v20;
            }
            objc_msgSend(v15, "dataType");
            v13 = v19 + MTLDataTypeGetSize();
          }
          else
          {
            v13 = ((v13 + 7) & 0xFFFFFFF8) + 8;
          }
          v12 = v14;
        }
        while (v14 < objc_msgSend(v5, "count"));
      }
    }
    v23 = (void *)objc_msgSend(*((id *)self + 2), "newArgumentEncoderWithArguments:", v5);

    v24 = -[MTLLegacySVArgumentEncoder initWithArgumentEncoder:layout:device:]([MTLLegacySVArgumentEncoder alloc], "initWithArgumentEncoder:layout:device:", v23, 0, self);
    return v24;
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)MTLLegacySVDevice;
    return -[MTLToolsDevice newArgumentEncoderWithArguments:](&v25, sel_newArgumentEncoderWithArguments_, a3);
  }
}

- (id)newArgumentEncoderWithLayout:(id)a3
{
  return 0;
}

- (void)validateRaytracing
{
  if (!-[MTLLegacySVDevice supportsRaytracing](self, "supportsRaytracing"))
    MTLReportFailure();
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)accelerationStructureSizesWithDescriptor:(SEL)a3
{
  id v7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;

  -[MTLLegacySVDevice validateRaytracing](self, "validateRaytracing");
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)unwrapAccelerationStructureDescriptor(a4);
  if (v7)
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)objc_msgSend(v7, "accelerationStructureSizesWithDescriptor:", result);
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return result;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  MTLLegacySVAccelerationStructure *v8;

  v5 = (void *)MEMORY[0x22E309364](-[MTLLegacySVDevice validateRaytracing](self, "validateRaytracing"));
  v6 = objc_msgSend(*((id *)self + 2), "newAccelerationStructureWithSize:", a3);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = -[MTLLegacySVAccelerationStructure initWithAccelerationStructure:device:]([MTLLegacySVAccelerationStructure alloc], "initWithAccelerationStructure:device:", v6, self);

  }
  else
  {
    v8 = 0;
  }
  objc_autoreleasePoolPop(v5);
  return v8;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  MTLLegacySVAccelerationStructure *v8;

  v5 = (void *)MEMORY[0x22E309364](-[MTLLegacySVDevice validateRaytracing](self, "validateRaytracing"));
  v6 = objc_msgSend(*((id *)self + 2), "newAccelerationStructureWithDescriptor:", unwrapAccelerationStructureDescriptor(a3));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = -[MTLLegacySVAccelerationStructure initWithAccelerationStructure:device:]([MTLLegacySVAccelerationStructure alloc], "initWithAccelerationStructure:device:", v6, self);

  }
  else
  {
    v8 = 0;
  }
  objc_autoreleasePoolPop(v5);
  return v8;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  MTLLegacySVAccelerationStructure *v10;

  v7 = (void *)MEMORY[0x22E309364](-[MTLLegacySVDevice validateRaytracing](self, "validateRaytracing"));
  v8 = objc_msgSend(*((id *)self + 2), "newAccelerationStructureWithSize:resourceIndex:", a3, a4);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = -[MTLLegacySVAccelerationStructure initWithAccelerationStructure:device:]([MTLLegacySVAccelerationStructure alloc], "initWithAccelerationStructure:device:", v8, self);

  }
  else
  {
    v10 = 0;
  }
  objc_autoreleasePoolPop(v7);
  return v10;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  MTLLegacySVAccelerationStructure *v10;

  v7 = (void *)MEMORY[0x22E309364](-[MTLLegacySVDevice validateRaytracing](self, "validateRaytracing"));
  v8 = objc_msgSend(*((id *)self + 2), "newAccelerationStructureWithBuffer:offset:", objc_msgSend(a3, "baseObject"), a4);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = -[MTLLegacySVAccelerationStructure initWithAccelerationStructure:device:]([MTLLegacySVAccelerationStructure alloc], "initWithAccelerationStructure:device:", v8, self);

  }
  else
  {
    v10 = 0;
  }
  objc_autoreleasePoolPop(v7);
  return v10;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  void *v9;
  uint64_t v10;
  void *v11;
  MTLLegacySVAccelerationStructure *v12;

  v9 = (void *)MEMORY[0x22E309364](-[MTLLegacySVDevice validateRaytracing](self, "validateRaytracing"));
  v10 = objc_msgSend(*((id *)self + 2), "newAccelerationStructureWithBuffer:offset:resourceIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
  if (v10)
  {
    v11 = (void *)v10;
    v12 = -[MTLLegacySVAccelerationStructure initWithAccelerationStructure:device:]([MTLLegacySVAccelerationStructure alloc], "initWithAccelerationStructure:device:", v10, self);

  }
  else
  {
    v12 = 0;
  }
  objc_autoreleasePoolPop(v9);
  return v12;
}

- (id)deserializePrimitiveAccelerationStructureFromBytes:(void *)a3 withDescriptor:(id)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  MTLLegacySVAccelerationStructure *v10;

  v7 = (void *)MEMORY[0x22E309364](self, a2);
  v8 = objc_msgSend(*((id *)self + 2), "deserializePrimitiveAccelerationStructureFromBytes:withDescriptor:", a3, unwrapAccelerationStructureDescriptor(a4));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = -[MTLLegacySVAccelerationStructure initWithAccelerationStructure:device:type:]([MTLLegacySVAccelerationStructure alloc], "initWithAccelerationStructure:device:type:", v8, self, 1);

  }
  else
  {
    v10 = 0;
  }
  objc_autoreleasePoolPop(v7);
  return v10;
}

- (id)deserializeInstanceAccelerationStructureFromBytes:(void *)a3 primitiveAccelerationStructures:(id)a4 withDescriptor:(id)a5
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  MTLLegacySVAccelerationStructure *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)MEMORY[0x22E309364](self, a2);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(a4, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(a4);
        objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14++), "baseObject"));
      }
      while (v12 != v14);
      v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }
  v15 = (void *)objc_msgSend(*((id *)self + 2), "deserializeInstanceAccelerationStructureFromBytes:primitiveAccelerationStructures:withDescriptor:", a3, v10, unwrapAccelerationStructureDescriptor(a5));

  if (v15)
  {
    v16 = -[MTLLegacySVAccelerationStructure initWithAccelerationStructure:device:type:]([MTLLegacySVAccelerationStructure alloc], "initWithAccelerationStructure:device:type:", v15, self, 2);

  }
  else
  {
    v16 = 0;
  }
  objc_autoreleasePoolPop(v9);
  return v16;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4
{
  id result;
  id v6;
  MTLLegacySVAccelerationStructure *v7;

  result = (id)objc_msgSend(*((id *)self + 2), "newAccelerationStructureWithSize:withDescriptor:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLLegacySVAccelerationStructure initWithAccelerationStructure:device:]([MTLLegacySVAccelerationStructure alloc], "initWithAccelerationStructure:device:", result, self);

    return v7;
  }
  return result;
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
{
  id result;
  id v6;
  MTLLegacySVVisibleFunctionTable *v7;

  result = (id)objc_msgSend(*((id *)self + 2), "newVisibleFunctionTableWithDescriptor:");
  if (result)
  {
    v6 = result;
    v7 = -[MTLLegacySVVisibleFunctionTable initWithVisibleFunctionTable:descriptor:device:]([MTLLegacySVVisibleFunctionTable alloc], "initWithVisibleFunctionTable:descriptor:device:", result, a3, self);

    return v7;
  }
  return result;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  id result;
  id v6;
  MTLLegacySVIntersectionFunctionTable *v7;

  -[MTLLegacySVDevice validateRaytracing](self, "validateRaytracing");
  result = (id)objc_msgSend(*((id *)self + 2), "newIntersectionFunctionTableWithDescriptor:", a3);
  if (result)
  {
    v6 = result;
    v7 = -[MTLLegacySVIntersectionFunctionTable initWithIntersectionFunctionTable:device:descriptor:]([MTLLegacySVIntersectionFunctionTable alloc], "initWithIntersectionFunctionTable:device:descriptor:", result, self, a3);

    return v7;
  }
  return result;
}

- (id)newResidencySetWithDescriptor:(id)a3 error:(id *)a4
{
  void *v6;
  MTLLegacySVResidencySet *v7;

  v6 = (void *)objc_msgSend(*((id *)self + 2), "newResidencySetWithDescriptor:error:", a3, a4);
  if (v6)
    v7 = -[MTLLegacySVResidencySet initWithResidencySet:device:descriptor:]([MTLLegacySVResidencySet alloc], "initWithResidencySet:device:descriptor:", v6, self, a3);
  else
    v7 = 0;

  return v7;
}

- (BOOL)supportsArgumentBuffersTier2
{
  return *((unsigned __int8 *)self + 286) >> 7;
}

- (BOOL)supportsCMPIndirectCommandBuffers
{
  if ((*((_BYTE *)self + 287) & 0x20) != 0)
    return objc_msgSend(*((id *)self + 2), "supportsCMPIndirectCommandBuffers");
  else
    return 0;
}

- (BOOL)supportsGFXIndirectCommandBuffers
{
  return 0;
}

- (BOOL)supportsRenderDynamicLibraries
{
  _BOOL4 v3;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLLegacySVDevice;
  v3 = -[MTLToolsDevice supportsRenderDynamicLibraries](&v6, sel_supportsRenderDynamicLibraries);
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MTLLegacySVDevice;
    LOBYTE(v3) = -[MTLToolsDevice supportsGlobalVariableRelocationRender](&v5, sel_supportsGlobalVariableRelocationRender);
  }
  return v3;
}

- (BOOL)supportsRaytracing
{
  return *((_BYTE *)self + 288) & 1;
}

- (BOOL)supportsRaytracingFromRender
{
  if ((*((_BYTE *)self + 288) & 1) != 0)
    return objc_msgSend(*((id *)self + 2), "supportsRaytracingFromRender");
  else
    return 0;
}

- (BOOL)supportsStackOverflowErrorCode
{
  return 0;
}

- (BOOL)supportsForkJoin
{
  return 0;
}

- (BOOL)supportsGlobalVariableBindings
{
  return 1;
}

- (id)getDynamicLibraryForBaseObject:(id)a3
{
  void *v3;
  _QWORD v5[6];

  v3 = (void *)*((_QWORD *)self + 7);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__MTLLegacySVDevice_getDynamicLibraryForBaseObject___block_invoke;
  v5[3] = &unk_24F7946E0;
  v5[4] = a3;
  v5[5] = self;
  return (id)objc_msgSend(v3, "getCachedObjectForKey:onMiss:", a3, v5);
}

MTLLegacySVDynamicLibrary *__52__MTLLegacySVDevice_getDynamicLibraryForBaseObject___block_invoke(uint64_t a1)
{
  return -[MTLLegacySVDynamicLibrary initWithDynamicLibrary:device:]([MTLLegacySVDynamicLibrary alloc], "initWithDynamicLibrary:device:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)getFunctionForBaseObject:(id)a3 library:(id)a4
{
  void *v4;
  _QWORD v6[6];

  v4 = (void *)*((_QWORD *)self + 9);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__MTLLegacySVDevice_getFunctionForBaseObject_library___block_invoke;
  v6[3] = &unk_24F794708;
  v6[4] = a3;
  v6[5] = a4;
  return (id)objc_msgSend(v4, "getCachedObjectForKey:onMiss:", a3, v6);
}

MTLLegacySVFunction *__54__MTLLegacySVDevice_getFunctionForBaseObject_library___block_invoke(uint64_t a1)
{
  return -[MTLLegacySVFunction initWithFunction:library:]([MTLLegacySVFunction alloc], "initWithFunction:library:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)supportsResourceUsageValidation
{
  return (*((unsigned __int8 *)self + 288) >> 1) & 1;
}

- (id)newArgumentEncoderWithBufferBinding:(id)a3
{
  return 0;
}

- (BOOL)supportsRayTracingPerPrimitiveData
{
  return 1;
}

- (BOOL)areWritableHeapsEnabled
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "areWritableHeapsEnabled");
}

- (void)setWritableHeapsEnabled:(BOOL)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setWritableHeapsEnabled:", a3);
}

- (MTLComputePipelineState)accelerationStructureComputePipelineState
{
  return (MTLComputePipelineState *)*((_QWORD *)self + 96);
}

- (void).cxx_destruct
{
  char *v3;
  void *v4;
  void *v5;

  v3 = (char *)self + 552;
  std::__list_imp<objc_object  {objcproto9MTLBuffer}*>::clear((_QWORD *)self + 78);
  std::mutex::~mutex((std::mutex *)(v3 + 8));
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)self + 504);
  std::mutex::~mutex((std::mutex *)((char *)self + 440));
  v4 = (void *)*((_QWORD *)self + 48);
  if (v4)
  {
    *((_QWORD *)self + 49) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)self + 45);
  if (v5)
  {
    *((_QWORD *)self + 46) = v5;
    operator delete(v5);
  }
  std::mutex::~mutex((std::mutex *)((char *)self + 296));
  LegacySVMetalBufferHeap::~LegacySVMetalBufferHeap((std::mutex *)((char *)self + 112));
}

- (id).cxx_construct
{
  *((_QWORD *)self + 14) = 850045863;
  *((_QWORD *)self + 27) = 0;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *((_DWORD *)self + 56) = -1;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 248) = 0u;
  *((_QWORD *)self + 37) = 850045863;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 20) = 0u;
  *((_OWORD *)self + 21) = 0u;
  *((_OWORD *)self + 22) = 0u;
  *((_OWORD *)self + 23) = 0u;
  *((_OWORD *)self + 24) = 0u;
  *((_QWORD *)self + 50) = 0;
  *((_QWORD *)self + 52) = 0;
  *((_QWORD *)self + 53) = 0;
  *((_OWORD *)self + 27) = xmmword_22CEAB5A0;
  *((_OWORD *)self + 28) = 0u;
  *((_OWORD *)self + 29) = 0u;
  *((_OWORD *)self + 30) = 0u;
  *((_OWORD *)self + 31) = 0u;
  *((_OWORD *)self + 32) = 0u;
  *((_QWORD *)self + 66) = 0;
  *((_DWORD *)self + 134) = 1065353216;
  *((_QWORD *)self + 70) = 850045863;
  *(_OWORD *)((char *)self + 568) = 0u;
  *(_OWORD *)((char *)self + 584) = 0u;
  *(_OWORD *)((char *)self + 600) = 0u;
  *((_QWORD *)self + 77) = 0;
  *((_QWORD *)self + 78) = (char *)self + 624;
  *((_QWORD *)self + 86) = 0;
  *((_QWORD *)self + 79) = (char *)self + 624;
  *((_QWORD *)self + 80) = 0;
  *((_QWORD *)self + 87) = 0;
  return self;
}

- (void)initWithBaseObject:(uint64_t)a1 parent:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "name"), "UTF8String");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22CD98000, a2, v3, "Device Alloc - %s, %p", v4);
  OUTLINED_FUNCTION_1();
}

@end
