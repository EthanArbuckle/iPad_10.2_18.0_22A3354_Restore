@implementation BWRenderList

uint64_t __26__BWRenderList_isPrepared__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

- (BOOL)affectsMetadata
{
  return self->_affectsMetadata;
}

- (BWRenderListRendererList)rendererList
{
  return &self->_rendererList;
}

- (BWRenderListParameterList)parameterList
{
  return &self->_parameterList;
}

uint64_t __28__BWRenderList_setPrepared___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 56) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setPrepared:(BOOL)a3
{
  NSObject *preparationIsolationQueue;
  _QWORD v4[5];
  BOOL v5;

  preparationIsolationQueue = self->_preparationIsolationQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__BWRenderList_setPrepared___block_invoke;
  v4[3] = &unk_1E491EE18;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(preparationIsolationQueue, v4);
}

- (uint64_t)_appendBatchRendererFromProvider:(_QWORD *)a3 toRendererList:(_QWORD *)a4 parameterList:(uint64_t)a5 withContext:
{
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  char v17;
  char v18;
  id v19;
  id v20;

  if (result)
  {
    if (a5)
    {
      v9 = *(void **)(a5 + 40);
      result = objc_msgSend(v9, "count");
      if (result)
      {
        v10 = *(__int16 *)(a5 + 48);
        v11 = *(unsigned __int8 *)(a5 + 50);
        v12 = *(_QWORD *)(a5 + 32);
        v19 = 0;
        v20 = 0;
        result = rl_concreteRendererWithParametersForType(v10, a2, (uint64_t *)&v20, (uint64_t *)&v19, v9, v12, v11);
        if (v20)
        {
          v13 = malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
          v13[1] = v20;
          v14 = *(_QWORD **)(a5 + 8);
          if (!v14)
            v14 = a3;
          *v13 = *v14;
          *v14 = v13;
          *(_QWORD *)(a5 + 8) = v13;
          v15 = malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
          v15[1] = v19;
          v16 = *(_QWORD **)(a5 + 16);
          if (!v16)
            v16 = a4;
          *v15 = *v16;
          *v16 = v15;
          *(_QWORD *)(a5 + 16) = v15;
          if (v11)
            *(_QWORD *)(a5 + 24) = v13;
          if (*(_BYTE *)(a5 + 64))
            v17 = 1;
          else
            v17 = objc_msgSend(v20, "adjustsMetadata");
          *(_BYTE *)(a5 + 64) = v17;
          if (*(_BYTE *)(a5 + 65))
            v18 = 1;
          else
            v18 = objc_msgSend(v20, "supportsAnimation");
          *(_BYTE *)(a5 + 65) = v18;
          result = objc_msgSend(v9, "removeAllObjects");
          *(_BYTE *)(a5 + 50) = 0;
        }
      }
    }
  }
  return result;
}

- (BOOL)isPrepared
{
  NSObject *preparationIsolationQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  preparationIsolationQueue = self->_preparationIsolationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__BWRenderList_isPrepared__block_invoke;
  v5[3] = &unk_1E491E9A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(preparationIsolationQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (void)initialize
{
  objc_opt_class();
}

- (BWRenderList)initWithAnimationSupported:(BOOL)a3 affectsMetadata:(BOOL)a4
{
  BWRenderList *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWRenderList;
  v6 = -[BWRenderList init](&v8, sel_init);
  if (v6)
  {
    v6->_preparationIsolationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.bwrenderlist.preparation-isolation", 0);
    v6->_originalMarkerRendererNode = 0;
    v6->_parameterList.slh_first = 0;
    v6->_rendererList.slh_first = 0;
    v6->_affectsMetadata = a4;
    v6->_supportsAnimation = a3;
  }
  return v6;
}

- (BWRenderList)initWithResourceProvider:(id)a3 originalFilters:(id)a4 processedFilters:(id)a5 optimizationStrategy:(signed __int16)a6 stillImageSettings:(id)a7
{
  int v8;
  BWRenderList *v12;
  dispatch_queue_t v13;
  BWRenderListRendererList *p_rendererList;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  BWRenderListRendererNode *slh_first;
  unsigned int v24;
  char v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  id v39;
  __int128 v40;
  uint64_t v41;
  objc_super v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v8 = a6;
  v45 = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)BWRenderList;
  v12 = -[BWRenderList init](&v42, sel_init);
  if (v12)
  {
    v27 = a7;
    v13 = dispatch_queue_create("com.apple.coremedia.bwrenderlist.preparation-isolation", 0);
    v12->_rendererList.slh_first = 0;
    p_rendererList = &v12->_rendererList;
    v12->_preparationIsolationQueue = (OS_dispatch_queue *)v13;
    v12->_parameterList.slh_first = 0;
    v41 = 0;
    v40 = 4uLL;
    v36 = (unsigned __int16)v8;
    v37 = 0uLL;
    v38 = objc_msgSend(a4, "lastObject");
    v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v15 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(a4);
          -[BWRenderList _continueOptimizingRendererList:parameterList:withFilter:fromProvider:context:]((uint64_t)v12, &v12->_rendererList.slh_first, &v12->_parameterList.slh_first, *(void **)(*((_QWORD *)&v32 + 1) + 8 * i), a3, (uint64_t)&v36);
        }
        v16 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
      }
      while (v16);
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v19 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v28, v43, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(a5);
          -[BWRenderList _continueOptimizingRendererList:parameterList:withFilter:fromProvider:context:]((uint64_t)v12, &v12->_rendererList.slh_first, &v12->_parameterList.slh_first, *(void **)(*((_QWORD *)&v28 + 1) + 8 * j), a3, (uint64_t)&v36);
        }
        v20 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v28, v43, 16);
      }
      while (v20);
    }
    -[BWRenderList _finishOptimizingRendererList:parameterList:fromProvider:context:stillImageSettings:]((uint64_t)v12, &v12->_rendererList.slh_first, &v12->_parameterList.slh_first, a3, (__int16 *)&v36, v27);
    if (v8 == 4)
    {
      slh_first = p_rendererList->slh_first;
      if (p_rendererList->slh_first)
      {
        v24 = 0;
        do
        {
          objc_opt_class();
          v24 += objc_opt_isKindOfClass() & 1;
          slh_first = slh_first->var0.var0;
        }
        while (slh_first);
        v25 = v24 < 2;
      }
      else
      {
        v25 = 1;
      }
      BYTE1(v41) = v25;
    }
    else
    {
      v25 = BYTE1(v41);
    }
    v12->_originalMarkerRendererNode = (BWRenderListRendererNode *)*((_QWORD *)&v37 + 1);
    v12->_affectsMetadata = v41;
    v12->_supportsAnimation = v25;
    v12->_originalFilterNames = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", objc_msgSend(a4, "valueForKeyPath:", CFSTR("name")));
    v12->_processedFilterNames = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", objc_msgSend(a5, "valueForKeyPath:", CFSTR("name")));

  }
  return v12;
}

- (uint64_t)_continueOptimizingRendererList:(_QWORD *)a3 parameterList:(void *)a4 withFilter:(void *)a5 fromProvider:(uint64_t)a6 context:
{
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  if (!result)
    return result;
  v11 = result;
  v12 = (void *)objc_msgSend(a4, "name");
  v13 = objc_msgSend((id)objc_opt_class(), "shallowDepthOfFieldFilterName");
  v14 = objc_msgSend(v12, "isEqualToString:", CFSTR("CIDepthEffectMakeBlurMap"));
  v15 = objc_msgSend(v12, "isEqualToString:", v13);
  v16 = -[BWRenderList _shouldUseMetalRendererForFilterWithName:](v11);
  if (!*(_WORD *)(a6 + 48))
  {
    if (-[BWRenderList _shouldStreamingSDOFRendererConsumeFilter:](v11))
    {
      objc_msgSend(*(id *)(a6 + 40), "addObject:", a4);
      if (*(void **)(a6 + 32) == a4)
        *(_BYTE *)(a6 + 50) = 1;
      return -[BWRenderList _appendBatchRendererFromProvider:toRendererList:parameterList:withContext:](v11, a5, a2, a3, a6);
    }
    -[BWRenderList _appendBatchRendererFromProvider:toRendererList:parameterList:withContext:](v11, a5, a2, a3, a6);
  }
  if (v15 | v14)
  {
    result = -[BWRenderList _appendBatchRendererFromProvider:toRendererList:parameterList:withContext:](v11, a5, a2, a3, a6);
    switch(*(_WORD *)a6)
    {
      case 0:
      case 4:
        *(_WORD *)(a6 + 48) = 0;
        goto LABEL_17;
      case 1:
        *(_QWORD *)(a6 + 56) = a4;
        v18 = v11;
        v19 = 1;
        return -[BWRenderList _appendSingleRendererOfType:forFilter:fromProvider:toRendererList:parameterList:withContext:](v18, v19, (uint64_t)a4, a5, a2, a3, a6);
      case 2:
        if ((objc_msgSend((id)objc_msgSend(a4, "name"), "isEqualToString:", CFSTR("CIDepthEffectMakeBlurMap")) & 1) == 0)
          objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CIFilter must be of type CIDepthEffectMakeBlurMap.  Received: %@."), objc_msgSend(a4, "name")), 0));
        v18 = v11;
        v19 = 3;
        return -[BWRenderList _appendSingleRendererOfType:forFilter:fromProvider:toRendererList:parameterList:withContext:](v18, v19, (uint64_t)a4, a5, a2, a3, a6);
      default:
        return result;
    }
  }
  else
  {
    v17 = *(unsigned __int16 *)(a6 + 48);
    if (v16)
    {
      if (v17 != 5)
      {
        -[BWRenderList _appendBatchRendererFromProvider:toRendererList:parameterList:withContext:](v11, a5, a2, a3, a6);
        *(_WORD *)(a6 + 48) = 5;
      }
      v18 = v11;
      v19 = 5;
      return -[BWRenderList _appendSingleRendererOfType:forFilter:fromProvider:toRendererList:parameterList:withContext:](v18, v19, (uint64_t)a4, a5, a2, a3, a6);
    }
    else
    {
      if (v17 != 4)
      {
        -[BWRenderList _appendBatchRendererFromProvider:toRendererList:parameterList:withContext:](v11, a5, a2, a3, a6);
        *(_WORD *)(a6 + 48) = 4;
      }
LABEL_17:
      result = objc_msgSend(*(id *)(a6 + 40), "addObject:", a4);
      if (*(void **)(a6 + 32) == a4)
        *(_BYTE *)(a6 + 50) = 1;
    }
  }
  return result;
}

- (uint64_t)_finishOptimizingRendererList:(_QWORD *)a3 parameterList:(void *)a4 fromProvider:(__int16 *)a5 context:(void *)a6 stillImageSettings:
{
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;

  if (result)
  {
    v11 = result;
    -[BWRenderList _appendBatchRendererFromProvider:toRendererList:parameterList:withContext:](result, a4, a2, a3, (uint64_t)a5);
    v12 = *((_QWORD *)a5 + 7);
    if (v12)
    {
      v13 = *a5 - 1;
      if (v13 <= 2)
        -[BWRenderList _appendSingleRendererOfType:forFilter:fromProvider:toRendererList:parameterList:withContext:](v11, (0x400040002uLL >> (16 * v13)) & 6, v12, a4, a2, a3, (uint64_t)a5);
    }
    if (!FigCaptureCurrentProcessIsDeferredmediad()
      && FigCaptureCurrentProcessIsBWCrucible()
      && (objc_msgSend((id)objc_msgSend(a6, "captureSettings"), "produceDeferredPhotoProxyImage") & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(a6, "captureSettings"), "deliverDeferredPhotoProxyImage");
    }
    result = BWIsSmartStyleAllowedForAdjustedImage(a6);
    if ((_DWORD)result)
      return -[BWRenderList _appendSingleRendererOfType:forFilter:fromProvider:toRendererList:parameterList:withContext:](v11, 6, 0, a4, a2, a3, (uint64_t)a5);
  }
  return result;
}

- (void)dealloc
{
  BWRenderListRendererNode *slh_first;
  BWRenderListRendererList *p_rendererList;
  BWRenderListRendererNode *var0;
  BWRenderListRendererNode *v6;
  BWRenderListRendererList *v7;
  BWRenderListParameterNode *v8;
  BWRenderListParameterNode *v9;
  BWRenderListParameterNode *v10;
  BWRenderListParameterList *p_parameterList;
  objc_super v12;

  p_rendererList = &self->_rendererList;
  slh_first = self->_rendererList.slh_first;
  self->_originalMarkerRendererNode = 0;
  if (slh_first)
  {
    do
    {
      var0 = slh_first->var0.var0;

      v6 = p_rendererList->slh_first;
      v7 = p_rendererList;
      while (v6 != slh_first)
      {
        v7 = (BWRenderListRendererList *)v6;
        v6 = v6->var0.var0;
      }
      v7->slh_first = slh_first->var0.var0;
      free(slh_first);
      slh_first = var0;
    }
    while (var0);
  }
  v8 = self->_parameterList.slh_first;
  if (v8)
  {
    do
    {
      v9 = *(BWRenderListParameterNode **)v8;

      v10 = self->_parameterList.slh_first;
      p_parameterList = &self->_parameterList;
      while (v10 != v8)
      {
        p_parameterList = (BWRenderListParameterList *)v10;
        v10 = *(BWRenderListParameterNode **)v10;
      }
      p_parameterList->slh_first = *(BWRenderListParameterNode **)v8;
      free(v8);
      v8 = v9;
    }
    while (v9);
  }

  v12.receiver = self;
  v12.super_class = (Class)BWRenderList;
  -[BWRenderList dealloc](&v12, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  BWRenderListRendererNode *slh_first;
  const __CFString *v5;
  uint64_t v6;
  objc_class *v7;
  BWRenderListParameterNode *v8;
  const __CFString *v9;
  uint64_t v10;
  objc_class *v11;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self);
  if (-[NSSet count](self->_originalFilterNames, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR(", Original:[%@]"), -[NSArray componentsJoinedByString:](-[NSSet allObjects](self->_originalFilterNames, "allObjects"), "componentsJoinedByString:", CFSTR(",")));
  if (-[NSSet count](self->_processedFilterNames, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR(", Processed:[%@]"), -[NSArray componentsJoinedByString:](-[NSSet allObjects](self->_processedFilterNames, "allObjects"), "componentsJoinedByString:", CFSTR(",")));
  slh_first = self->_rendererList.slh_first;
  if (slh_first)
    v5 = CFSTR(", Renderers: ");
  else
    v5 = CFSTR(", No Renderers");
  objc_msgSend(v3, "appendString:", v5);
  if (slh_first)
  {
    v6 = 0;
    do
    {
      v7 = (objc_class *)objc_opt_class();
      objc_msgSend(v3, "appendFormat:", CFSTR("[%u] %@ "), v6, NSStringFromClass(v7));
      slh_first = slh_first->var0.var0;
      v6 = (v6 + 1);
    }
    while (slh_first);
  }
  v8 = self->_parameterList.slh_first;
  if (v8)
    v9 = CFSTR(", Parameters: ");
  else
    v9 = CFSTR(", No Parameters");
  objc_msgSend(v3, "appendString:", v9);
  if (v8)
  {
    v10 = 0;
    do
    {
      v11 = (objc_class *)objc_opt_class();
      objc_msgSend(v3, "appendFormat:", CFSTR("[%u] %@ "), v10, NSStringFromClass(v11));
      v8 = *(BWRenderListParameterNode **)v8;
      v10 = (v10 + 1);
    }
    while (v8);
  }
  return (NSString *)v3;
}

- (void)prepareWithParameters:(id)a3 forInputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5
{
  BWRenderListParameterList *p_parameterList;
  BWRenderListRendererList *p_rendererList;

  if (!-[BWRenderList isPrepared](self, "isPrepared"))
  {
    if (a3)
      p_parameterList = (BWRenderListParameterList *)objc_msgSend(a3, "parameterList");
    else
      p_parameterList = &self->_parameterList;
    p_rendererList = &self->_rendererList;
    while (1)
    {
      p_rendererList = (BWRenderListRendererList *)p_rendererList->slh_first;
      if (!p_rendererList)
        break;
      p_parameterList = (BWRenderListParameterList *)p_parameterList->slh_first;
      if (-[BWRenderListRendererNode prepareForRenderingWithParameters:inputVideoFormat:inputMediaPropertiesByAttachedMediaKey:](p_rendererList[1].slh_first, "prepareForRenderingWithParameters:inputVideoFormat:inputMediaPropertiesByAttachedMediaKey:", p_parameterList[1].slh_first, a4, a5))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        return;
      }
    }
    -[BWRenderList setPrepared:](self, "setPrepared:", 1);
  }
}

- (BOOL)producesOriginalRender
{
  return self->_originalMarkerRendererNode != 0;
}

- (BOOL)shouldAllowOriginalRenderFromNode:(BWRenderListRendererNode *)a3
{
  return self->_originalMarkerRendererNode == a3;
}

- (uint64_t)_shouldUseMetalRendererForFilterWithName:(uint64_t)a1
{
  char isKindOfClass;
  char v2;
  char v3;
  char v4;

  if (a1)
  {
    NSClassFromString(CFSTR("CIPhotoEffect"));
    isKindOfClass = objc_opt_isKindOfClass();
    NSClassFromString(CFSTR("CIPhotoEffect3D"));
    v2 = objc_opt_isKindOfClass();
    NSClassFromString(CFSTR("CIColorCubeWithColorSpace"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      NSClassFromString(CFSTR("CIColorCubesMixedWithMask"));
      v3 = objc_opt_isKindOfClass();
    }
    if ((isKindOfClass & 1) != 0)
      v4 = 1;
    else
      v4 = v2 | v3;
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (uint64_t)_shouldStreamingSDOFRendererConsumeFilter:(uint64_t)a1
{
  unsigned __int8 isKindOfClass;
  unsigned __int8 v2;
  char v3;
  char v4;
  char v5;

  if (a1)
  {
    NSClassFromString(CFSTR("CIPhotoEffect"));
    isKindOfClass = objc_opt_isKindOfClass();
    NSClassFromString(CFSTR("CIPhotoEffect3D"));
    v2 = objc_opt_isKindOfClass();
    NSClassFromString(CFSTR("CIPortraitEffect"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      NSClassFromString(CFSTR("CIPortraitEffectV2"));
      v3 = objc_opt_isKindOfClass();
    }
    NSClassFromString(CFSTR("CIColorCubeWithColorSpace"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      NSClassFromString(CFSTR("CIColorCubesMixedWithMask"));
      v4 = objc_opt_isKindOfClass();
    }
    if (((isKindOfClass | v2) & 1) != 0)
      v5 = 1;
    else
      v5 = v3 | v4;
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (uint64_t)_appendSingleRendererOfType:(uint64_t)a3 forFilter:(void *)a4 fromProvider:(_QWORD *)a5 toRendererList:(_QWORD *)a6 parameterList:(uint64_t)a7 withContext:
{
  uint64_t v12;
  BOOL v13;
  int v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  char v20;
  id v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v12 = *(_QWORD *)(a7 + 32);
    v13 = a3 && v12 == a3;
    v14 = v13;
    v21 = 0;
    v22 = 0;
    if (a3)
    {
      v23[0] = a3;
      v15 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1, v21);
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0C9AA60];
    }
    result = rl_concreteRendererWithParametersForType(a2, a4, (uint64_t *)&v22, (uint64_t *)&v21, v15, v12, v14);
    if (v22)
    {
      v16 = malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
      v16[1] = v22;
      v17 = *(_QWORD **)(a7 + 8);
      if (!v17)
        v17 = a5;
      *v16 = *v17;
      *v17 = v16;
      *(_QWORD *)(a7 + 8) = v16;
      v18 = malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
      v18[1] = v21;
      v19 = *(_QWORD **)(a7 + 16);
      if (!v19)
        v19 = a6;
      *v18 = *v19;
      *v19 = v18;
      *(_QWORD *)(a7 + 16) = v18;
      if (v14)
        *(_QWORD *)(a7 + 24) = v16;
      if (*(_BYTE *)(a7 + 64))
        v20 = 1;
      else
        v20 = objc_msgSend(v22, "adjustsMetadata");
      *(_BYTE *)(a7 + 64) = v20;
      if (*(_BYTE *)(a7 + 65))
        result = 1;
      else
        result = objc_msgSend(v22, "supportsAnimation");
      *(_BYTE *)(a7 + 65) = result;
    }
  }
  return result;
}

+ (id)shallowDepthOfFieldFilterName
{
  return CFSTR("CIDepthEffect");
}

- (BOOL)hasMetalColorCubeRenderer
{
  BWRenderListRendererList *p_rendererList;

  p_rendererList = &self->_rendererList;
  do
  {
    p_rendererList = (BWRenderListRendererList *)p_rendererList->slh_first;
    if (!p_rendererList)
      break;
    objc_opt_class();
  }
  while ((objc_opt_isKindOfClass() & 1) == 0);
  return p_rendererList != 0;
}

- (BOOL)supportsAnimation
{
  return self->_supportsAnimation;
}

- (NSSet)originalFilterNames
{
  return self->_originalFilterNames;
}

- (NSSet)processedFilterNames
{
  return self->_processedFilterNames;
}

@end
