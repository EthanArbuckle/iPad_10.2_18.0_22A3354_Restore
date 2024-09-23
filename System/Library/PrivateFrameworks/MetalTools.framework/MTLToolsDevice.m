@implementation MTLToolsDevice

- (MTLToolsDevice)initWithBaseObject:(id)a3 parent:(id)a4
{
  MTLToolsDevice *v4;
  MTLToolsDevice *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLToolsDevice;
  v4 = -[MTLToolsObject initWithBaseObject:parent:](&v7, sel_initWithBaseObject_parent_, a3, a4);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(-[MTLToolsObject baseObject](v4, "baseObject"), "_setDeviceWrapper:", v4);
    v5->super._device = v5;
    v5->functionHandleObjectCache = objc_alloc_init(MTLToolsObjectCache);
    v5->dynamicLibraryObjectCache = objc_alloc_init(MTLToolsObjectCache);
    v5->sourceLibraryObjectCache = objc_alloc_init(MTLToolsObjectCache);
    v5->functionObjectCache = objc_alloc_init(MTLToolsObjectCache);
    v5->depthStencilObjectCache = objc_alloc_init(MTLToolsObjectCache);
    v5->samplerObjectCache = objc_alloc_init(MTLToolsObjectCache);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLToolsDevice;
  -[MTLToolsObject dealloc](&v3, sel_dealloc);
}

- (id)newFunctionWithGLCoreIR:(void *)a3 functionType:(unint64_t)a4
{
  id result;
  id v6;
  MTLToolsFunction *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithGLCoreIR:functionType:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsFunction alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)newFunctionWithGLCoreIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5
{
  id result;
  id v7;
  MTLToolsFunction *v8;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithGLCoreIR:inputsDescription:functionType:", a3, a4, a5);
  if (result)
  {
    v7 = result;
    v8 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsFunction alloc], "initWithBaseObject:parent:", result, self);

    return v8;
  }
  return result;
}

- (id)newFunctionWithGLESIR:(void *)a3 functionType:(unint64_t)a4
{
  id result;
  id v6;
  MTLToolsFunction *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithGLESIR:functionType:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsFunction alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)newLogStateWithDescriptor:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLogStateWithDescriptor:error:", a3, a4);
}

- (id)newFunctionWithGLESIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5
{
  id result;
  id v7;
  MTLToolsFunction *v8;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithGLESIR:inputsDescription:functionType:", a3, a4, a5);
  if (result)
  {
    v7 = result;
    v8 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsFunction alloc], "initWithBaseObject:parent:", result, self);

    return v8;
  }
  return result;
}

- (id)newFunctionWithGLIR:(void *)a3 functionType:(unint64_t)a4
{
  id result;
  id v6;
  MTLToolsFunction *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithGLIR:functionType:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsFunction alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)newFunctionWithGLIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5
{
  id result;
  id v7;
  MTLToolsFunction *v8;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithGLIR:inputsDescription:functionType:", a3, a4, a5);
  if (result)
  {
    v7 = result;
    v8 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsFunction alloc], "initWithBaseObject:parent:", result, self);

    return v8;
  }
  return result;
}

- (BOOL)shaderDebugInfoCaching
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "shaderDebugInfoCaching");
}

- (void)setShaderDebugInfoCaching:(BOOL)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setShaderDebugInfoCaching:", a3);
}

- (BOOL)mapShaderSampleBufferWithBuffer:(id *)a3 capacity:(unint64_t)a4 size:(unint64_t)a5
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "mapShaderSampleBufferWithBuffer:capacity:size:", a3, a4, a5);
}

- (void)unmapShaderSampleBuffer
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "unmapShaderSampleBuffer");
}

- (BOOL)supportsRaytracing
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRaytracing");
}

- (BOOL)requiresRaytracingEmulation
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "requiresRaytracingEmulation");
}

- (MTLGPUBVHBuilder)GPUBVHBuilder
{
  return (MTLGPUBVHBuilder *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "GPUBVHBuilder");
}

- (unint64_t)latestSupportedGenericBVHVersion
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "latestSupportedGenericBVHVersion");
}

- (NSString)name
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "name");
}

- (unint64_t)registryID
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "registryID");
}

- (MTLArchitecture)architecture
{
  return (MTLArchitecture *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "architecture");
}

- (id)getMostCompatibleArchitecture:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getMostCompatibleArchitecture:", a3);
}

- (id)vendorName
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "vendorName");
}

- (id)familyName
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "familyName");
}

- (id)productName
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "productName");
}

- (const)targetDeviceInfo
{
  return (const MTLTargetDeviceArch *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "targetDeviceInfo");
}

- (MTLTargetDeviceArchitecture)targetDeviceArchitecture
{
  return (MTLTargetDeviceArchitecture *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "targetDeviceArchitecture");
}

- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 error:(id *)a4
{
  return -[MTLToolsDevice loadDynamicLibrariesForComputeDescriptor:options:error:](self, "loadDynamicLibrariesForComputeDescriptor:options:error:", a3, 0, a4);
}

- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "loadDynamicLibrariesForComputeDescriptor:options:error:", -[MTLToolsDevice unwrapMTLComputePipelineDescriptor:](self, "unwrapMTLComputePipelineDescriptor:", a3), a4, a5);
  if (!v6)
    return 0;
  v7 = (void *)v6;
  v8 = (void *)objc_opt_new();
  v9 = (void *)MEMORY[0x22E309364]();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend(v8, "addObject:", -[MTLToolsDevice getDynamicLibraryForBaseObject:](self, "getDynamicLibraryForBaseObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++)));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }
  objc_autoreleasePoolPop(v9);

  return v8;
}

- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 error:(id *)a5
{
  return -[MTLToolsDevice loadDynamicLibrariesForFunction:insertLibraries:options:error:](self, "loadDynamicLibrariesForFunction:insertLibraries:options:error:", a3, a4, 0, a5);
}

- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(a4, "count"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(a4);
        objc_msgSend(v11, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v15++), "baseObject"));
      }
      while (v13 != v15);
      v13 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v13);
  }
  v16 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "loadDynamicLibrariesForFunction:insertLibraries:options:error:", objc_msgSend(a3, "baseObject"), v11, a5, a6);

  if (!v16)
    return 0;
  v17 = (void *)objc_opt_new();
  v18 = (void *)MEMORY[0x22E309364]();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v16);
        objc_msgSend(v17, "addObject:", -[MTLToolsDevice getDynamicLibraryForBaseObject:](self, "getDynamicLibraryForBaseObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v22++)));
      }
      while (v20 != v22);
      v20 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v20);
  }
  objc_autoreleasePoolPop(v18);

  return v17;
}

- (id)unwrapMTLDynamicLibraryDescriptorSPI:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v4, "setLibrary:", objc_msgSend((id)objc_msgSend(a3, "library"), "baseObject"));
  return v4;
}

- (BOOL)validateDynamicLibrary:(id)a3 state:(BOOL)a4 error:(id *)a5
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "validateDynamicLibrary:state:error:", a3, a4, a5);
}

- (BOOL)validateDynamicLibraryURL:(id)a3 error:(id *)a4
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "validateDynamicLibraryURL:error:", a3, a4);
}

- (BOOL)areGPUAssertionsEnabled
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "areGPUAssertionsEnabled");
}

- (void)setGPUAssertionsEnabled:(BOOL)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setGPUAssertionsEnabled:", a3);
}

- (BOOL)areWritableHeapsEnabled
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "areWritableHeapsEnabled");
}

- (void)setWritableHeapsEnabled:(BOOL)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setWritableHeapsEnabled:", a3);
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 gpuAddress:(unint64_t)a5
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithLength:options:gpuAddress:", a3, a4, a5);
}

- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 gpuAddress:(unint64_t)a6
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithBytes:length:options:gpuAddress:", a3, a4, a5, a6);
}

- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 gpuAddress:(unint64_t)a6 deallocator:(id)a7
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithBytesNoCopy:length:options:gpuAddress:deallocator:", a3, a4, a5, a6, a7);
}

- (BOOL)reserveGPUAddressRange:(_NSRange)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "reserveGPUAddressRange:", a3.location, a3.length);
}

- (id)newBufferWithDescriptor:(id)a3
{
  id result;
  id v5;
  MTLToolsBuffer *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithDescriptor:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsBuffer alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

+ (id)newTextureDescriptorFromIOSurfaceProperties:(id)a3
{
  id v4;

  if (!a3)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x24BDDD740]);
  objc_msgSend(v4, "setTextureType:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDDDAB0]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setPixelFormat:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDDDA88]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setWidth:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDDDAC0]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setHeight:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDDDA78]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setDepth:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDDDA68]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setMipmapLevelCount:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDDDA80]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setSampleCount:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDDDA98]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setArrayLength:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDDDA60]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setResourceOptions:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDDDA90]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setUsage:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDDDAB8]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setSparseSurfaceDefaultValue:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDDDAA0]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setAllowGPUOptimizedContents:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDDDA70]), "BOOLValue"));
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDDDAA8]), "unsignedIntegerValue");
  objc_msgSend(v4, "setSwizzle:", MTLTextureSwizzleKeyToChannels());
  return v4;
}

+ (id)newTextureDescriptorFromIOSurface:(__IOSurface *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)IOSurfaceCopyValue(a3, (CFStringRef)*MEMORY[0x24BDD8E90]);
  v5 = (void *)objc_msgSend(a1, "newTextureDescriptorFromIOSurfaceProperties:", v4);

  return v5;
}

- (id)newSharedTextureWithDescriptor:(id)a3
{
  id result;
  id v5;
  MTLToolsTexture *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedTextureWithDescriptor:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsTexture alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (id)newSharedTextureWithHandle:(id)a3
{
  id result;
  id v5;
  MTLToolsTexture *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedTextureWithHandle:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsTexture alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (id)copyIOSurfaceSharedTextureProperties:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyIOSurfaceSharedTextureProperties:", a3);
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)maxThreadsPerThreadgroup
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;

  result = -[MTLToolsObject baseObject](self, "baseObject");
  if (result)
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)-[$F99D9A4FB75BC57F3386B8DC8EE08D7A maxThreadsPerThreadgroup](result, "maxThreadsPerThreadgroup");
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return result;
}

- (BOOL)isLowPower
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isLowPower");
}

- (BOOL)isHeadless
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isHeadless");
}

- (BOOL)isRemovable
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isRemovable");
}

- (BOOL)hasUnifiedMemory
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "hasUnifiedMemory");
}

- (unint64_t)recommendedMaxWorkingSetSize
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "recommendedMaxWorkingSetSize");
}

- (unint64_t)sharedMemorySize
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sharedMemorySize");
}

- (unint64_t)dedicatedMemorySize
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "dedicatedMemorySize");
}

- (unint64_t)bufferRobustnessSupport
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "bufferRobustnessSupport");
}

- (BOOL)isDepth24Stencil8PixelFormatSupported
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isDepth24Stencil8PixelFormatSupported");
}

- (void)unloadShaderCaches
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "unloadShaderCaches");
}

- ($85CD2974BE96D4886BB301820D1C36C2)libraryCacheStats
{
  return ($85CD2974BE96D4886BB301820D1C36C2)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "libraryCacheStats");
}

- ($85CD2974BE96D4886BB301820D1C36C2)pipelineCacheStats
{
  return ($85CD2974BE96D4886BB301820D1C36C2)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "pipelineCacheStats");
}

- (BOOL)copyShaderCacheToPath:(id)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyShaderCacheToPath:", a3);
}

- (void)getShaderCacheKeys
{
  return (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getShaderCacheKeys");
}

- (void)compilerPropagatesThreadPriority:(BOOL)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "compilerPropagatesThreadPriority:", a3);
}

- (id)newCommandQueue
{
  id result;
  id v4;
  MTLToolsCommandQueue *v5;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCommandQueue");
  if (result)
  {
    v4 = result;
    v5 = -[MTLToolsCommandQueue initWithBaseObject:parent:]([MTLToolsCommandQueue alloc], "initWithBaseObject:parent:", result, self);

    return v5;
  }
  return result;
}

- (id)newCommandQueueWithMaxCommandBufferCount:(unint64_t)a3
{
  id result;
  id v5;
  MTLToolsCommandQueue *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCommandQueueWithMaxCommandBufferCount:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsCommandQueue initWithBaseObject:parent:]([MTLToolsCommandQueue alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (id)newCommandQueueWithDescriptor:(id)a3
{
  id result;
  id v5;
  MTLToolsCommandQueue *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCommandQueueWithDescriptor:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsCommandQueue initWithBaseObject:parent:]([MTLToolsCommandQueue alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  id result;
  id v6;
  MTLToolsBuffer *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithLength:options:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsBuffer alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  id result;
  id v7;
  MTLToolsBuffer *v8;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithBytes:length:options:", a3, a4, a5);
  if (result)
  {
    v7 = result;
    v8 = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsBuffer alloc], "initWithBaseObject:parent:", result, self);

    return v8;
  }
  return result;
}

- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 deallocator:(id)a6
{
  id result;
  id v8;
  MTLToolsBuffer *v9;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithBytesNoCopy:length:options:deallocator:", a3, a4, a5, a6);
  if (result)
  {
    v8 = result;
    v9 = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsBuffer alloc], "initWithBaseObject:parent:", result, self);

    return v9;
  }
  return result;
}

- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCount:(unint64_t)a4 options:(unint64_t)a5
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIndirectCommandBufferWithDescriptor:maxCount:options:", a3, a4, a5);
}

- (id)newIndirectRenderCommandEncoderWithBuffer:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIndirectRenderCommandEncoderWithBuffer:", a3);
}

- (id)newIndirectComputeCommandEncoderWithBuffer:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIndirectComputeCommandEncoderWithBuffer:", a3);
}

- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCommandCount:(unint64_t)a4 options:(unint64_t)a5
{
  id result;
  id v7;
  MTLToolsIndirectCommandBuffer *v8;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIndirectCommandBufferWithDescriptor:maxCommandCount:options:", a3, a4, a5);
  if (result)
  {
    v7 = result;
    v8 = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsIndirectCommandBuffer alloc], "initWithBaseObject:parent:", result, self);

    return v8;
  }
  return result;
}

- (id)newTextureWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 descriptor:(id)a5 deallocator:(id)a6
{
  id result;
  id v8;
  MTLToolsTexture *v9;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithBytesNoCopy:length:descriptor:deallocator:", a3, a4, a5, a6);
  if (result)
  {
    v8 = result;
    v9 = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsTexture alloc], "initWithBaseObject:parent:", result, self);

    return v9;
  }
  return result;
}

- (id)newDepthStencilStateWithDescriptor:(id)a3
{
  void *v5;
  id v6;

  v5 = (void *)-[MTLToolsObject newDepthStencilStateWithDescriptor:](self->super._baseObject, "newDepthStencilStateWithDescriptor:");
  v6 = -[MTLToolsDevice getDepthStencilStateForBaseObject:descriptor:](self, "getDepthStencilStateForBaseObject:descriptor:", v5, a3);

  return v6;
}

- (id)newTextureWithDescriptor:(id)a3
{
  id result;
  id v5;
  MTLToolsTexture *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsTexture alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (id)newSamplerStateWithDescriptor:(id)a3
{
  void *v5;
  id v6;

  v5 = (void *)-[MTLToolsObject newSamplerStateWithDescriptor:](self->super._baseObject, "newSamplerStateWithDescriptor:");
  v6 = -[MTLToolsDevice getSamplerStateForBaseObject:descriptor:](self, "getSamplerStateForBaseObject:descriptor:", v5, a3);

  return v6;
}

- (id)newDefaultLibrary
{
  id result;
  id v4;
  MTLToolsLibrary *v5;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDefaultLibrary");
  if (result)
  {
    v4 = result;
    v5 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsLibrary alloc], "initWithBaseObject:parent:", result, self);

    return v5;
  }
  return result;
}

- (id)newDefaultLibraryWithBundle:(id)a3 error:(id *)a4
{
  id result;
  id v6;
  MTLToolsLibrary *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDefaultLibraryWithBundle:error:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsLibrary alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)newLibraryWithFile:(id)a3 error:(id *)a4
{
  id result;
  id v6;
  MTLToolsLibrary *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithFile:error:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsLibrary alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)newLibraryWithURL:(id)a3 error:(id *)a4
{
  id result;
  id v6;
  MTLToolsLibrary *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithURL:error:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsLibrary alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)newLibraryWithSource:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v6;
  void *v7;
  MTLToolsObjectCache *sourceLibraryObjectCache;
  id v9;
  _QWORD v11[6];

  v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithSource:options:error:", a3, -[MTLToolsDevice unwrapMTLCompileOptions:](self, "unwrapMTLCompileOptions:", a4), a5);
  if (!v6)
    return 0;
  v7 = (void *)v6;
  sourceLibraryObjectCache = self->sourceLibraryObjectCache;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__MTLToolsDevice_newLibraryWithSource_options_error___block_invoke;
  v11[3] = &unk_24F794780;
  v11[4] = v7;
  v11[5] = self;
  v9 = -[MTLToolsObjectCache getCachedObjectForKey:onMiss:](sourceLibraryObjectCache, "getCachedObjectForKey:onMiss:", v7, v11);

  return v9;
}

MTLToolsLibrary *__53__MTLToolsDevice_newLibraryWithSource_options_error___block_invoke(uint64_t a1)
{
  return -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsLibrary alloc], "initWithBaseObject:parent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)newLibraryWithData:(id)a3 error:(id *)a4
{
  id result;
  id v6;
  MTLToolsLibrary *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithData:error:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsLibrary alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (void)startCollectingPipelineDescriptors
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "startCollectingPipelineDescriptors");
}

- (id)endCollectingPipelineDescriptors
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endCollectingPipelineDescriptors");
}

- (id)newPipelineLibraryWithFilePath:(id)a3 error:(id *)a4
{
  id result;
  id v6;
  MTLToolsPipelineLibrary *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newPipelineLibraryWithFilePath:error:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsPipelineLibrary alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)serializeRenderPipelineDescriptor:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "serializeRenderPipelineDescriptor:", a3);
}

- (id)newRenderPipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineDescriptorWithSerializedData:deserializationContext:", a3, a4);
}

- (id)newComputePipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineDescriptorWithSerializedData:deserializationContext:", a3, a4);
}

- (id)serializeStructType:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "serializeStructType:", a3);
}

- (id)newStructTypeWithSerializedData:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newStructTypeWithSerializedData:", a3);
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapTextureSizeAndAlignWithDescriptor:(id)a3
{
  unint64_t v3;
  unint64_t v4;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v3 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heapTextureSizeAndAlignWithDescriptor:", a3);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapBufferSizeAndAlignWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  unint64_t v4;
  unint64_t v5;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heapBufferSizeAndAlignWithLength:options:", a3, a4);
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (id)newHeapWithDescriptor:(id)a3
{
  id result;
  id v5;
  MTLToolsHeap *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newHeapWithDescriptor:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsHeap alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (id)newFence
{
  id result;
  id v4;
  MTLToolsFence *v5;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFence");
  if (result)
  {
    v4 = result;
    v5 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsFence alloc], "initWithBaseObject:parent:", result, self);

    return v5;
  }
  return result;
}

- (IndirectArgumentBufferCapabilities)indirectArgumentBufferCapabilities
{
  return (IndirectArgumentBufferCapabilities)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "indirectArgumentBufferCapabilities");
}

- (NSDictionary)pluginData
{
  return (NSDictionary *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "pluginData");
}

- (void)setPluginData:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setPluginData:", a3);
}

- (id)newIndirectArgumentBufferLayoutWithStructType:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIndirectArgumentBufferLayoutWithStructType:", a3);
}

- (id)newIndirectArgumentEncoderWithLayout:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIndirectArgumentEncoderWithLayout:", a3);
}

- (id)newArgumentEncoderWithLayout:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithLayout:", a3);
}

- (id)newArgumentEncoderWithArguments:(id)a3
{
  id result;
  id v5;
  MTLToolsArgumentEncoder *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithArguments:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsArgumentEncoder alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (id)newArgumentEncoderWithArguments:(id)a3 structType:(id *)a4
{
  id result;
  id v6;
  MTLToolsArgumentEncoder *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithArguments:structType:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsArgumentEncoder alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (unint64_t)maxThreadgroupMemoryLength
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxThreadgroupMemoryLength");
}

- (unint64_t)maxArgumentBufferSamplerCount
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxArgumentBufferSamplerCount");
}

- (id)unwrapMTLRenderPipelineDescriptor:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v4, "setVertexFunction:", objc_msgSend((id)objc_msgSend(v4, "vertexFunction"), "baseObject"));
  objc_msgSend(v4, "setFragmentFunction:", objc_msgSend((id)objc_msgSend(v4, "fragmentFunction"), "baseObject"));
  objc_msgSend(v4, "setPipelineLibrary:", objc_msgSend((id)objc_msgSend(v4, "pipelineLibrary"), "baseObject"));
  objc_msgSend(v4, "setVertexLinkedFunctions:", unwrapLinkedFunctions((MTLLinkedFunctions *)objc_msgSend(a3, "vertexLinkedFunctions")));
  objc_msgSend(v4, "setFragmentLinkedFunctions:", unwrapLinkedFunctions((MTLLinkedFunctions *)objc_msgSend(a3, "fragmentLinkedFunctions")));
  objc_msgSend(v4, "setMeshLinkedFunctions:", unwrapLinkedFunctions((MTLLinkedFunctions *)objc_msgSend(a3, "meshLinkedFunctions")));
  objc_msgSend(v4, "setObjectLinkedFunctions:", unwrapLinkedFunctions((MTLLinkedFunctions *)objc_msgSend(a3, "objectLinkedFunctions")));
  objc_msgSend(v4, "setBinaryArchives:", unwrapArray((NSArray *)objc_msgSend(a3, "binaryArchives")));
  objc_msgSend(v4, "setVertexPreloadedLibraries:", unwrapArray((NSArray *)objc_msgSend(a3, "vertexPreloadedLibraries")));
  objc_msgSend(v4, "setFragmentPreloadedLibraries:", unwrapArray((NSArray *)objc_msgSend(a3, "fragmentPreloadedLibraries")));
  objc_msgSend(v4, "setObjectFunction:", objc_msgSend((id)objc_msgSend(a3, "objectFunction"), "baseObject"));
  objc_msgSend(v4, "setMeshFunction:", objc_msgSend((id)objc_msgSend(a3, "meshFunction"), "baseObject"));
  objc_msgSend(v4, "setObjectPreloadedLibraries:", unwrapArray((NSArray *)objc_msgSend(a3, "objectPreloadedLibraries")));
  objc_msgSend(v4, "setMeshPreloadedLibraries:", unwrapArray((NSArray *)objc_msgSend(a3, "meshPreloadedLibraries")));
  return v4;
}

- (unint64_t)debugPipelineOptions:(unint64_t)a3 includePipelinePerfStats:(BOOL)a4
{
  uint64_t v4;

  if ((a3 & 4) == 0 && a4)
    v4 = 8716291;
  else
    v4 = 8454147;
  return v4 | a3;
}

- (id)unwrapMTLComputePipelineDescriptor:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v4, "setComputeFunction:", objc_msgSend((id)objc_msgSend(v4, "computeFunction"), "baseObject"));
  objc_msgSend(v4, "setPipelineLibrary:", objc_msgSend((id)objc_msgSend(v4, "pipelineLibrary"), "baseObject"));
  objc_msgSend(v4, "setLinkedFunctions:", unwrapLinkedFunctions((MTLLinkedFunctions *)objc_msgSend(a3, "linkedFunctions")));
  objc_msgSend(v4, "setFunctionPointers:", unwrapArray((NSArray *)objc_msgSend(a3, "functionPointers")));
  objc_msgSend(v4, "setPreloadedLibraries:", unwrapArray((NSArray *)objc_msgSend(a3, "preloadedLibraries")));
  objc_msgSend(v4, "setBinaryArchives:", unwrapArray((NSArray *)objc_msgSend(a3, "binaryArchives")));
  return v4;
}

- (id)unwrapMTLTileRenderPipelineDescriptor:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v4, "setTileFunction:", objc_msgSend((id)objc_msgSend(v4, "tileFunction"), "baseObject"));
  objc_msgSend(v4, "setLinkedFunctions:", unwrapLinkedFunctions((MTLLinkedFunctions *)objc_msgSend(a3, "linkedFunctions")));
  objc_msgSend(v4, "setPreloadedLibraries:", unwrapArray((NSArray *)objc_msgSend(a3, "preloadedLibraries")));
  objc_msgSend(v4, "setBinaryArchives:", unwrapArray((NSArray *)objc_msgSend(v4, "binaryArchives")));
  return v4;
}

- (id)unwrapMTLMeshRenderPipelineDescriptor:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v4, "setObjectFunction:", objc_msgSend((id)objc_msgSend(a3, "objectFunction"), "baseObject"));
  objc_msgSend(v4, "setMeshFunction:", objc_msgSend((id)objc_msgSend(a3, "meshFunction"), "baseObject"));
  objc_msgSend(v4, "setFragmentFunction:", objc_msgSend((id)objc_msgSend(a3, "fragmentFunction"), "baseObject"));
  objc_msgSend(v4, "setPipelineLibrary:", objc_msgSend((id)objc_msgSend(a3, "pipelineLibrary"), "baseObject"));
  objc_msgSend(v4, "setBinaryArchives:", unwrapArray((NSArray *)objc_msgSend(a3, "binaryArchives")));
  objc_msgSend(v4, "setObjectPreloadedLibraries:", unwrapArray((NSArray *)objc_msgSend(a3, "objectPreloadedLibraries")));
  objc_msgSend(v4, "setMeshPreloadedLibraries:", unwrapArray((NSArray *)objc_msgSend(a3, "meshPreloadedLibraries")));
  objc_msgSend(v4, "setFragmentPreloadedLibraries:", unwrapArray((NSArray *)objc_msgSend(a3, "fragmentPreloadedLibraries")));
  objc_msgSend(v4, "setObjectLinkedFunctions:", unwrapLinkedFunctions((MTLLinkedFunctions *)objc_msgSend(a3, "objectLinkedFunctions")));
  objc_msgSend(v4, "setMeshLinkedFunctions:", unwrapLinkedFunctions((MTLLinkedFunctions *)objc_msgSend(a3, "meshLinkedFunctions")));
  objc_msgSend(v4, "setFragmentLinkedFunctions:", unwrapLinkedFunctions((MTLLinkedFunctions *)objc_msgSend(a3, "fragmentLinkedFunctions")));
  return v4;
}

- (id)unwrapMTLCompileOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(a3, "copy");
  v4 = (void *)objc_msgSend(v3, "libraries");
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v5);
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "baseObject"));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setLibraries:", v6);
  }
  return v3;
}

- (id)unwrapMTLStitchedLibraryDescriptor:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v4, "setFunctions:", unwrapArray((NSArray *)objc_msgSend(a3, "functions")));
  objc_msgSend(v4, "setBinaryArchives:", unwrapArray((NSArray *)objc_msgSend(a3, "binaryArchives")));
  return v4;
}

- (id)unwrapMTLRelocations:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDD4F0]), "initWithSymbolName:buffer:offset:", objc_msgSend(v9, "symbolName"), objc_msgSend((id)objc_msgSend(v9, "buffer"), "baseObject"), objc_msgSend(v9, "offset"));
          objc_msgSend(v4, "addObject:", v10);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v4, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  return v4;
}

- (id)unwrapMTLFunctionDescriptor:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v4, "setBinaryArchives:", unwrapArray((NSArray *)objc_msgSend(a3, "binaryArchives")));
  objc_msgSend(v4, "setPrivateFunctions:", unwrapArray((NSArray *)objc_msgSend(a3, "privateFunctions")));
  return v4;
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  id result;
  id v6;
  MTLToolsRenderPipelineState *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithDescriptor:error:", -[MTLToolsDevice unwrapMTLRenderPipelineDescriptor:](self, "unwrapMTLRenderPipelineDescriptor:", a3), a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:]([MTLToolsRenderPipelineState alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id result;
  id v8;
  MTLToolsRenderPipelineState *v9;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithDescriptor:options:reflection:error:", -[MTLToolsDevice unwrapMTLRenderPipelineDescriptor:](self, "unwrapMTLRenderPipelineDescriptor:", a3), a4, a5, a6);
  if (result)
  {
    v8 = result;
    v9 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:]([MTLToolsRenderPipelineState alloc], "initWithBaseObject:parent:", result, self);

    return v9;
  }
  return result;
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[6];

  v8 = -[MTLToolsDevice unwrapMTLRenderPipelineDescriptor:](self, "unwrapMTLRenderPipelineDescriptor:", a3);
  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __81__MTLToolsDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v10[3] = &unk_24F7947A8;
  v10[4] = self;
  v10[5] = a5;
  objc_msgSend(v9, "newRenderPipelineStateWithDescriptor:options:completionHandler:", v8, a4, v10);
}

void __81__MTLToolsDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1, MTLToolsRenderPipelineState *a2)
{
  MTLToolsRenderPipelineState *v3;

  if (a2)
    a2 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:]([MTLToolsRenderPipelineState alloc], "initWithBaseObject:parent:", a2, *(_QWORD *)(a1 + 32));
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[6];

  v6 = -[MTLToolsDevice unwrapMTLRenderPipelineDescriptor:](self, "unwrapMTLRenderPipelineDescriptor:", a3);
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__MTLToolsDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_24F7947D0;
  v8[4] = self;
  v8[5] = a4;
  objc_msgSend(v7, "newRenderPipelineStateWithDescriptor:completionHandler:", v6, v8);
}

void __73__MTLToolsDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1, MTLToolsRenderPipelineState *a2)
{
  MTLToolsRenderPipelineState *v3;

  if (a2)
    a2 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:]([MTLToolsRenderPipelineState alloc], "initWithBaseObject:parent:", a2, *(_QWORD *)(a1 + 32));
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  id result;
  id v6;
  MTLToolsComputePipelineState *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithDescriptor:error:", -[MTLToolsDevice unwrapMTLComputePipelineDescriptor:](self, "unwrapMTLComputePipelineDescriptor:", a3), a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsComputePipelineState alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  void *v7;
  MTLToolsComputePipelineState *v8;

  v7 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithDescriptor:options:reflection:error:", -[MTLToolsDevice unwrapMTLComputePipelineDescriptor:](self, "unwrapMTLComputePipelineDescriptor:", a3), a4, a5, a6);
  v8 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsComputePipelineState alloc], "initWithBaseObject:parent:", v7, self);

  return v8;
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[6];

  v6 = -[MTLToolsDevice unwrapMTLComputePipelineDescriptor:](self, "unwrapMTLComputePipelineDescriptor:", a3);
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__MTLToolsDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_24F7947F8;
  v8[4] = self;
  v8[5] = a4;
  objc_msgSend(v7, "newComputePipelineStateWithDescriptor:completionHandler:", v6, v8);
}

void __74__MTLToolsDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1, MTLToolsComputePipelineState *a2)
{
  MTLToolsComputePipelineState *v3;

  if (a2)
    a2 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsComputePipelineState alloc], "initWithBaseObject:parent:", a2, *(_QWORD *)(a1 + 32));
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v9;
  uint64_t v10;
  _QWORD v11[6];

  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  v10 = objc_msgSend(a3, "baseObject");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __82__MTLToolsDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v11[3] = &unk_24F794820;
  v11[4] = self;
  v11[5] = a5;
  objc_msgSend(v9, "newComputePipelineStateWithDescriptor:options:completionHandler:", v10, a4, v11);
}

void __82__MTLToolsDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1, MTLToolsComputePipelineState *a2)
{
  MTLToolsComputePipelineState *v3;

  if (a2)
    a2 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsComputePipelineState alloc], "initWithBaseObject:parent:", a2, *(_QWORD *)(a1 + 32));
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)newComputePipelineStateWithFunction:(id)a3 error:(id *)a4
{
  void *v5;
  MTLToolsComputePipelineState *v6;

  v5 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithFunction:error:", objc_msgSend(a3, "baseObject"), a4);
  v6 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsComputePipelineState alloc], "initWithBaseObject:parent:", v5, self);

  return v6;
}

- (id)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  void *v7;
  MTLToolsComputePipelineState *v8;

  v7 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithFunction:options:reflection:error:", objc_msgSend(a3, "baseObject"), a4, a5, a6);
  v8 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsComputePipelineState alloc], "initWithBaseObject:parent:", v7, self);

  return v8;
}

- (void)newComputePipelineStateWithFunction:(id)a3 completionHandler:(id)a4
{
  id v7;
  uint64_t v8;
  _QWORD v9[6];

  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  v8 = objc_msgSend(a3, "baseObject");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__MTLToolsDevice_newComputePipelineStateWithFunction_completionHandler___block_invoke;
  v9[3] = &unk_24F7947F8;
  v9[4] = self;
  v9[5] = a4;
  objc_msgSend(v7, "newComputePipelineStateWithFunction:completionHandler:", v8, v9);
}

void __72__MTLToolsDevice_newComputePipelineStateWithFunction_completionHandler___block_invoke(uint64_t a1, MTLToolsComputePipelineState *a2)
{
  MTLToolsComputePipelineState *v3;

  if (a2)
    a2 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsComputePipelineState alloc], "initWithBaseObject:parent:", a2, *(_QWORD *)(a1 + 32));
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v9;
  uint64_t v10;
  _QWORD v11[6];

  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  v10 = objc_msgSend(a3, "baseObject");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__MTLToolsDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke;
  v11[3] = &unk_24F794820;
  v11[4] = self;
  v11[5] = a5;
  objc_msgSend(v9, "newComputePipelineStateWithFunction:options:completionHandler:", v10, a4, v11);
}

void __80__MTLToolsDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke(uint64_t a1, MTLToolsComputePipelineState *a2)
{
  MTLToolsComputePipelineState *v3;

  if (a2)
    a2 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsComputePipelineState alloc], "initWithBaseObject:parent:", a2, *(_QWORD *)(a1 + 32));
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 error:(id *)a4
{
  id result;
  id v6;
  MTLToolsRenderPipelineState *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithTileDescriptor:error:", -[MTLToolsDevice unwrapMTLTileRenderPipelineDescriptor:](self, "unwrapMTLTileRenderPipelineDescriptor:", a3), a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:]([MTLToolsRenderPipelineState alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id result;
  id v8;
  MTLToolsRenderPipelineState *v9;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithTileDescriptor:options:reflection:error:", -[MTLToolsDevice unwrapMTLTileRenderPipelineDescriptor:](self, "unwrapMTLTileRenderPipelineDescriptor:", a3), a4, a5, a6);
  if (result)
  {
    v8 = result;
    v9 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:]([MTLToolsRenderPipelineState alloc], "initWithBaseObject:parent:", result, self);

    return v9;
  }
  return result;
}

- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[6];

  v6 = -[MTLToolsDevice unwrapMTLTileRenderPipelineDescriptor:](self, "unwrapMTLTileRenderPipelineDescriptor:", a3);
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __77__MTLToolsDevice_newRenderPipelineStateWithTileDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_24F7947D0;
  v8[4] = self;
  v8[5] = a4;
  objc_msgSend(v7, "newRenderPipelineStateWithTileDescriptor:completionHandler:", v6, v8);
}

void __77__MTLToolsDevice_newRenderPipelineStateWithTileDescriptor_completionHandler___block_invoke(uint64_t a1, MTLToolsRenderPipelineState *a2)
{
  MTLToolsRenderPipelineState *v3;

  if (a2)
    a2 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:]([MTLToolsRenderPipelineState alloc], "initWithBaseObject:parent:", a2, *(_QWORD *)(a1 + 32));
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[6];

  v8 = -[MTLToolsDevice unwrapMTLTileRenderPipelineDescriptor:](self, "unwrapMTLTileRenderPipelineDescriptor:", a3);
  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __85__MTLToolsDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke;
  v10[3] = &unk_24F7947A8;
  v10[4] = self;
  v10[5] = a5;
  objc_msgSend(v9, "newRenderPipelineStateWithTileDescriptor:options:completionHandler:", v8, a4, v10);
}

void __85__MTLToolsDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke(uint64_t a1, MTLToolsRenderPipelineState *a2)
{
  MTLToolsRenderPipelineState *v3;

  if (a2)
    a2 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:]([MTLToolsRenderPipelineState alloc], "initWithBaseObject:parent:", a2, *(_QWORD *)(a1 + 32));
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 error:(id *)a4
{
  id result;
  id v6;
  MTLToolsRenderPipelineState *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithMeshDescriptor:error:", -[MTLToolsDevice unwrapMTLMeshRenderPipelineDescriptor:](self, "unwrapMTLMeshRenderPipelineDescriptor:", a3), a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:]([MTLToolsRenderPipelineState alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id result;
  id v8;
  MTLToolsRenderPipelineState *v9;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithMeshDescriptor:options:reflection:error:", -[MTLToolsDevice unwrapMTLMeshRenderPipelineDescriptor:](self, "unwrapMTLMeshRenderPipelineDescriptor:", a3), a4, a5, a6);
  if (result)
  {
    v8 = result;
    v9 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:]([MTLToolsRenderPipelineState alloc], "initWithBaseObject:parent:", result, self);

    return v9;
  }
  return result;
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[6];

  v8 = -[MTLToolsDevice unwrapMTLMeshRenderPipelineDescriptor:](self, "unwrapMTLMeshRenderPipelineDescriptor:", a3);
  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __85__MTLToolsDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke;
  v10[3] = &unk_24F7947A8;
  v10[4] = self;
  v10[5] = a5;
  objc_msgSend(v9, "newRenderPipelineStateWithMeshDescriptor:options:completionHandler:", v8, a4, v10);
}

void __85__MTLToolsDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke(uint64_t a1, MTLToolsRenderPipelineState *a2)
{
  MTLToolsRenderPipelineState *v3;

  if (a2)
    a2 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:]([MTLToolsRenderPipelineState alloc], "initWithBaseObject:parent:", a2, *(_QWORD *)(a1 + 32));
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[6];

  v6 = -[MTLToolsDevice unwrapMTLMeshRenderPipelineDescriptor:](self, "unwrapMTLMeshRenderPipelineDescriptor:", a3);
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __77__MTLToolsDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_24F7947D0;
  v8[4] = self;
  v8[5] = a4;
  objc_msgSend(v7, "newRenderPipelineStateWithMeshDescriptor:completionHandler:", v6, v8);
}

void __77__MTLToolsDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler___block_invoke(uint64_t a1, MTLToolsRenderPipelineState *a2)
{
  MTLToolsRenderPipelineState *v3;

  if (a2)
    a2 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:]([MTLToolsRenderPipelineState alloc], "initWithBaseObject:parent:", a2, *(_QWORD *)(a1 + 32));
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)newComputePipelineStateWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = -[MTLToolsDevice newLibraryWithImageFilterFunctionsSPI:imageFilterFunctionInfo:error:](self, "newLibraryWithImageFilterFunctionsSPI:imageFilterFunctionInfo:error:", a3, a4);
  v8 = (void *)objc_msgSend(v7, "newFunctionWithName:", CFSTR("ciKernelMain"));
  v9 = -[MTLToolsDevice newComputePipelineStateWithFunction:error:](self, "newComputePipelineStateWithFunction:error:", v8, a5);

  return v9;
}

- (id)newLibraryWithDAG:(id)a3 functions:(id)a4 error:(id *)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  MTLToolsLibrary *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(a4);
        objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13++), "baseObject"));
      }
      while (v11 != v13);
      v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }
  v14 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithDAG:functions:error:", a3, v9, a5);

  if (!v14)
    return 0;
  v15 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsLibrary alloc], "initWithBaseObject:parent:", v14, self);

  return v15;
}

- (id)newLibraryWithStitchedDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  MTLToolsLibrary *v8;

  v6 = -[MTLToolsDevice unwrapMTLStitchedLibraryDescriptor:](self, "unwrapMTLStitchedLibraryDescriptor:", a3);
  v7 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithStitchedDescriptor:error:", v6, a4);

  if (!v7)
    return 0;
  v8 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsLibrary alloc], "initWithBaseObject:parent:", v7, self);

  return v8;
}

- (void)newLibraryWithStitchedDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[7];

  v6 = -[MTLToolsDevice unwrapMTLStitchedLibraryDescriptor:](self, "unwrapMTLStitchedLibraryDescriptor:", a3);
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__MTLToolsDevice_newLibraryWithStitchedDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_24F794848;
  v8[4] = v6;
  v8[5] = self;
  v8[6] = a4;
  objc_msgSend(v7, "newLibraryWithStitchedDescriptor:completionHandler:", v6, v8);
}

void __69__MTLToolsDevice_newLibraryWithStitchedDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  MTLToolsLibrary *v4;
  MTLToolsLibrary *v5;

  if (a2)
    v4 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsLibrary alloc], "initWithBaseObject:parent:", a2, *(_QWORD *)(a1 + 40));
  else
    v4 = 0;
  v5 = v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)newLibraryWithStitchedDescriptorSPI:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  MTLToolsLibrary *v8;

  v6 = -[MTLToolsDevice unwrapMTLStitchedLibraryDescriptor:](self, "unwrapMTLStitchedLibraryDescriptor:", a3);
  v7 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithStitchedDescriptorSPI:error:", v6, a4);

  if (!v7)
    return 0;
  v8 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsLibrary alloc], "initWithBaseObject:parent:", v7, self);

  return v8;
}

- (id)newDagStringWithGraphs:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDagStringWithGraphs:", a3);
}

- (id)newLibraryWithCIFilters:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  MTLToolsLibrary *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
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
  v14 = objc_msgSend(-[MTLToolsObject originalObject](self, "originalObject"), "newLibraryWithCIFilters:imageFilterFunctionInfo:error:", v9, a4, a5);
  if (v14)
  {
    v15 = (void *)v14;
    v16 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsLibrary alloc], "initWithBaseObject:parent:", v14, self);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)newLibraryWithSource:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[6];

  v8 = -[MTLToolsDevice unwrapMTLCompileOptions:](self, "unwrapMTLCompileOptions:", a4);
  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__MTLToolsDevice_newLibraryWithSource_options_completionHandler___block_invoke;
  v10[3] = &unk_24F794870;
  v10[4] = self;
  v10[5] = a5;
  objc_msgSend(v9, "newLibraryWithSource:options:completionHandler:", a3, v8, v10);
}

void __65__MTLToolsDevice_newLibraryWithSource_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[6];

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__MTLToolsDevice_newLibraryWithSource_options_completionHandler___block_invoke_2;
  v6[3] = &unk_24F794780;
  v6[4] = a2;
  v6[5] = v3;
  v5 = (void *)objc_msgSend(v4, "getCachedObjectForKey:onMiss:", a2, v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

MTLToolsLibrary *__65__MTLToolsDevice_newLibraryWithSource_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsLibrary alloc], "initWithBaseObject:parent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)deviceSupportsFeatureSet:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deviceSupportsFeatureSet:", a3);
}

- (BOOL)deviceOrFeatureProfileSupportsFeatureSet:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deviceOrFeatureProfileSupportsFeatureSet:", a3);
}

- (BOOL)supportsFeatureSet:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsFeatureSet:", a3);
}

- (BOOL)supportsFamily:(int64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsFamily:", a3);
}

- (BOOL)supportsTextureSampleCount:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsTextureSampleCount:", a3);
}

- (BOOL)supportsSampleCount:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsSampleCount:", a3);
}

- (unint64_t)minLinearTextureAlignmentForPixelFormat:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "minLinearTextureAlignmentForPixelFormat:", a3);
}

- (unint64_t)minimumLinearTextureAlignmentForPixelFormat:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "minimumLinearTextureAlignmentForPixelFormat:", a3);
}

- (unint64_t)minimumTextureBufferAlignmentForPixelFormat:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "minimumTextureBufferAlignmentForPixelFormat:", a3);
}

- (BOOL)areProgrammableSamplePositionsSupported
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "areProgrammableSamplePositionsSupported");
}

- (void)getDefaultSamplePositions:(id *)a3 count:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getDefaultSamplePositions:count:", a3, a4);
}

- (BOOL)supportsRasterizationRateMapWithLayerCount:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRasterizationRateMapWithLayerCount:", a3);
}

- (id)newRasterizationRateMapWithDescriptor:(id)a3
{
  id result;
  id v5;
  MTLToolsRasterizationRateMap *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRasterizationRateMapWithDescriptor:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsRasterizationRateMap alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (unint64_t)maxRasterizationRateLayerCount
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxRasterizationRateLayerCount");
}

- (void)_setDeviceWrapper:(id)a3
{
  objc_storeWeak((id *)&self->_deviceWrapper, a3);
}

- (id)_deviceWrapper
{
  MTLDeviceSPI **p_deviceWrapper;

  p_deviceWrapper = &self->_deviceWrapper;
  if (objc_loadWeak((id *)&self->_deviceWrapper))
    return (id)objc_msgSend(objc_loadWeak((id *)p_deviceWrapper), "_deviceWrapper");
  else
    return self;
}

- (id)newBufferWithIOSurface:(__IOSurface *)a3
{
  id result;
  id v5;
  MTLToolsBuffer *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithIOSurface:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsBuffer alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (unint64_t)resourcePatchingTypeForResourceType:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resourcePatchingTypeForResourceType:", a3);
}

- (void)reserveResourceIndicesForResourceType:(unint64_t)a3 indices:(unint64_t *)a4 indexCount:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "reserveResourceIndicesForResourceType:indices:indexCount:", a3, a4, a5);
}

- (unint64_t)halfFPConfig
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "halfFPConfig");
}

- (unint64_t)singleFPConfig
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "singleFPConfig");
}

- (unint64_t)doubleFPConfig
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "doubleFPConfig");
}

- (unint64_t)featureProfile
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "featureProfile");
}

- (const)limits
{
  return (const $8F4FC51FDE2459731A28129D66393995 *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "limits");
}

- (unsigned)acceleratorPort
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "acceleratorPort");
}

- (BOOL)supportPriorityBand
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportPriorityBand");
}

- (unint64_t)maxFramebufferStorageBits
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxFramebufferStorageBits");
}

- (unint64_t)linearTextureArrayAlignmentBytes
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "linearTextureArrayAlignmentBytes");
}

- (unint64_t)linearTextureArrayAlignmentSlice
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "linearTextureArrayAlignmentSlice");
}

- (unint64_t)maxTileBuffers
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxTileBuffers");
}

- (unint64_t)maxTileTextures
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxTileTextures");
}

- (unint64_t)maxTileSamplers
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxTileSamplers");
}

- (unint64_t)maxTileInlineDataSize
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxTileInlineDataSize");
}

- (unint64_t)minTilePixels
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "minTilePixels");
}

- (unint64_t)maxColorAttachments
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxColorAttachments");
}

- (unint64_t)maxVertexAttributes
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxVertexAttributes");
}

- (unint64_t)maxVertexBuffers
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxVertexBuffers");
}

- (unint64_t)maxVertexTextures
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxVertexTextures");
}

- (unint64_t)maxVertexSamplers
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxVertexSamplers");
}

- (unint64_t)maxVertexInlineDataSize
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxVertexInlineDataSize");
}

- (unint64_t)maxInterpolants
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxInterpolants");
}

- (unint64_t)maxFragmentBuffers
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxFragmentBuffers");
}

- (unint64_t)maxFragmentTextures
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxFragmentTextures");
}

- (unint64_t)maxFragmentSamplers
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxFragmentSamplers");
}

- (unint64_t)maxFragmentInlineDataSize
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxFragmentInlineDataSize");
}

- (unint64_t)maxComputeBuffers
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxComputeBuffers");
}

- (unint64_t)maxComputeTextures
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxComputeTextures");
}

- (unint64_t)maxComputeSamplers
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxComputeSamplers");
}

- (unint64_t)maxComputeInlineDataSize
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxComputeInlineDataSize");
}

- (unint64_t)maxComputeLocalMemorySizes
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxComputeLocalMemorySizes");
}

- (unint64_t)maxTotalComputeThreadsPerThreadgroup
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxTotalComputeThreadsPerThreadgroup");
}

- (unint64_t)maxComputeThreadgroupMemory
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxComputeThreadgroupMemory");
}

- (float)maxLineWidth
{
  float result;

  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxLineWidth");
  return result;
}

- (float)maxPointSize
{
  float result;

  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxPointSize");
  return result;
}

- (unint64_t)maxVisibilityQueryOffset
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxVisibilityQueryOffset");
}

- (unint64_t)minConstantBufferAlignmentBytes
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "minConstantBufferAlignmentBytes");
}

- (unint64_t)minBufferNoCopyAlignmentBytes
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "minBufferNoCopyAlignmentBytes");
}

- (unint64_t)maxTextureWidth1D
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxTextureWidth1D");
}

- (unint64_t)maxTextureWidth2D
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxTextureWidth2D");
}

- (unint64_t)maxTextureHeight2D
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxTextureHeight2D");
}

- (unint64_t)maxTextureWidth3D
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxTextureWidth3D");
}

- (unint64_t)maxTextureHeight3D
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxTextureHeight3D");
}

- (unint64_t)maxTextureDepth3D
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxTextureDepth3D");
}

- (unint64_t)maxTextureDimensionCube
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxTextureDimensionCube");
}

- (unint64_t)maxTextureLayers
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxTextureLayers");
}

- (unint64_t)linearTextureAlignmentBytes
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "linearTextureAlignmentBytes");
}

- (unint64_t)iosurfaceTextureAlignmentBytes
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "iosurfaceTextureAlignmentBytes");
}

- (unint64_t)iosurfaceReadOnlyTextureAlignmentBytes
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "iosurfaceReadOnlyTextureAlignmentBytes");
}

- (unint64_t)deviceLinearTextureAlignmentBytes
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deviceLinearTextureAlignmentBytes");
}

- (unint64_t)deviceLinearReadOnlyTextureAlignmentBytes
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deviceLinearReadOnlyTextureAlignmentBytes");
}

- (unint64_t)maxFunctionConstantIndices
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxFunctionConstantIndices");
}

- (unint64_t)maxComputeThreadgroupMemoryAlignmentBytes
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxComputeThreadgroupMemoryAlignmentBytes");
}

- (unint64_t)maxInterpolatedComponents
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxInterpolatedComponents");
}

- (unint64_t)maxTessellationFactor
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxTessellationFactor");
}

- (unint64_t)maxIndirectBuffers
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxIndirectBuffers");
}

- (unint64_t)maxIndirectTextures
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxIndirectTextures");
}

- (unint64_t)maxIndirectSamplers
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxIndirectSamplers");
}

- (unint64_t)maxIndirectSamplersPerDevice
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxIndirectSamplersPerDevice");
}

- (unint64_t)maxFenceInstances
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxFenceInstances");
}

- (unint64_t)maxViewportCount
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxViewportCount");
}

- (unint64_t)maxCustomSamplePositions
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxCustomSamplePositions");
}

- (unint64_t)maxVertexAmplificationFactor
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxVertexAmplificationFactor");
}

- (unint64_t)maxVertexAmplificationCount
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxVertexAmplificationCount");
}

- (unint64_t)maxTextureBufferWidth
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxTextureBufferWidth");
}

- (unint64_t)maxComputeAttributes
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxComputeAttributes");
}

- (unint64_t)maxIOCommandsInFlight
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxIOCommandsInFlight");
}

- (unint64_t)maxPredicatedNestingDepth
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxPredicatedNestingDepth");
}

- (unint64_t)maxAccelerationStructureLevels
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxAccelerationStructureLevels");
}

- (unint64_t)maxConstantBufferArguments
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxConstantBufferArguments");
}

- (unint64_t)maxBufferLength
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxBufferLength");
}

- (unint64_t)readWriteTextureSupport
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "readWriteTextureSupport");
}

- (unint64_t)argumentBuffersSupport
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "argumentBuffersSupport");
}

- (BOOL)areRasterOrderGroupsSupported
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "areRasterOrderGroupsSupported");
}

- (BOOL)isFloat32FilteringSupported
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isFloat32FilteringSupported");
}

- (BOOL)isBCTextureCompressionSupported
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isBCTextureCompressionSupported");
}

- (BOOL)isMsaa32bSupported
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isMsaa32bSupported");
}

- (BOOL)isRGB10A2GammaSupported
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isRGB10A2GammaSupported");
}

- (BOOL)isCustomBorderColorSupported
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isCustomBorderColorSupported");
}

- (BOOL)isClampToHalfBorderSupported
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isClampToHalfBorderSupported");
}

- (BOOL)areBarycentricCoordsSupported
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsShaderBarycentricCoordinates");
}

- (BOOL)isLargeMRTSupported
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isLargeMRTSupported");
}

- (BOOL)isQuadDataSharingSupported
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isQuadDataSharingSupported");
}

- (BOOL)isFixedLinePointFillDepthGradientSupported
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isFixedLinePointFillDepthGradientSupported");
}

- (unint64_t)sparseTexturesSupport
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sparseTexturesSupport");
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)tileSizeWithSparsePageSize:(SEL)a3 textureType:(int64_t)a4 pixelFormat:(unint64_t)a5 sampleCount:(unint64_t)a6
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;

  result = -[MTLToolsObject baseObject](self, "baseObject");
  if (result)
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)-[$F99D9A4FB75BC57F3386B8DC8EE08D7A tileSizeWithSparsePageSize:textureType:pixelFormat:sampleCount:](result, "tileSizeWithSparsePageSize:textureType:pixelFormat:sampleCount:", a4, a5, a6, a7);
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sparseTileSizeWithTextureType:(SEL)a3 pixelFormat:(unint64_t)a4 sampleCount:(unint64_t)a5
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;

  result = -[MTLToolsObject baseObject](self, "baseObject");
  if (result)
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)-[$F99D9A4FB75BC57F3386B8DC8EE08D7A sparseTileSizeWithTextureType:pixelFormat:sampleCount:](result, "sparseTileSizeWithTextureType:pixelFormat:sampleCount:", a4, a5, a6);
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sparseTileSizeWithTextureType:(SEL)a3 pixelFormat:(unint64_t)a4 sampleCount:(unint64_t)a5 sparsePageSize:(unint64_t)a6
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;

  result = -[MTLToolsObject baseObject](self, "baseObject");
  if (result)
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)-[$F99D9A4FB75BC57F3386B8DC8EE08D7A sparseTileSizeWithTextureType:pixelFormat:sampleCount:sparsePageSize:](result, "sparseTileSizeWithTextureType:pixelFormat:sampleCount:sparsePageSize:", a4, a5, a6, a7);
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return result;
}

- (unsigned)maximumComputeSubstreams
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maximumComputeSubstreams");
}

- (id)newResourceGroupFromResources:(const void *)a3 count:(unint64_t)a4
{
  char *v6;
  const void **v7;
  unint64_t v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  MTLToolsResourceGroupSPI *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = (char *)v15 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v7 = a3;
    v8 = a4;
    v9 = (_QWORD *)((char *)v15 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      v10 = (void *)*v7++;
      *v9++ = objc_msgSend(v10, "baseObject");
      --v8;
    }
    while (v8);
  }
  v11 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "newResourceGroupFromResources:count:", v6, a4);
  if (!v11)
    return 0;
  v12 = (void *)v11;
  v13 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsResourceGroupSPI alloc], "initWithBaseObject:parent:", v11, self);

  return v13;
}

- (BOOL)metalAssertionsEnabled
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "metalAssertionsEnabled");
}

- (void)setMetalAssertionsEnabled:(BOOL)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMetalAssertionsEnabled:", a3);
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5
{
  id result;
  id v7;
  MTLToolsTexture *v8;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:iosurface:plane:", a3, a4, a5);
  if (result)
  {
    v7 = result;
    v8 = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsTexture alloc], "initWithBaseObject:parent:", result, self);

    return v8;
  }
  return result;
}

- (id)newEvent
{
  id result;
  id v4;
  MTLToolsEvent *v5;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newEvent");
  if (result)
  {
    v4 = result;
    v5 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsEvent alloc], "initWithBaseObject:parent:", result, self);

    return v5;
  }
  return result;
}

- (id)newEventWithOptions:(int64_t)a3
{
  id result;
  id v5;
  MTLToolsEvent *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newEventWithOptions:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsEvent alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (id)newSharedEvent
{
  id result;
  id v3;
  MTLToolsSharedEvent *v4;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedEvent");
  if (result)
  {
    v3 = result;
    v4 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsSharedEvent alloc], "initWithBaseObject:parent:", result, 0);

    return v4;
  }
  return result;
}

- (id)newSharedEventWithOptions:(int64_t)a3
{
  id result;
  id v4;
  MTLToolsSharedEvent *v5;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedEventWithOptions:", a3);
  if (result)
  {
    v4 = result;
    v5 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsSharedEvent alloc], "initWithBaseObject:parent:", result, 0);

    return v5;
  }
  return result;
}

- (id)newSharedEventWithMachPort:(unsigned int)a3
{
  id result;
  id v4;
  MTLToolsSharedEvent *v5;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedEventWithMachPort:", *(_QWORD *)&a3);
  if (result)
  {
    v4 = result;
    v5 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsSharedEvent alloc], "initWithBaseObject:parent:", result, 0);

    return v5;
  }
  return result;
}

- (id)newSharedEventWithHandle:(id)a3
{
  id result;
  id v4;
  MTLToolsSharedEvent *v5;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedEventWithHandle:", a3);
  if (result)
  {
    v4 = result;
    v5 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsSharedEvent alloc], "initWithBaseObject:parent:", result, 0);

    return v5;
  }
  return result;
}

- (id)newLateEvalEvent
{
  id result;
  id v4;
  MTLToolsLateEvalEvent *v5;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLateEvalEvent");
  if (result)
  {
    v4 = result;
    v5 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsLateEvalEvent alloc], "initWithBaseObject:parent:", result, self);

    return v5;
  }
  return result;
}

- (id)newTextureLayoutWithDescriptor:(id)a3 isHeapOrBufferBacked:(BOOL)a4
{
  id result;
  id v6;
  MTLToolsTextureLayout *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureLayoutWithDescriptor:isHeapOrBufferBacked:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsTextureLayout alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (void)setupMPSFunctionTable:(MPSFunctionTable *)a3
{
  -[MTLToolsObject originalObject](self, "originalObject");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(-[MTLToolsObject originalObject](self, "originalObject"), "setupMPSFunctionTable:", a3);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  unsigned __int8 v3;
  objc_super v5;

  if (sel_newBufferWithIOSurface_ == a3)
  {
    -[MTLToolsObject baseObject](self, "baseObject");
    v3 = objc_opt_respondsToSelector();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MTLToolsDevice;
    v3 = -[MTLToolsDevice respondsToSelector:](&v5, sel_respondsToSelector_, a3);
  }
  return v3 & 1;
}

- (unint64_t)currentAllocatedSize
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "currentAllocatedSize");
}

- (void)allowLibrariesFromOtherPlatforms
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "allowLibrariesFromOtherPlatforms");
}

- (unint64_t)sparseTileSizeInBytes
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sparseTileSizeInBytes");
}

- (unint64_t)sparseTileSizeInBytesForSparsePageSize:(int64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sparseTileSizeInBytesForSparsePageSize:", a3);
}

- (void)convertSparsePixelRegions:(id *)a3 toTileRegions:(id *)a4 withTileSize:(id *)a5 alignmentMode:(unint64_t)a6 numRegions:(unint64_t)a7
{
  id v12;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13;

  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  v13 = *a5;
  objc_msgSend(v12, "convertSparsePixelRegions:toTileRegions:withTileSize:alignmentMode:numRegions:", a3, a4, &v13, a6, a7);
}

- (void)convertSparseTileRegions:(id *)a3 toPixelRegions:(id *)a4 withTileSize:(id *)a5 numRegions:(unint64_t)a6
{
  id v10;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11;

  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  v11 = *a5;
  objc_msgSend(v10, "convertSparseTileRegions:toPixelRegions:withTileSize:numRegions:", a3, a4, &v11, a6);
}

- (NSArray)counterSets
{
  return (NSArray *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "counterSets");
}

- (void)sampleTimestamps:(unint64_t *)a3 gpuTimestamp:(unint64_t *)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampleTimestamps:gpuTimestamp:", a3, a4);
}

- (BOOL)supportsCounterSampling:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsCounterSampling:", a3);
}

- (id)newCounterSampleBufferWithDescriptor:(id)a3 error:(id *)a4
{
  id result;
  id v6;
  MTLToolsCounterSampleBuffer *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCounterSampleBufferWithDescriptor:error:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsCounterSampleBuffer alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (BOOL)isPlacementHeapSupported
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isPlacementHeapSupported");
}

- (unint64_t)commandBufferErrorOptions
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBufferErrorOptions");
}

- (void)setCommandBufferErrorOptions:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setCommandBufferErrorOptions:", a3);
}

- (unint64_t)getSupportedCommandBufferErrorOptions
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getSupportedCommandBufferErrorOptions");
}

- (BOOL)supportsPrimitiveType:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsPrimitiveType:", a3);
}

- (unint64_t)deviceCreationFlags
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deviceCreationFlags");
}

- (id)newBinaryArchiveWithDescriptor:(id)a3 error:(id *)a4
{
  id result;
  id v6;
  MTLToolsBinaryArchive *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBinaryArchiveWithDescriptor:error:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsBinaryArchive alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)newBinaryLibraryWithOptions:(unint64_t)a3 url:(id)a4 error:(id *)a5
{
  id result;
  id v7;
  MTLToolsBinaryArchive *v8;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBinaryLibraryWithOptions:url:error:", a3, a4, a5);
  if (result)
  {
    v7 = result;
    v8 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsBinaryArchive alloc], "initWithBaseObject:parent:", result, self);

    return v8;
  }
  return result;
}

- (id)newDynamicLibraryWithURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;

  v5 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDynamicLibraryWithURL:error:", a3, a4);
  v6 = -[MTLToolsDevice getDynamicLibraryForBaseObject:](self, "getDynamicLibraryForBaseObject:", v5);

  return v6;
}

- (id)newDynamicLibraryWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  void *v6;
  id v7;

  v6 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDynamicLibraryWithURL:options:error:", a3, a4, a5);
  v7 = -[MTLToolsDevice getDynamicLibraryForBaseObject:](self, "getDynamicLibraryForBaseObject:", v6);

  return v7;
}

- (id)newDynamicLibrary:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;

  v5 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDynamicLibrary:error:", objc_msgSend(a3, "baseObject"), a4);
  v6 = -[MTLToolsDevice getDynamicLibraryForBaseObject:](self, "getDynamicLibraryForBaseObject:", v5);

  return v6;
}

- (id)newDynamicLibrary:(id)a3 computeDescriptor:(id)a4 error:(id *)a5
{
  void *v6;
  id v7;

  v6 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDynamicLibrary:computeDescriptor:error:", objc_msgSend(a3, "baseObject"), -[MTLToolsDevice unwrapMTLComputePipelineDescriptor:](self, "unwrapMTLComputePipelineDescriptor:", a4), a5);
  v7 = -[MTLToolsDevice getDynamicLibraryForBaseObject:](self, "getDynamicLibraryForBaseObject:", v6);

  return v7;
}

- (BOOL)validateDynamicLibraryDescriptor:(id)a3 error:(id *)a4
{
  id v6;

  v6 = -[MTLToolsDevice unwrapMTLDynamicLibraryDescriptorSPI:](self, "unwrapMTLDynamicLibraryDescriptorSPI:", a3);
  LOBYTE(a4) = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "validateDynamicLibraryDescriptor:error:", v6, a4);

  return (char)a4;
}

- (id)newDynamicLibraryWithDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = -[MTLToolsDevice unwrapMTLDynamicLibraryDescriptorSPI:](self, "unwrapMTLDynamicLibraryDescriptorSPI:", a3);
  v7 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDynamicLibraryWithDescriptor:error:", v6, a4);

  return v7;
}

- (BOOL)supportsVertexAmplificationCount:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsVertexAmplificationCount:", a3);
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)accelerationStructureSizesWithDescriptor:(SEL)a3
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;

  result = -[MTLToolsObject baseObject](self, "baseObject");
  if (result)
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)-[$F99D9A4FB75BC57F3386B8DC8EE08D7A accelerationStructureSizesWithDescriptor:](result, "accelerationStructureSizesWithDescriptor:", a4);
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return result;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  void *v4;
  MTLToolsAccelerationStructure *v5;

  v4 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newAccelerationStructureWithSize:", a3);
  v5 = -[MTLToolsAccelerationStructure initWithBaseObject:parent:]([MTLToolsAccelerationStructure alloc], "initWithBaseObject:parent:", v4, self);

  return v5;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  void *v4;
  MTLToolsAccelerationStructure *v5;

  v4 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newAccelerationStructureWithDescriptor:", a3);
  v5 = -[MTLToolsAccelerationStructure initWithBaseObject:parent:]([MTLToolsAccelerationStructure alloc], "initWithBaseObject:parent:", v4, self);

  return v5;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  void *v5;
  MTLToolsAccelerationStructure *v6;

  v5 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newAccelerationStructureWithSize:resourceIndex:", a3, a4);
  v6 = -[MTLToolsAccelerationStructure initWithBaseObject:parent:]([MTLToolsAccelerationStructure alloc], "initWithBaseObject:parent:", v5, self);

  return v6;
}

- (BOOL)isCompatibleWithAccelerationStructure:(id)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isCompatibleWithAccelerationStructure:", a3);
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4
{
  void *v5;
  MTLToolsAccelerationStructure *v6;

  v5 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newAccelerationStructureWithBuffer:offset:", objc_msgSend(a3, "baseObject"), a4);
  v6 = -[MTLToolsAccelerationStructure initWithBaseObject:parent:]([MTLToolsAccelerationStructure alloc], "initWithBaseObject:parent:", v5, self);

  return v6;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  void *v6;
  MTLToolsAccelerationStructure *v7;

  v6 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newAccelerationStructureWithBuffer:offset:resourceIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
  v7 = -[MTLToolsAccelerationStructure initWithBaseObject:parent:]([MTLToolsAccelerationStructure alloc], "initWithBaseObject:parent:", v6, self);

  return v7;
}

- (id)deserializePrimitiveAccelerationStructureFromBytes:(void *)a3 withDescriptor:(id)a4
{
  id result;
  id v6;
  MTLToolsAccelerationStructure *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializePrimitiveAccelerationStructureFromBytes:withDescriptor:", a3, unwrapAccelerationStructureDescriptor(a4));
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsAccelerationStructure initWithBaseObject:parent:]([MTLToolsAccelerationStructure alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)deserializeInstanceAccelerationStructureFromBytes:(void *)a3 primitiveAccelerationStructures:(id)a4 withDescriptor:(id)a5
{
  void *v9;
  uint64_t v10;
  unsigned int v11;
  id result;
  id v14;
  MTLToolsAccelerationStructure *v15;

  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  if (objc_msgSend(a4, "count"))
  {
    v10 = 0;
    v11 = 1;
    do
    {
      objc_msgSend(v9, "addObject:", objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v10), "baseObject"));
      v10 = v11;
    }
    while (objc_msgSend(a4, "count") > (unint64_t)v11++);
  }
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializeInstanceAccelerationStructureFromBytes:primitiveAccelerationStructures:withDescriptor:", a3, v9, unwrapAccelerationStructureDescriptor(a5));
  if (result)
  {
    v14 = result;
    v15 = -[MTLToolsAccelerationStructure initWithBaseObject:parent:]([MTLToolsAccelerationStructure alloc], "initWithBaseObject:parent:", result, self);

    return v15;
  }
  return result;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4
{
  id result;
  id v6;
  MTLToolsAccelerationStructure *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newAccelerationStructureWithSize:withDescriptor:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsAccelerationStructure initWithBaseObject:parent:]([MTLToolsAccelerationStructure alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBytes:(const void *)a4 withDescriptor:(id)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializePrimitiveAccelerationStructure:fromBytes:withDescriptor:", objc_msgSend(a3, "baseObject"), a4, unwrapAccelerationStructureDescriptor(a5));
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 fromBytes:(const void *)a4 primitiveAccelerationStructures:(id)a5 withDescriptor:(id)a6
{
  void *v11;
  uint64_t v12;
  unsigned int v13;

  v11 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a5, "count"));
  if (objc_msgSend(a5, "count"))
  {
    v12 = 0;
    v13 = 1;
    do
    {
      objc_msgSend(v11, "addObject:", objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v12), "baseObject"));
      v12 = v13;
    }
    while (objc_msgSend(a5, "count") > (unint64_t)v13++);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializeInstanceAccelerationStructure:fromBytes:primitiveAccelerationStructures:withDescriptor:", objc_msgSend(a3, "baseObject"), a4, v11, unwrapAccelerationStructureDescriptor(a6));
}

- (BOOL)isRTZRoundingSupported
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isRTZRoundingSupported");
}

- (BOOL)supportsTextureWriteRoundingMode:(int64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsTextureWriteRoundingMode:", a3);
}

- (int64_t)defaultTextureWriteRoundingMode
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "defaultTextureWriteRoundingMode");
}

- (BOOL)isAnisoSampleFixSupported
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isAnisoSampleFixSupported");
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
{
  id result;
  id v5;
  MTLToolsVisibleFunctionTable *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newVisibleFunctionTableWithDescriptor:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsVisibleFunctionTable alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  id result;
  id v5;
  MTLToolsIntersectionFunctionTable *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIntersectionFunctionTableWithDescriptor:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsIntersectionFunctionTable alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (id)newProfileWithExecutionSize:(unint64_t)a3
{
  id result;
  id v5;
  MTLToolsDeadlineProfile *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newProfileWithExecutionSize:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsDeadlineProfile alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (id)unwrapMTLCommandBufferDescriptor:(id)a3 alwaysCopy:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  const char *v11;
  objc_class *v12;
  const char *v13;
  const char *v14;
  const char *v15;

  v4 = a4;
  if (!objc_msgSend(a3, "deadlineProfile") && !v4)
    return a3;
  v7 = (void *)objc_msgSend(a3, "copy");
  v8 = (void *)objc_msgSend(a3, "copy");
  v9 = (void *)objc_msgSend(v8, "deadlineProfile");
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = -[NSString UTF8String](NSStringFromClass(v10), "UTF8String");
      v12 = (objc_class *)objc_opt_class();
      v14 = v11;
      v15 = -[NSString UTF8String](NSStringFromClass(v12), "UTF8String");
      v13 = "-[MTLToolsDevice unwrapMTLCommandBufferDescriptor:alwaysCopy:]";
      MTLReportFailure();
    }
  }
  objc_msgSend(v8, "setDeadlineProfile:", objc_msgSend(v9, "baseObject", v13, v14, v15));

  return v7;
}

- (BOOL)supportsBufferlessClientStorageTexture
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsBufferlessClientStorageTexture");
}

- (BOOL)supportsComputeMemoryBarrier
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsComputeMemoryBarrier");
}

- (BOOL)supportsRenderMemoryBarrier
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderMemoryBarrier");
}

- (BOOL)supportsPartialRenderMemoryBarrier
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsPartialRenderMemoryBarrier");
}

- (BOOL)supportsArgumentBuffersTier2
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsArgumentBuffersTier2");
}

- (BOOL)supportsReadWriteTextureArgumentsTier2
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsReadWriteTextureArgumentsTier2");
}

- (BOOL)supportsStreamingCodecSignaling
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsStreamingCodecSignaling");
}

- (BOOL)supportsProgrammableSamplePositions
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsProgrammableSamplePositions");
}

- (BOOL)supportsLargeFramebufferConfigs
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsLargeFramebufferConfigs");
}

- (BOOL)supportsCustomBorderColor
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsCustomBorderColor");
}

- (BOOL)supportsSamplerAddressModeClampToHalfBorder
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsSamplerAddressModeClampToHalfBorder");
}

- (BOOL)supportsBCTextureCompression
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsBCTextureCompression");
}

- (BOOL)supports3DBCTextures
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supports3DBCTextures");
}

- (BOOL)supportsRGBA10A2Gamma
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRGBA10A2Gamma");
}

- (BOOL)supportsBGR10A2
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsBGR10A2");
}

- (BOOL)supportsPrimitiveRestartOverride
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsPrimitiveRestartOverride");
}

- (BOOL)supportsGlobalVariableRelocation
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsGlobalVariableRelocation");
}

- (BOOL)supportsGlobalVariableRelocationRender
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsGlobalVariableRelocationRender");
}

- (BOOL)supportsGlobalVariableRelocationCompute
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsGlobalVariableRelocationCompute");
}

- (BOOL)supportsTLS
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsTLS");
}

- (BOOL)supportsGlobalVariableBindings
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsGlobalVariableBindings");
}

- (BOOL)supportsGlobalVariableBindingInDylibs
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsGlobalVariableBindingInDylibs");
}

- (BOOL)supports32bpcMSAATextures
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supports32bpcMSAATextures");
}

- (BOOL)supports32BitMSAA
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supports32BitMSAA");
}

- (BOOL)supports32BitFloatFiltering
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supports32BitFloatFiltering");
}

- (BOOL)supportsQueryTextureLOD
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsQueryTextureLOD");
}

- (BOOL)supportsVertexAmplification
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsVertexAmplification");
}

- (BOOL)supportsPlacementHeaps
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsPlacementHeaps");
}

- (BOOL)supportsOpenCLTextureWriteSwizzles
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsOpenCLTextureWriteSwizzles");
}

- (BOOL)supportsPullModelInterpolation
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsPullModelInterpolation");
}

- (BOOL)supportsInt64
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsInt64");
}

- (BOOL)supportsFixedLinePointFillDepthGradient
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsFixedLinePointFillDepthGradient");
}

- (BOOL)supportsLateEvalEvent
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsLateEvalEvent");
}

- (BOOL)supportsNonZeroTextureWriteLOD
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsNonZeroTextureWriteLOD");
}

- (BOOL)supportsSharedTextureHandles
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsSharedTextureHandles");
}

- (BOOL)supportsBufferPrefetchStatistics
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsBufferPrefetchStatistics");
}

- (BOOL)supportsLimitedYUVFormats
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsLimitedYUVFormats");
}

- (BOOL)supportsNonPrivateDepthStencilTextures
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsNonPrivateDepthStencilTextures");
}

- (BOOL)supportsNonPrivateMSAATextures
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsNonPrivateMSAATextures");
}

- (BOOL)supportsSharedStorageHeapResources
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsSharedStorageHeapResources");
}

- (BOOL)supportsSharedStorageTextures
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsSharedStorageTextures");
}

- (BOOL)supportsLinearTextureFromSharedBuffer
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsLinearTextureFromSharedBuffer");
}

- (BOOL)supportsPipelineLibraries
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsPipelineLibraries");
}

- (BOOL)supportsFragmentOnlyEncoders
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsFragmentOnlyEncoders");
}

- (BOOL)supportsBufferWithIOSurface
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsBufferWithIOSurface");
}

- (BOOL)supportsProgrammableBlending
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsProgrammableBlending");
}

- (BOOL)supportsRenderToLinearTextures
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderToLinearTextures");
}

- (BOOL)supportsMemorylessRenderTargets
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsMemorylessRenderTargets");
}

- (BOOL)supportsFastMathInfNaNPropagation
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsFastMathInfNaNPropagation");
}

- (BOOL)supportsInvariantVertexPosition
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsInvariantVertexPosition");
}

- (BOOL)supportsShaderLODAverage
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsShaderLODAverage");
}

- (BOOL)supportsRelaxedTextureViewRequirements
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRelaxedTextureViewRequirements");
}

- (BOOL)supportsSeparateDepthStencil
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsSeparateDepthStencil");
}

- (BOOL)supportsGPUStatistics
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsGPUStatistics");
}

- (BOOL)supportsCompressedTextureViewSPI
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsCompressedTextureViewSPI");
}

- (BOOL)supportsRenderTargetTextureRotation
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderTargetTextureRotation");
}

- (BOOL)supportsDynamicControlPointCount
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDynamicControlPointCount");
}

- (BOOL)supportsIABHashForTools
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsIABHashForTools");
}

- (BOOL)supportsBinaryArchives
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsBinaryArchives");
}

- (BOOL)supportsBinaryLibraries
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsBinaryLibraries");
}

- (BOOL)supportsDeadlineProfile
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDeadlineProfile");
}

- (BOOL)supportsFillTexture
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsFillTexture");
}

- (BOOL)supportsSetThreadgroupPackingDisabled
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsSetThreadgroupPackingDisabled");
}

- (BOOL)supportsASTCTextureCompression
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsASTCTextureCompression");
}

- (BOOL)supportsExtendedYUVFormats
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsExtendedYUVFormats");
}

- (BOOL)supportsPublicXR10Formats
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsPublicXR10Formats");
}

- (BOOL)supportsSRGBwrites
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsSRGBwrites");
}

- (BOOL)supportsDepthClipMode
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDepthClipMode");
}

- (BOOL)supportsResourceHeaps
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsResourceHeaps");
}

- (BOOL)supportsArgumentBuffers
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsArgumentBuffers");
}

- (BOOL)supportsPacked32TextureBufferWrites
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsPacked32TextureBufferWrites");
}

- (BOOL)supports3DASTCTextures
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supports3DASTCTextures");
}

- (BOOL)supportsExtendedXR10Formats
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsExtendedXR10Formats");
}

- (BOOL)supportsFragmentBufferWrites
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsFragmentBufferWrites");
}

- (BOOL)supportsCountingOcclusionQuery
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsCountingOcclusionQuery");
}

- (BOOL)supportsBaseVertexInstanceDrawing
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsBaseVertexInstanceDrawing");
}

- (BOOL)supportsIndirectDrawAndDispatch
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsIndirectDrawAndDispatch");
}

- (BOOL)supportsTessellation
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsTessellation");
}

- (BOOL)supportsReadWriteBufferArguments
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsReadWriteBufferArguments");
}

- (BOOL)supportsArrayOfTextures
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsArrayOfTextures");
}

- (BOOL)supportsArrayOfSamplers
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsArrayOfSamplers");
}

- (BOOL)supportsCombinedMSAAStoreAndResolveAction
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsCombinedMSAAStoreAndResolveAction");
}

- (BOOL)supportsMutableTier1ArgumentBuffers
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsMutableTier1ArgumentBuffers");
}

- (BOOL)supportsSamplerCompareFunction
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsSamplerCompareFunction");
}

- (BOOL)supportsMSAADepthResolve
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsMSAADepthResolve");
}

- (BOOL)supportsMSAAStencilResolve
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsMSAAStencilResolve");
}

- (BOOL)supportsMSAADepthResolveFilter
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsMSAADepthResolveFilter");
}

- (BOOL)supportsGFXIndirectCommandBuffers
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsGFXIndirectCommandBuffers");
}

- (BOOL)supportsCMPIndirectCommandBuffers
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsCMPIndirectCommandBuffers");
}

- (BOOL)supportsIndirectStageInRegion
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsIndirectStageInRegion");
}

- (BOOL)supportsIndirectTextures
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsIndirectTextures");
}

- (BOOL)supportsNorm16BCubicFiltering
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsNorm16BCubicFiltering");
}

- (BOOL)supportsTextureOutOfBoundsReads
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsTextureOutOfBoundsReads");
}

- (BOOL)supportsTextureSwizzle
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsTextureSwizzle");
}

- (BOOL)supportsAlphaYUVFormats
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsAlphaYUVFormats");
}

- (BOOL)supportsMemoryOrderAtomics
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsMemoryOrderAtomics");
}

- (BOOL)supportsQuadGroup
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsQuadGroup");
}

- (BOOL)supportsRenderTextureWrites
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderTextureWrites");
}

- (BOOL)supportsImageBlocks
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsImageBlocks");
}

- (BOOL)supportsTileShaders
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsTileShaders");
}

- (BOOL)supportsImageBlockSampleCoverageControl
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsImageBlockSampleCoverageControl");
}

- (BOOL)supportsNativeHardwareFP16
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsNativeHardwareFP16");
}

- (BOOL)supportsPostDepthCoverage
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsPostDepthCoverage");
}

- (BOOL)supportsMipLevelsSmallerThanBlockSize
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsMipLevelsSmallerThanBlockSize");
}

- (BOOL)supportsNonUniformThreadgroupSize
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsNonUniformThreadgroupSize");
}

- (BOOL)supportsReadWriteTextureArguments
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsReadWriteTextureArguments");
}

- (BOOL)supportsReadWriteTextureCubeArguments
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsReadWriteTextureCubeArguments");
}

- (BOOL)supportsTextureCubeArray
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsTextureCubeArray");
}

- (BOOL)supportsQuadShufflesAndBroadcast
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsQuadShufflesAndBroadcast");
}

- (BOOL)supportsConcurrentComputeDispatch
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsConcurrentComputeDispatch");
}

- (BOOL)supportsRenderPassWithoutRenderTarget
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderPassWithoutRenderTarget");
}

- (BOOL)supportsRasterOrderGroups
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRasterOrderGroups");
}

- (BOOL)supportsRasterOrderGroupsColorAttachment
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRasterOrderGroupsColorAttachment");
}

- (BOOL)supportsDynamicAttributeStride
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDynamicAttributeStride");
}

- (BOOL)supportsLinearTexture2DArray
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsLinearTexture2DArray");
}

- (BOOL)supportsNonSquareTileShaders
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsNonSquareTileShaders");
}

- (BOOL)supportsSeparateVisibilityAndShadingRate
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsSeparateVisibilityAndShadingRate");
}

- (BOOL)supports2DLinearTexArraySPI
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supports2DLinearTexArraySPI");
}

- (BOOL)supportsLayeredRendering
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsLayeredRendering");
}

- (BOOL)supportsViewportAndScissorArray
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsViewportAndScissorArray");
}

- (BOOL)supportsIndirectTessellation
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsIndirectTessellation");
}

- (BOOL)supportsMSAAStencilResolveFilter
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsMSAAStencilResolveFilter");
}

- (BOOL)supportsStencilFeedback
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsStencilFeedback");
}

- (BOOL)supportsFP32TessFactors
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsFP32TessFactors");
}

- (BOOL)supportsUnalignedVertexFetch
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsUnalignedVertexFetch");
}

- (BOOL)supportsExtendedVertexFormats
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsExtendedVertexFormats");
}

- (BOOL)supportsResourceDetachBacking
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsResourceDetachBacking");
}

- (BOOL)supportsBufferWithAddressRanges
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsBufferWithAddressRanges");
}

- (BOOL)supportsHeapWithAddressRanges
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsHeapWithAddressRanges");
}

- (BOOL)supportsSIMDGroup
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsSIMDGroup");
}

- (BOOL)supportsShaderMinLODClamp
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsShaderMinLODClamp");
}

- (BOOL)supportsSIMDShufflesAndBroadcast
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsSIMDShufflesAndBroadcast");
}

- (BOOL)supportsWritableArrayOfTextures
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsWritableArrayOfTextures");
}

- (BOOL)supportsVariableRateRasterization
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsVariableRateRasterization");
}

- (BOOL)supportsYCBCRFormats
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsYCBCRFormats");
}

- (BOOL)supportsYCBCRFormatsPQ
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsYCBCRFormatsPQ");
}

- (BOOL)supportsYCBCRFormats12
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsYCBCRFormats12");
}

- (BOOL)supportsYCBCRFormatsXR
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsYCBCRFormatsXR");
}

- (BOOL)supportsASTCHDRTextureCompression
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsASTCHDRTextureCompression");
}

- (BOOL)supportsSparseTextures
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsSparseTextures");
}

- (BOOL)supportsSparseHeaps
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsSparseHeaps");
}

- (BOOL)supportsIndirectWritableTextures
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsIndirectWritableTextures");
}

- (BOOL)supportsFunctionPointers
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsFunctionPointers");
}

- (BOOL)supportsDynamicLibraries
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDynamicLibraries");
}

- (BOOL)supportsStatefulDynamicLibraries
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsStatefulDynamicLibraries");
}

- (BOOL)supportsRenderDynamicLibraries
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRenderDynamicLibraries");
}

- (BOOL)supportsFunctionPointersFromRender
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsFunctionPointersFromRender");
}

- (BOOL)supportsSharedFunctionTables
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsSharedFunctionTables");
}

- (BOOL)supportsRaytracingFromRender
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRaytracingFromRender");
}

- (BOOL)supportsPrimitiveMotionBlur
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsPrimitiveMotionBlur");
}

- (BOOL)supportsRayTracingExtendedVertexFormats
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRayTracingExtendedVertexFormats");
}

- (BOOL)supportsHeapAccelerationStructureAllocation
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsHeapAccelerationStructureAllocation");
}

- (BOOL)supportsRayTracingPerPrimitiveData
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRayTracingPerPrimitiveData");
}

- (BOOL)supportsRayTracingTraversalMetrics
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRayTracingTraversalMetrics");
}

- (BOOL)supportsRayTracingBuffersFromTables
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRayTracingBuffersFromTables");
}

- (BOOL)supportsRayTracingAccelerationStructureCPUDeserialization
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRayTracingAccelerationStructureCPUDeserialization");
}

- (BOOL)supportsRayTracingMultiLevelInstancing
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRayTracingMultiLevelInstancing");
}

- (BOOL)supportsRayTracingIndirectInstanceAccelerationStructureBuild
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRayTracingIndirectInstanceAccelerationStructureBuild");
}

- (BOOL)supportsRayTracingGPUTableUpdateBuffers
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRayTracingGPUTableUpdateBuffers");
}

- (BOOL)supportsRayTracingCurves
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRayTracingCurves");
}

- (BOOL)supportsShaderBarycentricCoordinates
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsShaderBarycentricCoordinates");
}

- (BOOL)supportsBlackOrWhiteSamplerBorderColors
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsBlackOrWhiteSamplerBorderColors");
}

- (BOOL)supportsMirrorClampToEdgeSamplerMode
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsMirrorClampToEdgeSamplerMode");
}

- (BOOL)supportsSIMDReduction
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsSIMDReduction");
}

- (BOOL)supportsDepthClipModeClampExtended
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDepthClipModeClampExtended");
}

- (BOOL)supportsTexture2DMultisampleArray
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsTexture2DMultisampleArray");
}

- (BOOL)supportsForceSeamsOnCubemaps
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsForceSeamsOnCubemaps");
}

- (BOOL)supportsFloat16BCubicFiltering
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsFloat16BCubicFiltering");
}

- (BOOL)supportsFloat16InfNanFiltering
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsFloat16InfNanFiltering");
}

- (BOOL)supportsRTZRounding
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRTZRounding");
}

- (BOOL)supportsAnisoSampleFix
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsAnisoSampleFix");
}

- (BOOL)supportsYCBCRPackedFormatsPQ
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsYCBCRPackedFormatsPQ");
}

- (BOOL)supportsYCBCRPackedFormats12
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsYCBCRPackedFormats12");
}

- (BOOL)supportsYCBCRPackedFormatsXR
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsYCBCRPackedFormatsXR");
}

- (BOOL)supportsBufferBoundsChecking
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsBufferBoundsChecking");
}

- (BOOL)supportsForkJoin
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsForkJoin");
}

- (BOOL)supportsDevicePartitioning
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDevicePartitioning");
}

- (BOOL)supportsComputeCompressedTextureWrite
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsComputeCompressedTextureWrite");
}

- (BOOL)supportsSIMDGroupMatrix
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsSIMDGroupMatrix");
}

- (BOOL)supportsInterchangeTiled
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsInterchangeTiled");
}

- (BOOL)supportsQuadReduction
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsQuadReduction");
}

- (BOOL)supportsVirtualSubstreams
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsVirtualSubstreams");
}

- (BOOL)supportsSIMDShuffleAndFill
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsSIMDShuffleAndFill");
}

- (BOOL)supportsBfloat16Format
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsBfloat16Format");
}

- (BOOL)supportsSparseDepthAttachments
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsSparseDepthAttachments");
}

- (BOOL)supportsAtomicUlongVoidMinMax
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsAtomicUlongVoidMinMax");
}

- (BOOL)supportsLossyCompression
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsLossyCompression");
}

- (BOOL)supportsMeshShaders
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsMeshShaders");
}

- (BOOL)supportsFunctionPointersFromMesh
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsFunctionPointersFromMesh");
}

- (BOOL)supportsMeshShadersInICB
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsMeshShadersInICB");
}

- (BOOL)supportsMeshRenderDynamicLibraries
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsMeshRenderDynamicLibraries");
}

- (BOOL)supportsBfloat16Buffers
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsBfloat16Buffers");
}

- (BOOL)supportsCommandBufferJump
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsCommandBufferJump");
}

- (BOOL)supportsColorSpaceConversionMatrixSelection
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsColorSpaceConversionMatrixSelection");
}

- (BOOL)supportsPerPlaneCompression
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsPerPlaneCompression");
}

- (BOOL)supportsConditionalLoadStore
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsConditionalLoadStore");
}

- (BOOL)supportsStackOverflowErrorCode
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsStackOverflowErrorCode");
}

- (BOOL)supportsRayTracingICBs
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRayTracingICBs");
}

- (BOOL)supportsPerformanceStateAssertion
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsPerformanceStateAssertion");
}

- (BOOL)supportsExplicitVisibilityGroups
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsExplicitVisibilityGroups");
}

- (BOOL)supportsRayTracingMatrixLayout
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRayTracingMatrixLayout");
}

- (BOOL)supportsRayTracingDirectIntersectionResultAccess
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRayTracingDirectIntersectionResultAccess");
}

- (BOOL)supportsRayTracingPerComponentMotionInterpolation
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsRayTracingPerComponentMotionInterpolation");
}

- (BOOL)supportsExtendedSamplerLODBiasRange
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsExtendedSamplerLODBiasRange");
}

- (BOOL)supportsDeviceCoherency
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsDeviceCoherency");
}

- (id)getDynamicLibraryForBaseObject:(id)a3
{
  MTLToolsObjectCache *dynamicLibraryObjectCache;
  _QWORD v5[6];

  dynamicLibraryObjectCache = self->dynamicLibraryObjectCache;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__MTLToolsDevice_getDynamicLibraryForBaseObject___block_invoke;
  v5[3] = &unk_24F7946E0;
  v5[4] = a3;
  v5[5] = self;
  return -[MTLToolsObjectCache getCachedObjectForKey:onMiss:](dynamicLibraryObjectCache, "getCachedObjectForKey:onMiss:", a3, v5);
}

MTLToolsDynamicLibrary *__49__MTLToolsDevice_getDynamicLibraryForBaseObject___block_invoke(uint64_t a1)
{
  return -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsDynamicLibrary alloc], "initWithBaseObject:parent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)getFunctionForBaseObject:(id)a3 library:(id)a4
{
  MTLToolsObjectCache *functionObjectCache;
  _QWORD v6[6];

  functionObjectCache = self->functionObjectCache;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__MTLToolsDevice_getFunctionForBaseObject_library___block_invoke;
  v6[3] = &unk_24F794708;
  v6[4] = a3;
  v6[5] = a4;
  return -[MTLToolsObjectCache getCachedObjectForKey:onMiss:](functionObjectCache, "getCachedObjectForKey:onMiss:", a3, v6);
}

MTLToolsFunction *__51__MTLToolsDevice_getFunctionForBaseObject_library___block_invoke(uint64_t a1)
{
  return -[MTLToolsFunction initWithFunction:library:]([MTLToolsFunction alloc], "initWithFunction:library:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)getDepthStencilStateForBaseObject:(id)a3 descriptor:(id)a4
{
  MTLToolsObjectCache *depthStencilObjectCache;
  _QWORD v6[7];

  depthStencilObjectCache = self->depthStencilObjectCache;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__MTLToolsDevice_getDepthStencilStateForBaseObject_descriptor___block_invoke;
  v6[3] = &unk_24F794898;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = self;
  return -[MTLToolsObjectCache getCachedObjectForKey:onMiss:](depthStencilObjectCache, "getCachedObjectForKey:onMiss:", a3, v6);
}

MTLToolsDepthStencilState *__63__MTLToolsDevice_getDepthStencilStateForBaseObject_descriptor___block_invoke(_QWORD *a1)
{
  return -[MTLToolsDepthStencilState initWithDepthStencilState:descriptor:device:]([MTLToolsDepthStencilState alloc], "initWithDepthStencilState:descriptor:device:", a1[4], a1[5], a1[6]);
}

- (id)getSamplerStateForBaseObject:(id)a3 descriptor:(id)a4
{
  MTLToolsObjectCache *samplerObjectCache;
  _QWORD v6[7];

  samplerObjectCache = self->samplerObjectCache;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__MTLToolsDevice_getSamplerStateForBaseObject_descriptor___block_invoke;
  v6[3] = &unk_24F7948C0;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = self;
  return -[MTLToolsObjectCache getCachedObjectForKey:onMiss:](samplerObjectCache, "getCachedObjectForKey:onMiss:", a3, v6);
}

MTLToolsSamplerState *__58__MTLToolsDevice_getSamplerStateForBaseObject_descriptor___block_invoke(_QWORD *a1)
{
  return -[MTLToolsSamplerState initWithSamplerState:descriptor:device:]([MTLToolsSamplerState alloc], "initWithSamplerState:descriptor:device:", a1[4], a1[5], a1[6]);
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithSize:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v3 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heapAccelerationStructureSizeAndAlignWithSize:", a3);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithDescriptor:(id)a3
{
  unint64_t v3;
  unint64_t v4;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v3 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "heapAccelerationStructureSizeAndAlignWithDescriptor:", unwrapAccelerationStructureDescriptor(a3));
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (id)newArgumentEncoderWithBufferBinding:(id)a3
{
  void *v4;
  MTLToolsArgumentEncoder *v5;

  v4 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithBufferBinding:", a3);
  v5 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsArgumentEncoder alloc], "initWithBaseObject:parent:", v4, self);

  return v5;
}

- (id)newIOHandleWithURL:(id)a3 error:(id *)a4
{
  void *v5;
  MTLToolsIOHandle *v6;

  v5 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIOHandleWithURL:error:", a3, a4);
  v6 = -[MTLToolsIOHandle initWithBaseObject:parent:]([MTLToolsIOHandle alloc], "initWithBaseObject:parent:", v5, self);

  return v6;
}

- (id)newIOHandleWithURL:(id)a3 compressionType:(int64_t)a4 error:(id *)a5
{
  void *v6;
  MTLToolsIOHandle *v7;

  v6 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIOHandleWithURL:compressionType:error:", a3, a4, a5);
  v7 = -[MTLToolsIOHandle initWithBaseObject:parent:]([MTLToolsIOHandle alloc], "initWithBaseObject:parent:", v6, self);

  return v7;
}

- (id)newUncachedIOHandleWithURL:(id)a3 error:(id *)a4
{
  void *v5;
  MTLToolsIOHandle *v6;

  v5 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newUncachedIOHandleWithURL:error:", a3, a4);
  v6 = -[MTLToolsIOHandle initWithBaseObject:parent:]([MTLToolsIOHandle alloc], "initWithBaseObject:parent:", v5, self);

  return v6;
}

- (id)newUncachedIOHandleWithURL:(id)a3 compressionType:(int64_t)a4 error:(id *)a5
{
  void *v6;
  MTLToolsIOHandle *v7;

  v6 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newUncachedIOHandleWithURL:compressionType:error:", a3, a4, a5);
  v7 = -[MTLToolsIOHandle initWithBaseObject:parent:]([MTLToolsIOHandle alloc], "initWithBaseObject:parent:", v6, self);

  return v7;
}

- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4
{
  void *v7;
  MTLToolsIOScratchBufferAllocator *v8;
  void *v9;
  MTLToolsIOCommandQueue *v10;

  v7 = (void *)objc_msgSend(a3, "copy");
  if (objc_msgSend(a3, "scratchBufferAllocator"))
  {
    v8 = -[MTLToolsIOScratchBufferAllocator initWithBaseObject:parent:]([MTLToolsIOScratchBufferAllocator alloc], "initWithBaseObject:parent:", objc_msgSend(a3, "scratchBufferAllocator"), self);
    objc_msgSend(v7, "setScratchBufferAllocator:", v8);

  }
  v9 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIOCommandQueueWithDescriptor:error:", v7, a4);
  v10 = -[MTLToolsIOCommandQueue initWithBaseObject:parent:]([MTLToolsIOCommandQueue alloc], "initWithBaseObject:parent:", v9, self);

  return v10;
}

- (id)newPerformanceStateAssertion:(int64_t)a3 error:(id *)a4
{
  id result;
  id v6;
  MTLToolsPerformanceStateAssertion *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newPerformanceStateAssertion:error:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsPerformanceStateAssertion alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (int64_t)currentPerformanceState
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "currentPerformanceState");
}

- (id)lookupRecompiledBinaryArchive:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "lookupRecompiledBinaryArchive:", a3);
}

- (MTLCompilerConnectionManager)getCompilerConnectionManager:(int)a3
{
  return (MTLCompilerConnectionManager *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getCompilerConnectionManager:", *(_QWORD *)&a3);
}

- (BOOL)setCompilerProcessesCount:(int)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setCompilerProcessesCount:", *(_QWORD *)&a3);
}

- (unint64_t)maxAccelerationStructureTraversalDepth
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxAccelerationStructureTraversalDepth");
}

- (BOOL)requiresBFloat16Emulation
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "requiresBFloat16Emulation");
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5 slice:(unint64_t)a6
{
  id result;
  id v8;
  MTLToolsTexture *v9;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:iosurface:plane:slice:", a3, a4, a5, a6);
  if (result)
  {
    v8 = result;
    v9 = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsTexture alloc], "initWithBaseObject:parent:", result, self);

    return v9;
  }
  return result;
}

- (BOOL)isVendorSliceCompatibleWithDeploymentTarget:(unsigned int)a3 platform:(unsigned int)a4 sdkVersion:(unsigned int)a5 compilerPluginVersion:(unsigned int)a6
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isVendorSliceCompatibleWithDeploymentTarget:platform:sdkVersion:compilerPluginVersion:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
}

- (id)newResidencySetWithDescriptor:(id)a3 error:(id *)a4
{
  id result;
  id v6;
  MTLToolsResidencySet *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newResidencySetWithDescriptor:error:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsResidencySet initWithBaseObject:parent:]([MTLToolsResidencySet alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (BOOL)isIntegrated
{
  return self->_integrated;
}

- (unint64_t)memorySize
{
  return self->_memorySize;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceWrapper);
}

@end
