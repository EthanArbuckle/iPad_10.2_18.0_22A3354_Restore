@implementation AVMicaPackage

- (Class)CAMLParser:(id)a3 didFailToFindClassWithName:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a4;
  objc_msgSend((id)objc_opt_class(), "classSubstitions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v6;
}

+ (NSDictionary)classSubstitions
{
  if (classSubstitions_onceToken != -1)
    dispatch_once(&classSubstitions_onceToken, &__block_literal_global_31_17312);
  return (NSDictionary *)(id)classSubstitions__substitutions;
}

- (void)setState:(id)a3 color:(CGColor *)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("on")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("off")))
  {
    -[AVMicaPackage _setState:](self, "_setState:", 0);
  }
  -[AVMicaPackage _setState:](self, "_setState:", v7);
  if (a4)
  {
    -[AVMicaPackage rootLayer](self, "rootLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMicaPackage _recursivelySetFillColor:rootLayer:](self, "_recursivelySetFillColor:rootLayer:", a4, v6);

  }
}

- (void)_setState:(id)a3
{
  NSString *v4;
  NSString *state;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_state, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    state = self->_state;
    self->_state = v4;

    -[AVMicaPackage transitionToStateWithName:](self, "transitionToStateWithName:", v6);
  }

}

- (void)transitionToStateWithName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVMicaPackage rootLayer](self, "rootLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AVMicaPackage transitionToStateWithName:onLayer:](self, "transitionToStateWithName:onLayer:", v4, v5);

}

- (void)transitionToStateWithName:(id)a3 onLayer:(id)a4
{
  id v6;
  void *v7;
  double v8;
  id v9;

  v6 = a4;
  objc_msgSend(v6, "stateWithName:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[AVMicaPackage stateController](self, "stateController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1.0;
  objc_msgSend(v7, "setState:ofLayer:transitionSpeed:", v9, v6, v8);

}

- (CAStateController)stateController
{
  return self->_stateController;
}

- (void)_recursivelySetFillColor:(CGColor *)a3 rootLayer:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
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
  objc_msgSend(a4, "sublayers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v11, "setFillColor:", a3);
        -[AVMicaPackage _recursivelySetFillColor:rootLayer:](self, "_recursivelySetFillColor:rootLayer:", a3, v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)setTargetSize:(CGSize)a3
{
  double v5;
  double v6;
  CGFloat v7;
  void *v8;
  CATransform3D v9;

  if (self->_targetSize.width != a3.width || self->_targetSize.height != a3.height)
  {
    self->_targetSize = a3;
    v5 = a3.width / self->_unscaledSize.width;
    v6 = a3.height / self->_unscaledSize.height;
    if (v5 >= v6)
      v7 = v6;
    else
      v7 = v5;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[AVMicaPackage rootLayer](self, "rootLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CATransform3DMakeScale(&v9, v7, -v7, 1.0);
    objc_msgSend(v8, "setTransform:", &v9);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

void __85__AVMicaPackage_asynchronouslyPrepareMicaPackageWithName_layoutDirection_completion___block_invoke_2(uint64_t a1)
{
  AVMicaPackage *v2;
  id v3;
  AVMicaPackage *v4;
  _QWORD v5[4];
  AVMicaPackage *v6;
  id v7;

  v2 = -[AVMicaPackage initWithPackageName:layoutDirection:]([AVMicaPackage alloc], "initWithPackageName:layoutDirection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  -[AVMicaPackage _loadRootLayerIfNeeded](v2, "_loadRootLayerIfNeeded");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__AVMicaPackage_asynchronouslyPrepareMicaPackageWithName_layoutDirection_completion___block_invoke_3;
  v5[3] = &unk_1E5BB4C10;
  v3 = *(id *)(a1 + 40);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

- (CALayer)rootLayer
{
  -[AVMicaPackage _loadRootLayerIfNeeded](self, "_loadRootLayerIfNeeded");
  return self->_rootLayer;
}

- (void)_loadRootLayerIfNeeded
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  CALayer *v9;
  CALayer *rootLayer;
  CAStateController *v11;
  CAStateController *stateController;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  char v16;
  NSObject *v18;
  void *v19;
  int v20;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!self->_rootLayer)
  {
    -[AVMicaPackage packageName](self, "packageName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMicaPackage packageName](self, "packageName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("VolumeGlyph")))
    {
      v5 = -[AVMicaPackage layoutDirection](self, "layoutDirection");

      if (v5 != 1)
        goto LABEL_6;
      objc_msgSend(v3, "stringByAppendingString:", CFSTR("-RTL"));
      v4 = v3;
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_6:
    AVBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLForResource:withExtension:", v3, CFSTR("caml"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      _AVLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v25 = 138412290;
        v26 = v3;
        _os_log_error_impl(&dword_1AC4B1000, v18, OS_LOG_TYPE_ERROR, "Unexpectedly missing URL for CAML file. %@", (uint8_t *)&v25, 0xCu);
      }

      goto LABEL_22;
    }
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
    }
    objc_msgSend(MEMORY[0x1E0CD27B8], "parser");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);
    objc_msgSend(v8, "parseContentsOfURL:", v7);
    objc_msgSend(v8, "result");
    v9 = (CALayer *)objc_claimAutoreleasedReturnValue();
    rootLayer = self->_rootLayer;
    self->_rootLayer = v9;

    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    v11 = (CAStateController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2868]), "initWithLayer:", self->_rootLayer);
    stateController = self->_stateController;
    self->_stateController = v11;

    -[CAStateController setDelegate:](self->_stateController, "setDelegate:", self);
    -[CALayer bounds](self->_rootLayer, "bounds");
    self->_unscaledSize.width = v13;
    self->_unscaledSize.height = v14;
    -[AVMicaPackage packageName](self, "packageName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("VolumeGlyph"));

    if ((v16 & 1) != 0)
    {
      _Q0 = (CGSize)xmmword_1AC5F8240;
    }
    else
    {
      -[AVMicaPackage packageName](self, "packageName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("AVRoutePickerViewCircularAirPlayGlyph"));

      if (!v20)
      {
LABEL_19:
        if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
          -[AVMicaPackage setTargetSize:](self, "setTargetSize:", self->_unscaledSize.width, self->_unscaledSize.height);

LABEL_22:
        return;
      }
      __asm { FMOV            V0.2D, #18.0 }
    }
    self->_unscaledSize = _Q0;
    goto LABEL_19;
  }
}

- (NSString)packageName
{
  return self->_packageName;
}

- (AVMicaPackage)initWithPackageName:(id)a3 layoutDirection:(int64_t)a4
{
  id v7;
  AVMicaPackage *v8;
  AVMicaPackage *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVMicaPackage;
  v8 = -[AVMicaPackage init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_packageName, a3);
    v9->_layoutDirection = a4;
  }

  return v9;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

uint64_t __85__AVMicaPackage_asynchronouslyPrepareMicaPackageWithName_layoutDirection_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)asynchronouslyPrepareMicaPackageWithName:(id)a3 layoutDirection:(int64_t)a4 completion:(id)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  int64_t v15;

  v7 = a3;
  v8 = (void *)objc_msgSend(a5, "copy");
  if (asynchronouslyPrepareMicaPackageWithName_layoutDirection_completion__onceToken != -1)
    dispatch_once(&asynchronouslyPrepareMicaPackageWithName_layoutDirection_completion__onceToken, &__block_literal_global_17344);
  v9 = asynchronouslyPrepareMicaPackageWithName_layoutDirection_completion__micaPackageCreationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__AVMicaPackage_asynchronouslyPrepareMicaPackageWithName_layoutDirection_completion___block_invoke_2;
  block[3] = &unk_1E5BB3A28;
  v14 = v8;
  v15 = a4;
  v13 = v7;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

void __85__AVMicaPackage_asynchronouslyPrepareMicaPackageWithName_layoutDirection_completion___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.avkit.caml", v2);
  v1 = (void *)asynchronouslyPrepareMicaPackageWithName_layoutDirection_completion__micaPackageCreationQueue;
  asynchronouslyPrepareMicaPackageWithName_layoutDirection_completion__micaPackageCreationQueue = (uint64_t)v0;

}

void __33__AVMicaPackage_classSubstitions__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[11];
  _QWORD v3[12];

  v3[11] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("LKState");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("LKEventHandler");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("LKStateAddAnimation");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("LKStateAddElement");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("LKStateElement");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("LKStateRemoveAnimation");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("LKStateRemoveElement");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("LKStateSetValue");
  v3[7] = objc_opt_class();
  v2[8] = CFSTR("LKStateSetProperty");
  v3[8] = objc_opt_class();
  v2[9] = CFSTR("LKStateTransition");
  v3[9] = objc_opt_class();
  v2[10] = CFSTR("LKStateTransitionElement");
  v3[10] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)classSubstitions__substitutions;
  classSubstitions__substitutions = v0;

}

- (void)removeCompositingFiltersWithName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVMicaPackage rootLayer](self, "rootLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AVMicaPackage _recursivelyRemoveCompositingFiltersWithName:rootLayer:](self, "_recursivelyRemoveCompositingFiltersWithName:rootLayer:", v4, v5);

}

- (id)_recursivelyFindSublayerWithName:(id)a3 rootLayer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  id *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = (id *)&v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__17301;
  v20 = __Block_byref_object_dispose__17302;
  v21 = 0;
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v6);

  if (v9)
  {
    objc_storeStrong(v17 + 5, a4);
  }
  else
  {
    objc_msgSend(v7, "sublayers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__AVMicaPackage__recursivelyFindSublayerWithName_rootLayer___block_invoke;
    v13[3] = &unk_1E5BB3A70;
    v15 = &v16;
    v13[4] = self;
    v14 = v6;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

  }
  v11 = v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (void)_recursivelyRemoveCompositingFiltersWithName:(id)a3 rootLayer:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  int v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a4, "sublayers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "compositingFilter");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v11, "compositingFilter");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v6);

          if (v16)
            objc_msgSend(v11, "setCompositingFilter:", 0);

        }
        -[AVMicaPackage _recursivelyRemoveCompositingFiltersWithName:rootLayer:](self, "_recursivelyRemoveCompositingFiltersWithName:rootLayer:", v6, v11);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

}

- (id)availableStates
{
  void *v3;
  void *v4;

  -[AVMicaPackage rootLayer](self, "rootLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMicaPackage availableStatesOnLayer:](self, "availableStatesOnLayer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)availableStatesOnLayer:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "states");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__AVMicaPackage_availableStatesOnLayer___block_invoke;
  v9[3] = &unk_1E5BB3A98;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

- (id)sublayerWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AVMicaPackage rootLayer](self, "rootLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMicaPackage _recursivelyFindSublayerWithName:rootLayer:](self, "_recursivelyFindSublayerWithName:rootLayer:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setRootLayer:(id)a3
{
  objc_storeStrong((id *)&self->_rootLayer, a3);
}

- (NSString)state
{
  return self->_state;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)unscaledSize
{
  double width;
  double height;
  CGSize result;

  width = self->_unscaledSize.width;
  height = self->_unscaledSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setUnscaledSize:(CGSize)a3
{
  self->_unscaledSize = a3;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_packageName, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
}

void __40__AVMicaPackage_availableStatesOnLayer___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __60__AVMicaPackage__recursivelyFindSublayerWithName_rootLayer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "_recursivelyFindSublayerWithName:rootLayer:", *(_QWORD *)(a1 + 40), a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    *a4 = 1;
}

@end
