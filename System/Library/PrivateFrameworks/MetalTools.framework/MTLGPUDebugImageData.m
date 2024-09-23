@implementation MTLGPUDebugImageData

- (MTLGPUDebugImageData)initWithDynamicLibrary:(id)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLGPUDebugImageData;
  v4 = -[MTLGPUDebugImageData init](&v6, sel_init);
  *((_QWORD *)v4 + 21) = v4;
  *((_QWORD *)v4 + 2) = objc_msgSend(a3, "device");
  objc_storeWeak((id *)v4 + 24, a3);
  *((_QWORD *)v4 + 18) = objc_msgSend((id)objc_msgSend(a3, "installName"), "copy");
  *((_QWORD *)v4 + 19) = (id)objc_msgSend(a3, "debugInstrumentationData");
  *((_DWORD *)v4 + 40) = 1;
  objc_msgSend(v4, "_applyImageIDRelocation:", objc_loadWeak((id *)v4 + 24));
  return (MTLGPUDebugImageData *)v4;
}

- (MTLGPUDebugImageData)initWithFunction:(id)a3
{
  return -[MTLGPUDebugImageData initWithFunction:debugInstrumentationData:](self, "initWithFunction:debugInstrumentationData:", a3, objc_msgSend(a3, "debugInstrumentationData"));
}

- (MTLGPUDebugImageData)initWithFunction:(id)a3 debugInstrumentationData:(id)a4
{
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLGPUDebugImageData;
  v6 = -[MTLGPUDebugImageData init](&v8, sel_init);
  *((_QWORD *)v6 + 21) = v6;
  *((_QWORD *)v6 + 2) = objc_msgSend(a3, "device");
  objc_storeWeak((id *)v6 + 23, a3);
  *((_QWORD *)v6 + 18) = objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
  *((_QWORD *)v6 + 22) = objc_msgSend(a3, "functionType");
  *((_QWORD *)v6 + 19) = a4;
  *((_DWORD *)v6 + 40) = 0;
  objc_msgSend(v6, "_applyImageIDRelocation:", objc_loadWeak((id *)v6 + 23));
  return (MTLGPUDebugImageData *)v6;
}

- (void)_applyConstantRelocation
{
  int v2;
  uint64_t v3;

  v2 = *((_DWORD *)self + 40);
  if (v2 == 1)
  {
    v3 = 192;
  }
  else
  {
    if (v2)
      return;
    v3 = 184;
  }
  -[MTLGPUDebugImageData _applyConstantRelocation:](self, "_applyConstantRelocation:", objc_loadWeak((id *)((char *)self + v3)));
}

- (void)_applyConstantRelocation:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;

  if (objc_msgSend(*((id *)self + 2), "supportsGlobalVariableRelocationCompute")
    && (*((_DWORD *)self + 40) || (unint64_t)(*((_QWORD *)self + 22) - 4) <= 2))
  {
    v7 = objc_msgSend(*((id *)self + 1), "handleForOffset:", 0);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDD560]), "initWithSymbolName:bytes:length:", CFSTR("mtl.global_constants_handle"), &v7, 8);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "relocations"), "count") + 2);
    if (objc_msgSend(a3, "relocations"))
      objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(a3, "relocations"));
    objc_msgSend(v6, "addObject:", v5);
    objc_msgSend(a3, "setRelocations:", v6);

  }
}

- (void)_applyImageIDRelocation:(id)a3
{
  void *v5;
  id v6;

  if (objc_msgSend(*((id *)self + 2), "supportsGlobalVariableRelocationCompute")
    && (*((_DWORD *)self + 40) || (unint64_t)(*((_QWORD *)self + 22) - 4) <= 2))
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDDD560]), "initWithSymbolName:bytes:length:", CFSTR("mtl.current_image_id"), (char *)self + 168, 8);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "relocations"), "count") + 2);
    if (objc_msgSend(a3, "relocations"))
      objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(a3, "relocations"));
    objc_msgSend(v5, "addObject:", v6);
    objc_msgSend(a3, "setRelocations:", v5);

  }
}

- (void)setConstantData:(id)a3
{
  std::mutex *v5;
  __int128 v6;
  void *v7;
  _OWORD v8[2];
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = (std::mutex *)((char *)self + 24);
  std::mutex::lock((std::mutex *)((char *)self + 24));
  if (a3 && objc_msgSend(a3, "length"))
  {
    if (!*((_QWORD *)self + 1))
    {
      GPUDebugConstantBufferCache::getOrCreateBuffer((GPUDebugConstantBufferCache *)(*((_QWORD *)self + 2) + 432), (NSData *)a3, (uint64_t)v8);
      v6 = v8[1];
      *((_OWORD *)self + 6) = v8[0];
      *((_OWORD *)self + 7) = v6;
      v7 = v10;
      *((_QWORD *)self + 16) = v9;
      *((_QWORD *)self + 17) = v7;
      *((_QWORD *)self + 1) = v7;
      if (*((_QWORD *)self + 11))
        objc_msgSend(v7, "setBufferIndex:");
      else
        *((_QWORD *)self + 11) = objc_msgSend(v7, "bufferIndex");
      -[MTLGPUDebugImageData _applyConstantRelocation](self, "_applyConstantRelocation");
    }
  }
  else
  {
    -[MTLGPUDebugImageData _applyConstantRelocation](self, "_applyConstantRelocation");
  }
  std::mutex::unlock(v5);
}

- (NSString)loadedImageName
{
  return (NSString *)*((_QWORD *)self + 18);
}

- (MTLGPUDebugDynamicLibrary)dynamicLibrary
{
  return (MTLGPUDebugDynamicLibrary *)objc_loadWeak((id *)self + 24);
}

- (MTLGPUDebugFunction)function
{
  return (MTLGPUDebugFunction *)objc_loadWeak((id *)self + 23);
}

- (unint64_t)functionType
{
  return *((_QWORD *)self + 22);
}

- (MTLDebugInstrumentationData)debugInstrumentationData
{
  return (MTLDebugInstrumentationData *)*((_QWORD *)self + 19);
}

- (int)imageType
{
  return *((_DWORD *)self + 40);
}

- (void)dealloc
{
  objc_super v3;

  if (*((_QWORD *)self + 17))
    GPUDebugConstantBufferCache::releaseBuffer((GPUDebugConstantBufferCache *)(*((_QWORD *)self + 2) + 432), (KeyBufferPair *)self + 2);

  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugImageData;
  -[MTLGPUDebugImageData dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)self + 24);
  objc_destroyWeak((id *)self + 23);
  std::mutex::~mutex((std::mutex *)((char *)self + 24));
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 850045863;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 17) = 0;
  return self;
}

@end
