@implementation _ANEVirtualClient

+ (id)sharedConnection
{
  if (+[_ANEVirtualClient sharedConnection]::onceToken != -1)
    dispatch_once(&+[_ANEVirtualClient sharedConnection]::onceToken, &__block_literal_global_4);
  return (id)+[_ANEVirtualClient sharedConnection]::client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (_ANEVirtualClient)initWithSingletonAccess
{
  _ANEVirtualClient *v3;
  uint64_t v4;
  void *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  const __CFDictionary *v8;
  _ANEVirtualClient *v9;
  char v10;
  task_port_t *v11;
  io_service_t v12;
  NSObject *v13;
  _BOOL4 v14;
  kern_return_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint32_t outputCnt;
  uint64_t output;
  uint8_t v28;
  _BYTE v29[11];
  io_iterator_t existing;
  objc_super v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)_ANEVirtualClient;
  v3 = -[_ANEVirtualClient init](&v31, sel_init);
  if (!v3)
    goto LABEL_32;
  +[_ANELog framework](_ANELog, "framework");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)gLogger;
  gLogger = v4;

  if (!+[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
      -[_ANEVirtualClient initWithSingletonAccess].cold.9();
    goto LABEL_8;
  }
  v6 = dispatch_queue_create("com.apple.ane.avc", 0);
  queue = v3->_queue;
  v3->_queue = (OS_dispatch_queue *)v6;

  v3->_connect = 0;
  existing = 0;
  v8 = IOServiceMatching("AppleVirtIONeuralEngineDevice");
  if (!IOServiceGetMatchingServices(*MEMORY[0x1E0CBBAA8], v8, &existing))
  {
    if (!existing)
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
        -[_ANEVirtualClient initWithSingletonAccess].cold.1();
      goto LABEL_8;
    }
    v10 = 0;
    v11 = (task_port_t *)MEMORY[0x1E0C83DA0];
    while (1)
    {
      v12 = IOIteratorNext(existing);
      if (!v12)
        break;
      v13 = gLogger;
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
        -[_ANEVirtualClient initWithSingletonAccess].cold.7(&v28, v29, v13);
      if (IOServiceOpen(v12, *v11, 0, &v3->_connect))
      {
        if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
          -[_ANEVirtualClient initWithSingletonAccess].cold.6();
        v10 = 1;
        break;
      }
      v10 = 1;
      IOObjectRelease(v12);
    }
    IOObjectRelease(existing);
    v14 = os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG);
    if ((v10 & 1) == 0)
    {
      if (v14)
        -[_ANEVirtualClient initWithSingletonAccess].cold.5();
      goto LABEL_8;
    }
    if (v14)
      -[_ANEVirtualClient initWithSingletonAccess].cold.4();
    output = 0;
    outputCnt = 1;
    v15 = IOConnectCallScalarMethod(v3->_connect, 0, 0, 0, &output, &outputCnt);
    v16 = gLogger;
    if (v15)
    {
      v17 = (id)gLogger;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient initWithSingletonAccess].cold.3();
      }

      goto LABEL_8;
    }
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
      -[_ANEVirtualClient initWithSingletonAccess].cold.2(v16, v18, v19, v20, v21, v22, v23, v24);
LABEL_32:
    -[_ANEVirtualClient exchangeBuildVersionInfo](v3, "exchangeBuildVersionInfo");
    v9 = v3;
    goto LABEL_33;
  }
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
    -[_ANEVirtualClient initWithSingletonAccess].cold.8();
LABEL_8:
  v9 = 0;
LABEL_33:

  return v9;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_ANEVirtualClient;
  -[_ANEVirtualClient dealloc](&v2, sel_dealloc);
}

+ (id)new
{
  return 0;
}

- (_ANEVirtualClient)init
{

  return 0;
}

- (BOOL)compileModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 error:(id *)a6
{
  id v10;
  NSObject *v11;
  __CFDictionary *v12;
  __CFDictionary *Mutable;
  const __CFAllocator *v14;
  CFMutableArrayRef v15;
  CFNumberRef v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *BaseAddress;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  BOOL v35;
  uint64_t v37;
  id v38;
  void *v39;
  id v41;
  id v42;
  _BYTE v43[72];
  IOSurfaceRef buffer;
  uint64_t v45;
  unsigned int v46[441];
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int v50;
  uint64_t v51;
  void *v52;
  _QWORD v53[11];

  v53[9] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v41 = a4;
  v11 = (id)gLogger;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualClient compileModel:options:qos:error:].cold.6();
  }

  bzero(v43, 0x1728uLL);
  if ((-[_ANEVirtualClient negotiatedCapabilityMask](self, "negotiatedCapabilityMask") & 4) == 0)
  {
    -[_ANEVirtualClient copyModel:options:vmData:](self, "copyModel:options:vmData:", v10, v41, v43);
    -[_ANEVirtualClient copyOptions:vmData:](self, "copyOptions:vmData:", v41, v43);
    -[_ANEVirtualClient copyModelOptionFiles:options:vmData:](self, "copyModelOptionFiles:options:vmData:", v10, v41, v43);
    -[_ANEVirtualClient copyErrorValue:](self, "copyErrorValue:", v43);
    v46[0] = a5;
    -[_ANEVirtualClient callIOUserClient:inParams:outParams:](self, "callIOUserClient:inParams:outParams:", 1, &v45, &v47);
    v12 = 0;
LABEL_11:
    if (v48)
    {
      +[_ANEVirtualClient dictionaryGetNSStringForKey:key:](_ANEVirtualClient, "dictionaryGetNSStringForKey:key:", v12, CFSTR("modelCacheURLIdentifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
        objc_msgSend(v10, "setCacheURLIdentifier:", v18);
      -[_ANEVirtualClient getModelAttribute:](self, "getModelAttribute:", v43);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateModelAttributes:state:", v19, 2);
      v20 = (id)gLogger;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient compileModel:options:qos:error:].cold.2();
      }

    }
    if (a6 && v50)
    {
      IOSurfaceLock(buffer, 0, 0);
      BaseAddress = IOSurfaceGetBaseAddress(buffer);
      v22 = objc_alloc(MEMORY[0x1E0C99D50]);
      v39 = (void *)objc_msgSend(v22, "initWithBytes:length:", BaseAddress, v50);
      v23 = (void *)MEMORY[0x1E0C99E60];
      v53[0] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setWithArray:", v24);
      v37 = objc_claimAutoreleasedReturnValue();

      v42 = 0;
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v39, &v42);
      v26 = v42;
      if (v26)
      {
        v27 = (id)gLogger;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualClient compileModel:options:qos:error:].cold.1();
        }

      }
      objc_msgSend(v25, "decodeObjectOfClasses:forKey:", v37, *MEMORY[0x1E0CB2CD0], v37);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      IOSurfaceUnlock(buffer, 0, 0);
      v29 = (void *)MEMORY[0x1E0CB35C8];
      +[_ANEStrings errorDomainVirtIO](_ANEStrings, "errorDomainVirtIO");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v49;
      v51 = *MEMORY[0x1E0CB2D50];
      v52 = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = objc_retainAutorelease(v33);
      *a6 = v34;

    }
    -[_ANEVirtualClient updateError:error:](self, "updateError:error:", v43, a6);
    -[_ANEVirtualClient releaseIOSurfaces:](self, "releaseIOSurfaces:", v43);
    if (v12)
      CFRelease(v12);
    v35 = v48 != 0;
    goto LABEL_27;
  }
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
    -[_ANEVirtualClient compileModel:options:qos:error:].cold.5();
  v48 = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v15 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:](self, "copyAllModelFiles:dictionary:ioSurfaceRefs:", v10, Mutable, v15);
  -[_ANEVirtualClient copyModelMetaData:options:dictionary:vmData:](self, "copyModelMetaData:options:dictionary:vmData:", v10, v41, Mutable, v43);
  -[_ANEVirtualClient copyOptions:dictionary:vmData:](self, "copyOptions:dictionary:vmData:", v41, Mutable, v43);
  -[_ANEVirtualClient copyModelOptionFiles:options:dictionary:vmData:](self, "copyModelOptionFiles:options:dictionary:vmData:", v10, v41, Mutable, v43);
  -[_ANEVirtualClient copyErrorValue:vmData:](self, "copyErrorValue:vmData:", Mutable, v43);
  v46[0] = a5;
  v16 = CFNumberCreate(v14, kCFNumberSInt32Type, v46);
  CFDictionarySetValue(Mutable, CFSTR("qos"), v16);
  CFRelease(v16);
  +[_ANEVirtualClient setCodeSigningIdentity:](_ANEVirtualClient, "setCodeSigningIdentity:", Mutable);
  -[_ANEVirtualClient printDictionary:](self, "printDictionary:", Mutable);
  v12 = -[_ANEVirtualClient callIOUserClientWithDictionary:inDictionary:error:](self, "callIOUserClientWithDictionary:inDictionary:error:", 1, Mutable, a6);
  CFRelease(Mutable);
  -[_ANEVirtualClient printDictionary:](self, "printDictionary:", v12);
  +[_ANEVirtualClient freeModelFileIOSurfaces:](_ANEVirtualClient, "freeModelFileIOSurfaces:", v15);
  CFRelease(v15);
  if (v12)
  {
    v17 = (id)gLogger;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient compileModel:options:qos:error:].cold.4();
    }

    +[_ANEVirtualClient copyDictionaryDataToStruct:dictionary:](_ANEVirtualClient, "copyDictionaryDataToStruct:dictionary:", &v47, v12);
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
    -[_ANEVirtualClient compileModel:options:qos:error:].cold.3();
  -[_ANEVirtualClient releaseIOSurfaces:](self, "releaseIOSurfaces:", v43);
  v35 = 0;
LABEL_27:

  return v35;
}

+ (void)printStruct:(VirtANEModel *)a3
{
  NSObject *v4;

  if (a3)
  {
    v4 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
      +[_ANEVirtualClient printStruct:].cold.1((uint64_t)a3, v4);
  }
}

- (BOOL)loadModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 error:(id *)a6
{
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  const void *v19;
  aneserializers::anemodelparams_v1::_ANEModelParamsSerializerDeserializer *v20;
  __CFDictionary *Mutable;
  const __CFAllocator *v22;
  CFMutableArrayRef v23;
  void *v24;
  BOOL v25;
  void *v26;
  BOOL v27;
  void *v28;
  NSObject *v29;
  CFNumberRef v30;
  void *v31;
  NSObject *v32;
  CFDataRef v33;
  void *v34;
  BOOL v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __IOSurface *v43;
  void *BaseAddress;
  NSObject *v45;
  BOOL v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  void *v51;
  const char *aSelector;
  const char *aSelectora;
  uint64_t v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  uint64_t v61;
  int v62[441];
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  unsigned int v68;
  uint64_t v69;

  v6 = ((uint64_t (*)(_ANEVirtualClient *, SEL, id, id, _QWORD, id *))MEMORY[0x1E0C80A78])(self, a2, a3, a4, *(_QWORD *)&a5, a6);
  aSelector = v7;
  v54 = v8;
  v10 = v9;
  v12 = v11;
  v13 = (void *)v6;
  v69 = *MEMORY[0x1E0C80C00];
  v15 = v14;
  v16 = v12;
  v17 = (id)gLogger;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(aSelector);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v56 = v51;
    v57 = 2112;
    v58 = v15;
    v59 = 2112;
    v60 = v16;
    _os_log_debug_impl(&dword_1D3352000, v17, OS_LOG_TYPE_DEBUG, "%@:ANEVirtualClient start Model=%@ options=%@\n", buf, 0x20u);

  }
  bzero(buf, 0x1728uLL);
  if ((objc_msgSend(v13, "negotiatedCapabilityMask") & 4) != 0)
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
      -[_ANEVirtualClient loadModel:options:qos:error:].cold.9();
    v64 = 0;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v22 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v23 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    objc_msgSend(v15, "modelURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24 == 0;

    if (v25 || (objc_msgSend(v13, "copyAllModelFiles:dictionary:ioSurfaceRefs:", v15, Mutable, v23) & 1) != 0)
    {
      objc_msgSend(v15, "getCacheURLIdentifier", aSelector);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26 == 0;

      if (!v27)
      {
        objc_msgSend(v15, "cacheURLIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = (id)gLogger;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(aSelectora);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualClient loadModel:options:qos:error:].cold.8();
        }

        CFDictionarySetValue(Mutable, CFSTR("modelCacheURLIdentifier"), v28);
      }
      objc_msgSend(v13, "copyModelMetaData:options:dictionary:vmData:", v15, v16, Mutable, buf);
      objc_msgSend(v13, "copyOptions:dictionary:vmData:", v16, Mutable, buf);
      objc_msgSend(v13, "copyModelOptionFiles:options:dictionary:vmData:", v15, v16, Mutable, buf);
      objc_msgSend(v13, "copyErrorValue:vmData:", Mutable, buf);
      v62[0] = v10;
      v30 = CFNumberCreate(v22, kCFNumberSInt32Type, v62);
      CFDictionarySetValue(Mutable, CFSTR("qos"), v30);
      CFRelease(v30);
      objc_msgSend(v15, "getCacheURLIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v30) = v31 == 0;

      if ((_DWORD)v30)
      {
        v20 = (aneserializers::anemodelparams_v1::_ANEModelParamsSerializerDeserializer *)operator new();
        aneserializers::anemodelparams_v1::_ANEModelParamsSerializerDeserializer::_ANEModelParamsSerializerDeserializer(v20, (_IOSurfaceWrapper *)0x1000);
        v32 = (id)gLogger;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(aSelectora);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualClient loadModel:options:qos:error:].cold.7();
        }

        v33 = CFDataCreate(0, (const UInt8 *)v20, 8);
        CFDictionarySetValue(Mutable, CFSTR("ioSIDModelParameters"), v33);
        CFRelease(v33);
      }
      else
      {
        v20 = 0;
      }
      +[_ANEVirtualClient setCodeSigningIdentity:](_ANEVirtualClient, "setCodeSigningIdentity:", Mutable);
      objc_msgSend(v13, "printDictionary:", Mutable);
      v19 = (const void *)objc_msgSend(v13, "callIOUserClientWithDictionary:inDictionary:error:", 2, Mutable, v54);
      CFRelease(Mutable);
      objc_msgSend(v13, "printDictionary:", v19);
      objc_msgSend(v15, "modelURL");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34 == 0;

      if (!v35)
      {
        +[_ANEVirtualClient freeModelFileIOSurfaces:](_ANEVirtualClient, "freeModelFileIOSurfaces:", v23);
        CFRelease(v23);
      }
      if (v19)
      {
        v36 = (id)gLogger;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(aSelectora);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualClient loadModel:options:qos:error:].cold.6();
        }

        +[_ANEVirtualClient copyDictionaryDataToStruct:dictionary:](_ANEVirtualClient, "copyDictionaryDataToStruct:dictionary:", &v63, v19);
        goto LABEL_27;
      }
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
        -[_ANEVirtualClient loadModel:options:qos:error:].cold.5();
      objc_msgSend(v13, "releaseIOSurfaces:", buf);
      if (v20)
      {
        std::shared_ptr<MIL::MILContext>::~shared_ptr[abi:ne180100]((uint64_t)v20 + 8);
        MEMORY[0x1D824D998](v20, 0x1020C4023CB03E4);
      }
    }
    else
    {
      CFRelease(Mutable);
      CFRelease(v23);
    }
    v46 = 0;
    goto LABEL_53;
  }
  objc_msgSend(v13, "copyModel:options:vmData:", v15, v16, buf);
  objc_msgSend(v13, "copyOptions:vmData:", v16, buf);
  objc_msgSend(v13, "copyModelOptionFiles:options:vmData:", v15, v16, buf);
  objc_msgSend(v13, "copyErrorValue:", buf);
  v62[0] = v10;
  v18 = gLogger;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
    -[_ANEVirtualClient loadModel:options:qos:error:].cold.4((uint64_t)buf, v62, v18);
  objc_msgSend(v13, "callIOUserClient:inParams:outParams:", 2, &v61, &v63, aSelector);
  v19 = 0;
  v20 = 0;
LABEL_27:
  objc_msgSend(v13, "getModelAttribute:", buf);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    +[_ANEVirtualClient dictionaryGetNSStringForKey:key:](_ANEVirtualClient, "dictionaryGetNSStringForKey:key:", v19, CFSTR("modelCacheURLIdentifier"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
      objc_msgSend(v15, "setCacheURLIdentifier:", v38);
    objc_msgSend(v15, "updateModelAttributes:state:programHandle:intermediateBufferHandle:queueDepth:", v37, v68, v65, v66, v67);
    +[_ANEProgramForEvaluation programWithHandle:intermediateBufferHandle:queueDepth:](_ANEProgramForEvaluation, "programWithHandle:intermediateBufferHandle:queueDepth:", v65, v66, v67);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setProgram:", v39);

    +[_ANEDeviceController controllerWithProgramHandle:](_ANEDeviceController, "controllerWithProgramHandle:", v65);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEProgramIOSurfacesMapper mapperWithController:](_ANEProgramIOSurfacesMapper, "mapperWithController:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMapper:", v41);

    if (v20)
    {
      v42 = (void *)MEMORY[0x1E0CB3940];
      v43 = *(__IOSurface **)(*((_QWORD *)v20 + 1) + 8);
      if (v43)
        BaseAddress = IOSurfaceGetBaseAddress(v43);
      else
        BaseAddress = 0;
      objc_msgSend(v42, "stringWithUTF8String:", BaseAddress);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (id)gLogger;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(aSelectora);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient loadModel:options:qos:error:].cold.3();
      }

      objc_msgSend(v15, "setCacheURLIdentifier:", v47);
    }
    v49 = (id)gLogger;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelectora);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient loadModel:options:qos:error:].cold.2();
    }

  }
  else
  {
    v45 = (id)gLogger;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelectora);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient loadModel:options:qos:error:].cold.1();
    }

    objc_msgSend(v15, "updateModelAttributes:state:", v37, 5);
  }
  objc_msgSend(v13, "updateError:error:", buf, v54);
  objc_msgSend(v13, "releaseIOSurfaces:", buf);
  if (v20)
  {
    std::shared_ptr<MIL::MILContext>::~shared_ptr[abi:ne180100]((uint64_t)v20 + 8);
    MEMORY[0x1D824D998](v20, 0x1020C4023CB03E4);
  }
  if (v19)
    CFRelease(v19);
  v46 = v64 != 0;

LABEL_53:
  return v46;
}

- (BOOL)loadModelNewInstance:(id)a3 options:(id)a4 modelInstParams:(id)a5 qos:(unsigned int)a6 error:(id *)a7
{
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const __CFAllocator *v26;
  void *v27;
  BOOL v28;
  void *v29;
  BOOL v30;
  void *v31;
  NSObject *v32;
  CFNumberRef v33;
  id v34;
  const char *v35;
  void *v36;
  int v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  id v42;
  const void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  NSObject *v52;
  id v53;
  id v54;
  const void *v55;
  _IOSurfaceWrapper *v56;
  const void *v57;
  void *v58;
  unsigned int v59;
  id v60;
  const void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  CFDataRef v73;
  const void *v74;
  void *v75;
  BOOL v76;
  NSObject *v77;
  NSObject *v78;
  void *v80;
  id v81;
  uint64_t v82;
  void *v83;
  CFMutableArrayRef cf;
  uint64_t v85;
  const char *aSelector;
  CFMutableDictionaryRef theDict;
  id obj;
  id v89;
  id v90;
  void *v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  UInt8 *bytes;
  uint64_t i;
  id v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  int v101;
  const void *v102;
  int v103;
  const void *v104;
  void *v105;
  void *v106;
  id v107;
  id v108;
  id v109;
  id v110;
  void *v111;
  uint64_t j;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint8_t buf[4];
  uint64_t v122;
  __int16 v123;
  uint64_t v124;
  __int16 v125;
  void *v126;
  _BYTE v127[128];
  uint8_t v128[128];
  uint8_t v129[4];
  void *v130;
  __int16 v131;
  id v132;
  __int16 v133;
  id v134;
  int v135[441];
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  char v140;
  unsigned int v141;
  uint64_t v142;

  v7 = ((uint64_t (*)(_ANEVirtualClient *, SEL, id, id, id, _QWORD, id *))MEMORY[0x1E0C80A78])(self, a2, a3, a4, a5, *(_QWORD *)&a6, a7);
  v85 = v9;
  aSelector = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)v7;
  v142 = *MEMORY[0x1E0C80C00];
  v93 = v17;
  v89 = v15;
  v90 = v13;
  v91 = v16;
  LODWORD(v15) = objc_msgSend(v16, "negotiatedDataInterfaceVersion");
  v18 = (id)gLogger;
  v19 = v18;
  if (v15 >> 10 <= 0x80)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(aSelector);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient loadModelNewInstance:options:modelInstParams:qos:error:].cold.1();
    }

    goto LABEL_5;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(aSelector);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v129 = 138412802;
    v130 = v80;
    v131 = 2112;
    v132 = v93;
    v133 = 2112;
    v134 = v89;
    _os_log_debug_impl(&dword_1D3352000, v19, OS_LOG_TYPE_DEBUG, "%@:ANEVirtualClient loadModelNewInstance Model=%@ options=%@\n", v129, 0x20u);

  }
  bzero(v129, 0x1728uLL);
  if ((objc_msgSend(v16, "negotiatedCapabilityMask") & 4) != 0)
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
      -[_ANEVirtualClient loadModelNewInstance:options:modelInstParams:qos:error:].cold.7();
    v137 = 0;
    theDict = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v26 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    cf = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    objc_msgSend(v93, "modelURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27 == 0;

    if (!v28 && (objc_msgSend(v16, "copyAllModelFiles:dictionary:ioSurfaceRefs:", v93, theDict, cf) & 1) == 0)
    {
      CFRelease(theDict);
      CFRelease(cf);
LABEL_5:
      v20 = 0;
      goto LABEL_54;
    }
    objc_msgSend(v93, "getCacheURLIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29 == 0;

    if (!v30)
    {
      objc_msgSend(v93, "cacheURLIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = (id)gLogger;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(aSelector);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient loadModel:options:qos:error:].cold.8();
      }

      CFDictionarySetValue(theDict, CFSTR("modelCacheURLIdentifier"), v31);
    }
    objc_msgSend(v16, "copyModelMetaData:options:dictionary:vmData:", v93, v89, theDict, v129);
    objc_msgSend(v16, "copyOptions:dictionary:vmData:", v89, theDict, v129);
    objc_msgSend(v16, "copyModelOptionFiles:options:dictionary:vmData:", v93, v89, theDict, v129);
    objc_msgSend(v16, "copyErrorValue:vmData:", theDict, v129);
    v135[0] = v11;
    v33 = CFNumberCreate(v26, kCFNumberSInt32Type, v135);
    CFDictionarySetValue(theDict, CFSTR("qos"), v33);
    CFRelease(v33);
    bytes = (UInt8 *)operator new();
    objc_msgSend(v90, "instanceName");
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v35 = (const char *)objc_msgSend(v34, "UTF8String");
    objc_msgSend(v90, "instanceName");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "length");
    objc_msgSend(v90, "procedureArray");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    aneserializers::anemodelnewinstanceparams_v1::_ANEModelInstanceParametersSerializerDeserializer::_ANEModelInstanceParametersSerializerDeserializer((aneserializers::anemodelnewinstanceparams_v1::_ANEModelInstanceParametersSerializerDeserializer *)bytes, v35, v37, objc_msgSend(v38, "count"));

    v39 = (id)gLogger;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v90, "instanceName");
      v81 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v82 = objc_msgSend(v81, "UTF8String");
      objc_msgSend(v90, "instanceName");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v122 = v82;
      v123 = 2048;
      v124 = objc_msgSend(v83, "length");
      _os_log_debug_impl(&dword_1D3352000, v39, OS_LOG_TYPE_DEBUG, "_ANEVirtualClient init modelInstanceParametersSerdes instanceName:%s len:%lu\n", buf, 0x16u);

    }
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    objc_msgSend(v90, "procedureArray");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v128, 16);
    if (v94)
    {
      v92 = *(_QWORD *)v118;
      do
      {
        for (i = 0; i != v94; ++i)
        {
          if (*(_QWORD *)v118 != v92)
            objc_enumerationMutation(obj);
          v40 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * i);
          v41 = (id)gLogger;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v40, "procedureSymbol");
            v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v70 = objc_msgSend(v69, "UTF8String");
            objc_msgSend(v40, "procedureSymbol");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = objc_msgSend(v71, "length");
            *(_DWORD *)buf = 136315394;
            v122 = v70;
            v123 = 2048;
            v124 = v72;
            _os_log_debug_impl(&dword_1D3352000, v41, OS_LOG_TYPE_DEBUG, "_ANEVirtualClient init Procedure procedureSymbol:%s len:%lu\n", buf, 0x16u);

          }
          v99 = (uint64_t *)operator new();
          objc_msgSend(v40, "procedureSymbol");
          v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v43 = (const void *)objc_msgSend(v42, "UTF8String");
          objc_msgSend(v40, "procedureSymbol");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "length");
          objc_msgSend(v40, "weightArray");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          aneserializers::anemodelnewinstanceparams_v1::_ANEProcedureDataSerializerDeserializer::_ANEProcedureDataSerializerDeserializer((uint64_t)v99, v43, v45, objc_msgSend(v46, "count"));

          v115 = 0u;
          v116 = 0u;
          v113 = 0u;
          v114 = 0u;
          objc_msgSend(v40, "weightArray");
          v97 = (id)objc_claimAutoreleasedReturnValue();
          v100 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v113, v127, 16);
          if (v100)
          {
            v98 = *(_QWORD *)v114;
            do
            {
              for (j = 0; j != v100; ++j)
              {
                if (*(_QWORD *)v114 != v98)
                  objc_enumerationMutation(v97);
                v47 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * j);
                objc_msgSend(v47, "weightURL");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "path");
                v111 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v111, "componentsSeparatedByString:", CFSTR("/"));
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v106, "lastObject");
                v108 = (id)objc_claimAutoreleasedReturnValue();
                v49 = objc_alloc(MEMORY[0x1E0C99D50]);
                objc_msgSend(v47, "weightURL");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "path");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v107 = (id)objc_msgSend(v49, "initWithContentsOfFile:", v51);

                v52 = (id)gLogger;
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v47, "weightSymbol");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "weightSymbol");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  v66 = objc_msgSend(v65, "length");
                  objc_msgSend(v47, "weightURL");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "path");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v122 = (uint64_t)v64;
                  v123 = 2048;
                  v124 = v66;
                  v125 = 2112;
                  v126 = v68;
                  _os_log_debug_impl(&dword_1D3352000, v52, OS_LOG_TYPE_DEBUG, "_ANEVirtualClient init weight weightSymbol:%@ len:%lu weightURL:%@\n", buf, 0x20u);

                }
                objc_msgSend(v47, "weightSymbol");
                v110 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v104 = (const void *)objc_msgSend(v110, "UTF8String");
                objc_msgSend(v47, "weightSymbol");
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                v103 = objc_msgSend(v105, "length");
                v53 = objc_retainAutorelease(v108);
                v102 = (const void *)objc_msgSend(v53, "UTF8String");
                v101 = objc_msgSend(v53, "length");
                v54 = objc_retainAutorelease(v107);
                v55 = (const void *)objc_msgSend(v54, "bytes");
                v56 = (_IOSurfaceWrapper *)objc_msgSend(v54, "length");
                objc_msgSend(v47, "SHACode");
                v109 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v57 = (const void *)objc_msgSend(v109, "bytes");
                objc_msgSend(v47, "SHACode");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = objc_msgSend(v58, "length");
                objc_msgSend(v47, "sandboxExtension");
                v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v61 = (const void *)objc_msgSend(v60, "UTF8String");
                objc_msgSend(v47, "sandboxExtension");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = objc_msgSend(v62, "length");
                aneserializers::anemodelnewinstanceparams_v1::_ANEProcedureDataSerializerDeserializer::addWeight((uint64_t)v99, v104, v103, v102, v101, v55, v56, v57, v59, v61, v63, (void *)gLogger);

              }
              v100 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v113, v127, 16);
            }
            while (v100);
          }

          aneserializers::anemodelnewinstanceparams_v1::_ANEModelInstanceParametersSerializerDeserializer::addProcedure((uint64_t)bytes, v99);
        }
        v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v128, 16);
      }
      while (v94);
    }

    v73 = CFDataCreate(0, bytes, 12);
    CFDictionarySetValue(theDict, CFSTR("modelInstanceParametersData"), v73);
    CFRelease(v73);
    +[_ANEVirtualClient setCodeSigningIdentity:](_ANEVirtualClient, "setCodeSigningIdentity:", theDict);
    objc_msgSend(v91, "printDictionary:", theDict);
    v74 = (const void *)objc_msgSend(v91, "callIOUserClientWithDictionary:inDictionary:error:", 21, theDict, v85);
    CFRelease(theDict);
    objc_msgSend(v91, "printDictionary:", v74);
    objc_msgSend(v93, "modelURL");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v75 == 0;

    if (!v76)
    {
      +[_ANEVirtualClient freeModelFileIOSurfaces:](_ANEVirtualClient, "freeModelFileIOSurfaces:", cf);
      CFRelease(cf);
    }
    if (!v74)
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
        -[_ANEVirtualClient loadModel:options:qos:error:].cold.5();
      objc_msgSend(v91, "releaseIOSurfaces:", v129);
      goto LABEL_5;
    }
    v77 = (id)gLogger;
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelector);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient loadModel:options:qos:error:].cold.6();
    }

    +[_ANEVirtualClient copyDictionaryDataToStruct:dictionary:](_ANEVirtualClient, "copyDictionaryDataToStruct:dictionary:", &v136, v74);
    CFRelease(v74);
  }
  else
  {
    bytes = 0;
  }
  objc_msgSend(v91, "getModelAttribute:", v129);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v137)
  {
    objc_msgSend(v93, "updateModelAttributes:state:programHandle:intermediateBufferHandle:queueDepth:", v21, v141, v138, v139, v140);
    +[_ANEProgramForEvaluation programWithHandle:intermediateBufferHandle:queueDepth:](_ANEProgramForEvaluation, "programWithHandle:intermediateBufferHandle:queueDepth:", v138, v139, v140);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setProgram:", v22);

    +[_ANEDeviceController controllerWithProgramHandle:](_ANEDeviceController, "controllerWithProgramHandle:", v138);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEProgramIOSurfacesMapper mapperWithController:](_ANEProgramIOSurfacesMapper, "mapperWithController:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setMapper:", v24);

    v25 = (id)gLogger;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelector);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient loadModel:options:qos:error:].cold.2();
    }

  }
  else
  {
    v78 = (id)gLogger;
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelector);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient loadModel:options:qos:error:].cold.1();
    }

    objc_msgSend(v93, "updateModelAttributes:state:", v21, 5);
  }
  objc_msgSend(v91, "updateError:error:", v129, v85);
  objc_msgSend(v91, "releaseIOSurfaces:", v129);
  if (bytes)
  {
    aneserializers::anemodelnewinstanceparams_v1::_ANEModelInstanceParametersSerializerDeserializer::~_ANEModelInstanceParametersSerializerDeserializer((aneserializers::anemodelnewinstanceparams_v1::_ANEModelInstanceParametersSerializerDeserializer *)bytes);
    MEMORY[0x1D824D998]();
  }
  v20 = v137 != 0;

LABEL_54:
  return v20;
}

- (BOOL)unloadModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 error:(id *)a6
{
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __CFDictionary *Mutable;
  const __CFAllocator *v18;
  void *v19;
  BOOL v20;
  void *v21;
  BOOL v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _BOOL8 v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  CFNumberRef v40;
  CFNumberRef v41;
  CFNumberRef v42;
  CFNumberRef v43;
  CFNumberRef v44;
  CFNumberRef v45;
  CFNumberRef v46;
  CFNumberRef v47;
  __CFDictionary *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  void *v53;
  CFMutableArrayRef cf;
  id v57;
  uint8_t v58[4];
  int v59;
  __int16 v60;
  int v61;
  __int16 v62;
  int v63;
  __int16 v64;
  int v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  int v73;
  __int16 v74;
  int v75;
  __int16 v76;
  int v77;
  __int16 v78;
  unsigned int v79;
  __int16 v80;
  int v81;
  __int16 v82;
  int v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  id v87;
  __int16 v88;
  id v89;
  __IOSurface *v90;
  __IOSurface *v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  _DWORD v95[7];
  uint64_t v96[97];
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  _BYTE v100[4];
  int v101;
  int v102;
  unsigned int v103;
  _DWORD v104[440];
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v57 = a4;
  v10 = (id)gLogger;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v85 = v53;
    v86 = 2112;
    v87 = v9;
    v88 = 2112;
    v89 = v57;
    LOWORD(v90) = 1024;
    *(_DWORD *)((char *)&v90 + 2) = a5;
    _os_log_debug_impl(&dword_1D3352000, v10, OS_LOG_TYPE_DEBUG, "%@: Model=%@ options=%@ qos=%d\n", buf, 0x26u);

  }
  bzero(buf, 0x1728uLL);
  if ((-[_ANEVirtualClient negotiatedCapabilityMask](self, "negotiatedCapabilityMask") & 4) == 0)
  {
    -[_ANEVirtualClient copyErrorValue:](self, "copyErrorValue:", buf);
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v57, 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB36F8];
    objc_msgSend(v9, "key");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");
    if (v14)
    {
      objc_msgSend(v9, "key");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
    }
    else
    {
      objc_msgSend(v9, "modelURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)

    v90 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v11, objc_msgSend(v11, "length"), v104);
    v91 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v30, objc_msgSend(v30, "length"), v95);
    v93 = 0;
    v94 = 0;
    v97 = objc_msgSend(v9, "string_id");
    v98 = objc_msgSend(v9, "programHandle");
    v99 = objc_msgSend(v9, "intermediateBufferHandle");
    v100[0] = objc_msgSend(v9, "queueDepth");
    v101 = 0;
    v102 = objc_msgSend(v9, "perfStatsMask");
    v103 = a5;
    v31 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v58 = 67112192;
      v59 = v93;
      v60 = 1024;
      v61 = HIDWORD(v93);
      v62 = 1024;
      v63 = v94;
      v64 = 1024;
      v65 = v95[0];
      v66 = 2048;
      v67 = v97;
      v68 = 2048;
      v69 = v98;
      v70 = 2048;
      v71 = v99;
      v72 = 1024;
      v73 = v100[0];
      v74 = 1024;
      v75 = v101;
      v76 = 1024;
      v77 = v102;
      v78 = 1024;
      v79 = v103;
      v80 = 1024;
      v81 = v104[0];
      v82 = 1024;
      v83 = v104[413];
      _os_log_debug_impl(&dword_1D3352000, v31, OS_LOG_TYPE_DEBUG, "ANEVirtualClient virtualANEModel.ioSIDModelNet=%u virtualANEModel.ioSIDModelShape=%u virtualANEModel.ioSIDModelWeight=%u virtualANEModel.ioSIDKey=%u virtualANEModel.string_id=%lld virtualANEModel.programHandle=%lld virtualANEModel.intermediateBufferHandle=%lld virtualANEModel.queueDepth=%d virtualANEModel.ioSIDModelAttributes=%u virtualANEModel.perfStatsMask=%u virtualANEModel.qos=%u virtualANEModel.ioSIDOptions=%u virtualANEModel.ioSIDErrorValue=%u", v58, 0x5Cu);
    }
    v32 = -[_ANEVirtualClient callIOUserClient:inParams:outParams:](self, "callIOUserClient:inParams:outParams:", 3, &v92, &v105);
    v33 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
      -[_ANEVirtualClient unloadModel:options:qos:error:].cold.1(v32, v33, v34, v35, v36, v37, v38, v39);

LABEL_35:
    -[_ANEVirtualClient updateError:error:](self, "updateError:error:", buf, a6);
    -[_ANEVirtualClient releaseIOSurfaces:](self, "releaseIOSurfaces:", buf);
    goto LABEL_36;
  }
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
    -[_ANEVirtualClient unloadModel:options:qos:error:].cold.6();
  v106 = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v18 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  cf = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  -[_ANEVirtualClient copyModelMetaData:options:dictionary:vmData:](self, "copyModelMetaData:options:dictionary:vmData:", v9, MEMORY[0x1E0C9AA70], Mutable, buf);
  objc_msgSend(v9, "modelURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (!v20)
    -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:](self, "copyAllModelFiles:dictionary:ioSurfaceRefs:", v9, Mutable, cf);
  objc_msgSend(v9, "getCacheURLIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21 == 0;

  if (!v22)
  {
    objc_msgSend(v9, "cacheURLIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (id)gLogger;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient loadModel:options:qos:error:].cold.8();
    }

    CFDictionarySetValue(Mutable, CFSTR("modelCacheURLIdentifier"), v23);
  }
  -[_ANEVirtualClient copyErrorValue:vmData:](self, "copyErrorValue:vmData:", Mutable, buf);
  -[_ANEVirtualClient copyOptions:dictionary:vmData:](self, "copyOptions:dictionary:vmData:", v57, Mutable, buf);
  v25 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(v9, "key");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "length");
  if (v27)
  {
    objc_msgSend(v9, "key");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
  }
  else
  {
    objc_msgSend(v9, "modelURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "path");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v25, "archivedDataWithRootObject:requiringSecureCoding:error:", v28, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)

  v91 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v11, objc_msgSend(v11, "length"), v95);
  v40 = CFNumberCreate(v18, kCFNumberSInt32Type, v95);
  CFDictionarySetValue(Mutable, CFSTR("ioSIDKey"), v40);
  CFRelease(v40);
  v96[0] = objc_msgSend(v11, "length");
  v41 = CFNumberCreate(v18, kCFNumberSInt64Type, v96);
  CFDictionarySetValue(Mutable, CFSTR("keyLength"), v41);
  CFRelease(v41);
  v97 = objc_msgSend(v9, "string_id");
  v42 = CFNumberCreate(v18, kCFNumberSInt64Type, &v97);
  CFDictionarySetValue(Mutable, CFSTR("string_id"), v42);
  CFRelease(v42);
  v98 = objc_msgSend(v9, "programHandle");
  v43 = CFNumberCreate(v18, kCFNumberSInt64Type, &v98);
  CFDictionarySetValue(Mutable, CFSTR("programHandle"), v43);
  CFRelease(v43);
  v99 = objc_msgSend(v9, "intermediateBufferHandle");
  v44 = CFNumberCreate(v18, kCFNumberSInt64Type, &v99);
  CFDictionarySetValue(Mutable, CFSTR("intermediateBufferHandle"), v44);
  CFRelease(v44);
  v100[0] = objc_msgSend(v9, "queueDepth");
  v45 = CFNumberCreate(v18, kCFNumberSInt8Type, v100);
  CFDictionarySetValue(Mutable, CFSTR("queueDepth"), v45);
  CFRelease(v45);
  v102 = objc_msgSend(v9, "perfStatsMask");
  v46 = CFNumberCreate(v18, kCFNumberSInt32Type, &v102);
  CFDictionarySetValue(Mutable, CFSTR("perfStatsMask"), v46);
  CFRelease(v46);
  v103 = a5;
  v47 = CFNumberCreate(v18, kCFNumberSInt32Type, &v103);
  CFDictionarySetValue(Mutable, CFSTR("qos"), v47);
  CFRelease(v47);
  -[_ANEVirtualClient printDictionary:](self, "printDictionary:", Mutable);
  v48 = -[_ANEVirtualClient callIOUserClientWithDictionary:inDictionary:error:](self, "callIOUserClientWithDictionary:inDictionary:error:", 3, Mutable, a6);
  CFRelease(Mutable);
  -[_ANEVirtualClient printDictionary:](self, "printDictionary:", v48);
  objc_msgSend(v9, "modelURL");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v47) = v49 == 0;

  if ((v47 & 1) == 0)
  {
    +[_ANEVirtualClient freeModelFileIOSurfaces:](_ANEVirtualClient, "freeModelFileIOSurfaces:", cf);
    CFRelease(cf);
  }
  if (v48)
  {
    v50 = (id)gLogger;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient unloadModel:options:qos:error:].cold.4();
    }

    +[_ANEVirtualClient copyDictionaryDataToStruct:dictionary:](_ANEVirtualClient, "copyDictionaryDataToStruct:dictionary:", &v105, v48);
    LOBYTE(v32) = v106 == 1;
    v51 = (id)gLogger;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient unloadModel:options:qos:error:].cold.3();
    }

    CFRelease(v48);
    goto LABEL_35;
  }
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
    -[_ANEVirtualClient unloadModel:options:qos:error:].cold.2();
  -[_ANEVirtualClient releaseIOSurfaces:](self, "releaseIOSurfaces:", buf);

  LOBYTE(v32) = 0;
LABEL_36:

  return v32;
}

- (BOOL)evaluateWithModel:(id)a3 options:(id)a4 request:(id)a5 qos:(unsigned int)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  BOOL v30;
  NSObject *v31;
  id v33;
  void *v34;
  void *v35;
  dispatch_queue_t v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  uint64_t *v42;
  id *v43;
  unsigned int v44;
  _QWORD block[5];
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t *v50;
  unsigned int v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  _QWORD v62[2];
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = v15;
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  if (!v13)
    goto LABEL_15;
  objc_msgSend(v15, "completionHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (!v18)
  {
    v36 = dispatch_queue_create("com.apple.ane.vmclient-async", 0);
    if (v36)
    {
      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBBEC0]), "initWithDispatchQueue:", v36);
      if (!v37 && os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
        -[_ANEVirtualClient evaluateWithModel:options:request:qos:error:].cold.2();
      v19 = (void *)objc_opt_new();
      +[_ANESharedSignalEvent signalEventWithValue:symbolIndex:eventType:sharedEvent:](_ANESharedSignalEvent, "signalEventWithValue:symbolIndex:eventType:sharedEvent:", 4097, 0, 0, v19, v19);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke;
      v55[3] = &unk_1E9516400;
      v56 = v19;
      v20 = v16;
      v57 = v20;
      v33 = v56;
      objc_msgSend(v56, "notifyListener:atValue:block:", v37, 4097, v55);
      v21 = (void *)objc_opt_new();
      +[_ANESharedSignalEvent signalEventWithValue:symbolIndex:eventType:sharedEvent:](_ANESharedSignalEvent, "signalEventWithValue:symbolIndex:eventType:sharedEvent:", 1, 0, 0, v21);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke_49;
      v52[3] = &unk_1E9516400;
      v22 = v21;
      v53 = v22;
      v23 = v20;
      v54 = v23;
      objc_msgSend(v22, "notifyListener:atValue:block:", v37, 1, v52);
      v24 = gLogger;
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        v64 = v34;
        v65 = 2048;
        v66 = v35;
        v67 = 2112;
        v68 = v13;
        _os_log_debug_impl(&dword_1D3352000, v24, OS_LOG_TYPE_DEBUG, "[_ANEVirtualClient] completionEvent success event %p error event %p for model %@\n", buf, 0x20u);
      }
      v62[0] = v34;
      v62[1] = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ANESharedEvents sharedEventsWithSignalEvents:waitEvents:](_ANESharedEvents, "sharedEventsWithSignalEvents:waitEvents:", v25, MEMORY[0x1E0C9AA60]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      -[_ANEVirtualClient queue](self, "queue");
      v27 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke_56;
      block[3] = &unk_1E9516428;
      v50 = &v58;
      block[4] = self;
      v46 = v13;
      v47 = v14;
      v51 = a6;
      v48 = v23;
      v49 = v26;
      v28 = v26;
      dispatch_sync(v27, block);

      *((_BYTE *)v59 + 24) = 1;
      goto LABEL_11;
    }
    v31 = (id)gLogger;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient evaluateWithModel:options:request:qos:error:].cold.1();
    }

LABEL_15:
    v30 = 0;
    goto LABEL_16;
  }
  -[_ANEVirtualClient queue](self, "queue");
  v29 = objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __65___ANEVirtualClient_evaluateWithModel_options_request_qos_error___block_invoke_2;
  v38[3] = &unk_1E9516450;
  v42 = &v58;
  v38[4] = self;
  v39 = v13;
  v40 = v14;
  v44 = a6;
  v41 = v16;
  v43 = a7;
  dispatch_sync(v29, v38);

LABEL_11:
  v30 = *((_BYTE *)v59 + 24) != 0;
LABEL_16:
  _Block_object_dispose(&v58, 8);

  return v30;
}

- (BOOL)doEvaluateWithModel:(id)a3 options:(id)a4 request:(id)a5 qos:(unsigned int)a6 completionEvent:(id)a7 error:(id *)a8
{
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  IOSurfaceID ID;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  IOSurfaceID v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  _BOOL4 v53;
  void *v54;
  IOSurfaceID v55;
  NSObject *v56;
  const __CFAllocator *v57;
  void *v58;
  BOOL v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  IOSurfaceID v64;
  uint64_t v65;
  CFStringRef v66;
  CFNumberRef v67;
  NSObject *v68;
  int v69;
  CFNumberRef v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t j;
  void *v75;
  int v76;
  uint64_t v77;
  CFStringRef v78;
  CFNumberRef v79;
  NSObject *v80;
  uint64_t v81;
  CFNumberRef v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t k;
  IOSurfaceID v87;
  uint64_t v88;
  CFStringRef v89;
  CFNumberRef v90;
  NSObject *v91;
  int v92;
  CFNumberRef v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t m;
  void *v98;
  int v99;
  uint64_t v100;
  CFStringRef v101;
  CFNumberRef v102;
  NSObject *v103;
  uint64_t v104;
  CFNumberRef v105;
  NSObject *v106;
  void *v107;
  _BOOL4 v108;
  void *v109;
  CFNumberRef v110;
  NSObject *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  int v122;
  uint64_t v123;
  uint64_t v124;
  int v125;
  void *v126;
  void *v127;
  IOSurfaceID v128;
  NSObject *v129;
  NSObject *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  const __CFDictionary *v134;
  __IOSurface *v135;
  NSObject *v136;
  BOOL v137;
  NSObject *v138;
  void *v139;
  CFNumberRef v140;
  void *v141;
  CFNumberRef v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t n;
  void *v147;
  void *v148;
  IOSurfaceID v149;
  CFStringRef v150;
  CFNumberRef v151;
  int v152;
  uint64_t v153;
  CFStringRef v154;
  CFNumberRef v155;
  NSObject *v156;
  NSObject *v157;
  int v158;
  int v159;
  CFNumberRef v160;
  void *v161;
  void *v162;
  const __CFDictionary *v163;
  __IOSurface *v164;
  CFNumberRef v165;
  NSObject *v166;
  void *v167;
  void *v168;
  BOOL v169;
  void *v170;
  void *v171;
  CFStringRef v172;
  CFNumberRef v173;
  NSObject *v174;
  void *v175;
  void *v176;
  uint64_t v177;
  uint64_t ii;
  void *v179;
  void *v180;
  uint64_t v181;
  _BYTE *v182;
  _BYTE *v183;
  _BYTE *v184;
  uint64_t v185;
  int *v186;
  uint64_t *v187;
  _BYTE *v188;
  NSObject *v189;
  CFStringRef v190;
  CFNumberRef v191;
  CFStringRef v192;
  CFNumberRef v193;
  CFStringRef v194;
  CFNumberRef v195;
  CFStringRef v196;
  CFNumberRef v197;
  CFStringRef v198;
  CFNumberRef v199;
  id v200;
  int v201;
  uint64_t v202;
  void *v203;
  BOOL v204;
  NSObject *v205;
  uint64_t v206;
  char v207;
  char v208;
  void *v209;
  void *v210;
  _BOOL4 v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  NSObject *v221;
  id v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  id v232;
  NSObject *v233;
  CFStringRef v234;
  CFNumberRef v235;
  CFStringRef v236;
  CFNumberRef v237;
  void *v238;
  void *v239;
  CFStringRef v240;
  CFNumberRef v241;
  NSObject *v242;
  void *v243;
  NSObject *v244;
  void *v245;
  void *v246;
  uint64_t v247;
  uint64_t jj;
  void *v249;
  void *v250;
  _BYTE *v251;
  _BYTE *v252;
  const void *v253;
  CFStringRef v254;
  CFNumberRef v255;
  CFStringRef v256;
  CFNumberRef v257;
  CFStringRef v258;
  CFNumberRef v259;
  __CFDictionary *v260;
  void *v261;
  BOOL v262;
  NSObject *v263;
  _BOOL4 v264;
  void *v265;
  NSObject *v266;
  void *v267;
  void *v268;
  NSObject *v269;
  void *v270;
  void *v271;
  uint64_t v273;
  void *v274;
  uint64_t v275;
  void *v276;
  uint64_t v277;
  void *v278;
  uint64_t v279;
  void *v280;
  uint64_t v281;
  void *v282;
  uint64_t v283;
  void *v284;
  uint64_t v285;
  void *v286;
  uint64_t v287;
  void *v288;
  uint64_t v289;
  CFMutableArrayRef cf;
  id v292;
  id v293;
  _BOOL4 v294;
  id v297;
  id v298;
  id obj;
  id obja;
  uint64_t v301;
  uint64_t v302;
  void *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  __CFDictionary *theDict;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  __int128 v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  unsigned int valuePtr;
  _BYTE v358[32];
  __IOSurface *v359;
  IOSurfaceRef buffer;
  _DWORD v361[208];
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  char v365;
  int v366;
  int v367;
  unsigned int v368;
  _DWORD v369[268];
  IOSurfaceID v370;
  uint64_t v371;
  _QWORD v372[65];
  int v373;
  int v374;
  int v375;
  int v376;
  int v377;
  int v378;
  uint64_t v379;
  IOSurfaceID v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  _BYTE v384[128];
  _BYTE v385[128];
  _BYTE v386[128];
  _BYTE v387[128];
  _BYTE v388[160];
  _BYTE v389[160];
  int v390;
  id v391;
  __int16 v392;
  int v393;
  __int16 v394;
  uint64_t v395;
  _BYTE v396[160];
  _BYTE v397[22];
  _BYTE v398[24];
  __int16 v399;
  uint64_t v400;
  __int16 v401;
  int v402;
  __int16 v403;
  int v404;
  __int16 v405;
  int v406;
  __int16 v407;
  unsigned int v408;
  __int16 v409;
  int v410;
  __int16 v411;
  int v412;
  _DWORD v413[2];
  uint64_t v414;
  int v415;
  char v416;
  _DWORD v417[2];
  uint64_t v418;
  int v419;
  char v420;
  _BYTE v421[128];
  _BYTE v422[128];
  _BYTE v423[128];
  _BYTE v424[128];
  _BYTE v425[128];
  uint64_t v426;

  v426 = *MEMORY[0x1E0C80C00];
  v293 = a3;
  v292 = a4;
  v297 = a5;
  v298 = a7;
  v12 = (id)gLogger;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.21();

  v13 = (id)gLogger;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.20();

  v14 = (id)gLogger;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.19();

  v15 = (id)gLogger;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.18();

  bzero(v358, 0x1728uLL);
  if ((-[_ANEVirtualClient negotiatedCapabilityMask](self, "negotiatedCapabilityMask") & 4) == 0)
  {
    -[_ANEVirtualClient copyModel:options:vmData:](self, "copyModel:options:vmData:", v293, v292, v358);
    -[_ANEVirtualClient copyErrorValue:](self, "copyErrorValue:", v358);
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v292, 1, 0);
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    v359 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v303, objc_msgSend(v303, "length"), v369);
    v362 = objc_msgSend(v293, "string_id");
    v363 = objc_msgSend(v293, "programHandle");
    v364 = objc_msgSend(v293, "intermediateBufferHandle");
    v365 = objc_msgSend(v293, "queueDepth");
    v367 = objc_msgSend(v293, "perfStatsMask");
    v368 = a6;
    v16 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v397 = 67112192;
      *(_DWORD *)&v397[4] = v361[4];
      *(_WORD *)&v397[8] = 1024;
      *(_DWORD *)&v397[10] = v361[5];
      *(_WORD *)&v397[14] = 1024;
      *(_DWORD *)&v397[16] = v361[6];
      *(_WORD *)&v397[20] = 1024;
      *(_DWORD *)v398 = v361[7];
      *(_WORD *)&v398[4] = 2048;
      *(_QWORD *)&v398[6] = v362;
      *(_WORD *)&v398[14] = 2048;
      *(_QWORD *)&v398[16] = v363;
      v399 = 2048;
      v400 = v364;
      v401 = 1024;
      v402 = v365;
      v403 = 1024;
      v404 = v366;
      v405 = 1024;
      v406 = v367;
      v407 = 1024;
      v408 = v368;
      v409 = 1024;
      v410 = v369[0];
      v411 = 1024;
      v412 = v378;
      _os_log_debug_impl(&dword_1D3352000, v16, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate: virtualANEModel.ioSIDModelNet=%u virtualANEModel.ioSIDModelShape=%u virtualANEModel.ioSIDModelWeight=%u virtualANEModel.ioSIDKey=%u virtualANEModel.string_id=%lld virtualANEModel.programHandle=%lld virtualANEModel.intermediateBufferHandle=%lld virtualANEModel.queueDepth=%d virtualANEModel.ioSIDModelAttributes=%u virtualANEModel.perfStatsMask=%u virtualANEModel.qos=%u virtualANEModel.ioSIDOptions=%u virtualANEModel.ioSIDErrorValue=%u", v397, 0x5Cu);
    }
    v327 = 0u;
    v328 = 0u;
    v325 = 0u;
    v326 = 0u;
    objc_msgSend(v297, "inputArray");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v325, v388, 16);
    if (v18)
    {
      v19 = 0;
      v20 = *(_QWORD *)v326;
      do
      {
        v21 = 0;
        v22 = v19;
        do
        {
          if (*(_QWORD *)v326 != v20)
            objc_enumerationMutation(v17);
          ID = IOSurfaceGetID((IOSurfaceRef)objc_msgSend(*(id *)(*((_QWORD *)&v325 + 1) + 8 * v21), "ioSurface"));
          v369[(v22 + v21) + 12] = ID;
          v24 = gLogger;
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v397 = 67109120;
            *(_DWORD *)&v397[4] = ID;
            _os_log_debug_impl(&dword_1D3352000, v24, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request1 ioSID: %u", v397, 8u);
          }
          ++v21;
        }
        while (v18 != v21);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v325, v388, 16);
        v19 = v22 + v21;
      }
      while (v18);
      LODWORD(v18) = v22 + v21;
    }

    v374 = v18;
    v321 = 0u;
    v322 = 0u;
    v323 = 0u;
    v324 = 0u;
    objc_msgSend(v297, "inputIndexArray");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v321, v387, 16);
    if (v26)
    {
      v27 = 0;
      v28 = *(_QWORD *)v322;
      do
      {
        v29 = 0;
        v30 = v27;
        do
        {
          if (*(_QWORD *)v322 != v28)
            objc_enumerationMutation(v25);
          v31 = *(void **)(*((_QWORD *)&v321 + 1) + 8 * v29);
          v369[(v30 + v29) + 76] = objc_msgSend(v31, "unsignedIntValue");
          v32 = (id)gLogger;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            v33 = objc_msgSend(v31, "unsignedLongLongValue");
            *(_DWORD *)v397 = 134217984;
            *(_QWORD *)&v397[4] = v33;
            _os_log_debug_impl(&dword_1D3352000, v32, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request2 ioSID: %llu", v397, 0xCu);
          }

          ++v29;
        }
        while (v26 != v29);
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v321, v387, 16);
        v27 = v30 + v29;
      }
      while (v26);
      LODWORD(v26) = v30 + v29;
    }

    v375 = v26;
    v317 = 0u;
    v318 = 0u;
    v319 = 0u;
    v320 = 0u;
    objc_msgSend(v297, "outputArray");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v317, v386, 16);
    if (v35)
    {
      v36 = 0;
      v37 = *(_QWORD *)v318;
      do
      {
        v38 = 0;
        v39 = v36;
        do
        {
          if (*(_QWORD *)v318 != v37)
            objc_enumerationMutation(v34);
          v40 = IOSurfaceGetID((IOSurfaceRef)objc_msgSend(*(id *)(*((_QWORD *)&v317 + 1) + 8 * v38), "ioSurface"));
          v369[(v39 + v38) + 140] = v40;
          v41 = gLogger;
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v397 = 67109120;
            *(_DWORD *)&v397[4] = v40;
            _os_log_debug_impl(&dword_1D3352000, v41, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request3 ioSID: %u", v397, 8u);
          }
          ++v38;
        }
        while (v35 != v38);
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v317, v386, 16);
        v36 = v39 + v38;
      }
      while (v35);
      LODWORD(v35) = v39 + v38;
    }

    v376 = v35;
    v313 = 0u;
    v314 = 0u;
    v315 = 0u;
    v316 = 0u;
    objc_msgSend(v297, "outputIndexArray");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v313, v385, 16);
    if (v43)
    {
      v44 = 0;
      v45 = *(_QWORD *)v314;
      do
      {
        v46 = 0;
        v47 = v44;
        do
        {
          if (*(_QWORD *)v314 != v45)
            objc_enumerationMutation(v42);
          v48 = *(void **)(*((_QWORD *)&v313 + 1) + 8 * v46);
          v369[(v47 + v46) + 204] = objc_msgSend(v48, "unsignedIntValue");
          v49 = (id)gLogger;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            v50 = objc_msgSend(v48, "unsignedLongLongValue");
            *(_DWORD *)v397 = 134217984;
            *(_QWORD *)&v397[4] = v50;
            _os_log_debug_impl(&dword_1D3352000, v49, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request4 ioSID: %llu", v397, 0xCu);
          }

          ++v46;
        }
        while (v43 != v46);
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v313, v385, 16);
        v44 = v47 + v46;
      }
      while (v43);
      LODWORD(v43) = v47 + v46;
    }

    v377 = v43;
    v51 = (id)gLogger;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v297, "inputArray");
      v274 = (void *)objc_claimAutoreleasedReturnValue();
      v275 = objc_msgSend(v274, "count");
      objc_msgSend(v297, "inputIndexArray");
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      v277 = objc_msgSend(v276, "count");
      objc_msgSend(v297, "outputArray");
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      v279 = objc_msgSend(v278, "count");
      objc_msgSend(v297, "outputIndexArray");
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      v281 = objc_msgSend(v280, "count");
      *(_DWORD *)v397 = 134218752;
      *(_QWORD *)&v397[4] = v275;
      *(_WORD *)&v397[12] = 2048;
      *(_QWORD *)&v397[14] = v277;
      *(_WORD *)v398 = 2048;
      *(_QWORD *)&v398[2] = v279;
      *(_WORD *)&v398[10] = 2048;
      *(_QWORD *)&v398[12] = v281;
      _os_log_debug_impl(&dword_1D3352000, v51, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate: request.inputArray %lu request.inputIndexArray %lu request.outputArray %lu request.outputIndexArray %lu", v397, 0x2Au);

    }
    objc_msgSend(v297, "weightsBuffer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "ioSurface") == 0;

    if (v53)
    {
      v370 = 0;
    }
    else
    {
      objc_msgSend(v297, "weightsBuffer");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = IOSurfaceGetID((IOSurfaceRef)objc_msgSend(v54, "ioSurface"));

      v370 = v55;
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
        -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.4();
    }
    objc_msgSend(v297, "procedureIndex");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v371 = objc_msgSend(v118, "unsignedLongLongValue");

    objc_msgSend(v297, "transactionHandle");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v372[0] = objc_msgSend(v119, "unsignedLongLongValue");

    v311 = 0u;
    v312 = 0u;
    v309 = 0u;
    v310 = 0u;
    objc_msgSend(v297, "perfStatsArray");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v309, v384, 16);
    if (v121)
    {
      v122 = 0;
      v123 = *(_QWORD *)v310;
      do
      {
        v124 = 0;
        v125 = v122;
        do
        {
          if (*(_QWORD *)v310 != v123)
            objc_enumerationMutation(v120);
          v126 = *(void **)(*((_QWORD *)&v309 + 1) + 8 * v124);
          objc_msgSend(v126, "stats");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          v128 = IOSurfaceGetID((IOSurfaceRef)objc_msgSend(v127, "ioSurface"));

          *((_DWORD *)&v372[1] + (v125 + v124)) = v128;
          *((_DWORD *)&v372[33] + (v125 + v124)) = objc_msgSend(v126, "statType");
          v373 = v125 + v124 + 1;
          v129 = gLogger;
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v397 = 67109120;
            *(_DWORD *)&v397[4] = v128;
            _os_log_debug_impl(&dword_1D3352000, v129, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request6 ioSID: %u", v397, 8u);
          }
          v130 = (id)gLogger;
          if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG))
          {
            v131 = objc_msgSend(v126, "statType");
            *(_DWORD *)v397 = 134217984;
            *(_QWORD *)&v397[4] = v131;
            _os_log_debug_impl(&dword_1D3352000, v130, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request7 ioSID: %ld", v397, 0xCu);
          }

          ++v124;
        }
        while (v121 != v124);
        v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v309, v384, 16);
        v122 = v125 + v124;
      }
      while (v121);

      if (v125 + (_DWORD)v124)
        goto LABEL_119;
    }
    else
    {

    }
    v373 = 0;
LABEL_119:
    v379 = 0;
    v380 = 0;
    v381 = 0;
    v132 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 4096);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "dictionaryWithObjectsAndKeys:", v133, *MEMORY[0x1E0CBBEE0], 0);
    v134 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v135 = IOSurfaceCreate(v134);
    buffer = v135;
    if (v135)
    {
      IOSurfaceLock(v135, 0, 0);
      v380 = IOSurfaceGetID(buffer);
      v136 = (id)gLogger;
      if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.3();
      }

      IOSurfaceUnlock(buffer, 0, 0);
      objc_msgSend(v297, "sharedEvents");

      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
        -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.2();
      v137 = -[_ANEVirtualClient callIOUserClient:inParams:outParams:](self, "callIOUserClient:inParams:outParams:", 4, v361, &v382);

LABEL_204:
      -[_ANEVirtualClient updateError:error:](self, "updateError:error:", v358, a8);
      -[_ANEVirtualClient updatePerformanceStats:](self, "updatePerformanceStats:", v358);
      v271 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v297, "setPerfStats:", v271);

      -[_ANEVirtualClient releaseIOSurfaces:](self, "releaseIOSurfaces:", v358);
      goto LABEL_205;
    }
    v138 = (id)gLogger;
    if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.1();
    }

    goto LABEL_174;
  }
  v56 = (id)gLogger;
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.17();

  v383 = 0;
  theDict = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v57 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  cf = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  objc_msgSend(v293, "modelURL");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58 == 0;

  if (!v59)
    -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:](self, "copyAllModelFiles:dictionary:ioSurfaceRefs:", v293, theDict, cf);
  -[_ANEVirtualClient copyModelMetaData:options:dictionary:vmData:](self, "copyModelMetaData:options:dictionary:vmData:", v293, v292, theDict, v358);
  -[_ANEVirtualClient copyOptions:dictionary:vmData:](self, "copyOptions:dictionary:vmData:", v292, theDict, v358);
  -[_ANEVirtualClient copyErrorValue:vmData:](self, "copyErrorValue:vmData:", theDict, v358);
  valuePtr = 0;
  v353 = 0u;
  v354 = 0u;
  v355 = 0u;
  v356 = 0u;
  objc_msgSend(v297, "inputArray");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v353, v425, 16);
  if (v61)
  {
    v62 = *(_QWORD *)v354;
    do
    {
      for (i = 0; i != v61; ++i)
      {
        if (*(_QWORD *)v354 != v62)
          objc_enumerationMutation(v60);
        v64 = IOSurfaceGetID((IOSurfaceRef)objc_msgSend(*(id *)(*((_QWORD *)&v353 + 1) + 8 * i), "ioSurface"));
        v65 = valuePtr;
        v369[valuePtr + 12] = v64;
        v66 = CFStringCreateWithFormat(0, 0, CFSTR("inputArray%d"), v65);
        v67 = CFNumberCreate(v57, kCFNumberSInt32Type, &v369[valuePtr + 12]);
        CFDictionarySetValue(theDict, v66, v67);
        CFRelease(v67);
        CFRelease(v66);
        v68 = (id)gLogger;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        {
          v69 = v369[valuePtr + 12];
          *(_DWORD *)v397 = 67109120;
          *(_DWORD *)&v397[4] = v69;
          _os_log_debug_impl(&dword_1D3352000, v68, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request1 ioSID: %u", v397, 8u);
        }

        ++valuePtr;
      }
      v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v353, v425, 16);
    }
    while (v61);
  }

  v70 = CFNumberCreate(v57, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(theDict, CFSTR("inputArrayCount"), v70);
  CFRelease(v70);
  valuePtr = 0;
  v349 = 0u;
  v350 = 0u;
  v351 = 0u;
  v352 = 0u;
  objc_msgSend(v297, "inputIndexArray");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v349, v424, 16);
  if (v72)
  {
    v73 = *(_QWORD *)v350;
    do
    {
      for (j = 0; j != v72; ++j)
      {
        if (*(_QWORD *)v350 != v73)
          objc_enumerationMutation(v71);
        v75 = *(void **)(*((_QWORD *)&v349 + 1) + 8 * j);
        v76 = objc_msgSend(v75, "unsignedIntValue");
        v77 = valuePtr;
        v369[valuePtr + 76] = v76;
        v78 = CFStringCreateWithFormat(0, 0, CFSTR("inputIndexArray%d"), v77);
        v79 = CFNumberCreate(v57, kCFNumberSInt32Type, &v369[valuePtr + 76]);
        CFDictionarySetValue(theDict, v78, v79);
        CFRelease(v79);
        CFRelease(v78);
        v80 = (id)gLogger;
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          v81 = objc_msgSend(v75, "unsignedLongLongValue");
          *(_DWORD *)v397 = 134217984;
          *(_QWORD *)&v397[4] = v81;
          _os_log_debug_impl(&dword_1D3352000, v80, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request2 ioSID: %llu", v397, 0xCu);
        }

        ++valuePtr;
      }
      v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v349, v424, 16);
    }
    while (v72);
  }

  v82 = CFNumberCreate(v57, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(theDict, CFSTR("inputIndexArrayCount"), v82);
  CFRelease(v82);
  valuePtr = 0;
  v345 = 0u;
  v346 = 0u;
  v347 = 0u;
  v348 = 0u;
  objc_msgSend(v297, "outputArray");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v345, v423, 16);
  if (v84)
  {
    v85 = *(_QWORD *)v346;
    do
    {
      for (k = 0; k != v84; ++k)
      {
        if (*(_QWORD *)v346 != v85)
          objc_enumerationMutation(v83);
        v87 = IOSurfaceGetID((IOSurfaceRef)objc_msgSend(*(id *)(*((_QWORD *)&v345 + 1) + 8 * k), "ioSurface"));
        v88 = valuePtr;
        v369[valuePtr + 140] = v87;
        v89 = CFStringCreateWithFormat(0, 0, CFSTR("outputArray%d"), v88);
        v90 = CFNumberCreate(v57, kCFNumberSInt32Type, &v369[valuePtr + 140]);
        CFDictionarySetValue(theDict, v89, v90);
        CFRelease(v90);
        CFRelease(v89);
        v91 = (id)gLogger;
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
        {
          v92 = v369[valuePtr + 140];
          *(_DWORD *)v397 = 67109120;
          *(_DWORD *)&v397[4] = v92;
          _os_log_debug_impl(&dword_1D3352000, v91, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request3 ioSID: %u", v397, 8u);
        }

        ++valuePtr;
      }
      v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v345, v423, 16);
    }
    while (v84);
  }

  v93 = CFNumberCreate(v57, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(theDict, CFSTR("outputArrayCount"), v93);
  CFRelease(v93);
  valuePtr = 0;
  v341 = 0u;
  v342 = 0u;
  v343 = 0u;
  v344 = 0u;
  objc_msgSend(v297, "outputIndexArray");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v341, v422, 16);
  if (v95)
  {
    v96 = *(_QWORD *)v342;
    do
    {
      for (m = 0; m != v95; ++m)
      {
        if (*(_QWORD *)v342 != v96)
          objc_enumerationMutation(v94);
        v98 = *(void **)(*((_QWORD *)&v341 + 1) + 8 * m);
        v99 = objc_msgSend(v98, "unsignedIntValue");
        v100 = valuePtr;
        v369[valuePtr + 204] = v99;
        v101 = CFStringCreateWithFormat(0, 0, CFSTR("outputIndexArray%d"), v100);
        v102 = CFNumberCreate(v57, kCFNumberSInt32Type, &v369[valuePtr + 204]);
        CFDictionarySetValue(theDict, v101, v102);
        CFRelease(v102);
        CFRelease(v101);
        v103 = (id)gLogger;
        if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
        {
          v104 = objc_msgSend(v98, "unsignedLongLongValue");
          *(_DWORD *)v397 = 134217984;
          *(_QWORD *)&v397[4] = v104;
          _os_log_debug_impl(&dword_1D3352000, v103, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request4 ioSID: %llu", v397, 0xCu);
        }

        ++valuePtr;
      }
      v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v341, v422, 16);
    }
    while (v95);
  }

  v105 = CFNumberCreate(v57, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(theDict, CFSTR("outputIndexArrayCount"), v105);
  CFRelease(v105);
  v106 = (id)gLogger;
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v297, "inputArray");
    v282 = (void *)objc_claimAutoreleasedReturnValue();
    v283 = objc_msgSend(v282, "count");
    objc_msgSend(v297, "inputIndexArray");
    v284 = (void *)objc_claimAutoreleasedReturnValue();
    v285 = objc_msgSend(v284, "count");
    objc_msgSend(v297, "outputArray");
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    v287 = objc_msgSend(v286, "count");
    objc_msgSend(v297, "outputIndexArray");
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    v289 = objc_msgSend(v288, "count");
    *(_DWORD *)v397 = 134218752;
    *(_QWORD *)&v397[4] = v283;
    *(_WORD *)&v397[12] = 2048;
    *(_QWORD *)&v397[14] = v285;
    *(_WORD *)v398 = 2048;
    *(_QWORD *)&v398[2] = v287;
    *(_WORD *)&v398[10] = 2048;
    *(_QWORD *)&v398[12] = v289;
    _os_log_debug_impl(&dword_1D3352000, v106, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate: request.inputArray %lu request.inputIndexArray %lu request.outputArray %lu request.outputIndexArray %lu", v397, 0x2Au);

  }
  objc_msgSend(v297, "weightsBuffer");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = objc_msgSend(v107, "ioSurface") == 0;

  if (v108)
  {
    v370 = 0;
  }
  else
  {
    objc_msgSend(v297, "weightsBuffer");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v370 = IOSurfaceGetID((IOSurfaceRef)objc_msgSend(v109, "ioSurface"));

    v110 = CFNumberCreate(v57, kCFNumberSInt32Type, &v370);
    CFDictionarySetValue(theDict, CFSTR("ioSIDWeightsBufferIndex"), v110);
    CFRelease(v110);
    v111 = (id)gLogger;
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
      -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.16((uint64_t)&v370, v111, v112, v113, v114, v115, v116, v117);

  }
  objc_msgSend(v297, "procedureIndex");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v371 = objc_msgSend(v139, "unsignedLongLongValue");

  v140 = CFNumberCreate(v57, kCFNumberSInt64Type, &v371);
  CFDictionarySetValue(theDict, CFSTR("procedureIndex"), v140);
  CFRelease(v140);
  objc_msgSend(v297, "transactionHandle");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v372[0] = objc_msgSend(v141, "unsignedLongLongValue");

  v142 = CFNumberCreate(v57, kCFNumberSInt64Type, v372);
  CFDictionarySetValue(theDict, CFSTR("transactionHandle"), v142);
  CFRelease(v142);
  valuePtr = 0;
  v337 = 0u;
  v338 = 0u;
  v339 = 0u;
  v340 = 0u;
  objc_msgSend(v297, "perfStatsArray");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v337, v421, 16);
  if (v144)
  {
    v145 = *(_QWORD *)v338;
    do
    {
      for (n = 0; n != v144; ++n)
      {
        if (*(_QWORD *)v338 != v145)
          objc_enumerationMutation(v143);
        v147 = *(void **)(*((_QWORD *)&v337 + 1) + 8 * n);
        objc_msgSend(v147, "stats");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        v149 = IOSurfaceGetID((IOSurfaceRef)objc_msgSend(v148, "ioSurface"));
        *((_DWORD *)&v372[1] + valuePtr) = v149;

        v150 = CFStringCreateWithFormat(0, 0, CFSTR("ioSIDPerfStats%d"), valuePtr);
        v151 = CFNumberCreate(v57, kCFNumberSInt32Type, (char *)&v372[1] + 4 * valuePtr);
        CFDictionarySetValue(theDict, v150, v151);
        CFRelease(v151);
        CFRelease(v150);
        v152 = objc_msgSend(v147, "statType");
        v153 = valuePtr;
        *((_DWORD *)&v372[33] + valuePtr) = v152;
        v154 = CFStringCreateWithFormat(0, 0, CFSTR("perfStatsType%d"), v153);
        v155 = CFNumberCreate(v57, kCFNumberSInt32Type, (char *)&v372[33] + 4 * valuePtr);
        CFDictionarySetValue(theDict, v154, v155);
        CFRelease(v155);
        CFRelease(v154);
        v156 = (id)gLogger;
        if (os_log_type_enabled(v156, OS_LOG_TYPE_DEBUG))
        {
          v158 = *((_DWORD *)&v372[1] + valuePtr);
          *(_DWORD *)v397 = 67109120;
          *(_DWORD *)&v397[4] = v158;
          _os_log_debug_impl(&dword_1D3352000, v156, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request6 ioSID: %u", v397, 8u);
        }

        v157 = (id)gLogger;
        if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG))
        {
          v159 = *((_DWORD *)&v372[33] + valuePtr);
          *(_DWORD *)v397 = 67109120;
          *(_DWORD *)&v397[4] = v159;
          _os_log_debug_impl(&dword_1D3352000, v157, OS_LOG_TYPE_DEBUG, "ANEVirtualClient Evaluate request7 ioSID: %u", v397, 8u);
        }

        ++valuePtr;
      }
      v144 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v337, v421, 16);
    }
    while (v144);
  }

  v160 = CFNumberCreate(v57, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(theDict, CFSTR("perfStatsCount"), v160);
  CFRelease(v160);
  v379 = 0;
  v380 = 0;
  v381 = 0;
  v161 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 4096);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "dictionaryWithObjectsAndKeys:", v162, *MEMORY[0x1E0CBBEE0], 0);
  v163 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v164 = IOSurfaceCreate(v163);
  buffer = v164;
  if (v164)
  {
    v380 = IOSurfaceGetID(v164);
    v165 = CFNumberCreate(v57, kCFNumberSInt32Type, &v380);
    CFDictionarySetValue(theDict, CFSTR("ioSIDPerformanceStatsIndex"), v165);
    CFRelease(v165);
    v166 = (id)gLogger;
    if (os_log_type_enabled(v166, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.15(v167);
    }

    objc_msgSend(v297, "sharedEvents");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = v168 == 0;

    if (v169)
    {
      v294 = 0;
    }
    else
    {
      bzero(v397, 0x1460uLL);
      objc_msgSend(v297, "sharedEvents");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "signalEvents");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v397[8] = objc_msgSend(v171, "count");

      if (*(_QWORD *)&v397[8])
      {
        v172 = CFStringCreateWithFormat(0, 0, CFSTR("signalEventsCount"));
        v173 = CFNumberCreate(v57, kCFNumberSInt64Type, &v397[8]);
        CFDictionarySetValue(theDict, v172, v173);
        CFRelease(v173);
        CFRelease(v172);
      }
      v174 = (id)gLogger;
      if (os_log_type_enabled(v174, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.14(v175);
      }

      v335 = 0u;
      v336 = 0u;
      v333 = 0u;
      v334 = 0u;
      objc_msgSend(v297, "sharedEvents");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v176, "signalEvents");
      obj = (id)objc_claimAutoreleasedReturnValue();

      v177 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v333, v396, 16);
      if (v177)
      {
        v306 = 0;
        v301 = *(_QWORD *)v334;
        do
        {
          v304 = v177;
          for (ii = 0; ii != v304; ++ii)
          {
            if (*(_QWORD *)v334 != v301)
              objc_enumerationMutation(obj);
            v179 = *(void **)(*((_QWORD *)&v333 + 1) + 8 * ii);
            objc_msgSend(v179, "sharedEvent");
            v180 = (void *)objc_claimAutoreleasedReturnValue();
            v181 = v306 + ii;
            v182 = &v397[40 * (v306 + ii)];
            *((_DWORD *)v182 + 644) = objc_msgSend(v180, "eventPort");

            v183 = v182;
            *((_DWORD *)v182 + 645) = objc_msgSend(v179, "eventType");
            *((_QWORD *)v182 + 323) = objc_msgSend(v179, "value");
            v184 = v182;
            *((_DWORD *)v182 + 648) = objc_msgSend(v179, "symbolIndex");
            v185 = objc_msgSend(v179, "agentMask");
            v186 = (int *)(v182 + 2576);
            v187 = (uint64_t *)(v182 + 2584);
            v188 = v182;
            *((_QWORD *)v182 + 325) = v185;
            v182[2608] = 0;
            v189 = (id)gLogger;
            if (os_log_type_enabled(v189, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              v200 = (id)objc_claimAutoreleasedReturnValue();
              v201 = *v186;
              v202 = *v187;
              v390 = 138412802;
              v391 = v200;
              v392 = 1024;
              v393 = v201;
              v394 = 2048;
              v395 = v202;
              _os_log_debug_impl(&dword_1D3352000, v189, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient signal events port is %#x and value is %llu\n", (uint8_t *)&v390, 0x1Cu);

            }
            v190 = CFStringCreateWithFormat(0, 0, CFSTR("signalEvents%dport"), v181);
            v191 = CFNumberCreate(v57, kCFNumberSInt32Type, v186);
            CFDictionarySetValue(theDict, v190, v191);
            CFRelease(v191);
            CFRelease(v190);
            v192 = CFStringCreateWithFormat(0, 0, CFSTR("signalEvents%dtype"), v181);
            v193 = CFNumberCreate(v57, kCFNumberSInt32Type, v183 + 2580);
            CFDictionarySetValue(theDict, v192, v193);
            CFRelease(v193);
            CFRelease(v192);
            v194 = CFStringCreateWithFormat(0, 0, CFSTR("signalEvents%dValue"), v181);
            v195 = CFNumberCreate(v57, kCFNumberSInt64Type, v187);
            CFDictionarySetValue(theDict, v194, v195);
            CFRelease(v195);
            CFRelease(v194);
            v196 = CFStringCreateWithFormat(0, 0, CFSTR("signalEvents%dSymbolIndex"), v181);
            v197 = CFNumberCreate(v57, kCFNumberSInt32Type, v184 + 2592);
            CFDictionarySetValue(theDict, v196, v197);
            CFRelease(v197);
            CFRelease(v196);
            v198 = CFStringCreateWithFormat(0, 0, CFSTR("signalEvents%dAgentMask"), v181);
            v199 = CFNumberCreate(v57, kCFNumberSInt64Type, v188 + 2600);
            CFDictionarySetValue(theDict, v198, v199);
            CFRelease(v199);
            CFRelease(v198);
          }
          v177 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v333, v396, 16);
          v306 = (v306 + ii);
        }
        while (v177);
      }

      if (v298)
      {
        objc_msgSend(v298, "signalEvents");
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        v204 = objc_msgSend(v203, "count") == 2;

        if (!v204)
        {
          v205 = (id)gLogger;
          if (os_log_type_enabled(v205, OS_LOG_TYPE_ERROR))
            -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.13();

        }
        v206 = 0;
        v207 = 1;
        do
        {
          v208 = v207;
          objc_msgSend(v298, "signalEvents");
          v209 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v209, "objectAtIndexedSubscript:", v206);
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          v211 = objc_msgSend(v210, "value") == 4097;

          if (v211)
          {
            objc_msgSend(v298, "signalEvents");
            v212 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v212, "objectAtIndexedSubscript:", v206);
            v213 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v213, "sharedEvent");
            v214 = (void *)objc_claimAutoreleasedReturnValue();
            v413[0] = objc_msgSend(v214, "eventPort");

            objc_msgSend(v298, "signalEvents");
            v215 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v215, "objectAtIndexedSubscript:", v206);
            v216 = (void *)objc_claimAutoreleasedReturnValue();
            v413[1] = objc_msgSend(v216, "eventType");

            objc_msgSend(v298, "signalEvents");
            v217 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v217, "objectAtIndexedSubscript:", v206);
            v218 = (void *)objc_claimAutoreleasedReturnValue();
            v414 = objc_msgSend(v218, "value");

            objc_msgSend(v298, "signalEvents");
            v219 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v219, "objectAtIndexedSubscript:", v206);
            v220 = (void *)objc_claimAutoreleasedReturnValue();
            v415 = objc_msgSend(v220, "symbolIndex");

            v416 = 0;
            v221 = (id)gLogger;
            if (os_log_type_enabled(v221, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              v222 = (id)objc_claimAutoreleasedReturnValue();
              v390 = 138412802;
              v391 = v222;
              v392 = 1024;
              v393 = v413[0];
              v394 = 2048;
              v395 = v414;
              _os_log_debug_impl(&dword_1D3352000, v221, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient success completionEvent signal events port is %#x and value is %llu\n", (uint8_t *)&v390, 0x1Cu);

            }
          }
          else
          {
            objc_msgSend(v298, "signalEvents");
            v223 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v223, "objectAtIndexedSubscript:", v206);
            v224 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v224, "sharedEvent");
            v225 = (void *)objc_claimAutoreleasedReturnValue();
            v417[0] = objc_msgSend(v225, "eventPort");

            objc_msgSend(v298, "signalEvents");
            v226 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v226, "objectAtIndexedSubscript:", v206);
            v227 = (void *)objc_claimAutoreleasedReturnValue();
            v417[1] = objc_msgSend(v227, "eventType");

            objc_msgSend(v298, "signalEvents");
            v228 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v228, "objectAtIndexedSubscript:", v206);
            v229 = (void *)objc_claimAutoreleasedReturnValue();
            v418 = objc_msgSend(v229, "value");

            objc_msgSend(v298, "signalEvents");
            v230 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v230, "objectAtIndexedSubscript:", v206);
            v231 = (void *)objc_claimAutoreleasedReturnValue();
            v419 = objc_msgSend(v231, "symbolIndex");

            v420 = 0;
            v221 = (id)gLogger;
            if (os_log_type_enabled(v221, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              v232 = (id)objc_claimAutoreleasedReturnValue();
              v390 = 138412802;
              v391 = v232;
              v392 = 1024;
              v393 = v417[0];
              v394 = 2048;
              v395 = v418;
              _os_log_debug_impl(&dword_1D3352000, v221, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient error completionEvent signal events port is %#x and value is %llu\n", (uint8_t *)&v390, 0x1Cu);

            }
          }

          v207 = 0;
          v206 = 1;
        }
        while ((v208 & 1) != 0);
        v234 = CFStringCreateWithFormat(0, 0, CFSTR("successEventport"));
        v235 = CFNumberCreate(v57, kCFNumberSInt32Type, v413);
        CFDictionarySetValue(theDict, v234, v235);
        CFRelease(v235);
        CFRelease(v234);
        v236 = CFStringCreateWithFormat(0, 0, CFSTR("errorEventport"));
        v237 = CFNumberCreate(v57, kCFNumberSInt32Type, v417);
        CFDictionarySetValue(theDict, v236, v237);
        CFRelease(v237);
        CFRelease(v236);
      }
      objc_msgSend(v297, "sharedEvents");
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v238, "waitEvents");
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v397 = objc_msgSend(v239, "count");

      v294 = *(_QWORD *)v397 != 0;
      if (*(_QWORD *)v397)
      {
        v240 = CFStringCreateWithFormat(0, 0, CFSTR("waitEventsCount"));
        v241 = CFNumberCreate(v57, kCFNumberSInt64Type, v397);
        CFDictionarySetValue(theDict, v240, v241);
        CFRelease(v241);
        CFRelease(v240);
        v242 = (id)gLogger;
        if (os_log_type_enabled(v242, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          v243 = (void *)objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.12(v243);
        }

      }
      v244 = (id)gLogger;
      if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v245 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.11(v245);
      }

      v331 = 0u;
      v332 = 0u;
      v329 = 0u;
      v330 = 0u;
      objc_msgSend(v297, "sharedEvents");
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v246, "waitEvents");
      obja = (id)objc_claimAutoreleasedReturnValue();

      v247 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v329, v389, 16);
      if (v247)
      {
        v307 = 0;
        v302 = *(_QWORD *)v330;
        do
        {
          v305 = v247;
          for (jj = 0; jj != v305; ++jj)
          {
            if (*(_QWORD *)v330 != v302)
              objc_enumerationMutation(obja);
            v249 = *(void **)(*((_QWORD *)&v329 + 1) + 8 * jj);
            objc_msgSend(v249, "sharedEvent");
            v250 = (void *)objc_claimAutoreleasedReturnValue();
            v251 = &v397[40 * (v307 + jj)];
            *((_DWORD *)v251 + 4) = objc_msgSend(v250, "eventPort");

            v252 = v251;
            *((_DWORD *)v251 + 5) = objc_msgSend(v249, "eventType");
            *((_QWORD *)v251 + 3) = objc_msgSend(v249, "value");
            v253 = v251 + 24;
            *((_DWORD *)v251 + 8) = 0;
            *((_QWORD *)v251 + 5) = 0;
            v251[48] = 0;
            v254 = CFStringCreateWithFormat(0, 0, CFSTR("waitEvents%dport"), v307 + jj);
            v255 = CFNumberCreate(v57, kCFNumberSInt32Type, v251 + 16);
            CFDictionarySetValue(theDict, v254, v255);
            CFRelease(v255);
            CFRelease(v254);
            v256 = CFStringCreateWithFormat(0, 0, CFSTR("waitEvents%dtype"), v307 + jj);
            v257 = CFNumberCreate(v57, kCFNumberSInt32Type, v252 + 20);
            CFDictionarySetValue(theDict, v256, v257);
            CFRelease(v257);
            CFRelease(v256);
            v258 = CFStringCreateWithFormat(0, 0, CFSTR("waitEvents%dValue"), v307 + jj);
            v259 = CFNumberCreate(v57, kCFNumberSInt64Type, v253);
            CFDictionarySetValue(theDict, v258, v259);
            CFRelease(v259);
            CFRelease(v258);
          }
          v247 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v329, v389, 16);
          v307 = (v307 + jj);
        }
        while (v247);
      }

    }
    -[_ANEVirtualClient printDictionary:](self, "printDictionary:", theDict);
    v260 = -[_ANEVirtualClient callIOUserClientWithDictionary:inDictionary:error:](self, "callIOUserClientWithDictionary:inDictionary:error:", 4, theDict, a8);
    CFRelease(theDict);
    -[_ANEVirtualClient printDictionary:](self, "printDictionary:", v260);
    objc_msgSend(v293, "modelURL");
    v261 = (void *)objc_claimAutoreleasedReturnValue();
    v262 = v261 == 0;

    if (!v262)
    {
      +[_ANEVirtualClient freeModelFileIOSurfaces:](_ANEVirtualClient, "freeModelFileIOSurfaces:", cf);
      CFRelease(cf);
    }
    v263 = (id)gLogger;
    v264 = os_log_type_enabled(v263, OS_LOG_TYPE_DEBUG);
    if (v260)
    {
      if (v264)
      {
        NSStringFromSelector(a2);
        v265 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.10(v265);
      }

      +[_ANEVirtualClient copyDictionaryDataToStruct:dictionary:](_ANEVirtualClient, "copyDictionaryDataToStruct:dictionary:", &v382, v260);
      v137 = v383 == 1;
      v266 = (id)gLogger;
      if (os_log_type_enabled(v266, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v267 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.9(v267);
      }

      CFRelease(v260);
      goto LABEL_204;
    }
    if (v264)
    {
      NSStringFromSelector(a2);
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.8(v268, v294);
    }

    if (v294)
    {
      v269 = (id)gLogger;
      if (os_log_type_enabled(v269, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v270 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.6(v270);
      }

      v137 = 1;
      goto LABEL_204;
    }
    -[_ANEVirtualClient releaseIOSurfaces:](self, "releaseIOSurfaces:", v358);
    v163 = (const __CFDictionary *)(id)gLogger;
    if (os_log_type_enabled((os_log_t)v163, OS_LOG_TYPE_ERROR))
      -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.7((uint64_t *)a8, v163, v273);
  }
  else
  {
    v233 = (id)gLogger;
    if (os_log_type_enabled(v233, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.1();
    }

  }
LABEL_174:
  v137 = 0;
LABEL_205:

  return v137;
}

- (BOOL)compiledModelExistsFor:(id)a3
{
  id v5;
  NSObject *v6;
  BOOL v7;
  __CFDictionary *Mutable;
  CFMutableArrayRef v9;
  void *v10;
  BOOL v11;
  void *v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  __CFDictionary *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  _BYTE v23[632];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (id)gLogger;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualClient compileModel:options:qos:error:].cold.6();
  }

  bzero(v23, 0x1728uLL);
  if ((-[_ANEVirtualClient negotiatedCapabilityMask](self, "negotiatedCapabilityMask") & 4) != 0)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v9 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    objc_msgSend(v5, "modelURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

    if (!v11)
    {
      -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:](self, "copyAllModelFiles:dictionary:ioSurfaceRefs:", v5, Mutable, v9);
      -[_ANEVirtualClient copyModelMetaData:options:dictionary:vmData:](self, "copyModelMetaData:options:dictionary:vmData:", v5, MEMORY[0x1E0C9AA70], Mutable, v23);
    }
    objc_msgSend(v5, "getCacheURLIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

    if (!v13)
    {
      objc_msgSend(v5, "cacheURLIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (id)gLogger;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient loadModel:options:qos:error:].cold.8();
      }

      CFDictionarySetValue(Mutable, CFSTR("modelCacheURLIdentifier"), v14);
    }
    +[_ANEVirtualClient setCodeSigningIdentity:](_ANEVirtualClient, "setCodeSigningIdentity:", Mutable);
    -[_ANEVirtualClient printDictionary:](self, "printDictionary:", Mutable);
    v16 = -[_ANEVirtualClient callIOUserClientWithDictionary:inDictionary:error:](self, "callIOUserClientWithDictionary:inDictionary:error:", 5, Mutable, 0);
    CFRelease(Mutable);
    -[_ANEVirtualClient printDictionary:](self, "printDictionary:", v16);
    objc_msgSend(v5, "modelURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 == 0;

    if (!v18)
    {
      +[_ANEVirtualClient freeModelFileIOSurfaces:](_ANEVirtualClient, "freeModelFileIOSurfaces:", v9);
      CFRelease(v9);
    }
    if (v16)
    {
      v19 = (id)gLogger;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient compiledModelExistsFor:].cold.3();
      }

      +[_ANEVirtualClient copyDictionaryDataToStruct:dictionary:](_ANEVirtualClient, "copyDictionaryDataToStruct:dictionary:", &v25, v16);
      v7 = v26 == 1;
      if (v26 == 1)
      {
        +[_ANEVirtualClient dictionaryGetNSStringForKey:key:](_ANEVirtualClient, "dictionaryGetNSStringForKey:key:", v16, CFSTR("modelCacheURLIdentifier"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v5, "setCacheURLIdentifier:", v20);

      }
      v21 = (id)gLogger;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient compiledModelExistsFor:].cold.2();
      }

      CFRelease(v16);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
        -[_ANEVirtualClient compiledModelExistsFor:].cold.1();
      v7 = 0;
    }
  }
  else
  {
    -[_ANEVirtualClient copyModel:options:vmData:](self, "copyModel:options:vmData:", v5, MEMORY[0x1E0C9AA70], v23);
    v7 = -[_ANEVirtualClient callIOUserClient:inParams:outParams:](self, "callIOUserClient:inParams:outParams:", 5, &v24, 0);
  }
  -[_ANEVirtualClient releaseIOSurfaces:](self, "releaseIOSurfaces:", v23);

  return v7;
}

- (void)purgeCompiledModel:(id)a3
{
  id v5;
  NSObject *v6;
  __CFDictionary *Mutable;
  CFMutableArrayRef v8;
  void *v9;
  BOOL v10;
  void *v11;
  BOOL v12;
  void *v13;
  NSObject *v14;
  __CFDictionary *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  _BYTE v19[632];
  _QWORD v20[672];

  v20[671] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (id)gLogger;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualClient compileModel:options:qos:error:].cold.6();
  }

  bzero(v19, 0x1728uLL);
  if ((-[_ANEVirtualClient negotiatedCapabilityMask](self, "negotiatedCapabilityMask") & 4) != 0)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v8 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    objc_msgSend(v5, "modelURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (!v10)
      -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:](self, "copyAllModelFiles:dictionary:ioSurfaceRefs:", v5, Mutable, v8);
    -[_ANEVirtualClient copyModelMetaData:options:dictionary:vmData:](self, "copyModelMetaData:options:dictionary:vmData:", v5, MEMORY[0x1E0C9AA70], Mutable, v19);
    objc_msgSend(v5, "getCacheURLIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

    if (!v12)
    {
      objc_msgSend(v5, "cacheURLIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (id)gLogger;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient loadModel:options:qos:error:].cold.8();
      }

      CFDictionarySetValue(Mutable, CFSTR("modelCacheURLIdentifier"), v13);
    }
    +[_ANEVirtualClient setCodeSigningIdentity:](_ANEVirtualClient, "setCodeSigningIdentity:", Mutable);
    -[_ANEVirtualClient printDictionary:](self, "printDictionary:", Mutable);
    v15 = -[_ANEVirtualClient callIOUserClientWithDictionary:inDictionary:error:](self, "callIOUserClientWithDictionary:inDictionary:error:", 6, Mutable, 0);
    CFRelease(Mutable);
    -[_ANEVirtualClient printDictionary:](self, "printDictionary:", v15);
    objc_msgSend(v5, "modelURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16 == 0;

    if (!v17)
    {
      +[_ANEVirtualClient freeModelFileIOSurfaces:](_ANEVirtualClient, "freeModelFileIOSurfaces:", v8);
      CFRelease(v8);
    }
    if (v15)
    {
      v18 = (id)gLogger;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient purgeCompiledModel:].cold.2();
      }

      CFRelease(v15);
    }
    else if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
    {
      -[_ANEVirtualClient purgeCompiledModel:].cold.1();
    }
  }
  else
  {
    -[_ANEVirtualClient copyModel:options:vmData:](self, "copyModel:options:vmData:", v5, MEMORY[0x1E0C9AA70], v19);
    -[_ANEVirtualClient callIOUserClient:inParams:outParams:](self, "callIOUserClient:inParams:outParams:", 6, v20, 0);
  }
  -[_ANEVirtualClient releaseIOSurfaces:](self, "releaseIOSurfaces:", v19);

}

- (BOOL)compiledModelExistsMatchingHash:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  __CFDictionary *Mutable;
  const __CFAllocator *v11;
  CFNumberRef v12;
  CFNumberRef v13;
  NSObject *v14;
  __CFDictionary *v15;
  NSObject *v16;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[79];
  uint64_t v23;
  _BYTE v24[4];
  uint64_t v25[16];
  _QWORD v26[332];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (id)gLogger;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualClient compiledModelExistsMatchingHash:].cold.3();
  }

  bzero(v22, 0x1728uLL);
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[_ANEVirtualClient negotiatedCapabilityMask](self, "negotiatedCapabilityMask") & 4) != 0)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v22[0] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v7, objc_msgSend(v7, "length"), v24);
    v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v12 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, v24);
    CFDictionarySetValue(Mutable, CFSTR("ioSIDHashString"), v12);
    CFRelease(v12);
    v25[0] = objc_msgSend(v7, "length");
    v13 = CFNumberCreate(v11, kCFNumberSInt64Type, v25);
    CFDictionarySetValue(Mutable, CFSTR("hashStringLength"), v13);
    CFRelease(v13);
    v14 = (id)gLogger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v7, "length");
      *(_DWORD *)buf = 138412802;
      v28 = v20;
      v29 = 2048;
      v30 = v21;
      v31 = 2112;
      v32 = v5;
      _os_log_debug_impl(&dword_1D3352000, v14, OS_LOG_TYPE_DEBUG, "%@:ANEVirtualClient length=%lu hashString=%@ \n", buf, 0x20u);

    }
    v15 = -[_ANEVirtualClient callIOUserClientWithDictionary:inDictionary:error:](self, "callIOUserClientWithDictionary:inDictionary:error:", 7, Mutable, 0);
    CFRelease(Mutable);
    if (v15)
    {
      +[_ANEVirtualClient copyDictionaryDataToStruct:dictionary:](_ANEVirtualClient, "copyDictionaryDataToStruct:dictionary:", v26, v15);
      v9 = v26[1] == 1;
      v16 = (id)gLogger;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient compiledModelExistsMatchingHash:].cold.2();
      }

      CFRelease(v15);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
        -[_ANEVirtualClient compiledModelExistsMatchingHash:].cold.1();
      v9 = 0;
    }
  }
  else
  {
    v22[0] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v7, objc_msgSend(v7, "length"), v24);
    v25[0] = objc_msgSend(v7, "length");
    v8 = (id)gLogger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v7, "length");
      *(_DWORD *)buf = 138412802;
      v28 = v18;
      v29 = 2048;
      v30 = v19;
      v31 = 2112;
      v32 = v5;
      _os_log_debug_impl(&dword_1D3352000, v8, OS_LOG_TYPE_DEBUG, "%@:ANEVirtualClient length=%lu hashString=%@ \n", buf, 0x20u);

    }
    v9 = -[_ANEVirtualClient callIOUserClient:inParams:outParams:](self, "callIOUserClient:inParams:outParams:", 7, &v23, 0);
  }
  -[_ANEVirtualClient releaseIOSurfaces:](self, "releaseIOSurfaces:", v22);

  return v9;
}

- (void)purgeCompiledModelMatchingHash:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  __CFDictionary *Mutable;
  const __CFAllocator *v10;
  CFNumberRef v11;
  CFNumberRef v12;
  __CFDictionary *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[79];
  uint64_t v17;
  _BYTE v18[4];
  uint64_t v19[348];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (id)gLogger;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualClient compileModel:options:qos:error:].cold.6();
  }

  bzero(v16, 0x1728uLL);
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[_ANEVirtualClient negotiatedCapabilityMask](self, "negotiatedCapabilityMask") & 4) != 0)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v16[0] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v7, objc_msgSend(v7, "length"), v18);
    v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, v18);
    CFDictionarySetValue(Mutable, CFSTR("ioSIDHashString"), v11);
    CFRelease(v11);
    v19[0] = objc_msgSend(v7, "length");
    v12 = CFNumberCreate(v10, kCFNumberSInt64Type, v19);
    CFDictionarySetValue(Mutable, CFSTR("hashStringLength"), v12);
    CFRelease(v12);
    v13 = -[_ANEVirtualClient callIOUserClientWithDictionary:inDictionary:error:](self, "callIOUserClientWithDictionary:inDictionary:error:", 8, Mutable, 0);
    CFRelease(Mutable);
    if (v13)
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
        -[_ANEVirtualClient purgeCompiledModelMatchingHash:].cold.2();
      CFRelease(v13);
    }
    else if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
    {
      -[_ANEVirtualClient purgeCompiledModelMatchingHash:].cold.1();
    }
  }
  else
  {
    v16[0] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v7, objc_msgSend(v7, "length"), v18);
    v19[0] = objc_msgSend(v7, "length");
    v8 = (id)gLogger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v7, "length");
      *(_DWORD *)buf = 138412802;
      v21 = v14;
      v22 = 2048;
      v23 = v15;
      v24 = 2112;
      v25 = v5;
      _os_log_debug_impl(&dword_1D3352000, v8, OS_LOG_TYPE_DEBUG, "%@:ANEVirtualClient length=%lu hashString=%@ \n", buf, 0x20u);

    }
    -[_ANEVirtualClient callIOUserClient:inParams:outParams:](self, "callIOUserClient:inParams:outParams:", 8, &v17, 0);
  }
  -[_ANEVirtualClient releaseIOSurfaces:](self, "releaseIOSurfaces:", v16);

}

- (BOOL)beginRealTimeTask
{
  NSObject *v4;

  v4 = (id)gLogger;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualClient compileModel:options:qos:error:].cold.6();
  }

  return -[_ANEVirtualClient callIOUserClient:inParams:outParams:](self, "callIOUserClient:inParams:outParams:", 9, 0, 0);
}

- (BOOL)endRealTimeTask
{
  NSObject *v4;

  v4 = (id)gLogger;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualClient compileModel:options:qos:error:].cold.6();
  }

  return -[_ANEVirtualClient callIOUserClient:inParams:outParams:](self, "callIOUserClient:inParams:outParams:", 10, 0, 0);
}

- (BOOL)echo:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  __CFDictionary *Mutable;
  const __CFAllocator *v10;
  CFNumberRef v11;
  CFNumberRef v12;
  __CFDictionary *v13;
  NSObject *v14;
  _QWORD v16[79];
  uint64_t v17;
  _BYTE v18[4];
  uint64_t v19[16];
  _QWORD v20[340];

  v20[339] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (id)gLogger;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualClient compileModel:options:qos:error:].cold.6();
  }

  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  bzero(v16, 0x1728uLL);
  if ((-[_ANEVirtualClient negotiatedCapabilityMask](self, "negotiatedCapabilityMask") & 4) != 0)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v16[0] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v7, objc_msgSend(v7, "length"), v18);
    v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, v18);
    CFDictionarySetValue(Mutable, CFSTR("ioSIDHashString"), v11);
    CFRelease(v11);
    v19[0] = objc_msgSend(v7, "length");
    v12 = CFNumberCreate(v10, kCFNumberSInt64Type, v19);
    CFDictionarySetValue(Mutable, CFSTR("hashStringLength"), v12);
    CFRelease(v12);
    v13 = -[_ANEVirtualClient callIOUserClientWithDictionary:inDictionary:error:](self, "callIOUserClientWithDictionary:inDictionary:error:", 11, Mutable, 0);
    CFRelease(Mutable);
    if (v13)
    {
      +[_ANEVirtualClient copyDictionaryDataToStruct:dictionary:](_ANEVirtualClient, "copyDictionaryDataToStruct:dictionary:", v20, v13);
      v8 = v20[1] == 1;
      v14 = (id)gLogger;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient echo:].cold.2();
      }

      CFRelease(v13);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
        -[_ANEVirtualClient echo:].cold.1();
      v8 = 0;
    }
  }
  else
  {
    v16[0] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v7, objc_msgSend(v7, "length"), v18);
    v19[0] = objc_msgSend(v7, "length");
    v8 = -[_ANEVirtualClient callIOUserClient:inParams:outParams:](self, "callIOUserClient:inParams:outParams:", 11, &v17, 0);
  }
  -[_ANEVirtualClient releaseIOSurfaces:](self, "releaseIOSurfaces:", v16);

  return v8;
}

- (DeviceExtendedInfo)getDeviceInfo
{
  kern_return_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _BOOL4 var3;
  int64_t var2;
  DeviceExtendedInfo *result;
  size_t v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&retstr->var4[4] = 0u;
  *(_OWORD *)&retstr->var4[20] = 0u;
  *(_OWORD *)&retstr->var0.var2 = 0u;
  *(_OWORD *)&retstr->var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  v12 = 80;
  v5 = IOConnectCallMethod(-[_ANEVirtualClient connect](self, "connect"), 0x12u, 0, 0, 0, 0, 0, 0, retstr, &v12);
  v6 = (id)gLogger;
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a3);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient getDeviceInfo].cold.1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    var3 = retstr->var0.var3;
    var2 = retstr->var0.var2;
    *(_DWORD *)buf = 138413058;
    v14 = v8;
    v15 = 1024;
    v16 = 18;
    v17 = 1024;
    v18 = var3;
    v19 = 2048;
    v20 = var2;
    _os_log_impl(&dword_1D3352000, v7, OS_LOG_TYPE_INFO, "%@: ANEVirtualClient Successfully called method %d with result=%d %llx.\n", buf, 0x22u);

  }
  return result;
}

- (BOOL)hasANE
{
  BOOL v3;

  -[_ANEVirtualClient getDeviceInfo](self, "getDeviceInfo");
  return v3;
}

- (int64_t)aneBoardtype
{
  int64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[_ANEVirtualClient getDeviceInfo](self, "getDeviceInfo");
  return v3;
}

- (BOOL)isInternalBuild
{
  BOOL v3;

  -[_ANEVirtualClient getDeviceInfo](self, "getDeviceInfo");
  return v3;
}

- (id)aneArchitectureTypeStr
{
  void *v2;
  _BYTE v4[44];

  *(_QWORD *)&v4[36] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  -[_ANEVirtualClient getDeviceInfo](self, "getDeviceInfo");
  objc_msgSend(v2, "stringWithUTF8String:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)numANEs
{
  unsigned int v3;

  -[_ANEVirtualClient getDeviceInfo](self, "getDeviceInfo");
  return v3;
}

- (unsigned)numANECores
{
  unsigned int v3;

  -[_ANEVirtualClient getDeviceInfo](self, "getDeviceInfo");
  return v3;
}

- (unint64_t)getValidateNetworkVersion
{
  unint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[_ANEVirtualClient exchangeBuildVersionInfo](self, "exchangeBuildVersionInfo");
  return v3;
}

- (__CFDictionary)validateNetworkCreate:(unint64_t)a3 uuid:(id)a4 function:(id)a5 directoryPath:(id)a6 scratchPadPath:(id)a7
{
  id v13;
  id v14;
  const __CFArray *Mutable;
  void *v16;
  void *v17;
  const char *v18;
  size_t v19;
  id v20;
  const char *v21;
  size_t v22;
  id v23;
  const char *v24;
  size_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  __IOSurface *ValueAtIndex;
  id v30;
  void *v31;
  void *v32;
  const __CFDictionary *v33;
  __IOSurface *v34;
  __IOSurface *v35;
  kern_return_t v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  __CFDictionary *v41;
  NSObject *v42;
  id v44;
  id v45;
  const char *aSelector;
  id v47;
  id v48;
  uint32_t outputCnt;
  uint64_t output;
  unint64_t inputStruct;
  _BYTE v52[40];
  uint64_t v53;
  _DWORD v54[98];
  uint64_t v55;
  _QWORD v56[192];
  unsigned int v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v48 = a6;
  v44 = v14;
  v45 = a7;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  aSelector = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  bzero(v52, 0x7E8uLL);
  inputStruct = a3;
  v47 = objc_retainAutorelease(v13);
  v18 = (const char *)objc_msgSend(v47, "cStringUsingEncoding:", 4);
  v19 = strlen(v18);
  memcpy(v52, v18, v19);
  v20 = objc_retainAutorelease(v14);
  v21 = (const char *)objc_msgSend(v20, "cStringUsingEncoding:", 4);
  v22 = strlen(v21);
  memcpy(&v53, v21, v22);
  v23 = objc_retainAutorelease(v45);
  v24 = (const char *)objc_msgSend(v23, "cStringUsingEncoding:", 4);
  v25 = strlen(v24);
  memcpy(v54, v24, v25);
  if (-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:](self, "copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:", v48, Mutable, v16, v17))
  {
    v57 = objc_msgSend(v16, "count");
    if (v57)
    {
      v26 = 0;
      v27 = 744;
      do
      {
        objc_msgSend(v16, "objectAtIndexedSubscript:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v56[v26] = objc_msgSend(v28, "unsignedLongLongValue");

        ValueAtIndex = (__IOSurface *)CFArrayGetValueAtIndex(Mutable, v26);
        v54[v26 + 65] = IOSurfaceGetID(ValueAtIndex);
        objc_msgSend(v17, "objectAtIndexedSubscript:", v26);
        v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        strlcpy(&v52[v27 - 8], (const char *)objc_msgSend(v30, "UTF8String"), 0x28uLL);

        ++v26;
        v27 += 40;
      }
      while (v26 < v57);
    }
    v31 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 10485760);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryWithObjectsAndKeys:", v32, *MEMORY[0x1E0CBBEE0], 0, v13, v44, v45);
    v33 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v34 = IOSurfaceCreate(v33);
    v35 = v34;
    if (v34)
    {
      v54[64] = IOSurfaceGetID(v34);
      v55 = 10485760;
      output = 0;
      outputCnt = 1;
      v36 = IOConnectCallMethod(-[_ANEVirtualClient connect](self, "connect"), 0x11u, 0, 0, &inputStruct, 0x7F0uLL, &output, &outputCnt, 0, 0);
      +[_ANEVirtualClient freeModelFileIOSurfaces:](_ANEVirtualClient, "freeModelFileIOSurfaces:", Mutable);
      if (!v36)
      {
        v41 = +[_ANEVirtualClient getCFDictionaryFromIOSurface:dataLength:](_ANEVirtualClient, "getCFDictionaryFromIOSurface:dataLength:", v35, output);
        CFRelease(v35);
        goto LABEL_18;
      }
      v37 = (id)gLogger;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient validateNetworkCreate:uuid:function:directoryPath:scratchPadPath:].cold.2();
      }

    }
    else
    {
      v42 = (id)gLogger;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient validateNetworkCreate:uuid:function:directoryPath:scratchPadPath:].cold.1();
      }

    }
    v41 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v38 = gLogger;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
    -[_ANEVirtualClient validateNetworkCreate:uuid:function:directoryPath:scratchPadPath:].cold.3(v38, v39, v40);
  v41 = 0;
LABEL_19:

  return v41;
}

- (void)sendGuestBuildVersion
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_5(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_7(&dword_1D3352000, "%@: ANEVirtualClient buildVersion: %@\n", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (BuildVersionInfo)exchangeBuildVersionInfo
{
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  __CFString *v12;
  __CFString *v13;
  const char *v14;
  size_t v15;
  kern_return_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  BuildVersionInfo *result;
  size_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&retstr->var7[11] = 0u;
  *(_OWORD *)&retstr->var7[13] = 0u;
  *(_OWORD *)&retstr->var7[7] = 0u;
  *(_OWORD *)&retstr->var7[9] = 0u;
  *(_OWORD *)&retstr->var7[3] = 0u;
  *(_OWORD *)&retstr->var7[5] = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var7[1] = 0u;
  *(_OWORD *)&retstr->var3[16] = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)retstr->var3 = 0u;
  +[_ANEDeviceInfo productName](_ANEDeviceInfo, "productName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || objc_msgSend(v6, "isEqualToString:", &stru_1E9516758))
  {
    v8 = (id)gLogger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a3);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient exchangeBuildVersionInfo].cold.3();
    }

    v7 = 0;
  }
  +[_ANEDeviceInfo buildVersion](_ANEDeviceInfo, "buildVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9 || objc_msgSend(v9, "isEqualToString:", &stru_1E9516758))
  {
    v11 = (id)gLogger;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a3);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient exchangeBuildVersionInfo].cold.2();
    }

    v10 = 0;
    goto LABEL_11;
  }
  if (!v7)
  {
LABEL_11:
    v12 = CFSTR("UnknownBuild");
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v7, v10);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v13 = objc_retainAutorelease(v12);
  v14 = (const char *)-[__CFString UTF8String](v13, "UTF8String");
  v15 = strlen(v14);
  v21 = 192;
  v16 = IOConnectCallMethod(-[_ANEVirtualClient connect](self, "connect"), 0xFu, 0, 0, v14, v15 + 1, 0, 0, retstr, &v21);
  v17 = (id)gLogger;
  v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a3);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient exchangeBuildVersionInfo].cold.1();
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v19;
    v24 = 1024;
    v25 = 15;
    _os_log_impl(&dword_1D3352000, v18, OS_LOG_TYPE_INFO, "%@: ANEVirtualClient Successfully called method %d", buf, 0x12u);

  }
  return result;
}

- (unsigned)negotiatedDataInterfaceVersion
{
  unsigned int v3;

  -[_ANEVirtualClient exchangeBuildVersionInfo](self, "exchangeBuildVersionInfo");
  return v3;
}

- (unint64_t)negotiatedCapabilityMask
{
  unint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[_ANEVirtualClient exchangeBuildVersionInfo](self, "exchangeBuildVersionInfo");
  return v3;
}

- (id)hostBuildVersionStr
{
  void *v2;
  _QWORD v4[23];

  v4[22] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  -[_ANEVirtualClient exchangeBuildVersionInfo](self, "exchangeBuildVersionInfo");
  objc_msgSend(v2, "stringWithUTF8String:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)outputDictIOSurfaceSize
{
  unint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[_ANEVirtualClient exchangeBuildVersionInfo](self, "exchangeBuildVersionInfo");
  return v3;
}

- (BOOL)mapIOSurfacesWithModel:(id)a3 request:(id)a4 cacheInference:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  id *v14;
  id *v15;
  BOOL v16;
  NSObject *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  _QWORD v22[3];
  BOOL v23;
  _QWORD block[5];
  id v25;
  _QWORD v26[2];
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v10 = a3;
  v11 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
      -[_ANEVirtualClient mapIOSurfacesWithModel:request:cacheInference:error:].cold.1();
    objc_msgSend(v11, "completionHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[_ANEVirtualClient queue](self, "queue");
    if (v12)
    {
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73___ANEVirtualClient_mapIOSurfacesWithModel_request_cacheInference_error___block_invoke;
      block[3] = &unk_1E9516478;
      v26[1] = &v28;
      block[4] = self;
      v14 = &v25;
      v25 = v10;
      v15 = (id *)v26;
      v26[0] = v11;
      v27 = a5;
      dispatch_sync(v13, block);

      *((_BYTE *)v29 + 24) = 1;
    }
    else
    {
      v17 = objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __73___ANEVirtualClient_mapIOSurfacesWithModel_request_cacheInference_error___block_invoke_2;
      v20[3] = &unk_1E95164A0;
      v22[1] = &v28;
      v20[4] = self;
      v14 = &v21;
      v21 = v10;
      v15 = (id *)v22;
      v18 = v11;
      v23 = a5;
      v22[0] = v18;
      v22[2] = a6;
      dispatch_sync(v17, v20);

    }
    v16 = *((_BYTE *)v29 + 24) != 0;
  }
  else
  {
    v16 = 0;
  }
  _Block_object_dispose(&v28, 8);

  return v16;
}

- (BOOL)doMapIOSurfacesWithModel:(id)a3 request:(id)a4 cacheInference:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v6;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  IOSurfaceID ID;
  NSObject *v23;
  int v24;
  void *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  int v34;
  void *v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  IOSurfaceID v41;
  NSObject *v42;
  int v43;
  void *v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  int v53;
  NSObject *v54;
  void *v55;
  _BOOL4 v56;
  void *v57;
  IOSurfaceID v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  void *v67;
  void *v68;
  IOSurfaceID v69;
  NSObject *v70;
  NSObject *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  const __CFDictionary *v75;
  __IOSurface *v76;
  NSObject *v77;
  BOOL v78;
  void *v79;
  NSObject *v80;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  id v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[80];
  IOSurfaceRef buffer;
  _DWORD v117[208];
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char v121;
  BOOL v122;
  int v123;
  int v124;
  int v125;
  int v126;
  _DWORD v127[256];
  IOSurfaceID v128;
  uint64_t v129;
  uint64_t v130;
  _DWORD v131[128];
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  uint64_t v138;
  IOSurfaceID v139;
  uint64_t v140;
  uint64_t v141;
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  uint8_t buf[4];
  _BYTE v148[10];
  uint64_t v149;
  _BYTE v150[24];
  __int16 v151;
  uint64_t v152;
  __int16 v153;
  int v154;
  __int16 v155;
  int v156;
  __int16 v157;
  int v158;
  __int16 v159;
  int v160;
  __int16 v161;
  int v162;
  __int16 v163;
  int v164;
  uint64_t v165;

  v6 = a5;
  v165 = *MEMORY[0x1E0C80C00];
  v93 = a3;
  v94 = a4;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
    -[_ANEVirtualClient doMapIOSurfacesWithModel:request:cacheInference:error:].cold.6();
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
    -[_ANEVirtualClient doMapIOSurfacesWithModel:request:cacheInference:error:].cold.6();
  v8 = gLogger;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
    -[_ANEVirtualClient doMapIOSurfacesWithModel:request:cacheInference:error:].cold.5(v6, v8, v9, v10, v11, v12, v13, v14);
  bzero(v115, 0x1728uLL);
  -[_ANEVirtualClient copyModel:options:vmData:](self, "copyModel:options:vmData:", v93, MEMORY[0x1E0C9AA70], v115);
  -[_ANEVirtualClient copyErrorValue:](self, "copyErrorValue:", v115);
  v118 = objc_msgSend(v93, "string_id");
  v119 = objc_msgSend(v93, "programHandle");
  v120 = objc_msgSend(v93, "intermediateBufferHandle");
  v121 = objc_msgSend(v93, "queueDepth");
  v124 = objc_msgSend(v93, "perfStatsMask");
  v122 = v6;
  v15 = gLogger;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67112192;
    *(_DWORD *)v148 = v117[4];
    *(_WORD *)&v148[4] = 1024;
    *(_DWORD *)&v148[6] = v117[5];
    LOWORD(v149) = 1024;
    *(_DWORD *)((char *)&v149 + 2) = v117[6];
    HIWORD(v149) = 1024;
    *(_DWORD *)v150 = v117[7];
    *(_WORD *)&v150[4] = 2048;
    *(_QWORD *)&v150[6] = v118;
    *(_WORD *)&v150[14] = 2048;
    *(_QWORD *)&v150[16] = v119;
    v151 = 2048;
    v152 = v120;
    v153 = 1024;
    v154 = v121;
    v155 = 1024;
    v156 = v123;
    v157 = 1024;
    v158 = v124;
    v159 = 1024;
    v160 = v125;
    v161 = 1024;
    v162 = v126;
    v163 = 1024;
    v164 = v137;
    _os_log_debug_impl(&dword_1D3352000, v15, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel: virtualANEModel.ioSIDModelNet=%u virtualANEModel.ioSIDModelShape=%u virtualANEModel.ioSIDModelWeight=%u virtualANEModel.ioSIDKey=%u virtualANEModel.string_id=%lld virtualANEModel.programHandle=%lld virtualANEModel.intermediateBufferHandle=%lld virtualANEModel.queueDepth=%d virtualANEModel.ioSIDModelAttributes=%u virtualANEModel.perfStatsMask=%u virtualANEModel.qos=%u virtualANEModel.ioSIDOptions=%u virtualANEModel.ioSIDErrorValue=%u", buf, 0x5Cu);
  }
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  objc_msgSend(v94, "inputArray");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v111, v146, 16);
  if (v17)
  {
    v18 = 0;
    v19 = *(_QWORD *)v112;
    do
    {
      v20 = 0;
      v21 = v18;
      do
      {
        if (*(_QWORD *)v112 != v19)
          objc_enumerationMutation(v16);
        ID = IOSurfaceGetID((IOSurfaceRef)objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * v20), "ioSurface"));
        v127[(v21 + v20)] = ID;
        v23 = gLogger;
        if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v148 = ID;
          _os_log_debug_impl(&dword_1D3352000, v23, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel request1 ioSID: %u", buf, 8u);
        }
        ++v20;
      }
      while (v17 != v20);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v111, v146, 16);
      v18 = v21 + v20;
    }
    while (v17);
    v24 = v21 + v20;
  }
  else
  {
    v24 = 0;
  }

  v133 = v24;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  objc_msgSend(v94, "inputIndexArray");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v107, v145, 16);
  if (v26)
  {
    v27 = 0;
    v28 = *(_QWORD *)v108;
    do
    {
      v29 = 0;
      v30 = v27;
      do
      {
        if (*(_QWORD *)v108 != v28)
          objc_enumerationMutation(v25);
        v31 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v29);
        v127[(v30 + v29) + 64] = objc_msgSend(v31, "unsignedIntValue");
        v32 = (id)gLogger;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v33 = objc_msgSend(v31, "unsignedLongLongValue");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v148 = v33;
          _os_log_debug_impl(&dword_1D3352000, v32, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel request2 ioSID: %llu", buf, 0xCu);
        }

        ++v29;
      }
      while (v26 != v29);
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v107, v145, 16);
      v27 = v30 + v29;
    }
    while (v26);
    v34 = v30 + v29;
  }
  else
  {
    v34 = 0;
  }

  v134 = v34;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  objc_msgSend(v94, "outputArray");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v103, v144, 16);
  if (v36)
  {
    v37 = 0;
    v38 = *(_QWORD *)v104;
    do
    {
      v39 = 0;
      v40 = v37;
      do
      {
        if (*(_QWORD *)v104 != v38)
          objc_enumerationMutation(v35);
        v41 = IOSurfaceGetID((IOSurfaceRef)objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * v39), "ioSurface"));
        v127[(v40 + v39) + 128] = v41;
        v42 = gLogger;
        if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v148 = v41;
          _os_log_debug_impl(&dword_1D3352000, v42, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel request3 ioSID: %u", buf, 8u);
        }
        ++v39;
      }
      while (v36 != v39);
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v103, v144, 16);
      v37 = v40 + v39;
    }
    while (v36);
    v43 = v40 + v39;
  }
  else
  {
    v43 = 0;
  }

  v135 = v43;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  objc_msgSend(v94, "outputIndexArray");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v99, v143, 16);
  if (v45)
  {
    v46 = 0;
    v47 = *(_QWORD *)v100;
    do
    {
      v48 = 0;
      v49 = v46;
      do
      {
        if (*(_QWORD *)v100 != v47)
          objc_enumerationMutation(v44);
        v50 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v48);
        v127[(v49 + v48) + 192] = objc_msgSend(v50, "unsignedIntValue");
        v51 = (id)gLogger;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          v52 = objc_msgSend(v50, "unsignedLongLongValue");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v148 = v52;
          _os_log_debug_impl(&dword_1D3352000, v51, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel request4 ioSID: %llu", buf, 0xCu);
        }

        ++v48;
      }
      while (v45 != v48);
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v99, v143, 16);
      v46 = v49 + v48;
    }
    while (v45);
    v53 = v49 + v48;
  }
  else
  {
    v53 = 0;
  }

  v136 = v53;
  v54 = (id)gLogger;
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v94, "inputArray");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v82, "count");
    objc_msgSend(v94, "inputIndexArray");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v84, "count");
    objc_msgSend(v94, "outputArray");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v86, "count");
    objc_msgSend(v94, "outputIndexArray");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v88, "count");
    *(_DWORD *)buf = 134218752;
    *(_QWORD *)v148 = v83;
    *(_WORD *)&v148[8] = 2048;
    v149 = v85;
    *(_WORD *)v150 = 2048;
    *(_QWORD *)&v150[2] = v87;
    *(_WORD *)&v150[10] = 2048;
    *(_QWORD *)&v150[12] = v89;
    _os_log_debug_impl(&dword_1D3352000, v54, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel: request.inputArray %lu request.inputIndexArray %lu request.outputArray %lu request.outputIndexArray %lu", buf, 0x2Au);

  }
  objc_msgSend(v94, "weightsBuffer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "ioSurface") == 0;

  if (v56)
  {
    v128 = 0;
  }
  else
  {
    objc_msgSend(v94, "weightsBuffer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = IOSurfaceGetID((IOSurfaceRef)objc_msgSend(v57, "ioSurface"));

    v128 = v58;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
      -[_ANEVirtualClient doMapIOSurfacesWithModel:request:cacheInference:error:].cold.4();
  }
  objc_msgSend(v94, "procedureIndex");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = objc_msgSend(v59, "unsignedLongLongValue");

  objc_msgSend(v94, "transactionHandle");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = objc_msgSend(v60, "unsignedLongLongValue");

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  objc_msgSend(v94, "perfStatsArray");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v95, v142, 16);
  if (!v62)
  {

LABEL_73:
    v132 = 0;
    goto LABEL_74;
  }
  v63 = 0;
  v64 = *(_QWORD *)v96;
  do
  {
    v65 = 0;
    v66 = v63;
    do
    {
      if (*(_QWORD *)v96 != v64)
        objc_enumerationMutation(v61);
      v67 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v65);
      objc_msgSend(v67, "stats");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = IOSurfaceGetID((IOSurfaceRef)objc_msgSend(v68, "ioSurface"));

      v131[(v66 + v65)] = v69;
      v131[(v66 + v65) + 64] = objc_msgSend(v67, "statType");
      v132 = v66 + v65 + 1;
      v70 = gLogger;
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v148 = v69;
        _os_log_debug_impl(&dword_1D3352000, v70, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel request6 ioSID: %u", buf, 8u);
      }
      v71 = (id)gLogger;
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        v72 = objc_msgSend(v67, "statType");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v148 = v72;
        _os_log_debug_impl(&dword_1D3352000, v71, OS_LOG_TYPE_DEBUG, "ANEVirtualClient mapIOSurfacesWithModel request7 ioSID: %ld", buf, 0xCu);
      }

      ++v65;
    }
    while (v62 != v65);
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v95, v142, 16);
    v63 = v66 + v65;
  }
  while (v62);

  if (!(v66 + (_DWORD)v65))
    goto LABEL_73;
LABEL_74:
  v138 = 0;
  v139 = 0;
  v140 = 0;
  v73 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 4096);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "dictionaryWithObjectsAndKeys:", v74, *MEMORY[0x1E0CBBEE0], 0);
  v75 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v76 = IOSurfaceCreate(v75);
  buffer = v76;
  if (v76)
  {
    IOSurfaceLock(v76, 0, 0);
    v139 = IOSurfaceGetID(buffer);
    v77 = (id)gLogger;
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient doMapIOSurfacesWithModel:request:cacheInference:error:].cold.3();
    }

    IOSurfaceUnlock(buffer, 0, 0);
    objc_msgSend(v94, "sharedEvents");

    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
      -[_ANEVirtualClient doMapIOSurfacesWithModel:request:cacheInference:error:].cold.2();
    v78 = -[_ANEVirtualClient callIOUserClient:inParams:outParams:](self, "callIOUserClient:inParams:outParams:", 13, v117, &v141);
    -[_ANEVirtualClient updateError:error:](self, "updateError:error:", v115, a6);
    -[_ANEVirtualClient updatePerformanceStats:](self, "updatePerformanceStats:", v115);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setPerfStats:", v79);

    -[_ANEVirtualClient releaseIOSurfaces:](self, "releaseIOSurfaces:", v115);
  }
  else
  {
    v80 = (id)gLogger;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient doMapIOSurfacesWithModel:request:cacheInference:error:].cold.1();
    }

    v78 = 0;
  }

  return v78;
}

- (void)copyModel:(id)a3 options:(id)a4 vmData:(VMData *)a5
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  unint64_t i;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  unint64_t j;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  __IOSurface **v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  int v64;
  void *v65;
  unsigned int *v66;
  __IOSurface **v67;
  NSObject *v68;
  void *v69;
  unsigned int v70;
  __IOSurface *v71;
  unsigned int v72;
  __IOSurface *v73;
  id v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  const __CFString *v81;
  __CFString *v82;
  const __CFString *v83;
  __CFString *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  __CFString *v89;
  id v90;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  VMData *v101;
  void *v102;
  void *v104;
  uint8_t buf[4];
  _BYTE v106[10];
  _BYTE v107[10];
  const __CFString *v108;
  __int16 v109;
  const __CFString *v110;
  __int16 v111;
  __CFString *v112;
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v90 = a4;
  v101 = a5;
  v102 = v7;
  if (a5)
  {
    objc_msgSend(v7, "modelURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = objc_claimAutoreleasedReturnValue();

    v86 = v10;
    -[NSObject componentsSeparatedByString:](v10, "componentsSeparatedByString:", CFSTR("."));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "lastObject");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "modelURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v88, "isEqual:", CFSTR("hwx")))
    {
      v12 = (id)gLogger;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient copyModel:options:vmData:].cold.6();
      }

      objc_msgSend(v99, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "stringByReplacingOccurrencesOfString:withString:", v13, &stru_1E9516758);
      v14 = objc_claimAutoreleasedReturnValue();

      v15 = (id)gLogger;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient copyModel:options:vmData:].cold.5();
      }

      v99 = (void *)v14;
    }
    v16 = (id)gLogger;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyModel:options:vmData:].cold.4();
    }

    v17 = v99;
    if (objc_msgSend(v88, "isEqual:", CFSTR("net")))
    {
      v18 = (void *)objc_opt_new();
      for (i = 0; i < objc_msgSend(v104, "count") - 1; ++i)
      {
        objc_msgSend(v104, "objectAtIndexedSubscript:", i);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "appendString:", v20);

        objc_msgSend(v18, "appendString:", CFSTR("."));
      }
      if (objc_msgSend(v18, "length"))
      {
        v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@net"), v18);
        v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@shape"), v18);
        -[_ANEVirtualClient readWeightFilename:](self, "readWeightFilename:", v99);
        v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v81 = (const __CFString *)v23;
        v83 = (const __CFString *)v24;
        objc_msgSend(v99, "lastPathComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "stringByReplacingOccurrencesOfString:withString:", v25, &stru_1E9516758);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v89)
        {
          v27 = (id)gLogger;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(a2);
            objc_claimAutoreleasedReturnValue();
            -[_ANEVirtualClient copyModel:options:vmData:].cold.3();
          }

          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), v26, v89);
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "attributesOfItemAtPath:error:", v28, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v30, "fileType");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v29) = v31 == (void *)*MEMORY[0x1E0CB2B30];

          if ((_DWORD)v29)
          {
            v32 = (id)gLogger;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              objc_claimAutoreleasedReturnValue();
              -[_ANEVirtualClient copyModel:options:vmData:].cold.2();
            }

            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "destinationOfSymbolicLinkAtPath:error:", v28, 0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v34, "lastPathComponent");
            v35 = objc_claimAutoreleasedReturnValue();

            v89 = (__CFString *)v35;
          }

        }
        else
        {
          v89 = CFSTR("model.espresso.weights");
        }
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v81, 1, 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v83, 1, 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v89, 1, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v101->var12 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v36, objc_msgSend(v36, "length"), &v101->var17.var54);
        v101->var13 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v37, objc_msgSend(v37, "length"), &v101->var17.var56);
        v101->var14 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v38, objc_msgSend(v38, "length"), &v101->var17.var58);
        v101->var17.var55 = objc_msgSend(v36, "length");
        v101->var17.var57 = objc_msgSend(v37, "length");
        v101->var17.var59 = objc_msgSend(v38, "length");
        objc_msgSend(v99, "lastPathComponent");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "stringByReplacingOccurrencesOfString:withString:", v39, &stru_1E9516758);
        v40 = objc_claimAutoreleasedReturnValue();

        v41 = (id)gLogger;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          *(_QWORD *)v106 = v76;
          *(_WORD *)&v106[8] = 2112;
          *(_QWORD *)v107 = v40;
          *(_WORD *)&v107[8] = 2112;
          v108 = v81;
          v109 = 2112;
          v110 = v83;
          v111 = 2112;
          v112 = v89;
          _os_log_debug_impl(&dword_1D3352000, v41, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient: .net filepath=%@ : netname=%@ : shapename=%@ : weightname=%@ ", buf, 0x34u);

        }
        v99 = (void *)v40;
      }
      else
      {
        v81 = CFSTR("model.espresso.net");
        v83 = CFSTR("model.espresso.shape");
        v89 = CFSTR("model.espresso.weights");
      }

      v17 = v99;
      v21 = v81;
      v22 = v83;
    }
    else
    {
      v21 = CFSTR("model.espresso.net");
      v22 = CFSTR("model.espresso.shape");
      v89 = CFSTR("model.espresso.weights");
    }
    v100 = v17;
    v82 = (__CFString *)v21;
    v84 = (__CFString *)v22;
    v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), v17, v21);
    v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), v17, v22);
    v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), v17, v89);
    v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/net.plist"), v17);
    v98 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v80);
    v96 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v79);
    v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v78);
    v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v77);
    v42 = (void *)MEMORY[0x1E0CB36F8];
    objc_msgSend(v102, "key");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "length");
    if (v44)
    {
      objc_msgSend(v102, "key");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v45 = v100;
    }
    objc_msgSend(v42, "archivedDataWithRootObject:requiringSecureCoding:error:", v45, 1, 0);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)

    v46 = (void *)MEMORY[0x1E0CB36F8];
    objc_msgSend(v102, "modelAttributes");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "archivedDataWithRootObject:requiringSecureCoding:error:", v47, 1, 0);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = (void *)MEMORY[0x1E0CB36F8];
    objc_msgSend(v102, "modelURL");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "path");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "archivedDataWithRootObject:requiringSecureCoding:error:", v50, 1, 0);
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    v101->var19 = 0;
    v101->var0 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v98, objc_msgSend(v98, "length"), &v101->var17.var2);
    v101->var1 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v96, objc_msgSend(v96, "length"), &v101->var17.var3);
    v101->var2 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v95, objc_msgSend(v95, "length"), &v101->var17.var4);
    v101->var8 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v93, objc_msgSend(v93, "length"), &v101->var17.var28);
    v101->var6 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v94, objc_msgSend(v94, "length"), &v101->var17.var5);
    v101->var7 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v87, 0x100000, &v101->var17.var19);
    v101->var11 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v97, objc_msgSend(v97, "length"), &v101->var17.var52);
    v101->var17.var61 = 0;
    v101->var17.var6 = objc_msgSend(v98, "length");
    v101->var17.var7 = objc_msgSend(v96, "length");
    v101->var17.var8 = objc_msgSend(v95, "length");
    v101->var17.var9 = objc_msgSend(v94, "length");
    v101->var17.var20 = objc_msgSend(v87, "length");
    v101->var17.var14 = objc_msgSend(v102, "string_id");
    v101->var17.var15 = objc_msgSend(v102, "programHandle");
    v101->var17.var16 = objc_msgSend(v102, "intermediateBufferHandle");
    v101->var17.var17 = objc_msgSend(v102, "queueDepth");
    v101->var17.var21 = objc_msgSend(v102, "perfStatsMask");
    v101->var17.var29 = objc_msgSend(v93, "length");
    v101->var17.var53 = objc_msgSend(v97, "length");
    objc_msgSend(v90, "objectForKey:", kANEFEspressoFileResourcesKey[0]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v51;
    if (objc_msgSend(v51, "count"))
    {
      v52 = 0;
      v53 = 0;
      for (j = 0; j < objc_msgSend(v51, "count"); ++j)
      {
        objc_msgSend(v51, "objectAtIndexedSubscript:", j);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = (id)gLogger;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v106 = v69;
          *(_WORD *)&v106[8] = 2112;
          *(_QWORD *)v107 = v55;
          _os_log_debug_impl(&dword_1D3352000, v56, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient: %@ \n", buf, 0x16u);

        }
        objc_msgSend(v55, "componentsSeparatedByString:", CFSTR("."));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "lastObject");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v58, "isEqual:", CFSTR("net")) & 1) == 0
          && (objc_msgSend(v58, "isEqual:", CFSTR("shape")) & 1) == 0
          && (objc_msgSend(v58, "isEqual:", CFSTR("weights")) & 1) == 0)
        {
          if (v53 >= 32)
          {
            v59 = (id)gLogger;
            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              v74 = (id)objc_claimAutoreleasedReturnValue();
              v75 = objc_msgSend(v51, "count");
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)v106 = v74;
              *(_WORD *)&v106[8] = 2048;
              *(_QWORD *)v107 = v75;
              *(_WORD *)&v107[8] = 1024;
              LODWORD(v108) = 32;
              _os_log_error_impl(&dword_1D3352000, v59, OS_LOG_TYPE_ERROR, "%@: ANEVirtualClient: %lu execeed max number of reference expresso files %d \n", buf, 0x1Cu);

            }
          }
          objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v55, 1, 0);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = &v101->var0 + v53;
          v60[47] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v92, objc_msgSend(v92, "length"), &v101->var17.var12[v53]);
          v60[151] = (__IOSurface *)objc_msgSend(v92, "length");
          v61 = gLogger;
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
          {
            v70 = v101->var17.var12[v53];
            v71 = v60[151];
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)v106 = v53;
            *(_WORD *)&v106[4] = 1024;
            *(_DWORD *)&v106[6] = v70;
            *(_WORD *)v107 = 2048;
            *(_QWORD *)&v107[2] = v71;
            _os_log_debug_impl(&dword_1D3352000, v61, OS_LOG_TYPE_DEBUG, "ioSModelEspressoRefFileName[%d] surface ID: %d length: %llu\n", buf, 0x18u);
          }
          v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), v100, v55);
          v63 = gLogger;
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v106 = v62;
            _os_log_debug_impl(&dword_1D3352000, v63, OS_LOG_TYPE_DEBUG, " fileEspresso %@\n", buf, 0xCu);
          }
          v64 = v53;
          v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v62);
          v66 = &v101->var17.var10[v53];
          v67 = &v101->var0 + v53;
          v67[15] = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v65, objc_msgSend(v65, "length"), v66);
          v67[103] = (__IOSurface *)objc_msgSend(v65, "length");
          v68 = gLogger;
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
          {
            v72 = *v66;
            v73 = v67[103];
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)v106 = v64;
            *(_WORD *)&v106[4] = 1024;
            *(_DWORD *)&v106[6] = v72;
            *(_WORD *)v107 = 2048;
            *(_QWORD *)&v107[2] = v73;
            _os_log_debug_impl(&dword_1D3352000, v68, OS_LOG_TYPE_DEBUG, "ioSIDModelEspressoRefFile[%d] surface ID: %d length: %llu\n", buf, 0x18u);
          }

          v51 = v85;
          v53 = v64 + 1;
        }

        v52 = v55;
      }

    }
  }
  else
  {
    v86 = (id)gLogger;
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyModel:options:vmData:].cold.1();
    }
  }

}

- (BOOL)copyFilesInDirectoryToIOSurfaces:(id)a3 ioSurfaceRefs:(__CFArray *)a4 ioSurfaceSizes:(id)a5 fileNames:(id)a6
{
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  uint32_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  __IOSurface *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint32_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CFIndex Count;
  CFIndex i;
  const void *ValueAtIndex;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  NSObject *v44;
  void *v47;
  id v48;
  id v49;
  id v51;
  id obj;
  char v53;
  void *v54;
  void *v55;
  int v56;
  id v57;
  char v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  char v64;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  id v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v48 = a5;
  v49 = a6;
  v55 = v8;
  if (objc_msgSend(v8, "hasSuffix:", CFSTR("/")))
  {
    objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - 1);
    v9 = objc_claimAutoreleasedReturnValue();

    v55 = (void *)v9;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v64 = 0;
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "fileExistsAtPath:isDirectory:", v55, &v64);
  if (!v64)
  {
    v40 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
      -[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:].cold.1(v40, v41, v42);
    v43 = 0;
    goto LABEL_61;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0;
  objc_msgSend(v10, "contentsOfDirectoryAtPath:error:", v55, &v63);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v63;

  if (v51 || !v47)
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
      -[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:].cold.3();
LABEL_55:
    v43 = 0;
    goto LABEL_60;
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v47;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
  if (!v11)
  {

    v51 = 0;
    goto LABEL_57;
  }
  v12 = 0;
  v51 = 0;
  v53 = 1;
  v13 = *(_QWORD *)v60;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v60 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v14);
      v16 = (void *)MEMORY[0x1D824DB90]();
      if (v12 < 0x20)
      {
        objc_msgSend(v55, "stringByAppendingPathComponent:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = 0;
        if ((objc_msgSend(v54, "fileExistsAtPath:isDirectory:", v19, &v58) & 1) != 0)
        {
          v20 = gLogger;
          if (v58)
          {
            if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v66 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
              v67 = 2112;
              v68 = v19;
              v21 = v20;
              v22 = "%s: Sub-directory found at location=%@ cannot be traversed (unsupported), SKIPPING";
              v23 = 22;
              goto LABEL_37;
            }
            goto LABEL_20;
          }
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v66 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
            v67 = 2112;
            v68 = v19;
            _os_log_debug_impl(&dword_1D3352000, v20, OS_LOG_TYPE_DEBUG, "%s: Copying %@", buf, 0x16u);
          }

          v25 = objc_alloc(MEMORY[0x1E0C99D50]);
          v57 = 0;
          v26 = (void *)objc_msgSend(v25, "initWithContentsOfFile:options:error:", v19, 0, &v57);
          v51 = v57;
          if (v26)
          {
            v56 = 0;
            v27 = objc_msgSend(v26, "length");
            v28 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v26, v27, &v56);
            if (v28)
            {
              if (v56)
              {
                CFArrayAppendValue(a4, v28);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "addObject:", v29);

                objc_msgSend(v49, "addObject:", v15);
                CFRelease(v28);
                v18 = 0;
                ++v12;
                goto LABEL_43;
              }
              v35 = gLogger;
              if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v66 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
                v67 = 2112;
                v68 = v19;
                v31 = v35;
                v32 = "%s: FAILED to get IOSID for %@";
LABEL_40:
                v33 = 22;
LABEL_41:
                _os_log_error_impl(&dword_1D3352000, v31, OS_LOG_TYPE_ERROR, v32, buf, v33);
              }
            }
            else
            {
              v34 = gLogger;
              if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v66 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
                v67 = 2112;
                v68 = v19;
                v31 = v34;
                v32 = "%s: FAILED to write data to IOSurface for %@";
                goto LABEL_40;
              }
            }
          }
          else
          {
            v30 = gLogger;
            if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v66 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
              v67 = 2112;
              v68 = v19;
              v69 = 2112;
              v70 = v51;
              v31 = v30;
              v32 = "%s: Could not extract data from %@ with error %@, copy FAILED";
              v33 = 32;
              goto LABEL_41;
            }
          }
          v53 = 0;
          v18 = 2;
LABEL_43:

        }
        else
        {
          v24 = gLogger;
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v66 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
            v67 = 2112;
            v68 = v15;
            v69 = 2112;
            v70 = v19;
            v21 = v24;
            v22 = "%s: file=%@ does not exists at location=%@, SKIPPING";
            v23 = 32;
LABEL_37:
            _os_log_error_impl(&dword_1D3352000, v21, OS_LOG_TYPE_ERROR, v22, buf, v23);
          }
LABEL_20:
          v18 = 3;
        }

        goto LABEL_22;
      }
      v17 = gLogger;
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v66 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
        v67 = 1024;
        LODWORD(v68) = 32;
        _os_log_error_impl(&dword_1D3352000, v17, OS_LOG_TYPE_ERROR, "%s: max file count reached %d, copy FAILED", buf, 0x12u);
      }
      v53 = 0;
      v18 = 2;
LABEL_22:
      objc_autoreleasePoolPop(v16);
      if (v18 != 3 && v18)
        goto LABEL_45;
      ++v14;
    }
    while (v11 != v14);
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
    v11 = v36;
  }
  while (v36);
LABEL_45:

  if ((v53 & 1) == 0)
  {
    Count = CFArrayGetCount(a4);
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a4, i);
        CFRelease(ValueAtIndex);
      }
    }
    goto LABEL_55;
  }
LABEL_57:
  v44 = (id)gLogger;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    -[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:].cold.2((uint64_t)buf, objc_msgSend(v49, "count"), v44);

  v43 = 1;
LABEL_60:

LABEL_61:
  return v43;
}

- (BOOL)copyAllModelFiles:(id)a3 dictionary:(__CFDictionary *)a4 ioSurfaceRefs:(__CFArray *)a5
{
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  void *v23;
  __IOSurface *v24;
  CFNumberRef v25;
  CFNumberRef v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  CFStringRef v32;
  CFNumberRef v33;
  CFStringRef v34;
  CFStringRef v35;
  CFNumberRef v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  const void *v41;
  CFStringRef v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  char v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  CFNumberRef v59;
  void *v60;
  uint64_t v61;
  void *v63;
  uint64_t v64;
  const __CFAllocator *allocator;
  void *v66;
  id v68;
  void *v69;
  char v72;
  id v73;
  void *v74;
  __CFString *v75;
  void *v76;
  int v77;
  id obj;
  uint64_t v79;
  int valuePtr;
  unsigned __int8 v81;
  uint8_t v82;
  _BYTE v83[15];
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  unsigned int v88;
  id v89;
  char v90;
  _BYTE buf[12];
  __int16 v92;
  _BYTE v93[18];
  uint8_t v94[4];
  int v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v73 = a3;
  if (!v73 || !a4 || !a5)
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
      -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:].cold.1();
    v72 = 0;
    goto LABEL_99;
  }
  objc_msgSend(v73, "modelURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
    -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:].cold.11();
  v90 = 0;
  v6 = &stru_1E9516758;
  objc_msgSend(v74, "fileExistsAtPath:isDirectory:", v76, &v90);
  if (v90)
  {
    v77 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v76, "componentsSeparatedByString:", CFSTR("/"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "lastObject");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "componentsSeparatedByString:", CFSTR("."));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "lastObject");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "isEqual:", CFSTR("hwx"));
  v51 = v50;
  if (v50)
  {
    v52 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
      -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:].cold.7(v52, v53, v54);
    v55 = 0;
    v75 = &stru_1E9516758;
  }
  else
  {
    v55 = objc_msgSend(v76, "containsString:", CFSTR("/System"));
    if (v55)
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
        -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:].cold.10();
      objc_msgSend(v46, "lastObject");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "componentsSeparatedByString:", CFSTR("."));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (void *)objc_msgSend(v57, "mutableCopy");
      objc_msgSend(v58, "removeLastObject");
      objc_msgSend(v58, "componentsJoinedByString:", CFSTR("."));
      v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
        -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:].cold.9();

    }
    else
    {
      v75 = &stru_1E9516758;
    }
    v60 = (void *)objc_msgSend(v46, "mutableCopy");
    objc_msgSend(v60, "removeLastObject");
    objc_msgSend(v60, "componentsJoinedByString:", CFSTR("/"));
    v61 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
      -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:].cold.8();

    v76 = (void *)v61;
  }

  if ((v51 & 1) != 0)
  {
LABEL_96:
    v72 = 0;
    goto LABEL_97;
  }
  if (v55)
  {
    v6 = v75;
    if (!-[__CFString length](v75, "length"))
    {
      if (!os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
      {
        v72 = 0;
        goto LABEL_98;
      }
      -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:].cold.2();
      goto LABEL_96;
    }
    v77 = 1;
  }
  else
  {
    v77 = 0;
    v6 = v75;
  }
LABEL_8:
  v75 = v6;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = 0;
  objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v76, &v89);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v89;

  if (v68 || !v69)
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
      -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:].cold.6();
LABEL_76:
    v72 = 0;
    goto LABEL_90;
  }
  v88 = 0;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v69;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
  if (!v8)
  {
    v72 = 1;
    goto LABEL_84;
  }
  v9 = *(_QWORD *)v85;
  allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v72 = 1;
  while (2)
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v85 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v10);
      v12 = (void *)MEMORY[0x1D824DB90]();
      if (v88 < 0x20)
      {
        if (v77 && !objc_msgSend(v11, "containsString:", v75))
        {
          v14 = 3;
          goto LABEL_35;
        }
        objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("."));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isEqual:", CFSTR("hwx")))
        {
          v17 = gLogger;
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
            -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:].cold.5(&v82, v83, v17);
          v14 = 3;
          goto LABEL_34;
        }
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), v76, v11);
        v81 = 0;
        if ((objc_msgSend(v74, "fileExistsAtPath:isDirectory:", v18, &v81) & 1) == 0)
        {
          v22 = gLogger;
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v11;
            v92 = 2112;
            *(_QWORD *)v93 = v18;
            _os_log_error_impl(&dword_1D3352000, v22, OS_LOG_TYPE_ERROR, "copyAllModelFiles file=%@ does not exist at location=%@, SKIPPING\n", buf, 0x16u);
          }
          goto LABEL_32;
        }
        v19 = v81;
        v20 = gLogger;
        v21 = os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG);
        if (v19)
        {
          if (v21)
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v18;
            _os_log_debug_impl(&dword_1D3352000, v20, OS_LOG_TYPE_DEBUG, "copyAllModelFiles Sub-directory traversal unsupported, SKIPPING %@", buf, 0xCu);
          }
LABEL_32:
          v14 = 3;
LABEL_33:

LABEL_34:
          goto LABEL_35;
        }
        if (v21)
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v11;
          v92 = 2112;
          *(_QWORD *)v93 = v76;
          *(_WORD *)&v93[8] = 2112;
          *(_QWORD *)&v93[10] = v18;
          _os_log_debug_impl(&dword_1D3352000, v20, OS_LOG_TYPE_DEBUG, "copyAllModelFiles file=%@ directoryPath=%@ fullFilePath=%@", buf, 0x20u);
        }
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v18);
        v66 = v23;
        if (!v23)
        {
          v27 = gLogger;
          if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v11;
            _os_log_debug_impl(&dword_1D3352000, v27, OS_LOG_TYPE_DEBUG, "copyAllModelFiles could not get data for file=%@, SKIPPING", buf, 0xCu);
          }
          v14 = 3;
          goto LABEL_61;
        }
        valuePtr = 0;
        v24 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v23, objc_msgSend(v23, "length"), &valuePtr);
        if (v24)
        {
          if (valuePtr)
          {
            CFArrayAppendValue(a5, v24);
            if (objc_msgSend(v16, "isEqual:", CFSTR("hwx")))
            {
              v25 = CFNumberCreate(allocator, kCFNumberSInt32Type, &valuePtr);
              CFDictionarySetValue(a4, CFSTR("ioSIDModelHWX"), v25);
              CFRelease(v25);
              CFDictionarySetValue(a4, CFSTR("hwxFileName"), v11);
              *(_QWORD *)buf = 0;
              *(_QWORD *)buf = objc_msgSend(v66, "length");
              v26 = CFNumberCreate(allocator, kCFNumberSInt64Type, buf);
              CFDictionarySetValue(a4, CFSTR("modelHWXLength"), v26);
              CFRelease(v26);
            }
            else
            {
              v64 = v88;
              v32 = CFStringCreateWithFormat(0, 0, CFSTR("fileIOSID%u"), v88);
              v33 = CFNumberCreate(allocator, kCFNumberSInt32Type, &valuePtr);
              CFDictionarySetValue(a4, v32, v33);
              CFRelease(v33);
              CFRelease(v32);
              v34 = CFStringCreateWithFormat(0, 0, CFSTR("fileName%u"), v64);
              CFDictionarySetValue(a4, v34, v11);
              CFRelease(v34);
              v35 = CFStringCreateWithFormat(0, 0, CFSTR("fileLength%u"), v64);
              v79 = 0;
              v79 = objc_msgSend(v66, "length");
              v36 = CFNumberCreate(allocator, kCFNumberSInt64Type, &v79);
              CFDictionarySetValue(a4, v35, v36);
              CFRelease(v36);
              CFRelease(v35);
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "attributesOfItemAtPath:error:", v18, 0);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "fileModificationDate");
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              if (v39)
              {
                v40 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v39, "timeIntervalSince1970");
                objc_msgSend(v40, "numberWithDouble:");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = (const void *)objc_msgSend(v63, "stringValue");
                v42 = CFStringCreateWithFormat(0, 0, CFSTR("FileLastModificationTimeStamp%u"), v64);
                CFDictionarySetValue(a4, v42, v41);
                CFRelease(v42);
                v43 = gLogger;
                if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  *(_QWORD *)&buf[4] = "-[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:]";
                  v92 = 1024;
                  *(_DWORD *)v93 = v64;
                  *(_WORD *)&v93[4] = 2112;
                  *(_QWORD *)&v93[6] = v41;
                  _os_log_debug_impl(&dword_1D3352000, v43, OS_LOG_TYPE_DEBUG, "%s fileCounter:%u lastModificationTimeStampString:%@", buf, 0x1Cu);
                }

              }
              else
              {
                v44 = gLogger;
                if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = "-[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:]";
                  v92 = 2112;
                  *(_QWORD *)v93 = v18;
                  _os_log_error_impl(&dword_1D3352000, v44, OS_LOG_TYPE_ERROR, "%s lastModificationDate not available for %@", buf, 0x16u);
                }
              }
              v88 = v64 + 1;

            }
            v14 = 0;
            goto LABEL_61;
          }
          v31 = gLogger;
          if (!os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
          {
LABEL_52:
            v72 = 0;
            v14 = 2;
LABEL_61:

            goto LABEL_33;
          }
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v11;
          v29 = v31;
          v30 = "copyAllModelFiles failed to IOSurfaceID for file=%@\n";
        }
        else
        {
          v28 = gLogger;
          if (!os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
            goto LABEL_52;
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v11;
          v29 = v28;
          v30 = "copyAllModelFiles failed to write file data to IOSurface for file=%@\n";
        }
        _os_log_error_impl(&dword_1D3352000, v29, OS_LOG_TYPE_ERROR, v30, buf, 0xCu);
        goto LABEL_52;
      }
      v13 = gLogger;
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
        -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:].cold.4(v94, &v95, v13);
      v14 = 1;
LABEL_35:
      objc_autoreleasePoolPop(v12);
      if (v14 != 3 && v14)
      {

        if (v14 == 2)
          goto LABEL_85;
        goto LABEL_76;
      }
      ++v10;
    }
    while (v8 != v10);
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
    v8 = v45;
    if (v45)
      continue;
    break;
  }
LABEL_84:

LABEL_85:
  if ((v72 & 1) != 0 && v88)
  {
    v59 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &v88);
    CFDictionarySetValue(a4, CFSTR("numModelFiles"), v59);
    CFRelease(v59);
    v72 = 1;
  }
  else if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
  {
    -[_ANEVirtualClient copyAllModelFiles:dictionary:ioSurfaceRefs:].cold.3();
  }
LABEL_90:

LABEL_97:
  v6 = v75;
LABEL_98:

LABEL_99:
  return v72 & 1;
}

+ (void)freeModelFileIOSurfaces:(__CFArray *)a3
{
  CFIndex Count;
  CFIndex v5;
  CFIndex i;
  const void *ValueAtIndex;

  Count = CFArrayGetCount(a3);
  if (Count >= 1)
  {
    v5 = Count;
    for (i = 0; i != v5; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
      CFRelease(ValueAtIndex);
    }
  }
}

- (void)copyModelMetaData:(id)a3 options:(id)a4 dictionary:(__CFDictionary *)a5 vmData:(VMData *)a6
{
  id v11;
  void *v12;
  uint64_t v13;
  CFAllocatorRef *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFAllocator *v18;
  CFNumberRef v19;
  CFNumberRef v20;
  void *v21;
  void *v22;
  NSObject *v23;
  const __CFAllocator *v24;
  CFNumberRef v25;
  CFNumberRef v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CFNumberRef v31;
  CFNumberRef v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  CFNumberRef v41;
  NSObject *v42;
  CFNumberRef v43;
  CFNumberRef v44;
  CFNumberRef v45;
  CFNumberRef v46;
  CFNumberRef v47;
  CFNumberRef v48;
  CFNumberRef v49;
  const char *aSelector;
  id v51;
  uint64_t v52;
  int valuePtr;
  _BYTE v54[24];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v51 = a4;
  if (a6)
  {
    objc_msgSend(v11, "key");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    aSelector = a2;
    v13 = objc_msgSend(v12, "length");

    v14 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
    if (v13)
    {
      v15 = (void *)MEMORY[0x1E0CB36F8];
      objc_msgSend(v11, "key");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "archivedDataWithRootObject:requiringSecureCoding:error:", v16, 1, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      a6->var6 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v17, objc_msgSend(v17, "length"), &a6->var17.var5);
      v18 = *v14;
      v19 = CFNumberCreate(*v14, kCFNumberSInt32Type, &a6->var17.var5);
      CFDictionarySetValue(a5, CFSTR("ioSIDKey"), v19);
      CFRelease(v19);
      a6->var17.var9 = objc_msgSend(v17, "length");
      v20 = CFNumberCreate(v18, kCFNumberSInt64Type, &a6->var17.var9);
      CFDictionarySetValue(a5, CFSTR("keyLength"), v20);
      CFRelease(v20);

    }
    v21 = (void *)MEMORY[0x1E0CB36F8];
    objc_msgSend(v11, "modelAttributes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "archivedDataWithRootObject:requiringSecureCoding:error:", v22, 1, 0);
    v23 = objc_claimAutoreleasedReturnValue();

    a6->var7 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v23, 0x100000, &a6->var17.var19);
    v24 = *v14;
    v25 = CFNumberCreate(v24, kCFNumberSInt32Type, &a6->var17.var19);
    CFDictionarySetValue(a5, CFSTR("ioSIDModelAttributes"), v25);
    CFRelease(v25);
    a6->var17.var20 = -[NSObject length](v23, "length");
    v26 = CFNumberCreate(v24, kCFNumberSInt64Type, &a6->var17.var20);
    CFDictionarySetValue(a5, CFSTR("modelAttributeLength"), v26);
    CFRelease(v26);
    v27 = (void *)MEMORY[0x1E0CB36F8];
    objc_msgSend(v11, "modelURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "path");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "archivedDataWithRootObject:requiringSecureCoding:error:", v29, 1, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    a6->var11 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v30, objc_msgSend(v30, "length"), &a6->var17.var52);
    v31 = CFNumberCreate(v24, kCFNumberSInt32Type, &a6->var17.var52);
    CFDictionarySetValue(a5, CFSTR("ioSIDModelInputPath"), v31);
    CFRelease(v31);
    a6->var17.var53 = objc_msgSend(v30, "length");
    v32 = CFNumberCreate(v24, kCFNumberSInt64Type, &a6->var17.var53);
    CFDictionarySetValue(a5, CFSTR("modelInputPathLength"), v32);
    CFRelease(v32);
    objc_msgSend(v11, "sourceURL");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v34 = (id)gLogger;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(aSelector);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sourceURL");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient copyModelMetaData:options:dictionary:vmData:].cold.3(v35, v36, (uint64_t)v54);
      }

      v37 = (void *)MEMORY[0x1E0CB36F8];
      objc_msgSend(v11, "sourceURL");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "path");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "archivedDataWithRootObject:requiringSecureCoding:error:", v39, 1, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      valuePtr = 0;
      a6->var20 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v40, objc_msgSend(v40, "length"), &valuePtr);
      v41 = CFNumberCreate(v24, kCFNumberSInt32Type, &valuePtr);
      CFDictionarySetValue(a5, CFSTR("ioSIDModelSourceURLPath"), v41);
      CFRelease(v41);
      v52 = objc_msgSend(v40, "length");
      v42 = (id)gLogger;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(aSelector);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient copyModelMetaData:options:dictionary:vmData:].cold.2();
      }

      v43 = CFNumberCreate(v24, kCFNumberSInt64Type, &v52);
      CFDictionarySetValue(a5, CFSTR("sourceURLPathLength"), v43);
      CFRelease(v43);

    }
    v52 = 0;
    v52 = objc_msgSend(v11, "identifierSource");
    v44 = CFNumberCreate(v24, kCFNumberSInt64Type, &v52);
    CFDictionarySetValue(a5, CFSTR("modelCacheURLIdentifierSource"), v44);
    CFRelease(v44);
    a6->var17.var14 = objc_msgSend(v11, "string_id");
    v45 = CFNumberCreate(v24, kCFNumberSInt64Type, &a6->var17.var14);
    CFDictionarySetValue(a5, CFSTR("string_id"), v45);
    CFRelease(v45);
    a6->var17.var15 = objc_msgSend(v11, "programHandle");
    v46 = CFNumberCreate(v24, kCFNumberSInt64Type, &a6->var17.var15);
    CFDictionarySetValue(a5, CFSTR("programHandle"), v46);
    CFRelease(v46);
    a6->var17.var16 = objc_msgSend(v11, "intermediateBufferHandle");
    v47 = CFNumberCreate(v24, kCFNumberSInt64Type, &a6->var17.var16);
    CFDictionarySetValue(a5, CFSTR("intermediateBufferHandle"), v47);
    CFRelease(v47);
    a6->var17.var17 = objc_msgSend(v11, "queueDepth");
    v48 = CFNumberCreate(v24, kCFNumberSInt8Type, &a6->var17.var17);
    CFDictionarySetValue(a5, CFSTR("queueDepth"), v48);
    CFRelease(v48);
    a6->var17.var21 = objc_msgSend(v11, "perfStatsMask");
    v49 = CFNumberCreate(v24, kCFNumberSInt32Type, &a6->var17.var21);
    CFDictionarySetValue(a5, CFSTR("perfStatsMask"), v49);
    CFRelease(v49);

  }
  else
  {
    v23 = (id)gLogger;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyModel:options:vmData:].cold.1();
    }
  }

}

- (id)readWeightFilename:(id)a3
{
  id v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v5);
  if (v6)
  {
    -[_ANEVirtualClient doJsonParsingMatchWeightName:](self, "doJsonParsingMatchWeightName:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (id)gLogger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient readWeightFilename:].cold.2();
      }

    }
    else
    {
      -[_ANEVirtualClient parallelDecompressedData:](self, "parallelDecompressedData:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient doJsonParsingMatchWeightName:](self, "doJsonParsingMatchWeightName:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v7 = (__CFString *)v11;
    }
  }
  else
  {
    v9 = (id)gLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient readWeightFilename:].cold.1();
    }

    v7 = CFSTR("model.espresso.weights");
  }

  return v7;
}

- (id)doJsonParsingMatchWeightName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7 = (id)gLogger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient doJsonParsingMatchWeightName:].cold.1();
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = (id)gLogger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient doJsonParsingMatchWeightName:].cold.4();
    }
    goto LABEL_12;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("storage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)gLogger;
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (!v6)
  {
    if (v8)
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient doJsonParsingMatchWeightName:].cold.2();
    }
LABEL_12:
    v6 = 0;
    goto LABEL_13;
  }
  if (v8)
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    -[_ANEVirtualClient doJsonParsingMatchWeightName:].cold.3();
  }
LABEL_13:

  return v6;
}

- (id)parallelDecompressedData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _BYTE *v7;
  _BYTE *v8;
  int v9;
  id v10;
  compression_algorithm v12;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  uint8_t *v16;
  size_t v17;
  id v18;
  size_t v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  size_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4
    || (unint64_t)objc_msgSend(v4, "length") < 0x1D
    || (v6 = objc_retainAutorelease(v5), v7 = (_BYTE *)objc_msgSend(v6, "bytes"), v8 = v7, *v7 != 112)
    || v7[1] != 98
    || v7[2] != 122)
  {
    v10 = 0;
    goto LABEL_11;
  }
  v9 = (char)v7[3];
  if (v9 > 119)
  {
    if (v9 == 122)
    {
      v12 = COMPRESSION_ZLIB;
    }
    else
    {
      if (v9 != 120)
        goto LABEL_17;
      v12 = COMPRESSION_LZMA;
    }
  }
  else
  {
    if (v9 != 52)
    {
      if (v9 == 101)
      {
LABEL_20:
        v12 = COMPRESSION_LZFSE;
        goto LABEL_21;
      }
LABEL_17:
      v13 = (id)gLogger;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient parallelDecompressedData:].cold.2();
      }

      goto LABEL_20;
    }
    v12 = COMPRESSION_LZ4;
  }
LABEL_21:
  v14 = bswap64(*(_QWORD *)(v8 + 12));
  if (v14 >= 0x80000001)
  {
    v15 = (id)gLogger;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient parallelDecompressedData:].cold.1();
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v14);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = (uint8_t *)objc_msgSend(v10, "mutableBytes");
  v17 = objc_msgSend(v10, "length");
  v18 = objc_retainAutorelease(v6);
  v19 = compression_decode_buffer(v16, v17, (const uint8_t *)(objc_msgSend(v18, "bytes") + 28), objc_msgSend(v18, "length") - 28, 0, v12);
  if (v19 != objc_msgSend(v10, "length"))
  {
    v20 = (id)gLogger;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412802;
      v23 = v21;
      v24 = 2048;
      v25 = v19;
      v26 = 2048;
      v27 = objc_msgSend(v10, "length");
      _os_log_error_impl(&dword_1D3352000, v20, OS_LOG_TYPE_ERROR, "%@: Mismatching decompression size %zu %zu ", (uint8_t *)&v22, 0x20u);

    }
  }
LABEL_11:

  return v10;
}

- (void)copyOptions:(id)a3 vmData:(VMData *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    a4->var17.var24 = objc_msgSend(v6, "length");
    a4->var4 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v7, objc_msgSend(v7, "length"), &a4->var17.var23);
    v6 = v7;
  }
  else
  {
    a4->var17.var23 = 0;
    a4->var17.var24 = 0;
  }

}

- (void)copyOptions:(id)a3 dictionary:(__CFDictionary *)a4 vmData:(VMData *)a5
{
  void *v8;
  void *v9;
  const __CFAllocator *v10;
  CFNumberRef v11;
  CFNumberRef v12;
  id v13;

  v13 = a3;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    a5->var17.var24 = objc_msgSend(v8, "length");
    a5->var4 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v9, objc_msgSend(v9, "length"), &a5->var17.var23);
    v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &a5->var17.var23);
    CFDictionarySetValue(a4, CFSTR("ioSIDOptions"), v11);
    CFRelease(v11);
  }
  else
  {
    a5->var17.var23 = 0;
    a5->var17.var24 = 0;
    v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  }
  v12 = CFNumberCreate(v10, kCFNumberSInt64Type, &a5->var17.var24);
  CFDictionarySetValue(a4, CFSTR("optionsLength"), v12);
  CFRelease(v12);

}

- (void)copyModelOptionFiles:(id)a3 options:(id)a4 vmData:(VMData *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", kANEFCompilerOptionsFilenameKey[0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v9, "modelURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@/%@"), v15, v12);

      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v16);
      v18 = (id)gLogger;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "length");
        -[_ANEVirtualClient copyModelOptionFiles:options:vmData:].cold.2();
      }

      a5->var17.var27 = objc_msgSend(v17, "length");
      a5->var3 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v17, objc_msgSend(v17, "length"), &a5->var17.var26);

    }
    else
    {
      a5->var17.var26 = 0;
      a5->var17.var27 = 0;
    }

  }
  else
  {
    v19 = (id)gLogger;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyModelOptionFiles:options:vmData:].cold.1();
    }

    a5->var17.var26 = 0;
  }

}

- (void)copyModelOptionFiles:(id)a3 options:(id)a4 dictionary:(__CFDictionary *)a5 vmData:(VMData *)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  CFNumberRef v21;
  NSObject *v22;
  CFNumberRef v23;

  v11 = a3;
  v12 = a4;
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", kANEFCompilerOptionsFilenameKey[0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v11, "modelURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("%@/%@"), v17, v14);

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v18);
      v20 = (id)gLogger;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "length");
        -[_ANEVirtualClient copyModelOptionFiles:options:vmData:].cold.2();
      }

      a6->var17.var27 = objc_msgSend(v19, "length");
      a6->var3 = -[_ANEVirtualClient copyToIOSurface:length:ioSID:](self, "copyToIOSurface:length:ioSID:", v19, objc_msgSend(v19, "length"), &a6->var17.var26);
      v21 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &a6->var17.var26);
      CFDictionarySetValue(a5, CFSTR("ioSIDCompilerOptionFile"), v21);
      CFRelease(v21);

    }
    else
    {
      a6->var17.var26 = 0;
      a6->var17.var27 = 0;
    }

  }
  else
  {
    v22 = (id)gLogger;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyModelOptionFiles:options:vmData:].cold.1();
    }

    a6->var17.var26 = 0;
    a6->var17.var27 = 0;
  }
  v23 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt64Type, &a6->var17.var27);
  CFDictionarySetValue(a5, CFSTR("compilerOptionFileLength"), v23);
  CFRelease(v23);

}

- (void)copyErrorValue:(VMData *)a3
{
  void *v5;
  void *v6;
  const __CFDictionary *v7;
  __IOSurface *v8;
  NSObject *v9;
  NSObject *v10;

  *(_OWORD *)&a3->var17.var46 = 0u;
  v5 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 256);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, *MEMORY[0x1E0CBBEE0], 0);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v8 = IOSurfaceCreate(v7);
  a3->var9 = v8;
  if (v8)
  {
    IOSurfaceLock(v8, 0, 0);
    a3->var17.var48 = IOSurfaceGetID(a3->var9);
    v9 = (id)gLogger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.3();
    }

    IOSurfaceUnlock(a3->var9, 0, 0);
  }
  else
  {
    v10 = (id)gLogger;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyErrorValue:].cold.1();
    }

  }
}

- (void)copyErrorValue:(__CFDictionary *)a3 vmData:(VMData *)a4
{
  void *v7;
  void *v8;
  const __CFDictionary *v9;
  __IOSurface *v10;
  CFNumberRef v11;
  NSObject *v12;
  NSObject *v13;

  *(_OWORD *)&a4->var17.var46 = 0u;
  v7 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 256);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, *MEMORY[0x1E0CBBEE0], 0);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v10 = IOSurfaceCreate(v9);
  a4->var9 = v10;
  if (v10)
  {
    IOSurfaceLock(v10, 0, 0);
    a4->var17.var48 = IOSurfaceGetID(a4->var9);
    v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &a4->var17.var48);
    CFDictionarySetValue(a3, CFSTR("ioSIDErrorValue"), v11);
    CFRelease(v11);
    v12 = (id)gLogger;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient doEvaluateWithModel:options:request:qos:completionEvent:error:].cold.3();
    }

    IOSurfaceUnlock(a4->var9, 0, 0);
  }
  else
  {
    v13 = (id)gLogger;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyErrorValue:].cold.1();
    }

  }
}

- (__IOSurface)copyToIOSurface:(id)a3 length:(unint64_t)a4 ioSID:(unsigned int *)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  __IOSurface *v12;
  __IOSurface *v13;
  void *BaseAddress;
  id v15;
  NSObject *v16;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  unsigned int v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unsigned int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!a5)
  {
    v11 = (id)gLogger;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyToIOSurface:length:ioSID:].cold.1();
    }
    goto LABEL_11;
  }
  if (!a4)
  {
    v11 = (id)gLogger;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyToIOSurface:length:ioSID:].cold.2();
    }
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  v9 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, *MEMORY[0x1E0CBBEE0], 0);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = IOSurfaceCreate((CFDictionaryRef)v11);
  v13 = v12;
  if (v12)
  {
    IOSurfaceLock(v12, 0, 0);
    BaseAddress = IOSurfaceGetBaseAddress(v13);
    v15 = objc_retainAutorelease(v8);
    memcpy(BaseAddress, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
    *a5 = IOSurfaceGetID(v13);
    v16 = (id)gLogger;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v15, "length");
      v21 = *a5;
      *(_DWORD *)buf = 138413058;
      v23 = v19;
      v24 = 2048;
      v25 = v20;
      v26 = 2048;
      v27 = a4;
      v28 = 1024;
      v29 = v21;
      _os_log_debug_impl(&dword_1D3352000, v16, OS_LOG_TYPE_DEBUG, "%@ ANEVirtualClient data in bytes %lu IOSurfaceLength %lu IOSID: %u\n", buf, 0x26u);

    }
    IOSurfaceUnlock(v13, 0, 0);
  }
  else
  {
    v18 = (id)gLogger;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyToIOSurface:length:ioSID:].cold.3();
    }

  }
LABEL_12:

  return v13;
}

- (__IOSurface)copyToIOSurface:(char *)a3 size:(unint64_t)a4 ioSID:(unsigned int *)a5
{
  void *v9;
  void *v10;
  NSObject *v11;
  __IOSurface *v12;
  __IOSurface *v13;
  void *BaseAddress;
  NSObject *v15;
  NSObject *v17;
  void *v18;
  unsigned int v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  unsigned int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a5)
  {
    v11 = (id)gLogger;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyToIOSurface:size:ioSID:].cold.1();
    }
    goto LABEL_11;
  }
  if (!a4)
  {
    v11 = (id)gLogger;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyToIOSurface:size:ioSID:].cold.2();
    }
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  v9 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, *MEMORY[0x1E0CBBEE0], 0);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = IOSurfaceCreate((CFDictionaryRef)v11);
  v13 = v12;
  if (v12)
  {
    IOSurfaceLock(v12, 0, 0);
    BaseAddress = IOSurfaceGetBaseAddress(v13);
    memcpy(BaseAddress, a3, a4);
    *a5 = IOSurfaceGetID(v13);
    v15 = (id)gLogger;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *a5;
      *(_DWORD *)buf = 138412802;
      v21 = v18;
      v22 = 2048;
      v23 = a4;
      v24 = 1024;
      v25 = v19;
      _os_log_debug_impl(&dword_1D3352000, v15, OS_LOG_TYPE_DEBUG, "%@ ANEVirtualClient data in bytes length %lu IOSID: %u\n", buf, 0x1Cu);

    }
    IOSurfaceUnlock(v13, 0, 0);
  }
  else
  {
    v17 = (id)gLogger;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient copyErrorValue:].cold.1();
    }

  }
LABEL_12:

  return v13;
}

+ (void)printIOSurfaceDataInBytes:(__IOSurface *)a3
{
  size_t AllocSize;
  unsigned __int8 *BaseAddress;
  unsigned __int8 *v7;
  uint64_t i;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    IOSurfaceLock(a3, 0, 0);
    AllocSize = IOSurfaceGetAllocSize(a3);
    BaseAddress = (unsigned __int8 *)IOSurfaceGetBaseAddress(a3);
    if (AllocSize)
    {
      v7 = BaseAddress;
      for (i = 0; i != AllocSize; ++i)
      {
        v9 = (id)gLogger;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v7[i];
          *(_DWORD *)buf = 138412802;
          v16 = v10;
          v17 = 2048;
          v18 = i;
          v19 = 1024;
          v20 = v11;
          _os_log_debug_impl(&dword_1D3352000, v9, OS_LOG_TYPE_DEBUG, "%@ ANEVirtualClient byte[%llu]=0x%x\n", buf, 0x1Cu);

        }
      }
    }
    IOSurfaceUnlock(a3, 0, 0);
  }
  else
  {
    v12 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
      +[_ANEVirtualClient printIOSurfaceDataInBytes:].cold.1(v12, v13, v14);
  }
}

- (id)getModelAttribute:(VMData *)a3
{
  void *BaseAddress;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v11;
  unint64_t var20;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  IOSurfaceLock(a3->var7, 0, 0);
  BaseAddress = IOSurfaceGetBaseAddress(a3->var7);
  if (BaseAddress)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", BaseAddress, a3->var18.var20);
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 1, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;

  }
  else
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
      -[_ANEVirtualClient getModelAttribute:].cold.2();
    if (!a3->var7 && os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
      -[_ANEVirtualClient getModelAttribute:].cold.1();
    v8 = 0;
    v7 = (void *)MEMORY[0x1E0C9AA70];
  }
  v9 = (id)gLogger;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    var20 = a3->var18.var20;
    *(_DWORD *)buf = 138412802;
    v15 = v11;
    v16 = 2048;
    v17 = var20;
    v18 = 2112;
    v19 = v7;
    _os_log_debug_impl(&dword_1D3352000, v9, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient Model Attribute Length %llu Model Attribute value %@\n", buf, 0x20u);

  }
  IOSurfaceUnlock(a3->var7, 0, 0);

  return v7;
}

- (BOOL)callIOUserClient:(unsigned int)a3 inParams:(VirtANEModel *)a4 outParams:(VirtANEModel *)a5
{
  uint64_t v6;
  VirtANEModel *outputStruct;
  mach_port_t v9;
  size_t v10;
  size_t v12;
  char v13;

  v6 = *(_QWORD *)&a3;
  if (a5)
    outputStruct = a5;
  else
    outputStruct = (VirtANEModel *)&v13;
  v12 = 2640;
  v9 = -[_ANEVirtualClient connect](self, "connect");
  if (a4)
    v10 = 2640;
  else
    v10 = 0;
  -[_ANEVirtualClient checkKernReturnValue:selector:outParams:](self, "checkKernReturnValue:selector:outParams:", IOConnectCallMethod(v9, v6, 0, 0, a4, v10, 0, 0, outputStruct, &v12), v6, outputStruct);
  return outputStruct->var1 != 0;
}

- (id)getObjectFromIOSurface:(__IOSurface *)a3 classType:(Class)a4 length:(unint64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    IOSurfaceLock(a3, 0, 0);
    if (!a5)
      LODWORD(a5) = IOSurfaceGetAllocSize(a3);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", IOSurfaceGetBaseAddress(a3), a5);
    IOSurfaceUnlock(a3, 0, 0);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0C99E60];
      v24[0] = objc_opt_class();
      v24[1] = objc_opt_class();
      v24[2] = objc_opt_class();
      v24[3] = objc_opt_class();
      v24[4] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = 0;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v8, &v23);
      v13 = v23;
      if (v13)
      {
        v14 = (id)gLogger;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualClient compileModel:options:qos:error:].cold.1();
        }

      }
      objc_msgSend(v12, "decodeObjectOfClasses:forKey:", v11, *MEMORY[0x1E0CB2CD0]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = gLogger;
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
        -[_ANEVirtualClient getObjectFromIOSurface:classType:length:].cold.2(v20, v21, v22);
      CFRelease(a3);
      v15 = 0;
    }

    return v15;
  }
  else
  {
    v16 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
      -[_ANEVirtualClient getObjectFromIOSurface:classType:length:].cold.1(v16, v17, v18);
    return 0;
  }
}

+ (unsigned)dictionaryGetUInt32ForKey:(__CFDictionary *)a3 key:(__CFString *)a4
{
  const __CFNumber *Value;
  int valuePtr;

  Value = (const __CFNumber *)CFDictionaryGetValue(a3, a4);
  valuePtr = 0;
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
    LODWORD(Value) = valuePtr;
  }
  return Value;
}

+ (unint64_t)dictionaryGetUInt64ForKey:(__CFDictionary *)a3 key:(__CFString *)a4
{
  unint64_t result;
  unint64_t valuePtr;

  result = (unint64_t)CFDictionaryGetValue(a3, a4);
  valuePtr = 0;
  if (result)
  {
    CFNumberGetValue((CFNumberRef)result, kCFNumberSInt64Type, &valuePtr);
    return valuePtr;
  }
  return result;
}

+ (int64_t)dictionaryGetInt64ForKey:(__CFDictionary *)a3 key:(__CFString *)a4
{
  int64_t result;
  int64_t valuePtr;

  result = (int64_t)CFDictionaryGetValue(a3, a4);
  valuePtr = 0;
  if (result)
  {
    CFNumberGetValue((CFNumberRef)result, kCFNumberSInt64Type, &valuePtr);
    return valuePtr;
  }
  return result;
}

+ (char)dictionaryGetInt8ForKey:(__CFDictionary *)a3 key:(__CFString *)a4
{
  const __CFNumber *Value;
  char valuePtr;

  Value = (const __CFNumber *)CFDictionaryGetValue(a3, a4);
  valuePtr = 0;
  if (!Value)
    return 0;
  CFNumberGetValue(Value, kCFNumberSInt8Type, &valuePtr);
  return valuePtr;
}

+ (id)dictionaryGetNSStringForKey:(__CFDictionary *)a3 key:(__CFString *)a4
{
  void *Value;
  void *v5;
  id v6;

  Value = (void *)CFDictionaryGetValue(a3, a4);
  v5 = Value;
  if (Value)
    v6 = Value;
  return v5;
}

+ (__CFDictionary)getCFDictionaryFromIOSurface:(__IOSurface *)a3 dataLength:(unint64_t)a4
{
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  __CFDictionary *v10;
  void *BaseAddress;
  const __CFAllocator *v12;
  const __CFData *v13;

  if (!a3)
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
      +[_ANEVirtualClient getCFDictionaryFromIOSurface:dataLength:].cold.1();
    return 0;
  }
  IOSurfaceLock(a3, 0, 0);
  v6 = operator new[](a4, MEMORY[0x1E0DE4E10]);
  v7 = v6;
  if (!a4 || v6)
  {
    BaseAddress = IOSurfaceGetBaseAddress(a3);
    if (BaseAddress)
    {
      memcpy(v7, BaseAddress, a4);
      IOSurfaceUnlock(a3, 0, 0);
      v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v13 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)v7, a4);
      if (!v13)
      {
        if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
          +[_ANEVirtualClient getCFDictionaryFromIOSurface:dataLength:].cold.4();
LABEL_22:
        v10 = 0;
        if (!v7)
          return v10;
        goto LABEL_18;
      }
      v10 = (__CFDictionary *)CFPropertyListCreateWithData(v12, v13, 0, 0, 0);
      CFRelease(v13);
      if (!v10)
      {
        if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
          +[_ANEVirtualClient getCFDictionaryFromIOSurface:dataLength:].cold.5();
        goto LABEL_22;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
        +[_ANEVirtualClient getCFDictionaryFromIOSurface:dataLength:].cold.3();
      IOSurfaceUnlock(a3, 0, 0);
      v10 = 0;
    }
    if (!v7)
      return v10;
LABEL_18:
    MEMORY[0x1D824D998](v7, 0x1000C4077774924);
    return v10;
  }
  v8 = gLogger;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
    +[_ANEVirtualClient getCFDictionaryFromIOSurface:dataLength:].cold.2(a4, v8, v9);
  return 0;
}

+ (void)copyDictionaryDataToStruct:(VirtANEModel *)a3 dictionary:(__CFDictionary *)a4
{
  NSObject *v7;

  if (a3 && a4)
  {
    bzero(a3, 0xA50uLL);
    a3->var1 = +[_ANEVirtualClient dictionaryGetInt64ForKey:key:](_ANEVirtualClient, "dictionaryGetInt64ForKey:key:", a4, CFSTR("success"));
    a3->var20 = +[_ANEVirtualClient dictionaryGetUInt64ForKey:key:](_ANEVirtualClient, "dictionaryGetUInt64ForKey:key:", a4, CFSTR("modelAttributeLength"));
    a3->var47 = +[_ANEVirtualClient dictionaryGetUInt64ForKey:key:](_ANEVirtualClient, "dictionaryGetUInt64ForKey:key:", a4, CFSTR("errorLength"));
    a3->var46 = +[_ANEVirtualClient dictionaryGetInt64ForKey:key:](_ANEVirtualClient, "dictionaryGetInt64ForKey:key:", a4, CFSTR("errorCode"));
    a3->var25 = +[_ANEVirtualClient dictionaryGetUInt64ForKey:key:](_ANEVirtualClient, "dictionaryGetUInt64ForKey:key:", a4, CFSTR("state"));
    a3->var15 = +[_ANEVirtualClient dictionaryGetUInt64ForKey:key:](_ANEVirtualClient, "dictionaryGetUInt64ForKey:key:", a4, CFSTR("programHandle"));
    a3->var16 = +[_ANEVirtualClient dictionaryGetUInt64ForKey:key:](_ANEVirtualClient, "dictionaryGetUInt64ForKey:key:", a4, CFSTR("intermediateBufferHandle"));
    a3->var17 = +[_ANEVirtualClient dictionaryGetInt8ForKey:key:](_ANEVirtualClient, "dictionaryGetInt8ForKey:key:", a4, CFSTR("queueDepth"));
    a3->var49 = +[_ANEVirtualClient dictionaryGetUInt64ForKey:key:](_ANEVirtualClient, "dictionaryGetUInt64ForKey:key:", a4, CFSTR("hwExecutionTime"));
    a3->var51 = +[_ANEVirtualClient dictionaryGetUInt64ForKey:key:](_ANEVirtualClient, "dictionaryGetUInt64ForKey:key:", a4, CFSTR("performanceStatsLength"));
  }
  else
  {
    v7 = (id)gLogger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      +[_ANEVirtualClient copyDictionaryDataToStruct:dictionary:].cold.1();
    }

  }
}

+ (BOOL)setCodeSigningIdentity:(__CFDictionary *)a3
{
  BOOL v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD v10[2];
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v13;

  task_info_outCnt = 8;
  if (task_info(*MEMORY[0x1E0C83DA0], 0xFu, task_info_out, &task_info_outCnt))
    return 0;
  v10[0] = *(_OWORD *)task_info_out;
  v10[1] = v13;
  +[_ANEModelToken codeSigningIDFor:processIdentifier:](_ANEModelToken, "codeSigningIDFor:processIdentifier:", v10, getpid());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5 != 0;
  v6 = gLogger;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
      +[_ANEVirtualClient setCodeSigningIdentity:].cold.1();
    CFDictionarySetValue(a3, CFSTR("csIdentity"), v5);
  }
  else if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
  {
    +[_ANEVirtualClient setCodeSigningIdentity:].cold.2(v6, v7, v8);
  }

  return v4;
}

- (__CFDictionary)callIOUserClientWithDictionary:(unsigned int)a3 inDictionary:(__CFDictionary *)a4 error:(id *)a5
{
  CFNumberRef v9;
  const __CFData *v10;
  char *v11;
  char *outputStruct;
  const UInt8 *BytePtr;
  size_t Length;
  kern_return_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  CFStringRef v22;
  NSObject *v23;
  CFStringRef errorString;
  size_t v26;
  unsigned int valuePtr;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  valuePtr = a3;
  if (!a4)
    return 0;
  v9 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(a4, CFSTR("command"), v9);
  CFRelease(v9);
  v10 = IOCFSerialize(a4, 0);
  if (!v10)
  {
    v17 = (id)gLogger;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient callIOUserClientWithDictionary:inDictionary:error:].cold.1();
    }

    return 0;
  }
  v26 = 4096;
  v11 = (char *)operator new[](0x1000uLL, MEMORY[0x1E0DE4E10]);
  if (!v11)
  {
    v18 = gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
      -[_ANEVirtualClient callIOUserClientWithDictionary:inDictionary:error:].cold.2(v18, v19, v20);
    return 0;
  }
  outputStruct = v11;
  BytePtr = CFDataGetBytePtr(v10);
  Length = CFDataGetLength(v10);
  v15 = IOConnectCallMethod(-[_ANEVirtualClient connect](self, "connect"), 0x10u, 0, 0, BytePtr, Length, 0, 0, outputStruct, &v26);
  CFRelease(v10);
  if (v15)
  {
    if (a5)
    {
      if (v15 == -536870160 || v15 == -536870911)
      {
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[_ANEErrors fileNotFoundErrorForMethod:](_ANEErrors, "fileNotFoundErrorForMethod:", v16);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      a5 = 0;
    }
  }
  else
  {
    v21 = *(_QWORD *)outputStruct;
    errorString = 0;
    a5 = (id *)IOCFUnserializeBinary(outputStruct + 8, v21, 0, 0, &errorString);
    v22 = errorString;
    if (a5 && errorString)
    {
      v23 = (id)gLogger;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient callIOUserClientWithDictionary:inDictionary:error:].cold.3();
      }

      v22 = errorString;
    }
    if (v22)
      CFRelease(v22);
  }
  MEMORY[0x1D824D998](outputStruct, 0x1000C4077774924);
  return (__CFDictionary *)a5;
}

- (void)checkKernReturnValue:(int)a3 selector:(unsigned int)a4 outParams:(VirtANEModel *)a5
{
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  unsigned int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a5)
      a5->var1 = 0;
    v8 = (id)gLogger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = v9;
      v12 = 1024;
      v13 = a4;
      v14 = 1024;
      v15 = a3;
      _os_log_error_impl(&dword_1D3352000, v8, OS_LOG_TYPE_ERROR, "%@: Failed to call method %d with error %d", (uint8_t *)&v10, 0x18u);

    }
  }
  else
  {
    v8 = (id)gLogger;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient checkKernReturnValue:selector:outParams:].cold.1();
    }
  }

}

- (BOOL)updateError:(VMData *)a3 error:(id *)a4
{
  BOOL v4;
  BOOL v5;
  void *BaseAddress;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t var46;
  void *v20;
  NSObject *v21;
  void *v22;
  int64_t v23;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  if (a4)
    v4 = a3->var18.var47 == 0;
  else
    v4 = 1;
  v5 = v4;
  if (!v4)
  {
    IOSurfaceLock(a3->var9, 0, 0);
    BaseAddress = IOSurfaceGetBaseAddress(a3->var9);
    if (BaseAddress)
    {
      v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", BaseAddress, a3->var18.var47);
      v10 = (void *)MEMORY[0x1E0C99E60];
      v30 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWithArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = 0;
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v25, &v27);
      v14 = v27;
      if (v14)
      {
        v15 = (id)gLogger;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          -[_ANEVirtualClient compileModel:options:qos:error:].cold.1();
        }

      }
      objc_msgSend(v13, "decodeObjectOfClasses:forKey:", v12, *MEMORY[0x1E0CB2CD0], v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      IOSurfaceUnlock(a3->var9, 0, 0);
      v17 = (void *)MEMORY[0x1E0CB35C8];
      +[_ANEStrings errorDomainVirtIO](_ANEStrings, "errorDomainVirtIO");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      var46 = a3->var18.var46;
      v28 = *MEMORY[0x1E0CB2D50];
      v29 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, var46, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = (id)gLogger;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        -[_ANEVirtualClient updateError:error:].cold.1();
      }

      v22 = (void *)MEMORY[0x1E0CB35C8];
      +[_ANEStrings errorDomainVirtIO](_ANEStrings, "errorDomainVirtIO");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = a3->var18.var46;
      v31 = *MEMORY[0x1E0CB2D50];
      v32[0] = CFSTR("Failed with NULL databaseAddress");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v26, v23, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v5;
}

- (id)updatePerformanceStats:(VMData *)a3
{
  void *v5;
  void *v6;
  NSObject *v7;

  if (!a3->var18.var51 && !a3->var18.var49)
    return 0;
  IOSurfaceLock(a3->var10, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", IOSurfaceGetBaseAddress(a3->var10), a3->var18.var51);
  IOSurfaceUnlock(a3->var10, 0, 0);
  if (v5)
  {
    +[_ANEPerformanceStats statsWithReconstructed:hardwareExecutionNS:](_ANEPerformanceStats, "statsWithReconstructed:hardwareExecutionNS:", v5, a3->var18.var49);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (id)gLogger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEVirtualClient updatePerformanceStats:].cold.1();
    }

    v6 = 0;
  }

  return v6;
}

- (void)releaseIOSurfaces:(VMData *)a3
{
  __IOSurface *var1;
  __IOSurface *var2;
  __IOSurface *var3;
  __IOSurface *var4;
  __IOSurface *var5;
  __IOSurface *var6;
  __IOSurface *var7;
  __IOSurface *var8;
  __IOSurface *var9;
  __IOSurface *var10;
  __IOSurface *var11;
  __IOSurface *var12;
  __IOSurface *var13;
  __IOSurface *var14;
  __IOSurface *var20;

  if (a3->var0)
  {
    CFRelease(a3->var0);
    a3->var0 = 0;
  }
  var1 = a3->var1;
  if (var1)
  {
    CFRelease(var1);
    a3->var1 = 0;
  }
  var2 = a3->var2;
  if (var2)
  {
    CFRelease(var2);
    a3->var2 = 0;
  }
  var3 = a3->var3;
  if (var3)
  {
    CFRelease(var3);
    a3->var3 = 0;
  }
  var4 = a3->var4;
  if (var4)
  {
    CFRelease(var4);
    a3->var4 = 0;
  }
  var5 = a3->var5;
  if (var5)
  {
    CFRelease(var5);
    a3->var5 = 0;
  }
  var6 = a3->var6;
  if (var6)
  {
    CFRelease(var6);
    a3->var6 = 0;
  }
  var7 = a3->var7;
  if (var7)
  {
    CFRelease(var7);
    a3->var7 = 0;
  }
  var8 = a3->var8;
  if (var8)
  {
    CFRelease(var8);
    a3->var8 = 0;
  }
  var9 = a3->var9;
  if (var9)
  {
    CFRelease(var9);
    a3->var9 = 0;
  }
  var10 = a3->var10;
  if (var10)
  {
    CFRelease(var10);
    a3->var10 = 0;
  }
  var11 = a3->var11;
  if (var11)
  {
    CFRelease(var11);
    a3->var11 = 0;
  }
  var12 = a3->var12;
  if (var12)
  {
    CFRelease(var12);
    a3->var12 = 0;
  }
  var13 = a3->var13;
  if (var13)
  {
    CFRelease(var13);
    a3->var13 = 0;
  }
  var14 = a3->var14;
  if (var14)
  {
    CFRelease(var14);
    a3->var14 = 0;
  }
  var20 = a3->var20;
  if (var20)
  {
    CFRelease(var20);
    a3->var20 = 0;
  }
}

- (unsigned)connect
{
  return self->_connect;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)initWithSingletonAccess
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(&dword_1D3352000, v0, v1, "ANEVirtualClient sysctl kern.hv_vmm_present returned false", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)compileModel:options:qos:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_5(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_7(&dword_1D3352000, "%@: ANEVirtualClient unarchive error %@ \n", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)compileModel:options:qos:error:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_5(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_7(&dword_1D3352000, "%@: ANEVirtualClient CompileModel succeeded for MODEL: %@ \n", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)compileModel:options:qos:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6_1(&dword_1D3352000, v0, v1, "ANEVirtualClient failed to call compileModel dictionary method", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)compileModel:options:qos:error:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_8(&dword_1D3352000, v3, v4, "%@: ANEVirtualClient compileModel dictionary call succeeded", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)compileModel:options:qos:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(&dword_1D3352000, v0, v1, "_ANEVirtualClient calling dictionary compileModel method", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)compileModel:options:qos:error:.cold.6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_8(&dword_1D3352000, v3, v4, "%@:ANEVirtualClient start\n", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)printStruct:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  int v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  int v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  int v61;
  __int16 v62;
  int v63;
  __int16 v64;
  int v65;
  __int16 v66;
  int v67;
  __int16 v68;
  int v69;
  __int16 v70;
  int v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  int v77;
  __int16 v78;
  int v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  int v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  int v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  int v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  int v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  int v99;
  __int16 v100;
  uint64_t v101;
  __int16 v102;
  int v103;
  __int16 v104;
  uint64_t v105;
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 8);
  v5[1] = *(_DWORD *)a1;
  v7 = v2;
  LODWORD(v2) = *(_DWORD *)(a1 + 20);
  v9 = *(_DWORD *)(a1 + 16);
  v11 = v2;
  v3 = *(_DWORD *)(a1 + 28);
  v13 = *(_DWORD *)(a1 + 24);
  v39 = *(_DWORD *)(a1 + 876);
  v43 = *(_QWORD *)(a1 + 888);
  v47 = *(_DWORD *)(a1 + 900);
  v49 = *(_QWORD *)(a1 + 904);
  v51 = *(_DWORD *)(a1 + 912);
  v53 = *(_QWORD *)(a1 + 920);
  v55 = *(_DWORD *)(a1 + 1952);
  v57 = *(_QWORD *)(a1 + 1960);
  v59 = *(_QWORD *)(a1 + 1968);
  v63 = *(_DWORD *)(a1 + 2492);
  v67 = *(_DWORD *)(a1 + 2500);
  v71 = *(_DWORD *)(a1 + 2508);
  v15 = v3;
  v73 = *(_QWORD *)(a1 + 2512);
  v75 = *(_QWORD *)(a1 + 2520);
  v79 = *(_DWORD *)(a1 + 2532);
  v81 = *(_QWORD *)(a1 + 2536);
  v83 = *(_DWORD *)(a1 + 2544);
  v85 = *(_QWORD *)(a1 + 2552);
  v87 = *(_DWORD *)(a1 + 2560);
  v89 = *(_QWORD *)(a1 + 2568);
  v91 = *(_DWORD *)(a1 + 2576);
  v93 = *(_QWORD *)(a1 + 2584);
  v95 = *(_DWORD *)(a1 + 2592);
  v97 = *(_QWORD *)(a1 + 2600);
  v99 = *(_DWORD *)(a1 + 2608);
  v101 = *(_QWORD *)(a1 + 2616);
  v103 = *(_DWORD *)(a1 + 2624);
  v105 = *(_QWORD *)(a1 + 2632);
  v4 = *(_QWORD *)(a1 + 40);
  v17 = *(_QWORD *)(a1 + 32);
  v19 = v4;
  v21 = *(_QWORD *)(a1 + 48);
  v23 = *(_QWORD *)(a1 + 832);
  v25 = *(_QWORD *)(a1 + 840);
  v27 = *(_QWORD *)(a1 + 848);
  v29 = *(char *)(a1 + 856);
  v31 = *(unsigned __int8 *)(a1 + 857);
  v33 = *(_DWORD *)(a1 + 860);
  v35 = *(_QWORD *)(a1 + 864);
  v37 = *(_DWORD *)(a1 + 872);
  v41 = *(_DWORD *)(a1 + 880);
  v45 = *(_DWORD *)(a1 + 896);
  v61 = *(_DWORD *)(a1 + 2488);
  v65 = *(_DWORD *)(a1 + 2496);
  v69 = *(_DWORD *)(a1 + 2504);
  v77 = *(_DWORD *)(a1 + 2528);
  v8 = 1024;
  v10 = 1024;
  v12 = 1024;
  v14 = 1024;
  v28 = 1024;
  v30 = 1024;
  v32 = 1024;
  v36 = 1024;
  v38 = 1024;
  v40 = 1024;
  v44 = 1024;
  v46 = 1024;
  v50 = 1024;
  v54 = 1024;
  v60 = 1024;
  v62 = 1024;
  v64 = 1024;
  v66 = 1024;
  v68 = 1024;
  v70 = 1024;
  v76 = 1024;
  v78 = 1024;
  v82 = 1024;
  v86 = 1024;
  v90 = 1024;
  v94 = 1024;
  v98 = 1024;
  v102 = 1024;
  v6 = 2048;
  v16 = 2048;
  v18 = 2048;
  v20 = 2048;
  v22 = 2048;
  v24 = 2048;
  v26 = 2048;
  v34 = 2048;
  v42 = 2048;
  v48 = 2048;
  v52 = 2048;
  v56 = 2048;
  v58 = 2048;
  v72 = 2048;
  v74 = 2048;
  v80 = 2048;
  v84 = 2048;
  v88 = 2048;
  v92 = 2048;
  v96 = 2048;
  v100 = 2048;
  v104 = 2048;
  v5[0] = 67121920;
  _os_log_debug_impl(&dword_1D3352000, a2, OS_LOG_TYPE_DEBUG, "ANEVirtualClient : virtANEModel->command=%u, virtANEModel->success=%lld, virtANEModel->ioSIDModelNet=%u, virtANEModel->ioSIDModelShape=%u, virtANEModel->ioSIDModelWeight=%u, virtANEModel->ioSIDKey=%u, virtANEModel->modelNetLength=%llu, virtANEModel->modelShapeLength=%llu, virtANEModel->modelWeightLength=%llu, virtANEModel->string_id=%llu, virtANEModel->programHandle=%llu, virtANEModel->intermediateBufferHandle=%llu, virtANEModel->queueDepth=%d, virtANEModel->flags=%d, virtANEModel->ioSIDModelAttributes=%u, virtANEModel->ModelAttributeLength=%llu, virtANEModel->perfStatsMask=%u, virtANEModel->qos=%u, virtANEModel->ioSIDOptions=%u, virtANEModel->optionsLength=%llu, virtANEModel->state=%u, virtANEModel->ioSIDCompilerOptionFile=%u, virtANEModel->compilerOptionFileLength=%llu, virtANEModel->ioSIDANECIRNetPlist=%u, virtANEModel->_ANECIRNetPlistLength=%llu, virtANEModel->ioSIDWeightsBuffer=%u, virtANEModel->procedureIndex=%llu, virtANEModel->transactionHandle=%llu, virtANEModel->perfStatsCount=%u, virtANEModel->inputArrayCount=%u, virtANEModel->inputIndexArrayCount=%u, virtANEModel->outputArrayCount=%u, virtANEModel->outputIndexArrayCount=%u, virtANEModel->ioSIDHashString=%u, virtANEModel->hashStringLength=%llu, virtANEModel->errorCode=%ld, virtANEModel->errorLength=%u, virtANEModel->ioSIDErrorValue=%u, virtANEModel->hwExecutionTime=%llu, virtANEModel->ioSIDPerformanceStats=%u, virtANEModel->performanceStatsLength=%llu, virtANEModel->ioSIDModelInputPath=%u, virtANEModel->modelInputPathLength=%llu, virtANEModel->ioSIDModelNetName=%u, virtANEModel->modelNetNameLength=%llu, virtANEModel->ioSIDModelShapeName=%u, virtANEModel->modelShapeNameLength=%llu, virtANEModel->ioSIDModelWeightName=%u, virtANEModel->modelWeightNameLength=%llu, virtANEModel->ioSIDModelHWX=%u, virtANEModel->modelHWXLength=%llu",
    (uint8_t *)v5,
    0x18Cu);
}

- (void)loadModel:options:qos:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_17(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_1_7(&dword_1D3352000, "%@: ANEVirtualClient LoadModel no success %lld.\n", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)loadModel:options:qos:error:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_5(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_7(&dword_1D3352000, "%@: ANEVirtualClient LoadModel success MODEL: %@ \n", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)loadModel:options:qos:error:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_5(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_7(&dword_1D3352000, "%@: ANEVirtualClient loadModel dictionary Model Cache URL from Host %@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)loadModel:(os_log_t)log options:qos:error:.cold.4(uint64_t a1, int *a2, os_log_t log)
{
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  _DWORD v17[2];
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(a1 + 648);
  v4 = *(_DWORD *)(a1 + 652);
  v5 = *(_DWORD *)(a1 + 656);
  v6 = *(_DWORD *)(a1 + 660);
  v7 = *(_QWORD *)(a1 + 1464);
  v8 = *(_QWORD *)(a1 + 1472);
  v9 = *(_QWORD *)(a1 + 1480);
  v10 = *(char *)(a1 + 1488);
  v11 = *(_DWORD *)(a1 + 1492);
  v12 = *(_QWORD *)(a1 + 1496);
  v13 = *(_DWORD *)(a1 + 1504);
  v14 = *a2;
  v15 = *(_DWORD *)(a1 + 1512);
  v16 = *(_DWORD *)(a1 + 3164);
  v17[0] = 67112448;
  v17[1] = v3;
  v18 = 1024;
  v19 = v4;
  v20 = 1024;
  v21 = v5;
  v22 = 1024;
  v23 = v6;
  v24 = 2048;
  v25 = v7;
  v26 = 2048;
  v27 = v8;
  v28 = 2048;
  v29 = v9;
  v30 = 1024;
  v31 = v10;
  v32 = 1024;
  v33 = v11;
  v34 = 2048;
  v35 = v12;
  v36 = 1024;
  v37 = v13;
  v38 = 1024;
  v39 = v14;
  v40 = 1024;
  v41 = v15;
  v42 = 1024;
  v43 = v16;
  _os_log_debug_impl(&dword_1D3352000, log, OS_LOG_TYPE_DEBUG, "ANEVirtualClient virtualANEModel.ioSIDModelNet=%u virtualANEModel.ioSIDModelShape=%u virtualANEModel.ioSIDModelWeight=%u virtualANEModel.ioSIDKey=%u virtualANEModel.string_id=%lld virtualANEModel.programHandle=%lld virtualANEModel.intermediateBufferHandle=%lld virtualANEModel.queueDepth=%d virtualANEModel.ioSIDModelAttributes=%u virtualANEModel.ModelAttributeLength=%llu virtualANEModel.perfStatsMask=%u virtualANEModel.qos=%u virtualANEModel.ioSIDOptions=%u virtualANEModel.ioSIDErrorValue=%u", (uint8_t *)v17, 0x66u);
}

- (void)loadModel:options:qos:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6_1(&dword_1D3352000, v0, v1, "ANEVirtualClient failed to call loadModel dictionary method", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)loadModel:options:qos:error:.cold.6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_8(&dword_1D3352000, v3, v4, "%@: ANEVirtualClient loadModel dictionary call succeeded", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)loadModel:options:qos:error:.cold.7()
{
  void *v0;
  int *v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  os_log_t v7;

  OUTLINED_FUNCTION_2_1();
  v2 = *v1;
  v3 = v1[1];
  *(_DWORD *)v4 = 138412802;
  *(_QWORD *)(v4 + 4) = v5;
  *(_WORD *)(v4 + 12) = 1024;
  *(_DWORD *)(v4 + 14) = v2;
  *(_WORD *)(v4 + 18) = 1024;
  *(_DWORD *)(v4 + 20) = v3;
  _os_log_debug_impl(&dword_1D3352000, v7, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient loadModel dictionary Allocating IOSurface for Model Cache URL %u %u", v6, 0x18u);

  OUTLINED_FUNCTION_2_0();
}

- (void)loadModel:options:qos:error:.cold.8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_5(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_7(&dword_1D3352000, "%@: modelCacheURLIdentifierCFStringRef : %@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)loadModel:options:qos:error:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(&dword_1D3352000, v0, v1, "_ANEVirtualClient calling dictionary loadModel method", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)loadModelNewInstance:options:modelInstParams:qos:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_6(&dword_1D3352000, v3, v4, "%@:ANEVirtualClient loadModelNewInstance API Not supported!!\n", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)loadModelNewInstance:options:modelInstParams:qos:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(&dword_1D3352000, v0, v1, "_ANEVirtualClient calling dictionary loadModelNewInstance method", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)unloadModel:(uint64_t)a3 options:(uint64_t)a4 qos:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1D3352000, a2, a3, "ANEVirtualClient unloadModel res=%u", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_10();
}

- (void)unloadModel:options:qos:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6_1(&dword_1D3352000, v0, v1, "ANEVirtualClient failed to call unloadModel dictionary method", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)unloadModel:options:qos:error:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_17(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_1_7(&dword_1D3352000, "%@: ANEVirtualClient unloadModel success=%lld", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)unloadModel:options:qos:error:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_8(&dword_1D3352000, v3, v4, "%@: ANEVirtualClient unloadModel dictionary call succeeded", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)unloadModel:options:qos:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(&dword_1D3352000, v0, v1, "_ANEVirtualClient calling dictionary unloadModel method", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)evaluateWithModel:options:request:qos:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_6(&dword_1D3352000, v3, v4, "%@: Empty dispatch queue\n", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)evaluateWithModel:options:request:qos:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6_1(&dword_1D3352000, v0, v1, "Failed to initialize output event listner", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)doEvaluateWithModel:options:request:qos:completionEvent:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_6(&dword_1D3352000, v3, v4, "%@: ANEVirtualClient _ioSPerformanceStats pointer null\n", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)doEvaluateWithModel:options:request:qos:completionEvent:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(&dword_1D3352000, v0, v1, "ANEVirtualClient Connect to driver for kAppleVirtIONeuralEngineDeviceUserClientEvaluateWithModel.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)doEvaluateWithModel:options:request:qos:completionEvent:error:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_20(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_1_1(&dword_1D3352000, "%@: ANEVirtualClient ioSurfaceRef ID=%u\n", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)doEvaluateWithModel:options:request:qos:completionEvent:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_3_0(&dword_1D3352000, v0, v1, "ANEVirtualClient Evaluate request5 ioSID: %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)doEvaluateWithModel:(void *)a1 options:request:qos:completionEvent:error:.cold.6(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_35(a1);
  OUTLINED_FUNCTION_34((uint64_t)v1, 5.778e-34);
  OUTLINED_FUNCTION_23(&dword_1D3352000, v2, v3, "%@: ANEVirtualClient queued the evaluate request. res=%d");

  OUTLINED_FUNCTION_22();
}

- (void)doEvaluateWithModel:(uint64_t)a3 options:request:qos:completionEvent:error:.cold.7(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_0(&dword_1D3352000, a2, a3, "ANEVirtualClient failed to call evaluateWithModel dictionary method with error:%@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_6();
}

- (void)doEvaluateWithModel:(void *)a1 options:(char)a2 request:qos:completionEvent:error:.cold.8(void *a1, char a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a1;
  OUTLINED_FUNCTION_36((uint64_t)v3, a2 & 1, 5.778e-34);
  OUTLINED_FUNCTION_23(&dword_1D3352000, v4, v5, "%@: ANEVirtualClient 2 reqQueued=%d\n");

  OUTLINED_FUNCTION_22();
}

- (void)doEvaluateWithModel:(void *)a1 options:request:qos:completionEvent:error:.cold.9(void *a1)
{
  NSObject *v1;
  uint8_t *v2;
  uint64_t *v3;
  id v4;

  v4 = OUTLINED_FUNCTION_28(a1);
  OUTLINED_FUNCTION_30((uint64_t)v4, *v3, 5.778e-34);
  OUTLINED_FUNCTION_13(&dword_1D3352000, v1, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient evaluateWithModel success=%lld", v2);

  OUTLINED_FUNCTION_22();
}

- (void)doEvaluateWithModel:(void *)a1 options:request:qos:completionEvent:error:.cold.10(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  id v3;

  v3 = OUTLINED_FUNCTION_35(a1);
  *(_DWORD *)v2 = 138412290;
  *(_QWORD *)(v2 + 4) = v3;
  _os_log_debug_impl(&dword_1D3352000, v1, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient evaluateWithModel dictionary call succeeded", (uint8_t *)v2, 0xCu);

  OUTLINED_FUNCTION_22();
}

- (void)doEvaluateWithModel:(void *)a1 options:request:qos:completionEvent:error:.cold.11(void *a1)
{
  NSObject *v1;
  uint8_t *v2;
  uint64_t *v3;
  id v4;

  v4 = OUTLINED_FUNCTION_28(a1);
  OUTLINED_FUNCTION_30((uint64_t)v4, *v3, 5.778e-34);
  OUTLINED_FUNCTION_13(&dword_1D3352000, v1, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient number of wait events=%llu\n", v2);

  OUTLINED_FUNCTION_22();
}

- (void)doEvaluateWithModel:(void *)a1 options:request:qos:completionEvent:error:.cold.12(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_35(a1);
  OUTLINED_FUNCTION_34((uint64_t)v1, 5.778e-34);
  OUTLINED_FUNCTION_23(&dword_1D3352000, v2, v3, "%@: ANEVirtualClient reqQueued=%d\n");

  OUTLINED_FUNCTION_22();
}

- (void)doEvaluateWithModel:options:request:qos:completionEvent:error:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6_1(&dword_1D3352000, v0, v1, "Invalid number of completion events", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)doEvaluateWithModel:(void *)a1 options:request:qos:completionEvent:error:.cold.14(void *a1)
{
  NSObject *v1;
  uint8_t *v2;
  uint64_t *v3;
  id v4;

  v4 = OUTLINED_FUNCTION_28(a1);
  OUTLINED_FUNCTION_30((uint64_t)v4, *v3, 5.778e-34);
  OUTLINED_FUNCTION_13(&dword_1D3352000, v1, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualClient number of signal shared events=%llu\n", v2);

  OUTLINED_FUNCTION_22();
}

- (void)doEvaluateWithModel:(void *)a1 options:request:qos:completionEvent:error:.cold.15(void *a1)
{
  int *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_28(a1);
  OUTLINED_FUNCTION_36((uint64_t)v2, *v1, 5.778e-34);
  OUTLINED_FUNCTION_23(&dword_1D3352000, v3, v4, "%@: ANEVirtualClient ioSurfaceRef ID=%u\n");

  OUTLINED_FUNCTION_22();
}

- (void)doEvaluateWithModel:(uint64_t)a3 options:(uint64_t)a4 request:(uint64_t)a5 qos:(uint64_t)a6 completionEvent:(uint64_t)a7 error:(uint64_t)a8 .cold.16(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1D3352000, a2, a3, "ANEVirtualClient Evaluate request5 ioSID: %u", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_10();
}

- (void)doEvaluateWithModel:options:request:qos:completionEvent:error:.cold.17()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(&dword_1D3352000, v0, v1, "_ANEVirtualClient calling dictionary doEvaluateWithModel method", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)doEvaluateWithModel:options:request:qos:completionEvent:error:.cold.18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_3_0(&dword_1D3352000, v0, v1, "ANEVirtualClient evaluateWithModel qos: %d\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)doEvaluateWithModel:options:request:qos:completionEvent:error:.cold.19()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0(&dword_1D3352000, v0, v1, "ANEVirtualClient evaluateWithModel request: %@\n", v2);
  OUTLINED_FUNCTION_6();
}

- (void)doEvaluateWithModel:options:request:qos:completionEvent:error:.cold.20()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0(&dword_1D3352000, v0, v1, "ANEVirtualClient evaluateWithmodel options: %@\n", v2);
  OUTLINED_FUNCTION_6();
}

- (void)doEvaluateWithModel:options:request:qos:completionEvent:error:.cold.21()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0(&dword_1D3352000, v0, v1, "ANEVirtualClient evaluateWithModel model: %@\n", v2);
  OUTLINED_FUNCTION_6();
}

- (void)compiledModelExistsFor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6_1(&dword_1D3352000, v0, v1, "ANEVirtualClient failed to call compiledModelExistsFor dictionary method", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)compiledModelExistsFor:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_17(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_1_7(&dword_1D3352000, "%@: ANEVirtualClient compiledModelExistsFor success=%lld", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)compiledModelExistsFor:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_8(&dword_1D3352000, v3, v4, "%@: ANEVirtualClient compiledModelExistsFor dictionary call succeeded", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)purgeCompiledModel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6_1(&dword_1D3352000, v0, v1, "ANEVirtualClient failed to call purgeCompiledModel dictionary method", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)purgeCompiledModel:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_8(&dword_1D3352000, v3, v4, "%@: ANEVirtualClient purgeCompiledModel dictionary call succeeded", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)compiledModelExistsMatchingHash:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6_1(&dword_1D3352000, v0, v1, "ANEVirtualClient failed to call compiledModelExistsMatchingHash dictionary method", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)compiledModelExistsMatchingHash:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_17(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_1_7(&dword_1D3352000, "%@: ANEVirtualClient compiledModelExistsMatchingHash dictionary success=%lld", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)compiledModelExistsMatchingHash:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_8(&dword_1D3352000, v3, v4, "%@:ANEVirtualClient compiledModelExistsMatchingHash start\n", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)purgeCompiledModelMatchingHash:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6_1(&dword_1D3352000, v0, v1, "ANEVirtualClient failed to call purgeCompiledModelMatchingHash dictionary method", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)purgeCompiledModelMatchingHash:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(&dword_1D3352000, v0, v1, "ANEVirtualClient successfully called purgeCompiledModelMatchingHash dictionary method", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)echo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6_1(&dword_1D3352000, v0, v1, "ANEVirtualClient failed to call echo dictionary method", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)echo:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_17(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_1_7(&dword_1D3352000, "%@: ANEVirtualClient echo dictionary success=%lld", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)getDeviceInfo
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint8_t *v6;
  NSObject *v7;

  OUTLINED_FUNCTION_5();
  v3 = OUTLINED_FUNCTION_33(v1, v2, 5.7781e-34);
  OUTLINED_FUNCTION_38(v3, v4, v5);
  OUTLINED_FUNCTION_31(&dword_1D3352000, "%@: Failed to call method %d with error %d", v6, v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)validateNetworkCreate:uuid:function:directoryPath:scratchPadPath:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_6(&dword_1D3352000, v3, v4, "%@: ANEVirtualClient validateNetworkCreate failed to create outValidationDictIOSurfaceRef", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)validateNetworkCreate:uuid:function:directoryPath:scratchPadPath:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_37(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_32(&dword_1D3352000, "%@: ANEVirtualClient validateNetworkCreate failed to call IOConnectCallMethod with kernResult : 0x%x", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)validateNetworkCreate:(uint64_t)a3 uuid:function:directoryPath:scratchPadPath:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[_ANEVirtualClient validateNetworkCreate:uuid:function:directoryPath:scratchPadPath:]";
  OUTLINED_FUNCTION_0_0(&dword_1D3352000, a1, a3, "%s: FAILED copying files", (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

- (void)exchangeBuildVersionInfo
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_6(&dword_1D3352000, v3, v4, "%@: ERROR productName is emptyString or nil", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)mapIOSurfacesWithModel:request:cacheInference:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0(&dword_1D3352000, v0, v1, "ANEVirtualClient mapIOSurfacesWithModel: %@\n", v2);
  OUTLINED_FUNCTION_6();
}

- (void)doMapIOSurfacesWithModel:request:cacheInference:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_6(&dword_1D3352000, v3, v4, "%@: ANEVirtualClient mapIOSurfacesWithModel _ioSPerformanceStats pointer null\n", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)doMapIOSurfacesWithModel:request:cacheInference:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(&dword_1D3352000, v0, v1, "ANEVirtualClient Connect to driver for kAppleVirtIONeuralEngineDeviceUserClientMapIOSurfacesWithModel.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)doMapIOSurfacesWithModel:request:cacheInference:error:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_20(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_1_1(&dword_1D3352000, "%@: ANEVirtualClient mapIOSurfacesWithModel ioSurfaceRef ID=%u\n", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)doMapIOSurfacesWithModel:request:cacheInference:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_3_0(&dword_1D3352000, v0, v1, "ANEVirtualClient mapIOSurfacesWithModel request5 ioSID: %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)doMapIOSurfacesWithModel:(uint64_t)a3 request:(uint64_t)a4 cacheInference:(uint64_t)a5 error:(uint64_t)a6 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1D3352000, a2, a3, "ANEVirtualClient doMapIOSurfacesWithModel: %d\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_10();
}

- (void)doMapIOSurfacesWithModel:request:cacheInference:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0(&dword_1D3352000, v0, v1, "ANEVirtualClient doMapIOSurfacesWithModel: %@\n", v2);
  OUTLINED_FUNCTION_6();
}

- (void)copyModel:options:vmData:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_6(&dword_1D3352000, v3, v4, "%@: VirtualANEModel struct empty.", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)copyModel:options:vmData:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_8(&dword_1D3352000, v3, v4, "%@: ANEVirtualClient: weightname contained symlink", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)copyModel:options:vmData:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_5(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_7(&dword_1D3352000, "%@: ANEVirtualClient: weightname=%@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)copyModel:options:vmData:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_43(v1, v2, 5.778e-34);
  *(_QWORD *)(v3 + 14) = &stru_1E9516758;
  OUTLINED_FUNCTION_4_2(&dword_1D3352000, v4, (uint64_t)v4, "%@: ANEVirtualClient: fileHWX=%@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)copyModel:options:vmData:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_43(v1, v2, 5.778e-34);
  *(_QWORD *)(v3 + 14) = &stru_1E9516758;
  OUTLINED_FUNCTION_4_2(&dword_1D3352000, v4, (uint64_t)v4, "%@: ANEVirtualClient: var fileHWX=%@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)copyModel:options:vmData:.cold.6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_5(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_7(&dword_1D3352000, "%@: ANEVirtualClient: hwx new filePath=%@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)copyFilesInDirectoryToIOSurfaces:(uint64_t)a3 ioSurfaceRefs:ioSurfaceSizes:fileNames:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
  OUTLINED_FUNCTION_0_0(&dword_1D3352000, a1, a3, "%s: passed in directory path is not a directory, copy FAILED", (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

- (void)copyFilesInDirectoryToIOSurfaces:(NSObject *)a3 ioSurfaceRefs:ioSurfaceSizes:fileNames:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315394;
  *(_QWORD *)(a1 + 4) = "-[_ANEVirtualClient copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:]";
  *(_WORD *)(a1 + 12) = 2048;
  *(_QWORD *)(a1 + 14) = a2;
  OUTLINED_FUNCTION_4_2(&dword_1D3352000, a3, (uint64_t)a3, "%s: Extracted %lu files to IOSurfaces", (uint8_t *)a1);
}

- (void)copyFilesInDirectoryToIOSurfaces:ioSurfaceRefs:ioSurfaceSizes:fileNames:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_0_4(&dword_1D3352000, v0, v1, "%s: could not read directory, copy FAILED with error : %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_6();
}

- (void)copyAllModelFiles:dictionary:ioSurfaceRefs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6_1(&dword_1D3352000, v0, v1, "copyAllModelFiles invalid input arguments (one or more are nil)\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)copyAllModelFiles:dictionary:ioSurfaceRefs:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6_1(&dword_1D3352000, v0, v1, "copyAllModelFiles could not get fileNamePrefix\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)copyAllModelFiles:dictionary:ioSurfaceRefs:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6_1(&dword_1D3352000, v0, v1, "copyAllModelFiles ERROR: No model files to copy\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)copyAllModelFiles:(uint8_t *)a1 dictionary:(_DWORD *)a2 ioSurfaceRefs:(NSObject *)a3 .cold.4(uint8_t *a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 32;
  OUTLINED_FUNCTION_41(&dword_1D3352000, a3, (uint64_t)a3, "copyAllModelFiles ERROR : Max file count reached %d", a1);
}

- (void)copyAllModelFiles:(uint8_t *)a1 dictionary:(_BYTE *)a2 ioSurfaceRefs:(NSObject *)a3 .cold.5(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_16(&dword_1D3352000, a3, (uint64_t)a3, "copyAllModelFiles No precompiled binary support, skipping HWX file", a1);
}

- (void)copyAllModelFiles:dictionary:ioSurfaceRefs:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3352000, v0, v1, "copyAllModelFiles ERROR : could not read directory, %@", v2);
  OUTLINED_FUNCTION_6();
}

- (void)copyAllModelFiles:(NSObject *)a1 dictionary:(uint64_t)a2 ioSurfaceRefs:(uint64_t)a3 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = 0;
  OUTLINED_FUNCTION_41(&dword_1D3352000, a1, a3, "copyAllModelFiles ERROR : hwxTransferSupported=%d and only HWX file passed\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_10();
}

- (void)copyAllModelFiles:dictionary:ioSurfaceRefs:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0(&dword_1D3352000, v0, v1, "copyAllModelFiles new directoryPath=%@\n", v2);
  OUTLINED_FUNCTION_6();
}

- (void)copyAllModelFiles:dictionary:ioSurfaceRefs:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0(&dword_1D3352000, v0, v1, "copyAllModelFiles fileNamePrefix=%@\n", v2);
  OUTLINED_FUNCTION_6();
}

- (void)copyAllModelFiles:dictionary:ioSurfaceRefs:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(&dword_1D3352000, v0, v1, "copyAllModelFiles dealing with /System path\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)copyAllModelFiles:dictionary:ioSurfaceRefs:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0(&dword_1D3352000, v0, v1, "copyAllModelFiles directoryPath=%@\n", v2);
  OUTLINED_FUNCTION_6();
}

- (void)copyModelMetaData:options:dictionary:vmData:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_17(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_1_7(&dword_1D3352000, "%@: sourceURLLength=%lld\n", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)copyModelMetaData:(uint64_t)a3 options:dictionary:vmData:.cold.3(void *a1, void *a2, uint64_t a3)
{
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_2_5((uint64_t)a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_1_7(&dword_1D3352000, "%@: model.sourceURL=%@\n", v5, v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)readWeightFilename:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_5(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_7(&dword_1D3352000, "%@: ANEVirtualClient Cannot read netfilename=%@\n", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)readWeightFilename:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_8(&dword_1D3352000, v3, v4, "%@: ANEVirtualClient weightfilename is Not empty\n", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)doJsonParsingMatchWeightName:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_8(&dword_1D3352000, v3, v4, "%@: ANEVirtualClient could not parse Json.\n", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)doJsonParsingMatchWeightName:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_8(&dword_1D3352000, v3, v4, "%@: ANEVirtualClient weightfilename does not exists.\n", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)doJsonParsingMatchWeightName:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_5(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_7(&dword_1D3352000, "%@: ANEVirtualClient weightfilename=%@\n", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)doJsonParsingMatchWeightName:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_8(&dword_1D3352000, v3, v4, "%@: ANEVirtualClient no match for weightfilename.\n", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)parallelDecompressedData:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_27(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_0_4(&dword_1D3352000, v6, v4, "%@: Block size too big %lld ", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)parallelDecompressedData:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_20(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_32(&dword_1D3352000, "%@: Invalid decompression algorithm %c ", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)copyModelOptionFiles:options:vmData:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_8(&dword_1D3352000, v3, v4, "%@: ANEVirtualClient options empty\n", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)copyModelOptionFiles:options:vmData:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_27(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_7(&dword_1D3352000, "%@: FILEData wrote %lu\n", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)copyErrorValue:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_6(&dword_1D3352000, v3, v4, "%@: ANEVirtualClient ioSurfaceRef pointer null\n", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)copyToIOSurface:length:ioSID:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_6(&dword_1D3352000, v3, v4, "%@: ERROR passed in ioSID pointer is NULL", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)copyToIOSurface:length:ioSID:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_6(&dword_1D3352000, v3, v4, "%@: ERROR passed in length=0", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)copyToIOSurface:length:ioSID:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_27(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_0_4(&dword_1D3352000, v6, v4, "%@: FAILED to create IOSurface with length=%lu", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)copyToIOSurface:size:ioSID:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_6(&dword_1D3352000, v3, v4, "%@: ANEVirtualClient ioSID pointer null\n", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)copyToIOSurface:size:ioSID:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_8(&dword_1D3352000, v3, v4, "%@: ANEVirtualClient length==0\n", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)printIOSurfaceDataInBytes:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "+[_ANEVirtualClient printIOSurfaceDataInBytes:]";
  OUTLINED_FUNCTION_0_0(&dword_1D3352000, a1, a3, "%s:ANEVirtualClient cannot getIOSurfaceObject", (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

- (void)getModelAttribute:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6_1(&dword_1D3352000, v0, v1, "getModelAttribute: IOSATTribute null", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)getModelAttribute:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6_1(&dword_1D3352000, v0, v1, "getModelAttribute: DataBaseAddress null", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)getObjectFromIOSurface:(NSObject *)a1 classType:(uint64_t)a2 length:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[_ANEVirtualClient getObjectFromIOSurface:classType:length:]";
  OUTLINED_FUNCTION_0_0(&dword_1D3352000, a1, a3, "%s:ANEVirtualClient cannot getIOSurfaceObject", (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

- (void)getObjectFromIOSurface:(NSObject *)a1 classType:(uint64_t)a2 length:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[_ANEVirtualClient getObjectFromIOSurface:classType:length:]";
  OUTLINED_FUNCTION_0_0(&dword_1D3352000, a1, a3, "%s:ANEVirtualClient cannot have nil data.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

+ (void)getCFDictionaryFromIOSurface:dataLength:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6_1(&dword_1D3352000, v0, v1, "_ANEVirtualClient getCFDictionaryFromIOSurface : ioSurfaceRef null", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

+ (void)getCFDictionaryFromIOSurface:(uint64_t)a3 dataLength:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = "+[_ANEVirtualClient getCFDictionaryFromIOSurface:dataLength:]";
  v5 = 2048;
  v6 = a1;
  OUTLINED_FUNCTION_0_4(&dword_1D3352000, a2, a3, "%s : memory allocation failed, size requested:%llu", (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

+ (void)getCFDictionaryFromIOSurface:dataLength:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6_1(&dword_1D3352000, v0, v1, "_ANEVirtualClient getCFDictionaryFromIOSurface : DataBaseAddress null", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

+ (void)getCFDictionaryFromIOSurface:dataLength:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6_1(&dword_1D3352000, v0, v1, "_ANEVirtualClient getCFDictionaryFromIOSurface : couldn't create CFDataRef object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

+ (void)getCFDictionaryFromIOSurface:dataLength:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6_1(&dword_1D3352000, v0, v1, "_ANEVirtualClient getCFDictionaryFromIOSurface : Couldn't create CFDictionaryRef object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

+ (void)copyDictionaryDataToStruct:dictionary:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_6(&dword_1D3352000, v3, v4, "%@: copyDictionaryDataToStruct input data NULL", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)setCodeSigningIdentity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_4_2(&dword_1D3352000, v0, v1, "%s: csIdentity:%@", (uint8_t *)v2);
  OUTLINED_FUNCTION_6();
}

+ (void)setCodeSigningIdentity:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "+[_ANEVirtualClient setCodeSigningIdentity:]";
  OUTLINED_FUNCTION_0_0(&dword_1D3352000, a1, a3, "%s: nil csIdentity", (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

- (void)callIOUserClientWithDictionary:inDictionary:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_20(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_32(&dword_1D3352000, "%@:ANEVirtualClient FAILED to serialize input dictionary for command=%d", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)callIOUserClientWithDictionary:(NSObject *)a1 inDictionary:(uint64_t)a2 error:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = "-[_ANEVirtualClient callIOUserClientWithDictionary:inDictionary:error:]";
  v5 = 2048;
  v6 = 4096;
  OUTLINED_FUNCTION_0_4(&dword_1D3352000, a1, a3, "%s : memory allocation failed, size requested:%zu", (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

- (void)callIOUserClientWithDictionary:inDictionary:error:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_21();
  *(_DWORD *)v1 = 138412546;
  *(_QWORD *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2112;
  *(_QWORD *)(v1 + 14) = v3;
  OUTLINED_FUNCTION_0_4(&dword_1D3352000, v5, v1, "%@:ANEVirtualClient FAILED to unserialize dictionary=%@", v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)checkKernReturnValue:selector:outParams:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_37(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_1(&dword_1D3352000, "%@: ANEVirtualClient Successfully called method %d.\n", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)updateError:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_6(&dword_1D3352000, v3, v4, "%@: Failed with NULL databaseAddress", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)updatePerformanceStats:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_17(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_0_4(&dword_1D3352000, v6, v4, "%@: No Data in performanceStats with length=%llu", v5);

  OUTLINED_FUNCTION_2_0();
}

@end
