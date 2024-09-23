@implementation SCNMTLLibraryManager

- (id)shaderCompilationGroup
{
  return self->_shaderCompilationGroup;
}

- (id)commonProfileCacheLibrary
{
  return self->_commonProfileCacheLibrary;
}

+ (id)hashCodeForSource:(id)a3 macros:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char *v14;
  uint8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  uint8x16_t v19;
  int8x16_t v20;
  int8x16_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CC_SHA256_CTX c;
  _QWORD data[8];
  char v29;
  unsigned __int8 md[32];
  _BYTE v31[128];
  uint64_t v32;
  int8x16x2_t v33;

  v32 = *MEMORY[0x1E0C80C00];
  CC_SHA256_Init(&c);
  CFStringUpdateHash((uint64_t)a3);
  v6 = (void *)objc_msgSend((id)objc_msgSend(a4, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v12 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", v11);
        CFStringUpdateHash(v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          CFStringUpdateHash((uint64_t)v12);
        }
        else
        {
          data[0] = 0;
          data[0] = objc_msgSend(v12, "hash");
          CC_SHA256_Update(&c, data, 8u);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v8);
  }
  CC_SHA256_Final(md, &c);
  v13 = 0;
  v14 = (char *)data;
  v15.i64[0] = 0xA0A0A0A0A0A0A0A0;
  v15.i64[1] = 0xA0A0A0A0A0A0A0A0;
  v16.i64[0] = 0x3737373737373737;
  v16.i64[1] = 0x3737373737373737;
  v17.i64[0] = 0x3030303030303030;
  v17.i64[1] = 0x3030303030303030;
  v18.i64[0] = 0xF0F0F0F0F0F0F0FLL;
  v18.i64[1] = 0xF0F0F0F0F0F0F0FLL;
  v19.i64[0] = 0xA0A0A0A0A0A0A0ALL;
  v19.i64[1] = 0xA0A0A0A0A0A0A0ALL;
  do
  {
    v20 = *(int8x16_t *)&md[v13];
    v33.val[0] = (int8x16_t)vsraq_n_u8((uint8x16_t)vbslq_s8((int8x16_t)vcgtq_u8(v15, (uint8x16_t)v20), v17, v16), (uint8x16_t)v20, 4uLL);
    v21 = vandq_s8(v20, v18);
    v33.val[1] = vaddq_s8(vbslq_s8((int8x16_t)vcgtq_u8(v19, (uint8x16_t)v21), v17, v16), v21);
    vst2q_s8(v14, v33);
    v14 += 32;
    v13 += 16;
  }
  while (v13 != 32);
  v29 = 0;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", data, 1);
}

- (id)deviceQueue
{
  return self->_deviceQueue;
}

- (void)libraryForProgramDesc:(id *)a3 completionHandler:(id)a4
{
  uint64_t TypeID;
  __C3DFXMetalProgram *var0;
  uint64_t LibraryProviderBlock;
  MTLLibrary *v10;
  uint64_t SourceCode;
  uint64_t v12;
  uint64_t PreprocessorsMacros;
  id v14;
  MTLLibrary *Value;
  void (*v16)(id, MTLLibrary *, _QWORD);
  id v17;
  MTLLibrary *commonProfileCacheLibrary;
  NSObject *v19;
  _BOOL4 v20;
  NSUInteger v21;
  const void *v22;
  NSObject *v23;
  const void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t OverrideMaterial;
  unint64_t v28;
  unsigned int LanguageVersion;
  unint64_t v30;
  id v31;
  uint64_t v32;
  $A49D611864553F0D08D037E9411B91D8 var15;
  unint64_t var16;
  __int128 v35;
  __int128 v36;
  double v37;
  int v38;
  unsigned __int8 *p_var13;
  int var13;
  MTLDevice *device;
  _QWORD *v42;
  void *v43;
  NSObject *v44;
  const void *v45;
  void *v46;
  _QWORD v47[6];
  _QWORD v48[7];
  _QWORD v49[2];
  uint64_t (*v50)(uint64_t, const void *, void *);
  void *v51;
  uint64_t v52;
  SCNMTLLibraryManager *v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  $A49D611864553F0D08D037E9411B91D8 v61;
  unint64_t v62;
  uint64_t v63;
  int v64;
  _QWORD block[10];

  if (a3->var0)
  {
    TypeID = C3DFXMetalProgramGetTypeID();
    if (TypeID == CFGetTypeID(a3->var0))
    {
      var0 = a3->var0;
      LibraryProviderBlock = C3DFXMetalProgramGetLibraryProviderBlock(&a3->var0->var0.var0.var0.var0);
      if (!LibraryProviderBlock
        || (v10 = (MTLLibrary *)(*(uint64_t (**)(uint64_t, MTLDevice *))(LibraryProviderBlock + 16))(LibraryProviderBlock, self->_device)) == 0)
      {
        SourceCode = C3DFXMetalProgramGetSourceCode(var0);
        if (SourceCode)
        {
          v12 = SourceCode;
          PreprocessorsMacros = C3DFXMetalProgramGetPreprocessorsMacros(var0);
          v14 = +[SCNMTLLibraryManager hashCodeForSource:macros:](SCNMTLLibraryManager, "hashCodeForSource:macros:", v12, PreprocessorsMacros);
          os_unfair_lock_lock(&self->_availableCompiledLibrariesLock);
          Value = (MTLLibrary *)CFDictionaryGetValue(self->_availableCompiledLibraries, v14);
          os_unfair_lock_unlock(&self->_availableCompiledLibrariesLock);
          if (Value)
          {
            v16 = (void (*)(id, MTLLibrary *, _QWORD))*((_QWORD *)a4 + 2);
            v17 = a4;
            commonProfileCacheLibrary = Value;
LABEL_19:
            v16(v17, commonProfileCacheLibrary, 0);
            return;
          }
          v20 = C3DShouldCollectGeneratedShaders();
          v21 = -[NSDictionary count](self->_commonProfilePrecompiledFunctions, "count");
          if (!v21 && !v20)
          {
LABEL_32:
            OverrideMaterial = C3DGeometryGetOverrideMaterial((uint64_t)var0);
            v28 = SCNMetalLanguageVersion();
            LanguageVersion = C3DFXMetalProgramGetLanguageVersion((unsigned int *)var0);
            if (v28 <= LanguageVersion)
              v30 = LanguageVersion;
            else
              v30 = v28;
            v31 = objc_alloc_init(MEMORY[0x1E0CC6A68]);
            objc_msgSend(v31, "setPreprocessorMacros:", PreprocessorsMacros);
            objc_msgSend(v31, "setLanguageVersion:", v30);
            objc_msgSend(v31, "setAdditionalCompilerArguments:", CFSTR(" -w "));
            kdebug_trace();
            v32 = MEMORY[0x1E0C809B0];
            v49[0] = MEMORY[0x1E0C809B0];
            v49[1] = 3221225472;
            v50 = __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_44;
            v51 = &unk_1EA5A1D88;
            var15 = a3->var15;
            v60 = *(_OWORD *)&a3->var8;
            v61 = var15;
            var16 = a3->var16;
            v35 = *(_OWORD *)&a3->var2;
            v56 = *(_OWORD *)&a3->var0;
            v57 = v35;
            v36 = *(_OWORD *)&a3->var4;
            v59 = *(_OWORD *)&a3->var6;
            v58 = v36;
            v62 = var16;
            v63 = OverrideMaterial;
            v52 = v12;
            v53 = self;
            v54 = v14;
            v55 = a4;
            v64 = (int)var0;
            ++self->__engineStats->onlineShaderCount;
            v37 = CACurrentMediaTime();
            var13 = a3->var13;
            p_var13 = &a3->var13;
            v38 = var13;
            if (var13)
            {
              if (v38 == 2)
              {
                device = self->_device;
                v47[0] = v32;
                v47[1] = 3221225472;
                v47[2] = __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_3_51;
                v47[3] = &unk_1EA5A1E28;
                v47[4] = self;
                v47[5] = v49;
                v42 = v47;
              }
              else
              {
                if (v38 != 1)
                {
                  v44 = scn_default_log();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                    -[SCNMTLLibraryManager libraryForProgramDesc:completionHandler:].cold.2(p_var13, v44);
                  goto LABEL_44;
                }
                dispatch_group_enter((dispatch_group_t)self->_shaderCompilationGroup);
                device = self->_device;
                v48[0] = v32;
                v48[1] = 3221225472;
                v48[2] = __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_49;
                v48[3] = &unk_1EA5A1DD8;
                *(double *)&v48[6] = v37;
                v48[4] = self;
                v48[5] = v49;
                v42 = v48;
              }
              -[MTLDevice newLibraryWithSource:options:completionHandler:](device, "newLibraryWithSource:options:completionHandler:", v12, v31, v42);
            }
            else
            {
              v46 = 0;
              v43 = (void *)-[MTLDevice newLibraryWithSource:options:error:](self->_device, "newLibraryWithSource:options:error:", v12, v31, &v46);
              self->__engineStats->onlineShaderCompilationTime = CACurrentMediaTime()
                                                               - v37
                                                               + self->__engineStats->onlineShaderCompilationTime;
              v50((uint64_t)v49, v43, v46);

            }
LABEL_44:

            return;
          }
          v22 = (const void *)objc_msgSend(CFSTR("commonprofile_vert"), "stringByAppendingString:", v14);
          v45 = (const void *)objc_msgSend(CFSTR("commonprofile_frag"), "stringByAppendingString:", v14);
          if (v21)
          {
            if (-[NSDictionary objectForKeyedSubscript:](self->_commonProfilePrecompiledFunctions, "objectForKeyedSubscript:", v22)&& -[NSDictionary objectForKeyedSubscript:](self->_commonProfilePrecompiledFunctions, "objectForKeyedSubscript:", v45))
            {
              C3DFXMetalProgramSetFunctionName((char *)var0, 0, v22);
              C3DFXMetalProgramSetFunctionName((char *)var0, 1, v45);
              C3DFXMetalProgramReplaceSourceCodeWithLibrary(var0, self->_commonProfileCacheLibraryHasherBlock, self->_commonProfileCacheLibraryProviderBlock);
              commonProfileCacheLibrary = self->_commonProfileCacheLibrary;
              goto LABEL_18;
            }
            v23 = scn_default_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              v24 = v22;
              -[SCNMTLLibraryManager libraryForProgramDesc:completionHandler:].cold.3();
              if (!v20)
                goto LABEL_32;
            }
            else
            {
              v24 = v22;
              if (!v20)
                goto LABEL_32;
            }
          }
          else
          {
            v24 = v22;
            if (!v20)
              goto LABEL_32;
          }
          v25 = C3DGetShaderCompilationDirectory();
          if (v25)
          {
            v26 = v25;
            if (-[SCNMTLLibraryManager libraryForProgramDesc:completionHandler:]::onceToken != -1)
              dispatch_once(&-[SCNMTLLibraryManager libraryForProgramDesc:completionHandler:]::onceToken, &__block_literal_global_65);
            CFRetain(var0);
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_2;
            block[3] = &unk_1EA5A1D38;
            block[4] = v26;
            block[5] = v14;
            block[7] = v45;
            block[8] = var0;
            block[6] = v24;
            dispatch_async((dispatch_queue_t)-[SCNMTLLibraryManager libraryForProgramDesc:completionHandler:]::shaderCollectionQueue, block);
          }
          goto LABEL_32;
        }
        if (C3DFXProgramIsClientProgram((uint64_t)a3->var0))
          v10 = -[SCNMTLLibraryManager defaultLibrary](self, "defaultLibrary");
        else
          v10 = -[SCNMTLLibraryManager frameworkLibrary](self, "frameworkLibrary");
      }
      commonProfileCacheLibrary = v10;
LABEL_18:
      v16 = (void (*)(id, MTLLibrary *, _QWORD))*((_QWORD *)a4 + 2);
      v17 = a4;
      goto LABEL_19;
    }
  }
  v19 = scn_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[SCNMTLLibraryManager libraryForProgramDesc:completionHandler:].cold.1();
}

- (void)_setEngineStats:(__C3DEngineStats *)a3
{
  self->__engineStats = a3;
}

- (void)waitForShadersCompilation
{
  dispatch_group_wait((dispatch_group_t)self->_shaderCompilationGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (SCNMTLLibraryManager)initWithDevice:(id)a3
{
  SCNMTLLibraryManager *v4;
  SCNMTLLibraryManager *v5;
  void *v6;
  uint64_t v7;
  MTLLibrary *v8;
  CFHashCode v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  _QWORD aBlock[5];
  uint64_t v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)SCNMTLLibraryManager;
  v4 = -[SCNMTLLibraryManager init](&v28, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_device = (MTLDevice *)a3;
    v4->_frameworkLibrary = -[SCNMTLLibrary initWithPath:manager:]([SCNMTLLibrary alloc], "initWithPath:manager:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", CFSTR("default"), CFSTR("metallib")), v4);
    v5->_availableLibraries = (NSMapTable *)(id)objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5->_availableCompiledLibraries = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
    v5->_availableCompiledLibrariesLock._os_unfair_lock_opaque = 0;
    v5->_deviceQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.scenekit.device", 0);
    v5->_shaderCompilationGroup = (OS_dispatch_group *)dispatch_group_create();
    v6 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "URLForResource:withExtension:", CFSTR("scenekit"), CFSTR("metallib"));
    if (!v6)
    {
      v6 = (void *)C3DGetShaderCacheLibraryURL();
      if (!v6)
        v6 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
    }
    v27 = 0;
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v6, "path")))
    {
      v7 = -[MTLDevice newLibraryWithURL:error:](v5->_device, "newLibraryWithURL:error:", v6, &v27);
      if (v7)
      {
        v8 = (MTLLibrary *)v7;
        v9 = CFHash(v6);
        v10 = MEMORY[0x1E0C809B0];
        v5->_commonProfileCacheLibrary = v8;
        aBlock[0] = v10;
        aBlock[1] = 3221225472;
        aBlock[2] = __39__SCNMTLLibraryManager_initWithDevice___block_invoke;
        aBlock[3] = &__block_descriptor_40_e5_Q8__0l;
        aBlock[4] = v9;
        v5->_commonProfileCacheLibraryHasherBlock = _Block_copy(aBlock);
        v25[0] = v10;
        v25[1] = 3221225472;
        v25[2] = __39__SCNMTLLibraryManager_initWithDevice___block_invoke_2;
        v25[3] = &unk_1EA5A1C98;
        v25[4] = v8;
        v5->_commonProfileCacheLibraryProviderBlock = _Block_copy(v25);
        v11 = (void *)-[MTLLibrary functionNames](v5->_commonProfileCacheLibrary, "functionNames");
        v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v22 != v15)
                objc_enumerationMutation(v11);
              v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
              if ((objc_msgSend(v17, "hasPrefix:", CFSTR("commonprofile_vert")) & 1) != 0
                || objc_msgSend(v17, "hasPrefix:", CFSTR("commonprofile_frag")))
              {
                v18 = (void *)-[MTLLibrary newFunctionWithName:](v5->_commonProfileCacheLibrary, "newFunctionWithName:", v17);
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, v17);

              }
            }
            v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v14);
        }
        if (objc_msgSend(v12, "count"))
        {
          v5->_commonProfilePrecompiledFunctions = (NSDictionary *)objc_msgSend(v12, "copy");
        }
        else
        {
          CFRelease(v5->_commonProfileCacheLibrary);
          CFRelease(v5->_commonProfileCacheLibraryHasherBlock);
          CFRelease(v5->_commonProfileCacheLibraryProviderBlock);
        }

      }
      else
      {
        v19 = scn_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[SCNMTLLibraryManager initWithDevice:].cold.1();
      }
    }
  }
  return v5;
}

- (id)device
{
  return self->_device;
}

- (id)frameworkLibrary
{
  return -[SCNMTLLibrary library](self->_frameworkLibrary, "library");
}

uint64_t __39__SCNMTLLibraryManager_initWithDevice___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t __39__SCNMTLLibraryManager_initWithDevice___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_availableCompiledLibraries);

  dispatch_release((dispatch_object_t)self->_deviceQueue);
  v3.receiver = self;
  v3.super_class = (Class)SCNMTLLibraryManager;
  -[SCNMTLLibraryManager dealloc](&v3, sel_dealloc);
}

- (void)clearCompiledLibraries
{
  os_unfair_lock_s *p_availableCompiledLibrariesLock;

  p_availableCompiledLibrariesLock = &self->_availableCompiledLibrariesLock;
  os_unfair_lock_lock(&self->_availableCompiledLibrariesLock);
  CFDictionaryRemoveAllValues(self->_availableCompiledLibraries);
  os_unfair_lock_unlock(p_availableCompiledLibrariesLock);
}

- (id)defaultLibrary
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SCNMTLLibraryManager_defaultLibrary__block_invoke;
  block[3] = &unk_1EA59E288;
  block[4] = self;
  if (-[SCNMTLLibraryManager defaultLibrary]::onceToken != -1)
    dispatch_once(&-[SCNMTLLibraryManager defaultLibrary]::onceToken, block);
  return -[SCNMTLLibrary library](self->_defaultLibrary, "library");
}

SCNMTLLibrary *__38__SCNMTLLibraryManager_defaultLibrary__block_invoke(uint64_t a1)
{
  SCNMTLLibrary *result;

  result = -[SCNMTLLibrary initWithPath:manager:]([SCNMTLLibrary alloc], "initWithPath:manager:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "pathForResource:ofType:", CFSTR("default"), CFSTR("metallib")), *(_QWORD *)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = result;
  return result;
}

- (id)libraryForFile:(id)a3
{
  NSObject *deviceQueue;
  void *v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = 0;
  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SCNMTLLibraryManager_libraryForFile___block_invoke;
  block[3] = &unk_1EA5A1CC0;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync(deviceQueue, block);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __39__SCNMTLLibraryManager_libraryForFile___block_invoke(_QWORD *a1)
{
  SCNMTLLibrary *v2;
  uint64_t result;

  v2 = (SCNMTLLibrary *)objc_msgSend(*(id *)(a1[4] + 88), "objectForKey:", a1[5]);
  if (!v2)
  {
    v2 = -[SCNMTLLibrary initWithPath:manager:]([SCNMTLLibrary alloc], "initWithPath:manager:", a1[5], a1[4]);
    objc_msgSend(*(id *)(a1[4] + 88), "setObject:forKey:", v2, a1[5]);

  }
  result = -[SCNMTLLibrary library](v2, "library");
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

- (id)libraryForSourceCode:(id)a3 options:(id)a4
{
  id v7;
  void *Value;
  double v9;
  NSObject *v10;
  uint64_t v12;

  v7 = +[SCNMTLLibraryManager hashCodeForSource:macros:](SCNMTLLibraryManager, "hashCodeForSource:macros:", a3, objc_msgSend(a4, "preprocessorMacros"));
  os_unfair_lock_lock(&self->_availableCompiledLibrariesLock);
  Value = (void *)CFDictionaryGetValue(self->_availableCompiledLibraries, v7);
  if (!Value)
  {
    v12 = 0;
    ++self->__engineStats->onlineShaderCount;
    v9 = CACurrentMediaTime();
    Value = (void *)-[MTLDevice newLibraryWithSource:options:error:](self->_device, "newLibraryWithSource:options:error:", a3, a4, &v12);
    self->__engineStats->onlineShaderCompilationTime = CACurrentMediaTime()
                                                     - v9
                                                     + self->__engineStats->onlineShaderCompilationTime;
    if (Value)
    {
      CFDictionarySetValue(self->_availableCompiledLibraries, v7, Value);

    }
    else
    {
      v10 = scn_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SCNMTLLibraryManager libraryForSourceCode:options:].cold.1();
    }
  }
  os_unfair_lock_unlock(&self->_availableCompiledLibrariesLock);
  return Value;
}

dispatch_queue_t __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  result = dispatch_queue_create("com.apple.scenekit.shader-collection-queue", v1);
  -[SCNMTLLibraryManager libraryForProgramDesc:completionHandler:]::shaderCollectionQueue = (uint64_t)result;
  return result;
}

void __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  SCNCommonProfileProgramGenerator *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[4];
  __int128 v10;

  v2 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_3;
  v9[3] = &unk_1EA5A1CE8;
  v10 = *(_OWORD *)(a1 + 32);
  v3 = +[SCNCommonProfileProgramGenerator generatorWithProfile:allowingHotReload:](SCNCommonProfileProgramGenerator, "generatorWithProfile:allowingHotReload:", 0, 0);
  v5 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_39;
  v8[3] = &unk_1EA5A1D10;
  v8[4] = *(_QWORD *)(a1 + 32);
  -[SCNCommonProfileProgramGenerator collectShaderForProgram:hashCode:newVertexFunctionName:newFragmentFunctionName:sourceCodeBlock:additionalFileBlock:](v3, "collectShaderForProgram:hashCode:newVertexFunctionName:newFragmentFunctionName:sourceCodeBlock:additionalFileBlock:", v4, v6, v7, v5, v9, v8);
  CFRelease(*(CFTypeRef *)(a1 + 64));
}

void __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  BOOL v3;
  NSObject *v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = 0;
  if (objc_msgSend(a2, "writeToURL:atomically:encoding:error:", objc_msgSend(v2, "URLByAppendingPathComponent:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("commonProfile_%@.metal"), v5)), 1, 4, &v6))v3 = v6 == 0;
  else
    v3 = 0;
  if (!v3)
  {
    v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_3_cold_1(&v6, v4);
  }
}

void __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_39(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;

  v6 = 0;
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:");
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v3, "path")))
  {
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v3, 4, 0), "isEqualToString:", a2) & 1) == 0)
    {
      v4 = scn_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_39_cold_1();
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", objc_msgSend(v3, "URLByDeletingLastPathComponent"), 1, 0, 0);
    if (!objc_msgSend(a2, "writeToURL:atomically:encoding:error:", v3, 1, 4, &v6) || v6)
    {
      v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_3_cold_1(&v6, v5);
    }
  }
}

uint64_t __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_44(uint64_t a1, const void *a2, void *a3)
{
  void *v6;
  uint64_t v7;
  uint64_t Callbacks;
  void (*v9)(_QWORD, void *, uint64_t);
  uint64_t UserInfo;
  NSObject *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[3];
  int v16;

  if (a3)
  {
    v6 = *(void **)(a1 + 136);
    if (v6)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", a3, *(_QWORD *)(a1 + 32));
  }
  if (a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 104));
    if (!CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 96), *(const void **)(a1 + 48)))
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 40) + 96), *(const void **)(a1 + 48), a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 104));
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 168);
    if (v7
      && (Callbacks = C3DFXProgramDelegateGetCallbacks(v7)) != 0
      && (v9 = *(void (**)(_QWORD, void *, uint64_t))(Callbacks + 16)) != 0)
    {
      UserInfo = C3DFXProgramDelegateGetUserInfo(*(_QWORD *)(a1 + 168));
      v9(0, a3, UserInfo);
    }
    else
    {
      v11 = scn_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_44_cold_1(a3, v11);
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x2020000000;
      v16 = 0;
      v12 = *(void **)(a1 + 32);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_45;
      v14[3] = &unk_1EA5A1D60;
      v14[4] = v15;
      objc_msgSend(v12, "enumerateLinesUsingBlock:", v14);
      _Block_object_dispose(v15, 8);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return kdebug_trace();
}

void __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_45(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  _DWORD v7[2];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = scn_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(_DWORD *)(v5 + 24);
    *(_DWORD *)(v5 + 24) = v6 + 1;
    v7[0] = 67109378;
    v7[1] = v6;
    v8 = 2112;
    v9 = a2;
    _os_log_impl(&dword_1DCCB8000, v4, OS_LOG_TYPE_DEFAULT, "%d: %@", (uint8_t *)v7, 0x12u);
  }
}

void __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_49(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[9];

  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_2_50;
  block[3] = &unk_1EA5A1DB0;
  v3 = a1[4];
  v4 = a1[5];
  v5 = *(NSObject **)(v3 + 40);
  block[1] = 3221225472;
  block[8] = a1[6];
  block[4] = v3;
  block[5] = a2;
  block[6] = a3;
  block[7] = v4;
  dispatch_async(v5, block);
}

void __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_2_50(uint64_t a1)
{
  *(CFTimeInterval *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 288) = CACurrentMediaTime()
                                                                        - *(double *)(a1 + 64)
                                                                        + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                                + 32)
                                                                                    + 288);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 48));
}

void __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_3_51(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[7];

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_4;
  block[3] = &unk_1EA5A1E00;
  block[5] = a3;
  block[6] = v3;
  block[4] = a2;
  dispatch_async(v4, block);
}

uint64_t __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)initWithDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_7_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_4(&dword_1DCCB8000, v0, v1, "Error: Failed to load common profile chache library : %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)libraryForSourceCode:options:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_7_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_4(&dword_1DCCB8000, v0, v1, "Error: Compilation failed %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)libraryForProgramDesc:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_7_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_4(&dword_1DCCB8000, v0, v1, "Error: Only metal program are supported %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)libraryForProgramDesc:(unsigned __int8 *)a1 completionHandler:(NSObject *)a2 .cold.2(unsigned __int8 *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: Unknown compilation mode %d", (uint8_t *)v3, 8u);
}

- (void)libraryForProgramDesc:completionHandler:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_1(&dword_1DCCB8000, v0, v1, "Error: Failed to find pre-compiled combination %@ + %@");
  OUTLINED_FUNCTION_1();
}

void __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_3_cold_1(id *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_8_0(a1);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_4(&dword_1DCCB8000, a2, v3, "Error: Failed to collect shader: %@", v4);
  OUTLINED_FUNCTION_4_4();
}

void __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_39_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_4(&dword_1DCCB8000, v0, v1, "Error: Failed to collect shader: additional file \"%@\" is not always the same", v2);
  OUTLINED_FUNCTION_1();
}

void __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_44_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_4(&dword_1DCCB8000, a2, v3, "Error: FATAL ERROR : failed compiling shader:\n%@", v4);
  OUTLINED_FUNCTION_4_4();
}

@end
