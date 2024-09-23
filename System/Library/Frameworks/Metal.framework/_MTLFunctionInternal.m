@implementation _MTLFunctionInternal

- (id)relocations
{
  return self->super._relocations;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 40) = 0;
  *((_QWORD *)self + 45) = 0;
  *((_QWORD *)self + 52) = 0;
  *((_QWORD *)self + 53) = 0;
  return self;
}

- (void)setFunctionConstants:(id)a3
{
  NSArray *functionConstants;

  functionConstants = self->super._functionConstants;
  if (functionConstants != a3)
  {

    self->super._functionConstants = (NSArray *)a3;
  }
}

- (void)setVertexAttributes:(id)a3
{
  NSArray *vertexAttributes;

  vertexAttributes = self->super._vertexAttributes;
  if (vertexAttributes != a3)
  {

    self->super._vertexAttributes = (NSArray *)a3;
  }
}

- (const)bitCodeHash
{
  return (const $2772B1D07D29A72E8557B2574C0AE5C1 *)&self->_functionData.bitcodeHash;
}

- (void)dealloc
{
  MTLProgramObject *programObject;
  NSObject *functionInputs;
  NSObject *precompiledOutput;
  NSObject *airScript;
  NSObject *reflectionData;
  NSString *inheritedLibraryPath;
  objc_super v9;

  programObject = (MTLProgramObject *)self->_programObject;
  if (programObject)
  {
    MTLProgramObject::~MTLProgramObject(programObject);
    MEMORY[0x186DABFBC]();
    self->_programObject = 0;
  }

  functionInputs = self->_functionData.functionInputs;
  if (functionInputs)
    dispatch_release(functionInputs);
  precompiledOutput = self->super._precompiledOutput;
  if (precompiledOutput)
    dispatch_release(precompiledOutput);

  dispatch_release((dispatch_object_t)self->_functionQueue);
  self->_functionQueue = 0;
  airScript = self->_functionData.airScript;
  if (airScript)
    dispatch_release(airScript);
  reflectionData = self->super._reflectionData;
  if (reflectionData)
    dispatch_release(reflectionData);
  inheritedLibraryPath = self->_inheritedLibraryPath;
  if (inheritedLibraryPath)

  v9.receiver = self;
  v9.super_class = (Class)_MTLFunctionInternal;
  -[_MTLFunction dealloc](&v9, sel_dealloc);
}

- (BOOL)needsFunctionConstantValues
{
  return objc_msgSend(-[_MTLFunctionInternal functionConstants](self, "functionConstants"), "count") != 0;
}

- (id)functionConstants
{
  if (!self->_publicMetadataInitialized)
    -[_MTLFunctionInternal initializePublicMetadata](self, "initializePublicMetadata");
  return self->super._functionConstants;
}

- (void)initializePublicMetadata
{
  os_unfair_lock_s *v3;

  v3 = (os_unfair_lock_s *)((char *)self->super._libraryData + 84);
  os_unfair_lock_lock(v3);
  if (!self->_publicMetadataInitialized)
  {
    (*(void (**)(void *, unint64_t, _MTLFunctionInternal *, uint64_t))(*(_QWORD *)self->super._libraryData
                                                                                      + 192))(self->super._libraryData, self->_functionData.publicArgumentsOffset, self, 1);
    self->_publicMetadataInitialized = 1;
  }
  os_unfair_lock_unlock(v3);
}

- (unint64_t)patchType
{
  return *((_BYTE *)&self->_functionData + 105) & 3;
}

- (unint64_t)renderTargetArrayIndexType
{
  return self->_functionData.renderTargetArrayIndexType;
}

- (const)functionData
{
  return &self->_functionData;
}

- (id)newSpecializedFunctionWithDescriptor:(id)a3 destinationArchive:(id)a4 functionCache:(id)a5 error:(id *)a6
{
  void *v8;
  _MTLFunctionInternal *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;

  if (a6)
    *a6 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__10;
  v24 = __Block_byref_object_dispose__10;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__10;
  v18 = __Block_byref_object_dispose__10;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100___MTLFunctionInternal_newSpecializedFunctionWithDescriptor_destinationArchive_functionCache_error___block_invoke;
  v13[3] = &unk_1E0FE4430;
  v13[4] = &v20;
  v13[5] = &v14;
  -[_MTLFunctionInternal newSpecializedFunctionWithDescriptor:destinationArchive:functionCache:sync:completionHandler:](self, "newSpecializedFunctionWithDescriptor:destinationArchive:functionCache:sync:completionHandler:", a3, a4, a5, 1, v13);
  if ((_MTLFunctionInternal *)v21[5] == self)
  {

    v9 = self;
  }
  else
  {
    v8 = (void *)v15[5];
    if (a6)
      *a6 = v8;
    else

    v10 = v21[5];
    if (v10)
    {
      *(_BYTE *)(v10 + 296) = self->_functionData.bitcodeType;
      *(_QWORD *)(v21[5] + 304) = self->_functionData.pluginData;
      v11 = *(id *)(v21[5] + 304);
      v9 = (_MTLFunctionInternal *)v21[5];
    }
    else
    {
      v9 = 0;
    }
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v9;
}

- (void)newSpecializedFunctionWithDescriptor:(id)a3 destinationArchive:(id)a4 functionCache:(id)a5 sync:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL4 v8;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString *name;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  __n128 v21;
  uint64_t v22;
  char v23;
  int v24;
  const char *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  MTLAirEntry *v31;
  uint64_t v32;
  __n128 v33;
  uint64_t v34;
  void *v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  MTLDevice *device;
  uint64_t v40;
  uint64_t CompilerConnectionManager;
  uint64_t v42;
  dispatch_object_t v43;
  NSObject *v44;
  int v45;
  int v46;
  int v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  unint64_t *p_shared_owners;
  unint64_t v53;
  _BOOL4 v54;
  int v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  dispatch_object_t object;
  dispatch_object_t v59;
  _QWORD v60[11];
  _QWORD v61[2];
  __int128 v62;
  __int128 v63;
  MTLHashKey v64;
  _OWORD v65[2];
  uint64_t v66;

  v8 = a6;
  v66 = *MEMORY[0x1E0C80C00];
  if (!self->_publicMetadataInitialized)
    -[_MTLFunctionInternal initializePublicMetadata](self, "initializePublicMetadata");
  if ((!objc_msgSend(a3, "applyFunctionConstants") || !self->super._functionConstants)
    && !objc_msgSend(a3, "specializedName")
    && (!objc_msgSend(a3, "privateFunctions") || !objc_msgSend((id)objc_msgSend(a3, "privateFunctions"), "count")))
  {
    (*((void (**)(id, _MTLFunctionInternal *, _QWORD))a7 + 2))(a7, self, 0);
    return;
  }
  v55 = MTLGetCompilerOptions(self->super._device, objc_msgSend(a3, "pipelineOptions"), objc_msgSend((id)-[MTLDevice compiler](self->super._device, "compiler"), "compilerFlags") & 0x80, 3uLL, 0);
  v59 = 0;
  v13 = objc_msgSend(a3, "constantValues");
  object = 0;
  v14 = objc_msgSend(a3, "specializedName");
  v54 = v8;
  if (objc_msgSend(a3, "specializedName")
    && objc_msgSend((id)objc_msgSend(a3, "specializedName"), "isEqualToString:", self->super._name))
  {
    v14 = 0;
  }
  if (-[_MTLFunctionInternal specializedFunctionHash:requestData:airScript:constants:specializedName:privateFunctions:completionHandler:](self, "specializedFunctionHash:requestData:airScript:constants:specializedName:privateFunctions:completionHandler:", v65, &v59, &object, v13, v14, objc_msgSend(a3, "privateFunctions"), a7))
  {
    v15 = _MTLGetLibrariesCache((_MTLDevice *)self->super._device);
    name = self->super._name;
    if (objc_msgSend(a3, "specializedName"))
      name = (NSString *)objc_msgSend(a3, "specializedName");
    if ((objc_msgSend(a3, "pipelineOptions") & 4) != 0 || (objc_msgSend(a3, "options") & 4) != 0)
      v17 = 2;
    else
      v17 = ((unint64_t)objc_msgSend(a3, "pipelineOptions") >> 32) & 4;
    MultiLevelCacheFactory::createFunctionCache((uint64_t)self->super._device, objc_msgSend(a3, "binaryArchives"), (std::__shared_weak_count_vtbl *)a4, a5, *(_QWORD *)(v15 + 32), v17, &v56);
    v18 = -[_MTLFunction libraryData](self, "libraryData");
    v19 = (*(uint64_t (**)(void *))(*(_QWORD *)v18 + 304))(v18);
    v20 = v56;
    v21 = MTLHashKey::MTLHashKey((uint64_t)&v64, (uint64_t)v65);
    v22 = (*(uint64_t (**)(uint64_t, MTLHashKey *, uint64_t, __n128))(*(_QWORD *)v20 + 144))(v20, &v64, v19, v21);
    MTLHashKey::~MTLHashKey(&v64);
    if (objc_msgSend((id)objc_msgSend(a3, "binaryArchives"), "count"))
    {
      v23 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v56 + 120))(v56);
      if (!v22)
      {
        if ((v23 & 1) != 0)
        {
LABEL_31:
          dispatch_release(v59);
          v24 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v56 + 120))(v56);
          v25 = "FS cache";
          if (v24)
            v25 = "binary archive";
          v26 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to find specialized function \"%@\" in %s"), name, v25), "UTF8String");
          if (v26)
          {
            v27 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v26);
            if (!v27)
              v27 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v26, 1);
          }
          else
          {
            v27 = CFSTR("empty error message");
          }
          v34 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v27, *MEMORY[0x1E0CB2D50]);
          v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLLibraryErrorDomain"), 5, v34);
          if (object)
            dispatch_release(object);
          (*((void (**)(id, _QWORD, void *))a7 + 2))(a7, 0, v35);

          goto LABEL_43;
        }
        goto LABEL_29;
      }
    }
    else if (!v22)
    {
LABEL_29:
      if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v56 + 24))(v56) & 1) != 0
        || (*(unsigned int (**)(uint64_t))(*(_QWORD *)v56 + 32))(v56))
      {
        goto LABEL_31;
      }
      device = self->super._device;
      v40 = _MTLGetMTLCompilerLLVMVersionForDevice(device);
      CompilerConnectionManager = getCompilerConnectionManager(device, v40);
      v42 = operator new();
      *(_QWORD *)(v42 + 16) = 0;
      *(_QWORD *)v42 = &off_1E0FE1100;
      *(_DWORD *)(v42 + 128) = 0;
      *(_BYTE *)(v42 + 132) = 0;
      *(_QWORD *)(v42 + 32) = 0;
      *(_QWORD *)(v42 + 40) = 0;
      *(_OWORD *)(v42 + 64) = 0u;
      *(_OWORD *)(v42 + 80) = 0u;
      *(_OWORD *)(v42 + 96) = 0u;
      *(_OWORD *)(v42 + 109) = 0u;
      *(_OWORD *)(v42 + 136) = 0u;
      *(_OWORD *)(v42 + 152) = 0u;
      *(_OWORD *)(v42 + 168) = 0u;
      *(_DWORD *)(v42 + 8) = 15;
      v43 = v59;
      if (v59)
      {
        dispatch_retain(v59);
        v44 = v59;
      }
      else
      {
        v44 = 0;
      }
      *(_QWORD *)(v42 + 16) = v43;
      dispatch_release(v44);
      MTLCompilerFunctionRequest::setFunction((MTLCompilerFunctionRequest *)v42, &self->super);
      *(_DWORD *)(v42 + 48) = v55;
      v45 = *(_DWORD *)(-[MTLDevice limits](self->super._device, "limits") + 56);
      v46 = *(_DWORD *)(-[MTLDevice limits](self->super._device, "limits") + 188);
      *(_DWORD *)(v42 + 52) = v45;
      *(_DWORD *)(v42 + 56) = v46;
      MTLCompilerFunctionRequest::setSpecializedName((MTLCompilerFunctionRequest *)v42, (NSString *)objc_msgSend(a3, "specializedName"));
      if (a4)
      {
        v47 = objc_msgSend(a4, "remoteInsertionBegin");
        if (object)
        {
          if ((objc_msgSend(a4, "supportsAIRNT") & v47) == 1)
          {
            *(_BYTE *)(v42 + 132) = 1;
            MTLCompilerFunctionRequest::setAirScript(v42, object);
            v48 = (void *)-[MTLDevice targetDeviceArchitecture](self->super._device, "targetDeviceArchitecture");
            v49 = objc_msgSend(v48, "cpuType");
            *(_QWORD *)(v42 + 160) = (int)objc_msgSend(v48, "subType") | (unint64_t)(v49 << 32);
            v64.var0.var0 = 0;
            v50 = (void *)objc_msgSend(a4, "getArchiveIDWithErrorInternal:", &v64);
            if (!v50)
            {
              objc_msgSend(a4, "remoteInsertionEnd");
              if (object)
                dispatch_release(object);
              (*((void (**)(id, _QWORD, unint64_t))a7 + 2))(a7, 0, v64.var0.var0);
              (*(void (**)(uint64_t))(*(_QWORD *)v42 + 8))(v42);
              goto LABEL_43;
            }
            MTLCompilerFunctionRequest::setBinaryArchiveID((MTLCompilerFunctionRequest *)v42, (const char *)objc_msgSend(v50, "UTF8String"));
          }
        }
      }
      if (objc_msgSend(a3, "privateFunctions"))
        *(_QWORD *)(v42 + 96) = (id)objc_msgSend(a3, "privateFunctions");
      v51 = a4;
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3321888768;
      v60[2] = __117___MTLFunctionInternal_newSpecializedFunctionWithDescriptor_destinationArchive_functionCache_sync_completionHandler___block_invoke;
      v60[3] = &unk_1E0FE2270;
      v60[4] = a4;
      v60[5] = self;
      v60[6] = v19;
      v60[7] = name;
      v60[8] = object;
      v61[0] = v56;
      v61[1] = v57;
      if (v57)
      {
        p_shared_owners = (unint64_t *)&v57->__shared_owners_;
        do
          v53 = __ldxr(p_shared_owners);
        while (__stxr(v53 + 1, p_shared_owners));
      }
      v63 = v65[1];
      v62 = v65[0];
      v60[9] = a3;
      v60[10] = a7;
      (*(void (**)(uint64_t, _QWORD, uint64_t, _BOOL4, _QWORD *))(*(_QWORD *)CompilerConnectionManager + 24))(CompilerConnectionManager, 0, v42, v54, v60);
      std::shared_ptr<MultiLevelAirntBinaryCache>::~shared_ptr[abi:ne180100]((uint64_t)v61);
LABEL_43:
      v36 = v57;
      if (v57)
      {
        v37 = (unint64_t *)&v57->__shared_owners_;
        do
          v38 = __ldaxr(v37);
        while (__stlxr(v38 - 1, v37));
        if (!v38)
        {
          ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
          std::__shared_weak_count::__release_weak(v36);
        }
      }
      return;
    }
    if (*(_QWORD *)(v22 + 360))
    {
      if (object)
        dispatch_release(object);
      if (!a4)
        goto LABEL_38;
    }
    else
    {
      *(_QWORD *)(v22 + 360) = object;
      if (!a4)
      {
LABEL_38:
        -[_MTLFunctionInternal storeTrackingDataWithDescriptor:function:variantHash:](self, "storeTrackingDataWithDescriptor:function:variantHash:", a3, v22, v65);
        (*((void (**)(id, uint64_t, _QWORD))a7 + 2))(a7, v22, 0);

        dispatch_release(v59);
        goto LABEL_43;
      }
    }
    v28 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v22 + 48) + 128))(*(_QWORD *)(v22 + 48));
    v29 = -[_MTLFunction bitcodeData](self, "bitcodeData");
    v30 = dispatch_data_create((const void *)objc_msgSend(v29, "bytes"), objc_msgSend(v29, "length"), 0, 0);
    v31 = -[MTLAirEntry initWithData:bitcode:airScript:]([MTLAirEntry alloc], "initWithData:bitcode:airScript:", v28, v30, *(_QWORD *)(v22 + 360));
    dispatch_release(v30);
    v32 = v56;
    v33 = MTLHashKey::MTLHashKey((uint64_t)&v64, (uint64_t)v65);
    (*(void (**)(uint64_t, MTLHashKey *, MTLAirEntry *, __n128))(*(_QWORD *)v32 + 112))(v32, &v64, v31, v33);
    MTLHashKey::~MTLHashKey(&v64);

    goto LABEL_38;
  }
}

- (void)storeTrackingDataWithDescriptor:(id)a3 function:(id)a4 variantHash:(id *)a5
{
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  void *v11;
  void *shared_weak_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  _QWORD *v20;
  std::__shared_weak_count *v21;
  _QWORD *v22;
  std::__shared_weak_count *v23;

  if (-[_MTLFunctionInternal storeTrackingDataWithDescriptor:function:variantHash:]::onceToken != -1)
    dispatch_once(&-[_MTLFunctionInternal storeTrackingDataWithDescriptor:function:variantHash:]::onceToken, &__block_literal_global_965);
  if (-[_MTLFunctionInternal storeTrackingDataWithDescriptor:function:variantHash:]::enableMetalScriptCollection
    || (objc_msgSend(a3, "options") & 2) != 0)
  {
    v9 = (std::__shared_weak_count *)operator new(0x30uLL);
    v9->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    v9->__shared_weak_owners_ = 0;
    v9->__vftable = (std::__shared_weak_count_vtbl *)&off_1E0FDF3F0;
    v9[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E0FDEFA8;
    v9[1].__shared_owners_ = 0;
    v9[1].__shared_weak_owners_ = 0;
    v22 = &v9[1].__vftable;
    v23 = v9;
    v9[1].__shared_owners_ = (uint64_t)self;
    v11 = (void *)objc_msgSend(a3, "constantValues");
    shared_weak_owners = (void *)v9[1].__shared_weak_owners_;
    if (shared_weak_owners)

    v9[1].__shared_weak_owners_ = (uint64_t)v11;
    v20 = &v9[1].__vftable;
    v21 = v9;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
    objc_msgSend(a4, "setTrackingData:", &v20);
    v14 = v21;
    if (v21)
    {
      v15 = (unint64_t *)&v21->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    v17 = v23;
    if (v23)
    {
      v18 = (unint64_t *)&v23->__shared_owners_;
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }
  if (objc_msgSend(a3, "constantValues", v20))
    objc_msgSend(a4, "setFunctionConstantSpecializationHash:", a5);
}

- (void)setFunctionConstantSpecializationHash:(id *)a3
{
  __int128 v3;

  if (a3)
  {
    v3 = *(_OWORD *)&a3->var0[16];
    *(_OWORD *)self->super._functionConstantSpecializationHash.key = *(_OWORD *)a3->var0;
    *(_OWORD *)&self->super._functionConstantSpecializationHash.key[16] = v3;
  }
}

- (BOOL)specializedFunctionHash:(id *)a3 requestData:(id *)a4 airScript:(id *)a5 constants:(id)a6 specializedName:(id)a7 privateFunctions:(id)a8 completionHandler:(id)a9
{
  MTLFunctionConstantValues *v15;
  id v16;
  const void *v17;
  __int128 v18;
  uint64_t v19;
  id v20;
  size_t size;
  uint64_t v23;
  _OWORD v24[2];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  size = 0;
  v23 = 0;
  if (a6)
  {
    v15 = (MTLFunctionConstantValues *)a6;
    v16 = a6;
  }
  else
  {
    v15 = objc_alloc_init(MTLFunctionConstantValues);
  }
  v17 = (const void *)-[MTLFunctionConstantValues serializedConstantDataForFunction:dataSize:errorMessage:](v15, "serializedConstantDataForFunction:dataSize:errorMessage:", self, &size, &v23);
  if (v17)
  {
    *a5 = (id)-[MTLFunctionConstantValues newConstantScriptForFunction:name:specializedName:errorMessage:](v15, "newConstantScriptForFunction:name:specializedName:errorMessage:", self, self->super._name, a7, &v23);

    *a4 = dispatch_data_create(v17, size, 0, (dispatch_block_t)*MEMORY[0x1E0C80CE0]);
    createHashForType(15, v17, size, &self->_functionData.bitcodeHash, 0, a7, a8, (unsigned __int8 *)v24);
    v18 = v24[1];
    *(_OWORD *)a3->var0 = v24[0];
    *(_OWORD *)&a3->var0[16] = v18;
  }
  else
  {
    v19 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v23, *MEMORY[0x1E0CB2D50]);
    v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLLibraryErrorDomain"), 3, v19);

    (*((void (**)(id, _QWORD, id))a9 + 2))(a9, 0, v20);
  }
  return v17 != 0;
}

- (void)setOptions:(unint64_t)a3
{
  self->super._options = a3;
}

- (id)precompiledOutput
{
  return self->super._precompiledOutput;
}

- (id)functionConstantsDictionary
{
  os_unfair_lock_s *v3;
  NSDictionary *functionConstantDictionary;
  NSArray *functionConstants;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  id v11;

  if (!self->_publicMetadataInitialized)
    -[_MTLFunctionInternal initializePublicMetadata](self, "initializePublicMetadata");
  v3 = (os_unfair_lock_s *)((char *)self->super._libraryData + 84);
  os_unfair_lock_lock(v3);
  functionConstantDictionary = self->super._functionConstantDictionary;
  if (!functionConstantDictionary)
  {
    functionConstants = self->super._functionConstants;
    if (functionConstants)
    {
      v6 = -[NSArray count](functionConstants, "count");
      v7 = operator new[]();
      v8 = operator new[]();
      if (v6)
      {
        v9 = 0;
        v10 = 1;
        do
        {
          v11 = -[NSArray objectAtIndexedSubscript:](self->super._functionConstants, "objectAtIndexedSubscript:", v9);
          *(_QWORD *)(v8 + 8 * v9) = v11;
          *(_QWORD *)(v7 + 8 * v9) = objc_msgSend(v11, "name");
          v9 = v10;
        }
        while (v6 > v10++);
      }
      self->super._functionConstantDictionary = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:count:", v8, v7, v6);
      MEMORY[0x186DABFA4](v7, 0x80C80B8603338);
      MEMORY[0x186DABFA4](v8, 0x80C80B8603338);
      functionConstantDictionary = self->super._functionConstantDictionary;
    }
    else
    {
      functionConstantDictionary = (NSDictionary *)MEMORY[0x1E0C9AA70];
      self->super._functionConstantDictionary = functionConstantDictionary;
    }
  }
  os_unfair_lock_unlock(v3);
  return functionConstantDictionary;
}

- (_MTLFunctionInternal)initWithName:(id)a3 type:(unint64_t)a4 libraryData:(void *)a5 functionData:(MTLFunctionData *)a6 device:(id)a7
{
  return -[_MTLFunctionInternal initWithName:type:libraryData:functionData:inheritedLibraryPath:device:](self, "initWithName:type:libraryData:functionData:inheritedLibraryPath:device:", a3, a4, a5, a6, 0, a7);
}

- (id)functionInputs
{
  return self->_functionData.functionInputs;
}

- (id)pluginData
{
  return self->_functionData.pluginData;
}

- (unint64_t)bitCodeFileSize
{
  return self->_functionData.bitCodeFileSize;
}

- (unsigned)bitcodeType
{
  return self->_functionData.bitcodeType;
}

- (unint64_t)bitCodeOffset
{
  return self->_functionData.bitCodeOffset;
}

- (_MTLFunctionInternal)initWithName:(id)a3 type:(unint64_t)a4 libraryData:(void *)a5 functionData:(MTLFunctionData *)a6 inheritedLibraryPath:(id)a7 device:(id)a8
{
  _MTLFunctionInternal *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_MTLFunctionInternal;
  v10 = -[_MTLFunction initWithName:type:libraryData:device:](&v19, sel_initWithName_type_libraryData_device_, a3, a4, a5, a8);
  v10->_inheritedLibraryPath = (NSString *)objc_msgSend(a7, "copy");
  v10->_publicMetadataInitialized = 0;
  v10->_privateMetadataInitialized = 0;
  v11 = *(_OWORD *)&a6->publicArgumentsOffset;
  *(_OWORD *)&v10->_functionData.bitCodeOffset = *(_OWORD *)&a6->bitCodeOffset;
  *(_OWORD *)&v10->_functionData.publicArgumentsOffset = v11;
  v12 = *(_OWORD *)&a6->bitcodeHash.key[24];
  v14 = *(_OWORD *)&a6->sourceArchiveOffset;
  v13 = *(_OWORD *)&a6->airMajorVersion;
  *(_OWORD *)&v10->_functionData.bitcodeHash.key[8] = *(_OWORD *)&a6->bitcodeHash.key[8];
  *(_OWORD *)&v10->_functionData.bitcodeHash.key[24] = v12;
  *(_OWORD *)&v10->_functionData.sourceArchiveOffset = v14;
  *(_OWORD *)&v10->_functionData.airMajorVersion = v13;
  v15 = *(_OWORD *)&a6->baseFunctionHash.key[24];
  v17 = *(_OWORD *)&a6->pluginData;
  v16 = *(_OWORD *)&a6->functionInputs;
  *(_OWORD *)&v10->_functionData.baseFunctionHash.key[8] = *(_OWORD *)&a6->baseFunctionHash.key[8];
  *(_OWORD *)&v10->_functionData.baseFunctionHash.key[24] = v15;
  *(_OWORD *)&v10->_functionData.pluginData = v17;
  *(_OWORD *)&v10->_functionData.functionInputs = v16;
  v10->_programObject = 0;
  *(_OWORD *)v10->super._functionConstantSpecializationHash.key = 0u;
  *(_OWORD *)&v10->super._functionConstantSpecializationHash.key[16] = 0u;
  v10->_functionQueue = (OS_dispatch_queue *)dispatch_queue_create("function queue", 0);
  return v10;
}

- (id)bitcodeDataInternal
{
  int v3;
  id result;
  void *v5;
  size_t size;
  uint64_t v7;

  size = 0;
  v7 = 0;
  v3 = (*(uint64_t (**)(void *, unint64_t, unint64_t, uint64_t *, size_t *))(*(_QWORD *)self->super._libraryData
                                                                                                  + 200))(self->super._libraryData, -[_MTLFunctionInternal bitCodeOffset](self, "bitCodeOffset"), -[_MTLFunctionInternal bitCodeFileSize](self, "bitCodeFileSize"), &v7, &size);
  result = 0;
  if (v3)
  {
    v5 = malloc_type_malloc(size, 0xBC3097AEuLL);
    (*(void (**)(void *, void *, uint64_t, size_t))(*(_QWORD *)self->super._libraryData + 208))(self->super._libraryData, v5, v7, size);
    if (v5)
      return dispatch_data_create(v5, size, 0, (dispatch_block_t)*MEMORY[0x1E0C80CE0]);
    else
      return 0;
  }
  return result;
}

- (id)specializationAirScript
{
  MTLFunctionData *p_functionData;
  id result;
  NSObject *v4;
  size_t v5;
  void *buffer_ptr;

  p_functionData = &self->_functionData;
  result = self->_functionData.airScript;
  if (result)
  {
    v5 = 0;
    buffer_ptr = 0;
    v4 = dispatch_data_create_map((dispatch_data_t)result, (const void **)&buffer_ptr, &v5);
    if (buffer_ptr && !strncmp((const char *)buffer_ptr + 4, "AIRC", 4uLL))
    {
      dispatch_release(v4);
      return p_functionData->airScript;
    }
    else
    {
      dispatch_release(v4);
      return 0;
    }
  }
  return result;
}

- (id)stitchingAirScript
{
  MTLFunctionData *p_functionData;
  id result;
  NSObject *v4;
  size_t v5;
  void *buffer_ptr;

  p_functionData = &self->_functionData;
  result = self->_functionData.airScript;
  if (result)
  {
    v5 = 0;
    buffer_ptr = 0;
    v4 = dispatch_data_create_map((dispatch_data_t)result, (const void **)&buffer_ptr, &v5);
    if (buffer_ptr && !strncmp((const char *)buffer_ptr + 4, "AIRS", 4uLL))
    {
      dispatch_release(v4);
      return p_functionData->airScript;
    }
    else
    {
      dispatch_release(v4);
      return 0;
    }
  }
  return result;
}

- (id)airScript
{
  return self->_functionData.airScript;
}

- (id)reflectionData
{
  id result;
  os_unfair_lock_s *v4;

  result = self->super._reflectionData;
  if (!result)
  {
    v4 = (os_unfair_lock_s *)((char *)self->super._libraryData + 84);
    os_unfair_lock_lock(v4);
    if (!self->super._reflectionData && self->_functionData.reflectionDataOffset != -1)
      self->super._reflectionData = (OS_dispatch_data *)(*(uint64_t (**)(void *))(*(_QWORD *)self->super._libraryData
                                                                                          + 152))(self->super._libraryData);
    os_unfair_lock_unlock(v4);
    return self->super._reflectionData;
  }
  return result;
}

- ($2772B1D07D29A72E8557B2574C0AE5C1)baseFunctionHash
{
  __int128 v3;

  v3 = *(_OWORD *)&self[10].var0[24];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[10].var0[8];
  *(_OWORD *)&retstr->var0[16] = v3;
  return self;
}

- (void)setTrackingData:(shared_ptr<TrackingData>)a3
{
  std::shared_ptr<CompilerConnection>::operator=[abi:ne180100](&self->_trackingData.__ptr_, (uint64_t *)a3.__ptr_);
}

- (SpecializedFunctionTrackingData)specializedFunctionTrackingData
{
  SpecializedFunctionTrackingData *result;

  result = -[_MTLFunctionInternal specializationAirScript](self, "specializationAirScript");
  if (result)
    return (SpecializedFunctionTrackingData *)self->_trackingData.__ptr_;
  return result;
}

- (void)stitchedLibraryTrackingData
{
  void *result;

  result = -[_MTLFunctionInternal stitchingAirScript](self, "stitchingAirScript");
  if (result)
    return self->_trackingData.__ptr_;
  return result;
}

- (id)inheritedLibraryPath
{
  return self->_inheritedLibraryPath;
}

- (void)programObject
{
  MTLProgramObject *programObject;

  programObject = (MTLProgramObject *)self->_programObject;
  if (!programObject)
  {
    programObject = (MTLProgramObject *)operator new();
    MTLProgramObject::MTLProgramObject(programObject);
    self->_programObject = programObject;
  }
  return programObject;
}

- (id)importedSymbols
{
  id result;

  result = self->super._libraryData;
  if (result)
    return (id)(*(uint64_t (**)(id))(*(_QWORD *)result + 64))(result);
  return result;
}

- (id)importedLibraries
{
  id result;

  result = self->super._libraryData;
  if (result)
    return (id)(*(uint64_t (**)(id))(*(_QWORD *)result + 72))(result);
  return result;
}

- (void)setBitcodeType:(unsigned __int8)a3
{
  abort();
}

- (void)setPluginData:(id)a3
{
  abort();
}

- (int64_t)patchControlPointCount
{
  unint64_t v2;

  v2 = *((unsigned __int8 *)&self->_functionData + 105);
  if (v2 > 0x83)
    return -1;
  else
    return v2 >> 2;
}

- (void)initializeStitchableFunctionMetadata
{
  NSObject *functionQueue;
  _QWORD block[5];

  functionQueue = self->_functionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60___MTLFunctionInternal_initializeStitchableFunctionMetadata__block_invoke;
  block[3] = &unk_1E0FE2880;
  block[4] = self;
  dispatch_sync(functionQueue, block);
}

- (id)vertexAttributes
{
  if (self->super._functionType != 1)
    return 0;
  if (!self->_publicMetadataInitialized)
    -[_MTLFunctionInternal initializePublicMetadata](self, "initializePublicMetadata");
  return self->super._vertexAttributes;
}

- (void)setReturnType:(id)a3
{
  MTLType *returnType;

  returnType = self->super._returnType;
  if (returnType != a3)
  {

    self->super._returnType = (MTLType *)a3;
  }
}

- (id)returnType
{
  if (-[_MTLFunction functionType](self, "functionType") == 5)
  {
    if (!self->_stitchableFunctionMetadataInitialized)
      -[_MTLFunctionInternal initializeStitchableFunctionMetadata](self, "initializeStitchableFunctionMetadata");
  }
  else if (!self->_publicMetadataInitialized)
  {
    -[_MTLFunctionInternal initializePublicMetadata](self, "initializePublicMetadata");
  }
  return self->super._returnType;
}

- (void)setArguments:(id)a3
{
  NSArray *arguments;

  arguments = self->super._arguments;
  if (arguments != a3)
  {

    self->super._arguments = (NSArray *)a3;
  }
}

- (id)arguments
{
  if (-[_MTLFunction functionType](self, "functionType") == 5)
  {
    if (!self->_stitchableFunctionMetadataInitialized)
      -[_MTLFunctionInternal initializeStitchableFunctionMetadata](self, "initializeStitchableFunctionMetadata");
  }
  else if (!self->_publicMetadataInitialized)
  {
    -[_MTLFunctionInternal initializePublicMetadata](self, "initializePublicMetadata");
  }
  return self->super._arguments;
}

- (void)setPrecompiledOutput:(id)a3
{
  NSObject *precompiledOutput;

  precompiledOutput = self->super._precompiledOutput;
  if (precompiledOutput)
    dispatch_release(precompiledOutput);
  self->super._precompiledOutput = (OS_dispatch_data *)a3;
  if (a3)
    dispatch_retain((dispatch_object_t)a3);
}

- (id)stageInputAttributes
{
  if ((self->super._functionType | 2) == 3 && !self->_publicMetadataInitialized)
    -[_MTLFunctionInternal initializePublicMetadata](self, "initializePublicMetadata");
  return self->super._vertexAttributes;
}

- (void)setStageInputAttributes:(id)a3
{
  NSArray *vertexAttributes;

  vertexAttributes = self->super._vertexAttributes;
  if (vertexAttributes != a3)
  {

    self->super._vertexAttributes = (NSArray *)a3;
  }
}

- (unsigned)requiredLLVMVersion
{
  return _MTLGetMTLCompilerLLVMVersionForDevice(self->super._device);
}

- (unint64_t)sourceArchiveOffset
{
  return self->_functionData.sourceArchiveOffset;
}

- (void)setSourceArchiveOffset:(unint64_t)a3
{
  self->_functionData.sourceArchiveOffset = a3;
}

- (id)newFunctionWithPluginData:(id)a3 bitcodeType:(unsigned __int8)a4
{
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  const void *v12;
  CC_SHA256_CTX c;
  _OWORD v15[3];
  _OWORD v16[2];
  __int128 v17;
  __int128 v18;
  __int128 object;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = *(_OWORD *)&self->_functionData.functionInputs;
  v18 = *(_OWORD *)&self->_functionData.pluginData;
  object = v7;
  v8 = *(_OWORD *)&self->_functionData.baseFunctionHash.key[24];
  v20 = *(_OWORD *)&self->_functionData.baseFunctionHash.key[8];
  v21 = v8;
  v9 = *(_OWORD *)&self->_functionData.airMajorVersion;
  v15[2] = *(_OWORD *)&self->_functionData.sourceArchiveOffset;
  v16[0] = v9;
  v10 = *(_OWORD *)&self->_functionData.bitcodeHash.key[24];
  v16[1] = *(_OWORD *)&self->_functionData.bitcodeHash.key[8];
  v17 = v10;
  v11 = *(_OWORD *)&self->_functionData.publicArgumentsOffset;
  v15[0] = *(_OWORD *)&self->_functionData.bitCodeOffset;
  v15[1] = v11;
  if ((_QWORD)object)
    dispatch_retain((dispatch_object_t)object);
  *(_QWORD *)&v18 = a3;
  BYTE8(v17) = a4;
  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, (char *)v16 + 8, 0x20u);
  v12 = (const void *)objc_msgSend((id)v18, "bytes");
  CC_SHA256_Update(&c, v12, objc_msgSend((id)v18, "length"));
  CC_SHA256_Final((unsigned __int8 *)v16 + 8, &c);
  return -[_MTLFunctionInternal initWithName:type:libraryData:functionData:device:]([_MTLFunctionInternal alloc], "initWithName:type:libraryData:functionData:device:", self->super._name, self->super._functionType, self->super._libraryData, v15, self->super._device);
}

- (void)initializePrivateMetadata
{
  os_unfair_lock_s *v3;

  v3 = (os_unfair_lock_s *)((char *)self->super._libraryData + 84);
  os_unfair_lock_lock(v3);
  if (!self->_privateMetadataInitialized)
  {
    (*(void (**)(void *, unint64_t, _MTLFunctionInternal *, _QWORD))(*(_QWORD *)self->super._libraryData
                                                                                     + 192))(self->super._libraryData, self->_functionData.privateArgumentsOffset, self, 0);
    self->_privateMetadataInitialized = 1;
  }
  os_unfair_lock_unlock(v3);
}

- (void)setFilePath:(id)a3
{
  NSString *filePath;

  filePath = self->_filePath;
  if (filePath != a3)
  {

    self->_filePath = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (id)filePath
{
  if (!self->_privateMetadataInitialized && self->super._libraryData)
    -[_MTLFunctionInternal initializePrivateMetadata](self, "initializePrivateMetadata");
  return self->_filePath;
}

- (void)initializeSourceArchive
{
  os_unfair_lock_s *v3;
  unint64_t sourceArchiveOffset;

  v3 = (os_unfair_lock_s *)((char *)self->super._libraryData + 84);
  os_unfair_lock_lock(v3);
  if (!self->_sourceArchiveMetadataInitialized)
  {
    sourceArchiveOffset = self->_functionData.sourceArchiveOffset;
    if (sourceArchiveOffset != -1)
    {
      if (!self->_privateMetadataInitialized)
      {
        (*(void (**)(void *, unint64_t, _MTLFunctionInternal *, _QWORD))(*(_QWORD *)self->super._libraryData
                                                                                         + 192))(self->super._libraryData, self->_functionData.privateArgumentsOffset, self, 0);
        self->_privateMetadataInitialized = 1;
        sourceArchiveOffset = self->_functionData.sourceArchiveOffset;
      }
      (*(void (**)(void *, unint64_t, _MTLFunctionInternal *, uint64_t))(*(_QWORD *)self->super._libraryData
                                                                                        + 192))(self->super._libraryData, sourceArchiveOffset, self, 2);
      self->_sourceArchiveMetadataInitialized = 1;
    }
  }
  os_unfair_lock_unlock(v3);
}

- (void)setUnpackedFilePath:(id)a3
{
  NSString *unpackedFilePath;

  unpackedFilePath = self->super._unpackedFilePath;
  if (unpackedFilePath != a3)
  {

    self->super._unpackedFilePath = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (id)unpackedFilePath
{
  if (!self->_sourceArchiveMetadataInitialized && self->super._libraryData)
    -[_MTLFunctionInternal initializeSourceArchive](self, "initializeSourceArchive");
  return self->super._unpackedFilePath;
}

- (void)setLineNumber:(int64_t)a3
{
  self->_lineNumber = a3;
}

- (int64_t)lineNumber
{
  if (!self->_privateMetadataInitialized && self->super._libraryData)
    -[_MTLFunctionInternal initializePrivateMetadata](self, "initializePrivateMetadata");
  return self->_lineNumber;
}

- (void)setRelocations:(id)a3
{
  NSArray *relocations;

  relocations = self->super._relocations;
  if (relocations != a3)
  {

    self->super._relocations = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (void).cxx_destruct
{
  std::shared_ptr<MultiLevelAirntBinaryCache>::~shared_ptr[abi:ne180100]((uint64_t)&self->_trackingData);
}

@end
