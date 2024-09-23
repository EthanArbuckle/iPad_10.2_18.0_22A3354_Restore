@implementation SCNMTLResourceManager

- (void)_programWillDie:(id)a3
{
  NSMapTable *registry;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t valuePtr;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  valuePtr = 0;
  CFNumberGetValue((CFNumberRef)objc_msgSend(a3, "object"), kCFNumberLongType, &valuePtr);
  os_unfair_lock_lock(&self->_availableShadables.lock);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  registry = self->_availableShadables.registry;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](registry, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(registry);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (*(_QWORD *)(*(_QWORD *)(v10 + 24) + 16) == valuePtr)
        {
          if (!v7)
            v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v7, "addObject:", v10);
        }
      }
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](registry, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v6);
    if (v7)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v16;
        do
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v16 != v13)
              objc_enumerationMutation(v7);
            -[NSMapTable removeObjectForKey:](self->_availableShadables.registry, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j));
          }
          v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
        }
        while (v12);
      }

    }
  }
  os_unfair_lock_unlock(&self->_availableShadables.lock);
  -[SCNMTLResourceManager _removeMatchingProgram:pass:](self, "_removeMatchingProgram:pass:", valuePtr, 0);
}

- (void)_meshWillDie:(id)a3
{
  NSMapTable *registry;
  uint64_t v5;
  NSMapTable *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t valuePtr;

  valuePtr = 0;
  CFNumberGetValue((CFNumberRef)objc_msgSend(a3, "object"), kCFNumberLongType, &valuePtr);
  os_unfair_lock_lock(&self->_availableMeshes.lock);
  -[NSMapTable removeObjectForKey:](self->_availableMeshes.registry, "removeObjectForKey:", valuePtr);
  -[NSMapTable removeObjectForKey:](self->_availableMeshes.registry, "removeObjectForKey:", valuePtr | 1);
  os_unfair_lock_unlock(&self->_availableMeshes.lock);
  os_unfair_lock_lock(&self->_availableSkinDeformerReadOnlyBuffers.lock);
  registry = self->_availableSkinDeformerReadOnlyBuffers.registry;
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__SCNMTLResourceManager__meshWillDie___block_invoke;
  v8[3] = &__block_descriptor_40_e27_v32__0_8__NSMapTable_16_B24l;
  v8[4] = valuePtr;
  -[NSMapTable scn_enumerateKeysAndValuesUsingBlock:](registry, "scn_enumerateKeysAndValuesUsingBlock:", v8);
  os_unfair_lock_unlock(&self->_availableSkinDeformerReadOnlyBuffers.lock);
  os_unfair_lock_lock(&self->_availableMorphDeformerReadOnlyBuffers.lock);
  v6 = self->_availableMorphDeformerReadOnlyBuffers.registry;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __38__SCNMTLResourceManager__meshWillDie___block_invoke_2;
  v7[3] = &__block_descriptor_40_e27_v32__0_8__NSMapTable_16_B24l;
  v7[4] = valuePtr;
  -[NSMapTable scn_enumerateKeysAndValuesUsingBlock:](v6, "scn_enumerateKeysAndValuesUsingBlock:", v7);
  os_unfair_lock_unlock(&self->_availableMorphDeformerReadOnlyBuffers.lock);
}

- (void)_programHashCodeWillDie:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "object");
  os_unfair_lock_lock(&self->_availableWireframeMaterials.lock);
  -[NSMapTable removeObjectForKey:](self->_availableWireframeMaterials.registry, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_availableWireframeMaterials.lock);
}

- (void)_materialWillDie:(id)a3
{
  uint64_t v4;
  NSMapTable *registry;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "object");
  os_unfair_lock_lock(&self->_availableShadables.lock);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  registry = self->_availableShadables.registry;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](registry, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(registry);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (*(_QWORD *)(v11 + 8) == v4)
        {
          if (!v8)
            v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v8, "addObject:", v11);
        }
      }
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](registry, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
    if (v8)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v17;
        do
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v17 != v14)
              objc_enumerationMutation(v8);
            -[NSMapTable removeObjectForKey:](self->_availableShadables.registry, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j));
          }
          v13 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        }
        while (v13);
      }

    }
  }
  os_unfair_lock_unlock(&self->_availableShadables.lock);
}

- (void)_removeMatchingProgram:(__C3DFXMetalProgram *)a3 pass:(__C3DFXPass *)a4
{
  os_unfair_lock_s *p_availablePipelineStatesLock;
  CFIndex Count;
  CFIndex v7;
  CFIndex i;
  const void *ValueAtIndex;
  id v10;
  _QWORD context[2];
  CFArrayRef theArray;

  context[0] = a3;
  context[1] = a4;
  theArray = 0;
  p_availablePipelineStatesLock = &self->_availablePipelineStatesLock;
  os_unfair_lock_lock(&self->_availablePipelineStatesLock);
  CFDictionaryApplyFunction(self->_availablePipelineStates, (CFDictionaryApplierFunction)__removeMatchingProgram, context);
  if (theArray)
  {
    Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      v7 = Count;
      for (i = 0; i != v7; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
        v10 = (id)(id)CFDictionaryGetValue(self->_availablePipelineStates, ValueAtIndex);
        CFDictionaryRemoveValue(self->_availablePipelineStates, ValueAtIndex);
      }
    }
    CFRelease(theArray);
  }
  os_unfair_lock_unlock(p_availablePipelineStatesLock);
}

void __87__SCNMTLResourceManager_Compilation___createPipelineStateWithDescriptor_desc_pipeline___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _BYTE __dst[344];

  *(CFTimeInterval *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 304) = CACurrentMediaTime()
                                                                        - *(double *)(a1 + 88)
                                                                        + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                                + 24)
                                                                                    + 304);
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "generateBindingsForPipeline:withReflection:program:material:geometry:pass:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120));
    v2 = *(_QWORD *)(a1 + 48);
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(*(id *)(a1 + 56), "setState:", v2);
  memcpy(__dst, (const void *)(a1 + 96), sizeof(__dst));
  SCNMTLRenderPipelineDescRelease((uint64_t)__dst);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __87__SCNMTLResourceManager_Compilation___createPipelineStateWithDescriptor_desc_pipeline___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE __dst[344];

  if (!a2)
  {
    if (a3)
    {
      v6 = scn_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __87__SCNMTLResourceManager_Compilation___createPipelineStateWithDescriptor_desc_pipeline___block_invoke_cold_1(a1, a3, v6);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setState:", a2);
  v7 = *(_QWORD *)(a1 + 32) + 32;
  v9 = *(_OWORD *)(a1 + 208);
  v8 = *(_OWORD *)(a1 + 224);
  v10 = *(_OWORD *)(a1 + 192);
  *(_QWORD *)(v7 + 80) = *(_QWORD *)(a1 + 240);
  *(_OWORD *)(v7 + 48) = v9;
  *(_OWORD *)(v7 + 64) = v8;
  *(_OWORD *)(v7 + 32) = v10;
  v11 = *(_OWORD *)(a1 + 176);
  *(_OWORD *)v7 = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(v7 + 16) = v11;
  objc_msgSend(*(id *)(a1 + 32), "setVertexDescriptor:", objc_msgSend(*(id *)(a1 + 40), "vertexDescriptor"));
  objc_msgSend(*(id *)(a1 + 32), "setVertexFunction:", objc_msgSend(*(id *)(a1 + 40), "vertexFunction"));
  objc_msgSend(*(id *)(a1 + 32), "setFragmentFunction:", objc_msgSend(*(id *)(a1 + 40), "fragmentFunction"));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(a1 + 72);
  memcpy(__dst, (const void *)(a1 + 48), sizeof(__dst));
  SCNMTLRenderPipelineDescRelease((uint64_t)__dst);
}

void __69__SCNMTLResourceManager_Compilation__newRenderPipelineStateWithDesc___block_invoke(uint64_t a1, uint64_t a2)
{
  const void *v3;
  const void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t Constants;
  uint64_t FunctionName;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  _BYTE __dst[344];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;

  v3 = (const void *)(a1 + 48);
  v4 = *(const void **)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 104);
  v44 = *(_OWORD *)(a1 + 88);
  v45 = v5;
  v6 = *(_OWORD *)(a1 + 136);
  v46 = *(_OWORD *)(a1 + 120);
  v47 = v6;
  v7 = *(_OWORD *)(a1 + 72);
  v42 = *(_OWORD *)(a1 + 56);
  v43 = v7;
  v8 = *(_OWORD *)(a1 + 176);
  v36 = *(_OWORD *)(a1 + 160);
  v37 = v8;
  v9 = *(_OWORD *)(a1 + 192);
  v10 = *(_OWORD *)(a1 + 208);
  v11 = *(_OWORD *)(a1 + 224);
  v12 = *(_QWORD *)(a1 + 248);
  v41 = *(_QWORD *)(a1 + 240);
  v39 = v10;
  v40 = v11;
  v38 = v9;
  v13 = *(_OWORD *)(a1 + 256);
  v14 = *(_OWORD *)(a1 + 272);
  v15 = *(_OWORD *)(a1 + 288);
  v16 = *(_OWORD *)(a1 + 304);
  Constants = *(_QWORD *)(a1 + 328);
  v35 = *(_QWORD *)(a1 + 320);
  v33 = v15;
  v34 = v16;
  v31 = v13;
  v32 = v14;
  v19 = *(_QWORD *)(a1 + 336);
  FunctionName = *(_QWORD *)(a1 + 344);
  v20 = *(_QWORD *)(a1 + 352);
  v21 = *(_OWORD *)(a1 + 376);
  v29 = *(_OWORD *)(a1 + 360);
  v30 = v21;
  v22 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (a2)
  {
    v23 = a2;
    if (objc_msgSend(v22, "commonProfileCacheLibrary") == a2 && v4)
    {
      FunctionName = C3DFXMetalProgramGetFunctionName(v4, 0);
      v20 = C3DFXMetalProgramGetFunctionName(v4, 1);
    }
  }
  else
  {
    v23 = objc_msgSend(v22, "frameworkLibrary");
    v4 = (const void *)objc_msgSend(*(id *)(a1 + 32), "defaultProgramUsingTessellation:", *(_QWORD *)(a1 + 376) != 0);
    FunctionName = C3DFXMetalProgramGetFunctionName(v4, 0);
    v20 = C3DFXMetalProgramGetFunctionName(v4, 1);
    Constants = C3DFXMetalProgramGetConstants(v4);
    v12 = 0;
  }
  *(_QWORD *)__dst = v4;
  *(_OWORD *)&__dst[40] = v44;
  *(_OWORD *)&__dst[56] = v45;
  *(_OWORD *)&__dst[72] = v46;
  *(_OWORD *)&__dst[88] = v47;
  *(_OWORD *)&__dst[8] = v42;
  *(_OWORD *)&__dst[24] = v43;
  *(_QWORD *)&__dst[104] = v23;
  *(_OWORD *)&__dst[128] = v37;
  *(_OWORD *)&__dst[112] = v36;
  *(_OWORD *)&__dst[176] = v40;
  *(_OWORD *)&__dst[160] = v39;
  *(_OWORD *)&__dst[144] = v38;
  *(_QWORD *)&__dst[192] = v41;
  *(_QWORD *)&__dst[200] = v12;
  *(_OWORD *)&__dst[256] = v34;
  *(_OWORD *)&__dst[240] = v33;
  *(_OWORD *)&__dst[208] = v31;
  *(_OWORD *)&__dst[224] = v32;
  *(_QWORD *)&__dst[272] = v35;
  *(_QWORD *)&__dst[280] = Constants;
  *(_QWORD *)&__dst[288] = v19;
  *(_QWORD *)&__dst[296] = FunctionName;
  *(_QWORD *)&__dst[304] = v20;
  *(_OWORD *)&__dst[312] = v29;
  *(_OWORD *)&__dst[328] = v30;
  v24 = _pipelineDescriptorForPipelineDesc((uint64_t)__dst);
  if (v24)
  {
    v25 = v24;
    v26 = *(void **)(a1 + 32);
    v27 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)__dst = v4;
    *(_OWORD *)&__dst[40] = v44;
    *(_OWORD *)&__dst[56] = v45;
    *(_OWORD *)&__dst[72] = v46;
    *(_OWORD *)&__dst[88] = v47;
    *(_OWORD *)&__dst[8] = v42;
    *(_OWORD *)&__dst[24] = v43;
    *(_QWORD *)&__dst[104] = v23;
    *(_OWORD *)&__dst[128] = v37;
    *(_OWORD *)&__dst[112] = v36;
    *(_OWORD *)&__dst[176] = v40;
    *(_OWORD *)&__dst[160] = v39;
    *(_OWORD *)&__dst[144] = v38;
    *(_QWORD *)&__dst[192] = v41;
    *(_QWORD *)&__dst[200] = v12;
    *(_OWORD *)&__dst[256] = v34;
    *(_OWORD *)&__dst[240] = v33;
    *(_OWORD *)&__dst[208] = v31;
    *(_OWORD *)&__dst[224] = v32;
    *(_QWORD *)&__dst[272] = v35;
    *(_QWORD *)&__dst[280] = Constants;
    *(_QWORD *)&__dst[288] = v19;
    *(_QWORD *)&__dst[296] = FunctionName;
    *(_QWORD *)&__dst[304] = v20;
    *(_OWORD *)&__dst[312] = v29;
    *(_OWORD *)&__dst[328] = v30;
    objc_msgSend(v26, "_createPipelineStateWithDescriptor:desc:pipeline:", v25, __dst, v27);
  }
  memcpy(__dst, v3, sizeof(__dst));
  SCNMTLRenderPipelineDescRelease((uint64_t)__dst);
}

- (void)_createPipelineStateWithDescriptor:(id)a3 desc:(id *)a4 pipeline:(id)a5
{
  uint64_t v9;
  double v10;
  NSObject *v11;
  MTLDevice *device;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[8];
  _QWORD v17[8];
  _BYTE v18[344];
  double v19;
  _QWORD v20[2];
  void (*v21)(uint64_t, uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  _BYTE v25[344];
  void *__dst[43];

  memcpy(__dst, a4, sizeof(__dst));
  SCNMTLRenderPipelineDescRetain((uint64_t)__dst);
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v21 = __87__SCNMTLResourceManager_Compilation___createPipelineStateWithDescriptor_desc_pipeline___block_invoke;
  v22 = &unk_1EA5A5228;
  memcpy(v25, a4, sizeof(v25));
  v23 = a5;
  v24 = a3;
  ++self->__engineStats->renderPipelineCount;
  v10 = CACurrentMediaTime();
  if (a4->var13 - 1 >= 2)
  {
    if (a4->var13)
    {
      v14 = scn_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SCNMTLResourceManager(Compilation) _createPipelineStateWithDescriptor:desc:pipeline:].cold.1(&a4->var13, v14);
    }
    else
    {
      __dst[0] = 0;
      if (a4->var15)
      {
        v15 = 0;
        v13 = (void *)-[MTLDevice newRenderPipelineStateWithDescriptor:options:reflection:error:](self->_device, "newRenderPipelineStateWithDescriptor:options:reflection:error:", a3, 3, &v15, __dst);
        self->__engineStats->renderPipelineCompilationTime = CACurrentMediaTime()
                                                           - v10
                                                           + self->__engineStats->renderPipelineCompilationTime;
        v21((uint64_t)v20, (uint64_t)v13, __dst[0]);
        if (v13)
          -[SCNMTLShaderBindingsGenerator generateBindingsForPipeline:withReflection:program:material:geometry:pass:](self->_bindingsGenerator, "generateBindingsForPipeline:withReflection:program:material:geometry:pass:", a5, v15, a4->var0.var0, a4->var0.var1, a4->var0.var2, a4->var0.var3);
      }
      else
      {
        v13 = (void *)-[MTLDevice newRenderPipelineStateWithDescriptor:error:](self->_device, "newRenderPipelineStateWithDescriptor:error:", a3, __dst);
        self->__engineStats->renderPipelineCompilationTime = CACurrentMediaTime()
                                                           - v10
                                                           + self->__engineStats->renderPipelineCompilationTime;
        v21((uint64_t)v20, (uint64_t)v13, __dst[0]);
      }

    }
  }
  else
  {
    v11 = -[SCNMTLLibraryManager shaderCompilationGroup](self->_libraryManager, "shaderCompilationGroup");
    dispatch_group_enter(v11);
    device = self->_device;
    if (a4->var15)
    {
      v17[0] = v9;
      v17[1] = 3221225472;
      v17[2] = __87__SCNMTLResourceManager_Compilation___createPipelineStateWithDescriptor_desc_pipeline___block_invoke_8;
      v17[3] = &unk_1EA5A5278;
      memcpy(v18, a4, sizeof(v18));
      v19 = v10;
      v17[4] = self;
      v17[5] = a5;
      v17[6] = v11;
      v17[7] = v20;
      -[MTLDevice newRenderPipelineStateWithDescriptor:options:completionHandler:](device, "newRenderPipelineStateWithDescriptor:options:completionHandler:", a3, 3, v17);
    }
    else
    {
      v16[0] = v9;
      v16[1] = 3221225472;
      v16[2] = __87__SCNMTLResourceManager_Compilation___createPipelineStateWithDescriptor_desc_pipeline___block_invoke_3;
      v16[3] = &unk_1EA5A52A0;
      *(double *)&v16[7] = v10;
      v16[5] = v11;
      v16[6] = v20;
      v16[4] = self;
      -[MTLDevice newRenderPipelineStateWithDescriptor:completionHandler:](device, "newRenderPipelineStateWithDescriptor:completionHandler:", a3, v16);
    }
  }
}

- (id)renderResourceForEffectSlot:(__C3DEffectSlot *)a3 withEngineContext:(__C3DEngineContext *)a4 didFallbackToDefaultTexture:(BOOL *)a5
{
  id result;
  uint64_t ImageProxy;
  uint64_t v11;
  uint64_t TextureSampler;
  id v13;
  uint64_t v14;

  if (a5)
  {
    *a5 = 1;
    result = (id)C3DEffectSlotGetMTLTexture((uint64_t)a3);
    if (result)
    {
      *a5 = 0;
      return result;
    }
  }
  else
  {
    result = (id)C3DEffectSlotGetMTLTexture((uint64_t)a3);
    if (result)
      return result;
  }
  ImageProxy = C3DEffectSlotGetImageProxy((uint64_t)a3);
  if (!ImageProxy)
    goto LABEL_9;
  v11 = ImageProxy;
  TextureSampler = C3DEffectSlotGetTextureSampler((uint64_t)a3);
  if (!TextureSampler)
    TextureSampler = C3DTextureSamplerGetDefault();
  result = -[SCNMTLResourceManager renderResourceForImageProxy:sampler:engineContext:didFallbackToDefaultTexture:](self, "renderResourceForImageProxy:sampler:engineContext:didFallbackToDefaultTexture:", v11, TextureSampler, a4, a5);
  if (!result)
  {
LABEL_9:
    result = (id)C3DEffectSlotGetImage((uint64_t)a3);
    if (result)
    {
      v13 = result;
      v14 = C3DEffectSlotGetTextureSampler((uint64_t)a3);
      return -[SCNMTLResourceManager renderResourceForImage:sampler:options:engineContext:didFallbackToDefaultTexture:](self, "renderResourceForImage:sampler:options:engineContext:didFallbackToDefaultTexture:", v13, v14, C3DEffectSlotGetTextureOptions((uint64_t)a3), a4, a5);
    }
  }
  return result;
}

- (void)renderResourceForRasterizerState:(int)a3 reverseZ:
{
  os_unfair_lock_s *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;

  if (!a1)
    return 0;
  v6 = (os_unfair_lock_s *)(a1 + 256);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));
  v7 = *(void **)(a1 + 248);
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, 100);
    *(_QWORD *)(a1 + 248) = v7;
  }
  v8 = (void *)objc_msgSend(v7, "objectForKey:", a2);
  if (!v8)
  {
    v13 = 0;
    v14 = 0;
    v16 = 0;
    v15 = 0;
    C3DRasterizerStatesGetDesc(a2, (uint64_t)&v13);
    v9 = objc_alloc_init(MEMORY[0x1E0CC6A88]);
    if ((_BYTE)v14)
    {
      if (a3)
        v10 = C3DComparisonFuncToMTLCompareFunctionReverse(BYTE2(v14));
      else
        v10 = C3DComparisonFuncToMTLCompareFunction(BYTE2(v14));
      v11 = v10;
    }
    else
    {
      v11 = 7;
    }
    objc_msgSend(v9, "setDepthCompareFunction:", v11);
    objc_msgSend(v9, "setDepthWriteEnabled:", BYTE1(v14));
    if (BYTE3(v14))
    {
      objc_msgSend((id)objc_msgSend(v9, "frontFaceStencil"), "setStencilCompareFunction:", C3DComparisonFuncToMTLCompareFunction(BYTE5(v14)));
      objc_msgSend((id)objc_msgSend(v9, "frontFaceStencil"), "setStencilFailureOperation:", C3DStencilOpToMTLStencilOperation(BYTE3(v15)));
      objc_msgSend((id)objc_msgSend(v9, "frontFaceStencil"), "setDepthFailureOperation:", C3DStencilOpToMTLStencilOperation(BYTE2(v15)));
      objc_msgSend((id)objc_msgSend(v9, "frontFaceStencil"), "setDepthStencilPassOperation:", C3DStencilOpToMTLStencilOperation(BYTE1(v15)));
      objc_msgSend((id)objc_msgSend(v9, "frontFaceStencil"), "setReadMask:", BYTE6(v14));
      objc_msgSend((id)objc_msgSend(v9, "frontFaceStencil"), "setWriteMask:", HIBYTE(v14));
      objc_msgSend((id)objc_msgSend(v9, "backFaceStencil"), "setStencilCompareFunction:", C3DComparisonFuncToMTLCompareFunction(BYTE4(v15)));
      objc_msgSend((id)objc_msgSend(v9, "backFaceStencil"), "setStencilFailureOperation:", C3DStencilOpToMTLStencilOperation(BYTE2(v16)));
      objc_msgSend((id)objc_msgSend(v9, "backFaceStencil"), "setDepthFailureOperation:", C3DStencilOpToMTLStencilOperation(BYTE1(v16)));
      objc_msgSend((id)objc_msgSend(v9, "backFaceStencil"), "setDepthStencilPassOperation:", C3DStencilOpToMTLStencilOperation(v16));
      objc_msgSend((id)objc_msgSend(v9, "backFaceStencil"), "setReadMask:", BYTE5(v15));
      objc_msgSend((id)objc_msgSend(v9, "backFaceStencil"), "setWriteMask:", BYTE6(v15));
    }
    v8 = (void *)objc_msgSend(*(id *)(a1 + 8), "newDepthStencilStateWithDescriptor:", v9);

    objc_msgSend(*(id *)(a1 + 248), "setObject:forKey:", v8, a2);
  }
  os_unfair_lock_unlock(v6);
  return v8;
}

uint64_t __50__SCNMTLResourceManager_resourceManagerForDevice___block_invoke()
{
  __resourceManagersLock = 0;
  __resourceManagers = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  +[SCNMTLShaderBindingsGenerator allocateRegistry](SCNMTLShaderBindingsGenerator, "allocateRegistry");
  return +[SCNMTLRenderContext registerBindings]();
}

- (SCNMTLMesh)renderResourceForMesh:(int)a3 dataKind:
{
  unint64_t v6;
  os_unfair_lock_s *v7;
  void *v8;
  uint64_t v9;
  SCNMTLMesh *v10;
  void *v11;
  char *v12;
  uint64_t v13;
  const __CFArray *ElementsCount;
  void *v15;
  CFIndex i;
  const void *ElementAtIndex;
  uint64_t v18;
  unsigned int Type;
  NSObject *v20;
  SCNMTLMesh *v21;
  unint64_t v23;
  _QWORD v24[7];
  _QWORD v25[9];
  char v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t v32[4];
  _QWORD v33[3];

  *(_QWORD *)((char *)&v33[1] + 4) = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = (a3 == 0) | (unint64_t)a2;
  v7 = (os_unfair_lock_s *)(a1 + 208);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
  v8 = *(void **)(a1 + 200);
  if (!v8)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, 100);
    *(_QWORD *)(a1 + 200) = v8;
  }
  v9 = objc_msgSend(v8, "objectForKey:", v6);
  if (v9)
  {
    v10 = (SCNMTLMesh *)v9;
    if (C3DMeshIsMutable(a2))
      objc_msgSend((id)a1, "__updateMutableMesh:withMetalMesh:", a2, v10);
  }
  else
  {
    v23 = v6;
    v10 = objc_alloc_init(SCNMTLMesh);
    C3DEntityGetName(a2);
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CC6BD8], "vertexDescriptor");
    v12 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", C3DMeshGetSourcesCount(a2));
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v13 = MEMORY[0x1E0C809B0];
    v31 = 0;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __56__SCNMTLResourceManager_renderResourceForMesh_dataKind___block_invoke;
    v25[3] = &unk_1EA59F4B0;
    v26 = a3;
    v25[7] = v11;
    v25[8] = &v28;
    v27 = a3 == 0;
    v25[4] = v10;
    v25[5] = a1;
    v25[6] = v12;
    C3DMeshApplySources(a2, a3, (uint64_t)v25);
    if (a3 == 1)
    {
      v24[0] = v13;
      v24[1] = 3221225472;
      v24[2] = __56__SCNMTLResourceManager_renderResourceForMesh_dataKind___block_invoke_2;
      v24[3] = &unk_1EA59F4D8;
      v24[5] = v12;
      v24[6] = &v28;
      v24[4] = v11;
      C3DMeshApplySources(a2, 1, (uint64_t)v24);
    }
    -[SCNMTLMesh setVertexDescriptor:]((uint64_t)v10, v11);
    -[SCNMTLMesh setBuffers:](v10, v12);
    -[SCNMTLMesh setVolatileStride:]((uint64_t)v10, v29[3]);

    ElementsCount = C3DMeshGetElementsCount(a2);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", ElementsCount);
    if ((uint64_t)ElementsCount >= 1)
    {
      for (i = 0; (const __CFArray *)i != ElementsCount; ++i)
      {
        ElementAtIndex = C3DMeshGetElementAtIndex(a2, i, a3);
        v18 = (uint64_t)ElementAtIndex;
        if (ElementAtIndex)
        {
          Type = C3DMeshElementGetType((uint64_t)ElementAtIndex);
          if ((C3DMeshElementTypeMapsToMTLPrimitiveType(Type) & 1) != 0)
          {
            objc_msgSend(v15, "addObject:", -[SCNMTLResourceManager renderResourceForMeshElement:](a1, v18));
          }
          else if (a3)
          {
            v20 = scn_default_log();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
              -[SCNMTLResourceManager renderResourceForMesh:dataKind:].cold.1(v32, v33, v20);
          }
        }
      }
    }
    -[SCNMTLMesh setElements:](v10, (char *)v15);

    objc_msgSend(*(id *)(a1 + 200), "setObject:forKey:", v10, v23);
    _Block_object_dispose(&v28, 8);
  }
  v21 = v10;
  os_unfair_lock_unlock(v7);
  return v10;
}

uint64_t __56__SCNMTLResourceManager_renderResourceForMesh_dataKind___block_invoke_2(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t Accessor;

  result = C3DMeshSourceIsVolatile(a2);
  if ((_DWORD)result)
  {
    Accessor = C3DMeshSourceGetAccessor(a2);
    C3DSourceAccessorSetStride(Accessor, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    return _fillVertexDescriptor(*(void **)(a1 + 32), a2, a3, a4, objc_msgSend(*(id *)(a1 + 40), "count"));
  }
  return result;
}

uint64_t __56__SCNMTLResourceManager_renderResourceForMesh_dataKind___block_invoke(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t Count;
  uint64_t Accessor;
  uint64_t v10;
  uint64_t v11;

  if (a3 != 7)
  {
    v7 = result;
    result = -[SCNMTLMesh verticesCount](*(_QWORD *)(result + 32));
    if (!result)
    {
      Count = C3DMeshSourceGetCount(a2);
      result = -[SCNMTLMesh setVerticesCount:](*(_QWORD *)(v7 + 32), Count);
    }
    if ((a3 == 3 || a4 <= 0) && (a3 != 3 || a4 <= 7))
    {
      if (*(_BYTE *)(v7 + 72) == 1 && (result = C3DMeshSourceIsVolatile(a2), (_DWORD)result))
      {
        Accessor = C3DMeshSourceGetAccessor(a2);
        C3DSourceAccessorSetOffset(Accessor, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 64) + 8) + 24));
        result = C3DSceneSourceGetLibrary(Accessor);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 64) + 8) + 24) += result;
      }
      else if (!a3 || !*(_BYTE *)(v7 + 73))
      {
        result = (uint64_t)-[SCNMTLResourceManager renderResourceForMeshSource:](*(_QWORD *)(v7 + 40), a2);
        if (result)
        {
          v10 = result;
          v11 = objc_msgSend(*(id *)(v7 + 48), "indexOfObject:", result);
          if (v11 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v11 = objc_msgSend(*(id *)(v7 + 48), "count");
            objc_msgSend(*(id *)(v7 + 48), "addObject:", v10);
          }
          return _fillVertexDescriptor(*(void **)(v7 + 56), a2, a3, a4, v11);
        }
      }
    }
  }
  return result;
}

- (void)renderResourceForMeshSource:(uint64_t)a1
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *MTLBuffer;
  const __CFData *Data;
  const __CFData *v9;
  CFIndex Length;
  CFIndex v11;
  const UInt8 *BytePtr;
  void *v13;
  uint64_t v14;

  if (!a1)
    return 0;
  if (C3DMeshSourceIsVolatile(a2))
  {
    v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[SCNMTLResourceManager renderResourceForMeshSource:].cold.1(v4, v5, v6);
  }
  MTLBuffer = (void *)C3DMeshSourceGetMTLBuffer(a2);
  if (!MTLBuffer)
  {
    Data = (const __CFData *)C3DMeshSourceGetData(a2);
    if (Data)
    {
      v9 = Data;
      Length = CFDataGetLength(Data);
      if (Length)
      {
        v11 = Length;
        BytePtr = CFDataGetBytePtr(v9);
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 224));
        v13 = *(void **)(a1 + 216);
        if (!v13)
        {
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, 100);
          *(_QWORD *)(a1 + 216) = v13;
        }
        MTLBuffer = (void *)objc_msgSend(v13, "objectForKey:", v9);
        if (!MTLBuffer)
        {
          MTLBuffer = (void *)objc_msgSend(*(id *)(a1 + 8), "newBufferWithBytes:length:options:", BytePtr, v11, 0);
          v14 = *(_QWORD *)(a1 + 24);
          ++*(_DWORD *)(v14 + 228);
          *(_DWORD *)(v14 + 256) += v11;
          objc_msgSend(*(id *)(a1 + 216), "setObject:forKey:", MTLBuffer, v9);

        }
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 224));
        return MTLBuffer;
      }
    }
    return 0;
  }
  return MTLBuffer;
}

- (id)renderResourceForProgramDesc:(id *)a3 renderPassDescriptor:(id)a4
{
  __C3DFXMetalProgram *var0;
  __C3DFXPass *var3;
  _QWORD *var5;
  __C3DBlendStates *var6;
  int v11;
  id var1;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 var11;
  unint64_t v24;
  unsigned __int8 v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  const void *v33;
  os_unfair_lock_s *p_availablePipelineStatesLock;
  void *Value;
  id v36;
  uint64_t TypeID;
  uint64_t FunctionName;
  char LinkedFunctionsFamilies;
  void *v40;
  $A49D611864553F0D08D037E9411B91D8 var15;
  unint64_t var16;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v71;
  uint64_t v72;
  uint64_t Constants;
  id v74;
  _QWORD *v75;
  _BYTE __dst[344];
  _BYTE __src[344];
  _QWORD v78[5];
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  void (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  void (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  uint64_t v90;
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  _OWORD v94[4];
  __int128 v95;
  uint64_t v96;

  var0 = a3->var0;
  var3 = a3->var3;
  var5 = a3->var5;
  var6 = a3->var6;
  v11 = a3->var15.var0;
  var1 = a3->var15.var1;
  v96 = 0;
  v95 = 0u;
  memset(v94, 0, sizeof(v94));
  v93 = 0u;
  v92 = 0u;
  v74 = var1;
  v75 = var5;
  if (v11)
    v13 = (uint64_t)-[SCNMTLMesh tessellationVertexDescriptorHash](var5);
  else
    v13 = -[SCNMTLMesh vertexDescriptorHash]((uint64_t)var5);
  v91 = v13;
  if (!v13)
  {
    v14 = scn_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[SCNMTLResourceManager(Compilation) renderResourceForProgramDesc:renderPassDescriptor:].cold.4(v14, v15, v16, v17, v18, v19, v20, v21);
  }
  v22 = 0;
  *(_QWORD *)&v92 = C3DFXMetalProgramGetHash(var0);
  *(_QWORD *)&v93 = var3;
  BYTE8(v93) = v11;
  do
  {
    *((_QWORD *)v94 + v22) = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "colorAttachments"), "objectAtIndexedSubscript:", v22), "texture"), "pixelFormat");
    ++v22;
  }
  while (v22 != 8);
  *(_QWORD *)&v95 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "depthAttachment"), "texture"), "pixelFormat");
  *((_QWORD *)&v95 + 1) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "stencilAttachment"), "texture"), "pixelFormat");
  LOBYTE(v96) = a3->var9;
  if (a3->var11 <= 1u)
    var11 = 1;
  else
    var11 = a3->var11;
  BYTE2(v96) = var11;
  v24 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "colorAttachments"), "objectAtIndexedSubscript:", 0), "texture"), "sampleCount");
  if (v24 <= 1)
    v25 = 1;
  else
    v25 = v24;
  v26 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "depthAttachment"), "texture"), "sampleCount");
  if (v25 <= v26)
    v25 = v26;
  v27 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "stencilAttachment"), "texture"), "sampleCount");
  v28 = v25;
  if (v25 <= v27)
    v28 = v27;
  BYTE1(v96) = v28;
  v29 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "colorAttachments"), "objectAtIndexedSubscript:", 0), "texture"), "pixelFormat");
  v30 = (uint64_t)var6;
  if (!v29)
    v30 = C3DBlendStatesDefaultReplace();
  v31 = 0;
  *((_QWORD *)&v92 + 1) = v30;
  BYTE3(v96) = a3->var8;
  v32 = 0x5253C9ADE8F4CA80;
  do
  {
    v32 = 0xC6A4A7935BD1E995
        * ((0xC6A4A7935BD1E995
          * ((0xC6A4A7935BD1E995 * *(uint64_t *)((char *)&v91 + v31)) ^ ((0xC6A4A7935BD1E995
                                                                         * *(uint64_t *)((char *)&v91 + v31)) >> 47))) ^ v32);
    v31 += 8;
  }
  while (v31 != 128);
  v33 = (const void *)((0xC6A4A7935BD1E995 * (v32 ^ (v32 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v32 ^ (v32 >> 47))) >> 47));
  p_availablePipelineStatesLock = &self->_availablePipelineStatesLock;
  os_unfair_lock_lock(&self->_availablePipelineStatesLock);
  Value = (void *)CFDictionaryGetValue(self->_availablePipelineStates, v33);
  if (Value)
  {
    v36 = Value;
    os_unfair_lock_unlock(&self->_availablePipelineStatesLock);
    return v36;
  }
  TypeID = C3DFXMetalProgramGetTypeID();
  if (TypeID != CFGetTypeID(var0))
  {
    v46 = scn_default_log();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      -[SCNMTLResourceManager(Compilation) renderResourceForProgramDesc:renderPassDescriptor:].cold.3(v46, v47, v48, v49, v50, v51, v52, v53);
    goto LABEL_33;
  }
  FunctionName = C3DFXMetalProgramGetFunctionName(var0, 0);
  if (!FunctionName)
  {
    if ((renderResourceForProgramDesc_renderPassDescriptor__done & 1) == 0)
    {
      renderResourceForProgramDesc_renderPassDescriptor__done = 1;
      v54 = scn_default_log();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        -[SCNMTLResourceManager(Compilation) renderResourceForProgramDesc:renderPassDescriptor:].cold.1(v54, v55, v56, v57, v58, v59, v60, v61);
    }
LABEL_33:
    os_unfair_lock_unlock(p_availablePipelineStatesLock);
    return 0;
  }
  v72 = FunctionName;
  v71 = C3DFXMetalProgramGetFunctionName(var0, 1);
  Constants = C3DFXMetalProgramGetConstants(var0);
  v85 = 0;
  v86 = &v85;
  v87 = 0x3052000000;
  v88 = __Block_byref_object_copy__11;
  v89 = __Block_byref_object_dispose__11;
  v90 = 0;
  v79 = 0;
  v80 = &v79;
  v81 = 0x3052000000;
  v82 = __Block_byref_object_copy__11;
  v83 = __Block_byref_object_dispose__11;
  v84 = 0;
  LinkedFunctionsFamilies = C3DFXMetalProgramGetLinkedFunctionsFamilies((unsigned int *)var0);
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __88__SCNMTLResourceManager_Compilation__renderResourceForProgramDesc_renderPassDescriptor___block_invoke_2;
  v78[3] = &unk_1EA5A5200;
  v78[4] = &v79;
  if ((LinkedFunctionsFamilies & 1) != 0)
  {
    v40 = (void *)objc_msgSend(-[SCNMTLLibraryManager frameworkLibrary](self->_libraryManager, "frameworkLibrary"), "newFunctionWithName:", CFSTR("scn_is_inside_bezier_curve"));
    __88__SCNMTLResourceManager_Compilation__renderResourceForProgramDesc_renderPassDescriptor___block_invoke_2((uint64_t)v78, (uint64_t)v40);

  }
  memset(&__src[272], 0, 72);
  var15 = a3->var15;
  *(_OWORD *)&__src[64] = *(_OWORD *)&a3->var8;
  *($A49D611864553F0D08D037E9411B91D8 *)&__src[80] = var15;
  var16 = a3->var16;
  v43 = *(_OWORD *)&a3->var2;
  *(_OWORD *)__src = *(_OWORD *)&a3->var0;
  *(_OWORD *)&__src[16] = v43;
  v44 = *(_OWORD *)&a3->var6;
  *(_OWORD *)&__src[32] = *(_OWORD *)&a3->var4;
  *(_OWORD *)&__src[48] = v44;
  memset(&__src[104], 0, 96);
  *(_QWORD *)&__src[96] = var16;
  *(_QWORD *)&__src[200] = var6;
  *(_QWORD *)&__src[208] = a3->var8;
  *(_QWORD *)&__src[216] = *(_QWORD *)&__src[208];
  *(_QWORD *)&__src[224] = *(_QWORD *)&__src[208];
  *(_QWORD *)&__src[232] = *(_QWORD *)&__src[208];
  *(_QWORD *)&__src[240] = *(_QWORD *)&__src[208];
  *(_QWORD *)&__src[248] = *(_QWORD *)&__src[208];
  *(_QWORD *)&__src[256] = 0;
  *(_QWORD *)&__src[264] = 0;
  __src[272] = a3->var9;
  *(_QWORD *)&__src[280] = Constants;
  if (v11)
    v45 = (uint64_t)-[SCNMTLMesh tessellationVertexDescriptor](v75);
  else
    v45 = -[SCNMTLResourceManager commandQueue]((uint64_t)v75);
  *(_QWORD *)&__src[288] = v45;
  *(_QWORD *)&__src[296] = v72;
  *(_QWORD *)&__src[304] = v71;
  *(_QWORD *)&__src[312] = v86[5];
  *(_QWORD *)&__src[320] = v80[5];
  *(_QWORD *)&__src[328] = v74;
  __src[336] = a3->var13;
  *(_WORD *)&__src[337] = 256;
  __src[339] = 1;
  SCNMTLRenderPipelineApplyRenderPassDescriptor((uint64_t)&__src[112], a4);
  memcpy(__dst, __src, sizeof(__dst));
  v36 = -[SCNMTLResourceManager newRenderPipelineStateWithDesc:](self, "newRenderPipelineStateWithDesc:", __dst);
  if (!v36)
  {
    v62 = scn_default_log();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
      -[SCNMTLResourceManager(Compilation) renderResourceForProgramDesc:renderPassDescriptor:].cold.2(v62, v63, v64, v65, v66, v67, v68, v69);
  }
  CFDictionarySetValue(self->_availablePipelineStates, v33, v36);

  os_unfair_lock_unlock(&self->_availablePipelineStatesLock);
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v85, 8);
  return v36;
}

- (SCNMTLMeshElement)renderResourceForMeshElement:(uint64_t)a1
{
  uint64_t SharedMeshElement;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  SCNMTLMeshElement *v8;
  char *v9;
  char *v10;
  uint64_t IndexCount;
  unsigned int SharedIndexBufferOffset;
  unsigned int InstanceCount;
  uint64_t Indexes;
  unsigned int v16;

  if (!a1)
    return 0;
  SharedMeshElement = C3DMeshElementGetSharedMeshElement(a2);
  if (SharedMeshElement == a2)
    v5 = 0;
  else
    v5 = -[SCNMTLResourceManager renderResourceForMeshElement:](a1, SharedMeshElement);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 240));
  v6 = *(void **)(a1 + 232);
  if (!v6)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, 100);
    *(_QWORD *)(a1 + 232) = v6;
  }
  v7 = objc_msgSend(v6, "objectForKey:", SharedMeshElement);
  if (!v7)
  {
    v8 = objc_alloc_init(SCNMTLMeshElement);
    -[SCNMTLMeshElement setupWithElement:](v8, a2);
    if (SharedMeshElement == a2)
    {
      if (C3DMeshElementGetMTLBuffer(a2))
      {
        v10 = (char *)objc_msgSend((id)a1, "_bufferForMTLBuffer:", C3DMeshElementGetMTLBuffer(a2));
      }
      else
      {
        v16 = 0;
        Indexes = C3DMeshElementGetIndexes(a2, &v16);
        if (!Indexes)
        {
LABEL_20:
          objc_msgSend(*(id *)(a1 + 232), "setObject:forKey:", v8, a2);

          goto LABEL_21;
        }
        v10 = (char *)objc_msgSend((id)a1, "_bufferForData:bytesPerIndex:", Indexes, v16);
      }
    }
    else
    {
      v10 = (char *)-[SCNMTLMeshElement indexBuffer](v5);
    }
    -[SCNMTLMeshElement setIndexBuffer:](v8, v10);
    goto LABEL_20;
  }
  v8 = (SCNMTLMeshElement *)v7;
  if (SharedMeshElement != a2)
  {
    v9 = (char *)-[SCNMTLMeshElement indexBuffer](v5);
    -[SCNMTLMeshElement setIndexBuffer:](v8, v9);
LABEL_13:
    IndexCount = C3DMeshElementGetIndexCount(a2);
    -[SCNMTLMeshElement setIndexCount:]((uint64_t)v8, IndexCount);
    SharedIndexBufferOffset = C3DMeshElementGetSharedIndexBufferOffset(a2);
    -[SCNMTLMeshElement setSharedIndexBufferOffset:]((uint64_t)v8, SharedIndexBufferOffset);
    goto LABEL_14;
  }
  if (C3DMeshElementIsVolatile(a2))
    goto LABEL_13;
LABEL_14:
  InstanceCount = C3DMeshElementGetInstanceCount(a2);
  -[SCNMTLMeshElement setInstanceCount:]((uint64_t)v8, InstanceCount);
LABEL_21:
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 240));
  return v8;
}

- (id)_bufferForData:(__CFData *)a3 bytesPerIndex:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;
  NSMapTable *registry;
  SCNMTLBuffer *v9;
  SCNMTLBuffer *v10;
  UInt8 *BytePtr;
  CFIndex Length;
  CFIndex v13;
  uint64_t v14;
  double v15;
  _WORD *v16;
  __int16 v17;
  __C3DEngineStats *engineStats;
  __C3DEngineStats *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_availableBuffers.lock;
  os_unfair_lock_lock(&self->_availableBuffers.lock);
  registry = self->_availableBuffers.registry;
  if (!registry)
  {
    registry = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, 100);
    self->_availableBuffers.registry = registry;
  }
  v9 = -[NSMapTable objectForKey:](registry, "objectForKey:", a3);
  if (v9)
  {
    v10 = v9;
    -[SCNMTLBuffer incrementUsedCount](v9, "incrementUsedCount");
  }
  else
  {
    v10 = objc_alloc_init(SCNMTLBuffer);
    BytePtr = (UInt8 *)CFDataGetBytePtr(a3);
    Length = CFDataGetLength(a3);
    if (BytePtr)
    {
      v13 = Length;
      if (a4 == 1)
      {
        v14 = 2 * Length;
        v15 = MEMORY[0x1E0C80A78](Length);
        if (v13)
        {
          v16 = (_WORD *)((char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
          do
          {
            v17 = *BytePtr++;
            *v16++ = v17;
            --v13;
          }
          while (v13);
        }
        BytePtr = (UInt8 *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", v15);
        engineStats = self->__engineStats;
        ++engineStats->iboCount;
        engineStats->iboMemory += v14;
        -[SCNMTLBuffer setOffset:](v10, "setOffset:", 0);
      }
      else
      {
        BytePtr = (UInt8 *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", BytePtr, Length, 0);
        v19 = self->__engineStats;
        ++v19->iboCount;
        v19->iboMemory += v13;
        -[SCNMTLBuffer setOffset:](v10, "setOffset:", 0);
      }
    }
    -[SCNMTLBuffer setBuffer:](v10, "setBuffer:", BytePtr);

    -[SCNMTLBuffer setDataSource:](v10, "setDataSource:", a3);
    -[SCNMTLBuffer incrementUsedCount](v10, "incrementUsedCount");
    -[NSMapTable setObject:forKey:](self->_availableBuffers.registry, "setObject:forKey:", v10, a3);

  }
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (uint64_t)commandQueue
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)stats
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (SCNMTLShadable)renderResourceForMaterial:(__C3DGeometry *)a3 geometry:(SCNMTLRenderPipeline *)a4 renderPipeline:(uint64_t)a5 engineContext:
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int ValueStorageModificationCount;
  __C3DGeometry *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  float Intensity;
  NSObject *v27;
  const __CFDictionary *v28;
  BOOL v29;
  CFTypeID v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  const __CFDictionary *ValueForKey;
  BOOL v35;
  NSObject *v36;
  size_t v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  id *RenderContext;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char isKindOfClass;
  unint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  CFTypeID v51;
  NSObject *v52;
  NSObject *v53;
  const char *v54;
  uint32_t v55;
  uint64_t v56;
  float FloatProperty;
  float v58;
  uint64_t v59;
  __int128 v60;
  uint64_t EffectSlot;
  uint64_t v62;
  uint64_t ImageTransform;
  uint64_t v64;
  uint64_t v65;
  int v66;
  void *v67;
  uint64_t v68;
  _OWORD *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  _OWORD *v83;
  _OWORD *v84;
  NSObject *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  void *v89;
  char v90;
  char v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t TextureSampler;
  uint64_t Default;
  _OWORD *v99;
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
  const void *v112;
  uint64_t v113;
  CFTypeID v114;
  CFStringRef v115;
  NSObject *v116;
  uint64_t v117;
  NSObject *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  BOOL v124;
  int v125;
  uint64_t i;
  void *v127;
  const void *v128;
  const __CFDictionary *v129;
  CFTypeID v130;
  NSObject *v131;
  uint64_t v132;
  uint64_t v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  uint64_t v139;
  SCNMTLShadableKey *v140;
  unint64_t v143;
  unint64_t v145;
  unint64_t v146;
  SCNMTLShadable *v148;
  NSArray *obj;
  SCNMTLBuffer *v150;
  uint64_t v151;
  uint64_t v152;
  float *CommonProfileIfNoTechnique;
  uint64_t v154;
  uint64_t v155;
  uint64_t v157;
  uint8_t v158;
  char v159[15];
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  char v164;
  _QWORD v165[6];
  uint64_t v166;
  uint64_t *v167;
  uint64_t v168;
  uint64_t v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  uint8_t v174[4];
  uint64_t v175;
  _BYTE v176[128];
  uint8_t v177[4];
  uint64_t v178;
  _OWORD v179[16];
  _BYTE buf[32];
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  _BYTE v195[128];
  uint64_t v196;

  v196 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!a2)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[SCNMTLResourceManager renderResourceForMaterial:geometry:renderPipeline:engineContext:].cold.5(v6, v7, v8);
  }
  if (!a4)
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[SCNMTLResourceManager renderResourceForMaterial:geometry:renderPipeline:engineContext:].cold.4(v9, v10, v11);
  }
  v157 = (uint64_t)a2;
  ValueStorageModificationCount = C3DEntityGetValueStorageModificationCount(a2);
  v13 = a3;
  if (a3)
  {
    v14 = C3DEntityGetValueStorageModificationCount(a3);
    v13 = a3;
  }
  else
  {
    v14 = 0;
  }
  v15 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 416));
  if (!*(_QWORD *)(a1 + 408))
  {
    v15 = a1;
    *(_QWORD *)(a1 + 408) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 100);
    v13 = a3;
  }
  *(_QWORD *)(*(_QWORD *)(v15 + 424) + 8) = v157;
  *(_QWORD *)(*(_QWORD *)(v15 + 424) + 16) = v13;
  *(_QWORD *)(*(_QWORD *)(v15 + 424) + 24) = a4;
  v148 = (SCNMTLShadable *)objc_msgSend(*(id *)(v15 + 408), "objectForKey:", *(_QWORD *)(v15 + 424));
  if (!v148
    || ValueStorageModificationCount != -[SCNMTLShadable materialModificationCount](v148, "materialModificationCount")|| v14 != -[SCNMTLShadable geometryModificationCount](v148, "geometryModificationCount"))
  {
    v148 = objc_alloc_init(SCNMTLShadable);
    -[SCNMTLShadable setMaterialModificationCount:](v148, "setMaterialModificationCount:", ValueStorageModificationCount);
    -[SCNMTLShadable setGeometryModificationCount:](v148, "setGeometryModificationCount:", v14);
    CommonProfileIfNoTechnique = (float *)C3DMaterialGetCommonProfileIfNoTechnique(v157);
    v172 = 0u;
    v173 = 0u;
    v170 = 0u;
    v171 = 0u;
    obj = -[SCNMTLRenderPipeline shadableBufferBindings](a4, "shadableBufferBindings");
    v152 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v170, v195, 16);
    if (!v152)
      goto LABEL_146;
    v151 = *(_QWORD *)v171;
    while (1)
    {
      v154 = 0;
      do
      {
        if (*(_QWORD *)v171 != v151)
          objc_enumerationMutation(obj);
        v155 = *(_QWORD *)(*((_QWORD *)&v170 + 1) + 8 * v154);
        if (objc_msgSend((id)v155, "needsRenderResource"))
        {
          v16 = (void *)objc_msgSend((id)v155, "name");
          v17 = objc_msgSend((id)v155, "type");
          if (v17 != 3)
          {
            if (v17 != 2)
            {
              if (v17)
                goto LABEL_141;
              if (CommonProfileIfNoTechnique
                && objc_msgSend(v16, "isEqualToString:", CFSTR("scn_commonprofile")))
              {
                DWORD2(v189) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 2);
                HIDWORD(v189) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 3);
                DWORD1(v192) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 12);
                DWORD2(v192) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 13);
                HIDWORD(v192) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 14);
                LODWORD(v190) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 7);
                LODWORD(v191) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 4);
                DWORD1(v191) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 6);
                DWORD2(v191) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 5);
                HIDWORD(v191) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 10);
                LODWORD(v192) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 11);
                LODWORD(v193) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 15);
                *(_QWORD *)buf = C3DEffectCommonProfileGetColorModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 2);
                *(_QWORD *)&buf[8] = v18;
                *(_QWORD *)&buf[16] = C3DEffectCommonProfileGetColorModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 3);
                *(_QWORD *)&buf[24] = v19;
                LODWORD(v187) = C3DEffectCommonProfileGetColorLuminanceModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 12);
                DWORD1(v187) = C3DEffectCommonProfileGetColorLuminanceModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 13);
                *(_QWORD *)&v184 = C3DEffectCommonProfileGetColorModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 4);
                *((_QWORD *)&v184 + 1) = v20;
                *(_QWORD *)&v185 = C3DEffectCommonProfileGetColorModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 6);
                *((_QWORD *)&v185 + 1) = v21;
                *(_QWORD *)&v186 = C3DEffectCommonProfileGetColorModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 5);
                *((_QWORD *)&v186 + 1) = v22;
                LODWORD(v189) = C3DEffectCommonProfileGetColorLuminanceModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 10);
                DWORD1(v189) = C3DEffectCommonProfileGetColorLuminanceModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 11);
                if (C3DEffectCommonProfileIsUsingAmbientOcclusion((uint64_t)CommonProfileIfNoTechnique))
                  v23 = 8;
                else
                  v23 = 1;
                *(_QWORD *)&v181 = C3DEffectCommonProfileGetColorModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, v23);
                *((_QWORD *)&v181 + 1) = v24;
                DWORD1(v190) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, v23);
                *(_QWORD *)&v183 = C3DEffectCommonProfileGetColorModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 9);
                *((_QWORD *)&v183 + 1) = v25;
                HIDWORD(v190) = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 9);
                if (C3DWasLinkedBeforeMajorOSYear2017()
                  && C3DEffectCommonProfileIsUsingSelfIllumination((uint64_t)CommonProfileIfNoTechnique))
                {
                  Intensity = 0.0;
                  v182 = 0uLL;
                }
                else
                {
                  *(_QWORD *)&v182 = C3DEffectCommonProfileGetColorModulatedByIntensity((uint64_t)CommonProfileIfNoTechnique, 0);
                  *((_QWORD *)&v182 + 1) = v56;
                  Intensity = C3DEffectCommonProfileGetIntensity((uint64_t)CommonProfileIfNoTechnique, 0);
                }
                *((float *)&v190 + 2) = Intensity;
                *((float *)&v193 + 1) = C3DEffectCommonProfileGetFloatProperty(CommonProfileIfNoTechnique, 16) * 128.0;
                DWORD2(v193) = C3DEffectCommonProfileGetSelfIlluminationOcclusion((uint64_t)CommonProfileIfNoTechnique);
                HIDWORD(v193) = C3DEffectCommonProfileGetFloatProperty(CommonProfileIfNoTechnique, 18);
                FloatProperty = C3DEffectCommonProfileGetFloatProperty(CommonProfileIfNoTechnique, 19);
                v58 = C3DEffectCommonProfileGetFloatProperty(CommonProfileIfNoTechnique, 20);
                v59 = 0;
                *(float *)&v60 = (float)((float)(1.0 - FloatProperty) * (float)(1.0 - FloatProperty))
                               / (float)((float)(FloatProperty + 1.0) * (float)(FloatProperty + 1.0));
                *((float *)&v60 + 1) = 1.0 - *(float *)&v60;
                *((float *)&v60 + 2) = v58;
                v194 = v60;
                memset(v179, 0, sizeof(v179));
                v166 = 0;
                v167 = &v166;
                v168 = 0x2020000000;
                v169 = 0;
                do
                {
                  EffectSlot = C3DEffectCommonProfileGetEffectSlot((uint64_t)CommonProfileIfNoTechnique, (char)v59, 0);
                  v62 = EffectSlot;
                  if (EffectSlot
                    && C3DEffectSlotHasImageOrTexture(EffectSlot)
                    && C3DKeyframeControllerHasInterpolationModesPerKey(v62))
                  {
                    ImageTransform = C3DEffectSlotGetImageTransform(v62);
                    v64 = v167[3];
                    v167[3] = v64 + 1;
                    *((_QWORD *)v179 + v64) = ImageTransform;
                  }
                  ++v59;
                }
                while (v59 != 16);
                v165[0] = MEMORY[0x1E0C809B0];
                v165[1] = 3221225472;
                v165[2] = 0x1DCD8B000;
                v165[3] = &unk_1EA59F528;
                v165[5] = v179;
                v165[4] = &v166;
                C3DEntityEnumerateKeyValuesWithBlock(v157, (uint64_t)v165);
                if (a3)
                  C3DEntityEnumerateKeyValuesWithBlock((uint64_t)a3, (uint64_t)v165);
                if (v167[3] < 1)
                {
                  if (objc_msgSend((id)v155, "argumentEncoder"))
                  {
                    v150 = objc_alloc_init(SCNMTLBuffer);
                    v89 = (void *)objc_msgSend(*(id *)(a1 + 8), "newBufferWithLength:options:", objc_msgSend((id)objc_msgSend((id)v155, "argumentEncoder"), "encodedLength"), 0);
                    -[SCNMTLBuffer setBuffer:](v150, "setBuffer:", v89);

                    objc_msgSend((id)objc_msgSend((id)v155, "argumentEncoder"), "setArgumentBuffer:offset:", -[SCNMTLBuffer buffer](v150, "buffer"), -[SCNMTLBuffer offset](v150, "offset"));
                    v164 = 0;
                    v90 = C3DEnumIterator<C3DEffectProperty,(signed char)0,(signed char)15>::end();
                    if (v90)
                    {
                      v91 = 0;
                      v92 = 27;
                      v93 = 26;
                      do
                      {
                        if (v91 != 8)
                        {
                          v94 = v91;
                          if (v91 == 1)
                          {
                            if (C3DEffectCommonProfileIsUsingAmbientOcclusion((uint64_t)CommonProfileIfNoTechnique))
                              v94 = 8;
                            else
                              v94 = 1;
                          }
                          v95 = C3DEffectCommonProfileGetEffectSlot((uint64_t)CommonProfileIfNoTechnique, v94, 0);
                          if (v95)
                          {
                            v96 = objc_msgSend((id)a1, "renderResourceForEffectSlot:withEngineContext:didFallbackToDefaultTexture:", v95, a5, 0);
                            TextureSampler = C3DEffectSlotGetTextureSampler(v95);
                            if (v96)
                            {
                              Default = TextureSampler;
                              objc_msgSend((id)objc_msgSend((id)v155, "argumentEncoder"), "setTexture:atIndex:", v96, v93);
                              objc_msgSend((id)objc_msgSend((id)v155, "usedResources"), "addObject:", v96);
                              if (!Default)
                                Default = C3DTextureSamplerGetDefault();
                              objc_msgSend((id)objc_msgSend((id)v155, "argumentEncoder"), "setSamplerState:atIndex:", -[SCNMTLResourceManager renderResourceForSampler:](a1, Default), v92);
                            }
                          }
                          v93 += 2;
                          v92 += 2;
                        }
                        ++v91;
                      }
                      while (v91 != v90);
                    }
                    v99 = (_OWORD *)objc_msgSend((id)objc_msgSend((id)v155, "argumentEncoder"), "constantDataAtIndex:", 0);
                    v100 = *(_OWORD *)buf;
                    v101 = *(_OWORD *)&buf[16];
                    v102 = v182;
                    v99[2] = v181;
                    v99[3] = v102;
                    *v99 = v100;
                    v99[1] = v101;
                    v103 = v183;
                    v104 = v184;
                    v105 = v186;
                    v99[6] = v185;
                    v99[7] = v105;
                    v99[4] = v103;
                    v99[5] = v104;
                    v106 = v187;
                    v107 = v188;
                    v108 = v190;
                    v99[10] = v189;
                    v99[11] = v108;
                    v99[8] = v106;
                    v99[9] = v107;
                    v109 = v191;
                    v110 = v192;
                    v111 = v194;
                    v99[14] = v193;
                    v99[15] = v111;
                    v99[12] = v109;
                    v99[13] = v110;
                  }
                  else
                  {
                    v150 = (SCNMTLBuffer *)objc_msgSend(*(id *)(a1 + 64), "newSubBufferWithBytes:length:renderContext:", buf, 256, C3DEngineContextGetRenderContext(a5));
                  }
                  v117 = *(_QWORD *)(a1 + 24);
                  ++*(_DWORD *)(v117 + 240);
                  *(_DWORD *)(v117 + 264) += 256;
                }
                else
                {
                  v150 = objc_alloc_init(SCNMTLBuffer);
                  v65 = v167[3] << 6;
                  v66 = v65 + 256;
                  v67 = (void *)objc_msgSend(*(id *)(a1 + 8), "newBufferWithLength:options:", v65 + 256, 0);
                  v68 = *(_QWORD *)(a1 + 24);
                  ++*(_DWORD *)(v68 + 240);
                  *(_DWORD *)(v68 + 264) += v66;
                  v69 = (_OWORD *)objc_msgSend(v67, "contents");
                  v70 = *(_OWORD *)buf;
                  v71 = *(_OWORD *)&buf[16];
                  v72 = v182;
                  v69[2] = v181;
                  v69[3] = v72;
                  *v69 = v70;
                  v69[1] = v71;
                  v73 = v183;
                  v74 = v184;
                  v75 = v186;
                  v69[6] = v185;
                  v69[7] = v75;
                  v69[4] = v73;
                  v69[5] = v74;
                  v76 = v187;
                  v77 = v188;
                  v78 = v190;
                  v69[10] = v189;
                  v69[11] = v78;
                  v69[8] = v76;
                  v69[9] = v77;
                  v79 = v191;
                  v80 = v192;
                  v81 = v194;
                  v69[14] = v193;
                  v69[15] = v81;
                  v69[12] = v79;
                  v69[13] = v80;
                  if (v167[3] >= 1)
                  {
                    v82 = 0;
                    v83 = v69 + 19;
                    do
                    {
                      v84 = (_OWORD *)*((_QWORD *)v179 + v82);
                      if (!v84)
                      {
                        v85 = scn_default_log();
                        if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
                          -[SCNMTLResourceManager renderResourceForMaterial:geometry:renderPipeline:engineContext:].cold.2(v177, &v178, v85);
                      }
                      v86 = v84[1];
                      v87 = v84[2];
                      v88 = v84[3];
                      *(v83 - 3) = *v84;
                      *(v83 - 2) = v86;
                      *(v83 - 1) = v87;
                      *v83 = v88;
                      ++v82;
                      v83 += 4;
                    }
                    while (v82 < v167[3]);
                  }
                  -[SCNMTLBuffer setBuffer:](v150, "setBuffer:", v67);

                }
                _Block_object_dispose(&v166, 8);
LABEL_140:
                v132 = objc_msgSend((id)v155, "type");
                v145 = v145 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)(v155 + 9);
                -[SCNMTLShadable setResource:ofType:atIndices:](v148, "setResource:ofType:atIndices:", v150, v132);

                goto LABEL_141;
              }
              v150 = objc_alloc_init(SCNMTLBuffer);
              ValueForKey = C3DEntityGetValueForKey(v157, v16);
              v35 = a3 == 0;
              if (ValueForKey)
                v35 = 1;
              if (!v35)
                ValueForKey = C3DEntityGetValueForKey((uint64_t)a3, v16);
              if (!ValueForKey
                && (-[SCNMTLResourceManager renderResourceForMaterial:geometry:renderPipeline:engineContext:]::done & 1) == 0)
              {
                -[SCNMTLResourceManager renderResourceForMaterial:geometry:renderPipeline:engineContext:]::done = 1;
                v36 = scn_default_log();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                {
                  v133 = objc_msgSend((id)v155, "name");
                  v134 = *(char *)(v155 + 9);
                  v135 = *(char *)(v155 + 10);
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v133;
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = v134;
                  *(_WORD *)&buf[18] = 1024;
                  *(_DWORD *)&buf[20] = v135;
                  _os_log_error_impl(&dword_1DCCB8000, v36, OS_LOG_TYPE_ERROR, "Error: missing value for attachment \"%@\" [vertex: %d fragment: %d]", buf, 0x18u);
                }
              }
              v37 = objc_msgSend((id)objc_msgSend((id)v155, "argument"), "bufferDataSize");
              if (-[__CFDictionary conformsToProtocol:](ValueForKey, "conformsToProtocol:", &unk_1F040DC18))
              {
                if (-[__CFDictionary length](ValueForKey, "length") >= v37)
                {
                  -[SCNMTLBuffer setBuffer:](v150, "setBuffer:", ValueForKey);
                }
                else
                {
                  if ((-[SCNMTLResourceManager renderResourceForMaterial:geometry:renderPipeline:engineContext:]::done & 1) == 0)
                  {
                    -[SCNMTLResourceManager renderResourceForMaterial:geometry:renderPipeline:engineContext:]::done = 1;
                    v38 = scn_default_log();
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                    {
                      v136 = *(char *)(v155 + 9);
                      v137 = *(char *)(v155 + 10);
                      v138 = -[__CFDictionary length](ValueForKey, "length");
                      *(_DWORD *)buf = 67109888;
                      *(_DWORD *)&buf[4] = v136;
                      *(_WORD *)&buf[8] = 1024;
                      *(_DWORD *)&buf[10] = v137;
                      *(_WORD *)&buf[14] = 1024;
                      *(_DWORD *)&buf[16] = v37;
                      *(_WORD *)&buf[20] = 1024;
                      *(_DWORD *)&buf[22] = v138;
                      _os_log_error_impl(&dword_1DCCB8000, v38, OS_LOG_TYPE_ERROR, "Error: incorrect buffer size  for attachments vertex [%d] fragments [%d]. Expected:%d Provided:%d", buf, 0x1Au);
                    }
                  }
                  v39 = (void *)objc_msgSend(*(id *)(a1 + 8), "newBufferWithLength:options:", v37, 0);
                  -[SCNMTLBuffer setBuffer:](v150, "setBuffer:", v39);

                  -[SCNMTLBuffer setOffset:](v150, "setOffset:", 0);
                }
                goto LABEL_140;
              }
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();
              if ((isKindOfClass & 1) != 0)
              {
                v47 = -[__CFDictionary length](ValueForKey, "length");
                if (v47 > v37)
                  v37 = v47;
              }
              v48 = (void *)objc_msgSend(*(id *)(a1 + 8), "newBufferWithLength:options:", v37, 0);
              -[SCNMTLBuffer setBuffer:](v150, "setBuffer:", v48);

              -[SCNMTLBuffer setOffset:](v150, "setOffset:", 0);
              v49 = -[SCNMTLBuffer contents](v150, "contents");
              v50 = v49;
              if (ValueForKey)
              {
                v51 = CFGetTypeID(ValueForKey);
                if (v51 == C3DValueGetTypeID())
                {
                  if ((C3DValueWriteToMTLData((uint64_t)ValueForKey, objc_msgSend((id)objc_msgSend((id)v155, "argument"), "bufferDataType"), (uint64_t)v50) & 1) == 0)
                  {
                    v52 = scn_default_log();
                    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)&buf[4] = v16;
                      *(_WORD *)&buf[12] = 2112;
                      *(_QWORD *)&buf[14] = ValueForKey;
                      v53 = v52;
                      v54 = "Error: Argument '%@' : failed to write value to Metal buffer (%@)";
                      v55 = 22;
                      goto LABEL_144;
                    }
                  }
                }
                else if ((isKindOfClass & 1) != 0)
                {
                  v112 = (const void *)-[__CFDictionary bytes](ValueForKey, "bytes");
                  v113 = -[__CFDictionary length](ValueForKey, "length");
                  if (v37 == v113)
                  {
                    memcpy(v50, v112, v37);
                  }
                  else
                  {
                    v118 = scn_default_log();
                    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412802;
                      *(_QWORD *)&buf[4] = v16;
                      *(_WORD *)&buf[12] = 2048;
                      *(_QWORD *)&buf[14] = v113;
                      *(_WORD *)&buf[22] = 2048;
                      *(_QWORD *)&buf[24] = v37;
                      v53 = v118;
                      v54 = "Error: Argument '%@' : mismatch between the NSData and the buffer size %ld != %ld";
                      v55 = 32;
LABEL_144:
                      _os_log_error_impl(&dword_1DCCB8000, v53, OS_LOG_TYPE_ERROR, v54, buf, v55);
                    }
                  }
                }
                else
                {
                  v114 = CFGetTypeID(ValueForKey);
                  v115 = CFCopyTypeIDDescription(v114);
                  v116 = scn_default_log();
                  if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = v16;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v115;
                    _os_log_error_impl(&dword_1DCCB8000, v116, OS_LOG_TYPE_ERROR, "Error: Argument '%@' : only NSData and NSValue are supported for shadable value storage (found '%@'). Please make sure that your custom shader modifier uniform types match the custom properties of the shadable object", buf, 0x16u);
                  }
                  CFRelease(v115);
                }
              }
              else
              {
                bzero(v49, v37);
              }
              if (objc_msgSend((id)objc_msgSend((id)v155, "argument"), "bufferDataType") == 1)
              {
                v119 = -[SCNMTLBuffer contents](v150, "contents");
                v120 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v155, "argument"), "name"), "stringByAppendingString:", CFSTR("."));
                v121 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v155, "argument"), "bufferStructType"), "members");
                v162 = 0u;
                v163 = 0u;
                v160 = 0u;
                v161 = 0u;
                v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v160, v176, 16);
                if (v122)
                {
                  v123 = *(_QWORD *)v161;
                  if (a3)
                    v124 = ValueForKey == 0;
                  else
                    v124 = 0;
                  v125 = v124;
                  do
                  {
                    for (i = 0; i != v122; ++i)
                    {
                      if (*(_QWORD *)v161 != v123)
                        objc_enumerationMutation(v121);
                      v127 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * i);
                      v128 = (const void *)objc_msgSend(v120, "stringByAppendingString:", objc_msgSend(v127, "name"));
                      v129 = C3DEntityGetValueForKey(v157, v128);
                      if (v125)
                        v129 = C3DEntityGetValueForKey((uint64_t)a3, v128);
                      if (v129)
                      {
                        v130 = CFGetTypeID(v129);
                        if (v130 == C3DValueGetTypeID())
                        {
                          C3DValueWriteToStructMember((uint64_t)v129, v127, v119);
                        }
                        else
                        {
                          v131 = scn_default_log();
                          if (os_log_type_enabled(v131, OS_LOG_TYPE_FAULT))
                            -[SCNMTLResourceManager renderResourceForMaterial:geometry:renderPipeline:engineContext:].cold.1(v174, &v175, v131);
                        }
                      }
                    }
                    v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v160, v176, 16);
                  }
                  while (v122);
                }
              }
              goto LABEL_140;
            }
            v28 = C3DEntityGetValueForKey(v157, v16);
            v29 = a3 == 0;
            if (v28)
              v29 = 1;
            if (!v29)
              v28 = C3DEntityGetValueForKey((uint64_t)a3, v16);
            if (v28 && (v30 = CFGetTypeID(v28), v30 == C3DEffectSlotGetTypeID()))
            {
              v31 = objc_msgSend((id)a1, "renderResourceForEffectSlot:withEngineContext:didFallbackToDefaultTexture:", v28, a5, 0);
              v32 = 0;
              v33 = (uint64_t)v28;
              if (v31)
              {
                v33 = (uint64_t)v28;
LABEL_61:
                v42 = objc_msgSend((id)v155, "type");
                v146 = v146 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)(v155 + 9);
                -[SCNMTLShadable setResource:ofType:atIndices:](v148, "setResource:ofType:atIndices:", v31, v42);
                v43 = *(unsigned __int8 *)(v155 + 11);
                v44 = *(unsigned __int8 *)(v155 + 12);
                if (v44 != 255 || (_DWORD)v43 != 255)
                {
                  if ((v32 & 1) != 0 || (v45 = C3DEffectSlotGetTextureSampler(v33)) == 0)
                    v45 = C3DTextureSamplerGetDefault();
                  v143 = v143 & 0xFFFFFFFFFFFF0000 | v43 | (v44 << 8);
                  -[SCNMTLShadable setResource:ofType:atIndices:](v148, "setResource:ofType:atIndices:", -[SCNMTLResourceManager renderResourceForSampler:](a1, v45), 3);
                }
                goto LABEL_141;
              }
            }
            else
            {
              v40 = scn_default_log();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v16;
                _os_log_impl(&dword_1DCCB8000, v40, OS_LOG_TYPE_DEFAULT, "Warning: Missing texture value for %@", buf, 0xCu);
              }
              v33 = 0;
              v32 = 1;
            }
            v31 = *(_QWORD *)(a1 + 496);
            RenderContext = (id *)C3DEngineContextGetRenderContext(a5);
            objc_msgSend(-[SCNMTLRenderContext resourceManagerMonitor](RenderContext), "renderContext:didFallbackToDefaultTextureForSource:message:", RenderContext, v155, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find texture for binding %@ (\"%@\") and effect slot %@ derived from value %@ (geometry=%@, material=%@)"), v155, v16, v33, v28, a3, v157));
            goto LABEL_61;
          }
          v27 = scn_default_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            -[SCNMTLResourceManager renderResourceForMaterial:geometry:renderPipeline:engineContext:].cold.3(&v158, v159, v27);
        }
LABEL_141:
        ++v154;
      }
      while (v154 != v152);
      v139 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v170, v195, 16);
      v152 = v139;
      if (!v139)
      {
LABEL_146:
        v140 = objc_alloc_init(SCNMTLShadableKey);
        v140->_material = (__C3DMaterial *)v157;
        v140->_geometry = a3;
        v140->_pipeline = a4;
        objc_msgSend(*(id *)(a1 + 408), "setObject:forKey:", v148, v140);

        break;
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 416));
  return v148;
}

- (uint64_t)libraryManager
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (id)renderResourceForImage:(__C3DImage *)a3 sampler:(__C3DTextureSampler *)a4 options:(int)a5 engineContext:(__C3DEngineContext *)a6 didFallbackToDefaultTexture:(BOOL *)a7
{
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  $109703B887936C4A394F3A8EBFC1F96D *p_availableImages;
  NSMapTable *registry;
  uint64_t v27;
  MTLTexture *defaultTexture;
  uint64_t RenderContext;
  uint64_t CatalogTextureName;
  uint64_t v31;
  id v32;
  MTLTexture *v33;
  NSObject *v34;
  _BOOL4 v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  void *v40;
  MTLTexture *v41;
  id v42;
  id v43;
  MTLTexture *v44;
  id *v45;
  __C3DEngineContext *v47;
  id *v48;
  unsigned int v49;
  uint64_t v50;

  if (!a3 && (v13 = scn_default_log(), os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)))
  {
    -[SCNMTLResourceManager(Textures) renderResourceForImageProxy:sampler:engineContext:didFallbackToDefaultTexture:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    if (a4)
    {
LABEL_4:
      if (C3DTextureSamplerGetMipFilter((uint64_t)a4))
        goto LABEL_7;
    }
  }
  else if (a4)
  {
    goto LABEL_4;
  }
  if ((a5 & 4) == 0)
  {
    v49 = 0;
    v21 = a5;
    goto LABEL_8;
  }
LABEL_7:
  v21 = a5 | 4;
  v49 = 1;
LABEL_8:
  v22 = a5 & 0xFFFFFF00;
  v23 = 0xC6A4A7935BD1E995 * ((unint64_t)a3 ^ v21 ^ 0x1A929E4D6F47A654 ^ v22);
  v24 = (0xC6A4A7935BD1E995 * (v23 ^ (v23 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v23 ^ (v23 >> 47))) >> 47);
  p_availableImages = &self->_availableImages;
  os_unfair_lock_lock(&self->_availableImages.lock);
  registry = self->_availableImages.registry;
  if (!registry)
  {
    SCNResourceRegistrySetup((uint64_t *)&self->_availableImages, 0);
    registry = p_availableImages->registry;
  }
  v27 = -[NSMapTable objectForKey:](registry, "objectForKey:", v24);
  if (v27)
  {
    defaultTexture = (MTLTexture *)v27;
    goto LABEL_30;
  }
  RenderContext = C3DEngineContextGetRenderContext((uint64_t)a6);
  C3DImageGetName((uint64_t)a3);
  v48 = (id *)RenderContext;
  if (!C3DImageIsCatalogTexture((uint64_t)a3))
  {
    v47 = a6;
    v36 = v22 | v21;
    if ((v21 & 2) != 0 && C3DImageIsConvertibleToCubeMap((uint64_t)a3))
    {
      v37 = -[SCNMTLResourceManager _textureDescriptorFromImage:needsMipMap:textureOptions:](self, "_textureDescriptorFromImage:needsMipMap:textureOptions:", a3, 0, v36);
      v35 = v49;
      if (!v37)
        goto LABEL_29;
      v38 = v36;
      v39 = v37;
      v40 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v37);
      -[SCNMTLResourceManager _copyImage:toTexture:desc:textureOptions:needsMipMapGeneration:](self, "_copyImage:toTexture:desc:textureOptions:needsMipMapGeneration:", a3, v40, v39, v38, 0);
      defaultTexture = -[SCNMTLResourceManager copyTextureByConvertingToCubeMapIfApplicable:engineContext:needsMipmap:](self, "copyTextureByConvertingToCubeMapIfApplicable:engineContext:needsMipmap:", v40, v47, v49);
      v41 = defaultTexture;

    }
    else
    {
      v42 = -[SCNMTLResourceManager _textureDescriptorFromImage:needsMipMap:textureOptions:](self, "_textureDescriptorFromImage:needsMipMap:textureOptions:", a3, v49, v36);
      if (!v42)
        goto LABEL_29;
      v43 = v42;
      defaultTexture = -[SCNMTLResourceManager newTextureWithDescriptor:](self, "newTextureWithDescriptor:", v42);
      v44 = defaultTexture;
      v35 = -[SCNMTLResourceManager _copyImage:toTexture:desc:textureOptions:needsMipMapGeneration:](self, "_copyImage:toTexture:desc:textureOptions:needsMipMapGeneration:", a3, defaultTexture, v43, v22 | v21, v49);
    }
    C3DImageReleaseBitmapCache((uint64_t)a3);
    if (defaultTexture)
      goto LABEL_25;
LABEL_29:
    defaultTexture = self->_defaultTexture;
    objc_msgSend(-[SCNMTLRenderContext resourceManagerMonitor](v48), "renderContext:didFallbackToDefaultTextureForSource:message:", v48, a3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find texture for source %@"), a3));
    -[NSMapTable setObject:forKey:](p_availableImages->registry, "setObject:forKey:", defaultTexture, v24);
    goto LABEL_30;
  }
  CatalogTextureName = C3DImageGetCatalogTextureName((uint64_t)a3);
  v31 = SCNGetResourceBundle();
  v50 = 0;
  v32 = -[SCNMTLResourceManager lazyMTKTextureLoader](self, "lazyMTKTextureLoader");
  defaultTexture = (MTLTexture *)objc_msgSend(v32, "newTextureWithName:scaleFactor:bundle:options:error:", CatalogTextureName, v31, MEMORY[0x1E0C9AA70], &v50, 1.0);
  v33 = defaultTexture;
  if (!defaultTexture)
  {
    v34 = scn_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[SCNMTLResourceManager(Textures) renderResourceForImage:sampler:options:engineContext:didFallbackToDefaultTexture:].cold.1();
  }
  v35 = v49;
  if (!defaultTexture)
    goto LABEL_29;
LABEL_25:
  -[NSMapTable setObject:forKey:](p_availableImages->registry, "setObject:forKey:", defaultTexture, v24);
  if (v35
    && C3DImageGetTextureRawDataMipmapLevelCount((uint64_t)a3, 0) <= 1
    && SCNMTLPixelFormatSupportsMipmapGeneration(-[MTLTexture pixelFormat](defaultTexture, "pixelFormat")))
  {
    v45 = (id *)-[SCNMTLRenderContext resourceBlitEncoder]((uint64_t)v48);
    SCNMTLBlitCommandEncoder::generateMipmapsForTexture(v45, defaultTexture);
  }
LABEL_30:
  os_unfair_lock_unlock(&self->_availableImages.lock);
  if (a7)
    *a7 = self->_defaultTexture == defaultTexture;
  return defaultTexture;
}

- (id)specularDFGDiffuseHammonTextureWithRenderContext:(id)a3
{
  MTLTexture *specularDFGDiffuseHammonTexture;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;

  objc_sync_enter(self);
  specularDFGDiffuseHammonTexture = self->_specularDFGDiffuseHammonTexture;
  if (!specularDFGDiffuseHammonTexture)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, 128, 128, 0);
    objc_msgSend(v6, "setUsage:", 3);
    objc_msgSend(v6, "setStorageMode:", 2);
    self->_specularDFGDiffuseHammonTexture = (MTLTexture *)-[SCNMTLResourceManager newTextureWithDescriptor:](self, "newTextureWithDescriptor:", v6);
    v7 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)-[SCNMTLResourceManager computePipelineStateForKernel:](self, "computePipelineStateForKernel:", CFSTR("compute_specularPreIntegratedDFG_diffuseHammon")));
    v8 = (_QWORD *)-[SCNMTLRenderContext resourceComputeEncoder]((uint64_t)a3);
    bzero(v8, 0x678uLL);
    v9 = (void *)v8[207];
    objc_msgSend(v9, "setComputePipelineState:", v7);
    objc_msgSend(v9, "setTexture:atIndex:", self->_specularDFGDiffuseHammonTexture, 0);
    -[SCNMTLResourceManager dispatchForTexture:computeEncoder:pipelineState:]((uint64_t)self, self->_specularDFGDiffuseHammonTexture, v9, v7);
    specularDFGDiffuseHammonTexture = self->_specularDFGDiffuseHammonTexture;
  }
  objc_sync_exit(self);
  return specularDFGDiffuseHammonTexture;
}

- (id)newTextureWithDescriptor:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (objc_msgSend(a3, "pixelFormat"))
  {
    v5 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", a3);
    if (v5)
    {
      ++self->__engineStats->texCount;
      v6 = objc_msgSend(a3, "width");
      v7 = objc_msgSend(a3, "height") * v6;
      v8 = v7 * objc_msgSend(a3, "depth");
      objc_msgSend(a3, "pixelFormat");
      self->__engineStats->texMemory += (unint64_t)(v8 * SCNMTLPixelFormatGetBitSize()) >> 3;
    }
  }
  else
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SCNMTLResourceManager(Textures) newTextureWithDescriptor:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    return 0;
  }
  return v5;
}

- (id)_textureDescriptorFromImage:(__C3DImage *)a3 needsMipMap:(BOOL)a4 textureOptions:(int)a5
{
  char v5;
  _BOOL4 v6;
  id v9;
  int ImageType;
  uint64_t v11;
  int32x2_t TextureSize;
  int32x2_t v13;
  float v14;
  float v15;
  float v16;
  uint64_t TextureRawData;
  uint64_t v18;
  uint64_t v19;
  CGContext *v20;
  CGContext *v21;
  size_t BitsPerComponent;
  size_t BitsPerPixel;
  size_t v24;
  NSObject *v25;
  float v27;

  v5 = a5;
  v6 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0CC6BB0]);
  ImageType = C3DImageGetImageType((uint64_t)a3);
  objc_msgSend(v9, "setTextureType:", C3DImageTypeToMTLTextureType(ImageType));
  v11 = 1;
  objc_msgSend(v9, "setUsage:", 1);
  objc_msgSend(v9, "setStorageMode:", 0);
  TextureSize = C3DImageGetTextureSize((uint64_t)a3);
  if (*(float *)TextureSize.i32 >= 1.0)
    v14 = *(float *)TextureSize.i32;
  else
    v14 = 1.0;
  objc_msgSend(v9, "setWidth:", (unint64_t)v14, *(_QWORD *)&TextureSize, *(_QWORD *)&v13);
  v15 = v27;
  if (v27 < 1.0)
    v15 = 1.0;
  objc_msgSend(v9, "setHeight:", (unint64_t)v15);
  objc_msgSend(v9, "setDepth:", C3DImageGetDepth((uint64_t)a3));
  if (v6)
  {
    v16 = fmax((double)objc_msgSend(v9, "width"), (double)objc_msgSend(v9, "height"));
    v11 = (int)(float)(floorf(log2f(v16)) + 1.0);
  }
  objc_msgSend(v9, "setMipmapLevelCount:", v11);
  if ((unint64_t)objc_msgSend(v9, "mipmapLevelCount") >= 2 && objc_msgSend(v9, "textureType") == 5)
    objc_msgSend(v9, "setUsage:", objc_msgSend(v9, "usage") | 0x10);
  TextureRawData = C3DImageGetTextureRawData((uint64_t)a3);
  if (TextureRawData)
  {
    v18 = TextureRawData;
    if (C3DLinearRenderingIsEnabled() && !*(_BYTE *)(v18 + 10))
    {
      objc_msgSend(v9, "setMipmapLevelCount:", C3DImageGetTextureRawDataMipmapLevelCount((uint64_t)a3, 0));
      if ((v5 & 1) == 0)
      {
        v19 = SCNMTLPixelFormatSRGBVariant(*(unsigned int *)(v18 + 36));
        goto LABEL_16;
      }
    }
    else
    {
      objc_msgSend(v9, "setMipmapLevelCount:", C3DImageGetTextureRawDataMipmapLevelCount((uint64_t)a3, 0));
    }
    v19 = SCNMTLPixelFormatNonSRGBVariant(*(unsigned int *)(v18 + 36));
LABEL_16:
    objc_msgSend(v9, "setPixelFormat:", v19);
    return v9;
  }
  v20 = (CGContext *)C3DImageCopyBitmap((uint64_t)a3, 1);
  if (v20)
  {
    v21 = v20;
    BitsPerComponent = CGBitmapContextGetBitsPerComponent(v20);
    BitsPerPixel = CGBitmapContextGetBitsPerPixel(v21);
    v24 = BitsPerPixel / BitsPerComponent;
    objc_msgSend(v9, "setPixelFormat:", SCNMTLPixelFormatFromBitmapContextDescription(BitsPerPixel / BitsPerComponent, BitsPerComponent, v21, v5));
    if (v24 == 1 && SCNMTLDeviceSupportsTextureSwizzle(self->_device))
      objc_msgSend(v9, "setSwizzle:", 16908802);
    CGContextRelease(v21);
  }
  else
  {
    v25 = scn_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[SCNMTLResourceManager(Textures) _textureDescriptorFromImage:needsMipMap:textureOptions:].cold.1((uint64_t)a3);
    return 0;
  }
  return v9;
}

- (BOOL)_copyImage:(__C3DImage *)a3 toTexture:(id)a4 desc:(id)a5 textureOptions:(int)a6 needsMipMapGeneration:(BOOL)a7
{
  __C3DImage *v10;
  uint64_t TextureRawData;
  uint64_t v12;
  _BOOL4 IsCubeMap;
  _BOOL4 HasCubeMapComplexLayout;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CFIndex i;
  uint64_t v24;
  uint64_t v25;
  const __CFData *ValueAtIndex;
  CFIndex Length;
  const UInt8 *BytePtr;
  double Size;
  unsigned int v30;
  float v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  size_t v37;
  _QWORD *v38;
  unsigned int v39;
  uint64_t v40;
  size_t v41;
  uint64_t v42;
  unint64_t v43;
  __C3DImage *v44;
  uint64_t v45;
  CGContext *v46;
  NSObject *v47;
  char *Data;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  size_t BytesPerRow;
  size_t BitsPerComponent;
  size_t v59;
  size_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unsigned __int8 j;
  uint64_t k;
  const __CFData *v77;
  CFIndex m;
  const __CFArray *v80;
  BOOL v81;
  float v82;
  const UInt8 *v83;
  unsigned int TextureRawDataMipmapLevelCount;
  uint64_t v85;
  unsigned int ImageType;
  _QWORD v87[6];
  _QWORD v88[13];
  _QWORD v89[7];
  _QWORD v90[13];
  _QWORD v91[12];
  int v92;
  _BYTE v93[9];

  v10 = a3;
  ImageType = C3DImageGetImageType((uint64_t)a3);
  TextureRawData = C3DImageGetTextureRawData((uint64_t)v10);
  if (!TextureRawData)
  {
    v46 = (CGContext *)C3DImageCopyBitmap((uint64_t)v10, 1);
    if (!v46)
    {
      v47 = scn_default_log();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        -[SCNMTLResourceManager(Textures) _copyImage:toTexture:desc:textureOptions:needsMipMapGeneration:].cold.2((uint64_t)v10);
    }
    v85 = (uint64_t)v10;
    Data = (char *)CGBitmapContextGetData(v46);
    if (!Data)
    {
      v49 = scn_default_log();
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        if (!v46)
          goto LABEL_21;
        goto LABEL_20;
      }
      -[SCNMTLResourceManager(Textures) _copyImage:toTexture:desc:textureOptions:needsMipMapGeneration:].cold.1(v49, v50, v51, v52, v53, v54, v55, v56);
      if (v46)
      {
LABEL_20:
        CFRelease(v46);
        v46 = 0;
      }
    }
LABEL_21:
    BytesPerRow = CGBitmapContextGetBytesPerRow(v46);
    BitsPerComponent = CGBitmapContextGetBitsPerComponent(v46);
    v59 = (CGBitmapContextGetBitsPerPixel(v46) / BitsPerComponent * BitsPerComponent) >> 3;
    v60 = v59 * objc_msgSend(a5, "width");
    v61 = objc_msgSend(a5, "width");
    v62 = objc_msgSend(a5, "height");
    if (ImageType == 2)
    {
      v63 = objc_msgSend(a5, "width");
      v64 = objc_msgSend(a5, "depth");
      v89[0] = MEMORY[0x1E0C809B0];
      v89[1] = 3221225472;
      v89[2] = __98__SCNMTLResourceManager_Textures___copyImage_toTexture_desc_textureOptions_needsMipMapGeneration___block_invoke_4;
      v89[3] = &unk_1EA59FA40;
      v89[4] = a5;
      v89[5] = a4;
      v89[6] = v60;
      C3DImageEnumerateTexture3DSlicePixelBuffers(2, v63, v64, BytesPerRow, v60, v59, Data, (uint64_t)v89);
      if (!v46)
        return a7;
    }
    else
    {
      v73 = v62;
      if (C3DImageIsCubeMap(v85))
      {
        v74 = objc_msgSend(a5, "width");
        v88[0] = MEMORY[0x1E0C809B0];
        v88[1] = 3221225472;
        v88[2] = __98__SCNMTLResourceManager_Textures___copyImage_toTexture_desc_textureOptions_needsMipMapGeneration___block_invoke_2_5;
        v88[3] = &unk_1EA59FA18;
        memset(&v88[6], 0, 24);
        v88[9] = v61;
        v88[10] = v73;
        v88[11] = 1;
        v88[12] = v60;
        v88[4] = a4;
        v88[5] = a5;
        C3DImageEnumerateCubeMapFacePixelBuffers(ImageType, v74, BytesPerRow, v60, v59, (uint64_t)Data, (uint64_t)v88);
        if (!v46)
          return a7;
      }
      else
      {
        memset(v87, 0, 24);
        v87[3] = v61;
        v87[4] = v73;
        v87[5] = 1;
        objc_msgSend(a4, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v87, 0, 0, Data, v60, objc_msgSend(a5, "height") * v60);
        if (!v46)
          return a7;
      }
    }
    CFRelease(v46);
    return a7;
  }
  v12 = TextureRawData;
  IsCubeMap = C3DImageIsCubeMap((uint64_t)v10);
  HasCubeMapComplexLayout = C3DImageHasCubeMapComplexLayout((uint64_t)v10);
  v93[0] = 0;
  TextureRawDataMipmapLevelCount = C3DImageGetTextureRawDataMipmapLevelCount((uint64_t)v10, v93);
  if (TextureRawDataMipmapLevelCount > (unint64_t)objc_msgSend(a5, "mipmapLevelCount"))
  {
    v15 = scn_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[SCNMTLResourceManager(Textures) _copyImage:toTexture:desc:textureOptions:needsMipMapGeneration:].cold.4(v15, v16, v17, v18, v19, v20, v21, v22);
  }
  v81 = a7;
  if (IsCubeMap)
  {
    if (HasCubeMapComplexLayout)
    {
      if (TextureRawDataMipmapLevelCount)
      {
        for (i = 0; i != TextureRawDataMipmapLevelCount; ++i)
        {
          v24 = objc_msgSend(a5, "width");
          v25 = objc_msgSend(a5, "height");
          ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v12 + 40), i);
          Length = CFDataGetLength(ValueAtIndex);
          BytePtr = CFDataGetBytePtr(ValueAtIndex);
          Size = C3DImageGetSize((uint64_t)v10);
          v31 = (float)Length;
          if (*(unsigned __int8 *)(v12 + 7) < 2u)
          {
            v43 = (unint64_t)*(unsigned __int8 *)(v12 + 4) >> 3;
            v82 = *(float *)&Size;
            v83 = BytePtr;
            v44 = v10;
            v45 = objc_msgSend(a5, "width") * v43;
            v36 = objc_msgSend(a5, "width");
            v90[0] = MEMORY[0x1E0C809B0];
            v90[1] = 3221225472;
            v90[2] = __98__SCNMTLResourceManager_Textures___copyImage_toTexture_desc_textureOptions_needsMipMapGeneration___block_invoke_2;
            v90[3] = &unk_1EA59FA18;
            memset(&v90[6], 0, 24);
            v90[9] = v24;
            v90[10] = v25;
            v90[11] = 1;
            v90[12] = v45;
            v90[4] = a4;
            v90[5] = a5;
            v38 = v90;
            v39 = ImageType;
            v40 = (uint64_t)(float)(v31 / v82);
            v37 = v45;
            v10 = v44;
            v41 = v43;
            v42 = (uint64_t)v83;
          }
          else
          {
            LOBYTE(v30) = *(_BYTE *)(v12 + 8);
            v32 = (uint64_t)(float)((float)(v31 / *((float *)&Size + 1)) * (float)v30);
            v33 = (unint64_t)*(unsigned __int8 *)(v12 + 4) >> 3;
            LODWORD(v33) = objc_msgSend(a5, "width") / (unint64_t)*(unsigned __int8 *)(v12 + 7) * v33;
            v34 = objc_msgSend(a5, "height");
            v35 = *(unsigned __int8 *)(v12 + 8);
            v91[0] = MEMORY[0x1E0C809B0];
            v91[1] = 3221225472;
            v91[2] = __98__SCNMTLResourceManager_Textures___copyImage_toTexture_desc_textureOptions_needsMipMapGeneration___block_invoke;
            v91[3] = &unk_1EA59F9F0;
            memset(&v91[5], 0, 24);
            v91[4] = a4;
            v91[8] = v24;
            v91[9] = v25;
            v36 = v34 / v35;
            v37 = v33;
            v92 = v33;
            v91[10] = 1;
            v91[11] = v34 / v35;
            v38 = v91;
            v39 = ImageType;
            v40 = v32;
            v41 = 0;
            v42 = (uint64_t)BytePtr;
          }
          C3DImageEnumerateCubeMapFacePixelBuffers(v39, v36, v40, v37, v41, v42, (uint64_t)v38);
        }
      }
    }
    else if (v93[0])
    {
      if (TextureRawDataMipmapLevelCount)
      {
        for (j = 0; j < TextureRawDataMipmapLevelCount; ++j)
        {
          for (k = 0; k != 6; ++k)
          {
            v77 = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v12 + 40), 6 * j + k);
            replaceSlice(a4, a5, k, j, v77, v12);
          }
        }
      }
    }
    else
    {
      for (m = 0; m != 6; ++m)
      {
        v80 = (const __CFArray *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v12 + 40), m);
        replaceRegion(a4, a5, m, v80, v12);
      }
    }
  }
  else
  {
    replaceRegion(a4, a5, 0, *(CFArrayRef *)(v12 + 40), v12);
  }
  a7 = TextureRawDataMipmapLevelCount < 2 && v81;
  if (!a4)
  {
    v65 = scn_default_log();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      -[SCNMTLResourceManager(Textures) _copyImage:toTexture:desc:textureOptions:needsMipMapGeneration:].cold.3(v65, v66, v67, v68, v69, v70, v71, v72);
  }
  return a7;
}

- (void)renderResourceForSampler:(uint64_t)a1
{
  uint64_t Default;
  void *v4;
  void *v5;
  id v6;
  int MinFilter;
  int MagFilter;
  int MipFilter;
  int WrapModeS;
  int WrapModeT;
  int WrapModeP;
  float Anisotropy;

  if (!a1)
    return 0;
  Default = a2;
  if (!a2)
    Default = C3DTextureSamplerGetDefault();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
  v4 = *(void **)(a1 + 152);
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, 100);
    *(_QWORD *)(a1 + 152) = v4;
  }
  v5 = (void *)objc_msgSend(v4, "objectForKey:", C3DMeshSourceGetMTLVertexFormat(Default));
  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CC6B80]);
    MinFilter = C3DTextureSamplerGetMinFilter(Default);
    objc_msgSend(v6, "setMinFilter:", C3DFilterModeToMTLFilter(MinFilter));
    MagFilter = C3DTextureSamplerGetMagFilter(Default);
    objc_msgSend(v6, "setMagFilter:", C3DFilterModeToMTLFilter(MagFilter));
    MipFilter = C3DTextureSamplerGetMipFilter(Default);
    objc_msgSend(v6, "setMipFilter:", C3DFilterModeToMTLMipFilter(MipFilter));
    WrapModeS = C3DTextureSamplerGetWrapModeS(Default);
    objc_msgSend(v6, "setSAddressMode:", C3DWrapModeToMTLAddressMode(WrapModeS));
    WrapModeT = C3DTextureSamplerGetWrapModeT(Default);
    objc_msgSend(v6, "setTAddressMode:", C3DWrapModeToMTLAddressMode(WrapModeT));
    WrapModeP = C3DTextureSamplerGetWrapModeP(Default);
    objc_msgSend(v6, "setRAddressMode:", C3DWrapModeToMTLAddressMode(WrapModeP));
    Anisotropy = C3DTextureSamplerGetAnisotropy(Default);
    if (Anisotropy < 1.0)
      Anisotropy = 1.0;
    objc_msgSend(v6, "setMaxAnisotropy:", (unint64_t)fminf(Anisotropy, 16.0));
    v5 = (void *)objc_msgSend(*(id *)(a1 + 8), "newSamplerStateWithDescriptor:", v6);

    objc_msgSend(*(id *)(a1 + 152), "setObject:forKey:", v5, C3DMeshSourceGetMTLVertexFormat(Default));
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  return v5;
}

- (id)computePipelineStateForKernel:(id)a3
{
  return -[SCNMTLResourceManager _computePipelineStateForKernel:constants:constantsHash:threadGroupSizeIsMultipleOfThreadExecutionWidth:](self, "_computePipelineStateForKernel:constants:constantsHash:threadGroupSizeIsMultipleOfThreadExecutionWidth:", a3, 0, 0, 0);
}

- (id)newRenderPipelineStateWithDesc:(id *)a3
{
  id v5;
  id v6;
  SCNMTLRenderPipeline *v7;
  SCNMTLLibraryManager *libraryManager;
  $A49D611864553F0D08D037E9411B91D8 var15;
  __int128 v10;
  __int128 v11;
  _QWORD v13[6];
  _BYTE v14[344];
  _OWORD __dst[22];

  if (a3->var1)
  {
    memcpy(__dst, a3, 0x158uLL);
    v5 = _pipelineDescriptorForPipelineDesc((uint64_t)__dst);
    if (v5)
    {
      v6 = v5;
      v7 = objc_alloc_init(SCNMTLRenderPipeline);
      memcpy(__dst, a3, 0x158uLL);
      -[SCNMTLResourceManager _createPipelineStateWithDescriptor:desc:pipeline:](self, "_createPipelineStateWithDescriptor:desc:pipeline:", v6, __dst, v7);
      ++self->__engineStats->prgCount;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v7 = objc_alloc_init(SCNMTLRenderPipeline);
    memcpy(__dst, a3, 0x158uLL);
    SCNMTLRenderPipelineDescRetain((uint64_t)__dst);
    libraryManager = self->_libraryManager;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__SCNMTLResourceManager_Compilation__newRenderPipelineStateWithDesc___block_invoke;
    v13[3] = &unk_1EA5A52C8;
    memcpy(v14, a3, sizeof(v14));
    v13[4] = self;
    v13[5] = v7;
    var15 = a3->var0.var15;
    __dst[4] = *(_OWORD *)&a3->var0.var8;
    __dst[5] = var15;
    *(_QWORD *)&__dst[6] = a3->var0.var16;
    v10 = *(_OWORD *)&a3->var0.var2;
    __dst[0] = *(_OWORD *)&a3->var0.var0;
    __dst[1] = v10;
    v11 = *(_OWORD *)&a3->var0.var6;
    __dst[2] = *(_OWORD *)&a3->var0.var4;
    __dst[3] = v11;
    -[SCNMTLLibraryManager libraryForProgramDesc:completionHandler:](libraryManager, "libraryForProgramDesc:completionHandler:", __dst, v13);
  }
  return v7;
}

- (id)radianceTextureForPrecomputedLightingEnvironment:(id)a3
{
  uint64_t *p_availableRadianceTextures;
  os_unfair_lock_s *p_lock;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  p_availableRadianceTextures = (uint64_t *)&self->_availableRadianceTextures;
  p_lock = &self->_availableRadianceTextures.lock;
  os_unfair_lock_lock(&self->_availableRadianceTextures.lock);
  v7 = (void *)*p_availableRadianceTextures;
  if (!*p_availableRadianceTextures)
  {
    SCNResourceRegistrySetup(p_availableRadianceTextures, 0);
    v7 = (void *)*p_availableRadianceTextures;
  }
  v8 = objc_msgSend(v7, "objectForKey:", a3);
  if (v8)
  {
    v9 = (id)v8;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v10 = objc_msgSend(a3, "radianceData");
    v28 = *MEMORY[0x1E0CC6C08];
    v29[0] = MEMORY[0x1E0C9AAA0];
    v9 = -[SCNMTLResourceManager newTextureUsingMTKTextureLoaderWithData:options:](self, "newTextureUsingMTKTextureLoaderWithData:options:", v10, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1));
    if (objc_msgSend(v9, "textureType") != 5)
    {
      v11 = scn_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[SCNMTLResourceManager(PBR) radianceTextureForPrecomputedLightingEnvironment:].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    if (objc_msgSend(v9, "pixelFormat") != 115)
    {
      v19 = scn_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        -[SCNMTLResourceManager(PBR) radianceTextureForPrecomputedLightingEnvironment:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
    }
    objc_msgSend((id)*p_availableRadianceTextures, "setObject:forKey:", v9, a3);
    os_unfair_lock_unlock(p_lock);

  }
  return v9;
}

- (id)irradianceTextureForPrecomputedLightingEnvironment:(id)a3
{
  uint64_t *p_availableIrradianceTextures;
  os_unfair_lock_s *p_lock;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  p_availableIrradianceTextures = (uint64_t *)&self->_availableIrradianceTextures;
  p_lock = &self->_availableIrradianceTextures.lock;
  os_unfair_lock_lock(&self->_availableIrradianceTextures.lock);
  v7 = (void *)*p_availableIrradianceTextures;
  if (!*p_availableIrradianceTextures)
  {
    SCNResourceRegistrySetup(p_availableIrradianceTextures, 0);
    v7 = (void *)*p_availableIrradianceTextures;
  }
  v8 = objc_msgSend(v7, "objectForKey:", a3);
  if (v8)
  {
    v9 = (id)v8;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v10 = objc_msgSend(a3, "irradianceData");
    v28 = *MEMORY[0x1E0CC6C08];
    v29[0] = MEMORY[0x1E0C9AAA0];
    v9 = -[SCNMTLResourceManager newTextureUsingMTKTextureLoaderWithData:options:](self, "newTextureUsingMTKTextureLoaderWithData:options:", v10, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1));
    if (objc_msgSend(v9, "textureType") != 5)
    {
      v11 = scn_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[SCNMTLResourceManager(PBR) irradianceTextureForPrecomputedLightingEnvironment:].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    if (objc_msgSend(v9, "pixelFormat") != 115)
    {
      v19 = scn_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        -[SCNMTLResourceManager(PBR) irradianceTextureForPrecomputedLightingEnvironment:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
    }
    objc_msgSend((id)*p_availableIrradianceTextures, "setObject:forKey:", v9, a3);
    os_unfair_lock_unlock(p_lock);

  }
  return v9;
}

- (SCNMTLResourceManager)initWithDevice:(id)a3
{
  SCNMTLResourceManager *v4;
  SCNMTLResourceManager *v5;
  MTLCommandQueue *v6;
  __C3DEngineStats *v7;
  void *v8;
  uint64_t SharedInstance;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SCNMTLResourceManager;
  v4 = -[SCNMTLResourceManager init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_device = (MTLDevice *)a3;
    if (!C3DUseOneCommandQueuePerDevice())
    {
LABEL_5:
      v5->_libraryManager = -[SCNMTLLibraryManager initWithDevice:]([SCNMTLLibraryManager alloc], "initWithDevice:", v5->_device);
      v7 = (__C3DEngineStats *)malloc_type_calloc(0x358uLL, 1uLL, 0x9B9AE688uLL);
      v5->__engineStats = v7;
      -[SCNMTLLibraryManager _setEngineStats:](v5->_libraryManager, "_setEngineStats:", v7);
      v5->_bindingsGenerator = objc_alloc_init(SCNMTLShaderBindingsGenerator);
      v5->_commonProfileBuffersAllocator = -[SCNMTLBufferAllocator initWithDevice:fixedSizeElement:buffersize:name:]([SCNMTLBufferAllocator alloc], "initWithDevice:fixedSizeElement:buffersize:name:", v5->_device, 256, 0x40000, CFSTR("SCNMaterialData"));
      v5->_availablePipelineStates = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
      v5->_availablePipelineStatesLock._os_unfair_lock_opaque = 0;
      v5->_availableLightingSystemReflectionProbeTextures.lock._os_unfair_lock_opaque = 0;
      v5->_availableIrradianceTextures.lock._os_unfair_lock_opaque = 0;
      v5->_availableRadianceTextures.lock._os_unfair_lock_opaque = 0;
      v5->_availableIESTextures.lock._os_unfair_lock_opaque = 0;
      v5->_availableImages.lock._os_unfair_lock_opaque = 0;
      v5->_availableImageProxy.lock._os_unfair_lock_opaque = 0;
      v5->_availableSamplers.lock._os_unfair_lock_opaque = 0;
      v5->_availableMeshes.lock._os_unfair_lock_opaque = 0;
      v5->_availableDeformerStacks.lock._os_unfair_lock_opaque = 0;
      v5->_availableSkinDeformerReadOnlyBuffers.lock._os_unfair_lock_opaque = 0;
      v5->_availableMorphDeformerReadOnlyBuffers.lock._os_unfair_lock_opaque = 0;
      v5->_availableTessellators.lock._os_unfair_lock_opaque = 0;
      v5->_availableComputePipelines.lock._os_unfair_lock_opaque = 0;
      v5->_availableComputePipelinesWithStageDescriptor.lock._os_unfair_lock_opaque = 0;
      v5->_availableColorMatchingComputePipelines.lock._os_unfair_lock_opaque = 0;
      v5->_availableBuffers.lock._os_unfair_lock_opaque = 0;
      v5->_availableMeshSources.lock._os_unfair_lock_opaque = 0;
      v5->_availableMeshElements.lock._os_unfair_lock_opaque = 0;
      v5->_availableRasterizerStates.lock._os_unfair_lock_opaque = 0;
      v5->_availableWireframeMaterials.lock._os_unfair_lock_opaque = 0;
      v5->_availableOpenSubdivComputeEvaluators.lock._os_unfair_lock_opaque = 0;
      v5->_availableShadables.lock._os_unfair_lock_opaque = 0;
      v5->_availableShadablesSearchKey = objc_alloc_init(SCNMTLShadableKey);
      v5->_availableStageDescriptors = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v5->_stageDescriptorsLock._os_unfair_lock_opaque = 0;
      v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__meshSourceWillDie_, CFSTR("kC3DNotificationMeshSourceWillDie"), 0);
      objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__meshElementWillDie_, CFSTR("kC3DNotificationMeshElementWillDie"), 0);
      objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__meshWillDie_, CFSTR("kC3DNotificationMeshWillDie"), 0);
      objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__imageWillDie_, CFSTR("kC3DNotificationImageWillDie"), 0);
      objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__imageProxyWillDie_, CFSTR("kC3DNotificationImageProxyWillDie"), 0);
      objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__programWillDie_, CFSTR("kC3DNotificationProgramWillDie"), 0);
      objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__passWillDie_, CFSTR("kC3DNotificationPassWillDie"), 0);
      objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__materialWillDie_, CFSTR("kC3DNotificationMaterialWillDie"), 0);
      objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__geometryWillDie_, CFSTR("kC3DNotificationGeometryWillDie"), 0);
      objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__morphWillDie_, CFSTR("kC3DNotificationMorphWillDie"), 0);
      objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__skinWillDie_, CFSTR("kC3DNotificationSkinWillDie"), 0);
      objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__deformerStackWillDie_, CFSTR("kC3DNotificationDeformerStackWillDie"), 0);
      objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__deformerStackDidChange_, CFSTR("kC3DNotificationDeformerStackDidChange"), 0);
      objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__programHashCodeWillDie_, CFSTR("kC3DNotificationProgramHashCodeWillDie"), 0);
      objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__precomputedLightingEnvironmentWillDie_, CFSTR("kC3DNotificationPrecomputedLightingEnvironmentWillDie"), 0);
      v5->_defaultProgram = (__C3DFXMetalProgram *)C3DFXMetalProgramCreateFromDefaultLibrary(CFSTR("debug_vert"), CFSTR("debug_frag"));
      v5->_defaultProgramForTessellation = (__C3DFXMetalProgram *)C3DFXMetalProgramCreateFromDefaultLibrary(CFSTR("debug_post_tessellation_vert"), CFSTR("debug_frag"));
      v5->_isolateProgram = (__C3DFXMetalProgram *)C3DFXMetalProgramCreateFromDefaultLibrary(CFSTR("debug_vert"), CFSTR("debug_isolate_frag"));
      SharedInstance = C3DNotificationCenterGetSharedInstance();
      C3DNotificationCenterAddObserver(SharedInstance, v5, (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))_rasterizerStateDidDie, CFSTR("kC3DNotificationRasterizerStatesDidDie"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      return v5;
    }
    v6 = (MTLCommandQueue *)objc_msgSend(a3, "newCommandQueue");
    if (v6)
    {
      v5->_commandQueue = v6;
      -[MTLCommandQueue setLabel:](v6, "setLabel:", CFSTR("com.apple.SceneKit"));
      goto LABEL_5;
    }
    v11 = scn_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SCNMTLResourceManager initWithDevice:].cold.1(v11, v12, v13);
    return 0;
  }
  return v5;
}

- (id)newTextureUsingMTKTextureLoaderWithData:(id)a3 options:(id)a4
{
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v18;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6C40]), "initWithDevice:", -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self));
  if (!v6)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[SCNMTLResourceManager(Textures) newTextureUsingMTKTextureLoaderWithURL:options:].cold.2(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v18 = 0;
  v15 = (void *)objc_msgSend(v6, "newTextureWithData:options:error:", a3, a4, &v18);

  if (v18)
  {
    v16 = scn_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SCNMTLResourceManager(Textures) newTextureUsingMTKTextureLoaderWithURL:options:].cold.1(&v18);
    return 0;
  }
  return v15;
}

- (uint64_t)newConstantBufferWithLength:(uint64_t)a3 options:
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v3 = a2;
    v4 = result;
    result = objc_msgSend(*(id *)(result + 8), "newBufferWithLength:options:", a2, a3);
    v5 = *(_QWORD *)(v4 + 24);
    ++*(_DWORD *)(v5 + 240);
    *(_DWORD *)(v5 + 264) += v3;
  }
  return result;
}

+ (SCNMTLResourceManager)resourceManagerForDevice:(uint64_t)a1
{
  SCNMTLResourceManager *v3;

  objc_opt_self();
  if (+[SCNMTLResourceManager resourceManagerForDevice:]::onceToken != -1)
    dispatch_once(&+[SCNMTLResourceManager resourceManagerForDevice:]::onceToken, &__block_literal_global_21);
  os_unfair_lock_lock((os_unfair_lock_t)&__resourceManagersLock);
  v3 = (SCNMTLResourceManager *)objc_msgSend((id)__resourceManagers, "objectForKey:", a2);
  if (!v3)
  {
    v3 = -[SCNMTLResourceManager initWithDevice:]([SCNMTLResourceManager alloc], "initWithDevice:", a2);
    objc_msgSend((id)__resourceManagers, "setObject:forKey:", v3, a2);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__resourceManagersLock);
  return v3;
}

- (uint64_t)dispatchForTexture:(void *)a3 computeEncoder:(void *)a4 pipelineState:
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD v14[3];
  _QWORD v15[3];

  if (result)
  {
    v7 = objc_msgSend(a4, "threadExecutionWidth");
    v8 = objc_msgSend(a2, "width");
    if (v7 >= v8)
      v9 = v8;
    else
      v9 = v7;
    v10 = objc_msgSend(a2, "height");
    if (v7 >= v10)
      v7 = v10;
    v11 = objc_msgSend(a4, "maxTotalThreadsPerThreadgroup");
    do
    {
      v12 = v7;
      v13 = v7 * v9;
      v7 >>= 1;
    }
    while (v13 > v11);
    v15[0] = (v9 + objc_msgSend(a2, "width") - 1) / v9;
    v15[1] = (v12 + objc_msgSend(a2, "height") - 1) / v12;
    v15[2] = 1;
    v14[0] = v9;
    v14[1] = v12;
    v14[2] = 1;
    return objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", v15, v14);
  }
  return result;
}

- (id)_computePipelineStateForKernel:(id)a3 constants:(id)a4 constantsHash:(id)a5 threadGroupSizeIsMultipleOfThreadExecutionWidth:(BOOL)a6
{
  uint64_t *p_availableComputePipelines;
  os_unfair_lock_s *p_lock;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  _QWORD v25[4];
  BOOL v26;
  _BYTE v27[7];

  p_availableComputePipelines = (uint64_t *)&self->_availableComputePipelines;
  p_lock = &self->_availableComputePipelines.lock;
  os_unfair_lock_lock(&self->_availableComputePipelines.lock);
  if (*p_availableComputePipelines)
  {
    if (!a4)
    {
LABEL_8:
      v21 = a3;
      if (a5)
        v21 = (id)objc_msgSend(a3, "stringByAppendingString:", a5);
      goto LABEL_10;
    }
  }
  else
  {
    SCNResourceRegistrySetup(p_availableComputePipelines, 1);
    if (!a4)
      goto LABEL_8;
  }
  if (a5)
    goto LABEL_8;
  v13 = scn_default_log();
  v21 = a3;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    -[SCNMTLResourceManager(Compilation) _computePipelineStateForKernel:constants:constantsHash:threadGroupSizeIsMultipleOfThreadExecutionWidth:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    v21 = a3;
  }
LABEL_10:
  v22 = (id)objc_msgSend((id)*p_availableComputePipelines, "objectForKey:", v21);
  if (!v22)
  {
    v23 = -[SCNMTLLibraryManager frameworkLibrary](self->_libraryManager, "frameworkLibrary");
    v25[0] = a3;
    v25[1] = a4;
    v25[2] = 0;
    v25[3] = 0;
    v26 = a6;
    memset(v27, 0, sizeof(v27));
    v22 = -[SCNMTLResourceManager newComputePipelineStateForDesc:library:](self, "newComputePipelineStateForDesc:library:", v25, v23);
    if (v22)
    {
      objc_msgSend((id)*p_availableComputePipelines, "setObject:forKey:", v22, v21);

    }
  }
  os_unfair_lock_unlock(p_lock);
  return v22;
}

- (id)newComputePipelineStateForDesc:(id *)a3 library:(id)a4
{
  __int128 v5;
  id v6;
  void *v7;
  SCNMTLComputePipeline *v8;
  _OWORD v10[2];
  uint64_t v11;

  v5 = *(_OWORD *)&a3->var2;
  v10[0] = *(_OWORD *)&a3->var0;
  v10[1] = v5;
  v11 = *(_QWORD *)&a3->var4;
  v6 = -[SCNMTLResourceManager _newComputeDescriptorForPipelineDesc:library:](self, "_newComputeDescriptorForPipelineDesc:library:", v10, a4);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = objc_alloc_init(SCNMTLComputePipeline);
  -[SCNMTLResourceManager _configureComputePipeline:withDescriptor:](self, "_configureComputePipeline:withDescriptor:", v8, v7);

  return v8;
}

- (id)_newComputeDescriptorForPipelineDesc:(id *)a3 library:(id)a4
{
  id v6;
  id var1;
  uint64_t v8;
  void *v9;
  void (**var3)(id, void *, id);
  NSObject *v11;
  NSObject *v12;
  uint64_t v14;

  v6 = objc_alloc_init(MEMORY[0x1E0CC6A80]);
  var1 = a3->var1;
  if (!var1)
  {
    v9 = (void *)objc_msgSend(a4, "newFunctionWithName:", a3->var0);
    if (v9)
      goto LABEL_5;
    v12 = scn_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SCNMTLResourceManager(Compilation) _newComputeDescriptorForPipelineDesc:library:].cold.1();
LABEL_12:

    return 0;
  }
  v14 = 0;
  v8 = objc_msgSend(a4, "newFunctionWithName:constantValues:error:", a3->var0, var1, &v14);
  if (!v8)
  {
    v11 = scn_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SCNMTLResourceManager(Compilation) _newComputeDescriptorForPipelineDesc:library:].cold.2();
    goto LABEL_12;
  }
  v9 = (void *)v8;
LABEL_5:
  objc_msgSend(v6, "setComputeFunction:", v9);

  var3 = (void (**)(id, void *, id))a3->var3;
  if (var3)
    var3[2](var3, v9, a3->var2);
  objc_msgSend(v6, "setThreadGroupSizeIsMultipleOfThreadExecutionWidth:", a3->var4);
  objc_msgSend(v6, "setStageInputDescriptor:", a3->var2);
  return v6;
}

- (void)_configureComputePipeline:(id)a3 withDescriptor:(id)a4
{
  double v7;
  char *v8;
  NSObject *v9;
  uint64_t v10;

  v10 = 0;
  ++self->__engineStats->computePipelineCount;
  v7 = CACurrentMediaTime();
  v8 = (char *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](self->_device, "newComputePipelineStateWithDescriptor:options:reflection:error:", a4, 0, 0, &v10);
  self->__engineStats->computePipelineCompilationTime = CACurrentMediaTime()
                                                      - v7
                                                      + self->__engineStats->computePipelineCompilationTime;
  if (v8)
  {
    -[SCNMTLComputePipeline setComputeFunction:](a3, (char *)objc_msgSend(a4, "computeFunction"));
    -[SCNMTLComputePipeline setState:](a3, v8);

  }
  else
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SCNMTLResourceManager(Compilation) _configureComputePipeline:withDescriptor:].cold.1();
  }
}

- (id)computeEvaluatorWithContext:(MTLContext *)a3 srcDesc:(const BufferDescriptor *)a4 dstDesc:(const BufferDescriptor *)a5 duDesc:(const BufferDescriptor *)a6 dvDesc:(const BufferDescriptor *)a7
{
  unint64_t v12;
  unint64_t v13;
  uint64_t *p_availableOpenSubdivComputeEvaluators;
  os_unfair_lock_s *p_lock;
  void *v16;
  SCNMTLOpenSubdivComputeEvaluator *v17;
  MTLContext *v18;
  uint64_t v19;

  v12 = 0xC6A4A7935BD1E995
      * ((0xC6A4A7935BD1E995
        * ((0xC6A4A7935BD1E995
          * ((0xC6A4A7935BD1E995 * *(_QWORD *)&a4->var1) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)&a4->var1) >> 47))) ^ 0x4FB7DAE84DD6F2FCLL)) ^ a5->var2);
  v13 = (0xC6A4A7935BD1E995 * (v12 ^ (v12 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v12 ^ (v12 >> 47))) >> 47);
  p_availableOpenSubdivComputeEvaluators = (uint64_t *)&self->_availableOpenSubdivComputeEvaluators;
  p_lock = &self->_availableOpenSubdivComputeEvaluators.lock;
  os_unfair_lock_lock(&self->_availableOpenSubdivComputeEvaluators.lock);
  v16 = (void *)*p_availableOpenSubdivComputeEvaluators;
  if (!*p_availableOpenSubdivComputeEvaluators)
  {
    SCNResourceRegistrySetup(p_availableOpenSubdivComputeEvaluators, 0);
    v16 = (void *)*p_availableOpenSubdivComputeEvaluators;
  }
  v17 = (SCNMTLOpenSubdivComputeEvaluator *)objc_msgSend(v16, "objectForKey:", v13);
  if (!v17)
  {
    v17 = objc_alloc_init(SCNMTLOpenSubdivComputeEvaluator);
    v19 = OpenSubdiv::v3_1_1::Osd::MTLComputeEvaluator::Create(a4, a5, a6, a7, a3, v18);
    if (v17)
      v17->_computeEvaluator = (MTLComputeEvaluator *)v19;
    objc_msgSend((id)*p_availableOpenSubdivComputeEvaluators, "setObject:forKey:", v17, v13);

  }
  os_unfair_lock_unlock(p_lock);
  return v17;
}

+ (void)unregisterManagerForDevice:(id)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&__resourceManagersLock);
  objc_msgSend((id)__resourceManagers, "removeObjectForKey:", a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&__resourceManagersLock);
}

- (void)dealloc
{
  __C3DFXMetalProgram *defaultProgram;
  __C3DFXMetalProgram *defaultProgramForTessellation;
  __C3DFXMetalProgram *isolateProgram;
  objc_super v6;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);

  self->_availableLightingSystemReflectionProbeTextures.registry = 0;
  self->_availableIrradianceTextures.registry = 0;

  self->_availableRadianceTextures.registry = 0;
  self->_availableIESTextures.registry = 0;

  self->_availableImages.registry = 0;
  self->_availableImageProxy.registry = 0;

  self->_availableSamplers.registry = 0;
  self->_availableMeshes.registry = 0;

  self->_availableDeformerStacks.registry = 0;
  self->_availableSkinDeformerReadOnlyBuffers.registry = 0;

  self->_availableMorphDeformerReadOnlyBuffers.registry = 0;
  self->_availableTessellators.registry = 0;

  self->_availableComputePipelines.registry = 0;
  self->_availableComputePipelinesWithStageDescriptor.registry = 0;

  self->_availableColorMatchingComputePipelines.registry = 0;
  self->_availableBuffers.registry = 0;

  self->_availableMeshSources.registry = 0;
  self->_availableMeshElements.registry = 0;

  self->_availableRasterizerStates.registry = 0;
  self->_availableWireframeMaterials.registry = 0;

  self->_availableOpenSubdivComputeEvaluators.registry = 0;
  self->_availableShadables.registry = 0;
  CFRelease(self->_availablePipelineStates);

  defaultProgram = self->_defaultProgram;
  if (defaultProgram)
  {
    CFRelease(defaultProgram);
    self->_defaultProgram = 0;
  }
  defaultProgramForTessellation = self->_defaultProgramForTessellation;
  if (defaultProgramForTessellation)
  {
    CFRelease(defaultProgramForTessellation);
    self->_defaultProgramForTessellation = 0;
  }
  isolateProgram = self->_isolateProgram;
  if (isolateProgram)
  {
    CFRelease(isolateProgram);
    self->_isolateProgram = 0;
  }

  free(self->__engineStats);
  self->__engineStats = 0;

  +[SCNMTLResourceManager unregisterManagerForDevice:](SCNMTLResourceManager, "unregisterManagerForDevice:", self->_device);
  v6.receiver = self;
  v6.super_class = (Class)SCNMTLResourceManager;
  -[SCNMTLResourceManager dealloc](&v6, sel_dealloc);
}

- (void)_meshSourceWillDie:(id)a3
{
  uint64_t valuePtr;

  valuePtr = 0;
  CFNumberGetValue((CFNumberRef)objc_msgSend(a3, "object"), kCFNumberLongType, &valuePtr);
  os_unfair_lock_lock(&self->_availableMeshSources.lock);
  -[NSMapTable removeObjectForKey:](self->_availableMeshSources.registry, "removeObjectForKey:", valuePtr);
  os_unfair_lock_unlock(&self->_availableMeshSources.lock);
}

- (void)_meshElementWillDie:(id)a3
{
  id v4;
  uint64_t valuePtr;

  valuePtr = 0;
  CFNumberGetValue((CFNumberRef)objc_msgSend(a3, "object"), kCFNumberLongType, &valuePtr);
  os_unfair_lock_lock(&self->_availableMeshElements.lock);
  v4 = -[NSMapTable objectForKey:](self->_availableMeshElements.registry, "objectForKey:", valuePtr);
  if (!objc_msgSend((id)-[SCNMTLMeshElement indexBuffer]((uint64_t)v4), "decrementUsedCount"))
  {
    os_unfair_lock_lock(&self->_availableBuffers.lock);
    -[NSMapTable removeObjectForKey:](self->_availableBuffers.registry, "removeObjectForKey:", objc_msgSend((id)-[SCNMTLMeshElement indexBuffer]((uint64_t)v4), "dataSource"));
    os_unfair_lock_unlock(&self->_availableBuffers.lock);
  }
  -[NSMapTable removeObjectForKey:](self->_availableMeshElements.registry, "removeObjectForKey:", valuePtr);
  os_unfair_lock_unlock(&self->_availableMeshElements.lock);
}

uint64_t __38__SCNMTLResourceManager__meshWillDie___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend(a3, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(a3, "removeObjectForKey:", *(_QWORD *)(a1 + 32) | 1);
}

uint64_t __38__SCNMTLResourceManager__meshWillDie___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend(a3, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(a3, "removeObjectForKey:", *(_QWORD *)(a1 + 32) | 1);
}

- (void)_morphWillDie:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "object");
  os_unfair_lock_lock(&self->_availableMorphDeformerReadOnlyBuffers.lock);
  -[NSMapTable removeObjectForKey:](self->_availableMorphDeformerReadOnlyBuffers.registry, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_availableMorphDeformerReadOnlyBuffers.lock);
}

- (void)_skinWillDie:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "object");
  os_unfair_lock_lock(&self->_availableSkinDeformerReadOnlyBuffers.lock);
  -[NSMapTable removeObjectForKey:](self->_availableSkinDeformerReadOnlyBuffers.registry, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_availableSkinDeformerReadOnlyBuffers.lock);
}

- (void)_deformerStackWillDie:(id)a3
{
  os_unfair_lock_s *p_lock;
  uint64_t v6;

  p_lock = &self->_availableDeformerStacks.lock;
  os_unfair_lock_lock(&self->_availableDeformerStacks.lock);
  v6 = objc_msgSend(a3, "object");
  -[NSMapTable removeObjectForKey:](self->_availableDeformerStacks.registry, "removeObjectForKey:", v6);
  -[NSMapTable removeObjectForKey:](self->_availableDeformerStacks.registry, "removeObjectForKey:", v6 | 1);
  os_unfair_lock_unlock(p_lock);
}

- (void)_deformerStackDidChange:(id)a3
{
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  _BOOL4 v7;
  NSMapTable *registry;
  uint64_t v9;
  uint64_t v10;
  id v11;

  p_lock = &self->_availableDeformerStacks.lock;
  os_unfair_lock_lock(&self->_availableDeformerStacks.lock);
  v6 = objc_msgSend(a3, "object");
  v7 = C3DDeformerStackWantsGPU(v6);
  registry = self->_availableDeformerStacks.registry;
  v9 = v6 | 1;
  if (v7)
  {
    v10 = -[NSMapTable objectForKey:](registry, "objectForKey:", v6);
    v11 = -[NSMapTable objectForKey:](self->_availableDeformerStacks.registry, "objectForKey:", v9);
    -[SCNMTLDeformerStack invalidate](v10);
    -[SCNMTLDeformerStack invalidate]((uint64_t)v11);
  }
  else
  {
    -[NSMapTable removeObjectForKey:](registry, "removeObjectForKey:", v6);
    -[NSMapTable removeObjectForKey:](self->_availableDeformerStacks.registry, "removeObjectForKey:", v6 | 1);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_imageWillDie:(id)a3
{
  uint64_t i;
  unint64_t v5;
  unint64_t v6;
  id v7;
  id v8;
  uint64_t valuePtr;

  valuePtr = 0;
  CFNumberGetValue((CFNumberRef)objc_msgSend(a3, "object"), kCFNumberLongType, &valuePtr);
  os_unfair_lock_lock(&self->_availableImages.lock);
  for (i = 0; i != 16; ++i)
  {
    v5 = 0xC6A4A7935BD1E995
       * ((0xC6A4A7935BD1E995 * (i ^ 0x1A929E4D6F47A654 ^ valuePtr)) ^ ((0xC6A4A7935BD1E995
                                                                           * (i ^ 0x1A929E4D6F47A654 ^ valuePtr)) >> 47));
    v6 = v5 ^ (v5 >> 47);
    v7 = -[NSMapTable objectForKey:](self->_availableImages.registry, "objectForKey:", v6);
    if (v7)
    {
      v8 = v7;
      os_unfair_lock_lock(&self->_availableIrradianceTextures.lock);
      -[NSMapTable removeObjectForKey:](self->_availableIrradianceTextures.registry, "removeObjectForKey:", v8);
      os_unfair_lock_unlock(&self->_availableIrradianceTextures.lock);
      os_unfair_lock_lock(&self->_availableRadianceTextures.lock);
      -[NSMapTable removeObjectForKey:](self->_availableRadianceTextures.registry, "removeObjectForKey:", v8);
      os_unfair_lock_unlock(&self->_availableRadianceTextures.lock);
      -[NSMapTable removeObjectForKey:](self->_availableImages.registry, "removeObjectForKey:", v6);
    }
  }
  os_unfair_lock_unlock(&self->_availableImages.lock);
}

- (void)_imageProxyWillDie:(id)a3
{
  uint64_t valuePtr;

  valuePtr = 0;
  CFNumberGetValue((CFNumberRef)objc_msgSend(a3, "object"), kCFNumberLongType, &valuePtr);
  os_unfair_lock_lock(&self->_availableImageProxy.lock);
  -[NSMapTable removeObjectForKey:](self->_availableImageProxy.registry, "removeObjectForKey:", valuePtr);
  os_unfair_lock_unlock(&self->_availableImageProxy.lock);
}

- (void)_precomputedLightingEnvironmentWillDie:(id)a3
{
  uint64_t valuePtr;

  valuePtr = 0;
  CFNumberGetValue((CFNumberRef)objc_msgSend(a3, "object"), kCFNumberLongType, &valuePtr);
  os_unfair_lock_lock(&self->_availableIrradianceTextures.lock);
  -[NSMapTable removeObjectForKey:](self->_availableIrradianceTextures.registry, "removeObjectForKey:", valuePtr);
  os_unfair_lock_unlock(&self->_availableIrradianceTextures.lock);
  os_unfair_lock_lock(&self->_availableRadianceTextures.lock);
  -[NSMapTable removeObjectForKey:](self->_availableRadianceTextures.registry, "removeObjectForKey:", valuePtr);
  os_unfair_lock_unlock(&self->_availableRadianceTextures.lock);
}

- (void)_rasterizerStateDidDie:(const void *)a3
{
  -[NSMapTable removeObjectForKey:](self->_availableRasterizerStates.registry, "removeObjectForKey:", a3);
}

- (void)_passWillDie:(id)a3
{
  uint64_t v4;
  os_unfair_lock_s *p_lock;
  NSMapTable *registry;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "object");
  p_lock = &self->_availableShadables.lock;
  os_unfair_lock_lock(&self->_availableShadables.lock);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  registry = self->_availableShadables.registry;
  v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](registry, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(registry);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (*(_QWORD *)(*(_QWORD *)(v12 + 24) + 24) == v4)
        {
          if (!v9)
            v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v9, "addObject:", v12);
        }
      }
      v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](registry, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
    p_lock = &self->_availableShadables.lock;
    if (v9)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v18;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v18 != v15)
              objc_enumerationMutation(v9);
            -[NSMapTable removeObjectForKey:](self->_availableShadables.registry, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j));
          }
          v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        }
        while (v14);
      }

    }
  }
  os_unfair_lock_unlock(p_lock);
  -[SCNMTLResourceManager _removeMatchingProgram:pass:](self, "_removeMatchingProgram:pass:", 0, v4);
}

- (void)_geometryWillDie:(id)a3
{
  uint64_t v4;
  NSMapTable *registry;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "object");
  os_unfair_lock_lock(&self->_availableShadables.lock);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  registry = self->_availableShadables.registry;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](registry, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(registry);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (*(_QWORD *)(v11 + 16) == v4)
        {
          if (!v8)
            v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v8, "addObject:", v11);
        }
      }
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](registry, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
    if (v8)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v17;
        do
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v17 != v14)
              objc_enumerationMutation(v8);
            -[NSMapTable removeObjectForKey:](self->_availableShadables.registry, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j));
          }
          v13 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        }
        while (v13);
      }

    }
  }
  os_unfair_lock_unlock(&self->_availableShadables.lock);
  os_unfair_lock_lock(&self->_availableTessellators.lock);
  -[NSMapTable removeObjectForKey:](self->_availableTessellators.registry, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_availableTessellators.lock);
}

- (void)removeAllShaders
{
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 32), "clearCompiledLibraries");
    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 48));
  }
}

- (void)resetRasterizerStates
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 256);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 256));

    *(_QWORD *)(a1 + 248) = 0;
    os_unfair_lock_unlock(v2);
  }
}

- (id)_bufferForMTLBuffer:(void *)a3
{
  os_unfair_lock_s *p_lock;
  NSMapTable *registry;
  SCNMTLBuffer *v7;
  SCNMTLBuffer *v8;

  p_lock = &self->_availableBuffers.lock;
  os_unfair_lock_lock(&self->_availableBuffers.lock);
  registry = self->_availableBuffers.registry;
  if (!registry)
  {
    registry = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, 100);
    self->_availableBuffers.registry = registry;
  }
  v7 = -[NSMapTable objectForKey:](registry, "objectForKey:", a3);
  if (v7)
  {
    v8 = v7;
    -[SCNMTLBuffer incrementUsedCount](v7, "incrementUsedCount");
  }
  else
  {
    v8 = objc_alloc_init(SCNMTLBuffer);
    -[SCNMTLBuffer setBuffer:](v8, "setBuffer:", a3);
    -[SCNMTLBuffer setDataSource:](v8, "setDataSource:", a3);
    -[SCNMTLBuffer incrementUsedCount](v8, "incrementUsedCount");
    -[NSMapTable setObject:forKey:](self->_availableBuffers.registry, "setObject:forKey:", v8, a3);

  }
  os_unfair_lock_unlock(p_lock);
  return v8;
}

+ (void)_fillVertexDescriptor:(id)a3 withMeshSource:(__C3DMeshSource *)a4 semantic:(char)a5 inputSet:(int64_t)a6 bufferIndex:(int64_t)a7
{
  _fillVertexDescriptor(a3, (uint64_t)a4, a5, a6, a7);
}

+ (void)_fillVertexDescriptor:(id)a3 withSemantic:(char)a4 inputSet:(int64_t)a5 bufferIndex:(int64_t)a6 vertexFormat:(unint64_t)a7 offset:(unint64_t)a8 stride:(unint64_t)a9
{
  char v13;
  NSObject *v14;
  int64_t v15;

  v13 = 0;
  switch(a4)
  {
    case 0:
      break;
    case 1:
      v13 = 1;
      break;
    case 2:
      v13 = 3;
      break;
    case 3:
      if (a5 == -1)
      {
        v13 = 6;
      }
      else
      {
        v13 = a5 + 6;
        if ((a5 + 6) == 14)
          goto LABEL_6;
      }
      break;
    case 4:
      v13 = 2;
      break;
    case 5:
      v13 = 4;
      break;
    case 6:
      v13 = 5;
      break;
    default:
LABEL_6:
      v14 = scn_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        _fillVertexDescriptor();
      v13 = 14;
      break;
  }
  v15 = a6 + 18;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", v13), "setFormat:", a7);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", v13), "setOffset:", a8);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", v13), "setBufferIndex:", v15);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", v15), "setStride:", a9);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", v15), "setStepFunction:", 1);
}

- (void)__updateMutableMesh:(__C3DMesh *)a3 withMetalMesh:(id)a4
{
  uint64_t MutabilityTimeStamp;
  _QWORD v8[6];

  MutabilityTimeStamp = C3DMeshGetMutabilityTimeStamp((uint64_t)a3);
  if (MutabilityTimeStamp != -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)a4))
  {
    -[SCNMTLMesh setMutabilityTimestamp:]((uint64_t)a4, MutabilityTimeStamp);
    os_unfair_lock_lock(&self->_availableMeshSources.lock);
    if (!self->_availableMeshSources.registry)
      self->_availableMeshSources.registry = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, 100);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__SCNMTLResourceManager___updateMutableMesh_withMetalMesh___block_invoke;
    v8[3] = &unk_1EA59F488;
    v8[4] = self;
    v8[5] = a4;
    C3DMeshApplySources((uint64_t)a3, 1, (uint64_t)v8);
    os_unfair_lock_unlock(&self->_availableMeshSources.lock);
  }
}

void *__59__SCNMTLResourceManager___updateMutableMesh_withMetalMesh___block_invoke(uint64_t a1, uint64_t a2)
{
  void *result;
  const __CFData *Data;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  const UInt8 *BytePtr;
  CFIndex Length;
  NSObject *v12;

  result = (void *)C3DMeshSourceIsMutable(a2);
  if ((_DWORD)result)
  {
    result = (void *)C3DMeshSourceGetMTLBuffer(a2);
    if (!result)
    {
      Data = (const __CFData *)C3DMeshSourceGetData(a2);
      v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "objectForKey:", Data);
      if (objc_msgSend((id)-[SCNMTLMesh buffers](*(_QWORD *)(a1 + 40)), "indexOfObject:", v6) == 0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = scn_default_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
          __59__SCNMTLResourceManager___updateMutableMesh_withMetalMesh___block_invoke_cold_2(v7, v8, v9);
      }
      BytePtr = CFDataGetBytePtr(Data);
      Length = CFDataGetLength(Data);
      if (Length != objc_msgSend(v6, "length"))
      {
        v12 = scn_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          __59__SCNMTLResourceManager___updateMutableMesh_withMetalMesh___block_invoke_cold_1(Length, v6, v12);
      }
      return memcpy((void *)objc_msgSend(v6, "contents"), BytePtr, Length);
    }
  }
  return result;
}

- (id)renderResourceForDeformerStack:(__C3DDeformerStack *)a3 node:(__C3DNode *)a4 dataKind:(unsigned __int8)a5
{
  unint64_t v9;
  os_unfair_lock_s *p_lock;
  NSMapTable *registry;
  _QWORD *v12;

  v9 = (a5 == 0) | (unint64_t)a3;
  p_lock = &self->_availableDeformerStacks.lock;
  os_unfair_lock_lock(&self->_availableDeformerStacks.lock);
  registry = self->_availableDeformerStacks.registry;
  if (!registry)
  {
    registry = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, 100);
    self->_availableDeformerStacks.registry = registry;
  }
  v12 = -[NSMapTable objectForKey:](registry, "objectForKey:", v9);
  if (!v12)
  {
    v12 = -[SCNMTLDeformerStack initWithDeformers:node:dataKind:resourceManager:]([SCNMTLDeformerStack alloc], (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)self);
    -[NSMapTable setObject:forKey:](self->_availableDeformerStacks.registry, "setObject:forKey:", v12, v9);

  }
  os_unfair_lock_unlock(p_lock);
  return v12;
}

- (id)renderResourceForSkinner:(__C3DSkinner *)a3 baseMesh:(__C3DMesh *)a4 dataKind:(unsigned __int8)a5 provider:(id)a6
{
  int v7;
  os_unfair_lock_s *p_lock;
  uint64_t OverrideMaterial;
  id v13;
  unint64_t v14;
  NSMapTable *registry;
  uint64_t v16;
  void *v17;
  _QWORD v19[8];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;

  v7 = a5;
  p_lock = &self->_availableSkinDeformerReadOnlyBuffers.lock;
  os_unfair_lock_lock(&self->_availableSkinDeformerReadOnlyBuffers.lock);
  if (!self->_availableSkinDeformerReadOnlyBuffers.registry)
    self->_availableSkinDeformerReadOnlyBuffers.registry = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, 100);
  OverrideMaterial = C3DGeometryGetOverrideMaterial((uint64_t)a3);
  v13 = -[NSMapTable objectForKey:](self->_availableSkinDeformerReadOnlyBuffers.registry, "objectForKey:", OverrideMaterial);
  if (!v13)
  {
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, 1);
    -[NSMapTable setObject:forKey:](self->_availableSkinDeformerReadOnlyBuffers.registry, "setObject:forKey:", v13, OverrideMaterial);

  }
  v14 = (v7 == 0) | (unint64_t)a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = 0;
  v25 = objc_msgSend(v13, "objectForKey:", v14);
  if (!v21[5])
  {
    registry = self->_availableSkinDeformerReadOnlyBuffers.registry;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __77__SCNMTLResourceManager_renderResourceForSkinner_baseMesh_dataKind_provider___block_invoke;
    v19[3] = &unk_1EA59F500;
    v19[6] = &v20;
    v19[7] = OverrideMaterial;
    v19[4] = v13;
    v19[5] = v14;
    -[NSMapTable scn_enumerateKeysAndValuesUsingBlock:](registry, "scn_enumerateKeysAndValuesUsingBlock:", v19);
    v16 = v21[5];
    if (!v16)
    {
      v16 = (*((uint64_t (**)(id))a6 + 2))(a6);
      v21[5] = v16;
    }
    objc_msgSend(v13, "setObject:forKey:", v16, v14);
  }
  os_unfair_lock_unlock(p_lock);
  v17 = (void *)v21[5];
  _Block_object_dispose(&v20, 8);
  return v17;
}

uint64_t __77__SCNMTLResourceManager_renderResourceForSkinner_baseMesh_dataKind_provider___block_invoke(uint64_t result, _QWORD *a2, void *a3, _BYTE *a4)
{
  uint64_t v6;

  if (*(void **)(result + 32) != a3)
  {
    v6 = result;
    result = +[SCNMTLSkinDeformer canSkin:reuseRenderResourceForSkin:]((uint64_t)SCNMTLSkinDeformer, *(_QWORD **)(result + 56), a2);
    if ((_DWORD)result)
    {
      result = objc_msgSend(a3, "objectForKey:", *(_QWORD *)(v6 + 40));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 48) + 8) + 40) = result;
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 48) + 8) + 40))
        *a4 = 1;
    }
  }
  return result;
}

- (id)renderResourceForMorpher:(__C3DMorpher *)a3 baseMesh:(__C3DMesh *)a4 dataKind:(unsigned __int8)a5 provider:(id)a6
{
  int v7;
  os_unfair_lock_s *p_lock;
  uint64_t OverrideMaterial;
  id v13;
  unint64_t v14;
  NSMapTable *registry;
  uint64_t v16;
  void *v17;
  _QWORD v19[8];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;

  v7 = a5;
  p_lock = &self->_availableMorphDeformerReadOnlyBuffers.lock;
  os_unfair_lock_lock(&self->_availableMorphDeformerReadOnlyBuffers.lock);
  if (!self->_availableMorphDeformerReadOnlyBuffers.registry)
    self->_availableMorphDeformerReadOnlyBuffers.registry = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, 100);
  OverrideMaterial = C3DGeometryGetOverrideMaterial((uint64_t)a3);
  v13 = -[NSMapTable objectForKey:](self->_availableMorphDeformerReadOnlyBuffers.registry, "objectForKey:", OverrideMaterial);
  if (!v13)
  {
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, 1);
    -[NSMapTable setObject:forKey:](self->_availableMorphDeformerReadOnlyBuffers.registry, "setObject:forKey:", v13, OverrideMaterial);

  }
  v14 = (v7 == 0) | (unint64_t)a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = 0;
  v25 = objc_msgSend(v13, "objectForKey:", v14);
  if (!v21[5])
  {
    registry = self->_availableMorphDeformerReadOnlyBuffers.registry;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __77__SCNMTLResourceManager_renderResourceForMorpher_baseMesh_dataKind_provider___block_invoke;
    v19[3] = &unk_1EA59F500;
    v19[6] = &v20;
    v19[7] = OverrideMaterial;
    v19[4] = v13;
    v19[5] = v14;
    -[NSMapTable scn_enumerateKeysAndValuesUsingBlock:](registry, "scn_enumerateKeysAndValuesUsingBlock:", v19);
    v16 = v21[5];
    if (!v16)
    {
      v16 = (*((uint64_t (**)(id))a6 + 2))(a6);
      v21[5] = v16;
    }
    objc_msgSend(v13, "setObject:forKey:", v16, v14);
  }
  os_unfair_lock_unlock(p_lock);
  v17 = (void *)v21[5];
  _Block_object_dispose(&v20, 8);
  return v17;
}

uint64_t __77__SCNMTLResourceManager_renderResourceForMorpher_baseMesh_dataKind_provider___block_invoke(uint64_t result, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;

  if (*(void **)(result + 32) != a3)
  {
    v6 = result;
    result = +[SCNMTLMorphDeformer canMorph:reuseRenderResourceForMorph:]();
    if ((_DWORD)result)
    {
      result = objc_msgSend(a3, "objectForKey:", *(_QWORD *)(v6 + 40));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 48) + 8) + 40) = result;
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 48) + 8) + 40))
        *a4 = 1;
    }
  }
  return result;
}

- (SCNMTLTessellator)renderResourceForTessellatedGeometry:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  void *v5;
  SCNMTLTessellator *v6;

  if (!a1)
    return 0;
  v4 = (os_unfair_lock_s *)(a1 + 368);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 368));
  v5 = *(void **)(a1 + 360);
  if (!v5)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, 100);
    *(_QWORD *)(a1 + 360) = v5;
  }
  v6 = (SCNMTLTessellator *)objc_msgSend(v5, "objectForKey:", a2);
  if (!v6)
  {
    v6 = -[SCNMTLTessellator initWithGeometry:resourceManager:]([SCNMTLTessellator alloc], "initWithGeometry:resourceManager:", a2, a1);
    objc_msgSend(*(id *)(a1 + 360), "setObject:forKey:", v6, a2);

  }
  os_unfair_lock_unlock(v4);
  return v6;
}

- (SCNMetalWireframeResource)wireframeResourceForRendererElement:(uint64_t)a3 engineContext:(unsigned __int8 *)a4 passInstance:(uint64_t)a5 hashPass:
{
  uint64_t RenderContext;
  uint64_t ProgramHashCodeStore;
  uint64_t ProgramHashCodeForRenderElement;
  uint64_t v13;
  os_unfair_lock_s *v14;
  void *v15;
  SCNMetalWireframeResource *v16;
  uint64_t Material;
  const void *v18;
  unsigned int CommonProfileConditioners;
  uint64_t v20;
  int v21;
  char v22;
  const void *v23;
  __C3DFXProgram *v24;
  void *v25;
  void *v26;
  __C3DFXProgram *program;
  void *v28;
  uint64_t programHashCode;
  void *v30;
  const void *MeshElement;
  uint64_t Mesh;
  __C3DGeometry *Geometry;
  _QWORD *Node;

  if (!a1)
    return 0;
  RenderContext = C3DEngineContextGetRenderContext(a3);
  ProgramHashCodeStore = C3DEngineContextGetProgramHashCodeStore(a3);
  ProgramHashCodeForRenderElement = C3DProgramHashCodeStoreGetProgramHashCodeForRenderElement(ProgramHashCodeStore, a2, 0, a5);
  if (!ProgramHashCodeForRenderElement)
    return 0;
  v13 = ProgramHashCodeForRenderElement;
  v14 = (os_unfair_lock_s *)(a1 + 384);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 384));
  v15 = *(void **)(a1 + 376);
  if (!v15)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, 100);
    *(_QWORD *)(a1 + 376) = v15;
  }
  v16 = (SCNMetalWireframeResource *)objc_msgSend(v15, "objectForKey:", v13);
  if (!v16)
  {
    Node = (_QWORD *)C3DRendererElementGetNode((uint64_t)a2);
    Geometry = (__C3DGeometry *)C3DRendererElementGetGeometry((uint64_t)a2);
    Mesh = C3DRendererElementGetMesh((uint64_t)a2);
    MeshElement = C3DRendererElementGetMeshElement((uint64_t)a2);
    Material = C3DRendererElementGetMaterial((uint64_t)a2);
    v18 = (const void *)C3DMaterialCopyForFlatShading(Material);
    CommonProfileConditioners = C3DEngineContextGetCommonProfileConditioners(a3);
    v20 = a4[24];
    v21 = (8 * (a4[27] & 3)) & 0x9F | (a2[36] >> 11) & 7 | (32 * (a4[28] & 3));
    if (-[SCNMTLRenderContext reverseZ](RenderContext))
      v22 = 0x80;
    else
      v22 = 0;
    v23 = (const void *)C3DProgramHashCodeCreate(Node, Geometry, Mesh, (uint64_t)MeshElement, 0, (uint64_t)v18, (v20 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)(v21 | v22) << 24) | CommonProfileConditioners);
    v24 = C3DEngineContextEvaluateProgramWithHashCode(a3, (uint64_t)v23, Material, 0);
    v16 = objc_alloc_init(SCNMetalWireframeResource);
    v25 = v16->material;
    if (v25 != v18)
    {
      if (v25)
      {
        CFRelease(v25);
        v16->material = 0;
      }
      if (v18)
        v26 = (void *)CFRetain(v18);
      else
        v26 = 0;
      v16->material = v26;
    }
    program = (__C3DFXProgram *)v16->program;
    v14 = (os_unfair_lock_s *)(a1 + 384);
    if (program != v24)
    {
      if (program)
      {
        CFRelease(program);
        v16->program = 0;
      }
      if (v24)
        v28 = (void *)CFRetain(v24);
      else
        v28 = 0;
      v16->program = v28;
    }
    programHashCode = (uint64_t)v16->programHashCode;
    if ((const void *)programHashCode != v23)
    {
      C3DProgramHashCodeRelease(programHashCode);
      if (v23)
        v30 = (void *)CFRetain(v23);
      else
        v30 = 0;
      v16->programHashCode = v30;
    }
    objc_msgSend(*(id *)(a1 + 376), "setObject:forKey:", v16, v13);

    CFRelease(v18);
    C3DProgramHashCodeRelease((uint64_t)v23);
  }
  os_unfair_lock_unlock(v14);
  return v16;
}

- (uint64_t)newBufferWithBytes:(uint64_t)a3 length:(uint64_t)a4 options:
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v4 = a3;
    v5 = result;
    result = objc_msgSend(*(id *)(result + 8), "newBufferWithBytes:length:options:", a2, a3, a4);
    v6 = *(_QWORD *)(v5 + 24);
    ++*(_DWORD *)(v6 + 228);
    *(_DWORD *)(v6 + 256) += v4;
  }
  return result;
}

- (uint64_t)newPrivateBufferWithBytes:(uint64_t)a3 length:(void *)a4 blitEncoder:
{
  uint64_t v8;
  void *v9;
  uint64_t v10;

  if (!a1)
    return 0;
  v8 = objc_msgSend(*(id *)(a1 + 8), "newBufferWithLength:options:", a3, 32);
  v9 = (void *)objc_msgSend(*(id *)(a1 + 8), "newBufferWithBytes:length:options:", a2, a3, 0);
  objc_msgSend(a4, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v9, 0, v8, 0, a3);

  v10 = *(_QWORD *)(a1 + 24);
  ++*(_DWORD *)(v10 + 228);
  *(_DWORD *)(v10 + 256) += a3;
  return v8;
}

- (uint64_t)newBufferWithLength:(uint64_t)a3 options:
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v3 = a2;
    v4 = result;
    result = objc_msgSend(*(id *)(result + 8), "newBufferWithLength:options:", a2, a3);
    v5 = *(_QWORD *)(v4 + 24);
    ++*(_DWORD *)(v5 + 228);
    *(_DWORD *)(v5 + 256) += v3;
  }
  return result;
}

uint64_t __89__SCNMTLResourceManager_renderResourceForMaterial_geometry_renderPipeline_engineContext___block_invoke(uint64_t a1, int a2, CFTypeRef cf)
{
  CFTypeID v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = CFGetTypeID(cf);
  result = C3DEffectSlotGetTypeID();
  if (cf && v5 == result)
  {
    result = C3DKeyframeControllerHasInterpolationModesPerKey((uint64_t)cf);
    if ((_DWORD)result)
    {
      result = C3DEffectSlotGetImageTransform((uint64_t)cf);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = *(_QWORD *)(v8 + 24);
      *(_QWORD *)(v8 + 24) = v9 + 1;
      *(_QWORD *)(v7 + 8 * v9) = result;
    }
  }
  return result;
}

- (uint64_t)dispatchForCubemap:(void *)a3 computeEncoder:(void *)a4 pipelineState:
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD v13[3];
  _QWORD v14[3];

  if (result)
  {
    v7 = objc_msgSend(a4, "threadExecutionWidth");
    v8 = objc_msgSend(a2, "width");
    if (v7 >= v8)
      v7 = v8;
    v9 = objc_msgSend(a4, "maxTotalThreadsPerThreadgroup");
    v10 = v7;
    do
    {
      v11 = v10;
      v12 = v10 * v7;
      v10 >>= 1;
    }
    while (v12 > v9);
    v14[0] = (v7 + objc_msgSend(a2, "width") - 1) / v7;
    v14[1] = (v11 + objc_msgSend(a2, "height") - 1) / v11;
    v14[2] = 6;
    v13[0] = v7;
    v13[1] = v11;
    v13[2] = 1;
    return objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", v14, v13);
  }
  return result;
}

- (uint64_t)depthAndStencilStateWithReadWriteDepthDisabled
{
  uint64_t v1;
  _QWORD block[5];

  if (result)
  {
    v1 = result;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__SCNMTLResourceManager_depthAndStencilStateWithReadWriteDepthDisabled__block_invoke;
    block[3] = &unk_1EA59E288;
    block[4] = result;
    if (-[SCNMTLResourceManager depthAndStencilStateWithReadWriteDepthDisabled]::onceToken != -1)
      dispatch_once(&-[SCNMTLResourceManager depthAndStencilStateWithReadWriteDepthDisabled]::onceToken, block);
    return *(_QWORD *)(v1 + 488);
  }
  return result;
}

void __71__SCNMTLResourceManager_depthAndStencilStateWithReadWriteDepthDisabled__block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CC6A88]);
  objc_msgSend(v2, "setDepthCompareFunction:", 7);
  objc_msgSend(v2, "setDepthWriteEnabled:", 0);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 488) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "newDepthStencilStateWithDescriptor:", v2);

}

- (void)commandBufferDidCompleteWithError:(id)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_availableDeformerStacks.lock;
  os_unfair_lock_lock(&self->_availableDeformerStacks.lock);
  -[NSMapTable scn_enumerateKeysAndValuesUsingBlock:](self->_availableDeformerStacks.registry, "scn_enumerateKeysAndValuesUsingBlock:", &__block_literal_global_211);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __59__SCNMTLResourceManager_commandBufferDidCompleteWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[SCNMTLDeformerStack setNextUpdateRequiresResetForIncrementalDeformers](a3);
}

- (id)copyTextureByConvertingToCubeMapIfApplicable:(id)a3 engineContext:(__C3DEngineContext *)a4 needsMipmap:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v5 = a5;
  v8 = objc_msgSend(a3, "width");
  if (v8 != 2 * objc_msgSend(a3, "height"))
    return a3;
  v9 = objc_msgSend(a3, "pixelFormat");
  if (v9 == 115 || v9 == 125)
    v11 = 115;
  else
    v11 = 70;
  return -[SCNMTLResourceManager newCubemapTextureForLatlongTexture:pixelFormat:engineContext:needsMipmap:](self, "newCubemapTextureForLatlongTexture:pixelFormat:engineContext:needsMipmap:", a3, v11, a4, v5);
}

- (id)newTextureUsingMTKTextureLoaderWithURL:(id)a3 options:(id)a4
{
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v18;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6C40]), "initWithDevice:", -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self));
  if (!v6)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[SCNMTLResourceManager(Textures) newTextureUsingMTKTextureLoaderWithURL:options:].cold.2(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v18 = 0;
  v15 = (void *)objc_msgSend(v6, "newTextureWithContentsOfURL:options:error:", a3, a4, &v18);

  if (v18)
  {
    v16 = scn_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SCNMTLResourceManager(Textures) newTextureUsingMTKTextureLoaderWithURL:options:].cold.1(&v18);
    return 0;
  }
  return v15;
}

- (void)_enqueueCopyFromTexture:(id)a3 toTexture:(id)a4 blitEncoder:(SCNMTLBlitCommandEncoder *)a5 generateMipMaps:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = a6;
  v10 = objc_msgSend(a3, "width");
  if (v10 == objc_msgSend(a4, "width"))
  {
    v11 = objc_msgSend(a3, "height");
    if (v11 == objc_msgSend(a4, "height"))
    {
      v12 = objc_msgSend(a3, "depth");
      if (v12 == objc_msgSend(a4, "depth"))
      {
        SCNMTLBlitCommandEncoder::copyTextureToTexture((void **)&a5->_encoder, a3, 0, a4, 0);
        if (v6)
          SCNMTLBlitCommandEncoder::generateMipmapsForTexture((id *)&a5->_encoder, a4);
      }
    }
  }
}

uint64_t __98__SCNMTLResourceManager_Textures___copyImage_toTexture_desc_textureOptions_needsMipMapGeneration___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3)
{
  void *v3;
  __int128 v4;
  _OWORD v6[3];

  v3 = *(void **)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 56);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v3, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v6, 0, a2, a3, *(unsigned int *)(a1 + 96), *(_QWORD *)(a1 + 88) * *(unsigned int *)(a1 + 96));
}

uint64_t __98__SCNMTLResourceManager_Textures___copyImage_toTexture_desc_textureOptions_needsMipMapGeneration___block_invoke_2(uint64_t a1, unsigned int a2, uint64_t a3)
{
  __int128 v3;
  _OWORD v5[2];
  __int128 v6;

  v3 = *(_OWORD *)(a1 + 64);
  v5[0] = *(_OWORD *)(a1 + 48);
  v5[1] = v3;
  v6 = *(_OWORD *)(a1 + 80);
  return objc_msgSend(*(id *)(a1 + 32), "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v5, 0, a2, a3, *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 96) * objc_msgSend(*(id *)(a1 + 40), "height", v5[0], v3, v6));
}

uint64_t __98__SCNMTLResourceManager_Textures___copyImage_toTexture_desc_textureOptions_needsMipMapGeneration___block_invoke_4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[6];

  v5 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "width");
  v7 = objc_msgSend(*(id *)(a1 + 32), "height");
  v9[0] = 0;
  v9[1] = 0;
  v9[2] = v5;
  v9[3] = v6;
  v9[4] = v7;
  v9[5] = 1;
  return objc_msgSend(*(id *)(a1 + 40), "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v9, 0, 0, a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 48) * objc_msgSend(*(id *)(a1 + 32), "height", 0, 0, v5, v6, v7, 1));
}

uint64_t __98__SCNMTLResourceManager_Textures___copyImage_toTexture_desc_textureOptions_needsMipMapGeneration___block_invoke_2_5(uint64_t a1, unsigned int a2, uint64_t a3)
{
  __int128 v3;
  _OWORD v5[2];
  __int128 v6;

  v3 = *(_OWORD *)(a1 + 64);
  v5[0] = *(_OWORD *)(a1 + 48);
  v5[1] = v3;
  v6 = *(_OWORD *)(a1 + 80);
  return objc_msgSend(*(id *)(a1 + 32), "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v5, 0, a2, a3, *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 96) * objc_msgSend(*(id *)(a1 + 40), "height", v5[0], v3, v6));
}

- (id)newCubemapTextureForLatlongTexture:(id)a3 pixelFormat:(unint64_t)a4 engineContext:(__C3DEngineContext *)a5 needsMipmap:(BOOL)a6
{
  _BOOL8 v6;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t RenderContext;
  _BOOL4 HasFeatures;
  BOOL v17;
  const __CFString *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  id *v22;
  _BYTE v24[48];
  uint64_t v25;

  v6 = a6;
  v25 = *MEMORY[0x1E0C80C00];
  v11 = objc_msgSend(a3, "width");
  if (v11 >> 1 >= 0x800)
    v12 = 2048;
  else
    v12 = v11 >> 1;
  v13 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "textureCubeDescriptorWithPixelFormat:size:mipmapped:", a4, v12, v6);
  objc_msgSend(v13, "setUsage:", 19);
  objc_msgSend(v13, "setStorageMode:", 2);
  v14 = -[SCNMTLResourceManager newTextureWithDescriptor:](self, "newTextureWithDescriptor:", v13);
  RenderContext = C3DEngineContextGetRenderContext((uint64_t)a5);
  HasFeatures = C3DEngineContextHasFeatures((uint64_t)a5, 512);
  v17 = HasFeatures;
  if (HasFeatures)
    v18 = CFSTR("compute_cube_from_equi");
  else
    v18 = CFSTR("compute_cube_from_equi_views");
  v19 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)-[SCNMTLResourceManager computePipelineStateForKernel:](self, "computePipelineStateForKernel:", v18));
  v20 = (_QWORD *)-[SCNMTLRenderContext resourceComputeEncoder](RenderContext);
  bzero(v20, 0x678uLL);
  v21 = (void *)v20[207];
  objc_msgSend(v21, "setComputePipelineState:", v19);
  objc_msgSend(v21, "setTexture:atIndex:", a3, 0);
  if (v17)
  {
    objc_msgSend(v21, "setTexture:atIndex:", v14, 1);
  }
  else
  {
    _fillViewsFromCubeMap(v14, 0, (uint64_t)v24);
    objc_msgSend(v21, "setTextures:withRange:", v24, 1, 6);
  }
  -[SCNMTLResourceManager dispatchForCubemap:computeEncoder:pipelineState:]((uint64_t)self, v14, v21, v19);
  if (v6)
  {
    v22 = (id *)-[SCNMTLRenderContext resourceBlitEncoder](RenderContext);
    SCNMTLBlitCommandEncoder::generateMipmapsForTexture(v22, v14);
  }
  return v14;
}

- (id)latlongTextureForCubemap:(id)a3 pixelFormat:(unint64_t)a4 renderContext:(id)a5 needsMipmap:(BOOL)a6
{
  _BOOL4 v6;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  id *v15;
  int64x2_t v17;
  uint64_t v18;
  _QWORD v19[3];

  v6 = a6;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a4, 2 * objc_msgSend(a3, "width"), objc_msgSend(a3, "height"), a6);
  objc_msgSend(v10, "setUsage:", 3);
  objc_msgSend(v10, "setStorageMode:", 2);
  v11 = -[SCNMTLResourceManager newTextureWithDescriptor:](self, "newTextureWithDescriptor:", v10);
  v12 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)-[SCNMTLResourceManager computePipelineStateForKernel:](self, "computePipelineStateForKernel:", CFSTR("compute_equi_from_cube")));
  v13 = (_QWORD *)-[SCNMTLRenderContext resourceComputeEncoder]((uint64_t)a5);
  bzero(v13, 0x678uLL);
  v14 = (void *)v13[207];
  objc_msgSend(v14, "setComputePipelineState:", v12);
  objc_msgSend(v14, "setTexture:atIndex:", a3, 0);
  objc_msgSend(v14, "setTexture:atIndex:", v11, 1);
  v19[0] = objc_msgSend(v10, "width");
  v19[1] = objc_msgSend(v10, "height");
  v19[2] = 1;
  v17 = vdupq_n_s64(1uLL);
  v18 = 1;
  objc_msgSend(v14, "dispatchThreadgroups:threadsPerThreadgroup:", v19, &v17);
  if (v6)
  {
    v15 = (id *)-[SCNMTLRenderContext resourceBlitEncoder]((uint64_t)a5);
    SCNMTLBlitCommandEncoder::generateMipmapsForTexture(v15, v11);
  }
  return v11;
}

- (id)unstageTexture:(id)a3 commandBuffer:(id)a4
{
  id v5;
  id v7;
  void *v8;
  SCNMTLBlitCommandEncoder v10;

  v5 = a3;
  if (objc_msgSend(a3, "storageMode") == 2)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CC6BB0]);
    objc_msgSend(v7, "setTextureType:", objc_msgSend(v5, "textureType"));
    objc_msgSend(v7, "setPixelFormat:", objc_msgSend(v5, "pixelFormat"));
    objc_msgSend(v7, "setWidth:", objc_msgSend(v5, "width"));
    objc_msgSend(v7, "setHeight:", objc_msgSend(v5, "height"));
    objc_msgSend(v7, "setDepth:", objc_msgSend(v5, "depth"));
    objc_msgSend(v7, "setMipmapLevelCount:", objc_msgSend(v5, "mipmapLevelCount"));
    objc_msgSend(v7, "setUsage:", 0);
    objc_msgSend(v7, "setStorageMode:", 0);
    v8 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v7);
    v10._encoder = 0;
    v10._commandBuffer = 0;
    SCNMTLBlitCommandEncoder::beginEncoding(&v10, a4, 0);
    SCNMTLBlitCommandEncoder::copyTextureToTexture((void **)&v10._encoder, v5, v8);
    SCNMTLBlitCommandEncoder::endEncoding(&v10);
    return v8;
  }
  return v5;
}

- (id)renderResourceForImageProxy:(__C3DImageProxy *)a3 sampler:(__C3DTextureSampler *)a4 engineContext:(__C3DEngineContext *)a5 didFallbackToDefaultTexture:(BOOL *)a6
{
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *p_availableImageProxy;
  os_unfair_lock_s *p_lock;
  void *v21;
  const void *v22;
  uint64_t TextureProxy;
  void *MetalTexture;
  uint64_t RenderContext;
  id *v26;
  BOOL v27;
  __int16 v29;

  if (!a3)
  {
    v11 = scn_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[SCNMTLResourceManager(Textures) renderResourceForImageProxy:sampler:engineContext:didFallbackToDefaultTexture:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
  }
  p_availableImageProxy = (uint64_t *)&self->_availableImageProxy;
  p_lock = &self->_availableImageProxy.lock;
  os_unfair_lock_lock(p_lock);
  v21 = (void *)*p_availableImageProxy;
  if (!*p_availableImageProxy)
  {
    SCNResourceRegistrySetup(p_availableImageProxy, 0);
    v21 = (void *)*p_availableImageProxy;
  }
  v22 = (const void *)objc_msgSend(v21, "objectForKey:", a3);
  if (!v22)
  {
    TextureProxy = C3DImageProxyCreateTextureProxy((uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
    if (!TextureProxy)
    {
      os_unfair_lock_unlock(p_lock);
      MetalTexture = 0;
      goto LABEL_18;
    }
    v22 = (const void *)TextureProxy;
    *(_QWORD *)(TextureProxy + 40) = a3;
    objc_msgSend((id)*p_availableImageProxy, "setObject:forKey:", TextureProxy, a3);
    CFRelease(v22);
  }
  v29 = 257;
  MetalTexture = (void *)C3DTextureProxyGetMetalTexture((uint64_t)v22, (uint64_t)a5, (uint64_t)a4, (uint64_t)&v29);
  os_unfair_lock_unlock(p_lock);
  if (MetalTexture)
  {
    if (a4 && (_BYTE)v29 && HIBYTE(v29) && C3DTextureSamplerGetMipFilter((uint64_t)a4))
    {
      RenderContext = C3DEngineContextGetRenderContext((uint64_t)a5);
      v26 = (id *)-[SCNMTLRenderContext resourceBlitEncoder](RenderContext);
      SCNMTLBlitCommandEncoder::generateMipmapsForTexture(v26, MetalTexture);
    }
    if (a6)
    {
      v27 = 0;
LABEL_20:
      *a6 = v27;
      return MetalTexture;
    }
    return MetalTexture;
  }
LABEL_18:
  if (a6)
  {
    v27 = 1;
    goto LABEL_20;
  }
  return MetalTexture;
}

- (id)lazyMTKTextureLoader
{
  id result;

  result = self->_mtkTextureLoader;
  if (!result)
  {
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6C40]), "initWithDevice:", self->_device);
    self->_mtkTextureLoader = (MTKTextureLoader *)result;
  }
  return result;
}

- (id)defaultTexture
{
  uint64_t *p_availableImages;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  MTLTexture *defaultTexture;
  BOOL v12;
  os_unfair_lock_t p_lock;
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  p_availableImages = (uint64_t *)&self->_availableImages;
  p_lock = &self->_availableImages.lock;
  os_unfair_lock_lock(&self->_availableImages.lock);
  if (!*p_availableImages)
    SCNResourceRegistrySetup(p_availableImages, 0);
  if (!self->_defaultTexture)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 70, 4, 4, 1, p_lock);
    objc_msgSend(v5, "setUsage:", 1);
    objc_msgSend(v5, "setStorageMode:", 0);
    self->_defaultTexture = (MTLTexture *)-[SCNMTLResourceManager newTextureWithDescriptor:](self, "newTextureWithDescriptor:", v5);
    v6 = objc_msgSend(v5, "mipmapLevelCount");
    if (v6)
    {
      v7 = 4;
      v8 = 1;
      do
      {
        MEMORY[0x1E0C80A78](v6);
        v10 = (char *)&v14[-1] - v9;
        memset((char *)&v14[-1] - v9, 255, 4 * v7 * v7);
        defaultTexture = self->_defaultTexture;
        memset(v14, 0, 24);
        v14[3] = v7;
        v14[4] = v7;
        v14[5] = 1;
        -[MTLTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:](defaultTexture, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v14, v8 - 1, 0, v10, 4 * v7, 4 * v7 * v7);
        v6 = objc_msgSend(v5, "mipmapLevelCount");
        if (v8 >= v6)
          break;
        ++v8;
        v12 = v7 > 1;
        v7 >>= 1;
      }
      while (v12);
    }
  }
  os_unfair_lock_unlock(p_lock);
  return self->_defaultTexture;
}

- (id)defaultCubeTexture
{
  uint64_t *p_availableImages;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t i;
  MTLTexture *defaultCubeTexture;
  uint64_t v13;
  os_unfair_lock_t p_lock;
  id v15;
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  p_availableImages = (uint64_t *)&self->_availableImages;
  p_lock = &self->_availableImages.lock;
  os_unfair_lock_lock(&self->_availableImages.lock);
  if (!*p_availableImages)
    SCNResourceRegistrySetup(p_availableImages, 0);
  if (!self->_defaultCubeTexture)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "textureCubeDescriptorWithPixelFormat:size:mipmapped:", 70, 4, 1);
    objc_msgSend(v4, "setUsage:", 1);
    objc_msgSend(v4, "setStorageMode:", 0);
    self->_defaultCubeTexture = (MTLTexture *)-[SCNMTLResourceManager newTextureWithDescriptor:](self, "newTextureWithDescriptor:", v4);
    v15 = v4;
    v5 = objc_msgSend(v4, "mipmapLevelCount");
    if (v5)
    {
      v6 = 0;
      v7 = 4;
      do
      {
        MEMORY[0x1E0C80A78](v5);
        v9 = (char *)&v13 - v8;
        bzero((char *)&v13 - v8, 4 * v7 * v7);
        for (i = 0; i != 6; ++i)
        {
          defaultCubeTexture = self->_defaultCubeTexture;
          memset(v16, 0, 24);
          v16[3] = v7;
          v16[4] = v7;
          v16[5] = 1;
          -[MTLTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:](defaultCubeTexture, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v16, v6, i, v9, 4 * v7, 4 * v7 * v7);
        }
        ++v6;
        v7 >>= 1;
        v5 = objc_msgSend(v15, "mipmapLevelCount");
      }
      while (v6 < v5);
    }
  }
  os_unfair_lock_unlock(p_lock);
  return self->_defaultCubeTexture;
}

- (id)defaultTexture3D
{
  SCNMTLResourceManager *v2;
  uint64_t *p_availableImages;
  os_unfair_lock_s *p_lock;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD v27[2];
  os_unfair_lock_s *v28;
  char *v29;
  uint64_t v30;
  SCNMTLResourceManager *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  _QWORD v35[7];

  v2 = self;
  v35[6] = *MEMORY[0x1E0C80C00];
  p_availableImages = (uint64_t *)&self->_availableImages;
  p_lock = &self->_availableImages.lock;
  os_unfair_lock_lock(&self->_availableImages.lock);
  if (!*p_availableImages)
    SCNResourceRegistrySetup(p_availableImages, 0);
  v5 = 504;
  if (!v2->_defaultTexture3D)
  {
    v28 = p_lock;
    v6 = objc_alloc_init(MEMORY[0x1E0CC6BB0]);
    objc_msgSend(v6, "setPixelFormat:", 70);
    objc_msgSend(v6, "setWidth:", 16);
    objc_msgSend(v6, "setHeight:", 16);
    objc_msgSend(v6, "setDepth:", 16);
    objc_msgSend(v6, "setTextureType:", 7);
    objc_msgSend(v6, "setMipmapLevelCount:", 1);
    objc_msgSend(v6, "setStorageMode:", 0);
    objc_msgSend(v6, "setUsage:", 1);
    v2->_defaultTexture3D = (MTLTexture *)-[SCNMTLResourceManager newTextureWithDescriptor:](v2, "newTextureWithDescriptor:", v6);
    v7 = 4 * objc_msgSend(v6, "width");
    v8 = objc_msgSend(v6, "height");
    v27[1] = v27;
    v32 = v7 * v8;
    v9 = MEMORY[0x1E0C80A78](v8);
    v33 = (char *)v27 - v10;
    if (objc_msgSend(v6, "depth", v9))
    {
      v34 = 0;
      v29 = v33 + 3;
      v30 = 504;
      v31 = v2;
      do
      {
        v11 = objc_msgSend(v6, "depth");
        if (objc_msgSend(v6, "height"))
        {
          v12 = 0;
          v13 = v29;
          v14 = 255 * v34 / (unint64_t)(v11 - 1);
          do
          {
            v15 = objc_msgSend(v6, "height");
            if (objc_msgSend(v6, "width"))
            {
              v16 = 0;
              v17 = 0;
              v18 = v15 - 1;
              v19 = v13;
              v20 = 255 * v12 / v18;
              do
              {
                *(v19 - 3) = v16 / (objc_msgSend(v6, "width") - 1);
                *(v19 - 2) = v20;
                *(v19 - 1) = v14;
                *v19 = -1;
                v19 += 4;
                ++v17;
                v16 += 255;
              }
              while (v17 < objc_msgSend(v6, "width"));
            }
            ++v12;
            v13 += v7;
          }
          while (v12 < objc_msgSend(v6, "height"));
        }
        v5 = v30;
        v2 = v31;
        v21 = *(Class *)((char *)&v31->super.isa + v30);
        v22 = objc_msgSend(v6, "width");
        v23 = objc_msgSend(v6, "height");
        v35[0] = 0;
        v35[1] = 0;
        v24 = v34;
        v35[2] = v34;
        v35[3] = v22;
        v35[4] = v23;
        v35[5] = 1;
        objc_msgSend(v21, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v35, 0, 0, v33, v7, v32);
        v25 = objc_msgSend(v6, "depth");
        v34 = v24 + 1;
      }
      while (v24 + 1 < v25);
    }
    p_lock = v28;
  }
  os_unfair_lock_unlock(p_lock);
  return *(Class *)((char *)&v2->super.isa + v5);
}

- (id)iesTextureForProfile:(id)a3 renderContext:(id)a4
{
  uint64_t *p_availableIESTextures;
  os_unfair_lock_s *p_lock;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t BitSize;
  unint64_t v12;
  size_t v13;
  int32x4_t *v14;
  unint64_t v15;
  void *v16;
  _QWORD v18[3];
  __int128 v19;
  uint64_t v20;
  _OWORD v21[7];

  p_availableIESTextures = (uint64_t *)&self->_availableIESTextures;
  p_lock = &self->_availableIESTextures.lock;
  os_unfair_lock_lock(&self->_availableIESTextures.lock);
  v8 = (void *)*p_availableIESTextures;
  if (!*p_availableIESTextures)
  {
    SCNResourceRegistrySetup(p_availableIESTextures, 1);
    v8 = (void *)*p_availableIESTextures;
  }
  v9 = objc_msgSend(v8, "objectForKey:", a3);
  if (v9)
  {
    v10 = (void *)v9;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    if (C3DIESInfoLoad(a3, v21))
    {
      CACurrentMediaTime();
      BitSize = SCNMTLPixelFormatGetBitSize();
      v12 = BitSize >> 3 << 8;
      v13 = BitSize >> 3 << 12;
      v14 = (int32x4_t *)malloc_type_malloc(v13, 0xACCDC612uLL);
      v15 = SCNMTLPixelFormatGetBitSize();
      C3DIESInfoGenerateTexture2D((_BOOL8)v21, v14, 256, 0x10u, 1, v15 >> 3);
      v16 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, 256, 16, 0);
      objc_msgSend(v16, "setStorageMode:", 0);
      objc_msgSend(v16, "setUsage:", 1);
      v10 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v16);
      memset(v18, 0, sizeof(v18));
      v19 = xmmword_1DD0092E0;
      v20 = 1;
      objc_msgSend(v10, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v18, 0, 0, v14, v12, v13);
      free(v14);
      objc_msgSend((id)*p_availableIESTextures, "setObject:forKey:", v10, a3);
    }
    else
    {
      v10 = 0;
    }
    C3DIESInfoDestroy((void **)v21);
    os_unfair_lock_unlock(p_lock);

  }
  return v10;
}

- (void)colorMatchSourceTexture:(id)a3 sourceColorSpace:(CGColorSpace *)a4 destinationColorSpace:(CGColorSpace *)a5 destinationTexture:(id)a6 renderContext:(id)a7
{
  id v10;
  SCNMTLComputeCommandEncoder *v11;
  uint64_t v12;

  v10 = -[SCNMTLResourceManager colorMatchingComputePipelineStateForSourceColorSpace:destinationColorSpace:renderContext:](self, "colorMatchingComputePipelineStateForSourceColorSpace:destinationColorSpace:renderContext:", a4, a5, a7);
  v11 = (SCNMTLComputeCommandEncoder *)-[SCNMTLRenderContext resourceComputeEncoder]((uint64_t)a7);
  v12 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)v10);
  if (v11->_computePipelineState != (MTLComputePipelineState *)v12)
  {
    v11->_computePipelineState = (MTLComputePipelineState *)v12;
    -[MTLComputeCommandEncoder setComputePipelineState:](v11->_encoder, "setComputePipelineState:", v12);
  }
  if (v11->_textures[0] != a3)
  {
    v11->_textures[0] = (MTLTexture *)a3;
    v11->_texturesToBind[0] |= 1uLL;
  }
  if (v11->_textures[1] != a6)
  {
    v11->_textures[1] = (MTLTexture *)a6;
    v11->_texturesToBind[0] |= 2uLL;
  }
  SCNMTLComputeCommandEncoder::dispatchOnGrid2D(v11, objc_msgSend(a3, "width"), objc_msgSend(a3, "height"));
}

- (void)colorMatchBiPlanarPixelBufferWithFormatType:(unsigned int)a3 pixelBufferYCbCrMatrix:(id)a4 pixelBufferColorPrimaries:(id)a5 pixelBufferTransferFunction:(id)a6 sourceTextureY:(id)a7 sourceTextureCbCr:(id)a8 sourceColorSpace:(CGColorSpace *)a9 destinationColorSpace:(CGColorSpace *)a10 destinationTexture:(id)a11 renderContext:(id)a12
{
  id v14;
  SCNMTLComputeCommandEncoder *v15;
  uint64_t v16;

  v14 = -[SCNMTLResourceManager colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:pixelBufferYCbCrMatrix:pixelBufferColorPrimaries:pixelBufferTransferFunction:sourceColorSpace:destinationColorSpace:renderContext:](self, "colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:pixelBufferYCbCrMatrix:pixelBufferColorPrimaries:pixelBufferTransferFunction:sourceColorSpace:destinationColorSpace:renderContext:", *(_QWORD *)&a3, a4, a5, a6, a9, a10, a12);
  v15 = (SCNMTLComputeCommandEncoder *)-[SCNMTLRenderContext resourceComputeEncoder]((uint64_t)a12);
  v16 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)v14);
  if (v15->_computePipelineState != (MTLComputePipelineState *)v16)
  {
    v15->_computePipelineState = (MTLComputePipelineState *)v16;
    -[MTLComputeCommandEncoder setComputePipelineState:](v15->_encoder, "setComputePipelineState:", v16);
  }
  if (v15->_textures[0] != a7)
  {
    v15->_textures[0] = (MTLTexture *)a7;
    v15->_texturesToBind[0] |= 1uLL;
  }
  if (v15->_textures[1] != a8)
  {
    v15->_textures[1] = (MTLTexture *)a8;
    v15->_texturesToBind[0] |= 2uLL;
  }
  if (v15->_textures[2] != a11)
  {
    v15->_textures[2] = (MTLTexture *)a11;
    v15->_texturesToBind[0] |= 4uLL;
  }
  SCNMTLComputeCommandEncoder::dispatchOnGrid2D(v15, objc_msgSend(a11, "width"), objc_msgSend(a11, "height"));
}

- (id)defaultLightingEnvironmentIrradianceTexture
{
  uint64_t v3;
  MTLTexture *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  MTLTexture *defaultLightingEnvironmentIrradianceTexture;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (!self->_defaultLightingEnvironmentIrradianceTexture)
  {
    v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "URLForResource:withExtension:", CFSTR("SCNDefaultIrradiance"), CFSTR("ktx"));
    v23 = *MEMORY[0x1E0CC6C08];
    v24[0] = MEMORY[0x1E0C9AAA0];
    v4 = -[SCNMTLResourceManager newTextureUsingMTKTextureLoaderWithURL:options:](self, "newTextureUsingMTKTextureLoaderWithURL:options:", v3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1));
    self->_defaultLightingEnvironmentIrradianceTexture = v4;
    if (-[MTLTexture textureType](v4, "textureType") != 5)
    {
      v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[SCNMTLResourceManager(PBR) defaultLightingEnvironmentIrradianceTexture].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    if (-[MTLTexture pixelFormat](self->_defaultLightingEnvironmentIrradianceTexture, "pixelFormat") != 115)
    {
      v13 = scn_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[SCNMTLResourceManager(PBR) defaultLightingEnvironmentIrradianceTexture].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  defaultLightingEnvironmentIrradianceTexture = self->_defaultLightingEnvironmentIrradianceTexture;
  objc_sync_exit(self);
  return defaultLightingEnvironmentIrradianceTexture;
}

- (id)defaultLightingEnvironmentRadianceTexture
{
  uint64_t v3;
  MTLTexture *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  MTLTexture *defaultLightingEnvironmentRadianceTexture;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (!self->_defaultLightingEnvironmentRadianceTexture)
  {
    v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "URLForResource:withExtension:", CFSTR("SCNDefaultRadiance"), CFSTR("ktx"));
    v23 = *MEMORY[0x1E0CC6C08];
    v24[0] = MEMORY[0x1E0C9AAA0];
    v4 = -[SCNMTLResourceManager newTextureUsingMTKTextureLoaderWithURL:options:](self, "newTextureUsingMTKTextureLoaderWithURL:options:", v3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1));
    self->_defaultLightingEnvironmentRadianceTexture = v4;
    if (-[MTLTexture textureType](v4, "textureType") != 5)
    {
      v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[SCNMTLResourceManager(PBR) defaultLightingEnvironmentRadianceTexture].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    if (-[MTLTexture pixelFormat](self->_defaultLightingEnvironmentRadianceTexture, "pixelFormat") != 115)
    {
      v13 = scn_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[SCNMTLResourceManager(PBR) defaultLightingEnvironmentRadianceTexture].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  defaultLightingEnvironmentRadianceTexture = self->_defaultLightingEnvironmentRadianceTexture;
  objc_sync_exit(self);
  return defaultLightingEnvironmentRadianceTexture;
}

- (id)irradianceTextureForEnvironmentTexture:(id)a3 renderContext:(id)a4 applySH:(id)a5
{
  uint64_t *p_availableIrradianceTextures;
  os_unfair_lock_s *p_lock;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;

  p_availableIrradianceTextures = (uint64_t *)&self->_availableIrradianceTextures;
  p_lock = &self->_availableIrradianceTextures.lock;
  os_unfair_lock_lock(&self->_availableIrradianceTextures.lock);
  v11 = (void *)*p_availableIrradianceTextures;
  if (!*p_availableIrradianceTextures)
  {
    SCNResourceRegistrySetup(p_availableIrradianceTextures, 0);
    v11 = (void *)*p_availableIrradianceTextures;
  }
  v12 = objc_msgSend(v11, "objectForKey:", a3);
  if (v12)
  {
    v13 = (id)v12;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "textureCubeDescriptorWithPixelFormat:size:mipmapped:", 115, 64, 0);
    objc_msgSend(v14, "setUsage:", 1);
    objc_msgSend(v14, "setUsage:", objc_msgSend(v14, "usage") | 4);
    objc_msgSend(v14, "setStorageMode:", 2);
    v13 = -[SCNMTLResourceManager newTextureWithDescriptor:](self, "newTextureWithDescriptor:", v14);
    objc_msgSend((id)*p_availableIrradianceTextures, "setObject:forKey:", v13, a3);
    os_unfair_lock_unlock(p_lock);

    -[SCNMTLResourceManager _bakeSphericalHamonicsBasedIrradianceTexture:forEnvironmentTexture:renderContext:applySH:](self, "_bakeSphericalHamonicsBasedIrradianceTexture:forEnvironmentTexture:renderContext:applySH:", v13, a3, a4, a5);
  }
  return v13;
}

- (void)_bakeStochasticIrradianceTexture:(id)a3 forEnvironmentTexture:(id)a4 mipmapLevelForSampling:(unint64_t)a5 renderContext:(id)a6
{
  int v7;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  id *v22;
  id v23;
  _QWORD v24[3];
  _QWORD v25[3];
  int v26;
  int v27;

  v7 = a5;
  v10 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)-[SCNMTLResourceManager computePipelineStateForKernel:](self, "computePipelineStateForKernel:", CFSTR("compute_diffusePreIntegrated_texture2d")));
  v11 = objc_msgSend(v10, "threadExecutionWidth");
  v12 = objc_msgSend(v10, "maxTotalThreadsPerThreadgroup");
  v13 = vcvtms_u32_f32(sqrtf((float)v12));
  if (v11 * v11 <= v12)
    v14 = v11;
  else
    v14 = v13;
  v23 = a6;
  v15 = (_QWORD *)-[SCNMTLRenderContext resourceComputeEncoder]((uint64_t)a6);
  bzero(v15, 0x678uLL);
  v16 = (void *)v15[207];
  objc_msgSend(v16, "setComputePipelineState:", v10);
  v17 = 0;
  v18 = v14 - 1;
  do
  {
    v19 = (void *)objc_msgSend(a3, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(a3, "pixelFormat", v23), 2, 0, 1, v17, 1);
    objc_msgSend(v16, "setTexture:atIndex:", v19, 0);
    objc_msgSend(v16, "setTexture:atIndex:", a4, 1);
    v26 = v17;
    v27 = v7;
    objc_msgSend(v16, "setBytes:length:atIndex:", &v27, 4, 0);
    objc_msgSend(v16, "setBytes:length:atIndex:", &v26, 4, 1);
    v20 = (v18 + objc_msgSend(v19, "width")) / v14;
    v21 = objc_msgSend(v19, "height");
    v25[0] = v20;
    v25[1] = (v18 + v21) / v14;
    v25[2] = 1;
    v24[0] = v14;
    v24[1] = v14;
    v24[2] = 1;
    objc_msgSend(v16, "dispatchThreadgroups:threadsPerThreadgroup:", v25, v24);

    ++v17;
  }
  while (v17 != 6);
  if ((unint64_t)objc_msgSend(a3, "mipmapLevelCount") > 1)
  {
    v22 = (id *)-[SCNMTLRenderContext resourceBlitEncoder]((uint64_t)v23);
    SCNMTLBlitCommandEncoder::generateMipmapsForTexture(v22, a3);
  }
}

- (void)_bakeSphericalHamonicsBasedIrradianceTexture:(id)a3 forEnvironmentTexture:(id)a4 renderContext:(id)a5 applySH:(id)a6
{
  id v11;
  _QWORD *v12;
  id v13;
  id v14;
  _QWORD *v15;
  uint64_t i;
  id v17;
  void *v18;
  int v19;
  _OWORD v20[6];
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  const __CFString *v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  _QWORD v39[6];

  v11 = -[SCNMTLResourceManager sphericalHarmonicsForEnvironmentTexture:order:commandBuffer:](self, "sphericalHarmonicsForEnvironmentTexture:order:commandBuffer:", a4, 3, -[SCNMTLRenderContext resourceCommandBuffer](a5));
  if (a6)
  {
    v12 = -[SCNMTLRenderContext resourceCommandBuffer](a5);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __119__SCNMTLResourceManager_PBR___bakeSphericalHamonicsBasedIrradianceTexture_forEnvironmentTexture_renderContext_applySH___block_invoke;
    v39[3] = &unk_1EA5A0A30;
    v39[4] = v11;
    v39[5] = a6;
    objc_msgSend(v12, "addCompletedHandler:", v39);
  }
  v13 = -[SCNMTLLibraryManager frameworkLibrary](self->_libraryManager, "frameworkLibrary");
  memset(v20, 0, sizeof(v20));
  v21 = 0;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0;
  v36 = 0u;
  v37 = 0u;
  v38 = 0;
  v22 = v13;
  *(_QWORD *)&v23 = objc_msgSend(a3, "pixelFormat");
  v35 = CFSTR("scn_draw_fullscreen_quad_vertex");
  *(_QWORD *)&v36 = CFSTR("cubemap_from_sh");
  v14 = -[SCNMTLResourceManager newRenderPipelineStateWithDesc:](self, "newRenderPipelineStateWithDesc:", v20);
  v15 = -[SCNMTLRenderContext resourceCommandBuffer](a5);
  for (i = 0; i != 6; ++i)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0CC6B50]);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setTexture:", a3);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setLevel:", 0);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setSlice:", i);
    v18 = (void *)objc_msgSend(v15, "renderCommandEncoderWithDescriptor:", v17);

    objc_msgSend(v18, "setRenderPipelineState:", objc_msgSend(v14, "state"));
    objc_msgSend(v18, "setFragmentTexture:atIndex:", a4, 1);
    v19 = i;
    objc_msgSend(v18, "setFragmentBuffer:offset:atIndex:", v11, 0, 0);
    objc_msgSend(v18, "setFragmentBytes:length:atIndex:", &v19, 4, 1);
    objc_msgSend(v18, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
    objc_msgSend(v18, "endEncoding");
  }

}

uint64_t __119__SCNMTLResourceManager_PBR___bakeSphericalHamonicsBasedIrradianceTexture_forEnvironmentTexture_renderContext_applySH___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)newRadianceTextureForEnvironmentTexture:(id)a3 engineContext:(__C3DEngineContext *)a4 cpuAccessible:(BOOL)a5 commandBuffer:(id)a6
{
  _BOOL4 v7;
  void *v11;
  uint64_t v12;
  id v13;
  _BOOL4 HasFeatures;
  const __CFString *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  double v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char v40;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[3];
  _QWORD v47[3];
  float v48;

  v7 = a5;
  v11 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "textureCubeDescriptorWithPixelFormat:size:mipmapped:", 115, 256, 1);
  objc_msgSend(v11, "setUsage:", 1);
  objc_msgSend(v11, "setUsage:", objc_msgSend(v11, "usage") | 0x10);
  objc_msgSend(v11, "setUsage:", objc_msgSend(v11, "usage") | 2);
  if (v7)
    v12 = 0;
  else
    v12 = 2;
  objc_msgSend(v11, "setStorageMode:", v12);
  v43 = objc_msgSend(a3, "mipmapLevelCount");
  v42 = objc_msgSend(v11, "mipmapLevelCount");
  objc_msgSend(v11, "setMipmapLevelCount:", objc_msgSend(v11, "mipmapLevelCount") - 4);
  v13 = -[SCNMTLResourceManager newTextureWithDescriptor:](self, "newTextureWithDescriptor:", v11);
  HasFeatures = C3DEngineContextHasFeatures((uint64_t)a4, 512);
  if (HasFeatures)
    v15 = CFSTR("compute_specularPreIntegratedLD_texturecube");
  else
    v15 = CFSTR("compute_specularPreIntegratedLD_texture2d");
  v16 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)-[SCNMTLResourceManager computePipelineStateForKernel:](self, "computePipelineStateForKernel:", v15));
  v17 = objc_msgSend(v16, "threadExecutionWidth");
  v18 = objc_msgSend(v16, "maxTotalThreadsPerThreadgroup");
  do
  {
    v19 = v17;
    v20 = 6 * v17 * v17;
    v17 >>= 1;
  }
  while (v20 > v18);
  v21 = (void *)objc_msgSend(a6, "computeCommandEncoder");
  objc_msgSend(v21, "setComputePipelineState:", v16);
  objc_msgSend(v21, "setTexture:atIndex:", a3, 1);
  if (objc_msgSend(v13, "mipmapLevelCount"))
  {
    v22 = 0;
    v23 = 6;
    if (!HasFeatures)
      v23 = 1;
    v45 = v23;
    do
    {
      if (v43 < 2)
      {
        v44 = 0;
      }
      else
      {
        v24 = objc_msgSend(a3, "mipmapLevelCount");
        if (v24 < v42)
          v25 = -1;
        else
          v25 = v24 - v42;
        v44 = (void *)objc_msgSend(a3, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(a3, "pixelFormat"), 5, v22 + v25 + 1, 1, 0, 6);
        objc_msgSend(v21, "setTexture:atIndex:");
      }
      v26 = 0;
      do
      {
        if (HasFeatures)
        {
          v27 = v13;
          v28 = 5;
          v29 = v22;
          v30 = 0;
          v31 = 6;
        }
        else
        {
          v48 = *(float *)&v26;
          objc_msgSend(v21, "setBytes:length:atIndex:", &v48, 4, 1);
          v27 = v13;
          v28 = 2;
          v29 = v22;
          v30 = v26;
          v31 = 1;
        }
        v32 = (void *)objc_msgSend(v27, "newTextureViewWithPixelFormat:textureType:levels:slices:", 115, v28, v29, 1, v30, v31);
        objc_msgSend(v21, "setTexture:atIndex:", v32, 0);
        v33 = objc_msgSend(v13, "mipmapLevelCount");
        LODWORD(v34) = 0;
        if (v33 >= 2)
          *(float *)&v34 = 1.0 / (float)(unint64_t)(objc_msgSend(v13, "mipmapLevelCount", v34) - 1);
        v48 = fminf(fmaxf(*(float *)&v34 * (float)v22, 0.01), 1.0);
        objc_msgSend(v21, "setBytes:length:atIndex:", &v48, 4, 0);
        v35 = objc_msgSend(v32, "width");
        if (v19 >= v35)
          v36 = v35;
        else
          v36 = v19;
        v37 = (v36 - 1 + objc_msgSend(v32, "width")) / v36;
        v38 = objc_msgSend(v32, "height");
        v47[0] = v37;
        v47[1] = (v36 - 1 + v38) / v36;
        v47[2] = v45;
        v46[0] = v36;
        v46[1] = v36;
        v46[2] = 1;
        objc_msgSend(v21, "dispatchThreadgroups:threadsPerThreadgroup:", v47, v46);

        v40 = v26++ > 4 || HasFeatures;
      }
      while ((v40 & 1) == 0);

      ++v22;
    }
    while (v22 < objc_msgSend(v13, "mipmapLevelCount"));
  }
  objc_msgSend(v21, "endEncoding");
  return v13;
}

- (id)radianceTextureForEnvironmentTexture:(id)a3 engineContext:(__C3DEngineContext *)a4 commandBuffer:(id)a5
{
  uint64_t *p_availableRadianceTextures;
  os_unfair_lock_s *p_lock;
  void *v11;
  uint64_t v12;
  id v13;

  p_availableRadianceTextures = (uint64_t *)&self->_availableRadianceTextures;
  p_lock = &self->_availableRadianceTextures.lock;
  os_unfair_lock_lock(&self->_availableRadianceTextures.lock);
  v11 = (void *)*p_availableRadianceTextures;
  if (!*p_availableRadianceTextures)
  {
    SCNResourceRegistrySetup(p_availableRadianceTextures, 0);
    v11 = (void *)*p_availableRadianceTextures;
  }
  v12 = objc_msgSend(v11, "objectForKey:", a3);
  if (v12)
  {
    v13 = (id)v12;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v13 = -[SCNMTLResourceManager newRadianceTextureForEnvironmentTexture:engineContext:cpuAccessible:commandBuffer:](self, "newRadianceTextureForEnvironmentTexture:engineContext:cpuAccessible:commandBuffer:", a3, a4, 0, a5);
    objc_msgSend((id)*p_availableRadianceTextures, "setObject:forKey:", v13, a3);
    os_unfair_lock_unlock(p_lock);

  }
  return v13;
}

- (id)areaLightPrecomputedDataTexture
{
  MTLTexture *areaLightPrecomputedDataTexture;
  void *v4;
  MTLTexture *v5;
  MTLTexture *v6;
  MTLTexture *v7;
  _QWORD v9[3];
  int64x2_t v10;
  uint64_t v11;
  _QWORD v12[3];
  int64x2_t v13;
  uint64_t v14;
  _QWORD v15[3];
  int64x2_t v16;
  uint64_t v17;

  objc_sync_enter(self);
  areaLightPrecomputedDataTexture = self->_areaLightPrecomputedDataTexture;
  if (!areaLightPrecomputedDataTexture)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 125, 64, 64, 0);
    objc_msgSend(v4, "setStorageMode:", 0);
    objc_msgSend(v4, "setTextureType:", 3);
    objc_msgSend(v4, "setArrayLength:", 3);
    v5 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v4);
    self->_areaLightPrecomputedDataTexture = v5;
    memset(v15, 0, sizeof(v15));
    v16 = vdupq_n_s64(0x40uLL);
    v17 = 1;
    -[MTLTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:](v5, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v15, 0, 0, &area_lights_pre_computed_tables, 1024, 0x10000);
    v6 = self->_areaLightPrecomputedDataTexture;
    memset(v12, 0, sizeof(v12));
    v13 = vdupq_n_s64(0x40uLL);
    v14 = 1;
    -[MTLTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:](v6, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v12, 0, 1, &unk_1DD019BD0, 1024, 0x10000);
    v7 = self->_areaLightPrecomputedDataTexture;
    memset(v9, 0, sizeof(v9));
    v10 = vdupq_n_s64(0x40uLL);
    v11 = 1;
    -[MTLTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:](v7, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v9, 0, 2, &unk_1DD019BD0, 1024, 0x10000);
    areaLightPrecomputedDataTexture = self->_areaLightPrecomputedDataTexture;
  }
  objc_sync_exit(self);
  return areaLightPrecomputedDataTexture;
}

- (id)shFromCPU:(id)a3 commandBuffer:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  size_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v24;
  _QWORD v25[6];
  _QWORD v26[6];
  _QWORD v27[6];
  _OWORD v28[7];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = -[SCNMTLResourceManager unstageTexture:commandBuffer:](self, "unstageTexture:commandBuffer:", a3, a4);
  v6 = 0;
  memset(v28, 0, 108);
  while (1)
  {
    v7 = objc_msgSend(v5, "pixelFormat");
    if ((v7 & 0xFFFFFFFFFFFFFFFELL) != 0x46)
      break;
    v8 = 4 * objc_msgSend(v5, "width");
    v9 = v8 * objc_msgSend(v5, "height");
    v10 = (char *)malloc_type_calloc(v9, 1uLL, 0xA116E992uLL);
    v11 = objc_msgSend(v5, "width");
    v12 = objc_msgSend(v5, "height");
    memset(v27, 0, 24);
    v27[3] = v11;
    v27[4] = v12;
    v27[5] = 1;
    objc_msgSend(v5, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", v10, v8, v9, v27, 0, v6);
    v13 = (char *)malloc_type_calloc(objc_msgSend(v5, "height") * objc_msgSend(v5, "width"), 0x10uLL, 0x1000040451B5BE8uLL);
    convert_rgba8unorm_to_rgbaf32(v13, 16 * objc_msgSend(v5, "width"), v10, v8, objc_msgSend(v5, "width"), objc_msgSend(v5, "height"));
LABEL_7:
    free(v10);
LABEL_9:
    compute_sh((uint64_t)v13, objc_msgSend(v5, "width"), v6, 3, (uint64_t)v28);
    free(v13);
    if (++v6 == 6)
      return (id)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", v28, 108, 0);
  }
  v14 = v7;
  if (v7 == 125)
  {
    v19 = 16 * objc_msgSend(v5, "width");
    v20 = v19 * objc_msgSend(v5, "height");
    v13 = (char *)malloc_type_calloc(v20, 1uLL, 0x817F880DuLL);
    v21 = objc_msgSend(v5, "width");
    v22 = objc_msgSend(v5, "height");
    memset(v25, 0, 24);
    v25[3] = v21;
    v25[4] = v22;
    v25[5] = 1;
    objc_msgSend(v5, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", v13, v19, v20, v25, 0, v6);
    goto LABEL_9;
  }
  if (v7 == 115)
  {
    v15 = 8 * objc_msgSend(v5, "width");
    v16 = v15 * objc_msgSend(v5, "height");
    v10 = (char *)malloc_type_calloc(v16, 1uLL, 0x1D64DDAAuLL);
    v17 = objc_msgSend(v5, "width");
    v18 = objc_msgSend(v5, "height");
    memset(v26, 0, 24);
    v26[3] = v17;
    v26[4] = v18;
    v26[5] = 1;
    objc_msgSend(v5, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", v10, v15, v16, v26, 0, v6);
    v13 = (char *)malloc_type_calloc(objc_msgSend(v5, "height") * objc_msgSend(v5, "width"), 0x10uLL, 0x1000040451B5BE8uLL);
    convert_rgba16f_to_rgbaf32((uint64_t)v13, 16 * objc_msgSend(v5, "width"), v10, v15, objc_msgSend(v5, "width"), objc_msgSend(v5, "height"));
    goto LABEL_7;
  }
  v24 = scn_default_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    -[SCNMTLResourceManager(SH) shFromCPU:commandBuffer:].cold.1(v14, v24);
  return 0;
}

- (id)sphericalHarmonicsForEnvironmentTexture:(id)a3 order:(unint64_t)a4 commandBuffer:(id)a5
{
  unint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  id v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  int64x2_t v33;
  __int128 v34;
  uint64_t v35;

  v9 = a4 * a4;
  v10 = (id)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 12 * a4 * a4, 0);
  v11 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)-[SCNMTLResourceManager computePipelineStateForKernel:](self, "computePipelineStateForKernel:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("compute_sh%d_from_cubemap_threadgroup_mem"), a4)));
  v12 = (void *)v11;
  if (!v11)
    v12 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)-[SCNMTLResourceManager computePipelineStateForKernel:](self, "computePipelineStateForKernel:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("compute_sh%d_from_cubemap"), a4)));
  v13 = (void *)objc_msgSend(a5, "computeCommandEncoder");
  objc_msgSend(v13, "setComputePipelineState:", v12);
  v23 = v10;
  if ((unint64_t)objc_msgSend(a3, "mipmapLevelCount") >= 0xA)
  {
    v14 = objc_msgSend(a3, "mipmapLevelCount");
    v15 = 9;
    if (v14 > 9)
      v15 = v14;
    a3 = (id)objc_msgSend(a3, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(a3, "pixelFormat"), 5, v15 - 9, 1, 0, 6);
  }
  objc_msgSend(v13, "setTexture:atIndex:", a3, 0);
  if (v11)
  {
    v16 = (void *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 72 * v9, 32);
    objc_msgSend(v13, "setBuffer:offset:atIndex:", v16, 0, 1);
    v17 = (16 * v9);
    v18 = objc_msgSend(v12, "threadExecutionWidth");
    v19 = 0x7FFF / v17;
    if (v18 < v19)
      v19 = v18;
    if (v19 >= 0x40)
      v20 = 64;
    else
      v20 = v19;
    objc_msgSend(v13, "setThreadgroupMemoryLength:atIndex:", v20 * v17, 0);
    v34 = xmmword_1DD029C30;
    v35 = 1;
    v32 = v20;
    v33 = vdupq_n_s64(1uLL);
    objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", &v34, &v32);
    objc_msgSend(v13, "setComputePipelineState:", -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)-[SCNMTLResourceManager computePipelineStateForKernel:](self, "computePipelineStateForKernel:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sum_sh%d"), a4))));
    v21 = v23;
    objc_msgSend(v13, "setBuffer:offset:atIndex:", v23, 0, 0);
    v31 = 1;
    v30 = xmmword_1DD029C18;
    v29 = 1;
    v28 = xmmword_1DD029C18;
    objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", &v30, &v28);

  }
  else
  {
    v21 = v10;
    objc_msgSend(v13, "setBuffer:offset:atIndex:", v10, 0, 0);
    v27 = 1;
    v26 = xmmword_1DD029C18;
    v25 = 1;
    v24 = xmmword_1DD029C18;
    objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", &v26, &v24);
  }
  objc_msgSend(v13, "endEncoding");
  return v21;
}

uint64_t __88__SCNMTLResourceManager_Compilation__renderResourceForProgramDesc_renderPassDescriptor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v4)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setPrivateFunctions:", objc_msgSend((id)objc_msgSend(v4, "privateFunctions"), "arrayByAddingObject:", a2));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_alloc_init(MEMORY[0x1E0CC6B20]);
  v6[0] = a2;
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setPrivateFunctions:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1));
}

- (__C3DFXMetalProgram)defaultProgramUsingTessellation:(BOOL)a3
{
  int *v3;

  v3 = &OBJC_IVAR___SCNMTLResourceManager__defaultProgram;
  if (a3)
    v3 = &OBJC_IVAR___SCNMTLResourceManager__defaultProgramForTessellation;
  return *(__C3DFXMetalProgram **)((char *)&self->super.isa + *v3);
}

void __87__SCNMTLResourceManager_Compilation___createPipelineStateWithDescriptor_desc_pipeline___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  const void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[9];
  __int128 v12;
  uint64_t v13;
  _BYTE v14[344];
  _BYTE __dst[344];

  v8 = (const void *)(a1 + 64);
  memcpy(__dst, (const void *)(a1 + 64), sizeof(__dst));
  SCNMTLRenderPipelineDescRetain((uint64_t)__dst);
  v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "deviceQueue");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__SCNMTLResourceManager_Compilation___createPipelineStateWithDescriptor_desc_pipeline___block_invoke_2;
  v11[3] = &unk_1EA5A5250;
  v13 = *(_QWORD *)(a1 + 408);
  v10 = *(_QWORD *)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v11[5] = a4;
  v11[6] = a2;
  v11[7] = v10;
  v11[8] = a3;
  memcpy(v14, v8, sizeof(v14));
  v12 = *(_OWORD *)(a1 + 48);
  dispatch_async(v9, v11);
}

void __87__SCNMTLResourceManager_Compilation___createPipelineStateWithDescriptor_desc_pipeline___block_invoke_3(uint64_t a1)
{
  *(CFTimeInterval *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 304) = CACurrentMediaTime()
                                                                        - *(double *)(a1 + 56)
                                                                        + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                                + 24)
                                                                                    + 304);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)computePipelineStateForKernel:(id)a3 threadGroupSizeIsMultipleOfThreadExecutionWidth:(BOOL)a4
{
  return -[SCNMTLResourceManager _computePipelineStateForKernel:constants:constantsHash:threadGroupSizeIsMultipleOfThreadExecutionWidth:](self, "_computePipelineStateForKernel:constants:constantsHash:threadGroupSizeIsMultipleOfThreadExecutionWidth:", a3, 0, 0, a4);
}

- (id)computePipelineStateForKernel:(id)a3 constants:(id)a4 constantsHash:(id)a5
{
  return -[SCNMTLResourceManager _computePipelineStateForKernel:constants:constantsHash:threadGroupSizeIsMultipleOfThreadExecutionWidth:](self, "_computePipelineStateForKernel:constants:constantsHash:threadGroupSizeIsMultipleOfThreadExecutionWidth:", a3, a4, a5, 0);
}

- (id)computePipelineStateForKernel:(id)a3 withStageDescriptor:(id)a4 stageDescriptorUpdateBlock:(id)a5 constants:(id)a6 constantsHash:(id)a7
{
  uint64_t *p_availableComputePipelinesWithStageDescriptor;
  os_unfair_lock_s *p_lock;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;

  p_availableComputePipelinesWithStageDescriptor = (uint64_t *)&self->_availableComputePipelinesWithStageDescriptor;
  p_lock = &self->_availableComputePipelinesWithStageDescriptor.lock;
  os_unfair_lock_lock(&self->_availableComputePipelinesWithStageDescriptor.lock);
  if (*p_availableComputePipelinesWithStageDescriptor)
  {
    if (!a6)
    {
LABEL_8:
      v23 = a3;
      if (a7)
        v23 = (id)objc_msgSend(a3, "stringByAppendingString:", a7);
      goto LABEL_10;
    }
  }
  else
  {
    SCNResourceRegistrySetup(p_availableComputePipelinesWithStageDescriptor, 1);
    if (!a6)
      goto LABEL_8;
  }
  if (a7)
    goto LABEL_8;
  v15 = scn_default_log();
  v23 = a3;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    -[SCNMTLResourceManager(Compilation) _computePipelineStateForKernel:constants:constantsHash:threadGroupSizeIsMultipleOfThreadExecutionWidth:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
    v23 = a3;
  }
LABEL_10:
  v24 = (void *)objc_msgSend((id)*p_availableComputePipelinesWithStageDescriptor, "objectForKey:", v23);
  if (v24)
  {
    if (a4)
      goto LABEL_15;
  }
  else
  {
    v24 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
    objc_msgSend((id)*p_availableComputePipelinesWithStageDescriptor, "setObject:forKey:", v24, v23);
    if (a4)
      goto LABEL_15;
  }
  v25 = scn_default_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    -[SCNMTLResourceManager(Compilation) computePipelineStateForKernel:withStageDescriptor:stageDescriptorUpdateBlock:constants:constantsHash:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);
    if (!a5)
      goto LABEL_18;
    goto LABEL_16;
  }
LABEL_15:
  if (!a5)
  {
LABEL_18:
    v34 = -[SCNMTLResourceManager getUniqueStageDescriptor:](self, "getUniqueStageDescriptor:", a4);
    v35 = (id)objc_msgSend(v24, "objectForKey:", v34);
    if (!v35)
    {
      v36 = -[SCNMTLLibraryManager frameworkLibrary](self->_libraryManager, "frameworkLibrary");
      v42 = a3;
      v43 = a6;
      v45 = 0;
      v46 = 0;
      v44 = a4;
      v35 = -[SCNMTLResourceManager newComputePipelineStateForDesc:library:](self, "newComputePipelineStateForDesc:library:", &v42, v36);
      if (v35)
      {
        v37 = v24;
        v38 = v35;
        v39 = v34;
LABEL_23:
        objc_msgSend(v37, "setObject:forKey:", v38, v39);

        goto LABEL_24;
      }
    }
    goto LABEL_24;
  }
LABEL_16:
  if (objc_msgSend(v24, "count"))
  {
    v33 = -[SCNMTLResourceManager commandQueue](objc_msgSend((id)objc_msgSend(v24, "allValues"), "firstObject"));
    (*((void (**)(id, uint64_t, id))a5 + 2))(a5, v33, a4);
    goto LABEL_18;
  }
  v40 = -[SCNMTLLibraryManager frameworkLibrary](self->_libraryManager, "frameworkLibrary");
  v42 = a3;
  v43 = a6;
  v44 = a4;
  v45 = a5;
  v46 = 0;
  v35 = -[SCNMTLResourceManager newComputePipelineStateForDesc:library:](self, "newComputePipelineStateForDesc:library:", &v42, v40);
  if (v35)
  {
    v39 = -[SCNMTLResourceManager getUniqueStageDescriptor:](self, "getUniqueStageDescriptor:", a4);
    v37 = v24;
    v38 = v35;
    goto LABEL_23;
  }
LABEL_24:
  os_unfair_lock_unlock(p_lock);
  return v35;
}

- (id)getUniqueStageDescriptor:(id)a3
{
  os_unfair_lock_s *p_stageDescriptorsLock;
  NSMutableArray *availableStageDescriptors;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  p_stageDescriptorsLock = &self->_stageDescriptorsLock;
  os_unfair_lock_lock(&self->_stageDescriptorsLock);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  availableStageDescriptors = self->_availableStageDescriptors;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](availableStageDescriptors, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(availableStageDescriptors);
        v11 = 0;
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        while (1)
        {
          v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "attributes"), "objectAtIndexedSubscript:", v11), "format");
          if (v13 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", v11), "format"))break;
          v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "attributes"), "objectAtIndexedSubscript:", v11), "offset");
          if (v14 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", v11), "offset"))break;
          v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "attributes"), "objectAtIndexedSubscript:", v11), "bufferIndex");
          if (v15 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", v11), "bufferIndex"))break;
          if (++v11 == 31)
          {
            v16 = 0;
            while (1)
            {
              v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "layouts"), "objectAtIndexedSubscript:", v16), "stride");
              if (v17 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", v16), "stride"))goto LABEL_18;
              v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "layouts"), "objectAtIndexedSubscript:", v16), "stepFunction");
              if (v18 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", v16), "stepFunction"))goto LABEL_18;
              v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "layouts"), "objectAtIndexedSubscript:", v16), "stepRate");
              if (v19 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", v16), "stepRate"))goto LABEL_18;
              if (++v16 == 31)
              {
                v20 = objc_msgSend(v12, "indexType");
                if (v20 != objc_msgSend(a3, "indexType"))
                  goto LABEL_18;
                v21 = objc_msgSend(v12, "indexBufferIndex");
                if (v21 != objc_msgSend(a3, "indexBufferIndex"))
                  goto LABEL_18;
                if (v12)
                  goto LABEL_23;
                goto LABEL_22;
              }
            }
          }
        }
LABEL_18:
        ;
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](availableStageDescriptors, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }
LABEL_22:
  v12 = (void *)objc_msgSend(a3, "copy");
  -[NSMutableArray addObject:](self->_availableStageDescriptors, "addObject:", v12);

LABEL_23:
  os_unfair_lock_unlock(p_stageDescriptorsLock);
  return v12;
}

- (id)newComputePipelineStateWithFunctionName:(id)a3
{
  return -[SCNMTLResourceManager newComputePipelineStateWithFunctionName:library:constantValues:](self, "newComputePipelineStateWithFunctionName:library:constantValues:", a3, -[SCNMTLLibraryManager frameworkLibrary](self->_libraryManager, "frameworkLibrary"), 0);
}

- (id)newComputePipelineStateWithFunctionName:(id)a3 library:(id)a4
{
  return -[SCNMTLResourceManager newComputePipelineStateWithFunctionName:library:constantValues:](self, "newComputePipelineStateWithFunctionName:library:constantValues:", a3, a4, 0);
}

- (id)newComputePipelineStateWithFunctionName:(id)a3 constantValues:(id)a4
{
  return -[SCNMTLResourceManager newComputePipelineStateWithFunctionName:library:constantValues:](self, "newComputePipelineStateWithFunctionName:library:constantValues:", a3, -[SCNMTLLibraryManager frameworkLibrary](self->_libraryManager, "frameworkLibrary"), a4);
}

- (id)newComputePipelineStateWithFunctionName:(id)a3 library:(id)a4 constantValues:(id)a5
{
  _QWORD v6[3];
  _QWORD v7[2];

  v6[0] = a3;
  v6[1] = a5;
  v6[2] = 0;
  v7[0] = 0;
  *(_DWORD *)((char *)v7 + 7) = 0;
  return -[SCNMTLResourceManager newComputePipelineStateForDesc:library:](self, "newComputePipelineStateForDesc:library:", v6, a4);
}

- (id)colorMatchingComputePipelineStateForSourceColorSpace:(CGColorSpace *)a3 destinationColorSpace:(CGColorSpace *)a4 renderContext:(id)a5
{
  return -[SCNMTLResourceManager colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:pixelBufferYCbCrMatrix:pixelBufferColorPrimaries:pixelBufferTransferFunction:sourceColorSpace:destinationColorSpace:renderContext:](self, "colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:pixelBufferYCbCrMatrix:pixelBufferColorPrimaries:pixelBufferTransferFunction:sourceColorSpace:destinationColorSpace:renderContext:", 0xFFFFFFFFLL, 0, 0, 0, a3, a4, a5);
}

- (id)colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:(unsigned int)a3 pixelBufferYCbCrMatrix:(id)a4 pixelBufferColorPrimaries:(id)a5 pixelBufferTransferFunction:(id)a6 sourceColorSpace:(CGColorSpace *)a7 destinationColorSpace:(CGColorSpace *)a8 renderContext:(id)a9
{
  uint64_t *p_availableColorMatchingComputePipelines;
  os_unfair_lock_s *p_lock;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  int v22;
  id v23;
  const __CFString *v24;
  int v25;
  int v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  int v35;
  int v36;
  CFStringRef *v37;
  CGColorSpace *v38;
  NSObject *v39;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  int v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _OWORD v58[2];

  p_availableColorMatchingComputePipelines = (uint64_t *)&self->_availableColorMatchingComputePipelines;
  p_lock = &self->_availableColorMatchingComputePipelines.lock;
  os_unfair_lock_lock(&self->_availableColorMatchingComputePipelines.lock);
  v18 = (void *)*p_availableColorMatchingComputePipelines;
  if (!*p_availableColorMatchingComputePipelines)
  {
    SCNResourceRegistrySetup(p_availableColorMatchingComputePipelines, 1);
    v18 = (void *)*p_availableColorMatchingComputePipelines;
  }
  v19 = (void *)objc_msgSend(v18, "objectForKey:", a8);
  if (!v19)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 1);
    objc_msgSend((id)*p_availableColorMatchingComputePipelines, "setObject:forKey:", v19, a8);

  }
  v20 = (void *)objc_msgSend(v19, "objectForKey:", a7);
  if (!v20)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 1);
    objc_msgSend(v19, "setObject:forKey:", v20, a7);

  }
  v21 = (id)objc_msgSend(v20, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3 != -1));
  if (!v21)
  {
    if (a3 == -1)
    {
      v57 = 0u;
      v58[0] = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      C3DGetColorMatchingComputeKernelParameters(a7, (uint64_t)a8, &v51);
      v23 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
      objc_msgSend(v23, "setConstantValue:type:withName:", &v51, 53, CFSTR("needsInputTRC"));
      objc_msgSend(v23, "setConstantValue:type:withName:", (char *)&v51 + 1, 53, CFSTR("needsColorMatrix"));
      objc_msgSend(v23, "setConstantValue:type:withName:", (char *)&v51 + 2, 53, CFSTR("needsOutputTRC"));
      objc_msgSend(v23, "setConstantValue:type:withName:", (char *)&v51 + 4, 29, CFSTR("inputTRC_type"));
      objc_msgSend(v23, "setConstantValue:type:withName:", (char *)&v51 + 8, 3, CFSTR("inputTRC_gamma"));
      objc_msgSend(v23, "setConstantValue:type:withName:", (unint64_t)&v51 | 0xC, 3, CFSTR("inputTRC_a"));
      objc_msgSend(v23, "setConstantValue:type:withName:", &v52, 3, CFSTR("inputTRC_b"));
      objc_msgSend(v23, "setConstantValue:type:withName:", (char *)&v52 + 4, 3, CFSTR("inputTRC_c"));
      objc_msgSend(v23, "setConstantValue:type:withName:", (char *)&v52 + 8, 3, CFSTR("inputTRC_d"));
      objc_msgSend(v23, "setConstantValue:type:withName:", (char *)&v52 + 12, 3, CFSTR("inputTRC_e"));
      objc_msgSend(v23, "setConstantValue:type:withName:", &v53, 3, CFSTR("inputTRC_f"));
      objc_msgSend(v23, "setConstantValue:type:withName:", &v54, 5, CFSTR("colorMatrixColumn0"));
      objc_msgSend(v23, "setConstantValue:type:withName:", &v55, 5, CFSTR("colorMatrixColumn1"));
      objc_msgSend(v23, "setConstantValue:type:withName:", &v56, 5, CFSTR("colorMatrixColumn2"));
      objc_msgSend(v23, "setConstantValue:type:withName:", &v57, 29, CFSTR("outputTRC_type"));
      objc_msgSend(v23, "setConstantValue:type:withName:", (char *)&v57 + 4, 3, CFSTR("outputTRC_gamma"));
      objc_msgSend(v23, "setConstantValue:type:withName:", (char *)&v57 + 8, 3, CFSTR("outputTRC_a"));
      objc_msgSend(v23, "setConstantValue:type:withName:", (char *)&v57 + 12, 3, CFSTR("outputTRC_b"));
      objc_msgSend(v23, "setConstantValue:type:withName:", v58, 3, CFSTR("outputTRC_c"));
      objc_msgSend(v23, "setConstantValue:type:withName:", (char *)v58 + 4, 3, CFSTR("outputTRC_d"));
      objc_msgSend(v23, "setConstantValue:type:withName:", (char *)v58 + 8, 3, CFSTR("outputTRC_e"));
      objc_msgSend(v23, "setConstantValue:type:withName:", (char *)v58 + 12, 3, CFSTR("outputTRC_f"));
      v24 = CFSTR("color_matching_kernel");
LABEL_49:
      v21 = -[SCNMTLResourceManager newComputePipelineStateWithFunctionName:constantValues:](self, "newComputePipelineStateWithFunctionName:constantValues:", v24, v23);

      objc_msgSend(v20, "setObject:forKey:", v21, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3 != -1));
      goto LABEL_50;
    }
    if ((int)a3 > 875704949)
    {
      switch(a3)
      {
        case 0x34323276u:
          v25 = 0;
          v26 = 2;
          break;
        case 0x34343466u:
          v22 = 3;
          goto LABEL_25;
        case 0x34343476u:
          v25 = 0;
          v26 = 3;
          break;
        default:
LABEL_26:
          LOBYTE(v51) = HIBYTE(a3);
          BYTE1(v51) = BYTE2(a3);
          BYTE2(v51) = BYTE1(a3);
          *(_WORD *)((char *)&v51 + 3) = a3;
          v27 = scn_default_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            -[SCNMTLResourceManager(Compilation) colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:pixelBufferYCbCrMatrix:pixelBufferColorPrimaries:pixelBufferTransferFunction:sourceColorSpace:destinationColorSpace:renderContext:].cold.3((uint64_t)&v51, v27, v28, v29, v30, v31, v32, v33);
          v25 = 0;
          v48 = 0;
LABEL_29:
          if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0CA8F18]))
          {
            v34 = v25 == 0;
            v35 = 3;
          }
          else if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0CA8F10]))
          {
            v34 = v25 == 0;
            v35 = 1;
          }
          else
          {
            if (!objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0CA8F00]))
            {
              v41 = scn_default_log();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                -[SCNMTLResourceManager(Compilation) colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:pixelBufferYCbCrMatrix:pixelBufferColorPrimaries:pixelBufferTransferFunction:sourceColorSpace:destinationColorSpace:renderContext:].cold.2((uint64_t)a4, v41, v42, v43, v44, v45, v46, v47);
              v36 = 0;
LABEL_38:
              v57 = 0u;
              v58[0] = 0u;
              v55 = 0u;
              v56 = 0u;
              v53 = 0u;
              v54 = 0u;
              v51 = 0u;
              v52 = 0u;
              if (objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0CA8D88])
                && (objc_msgSend(a6, "isEqualToString:", *MEMORY[0x1E0CA8EB0]) & 1) != 0)
              {
                v37 = (CFStringRef *)MEMORY[0x1E0C9D9D0];
              }
              else
              {
                if (!objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0CA8D98])
                  || !objc_msgSend(a6, "isEqualToString:", *MEMORY[0x1E0CA8EB0]))
                {
                  goto LABEL_46;
                }
                v37 = (CFStringRef *)MEMORY[0x1E0C9D900];
              }
              if (*v37)
              {
                v38 = CGColorSpaceCreateWithName(*v37);
                C3DGetColorMatchingComputeKernelParameters(v38, (uint64_t)a8, &v51);
                CFRelease(v38);
LABEL_48:
                v23 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
                objc_msgSend(v23, "setConstantValue:type:withName:", &v51, 53, CFSTR("needsInputTRC"));
                objc_msgSend(v23, "setConstantValue:type:withName:", (char *)&v51 + 1, 53, CFSTR("needsColorMatrix"));
                objc_msgSend(v23, "setConstantValue:type:withName:", (char *)&v51 + 2, 53, CFSTR("needsOutputTRC"));
                objc_msgSend(v23, "setConstantValue:type:withName:", (char *)&v51 + 4, 29, CFSTR("inputTRC_type"));
                objc_msgSend(v23, "setConstantValue:type:withName:", (char *)&v51 + 8, 3, CFSTR("inputTRC_gamma"));
                objc_msgSend(v23, "setConstantValue:type:withName:", (unint64_t)&v51 | 0xC, 3, CFSTR("inputTRC_a"));
                objc_msgSend(v23, "setConstantValue:type:withName:", &v52, 3, CFSTR("inputTRC_b"));
                objc_msgSend(v23, "setConstantValue:type:withName:", (char *)&v52 + 4, 3, CFSTR("inputTRC_c"));
                objc_msgSend(v23, "setConstantValue:type:withName:", (char *)&v52 + 8, 3, CFSTR("inputTRC_d"));
                objc_msgSend(v23, "setConstantValue:type:withName:", (char *)&v52 + 12, 3, CFSTR("inputTRC_e"));
                objc_msgSend(v23, "setConstantValue:type:withName:", &v53, 3, CFSTR("inputTRC_f"));
                objc_msgSend(v23, "setConstantValue:type:withName:", &v54, 5, CFSTR("colorMatrixColumn0"));
                objc_msgSend(v23, "setConstantValue:type:withName:", &v55, 5, CFSTR("colorMatrixColumn1"));
                objc_msgSend(v23, "setConstantValue:type:withName:", &v56, 5, CFSTR("colorMatrixColumn2"));
                objc_msgSend(v23, "setConstantValue:type:withName:", &v57, 29, CFSTR("outputTRC_type"));
                objc_msgSend(v23, "setConstantValue:type:withName:", (char *)&v57 + 4, 3, CFSTR("outputTRC_gamma"));
                objc_msgSend(v23, "setConstantValue:type:withName:", (char *)&v57 + 8, 3, CFSTR("outputTRC_a"));
                objc_msgSend(v23, "setConstantValue:type:withName:", (char *)&v57 + 12, 3, CFSTR("outputTRC_b"));
                objc_msgSend(v23, "setConstantValue:type:withName:", v58, 3, CFSTR("outputTRC_c"));
                objc_msgSend(v23, "setConstantValue:type:withName:", (char *)v58 + 4, 3, CFSTR("outputTRC_d"));
                objc_msgSend(v23, "setConstantValue:type:withName:", (char *)v58 + 8, 3, CFSTR("outputTRC_e"));
                objc_msgSend(v23, "setConstantValue:type:withName:", (char *)v58 + 12, 3, CFSTR("outputTRC_f"));
                v49 = v36;
                v50 = v48;
                objc_msgSend(v23, "setConstantValue:type:withName:", &v50, 29, CFSTR("biPlanarTextureChromaSubsampling"));
                objc_msgSend(v23, "setConstantValue:type:withName:", &v49, 29, CFSTR("biPlanarTextureYCbCrMatrix"));
                v24 = CFSTR("color_matching_kernel_biplanar");
                goto LABEL_49;
              }
LABEL_46:
              v39 = scn_default_log();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                -[SCNMTLResourceManager(Compilation) colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:pixelBufferYCbCrMatrix:pixelBufferColorPrimaries:pixelBufferTransferFunction:sourceColorSpace:destinationColorSpace:renderContext:].cold.1((uint64_t)a5, (uint64_t)a6, v39);
              goto LABEL_48;
            }
            v34 = v25 == 0;
            v35 = 5;
          }
          if (v34)
            v36 = v35;
          else
            v36 = v35 + 1;
          goto LABEL_38;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x34323066u:
          v25 = 1;
          break;
        case 0x34323076u:
          v25 = 0;
          break;
        case 0x34323266u:
          v22 = 2;
LABEL_25:
          v48 = v22;
          v25 = 1;
          goto LABEL_29;
        default:
          goto LABEL_26;
      }
      v26 = 1;
    }
    v48 = v26;
    goto LABEL_29;
  }
LABEL_50:
  os_unfair_lock_unlock(p_lock);
  return v21;
}

- (BOOL)hasCommonProfilePrecompiledFunctions
{
  return -[SCNMTLLibraryManager commonProfileCacheLibrary](self->_libraryManager, "commonProfileCacheLibrary") != 0;
}

- (void)initWithDevice:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a1, a3, "Error: SCNMTLResourceManager initWithDevice : cannot create a command queue. Bailing out.", v3);
}

- (void)renderResourceForMeshSource:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "C3DMeshSourceIsVolatile(meshSource) != true";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. cannot use volatile meshSource", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __59__SCNMTLResourceManager___updateMutableMesh_withMetalMesh___block_invoke_cold_1(int a1, void *a2, NSObject *a3)
{
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = 136315650;
  v5 = "dataSize == buf.length";
  v6 = 1024;
  v7 = a1;
  v8 = 1024;
  v9 = objc_msgSend(a2, "length");
  _os_log_fault_impl(&dword_1DCCB8000, a3, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. size mismatch in mutable buffers %u!=%u", (uint8_t *)&v4, 0x18u);
  OUTLINED_FUNCTION_4_4();
}

void __59__SCNMTLResourceManager___updateMutableMesh_withMetalMesh___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "[metalMesh.buffers indexOfObject:buf] != NSNotFound";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. source should be present", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)renderResourceForMesh:(NSObject *)a3 dataKind:.cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "dataKind == kC3DMeshDataKindOriginal";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Only original data kind can have non 'GPU' primitive type", a1);
}

- (void)renderResourceForMaterial:(NSObject *)a3 geometry:renderPipeline:engineContext:.cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "0";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. only C3DValue are supported for partial struct storage", a1);
}

- (void)renderResourceForMaterial:(NSObject *)a3 geometry:renderPipeline:engineContext:.cold.2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "textureMatrix";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

- (void)renderResourceForMaterial:(NSObject *)a3 geometry:renderPipeline:engineContext:.cold.3(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a3, (uint64_t)a3, "Unreachable code: Sampler are not yet implemented as separate bindings", a1);
}

- (void)renderResourceForMaterial:(uint64_t)a3 geometry:renderPipeline:engineContext:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "pipeline";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)renderResourceForMaterial:(uint64_t)a3 geometry:renderPipeline:engineContext:.cold.5(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "material";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __87__SCNMTLResourceManager_Compilation___createPipelineStateWithDescriptor_desc_pipeline___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 104);
  v5 = 138412546;
  v6 = v4;
  v7 = 2112;
  v8 = objc_msgSend(a2, "description");
  _os_log_error_impl(&dword_1DCCB8000, a3, OS_LOG_TYPE_ERROR, "Error: Compiler error while building render pipeline state for node %@:\n%@", (uint8_t *)&v5, 0x16u);
}

@end
