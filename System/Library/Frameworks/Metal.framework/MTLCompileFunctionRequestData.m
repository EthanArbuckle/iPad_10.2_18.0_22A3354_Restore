@implementation MTLCompileFunctionRequestData

- (void)setVisibleFunctions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setVisibleFunctionGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setPrivateVisibleFunctions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setGpuCompilerSPIOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setDestinationBinaryArchive:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (void)setVendorPluginFunctionId:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_vendorPluginFunctionId.key[16] = *(_OWORD *)&a3->var0[16];
  *(_OWORD *)self->_vendorPluginFunctionId.key = v3;
}

- (void)setDriverKeyData:(id)a3
{
  NSObject *driverKeyData;

  driverKeyData = self->_driverKeyData;
  if (driverKeyData)
    dispatch_release(driverKeyData);
  self->_driverKeyData = (OS_dispatch_data *)a3;
  if (a3)
    dispatch_retain((dispatch_object_t)a3);
}

- (unint64_t)pipelineOptions
{
  return self->_pipelineOptions;
}

- (MTLFunction)function
{
  return self->_function;
}

- (MTLPipelineCache)pipelineCache
{
  return self->_pipelineCache;
}

- (BOOL)sync
{
  return self->_sync;
}

- (OS_dispatch_data)frameworkData
{
  return self->_frameworkData;
}

- (OS_dispatch_data)driverKeyData
{
  return self->_driverKeyData;
}

- (MTLBinaryArchive)destinationBinaryArchive
{
  return self->_destinationBinaryArchive;
}

- (NSArray)binaryArchives
{
  return self->_binaryArchives;
}

- (NSDictionary)gpuCompilerSPIOptions
{
  return self->_gpuCompilerSPIOptions;
}

- (OS_dispatch_data)airScript
{
  return self->_airScript;
}

- (NSArray)privateVisibleFunctions
{
  return self->_privateVisibleFunctions;
}

- ($2772B1D07D29A72E8557B2574C0AE5C1)vendorPluginFunctionId
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].var0[24];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[5].var0[8];
  *(_OWORD *)&retstr->var0[16] = v3;
  return self;
}

- (NSArray)visibleFunctions
{
  return self->_visibleFunctions;
}

- (NSDictionary)visibleFunctionGroups
{
  return self->_visibleFunctionGroups;
}

- (unsigned)maxAccelerationStructureTraversalDepth
{
  return self->_maxAccelerationStructureTraversalDepth;
}

- (OS_dispatch_data)archiverId
{
  return self->_archiverId;
}

- (void)setSync:(BOOL)a3
{
  self->_sync = a3;
}

- (void)setPipelineCache:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (void)setBinaryArchives:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)dealloc
{
  NSObject *frameworkData;
  NSObject *driverKeyData;
  NSObject *archiverId;
  NSObject *airScript;
  objc_super v7;

  frameworkData = self->_frameworkData;
  if (frameworkData)
    dispatch_release(frameworkData);
  driverKeyData = self->_driverKeyData;
  if (driverKeyData)
    dispatch_release(driverKeyData);
  archiverId = self->_archiverId;
  if (archiverId)
    dispatch_release(archiverId);
  airScript = self->_airScript;
  if (airScript)
    dispatch_release(airScript);

  v7.receiver = self;
  v7.super_class = (Class)MTLCompileFunctionRequestData;
  -[MTLCompileFunctionRequestData dealloc](&v7, sel_dealloc);
}

- (void)setPipelineOptions:(unint64_t)a3
{
  self->_pipelineOptions = a3;
}

- (void)setFunction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setArchiveHashKey:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0[16];
  *(_OWORD *)self->_archiveHashKey.key = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_archiveHashKey.key[16] = v3;
}

- (void)setFrameworkData:(id)a3
{
  NSObject *frameworkData;

  frameworkData = self->_frameworkData;
  if (frameworkData)
    dispatch_release(frameworkData);
  self->_frameworkData = (OS_dispatch_data *)a3;
  if (a3)
    dispatch_retain((dispatch_object_t)a3);
}

- (void)setAirScript:(id)a3
{
  NSObject *airScript;

  airScript = self->_airScript;
  if (airScript)
    dispatch_release(airScript);
  self->_airScript = (OS_dispatch_data *)a3;
  if (a3)
    dispatch_retain((dispatch_object_t)a3);
}

- (void)setArchiverId:(id)a3
{
  NSObject *archiverId;

  archiverId = self->_archiverId;
  if (archiverId)
    dispatch_release(archiverId);
  self->_archiverId = (OS_dispatch_data *)a3;
  if (a3)
    dispatch_retain((dispatch_object_t)a3);
}

+ (id)newVisibleRequestWithFunction:(id)a3 descriptor:(id)a4
{
  void *v6;
  size_t v7;
  unsigned int *v8;
  _OWORD *v9;
  __int128 v10;
  int v11;
  NSObject *v12;
  CC_SHA256_CTX c;
  _OWORD v15[2];
  unsigned __int8 data[40];
  unsigned __int8 md[16];
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setFunction:", a3);
  objc_msgSend(v6, "setFunctionOptions:", objc_msgSend(a4, "options"));
  objc_msgSend(v6, "setPipelineOptions:", objc_msgSend(a4, "pipelineOptions"));
  objc_msgSend(v6, "setBinaryArchives:", objc_msgSend(a4, "binaryArchives"));
  if (objc_msgSend((id)objc_msgSend(a3, "device"), "pluginData"))
    v7 = MTLSerializePluginDataDictionary((void *)objc_msgSend((id)objc_msgSend(a3, "device"), "pluginData"), 0) + 44;
  else
    v7 = 44;
  if (objc_msgSend(a4, "pluginData"))
    v7 += MTLSerializePluginDataDictionary((void *)objc_msgSend(a4, "pluginData"), 0);
  v8 = (unsigned int *)malloc_type_calloc(v7, 1uLL, 0x43A3D703uLL);
  v9 = (_OWORD *)objc_msgSend(a3, "bitCodeHash");
  v10 = v9[1];
  *(_OWORD *)(v8 + 2) = *v9;
  *(_OWORD *)(v8 + 6) = v10;
  *((_BYTE *)v8 + 40) = (objc_msgSend(a4, "pipelineOptions") >> 24) & 1;
  v11 = 44;
  if (objc_msgSend((id)objc_msgSend(a3, "device"), "pluginData"))
  {
    *v8 = 44;
    v11 = MTLSerializePluginDataDictionary((void *)objc_msgSend((id)objc_msgSend(a3, "device"), "pluginData"), (_BYTE *)v8 + *v8)+ 44;
  }
  if (objc_msgSend(a4, "pluginData"))
  {
    v8[1] = v11;
    MTLSerializePluginDataDictionary((void *)objc_msgSend(a4, "pluginData"), (_BYTE *)v8 + v8[1]);
  }
  v12 = dispatch_data_create(v8, v7, 0, (dispatch_block_t)*MEMORY[0x1E0C80CE0]);
  objc_msgSend(v6, "setFrameworkData:", v12);
  dispatch_release(v12);
  CC_SHA256_Init(&c);
  memset(data, 0, 32);
  if (a4)
    objc_msgSend(a4, "hashStableWithFunction:", a3);
  CC_SHA256_Update(&c, v9, 0x20u);
  CC_SHA256_Update(&c, data, 0x20u);
  CC_SHA256_Final(md, &c);
  v15[0] = *(_OWORD *)md;
  v15[1] = v18;
  objc_msgSend(v6, "setArchiveHashKey:", v15);
  return v6;
}

- (unint64_t)functionOptions
{
  return self->_functionOptions;
}

- (void)setFunctionOptions:(unint64_t)a3
{
  self->_functionOptions = a3;
}

- ($2772B1D07D29A72E8557B2574C0AE5C1)archiveHashKey
{
  __int128 v3;

  v3 = *(_OWORD *)self[3].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[2].var0[16];
  *(_OWORD *)&retstr->var0[16] = v3;
  return self;
}

- (void)setMaxAccelerationStructureTraversalDepth:(unsigned int)a3
{
  self->_maxAccelerationStructureTraversalDepth = a3;
}

@end
