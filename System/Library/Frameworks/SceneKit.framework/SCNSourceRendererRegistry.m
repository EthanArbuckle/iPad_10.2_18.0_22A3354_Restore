@implementation SCNSourceRendererRegistry

- (void)removeSourceRenderersForEngineContext:(__C3DEngineContext *)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&sourceRendererRegistryAccessMutex);
  CFDictionaryRemoveValue(self->_registry, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&sourceRendererRegistryAccessMutex);
}

+ (id)sharedRegistry
{
  if (sharedRegistry_onceToken != -1)
    dispatch_once(&sharedRegistry_onceToken, &__block_literal_global_115);
  return (id)sharedRegistry_sharedRegistry;
}

- (void)endFrameForEngineContext:(__C3DEngineContext *)a3
{
  const __CFDictionary *Value;
  const __CFDictionary *v6;
  CFIndex Count;
  CFIndex v8;
  size_t v9;
  const void **v10;
  const void **v11;
  uint64_t i;
  void *v13;

  os_unfair_lock_lock((os_unfair_lock_t)&sourceRendererRegistryAccessMutex);
  Value = (const __CFDictionary *)CFDictionaryGetValue(self->_registry, a3);
  if (Value)
  {
    v6 = Value;
    Count = CFDictionaryGetCount(Value);
    if (Count >= 1)
    {
      v8 = Count;
      v9 = 8 * Count;
      v10 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
      v11 = (const void **)malloc_type_malloc(v9, 0x80040B8603338uLL);
      CFDictionaryGetKeysAndValues(v6, v10, v11);
      for (i = 0; i != v8; ++i)
      {
        v13 = (void *)v11[i];
        if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v13, "scene"))
          CFDictionaryRemoveValue(v6, v10[i]);
      }
      free(v10);
      free(v11);
      CFDictionaryApplyFunction(v6, (CFDictionaryApplierFunction)_removeSKRendererLinkToSource, 0);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sourceRendererRegistryAccessMutex);
}

SCNSourceRendererRegistry *__43__SCNSourceRendererRegistry_sharedRegistry__block_invoke()
{
  SCNSourceRendererRegistry *result;

  result = objc_alloc_init(SCNSourceRendererRegistry);
  sharedRegistry_sharedRegistry = (uint64_t)result;
  return result;
}

- (SCNSourceRendererRegistry)init
{
  SCNSourceRendererRegistry *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNSourceRendererRegistry;
  v2 = -[SCNSourceRendererRegistry init](&v4, sel_init);
  if (v2)
    v2->_registry = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  return v2;
}

- (void)dealloc
{
  __CFDictionary *registry;
  objc_super v4;

  registry = self->_registry;
  if (registry)
    CFRelease(registry);
  v4.receiver = self;
  v4.super_class = (Class)SCNSourceRendererRegistry;
  -[SCNSourceRendererRegistry dealloc](&v4, sel_dealloc);
}

- (void)rendererDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  if (pthread_main_np())
  {
    v4 = objc_msgSend(a3, "layer");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SCNLayerTreeDidChange"), v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
    v5 = objc_msgSend(a3, "layer");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SCNLayerTreeDidChange"), v5);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

- (id)sourceRendererForEngineContext:(__C3DEngineContext *)a3 source:(id)a4 textureSource:(id)a5 targetTexture:(id)a6
{
  void *Value;
  void *v12;
  void *v13;
  void *v14;
  Class v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t RenderContext;
  void *v21;
  uint64_t GLContext;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  double v33;
  double v34;
  double v35;
  const __CFString *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&sourceRendererRegistryAccessMutex);
  Value = (void *)CFDictionaryGetValue(self->_registry, a3);
  if (!Value)
  {
    Value = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
    CFDictionarySetValue(self->_registry, a3, Value);
    CFRelease(Value);
  }
  v12 = (void *)CFDictionaryGetValue((CFDictionaryRef)Value, a4);
  if (v12)
  {
    v13 = v12;
    __SKSceneClass();
    if (objc_opt_class())
    {
      __SKSceneClass();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v13, "setScene:", a4);
    }
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = (void *)objc_msgSend(a4, "rendererOptions");
      if (!v14)
      {
LABEL_19:
        v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
LABEL_20:
        v19 = v18;
        if (a6)
        {
          objc_msgSend(v18, "setObject:forKeyedSubscript:", C3DColorSpaceLinearSRGB(), *MEMORY[0x1E0CD3088]);
          RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
          objc_msgSend(v19, "setObject:forKeyedSubscript:", -[SCNMTLRenderContext commandQueue](RenderContext), *MEMORY[0x1E0CD3090]);
          objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD3080]);
          v21 = (void *)objc_msgSend(MEMORY[0x1E0CD2820], "rendererWithMTLTexture:options:", a6, v19);
        }
        else
        {
          GLContext = C3DRendererContextGetGLContext(objc_msgSend(a5, "rendererContextForTextureSourceWithEngineContext:", a3));
          if (!GLContext)
          {
            v23 = scn_default_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
              C3DEngineContextGetScene_cold_1(v23, v24, v25, v26, v27, v28, v29, v30);
          }
          v21 = (void *)objc_msgSend(MEMORY[0x1E0CD2820], "rendererWithEAGLContext:options:", GLContext, v19);
        }
        v13 = v21;
        objc_msgSend(v21, "setDelegate:", self);

        if (v13)
          goto LABEL_27;
        goto LABEL_28;
      }
    }
    else
    {
      if (!objc_msgSend((id)objc_msgSend(a4, "valueForKey:", CFSTR("SCN_isBackingUIView")), "BOOLValue"))
        goto LABEL_19;
      v36 = CFSTR("kCARendererFlags");
      v37[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 3);
      v14 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      if (!v14)
        goto LABEL_19;
    }
    v18 = (id)objc_msgSend(v14, "mutableCopy");
    goto LABEL_20;
  }
  __SKSceneClass();
  if (!objc_opt_class() || (__SKSceneClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v13 = 0;
    goto LABEL_28;
  }
  v15 = NSClassFromString(CFSTR("SKSCNRenderer"));
  v16 = C3DEngineContextGetRenderContext((uint64_t)a3);
  if (v16)
    v17 = (void *)-[objc_class rendererWithDevice:options:](v15, "rendererWithDevice:options:", -[SCNMTLRenderContext device](v16), 0);
  else
    v17 = (void *)-[objc_class rendererWithContext:options:](v15, "rendererWithContext:options:", C3DEngineContextGetGLContext((uint64_t)a3), 0);
  v13 = v17;
  objc_msgSend(v17, "setScene:", a4);
  objc_msgSend(v13, "setBackingScaleFactor:", 1.0);
  objc_msgSend(a4, "size");
  v34 = v33;
  objc_msgSend(a4, "size");
  objc_msgSend(v13, "setBounds:", 0.0, 0.0, v34, v35);
  if (v13)
LABEL_27:
    CFDictionarySetValue((CFMutableDictionaryRef)Value, a4, v13);
LABEL_28:
  v31 = v13;
  os_unfair_lock_unlock((os_unfair_lock_t)&sourceRendererRegistryAccessMutex);
  return v13;
}

- (void)removeSourceRenderersForSource:(id)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&sourceRendererRegistryAccessMutex);
  CFDictionaryApplyFunction(self->_registry, (CFDictionaryApplierFunction)_removeSourceRendererForSource, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&sourceRendererRegistryAccessMutex);
}

@end
