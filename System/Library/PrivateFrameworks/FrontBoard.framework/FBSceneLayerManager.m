@implementation FBSceneLayerManager

- (void)_setLayers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id WeakRetained;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSOrderedSet *layers;
  uint64_t v19;
  NSOrderedSet *fbsLayers;
  id v21;
  NSUInteger v22;
  id v23;
  FBSceneLayerManager *v24;
  id *location;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneLayerManager _setLayers:]");
  if ((BSEqualObjects() & 1) == 0)
  {
    v24 = self;
    v22 = -[NSOrderedSet count](self->_layers, "count");
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v23 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
      location = (id *)&self->_scene;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          +[FBSceneLayer layerWithFBSSceneLayer:](FBSceneLayer, "layerWithFBSSceneLayer:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v5, "addObject:", v12);
          }
          else
          {
            WeakRetained = objc_loadWeakRetained(location);
            FBLogCommon();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(WeakRetained, "clientHandle");
              v15 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v31 = v11;
              v32 = 2114;
              v33 = v15;
              v16 = (void *)v15;
              _os_log_error_impl(&dword_1A359A000, v14, OS_LOG_TYPE_ERROR, "Ignoring bogus scene layer %{public}@ from %{public}@", buf, 0x16u);

            }
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v8);
    }

    v17 = objc_msgSend(v5, "copy");
    layers = v24->_layers;
    v24->_layers = (NSOrderedSet *)v17;

    v19 = objc_msgSend(v6, "copy");
    fbsLayers = v24->_fbsLayers;
    v24->_fbsLayers = (NSOrderedSet *)v19;

    v21 = objc_loadWeakRetained((id *)&v24->_scene);
    if (objc_msgSend(v21, "isActive"))
    {
      if (objc_msgSend(v5, "count") && !v22)
        -[FBSceneLayerManager _observer_didStartTrackingLayers](v24, "_observer_didStartTrackingLayers");
      -[FBSceneLayerManager _observer_sceneLayerManagerDidUpdateLayers](v24, "_observer_sceneLayerManagerDidUpdateLayers");
      if (!objc_msgSend(v5, "count") && v22)
        -[FBSceneLayerManager _observer_didStopTrackingLayers](v24, "_observer_didStopTrackingLayers");
    }

    v4 = v23;
  }

}

- (void)_observer_sceneLayerManagerDidUpdateLayers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "sceneLayerManagerDidUpdateLayers:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (NSOrderedSet)layers
{
  return self->_layers;
}

- (void)_observer_didStartTrackingLayers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "sceneLayerManagerDidStartTrackingLayers:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (FBScene)scene
{
  return (FBScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)addObserver:(id)a3
{
  void *v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneLayerManager addObserver:]");
  v4 = v8;
  if (v8)
  {
    observers = self->_observers;
    if (!observers)
    {
      v6 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 4);
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v8);
    v4 = v8;
  }

}

- (id)_initWithScene:(id)a3
{
  id v5;
  void *v6;
  FBSceneLayerManager *v7;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSOrderedSet *layers;
  void *v13;
  objc_super v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("scene"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSceneLayerManager _initWithScene:].cold.1(a2, (uint64_t)self, (uint64_t)v13);
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A35B40C0);
  }
  v6 = v5;
  if (_initWithScene__onceToken != -1)
    dispatch_once(&_initWithScene__onceToken, &__block_literal_global_22);
  v14.receiver = self;
  v14.super_class = (Class)FBSceneLayerManager;
  v7 = -[FBSceneLayerManager init](&v14, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    objc_storeWeak((id *)&v7->_scene, v6);
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v10 = objc_claimAutoreleasedReturnValue();
    layers = v7->_layers;
    v7->_layers = (NSOrderedSet *)v10;

  }
  return v7;
}

- (void)removeObserver:(id)a3
{
  NSHashTable *observers;
  id v5;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __FB_REPORT_MAIN_THREAD_VIOLATION__(0, (uint64_t)"-[FBSceneLayerManager removeObserver:]");
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
  if (!-[NSHashTable count](self->_observers, "count"))
  {
    observers = self->_observers;
    self->_observers = 0;

  }
}

- (id)layerWithContextID:(unsigned int)a3
{
  NSOrderedSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_layers;
  v5 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "contextID", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (NSString)description
{
  return (NSString *)-[FBSceneLayerManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSceneLayerManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSceneLayerManager identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("identifier"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSceneLayerManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[FBSceneLayerManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSOrderedSet count](self->_layers, "count"))
  {
    -[NSOrderedSet array](self->_layers, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v6, CFSTR("layers"), v4, 1);

  }
  else
  {
    v7 = (id)objc_msgSend(v5, "appendObject:withName:", CFSTR("(none)"), CFSTR("layers"));
  }

  return v5;
}

uint64_t __38__FBSceneLayerManager__initWithScene___block_invoke()
{
  objc_opt_class();
  return _class_setCustomDeallocInitiation();
}

- (void)_objc_initiateDealloc
{
  if (pthread_main_np())
    _objc_deallocOnMainThreadHelper();
  else
    dispatch_async_f(MEMORY[0x1E0C80D38], self, (dispatch_function_t)MEMORY[0x1E0DE7980]);
}

- (void)_observer_didStopTrackingLayers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "sceneLayerManagerDidStopTrackingLayers:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_fbsLayers, 0);
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)_initWithScene:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("FBSceneLayerManager.m");
  v16 = 1024;
  v17 = 106;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
