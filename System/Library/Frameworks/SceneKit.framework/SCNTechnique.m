@implementation SCNTechnique

- (id)initPresentationTechniqueWithTechniqueRef:(__C3DFXTechnique *)a3
{
  SCNTechnique *v4;
  SCNTechnique *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNTechnique;
  v4 = -[SCNTechnique init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)v4 + 8) |= 1u;
    v4->_technique = (__C3DFXTechnique *)CFRetain(a3);
    *(_QWORD *)&v5->_valueForSymbolLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (SCNTechnique)initWithTechniqueRef:(__C3DFXTechnique *)a3
{
  SCNTechnique *v4;
  __C3DFXTechnique *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNTechnique;
  v4 = -[SCNTechnique init](&v7, sel_init);
  if (v4)
  {
    v5 = (__C3DFXTechnique *)CFRetain(a3);
    v4->_technique = v5;
    if (v5)
      C3DEntitySetObjCWrapper((uint64_t)v5, v4);
    *(_QWORD *)&v4->_valueForSymbolLock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void)dealloc
{
  __C3DFXTechnique *technique;
  __C3DFXTechnique *v4;
  NSArray *passes;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)self + 8) & 1) == 0)
  {
    technique = self->_technique;
    if (technique)
      C3DEntitySetObjCWrapper((uint64_t)technique, 0);
  }

  v4 = self->_technique;
  if (v4)
  {
    CFRelease(v4);
    self->_technique = 0;
  }

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  passes = self->_passes;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](passes, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(passes);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "invalidate");
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](passes, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)SCNTechnique;
  -[SCNTechnique dealloc](&v10, sel_dealloc);
}

+ (SCNTechnique)techniqueWithDictionary:(NSDictionary *)dictionary
{
  const void *v4;
  SCNTechnique *v5;

  if (dictionary && -[NSDictionary count](dictionary, "count"))
  {
    v4 = (const void *)C3DFXTechniqueCreateWithDescription(dictionary, 0);
    v5 = -[SCNTechnique initWithTechniqueRef:]([SCNTechnique alloc], "initWithTechniqueRef:", v4);
    CFRelease(v4);
    return v5;
  }
  else
  {
    NSLog(CFSTR("failed to load technique from dictionary: %@"), a2, dictionary);
    return 0;
  }
}

+ (SCNTechnique)techniqueBySequencingTechniques:(NSArray *)techniques
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SCNTechnique *result;
  SCNTechnique *v10;
  SCNTechnique *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](techniques, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](techniques, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(techniques);
        objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v8++), "techniqueRef"));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](techniques, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }
  result = (SCNTechnique *)C3DFXTechniqueCreateBySequencingTechniques(v4, 0);
  if (result)
  {
    v10 = result;
    v11 = -[SCNTechnique initWithTechniqueRef:]([SCNTechnique alloc], "initWithTechniqueRef:", result);
    CFRelease(v10);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](techniques, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      v15 = MEMORY[0x1E0C809B0];
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(techniques);
          v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16);
          os_unfair_lock_lock((os_unfair_lock_t)(v17 + 32));
          v18 = *(void **)(v17 + 24);
          v19[0] = v15;
          v19[1] = 3221225472;
          v19[2] = __48__SCNTechnique_techniqueBySequencingTechniques___block_invoke;
          v19[3] = &unk_1EA59F6F0;
          v19[4] = v11;
          objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v19);
          os_unfair_lock_unlock((os_unfair_lock_t)(v17 + 32));
          ++v16;
        }
        while (v13 != v16);
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](techniques, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v13);
    }
    return v11;
  }
  return result;
}

uint64_t __48__SCNTechnique_techniqueBySequencingTechniques___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forUndefinedKey:", a3, a2);
}

- (void)handleBindingOfSymbol:(NSString *)symbol usingBlock:(SCNBindingBlock)block
{
  C3DFXTechniqueAddSymbolWithBindingBlock((uint64_t)self->_technique, symbol, block);
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)C3DFXTechniqueGetDescription((uint64_t)self->_technique);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return +[SCNTechnique techniqueWithDictionary:](SCNTechnique, "techniqueWithDictionary:", -[SCNTechnique dictionaryRepresentation](self, "dictionaryRepresentation", a3));
}

- (id)copy
{
  return -[SCNTechnique copyWithZone:](self, "copyWithZone:", 0);
}

- (__C3DFXTechnique)techniqueRef
{
  return self->_technique;
}

- (void)setValue:(id)a3 forSymbolNamed:(id)a4
{
  NSMutableDictionary *valueForSymbol;
  NSObject *v8;
  __C3DScene *v9;
  _QWORD v10[7];

  if ((*((_BYTE *)self + 8) & 1) == 0)
  {
    os_unfair_lock_lock(&self->_valueForSymbolLock);
    valueForSymbol = self->_valueForSymbol;
    if (valueForSymbol)
    {
      if (a3)
      {
LABEL_4:
        -[NSMutableDictionary setObject:forKey:](valueForSymbol, "setObject:forKey:", a3, a4);
LABEL_9:
        os_unfair_lock_unlock(&self->_valueForSymbolLock);
        v9 = -[SCNTechnique sceneRef](self, "sceneRef");
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __40__SCNTechnique_setValue_forSymbolNamed___block_invoke;
        v10[3] = &unk_1EA59F718;
        v10[4] = self;
        v10[5] = a4;
        v10[6] = a3;
        +[SCNTransaction postCommandWithContext:object:keyPath:applyBlock:](SCNTransaction, "postCommandWithContext:object:keyPath:applyBlock:", v9, self, a4, v10);
        return;
      }
    }
    else
    {
      valueForSymbol = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_valueForSymbol = valueForSymbol;
      if (a3)
        goto LABEL_4;
    }
    -[NSMutableDictionary removeObjectForKey:](valueForSymbol, "removeObjectForKey:", a4);
    goto LABEL_9;
  }
  v8 = scn_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[SCNTechnique setValue:forSymbolNamed:].cold.1((uint64_t)self, v8);
}

void __40__SCNTechnique_setValue_forSymbolNamed___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  const void *v5;
  const void *TextureSampler;
  id v7;
  uint64_t v8;
  _BYTE *v9;
  __C3DImage *v10;
  uint64_t SharedInstance;
  __int16 v12;
  _BYTE v13[64];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  C3DFXTechniqueGetValueForSymbol(*((_QWORD *)a1[4] + 2), a1[5], &v12);
  if (v12)
  {
    if (v12 != 5)
    {
      SCNWriteValueToTypedBytes(a1[6], (uint64_t)v13, v12);
      v7 = a1[5];
      v8 = *((_QWORD *)a1[4] + 2);
      v9 = v13;
LABEL_8:
      C3DFXTechniqueSetValueForSymbol(v8, v7, v9);
      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = a1[6];
      v3 = objc_msgSend(v2, "contents");
      if (v3)
      {
        v4 = (void *)v3;
        v5 = (const void *)C3DFXSamplerCreate();
        TextureSampler = (const void *)C3DEffectSlotGetTextureSampler(objc_msgSend(v2, "effectSlot"));
        C3DFXSamplerSetTextureSampler((uint64_t)v5, TextureSampler);
        if (objc_msgSend(v4, "conformsToProtocol:", &unk_1F040D6D0))
          C3DFXSamplerSetTexture((uint64_t)v5, v4);
        else
          C3DFXSamplerSetImage((uint64_t)v5, +[SCNMaterialProperty copyC3DImageFromImage:](SCNMaterialProperty, "copyC3DImageFromImage:", a1[6]));
        goto LABEL_13;
      }
      v7 = a1[5];
      v8 = *((_QWORD *)a1[4] + 2);
      v9 = 0;
      goto LABEL_8;
    }
    v10 = +[SCNMaterialProperty copyC3DImageFromImage:](SCNMaterialProperty, "copyC3DImageFromImage:", a1[6]);
    if (v10)
    {
      v5 = v10;
LABEL_13:
      C3DFXTechniqueSetValueForSymbol(*((_QWORD *)a1[4] + 2), a1[5], v5);
      CFRelease(v5);
    }
  }
LABEL_14:
  SharedInstance = C3DNotificationCenterGetSharedInstance();
  C3DNotificationCenterPostNotification(SharedInstance, CFSTR("kC3DNotificationEngineContextInvalidatePasses"), (const void *)objc_msgSend(a1[4], "sceneRef"), 0, 1u);
}

- (id)valueForUndefinedKey:(id)a3
{
  id v5;
  float32x2_t *ValueForSymbol;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  __int16 v13;

  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    +[SCNTransaction lock](SCNTransaction, "lock");
    v13 = 0;
    ValueForSymbol = (float32x2_t *)C3DFXTechniqueGetValueForSymbol((uint64_t)self->_technique, a3, &v13);
    v12 = (void *)SCNNSValueFromTypedBytes(ValueForSymbol, v13, v8, v9, v10, v11);
    +[SCNTransaction unlock](SCNTransaction, "unlock");
    return v12;
  }
  else
  {
    os_unfair_lock_lock(&self->_valueForSymbolLock);
    v5 = (id)-[NSMutableDictionary valueForKey:](self->_valueForSymbol, "valueForKey:", a3);
    os_unfair_lock_unlock(&self->_valueForSymbolLock);
    return v5;
  }
}

- (void)setLibrary:(id)library
{
  MTLLibrary *v3;
  __C3DScene *v6;
  _QWORD v7[6];

  v3 = self->_library;
  if (v3 != library)
  {

    self->_library = (MTLLibrary *)library;
    v6 = -[SCNTechnique sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __27__SCNTechnique_setLibrary___block_invoke;
    v7[3] = &unk_1EA59F740;
    v7[4] = self;
    v7[5] = library;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __27__SCNTechnique_setLibrary___block_invoke(uint64_t a1)
{
  C3DFXTechniqueSetLibrary(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(void **)(a1 + 40));
}

- (id)library
{
  return self->_library;
}

- (__C3DScene)sceneRef
{
  return (__C3DScene *)C3DGetScene((_QWORD *)-[SCNTechnique __CFObject](self, "__CFObject"));
}

- (id)scene
{
  id result;

  result = -[SCNTechnique sceneRef](self, "sceneRef");
  if (result)
    return C3DEntityGetObjCWrapper((id *)result);
  return result;
}

- (void)__CFObject
{
  return self->_technique;
}

- (__C3DAnimationManager)animationManager
{
  __C3DAnimationManager *result;

  result = -[SCNTechnique sceneRef](self, "sceneRef");
  if (result)
    return (__C3DAnimationManager *)C3DSceneGetAnimationManager((uint64_t)result);
  return result;
}

- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4
{
  os_unfair_lock_s *p_animationsLock;
  BOOL v8;
  _QWORD *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!a4)
    return 0;
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  v8 = objc_msgSend(-[SCNOrderedDictionary objectForKey:](self->_animations, "objectForKey:", a4), "animation") == (_QWORD)a3;
  if (v8)
  {
    -[SCNOrderedDictionary removeObjectForKey:](self->_animations, "removeObjectForKey:", a4);
    v9 = -[SCNTechnique __CFObject](self, "__CFObject");
    if ((CFTypeIsC3DEntity(v9) & 1) == 0)
    {
      v10 = scn_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[SCNTechnique __removeAnimation:forKey:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    C3DEntityRemoveAnimationForKey(v9, a4, 1);
  }
  os_unfair_lock_unlock(p_animationsLock);
  return v8;
}

- (void)addAnimationPlayer:(id)a3 forKey:(id)a4
{
  id v5;
  SCNOrderedDictionary *animations;
  __C3DScene *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[7];

  if (a3)
  {
    v5 = a4;
    if (!a4)
      v5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (!animations)
    {
      animations = objc_alloc_init(SCNOrderedDictionary);
      self->_animations = animations;
    }
    -[SCNOrderedDictionary setObject:forKey:](animations, "setObject:forKey:", a3, v5);
    os_unfair_lock_unlock(&self->_animationsLock);
    v8 = -[SCNTechnique sceneRef](self, "sceneRef");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __42__SCNTechnique_addAnimationPlayer_forKey___block_invoke;
    v16[3] = &unk_1EA59F718;
    v16[4] = a3;
    v16[5] = self;
    v16[6] = v5;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, self, v16);
  }
  else
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SCNTechnique addAnimationPlayer:forKey:].cold.1((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);
  }
}

void __42__SCNTechnique_addAnimationPlayer_forKey___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "prepareWithTarget:implicitDuration:", a1[5]);
  if ((SCNAddAnimation(a1[4], a1[5], a1[6]) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1[5] + 9);
    objc_msgSend(*((id *)a1[5] + 5), "removeObjectForKey:", a1[6]);
    os_unfair_lock_unlock((os_unfair_lock_t)a1[5] + 9);
  }
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  id v5;
  SCNAnimation *v6;
  SCNAnimationPlayer *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a3)
  {
    v5 = a4;
    v6 = (SCNAnimation *)a3;
    if (!a4)
      v5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = +[SCNAnimation animationWithCAAnimation:](SCNAnimation, "animationWithCAAnimation:", v6);
    v7 = +[SCNAnimationPlayer animationPlayerWithSCNAnimation:](SCNAnimationPlayer, "animationPlayerWithSCNAnimation:", v6);
    -[SCNTechnique addAnimationPlayer:forKey:](self, "addAnimationPlayer:forKey:", v7, v5);
    -[SCNAnimationPlayer play](v7, "play");
  }
  else
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNTechnique addAnimation:forKey:].cold.1((uint64_t)self, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (void)addAnimation:(id)a3
{
  -[SCNTechnique addAnimation:forKey:](self, "addAnimation:forKey:", a3, 0);
}

- (void)removeAllAnimations
{
  os_unfair_lock_s *p_animationsLock;
  __C3DScene *v4;
  _QWORD v5[5];

  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  -[SCNOrderedDictionary removeAllObjects](self->_animations, "removeAllObjects");
  os_unfair_lock_unlock(p_animationsLock);
  v4 = -[SCNTechnique sceneRef](self, "sceneRef");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__SCNTechnique_removeAllAnimations__block_invoke;
  v5[3] = &unk_1EA59E4A0;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v4, self, v5);
}

void __35__SCNTechnique_removeAllAnimations__block_invoke(uint64_t a1)
{
  SCNRemoveAllAnimations(*(void **)(a1 + 32));
}

- (void)removeAllAnimationsWithBlendOutDuration:(double)a3
{
  os_unfair_lock_s *p_animationsLock;
  __C3DScene *v6;
  _QWORD v7[6];

  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  -[SCNOrderedDictionary removeAllObjects](self->_animations, "removeAllObjects");
  os_unfair_lock_unlock(p_animationsLock);
  v6 = -[SCNTechnique sceneRef](self, "sceneRef");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SCNTechnique_removeAllAnimationsWithBlendOutDuration___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
}

void __56__SCNTechnique_removeAllAnimationsWithBlendOutDuration___block_invoke(uint64_t a1)
{
  SCNFadeAndRemoveAllAnimations(*(void **)(a1 + 32), *(double *)(a1 + 40));
}

- (void)removeAnimationForKey:(id)a3
{
  os_unfair_lock_s *p_animationsLock;
  __C3DScene *v6;
  _QWORD v7[6];

  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    -[SCNOrderedDictionary removeObjectForKey:](self->_animations, "removeObjectForKey:", a3);
    os_unfair_lock_unlock(p_animationsLock);
    v6 = -[SCNTechnique sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__SCNTechnique_removeAnimationForKey___block_invoke;
    v7[3] = &unk_1EA59F740;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __38__SCNTechnique_removeAnimationForKey___block_invoke(uint64_t a1)
{
  SCNRemoveAnimation(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (void)removeAnimationForKey:(id)a3 blendOutDuration:(double)a4
{
  os_unfair_lock_s *p_animationsLock;
  __C3DScene *v8;
  _QWORD v9[7];

  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    -[SCNOrderedDictionary removeObjectForKey:](self->_animations, "removeObjectForKey:", a3);
    os_unfair_lock_unlock(p_animationsLock);
    v8 = -[SCNTechnique sceneRef](self, "sceneRef");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__SCNTechnique_removeAnimationForKey_blendOutDuration___block_invoke;
    v9[3] = &unk_1EA59E2B0;
    v9[4] = self;
    v9[5] = a3;
    *(double *)&v9[6] = a4;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, self, v9);
  }
}

void __55__SCNTechnique_removeAnimationForKey_blendOutDuration___block_invoke(uint64_t a1)
{
  SCNFadeAndRemoveAnimation(*(void **)(a1 + 32), *(void **)(a1 + 40), *(double *)(a1 + 48));
}

- (NSArray)animationKeys
{
  os_unfair_lock_s *p_animationsLock;
  NSArray *v4;

  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  v4 = -[SCNOrderedDictionary allKeys](self->_animations, "allKeys");
  os_unfair_lock_unlock(p_animationsLock);
  if (-[NSArray count](v4, "count"))
    return v4;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)_syncObjCAnimations
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. sync animations: cftype is not an entity", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (id)animationForKey:(id)a3
{
  id v3;

  v3 = -[SCNTechnique _scnAnimationForKey:](self, "_scnAnimationForKey:", a3);
  return (id)objc_msgSend(MEMORY[0x1E0CD26F8], "animationWithSCNAnimation:", v3);
}

- (id)_scnAnimationForKey:(id)a3
{
  id v3;
  os_unfair_lock_s *p_animationsLock;
  SCNOrderedDictionary *animations;

  v3 = a3;
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations)
      v3 = (id)objc_msgSend(-[SCNOrderedDictionary objectForKey:](animations, "objectForKey:", v3), "animation");
    else
      v3 = 0;
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (void)_copyAnimationsFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  v5 = (void *)objc_msgSend(a3, "animationKeys", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v11 = (void *)objc_msgSend((id)objc_msgSend(a3, "animationPlayerForKey:", v10), "copy");
        -[SCNTechnique addAnimationPlayer:forKey:](self, "addAnimationPlayer:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
}

- (id)animationPlayerForKey:(id)a3
{
  id v3;
  os_unfair_lock_s *p_animationsLock;
  SCNOrderedDictionary *animations;

  v3 = a3;
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations)
      v3 = -[SCNOrderedDictionary objectForKey:](animations, "objectForKey:", v3);
    else
      v3 = 0;
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v7;
  void *v9;
  void *v10;
  __C3DAnimationManager *v11;
  uint64_t v12;
  double v13;

  v5 = a5;
  v7 = a3;
  v9 = -[SCNTechnique __CFObject](self, "__CFObject");
  if (v9)
  {
    v10 = v9;
    v11 = -[SCNTechnique animationManager](self, "animationManager");
    if (v11)
    {
      v12 = (uint64_t)v11;
      v13 = CACurrentMediaTime();
      C3DAnimationManagerPauseAnimationForKey(v12, v10, a4, v7, v5, v13);
    }
  }
}

- (void)pauseAnimationForKey:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  v5 = -[SCNTechnique sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__SCNTechnique_pauseAnimationForKey___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __37__SCNTechnique_pauseAnimationForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pauseAnimation:forKey:pausedByNode:", 1, *(_QWORD *)(a1 + 40), 0);
}

- (void)resumeAnimationForKey:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  v5 = -[SCNTechnique sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__SCNTechnique_resumeAnimationForKey___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __38__SCNTechnique_resumeAnimationForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pauseAnimation:forKey:pausedByNode:", 0, *(_QWORD *)(a1 + 40), 0);
}

- (void)setSpeed:(double)a3 forAnimationKey:(id)a4
{
  uint64_t v7;
  __C3DScene *v8;
  _QWORD v9[7];

  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("animations.%@.speed"), a4);
  v8 = -[SCNTechnique sceneRef](self, "sceneRef");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__SCNTechnique_setSpeed_forAnimationKey___block_invoke;
  v9[3] = &unk_1EA59E2B0;
  v9[4] = self;
  v9[5] = a4;
  *(double *)&v9[6] = a3;
  +[SCNTransaction postCommandWithContext:object:keyPath:applyBlock:](SCNTransaction, "postCommandWithContext:object:keyPath:applyBlock:", v8, self, v7, v9);
}

float __41__SCNTechnique_setSpeed_forAnimationKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float result;
  void *v4;
  uint64_t v5;
  float v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  if (v2)
  {
    v4 = (void *)v2;
    v5 = objc_msgSend(*(id *)(a1 + 32), "animationManager");
    if (v5)
    {
      v6 = *(double *)(a1 + 48);
      C3DAnimationManagerChangeSpeedOfAnimationForKey(v5, v4, *(const void **)(a1 + 40), v6);
    }
  }
  return result;
}

- (BOOL)isAnimationForKeyPaused:(id)a3
{
  __C3DScene *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __C3DAnimationManager *v9;
  char IsPaused;

  v5 = -[SCNTechnique sceneRef](self, "sceneRef");
  v6 = (uint64_t)v5;
  if (v5)
    C3DSceneLock((uint64_t)v5);
  v7 = -[SCNTechnique __CFObject](self, "__CFObject");
  if (v7)
  {
    v8 = v7;
    v9 = -[SCNTechnique animationManager](self, "animationManager");
    if (v9)
    {
      IsPaused = C3DAnimationManagerGetAnimationForKeyIsPaused((uint64_t)v9, v8, a3);
      if (!v6)
        return IsPaused;
      goto LABEL_8;
    }
  }
  IsPaused = 0;
  if (v6)
LABEL_8:
    C3DSceneUnlock(v6);
  return IsPaused;
}

- (id)_scnBindings
{
  return self->_bindings;
}

- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  C3DBinding *v13;
  NSMutableDictionary *bindings;
  __C3DScene *v15;
  _QWORD v16[17];

  if (self != a4)
  {
    v16[15] = v6;
    v16[16] = v7;
    v13 = objc_alloc_init(C3DBinding);
    -[C3DBinding setSourceObject:](v13, "setSourceObject:", a4);
    -[C3DBinding setKeyPathDst:](v13, "setKeyPathDst:", a3);
    -[C3DBinding setKeyPathSrc:](v13, "setKeyPathSrc:", a5);
    -[C3DBinding setOptions:](v13, "setOptions:", a6);
    bindings = self->_bindings;
    if (!bindings)
    {
      bindings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_bindings = bindings;
    }
    -[NSMutableDictionary setValue:forKey:](bindings, "setValue:forKey:", v13, a3);

    v15 = -[SCNTechnique sceneRef](self, "sceneRef");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__SCNTechnique_bindAnimatablePath_toObject_withKeyPath_options___block_invoke;
    v16[3] = &unk_1EA59F768;
    v16[4] = self;
    v16[5] = a4;
    v16[6] = a3;
    v16[7] = a5;
    v16[8] = a6;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v15, self, v16);
  }
}

void __64__SCNTechnique_bindAnimatablePath_toObject_withKeyPath_options___block_invoke(uint64_t a1)
{
  float32x4_t *v2;
  C3DBinding *v3;

  v2 = (float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  v3 = objc_alloc_init(C3DBinding);
  -[C3DBinding setSourceObject:](v3, "setSourceObject:", objc_msgSend(*(id *)(a1 + 40), "__CFObject"));
  -[C3DBinding setKeyPathDst:](v3, "setKeyPathDst:", *(_QWORD *)(a1 + 48));
  -[C3DBinding setKeyPathSrc:](v3, "setKeyPathSrc:", *(_QWORD *)(a1 + 56));
  -[C3DBinding setOptions:](v3, "setOptions:", *(_QWORD *)(a1 + 64));
  C3DEntityAddBinding(v2, v3);

}

- (void)unbindAnimatablePath:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  -[NSMutableDictionary removeObjectForKey:](self->_bindings, "removeObjectForKey:");
  if (!-[NSMutableDictionary count](self->_bindings, "count"))
  {

    self->_bindings = 0;
  }
  v5 = -[SCNTechnique sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__SCNTechnique_unbindAnimatablePath___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __37__SCNTechnique_unbindAnimatablePath___block_invoke(uint64_t a1)
{
  C3DEntityRemoveBindingWithKeyPath((float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject"), *(const __CFString **)(a1 + 40));
}

- (void)removeAllBindings
{
  __C3DScene *v3;
  _QWORD v4[5];

  self->_bindings = 0;
  v3 = -[SCNTechnique sceneRef](self, "sceneRef");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__SCNTechnique_removeAllBindings__block_invoke;
  v4[3] = &unk_1EA59E4A0;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v3, self, v4);
}

void __33__SCNTechnique_removeAllBindings__block_invoke(uint64_t a1)
{
  C3DEntityRemoveAllBindings((CFTypeRef *)objc_msgSend(*(id *)(a1 + 32), "__CFObject"));
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (id)presentationInstance
{
  if ((*((_BYTE *)self + 8) & 1) == 0)
    return -[SCNTechnique initPresentationTechniqueWithTechniqueRef:]([SCNTechnique alloc], "initPresentationTechniqueWithTechniqueRef:", *((_QWORD *)self + 2));
  return self;
}

+ (SCNTechnique)techniqueWithTechniqueRef:(__C3DFXTechnique *)a3
{
  SCNTechnique *result;

  result = (SCNTechnique *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
    return (SCNTechnique *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithTechniqueRef:", a3);
  return result;
}

- (void)_setupPasses
{
  uint64_t PassCount;
  uint64_t v4;
  uint64_t i;
  SCNPass *v6;

  self->_passes = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  PassCount = C3DFXTechniqueGetPassCount((uint64_t)self->_technique);
  if (PassCount >= 1)
  {
    v4 = PassCount;
    for (i = 0; i != v4; ++i)
    {
      v6 = -[SCNPass initWithFXPass:technique:]([SCNPass alloc], "initWithFXPass:technique:", C3DFXTechniqueGetPassAtIndex((uint64_t)self->_technique, i), self);
      -[NSArray addObject:](self->_passes, "addObject:", v6);

    }
  }
}

- (id)passAtIndex:(unint64_t)a3
{
  NSArray *passes;

  passes = self->_passes;
  if (!passes)
  {
    -[SCNTechnique _setupPasses](self, "_setupPasses");
    passes = self->_passes;
  }
  if (-[NSArray count](passes, "count") <= a3)
    return 0;
  else
    return -[NSArray objectAtIndexedSubscript:](self->_passes, "objectAtIndexedSubscript:", a3);
}

- (void)_customEncodingOfSCNTechnique:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[SCNTechnique dictionaryRepresentation](self, "dictionaryRepresentation"), CFSTR("description"));
  os_unfair_lock_lock(&self->_valueForSymbolLock);
  objc_msgSend(a3, "encodeObject:forKey:", self->_valueForSymbol, CFSTR("valueForSymbol"));
  os_unfair_lock_unlock(&self->_valueForSymbolLock);
}

- (void)_customDecodingOfSCNTechnique:(id)a3
{
  const void *v5;
  __C3DFXTechnique *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (const void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", SCNPlistClasses(), CFSTR("description"));
  if (v5)
  {
    v6 = (__C3DFXTechnique *)C3DFXTechniqueCreateWithDescription(v5, 0);
    self->_technique = v6;
    if (v6)
      C3DEntitySetObjCWrapper((uint64_t)v6, self);
  }
  v7 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", SCNPlistClasses(), CFSTR("valueForSymbol"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[SCNTechnique setValue:forSymbolNamed:](self, "setValue:forSymbolNamed:", objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11)), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
}

- (void)encodeWithCoder:(id)a3
{
  -[SCNTechnique _customEncodingOfSCNTechnique:](self, "_customEncodingOfSCNTechnique:");
  SCNEncodeAnimations(a3, self);
}

- (SCNTechnique)initWithCoder:(id)a3
{
  SCNTechnique *v4;
  _BOOL8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNTechnique;
  v4 = -[SCNTechnique init](&v7, sel_init);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    v4->_valueForSymbolLock._os_unfair_lock_opaque = 0;
    -[SCNTechnique _customDecodingOfSCNTechnique:](v4, "_customDecodingOfSCNTechnique:", a3);
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    SCNDecodeAnimations(a3, v4);
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setValue:(uint64_t)a1 forSymbolNamed:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = "-[SCNTechnique setValue:forSymbolNamed:]";
  v4 = 1024;
  v5 = 161;
  v6 = 2112;
  v7 = a1;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", (uint8_t *)&v2, 0x1Cu);
}

- (void)__removeAnimation:(uint64_t)a3 forKey:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. __removeAnimationForKey: cftype is not an entity", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)addAnimationPlayer:(uint64_t)a3 forKey:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: attempt to add a null animation player on %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)addAnimation:(uint64_t)a3 forKey:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: attempt to add a null animation on %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
