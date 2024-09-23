@implementation MTLDevice

uint64_t __61___MTLDevice_newLibraryWithSource_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, NSError *a3)
{
  if (a2 && a3)
    _MTLCompilerWarningLog(a3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48___MTLDevice_serializeRenderPipelineDescriptor___block_invoke(MTLPipelineLibrarySerializer::PipelineDescriptorSerializer *a1)
{
  _QWORD *v2;

  v2 = MTLPipelineLibrarySerializer::PipelineDescriptorSerializer::create(a1);
  *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40) = (*(uint64_t (**)(_QWORD *, _QWORD))(*v2 + 24))(v2, *((_QWORD *)a1 + 4));
  return (*(uint64_t (**)(_QWORD *))(*v2 + 8))(v2);
}

uint64_t __49___MTLDevice_serializeComputePipelineDescriptor___block_invoke(MTLPipelineLibrarySerializer::PipelineDescriptorSerializer *a1)
{
  _QWORD *v2;

  v2 = MTLPipelineLibrarySerializer::PipelineDescriptorSerializer::create(a1);
  *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40) = (*(uint64_t (**)(_QWORD *, _QWORD))(*v2 + 16))(v2, *((_QWORD *)a1 + 4));
  return (*(uint64_t (**)(_QWORD *))(*v2 + 8))(v2);
}

uint64_t __52___MTLDevice_serializeTileRenderPipelineDescriptor___block_invoke(MTLPipelineLibrarySerializer::PipelineDescriptorSerializer *a1)
{
  _QWORD *v2;

  v2 = MTLPipelineLibrarySerializer::PipelineDescriptorSerializer::create(a1);
  *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40) = (*(uint64_t (**)(_QWORD *, _QWORD))(*v2 + 32))(v2, *((_QWORD *)a1 + 4));
  return (*(uint64_t (**)(_QWORD *))(*v2 + 8))(v2);
}

uint64_t __52___MTLDevice_serializeMeshRenderPipelineDescriptor___block_invoke(MTLPipelineLibrarySerializer::PipelineDescriptorSerializer *a1)
{
  _QWORD *v2;

  v2 = MTLPipelineLibrarySerializer::PipelineDescriptorSerializer::create(a1);
  *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 40) = (*(uint64_t (**)(_QWORD *, _QWORD))(*v2 + 40))(v2, *((_QWORD *)a1 + 4));
  return (*(uint64_t (**)(_QWORD *))(*v2 + 8))(v2);
}

void __49___MTLDevice_newLibraryWithSource_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isCollectingLibraries"))
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v5)
      MTLPipelineCollection::addLibrary(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 440), v5);
  }
}

uint64_t __52___MTLDevice_optionsForPipelineLibrarySerialization__block_invoke()
{
  uint64_t result;

  result = MTLGetEnvDefault("MTL_DUMP_PIPELINES_AS_METAL_SCRIPT", 0);
  -[_MTLDevice optionsForPipelineLibrarySerialization]::serializeMetalScript = result;
  return result;
}

void __71___MTLDevice__newDynamicLibraryWithDescriptor_computeDescriptor_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  MTLDebugInstrumentationData *v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
  if (a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = -[_MTLDynamicLibrary initWithLibrary:binaryData:device:error:]([_MTLDynamicLibrary alloc], "initWithLibrary:binaryData:device:error:", objc_msgSend(*(id *)(a1 + 32), "library"), *(_QWORD *)(a2 + 24), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
    if (*(_QWORD *)(a2 + 104))
    {
      v5 = -[MTLDebugInstrumentationData initWithData:]([MTLDebugInstrumentationData alloc], "initWithData:", *(_QWORD *)(a2 + 104));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setDebugInstrumentationData:", v5);

    }
  }
}

uint64_t __68___MTLDevice_newComputePipelineStateWithFunction_completionHandler___block_invoke(uint64_t a1)
{

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76___MTLDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke(uint64_t a1)
{

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65___MTLDevice_newLibraryWithStitchedDescriptor_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  if (a2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440);
    if (v3)
      MTLPipelineCollection::addStitchedLibrary(v3, a2, *(void **)(a1 + 40));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __69___MTLDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70___MTLDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __37___MTLDevice__rateLimitQueueCreation__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __44___MTLDevice_lookupRecompiledBinaryArchive___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD **v5;
  void *__p[2];
  char v7;
  stat v8;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
  if (v2)
  {
    v3 = v2;
    if (MTLGetBaseCachePath(void)::onceToken != -1)
      dispatch_once(&MTLGetBaseCachePath(void)::onceToken, &__block_literal_global_5);
    v9[0] = MTLGetBaseCachePath(void)::result;
    v9[1] = CFSTR("com.apple.metalassetupgrader");
    v9[2] = CFSTR("recompiled");
    v9[3] = v3;
    v9[4] = CFSTR("archiveMapping.db");
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5));
    if (!stat((const char *)objc_msgSend(v4, "UTF8String"), &v8))
    {
      v5 = (_QWORD **)operator new();
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
      MTLArchiveMapDB::MTLArchiveMapDB(v5, (uint64_t *)__p);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528) = v5;
      if (v7 < 0)
        operator delete(__p[0]);
    }
  }
}

void __39___MTLDevice_recordBinaryArchiveUsage___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD **v3;
  void *__p[2];
  char v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier"))
  {
    if (MTLGetShaderCachePath::onceToken != -1)
      dispatch_once(&MTLGetShaderCachePath::onceToken, &__block_literal_global_3);
    v6[0] = MTLGetShaderCachePath::result;
    v6[1] = CFSTR("archiveUsage.db");
    v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2));
    v3 = (_QWORD **)operator new();
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v2, "UTF8String"));
    MTLArchiveUsageDB::MTLArchiveUsageDB(v3, (uint64_t *)__p);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 536) = v3;
    if (v5 < 0)
      operator delete(__p[0]);
  }
}

void __26___MTLDevice_architecture__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 552))
  {
    v2 = (void *)MEMORY[0x186DAC640]();
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "targetDeviceArchitecture");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 552) = -[MTLArchitecture initWithCPUType:cpuSubtype:]([MTLArchitecture alloc], "initWithCPUType:cpuSubtype:", objc_msgSend(v3, "cpuType"), objc_msgSend(v3, "subType"));
    objc_autoreleasePoolPop(v2);
  }
}

@end
