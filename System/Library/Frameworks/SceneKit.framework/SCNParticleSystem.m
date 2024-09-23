@implementation SCNParticleSystem

- (void)setName:(id)a3
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setName:].cold.1();
  }
  else if ((unint64_t)a3 | (unint64_t)self->_name)
  {
    if ((objc_msgSend(a3, "isEqual:") & 1) == 0)
    {

      self->_name = (NSString *)objc_msgSend(a3, "copy");
      v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __29__SCNParticleSystem_setName___block_invoke;
      v7[3] = &unk_1EA59F740;
      v7[4] = self;
      v7[5] = a3;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
    }
  }
}

CFStringRef __29__SCNParticleSystem_setName___block_invoke(uint64_t a1)
{
  return C3DEntitySetName(objc_msgSend(*(id *)(a1 + 32), "__CFObject"), *(CFStringRef *)(a1 + 40));
}

- (id)name
{
  void *Name;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_name;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  v5 = (uint64_t)v4;
  if (v4)
    C3DSceneLock((uint64_t)v4);
  Name = (void *)C3DEntityGetName((uint64_t)-[SCNParticleSystem __CFObject](self, "__CFObject"));
  if (v5)
    C3DSceneUnlock(v5);
  return Name;
}

- (void)setIdentifier:(id)a3
{
  C3DEntitySetID((uint64_t)-[SCNParticleSystem __CFObject](self, "__CFObject"), a3);
}

- (id)identifier
{
  return (id)C3DEntityGetID((uint64_t)-[SCNParticleSystem __CFObject](self, "__CFObject"));
}

- (void)_syncEntityObjCModel
{
  void *v3;

  v3 = -[SCNParticleSystem __CFObject](self, "__CFObject");

  self->_name = (NSString *)(id)C3DEntityGetName((uint64_t)v3);
}

- (__C3DScene)sceneRef
{
  return (__C3DScene *)C3DGetScene((_QWORD *)-[SCNParticleSystem __CFObject](self, "__CFObject"));
}

- (id)scene
{
  id result;

  result = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (result)
    return C3DEntityGetObjCWrapper((id *)result);
  return result;
}

- (void)__CFObject
{
  return self->_particleSystem;
}

- (__C3DAnimationManager)animationManager
{
  __C3DAnimationManager *result;

  result = -[SCNParticleSystem sceneRef](self, "sceneRef");
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
    v9 = -[SCNParticleSystem __CFObject](self, "__CFObject");
    if ((CFTypeIsC3DEntity(v9) & 1) == 0)
    {
      v10 = scn_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[SCNLight __removeAnimation:forKey:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
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
    v8 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __47__SCNParticleSystem_addAnimationPlayer_forKey___block_invoke;
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

void __47__SCNParticleSystem_addAnimationPlayer_forKey___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "prepareWithTarget:implicitDuration:", a1[5]);
  if ((SCNAddAnimation(a1[4], a1[5], a1[6]) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1[5] + 5);
    objc_msgSend(*((id *)a1[5] + 3), "removeObjectForKey:", a1[6]);
    os_unfair_lock_unlock((os_unfair_lock_t)a1[5] + 5);
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
    -[SCNParticleSystem addAnimationPlayer:forKey:](self, "addAnimationPlayer:forKey:", v7, v5);
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
  -[SCNParticleSystem addAnimation:forKey:](self, "addAnimation:forKey:", a3, 0);
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
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__SCNParticleSystem_removeAllAnimations__block_invoke;
  v5[3] = &unk_1EA59E4A0;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v4, self, v5);
}

void __40__SCNParticleSystem_removeAllAnimations__block_invoke(uint64_t a1)
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
  v6 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__SCNParticleSystem_removeAllAnimationsWithBlendOutDuration___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
}

void __61__SCNParticleSystem_removeAllAnimationsWithBlendOutDuration___block_invoke(uint64_t a1)
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
    v6 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__SCNParticleSystem_removeAnimationForKey___block_invoke;
    v7[3] = &unk_1EA59F740;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __43__SCNParticleSystem_removeAnimationForKey___block_invoke(uint64_t a1)
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
    v8 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__SCNParticleSystem_removeAnimationForKey_blendOutDuration___block_invoke;
    v9[3] = &unk_1EA59E2B0;
    v9[4] = self;
    v9[5] = a3;
    *(double *)&v9[6] = a4;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, self, v9);
  }
}

void __60__SCNParticleSystem_removeAnimationForKey_blendOutDuration___block_invoke(uint64_t a1)
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
  __C3DScene *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *Animations;
  const __CFDictionary *v16;

  v3 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(SCNOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  v5 = -[SCNParticleSystem __CFObject](self, "__CFObject");
  if (v5)
  {
    v6 = (uint64_t)v5;
    if ((CFTypeIsC3DEntity(v5) & 1) == 0)
    {
      v7 = scn_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[SCNLight _syncObjCAnimations].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    Animations = C3DEntityGetAnimations(v6);
    if (Animations)
    {
      v16 = Animations;
      os_unfair_lock_lock(&self->_animationsLock);
      C3DOrderedDictionaryApplyFunction(v16, (const char *)SCNConvertC3DAnimationDictionaryFunc, (uint64_t)self->_animations);
      os_unfair_lock_unlock(&self->_animationsLock);
    }
  }
  if (v4)
    C3DSceneUnlock(v4);
}

- (id)animationForKey:(id)a3
{
  id v3;

  v3 = -[SCNParticleSystem _scnAnimationForKey:](self, "_scnAnimationForKey:", a3);
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
        -[SCNParticleSystem addAnimationPlayer:forKey:](self, "addAnimationPlayer:forKey:", v11, v10);

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
  v9 = -[SCNParticleSystem __CFObject](self, "__CFObject");
  if (v9)
  {
    v10 = v9;
    v11 = -[SCNParticleSystem animationManager](self, "animationManager");
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

  v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__SCNParticleSystem_pauseAnimationForKey___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __42__SCNParticleSystem_pauseAnimationForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pauseAnimation:forKey:pausedByNode:", 1, *(_QWORD *)(a1 + 40), 0);
}

- (void)resumeAnimationForKey:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__SCNParticleSystem_resumeAnimationForKey___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __43__SCNParticleSystem_resumeAnimationForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pauseAnimation:forKey:pausedByNode:", 0, *(_QWORD *)(a1 + 40), 0);
}

- (void)setSpeed:(double)a3 forAnimationKey:(id)a4
{
  uint64_t v7;
  __C3DScene *v8;
  _QWORD v9[7];

  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("animations.%@.speed"), a4);
  v8 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__SCNParticleSystem_setSpeed_forAnimationKey___block_invoke;
  v9[3] = &unk_1EA59E2B0;
  v9[4] = self;
  v9[5] = a4;
  *(double *)&v9[6] = a3;
  +[SCNTransaction postCommandWithContext:object:keyPath:applyBlock:](SCNTransaction, "postCommandWithContext:object:keyPath:applyBlock:", v8, self, v7, v9);
}

float __46__SCNParticleSystem_setSpeed_forAnimationKey___block_invoke(uint64_t a1)
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

  v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  v6 = (uint64_t)v5;
  if (v5)
    C3DSceneLock((uint64_t)v5);
  v7 = -[SCNParticleSystem __CFObject](self, "__CFObject");
  if (v7)
  {
    v8 = v7;
    v9 = -[SCNParticleSystem animationManager](self, "animationManager");
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

    v15 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __69__SCNParticleSystem_bindAnimatablePath_toObject_withKeyPath_options___block_invoke;
    v16[3] = &unk_1EA59F768;
    v16[4] = self;
    v16[5] = a4;
    v16[6] = a3;
    v16[7] = a5;
    v16[8] = a6;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v15, self, v16);
  }
}

void __69__SCNParticleSystem_bindAnimatablePath_toObject_withKeyPath_options___block_invoke(uint64_t a1)
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
  v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__SCNParticleSystem_unbindAnimatablePath___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __42__SCNParticleSystem_unbindAnimatablePath___block_invoke(uint64_t a1)
{
  C3DEntityRemoveBindingWithKeyPath((float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject"), *(const __CFString **)(a1 + 40));
}

- (void)removeAllBindings
{
  __C3DScene *v3;
  _QWORD v4[5];

  self->_bindings = 0;
  v3 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__SCNParticleSystem_removeAllBindings__block_invoke;
  v4[3] = &unk_1EA59E4A0;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v3, self, v4);
}

void __38__SCNParticleSystem_removeAllBindings__block_invoke(uint64_t a1)
{
  C3DEntityRemoveAllBindings((CFTypeRef *)objc_msgSend(*(id *)(a1 + 32), "__CFObject"));
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

+ (SCNParticleSystem)particleSystem
{
  return (SCNParticleSystem *)objc_alloc_init((Class)a1);
}

+ (SCNParticleSystem)particleSystemNamed:(NSString *)name inDirectory:(NSString *)directory
{
  NSString *v6;
  void *v7;
  NSString *v8;
  const __CFString *v9;
  uint64_t v10;
  const __CFURL *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  SCNParticleSystem *v17;

  v6 = -[NSString pathExtension](name, "pathExtension");
  v7 = (void *)SCNGetResourceBundle();
  v8 = -[NSString stringByDeletingPathExtension](name, "stringByDeletingPathExtension");
  if (-[NSString length](v6, "length"))
    v9 = (const __CFString *)v6;
  else
    v9 = CFSTR("scnp");
  v10 = objc_msgSend(v7, "URLForResource:withExtension:subdirectory:", v8, v9, directory);
  if (!v10)
    return 0;
  v11 = (const __CFURL *)v10;
  v12 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v10);
  if (!v12)
    return 0;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v12, 0);
  v14 = objc_opt_class();
  if (v14 != objc_opt_class())
  {
    v15 = objc_opt_class();
    v16 = (objc_class *)objc_opt_class();
    objc_msgSend(v13, "setClass:forClassName:", v15, NSStringFromClass(v16));
  }
  objc_msgSend(v13, "setRequiresSecureCoding:", C3DIOShouldActivateSecurityChecks(v11, 0));
  objc_msgSend(v13, "setDecodingFailurePolicy:", 0);
  v17 = (SCNParticleSystem *)objc_msgSend(v13, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);

  return v17;
}

- (SCNParticleSystem)init
{
  SCNParticleSystem *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNParticleSystem;
  v2 = -[SCNParticleSystem init](&v5, sel_init);
  if (v2)
  {
    v3 = C3DParticleSystemCreate();
    v2->_particleSystem = (__C3DParticleSystem *)v3;
    if (v3)
      C3DEntitySetObjCWrapper(v3, v2);
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    -[SCNParticleSystem _syncObjCModel](v2, "_syncObjCModel");
  }
  return v2;
}

- (SCNParticleSystem)initWithParticleSystemRef:(__C3DParticleSystem *)a3
{
  SCNParticleSystem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNParticleSystem;
  v4 = -[SCNParticleSystem init](&v6, sel_init);
  if (v4)
  {
    v4->_particleSystem = (__C3DParticleSystem *)CFRetain(a3);
    if (a3)
      C3DEntitySetObjCWrapper((uint64_t)a3, v4);
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    -[SCNParticleSystem _syncObjCModel](v4, "_syncObjCModel");
    -[SCNParticleSystem _syncObjCAnimations](v4, "_syncObjCAnimations");
  }
  return v4;
}

- (id)initPresentationSystemWithSystemRef:(__C3DParticleSystem *)a3
{
  SCNParticleSystem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNParticleSystem;
  v4 = -[SCNParticleSystem init](&v6, sel_init);
  if (v4)
  {
    v4->_particleSystem = (__C3DParticleSystem *)CFRetain(a3);
    *((_BYTE *)v4 + 16) |= 1u;
    v4->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void)dealloc
{
  __C3DParticleSystem *particleSystem;
  objc_super v4;

  if ((*((_BYTE *)self + 16) & 1) == 0)
  {
    particleSystem = self->_particleSystem;
    if (particleSystem)
      C3DEntitySetObjCWrapper((uint64_t)particleSystem, 0);
  }
  CFRelease(self->_particleSystem);
  v4.receiver = self;
  v4.super_class = (Class)SCNParticleSystem;
  -[SCNParticleSystem dealloc](&v4, sel_dealloc);
}

- (void)_syncObjCModel
{
  __C3DScene *v3;
  uint64_t v4;
  __C3DParticleSystem *v5;
  uint64_t EmitterShape;
  __n128 EmittingDirection;
  __n128 OrientationDirection;
  __n128 Acceleration;
  uint64_t ParticleColor;

  v3 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  v5 = -[SCNParticleSystem particleSystemRef](self, "particleSystemRef");
  self->_emissionDuration = C3DParticleSystemGetEmissionDuration((uint64_t)v5);
  self->_emissionDurationVariation = C3DParticleSystemGetEmissionDurationVariation((uint64_t)v5);
  self->_idleDuration = C3DParticleSystemGetIdleDuration((uint64_t)v5);
  self->_idleDurationVariation = C3DParticleSystemGetIdleDurationVariation((uint64_t)v5);
  self->_birthRate = C3DParticleSystemGetBirthRate((uint64_t)v5);
  self->_birthRateVariation = C3DParticleSystemGetBirthRateVariation((uint64_t)v5);
  self->_warmupDuration = C3DParticleSystemGetWarmupDuration((uint64_t)v5);
  EmitterShape = C3DParticleSystemGetEmitterShape((uint64_t)v5);
  if (EmitterShape)
    -[SCNParticleSystem setEmitterShape:](self, "setEmitterShape:", +[SCNGeometry geometryWithGeometryRef:](SCNGeometry, "geometryWithGeometryRef:", EmitterShape));
  self->_birthLocation = C3DParticleSystemGetBirthLocation((uint64_t)v5);
  self->_birthDirection = C3DParticleSystemGetBirthDirection((uint64_t)v5);
  EmittingDirection = C3DParticleSystemGetEmittingDirection((__n128 *)v5);
  *(_QWORD *)&self->_emittingDirection.x = EmittingDirection.n128_u64[0];
  LODWORD(self->_emittingDirection.z) = EmittingDirection.n128_u32[2];
  OrientationDirection = C3DParticleSystemGetOrientationDirection((__n128 *)v5);
  *(_QWORD *)&self->_orientationDirection.x = OrientationDirection.n128_u64[0];
  LODWORD(self->_orientationDirection.z) = OrientationDirection.n128_u32[2];
  Acceleration = C3DParticleSystemGetAcceleration((__n128 *)v5);
  *(_QWORD *)&self->_acceleration.x = Acceleration.n128_u64[0];
  LODWORD(self->_acceleration.z) = Acceleration.n128_u32[2];
  self->_spreadingAngle = C3DParticleSystemGetSpreadingAngle((uint64_t)v5);
  self->_loops = C3DParticleSystemGetLoops((uint64_t)v5);
  self->_isLocal = C3DParticleSystemGetIsLocal((uint64_t)v5);
  self->_affectedByGravity = C3DParticleSystemGetAffectedByGravity((uint64_t)v5);
  self->_affectedByPhysicsFields = C3DParticleSystemGetAffectedByPhysicsFields((uint64_t)v5);
  self->_physicsCollisionsEnabled = C3DParticleSystemGetPhysicsCollisionsEnabled((uint64_t)v5);
  self->_lightingEnabled = C3DParticleSystemGetLightingEnabled((uint64_t)v5);
  self->_softParticlesEnabled = C3DParticleSystemGetSoftParticlesEnabled((uint64_t)v5);
  self->_particleDiesOnCollision = C3DParticleSystemGetParticleDiesOnCollision((uint64_t)v5);
  self->_blackPassEnabled = C3DParticleSystemGetBlackPassEnabled((uint64_t)v5);
  self->_writesToDepthBuffer = C3DParticleSystemGetWritesToDepthBuffer((uint64_t)v5);
  self->_particleAngle = C3DParticleSystemGetParticleAngle((uint64_t)v5);
  self->_particleAngleVariation = C3DParticleSystemGetParticleAngleVariation((uint64_t)v5);
  self->_particleVelocity = C3DParticleSystemGetParticleVelocity((uint64_t)v5);
  self->_particleVelocityVariation = C3DParticleSystemGetParticleVelocityVariation((uint64_t)v5);
  self->_particleAngularVelocity = C3DParticleSystemGetParticleAngularVelocity((uint64_t)v5);
  self->_particleAngularVelocityVariation = C3DParticleSystemGetParticleAngularVelocityVariation((uint64_t)v5);
  self->_particleLifeSpan = C3DParticleSystemGetParticleLifeSpan((uint64_t)v5);
  self->_particleLifeSpanVariation = C3DParticleSystemGetParticleLifeSpanVariation((uint64_t)v5);
  self->_particleBounce = C3DParticleSystemGetParticleBounce((uint64_t)v5);
  self->_particleBounceVariation = C3DParticleSystemGetParticleBounceVariation((uint64_t)v5);
  self->_particleFriction = C3DParticleSystemGetParticleFriction((uint64_t)v5);
  self->_particleFrictionVariation = C3DParticleSystemGetParticleFrictionVariation((uint64_t)v5);
  ParticleColor = C3DParticleSystemGetParticleColor((uint64_t)v5);
  -[SCNParticleSystem setParticleColor:](self, "setParticleColor:", C3DColor4ToRGBCFColor(ParticleColor));
  self->_particleColorVariation = (SCNVector4)C3DParticleSystemGetParticleColorVariation((__n128 *)v5);
  self->_particleSize = C3DParticleSystemGetParticleSize((uint64_t)v5);
  self->_particleSizeVariation = C3DParticleSystemGetParticleSizeVariation((uint64_t)v5);
  self->_particleIntensity = C3DParticleSystemGetParticleIntensity((uint64_t)v5);
  self->_particleIntensityVariation = C3DParticleSystemGetParticleIntensityVariation((uint64_t)v5);
  self->_seed = (int)C3DParticleSystemGetSeed((uint64_t)v5);
  self->_blendMode = C3DParticleSystemGetBlendMode((uint64_t)v5);
  self->_renderingMode = C3DParticleSystemGetRenderingMode((uint64_t)v5);
  self->_orientationMode = C3DParticleSystemGetOrientationMode((uint64_t)v5);
  self->_imageSequenceAnimationMode = C3DParticleSystemGetImageSequenceAnimationMode((uint64_t)v5);
  self->_sortingMode = C3DParticleSystemGetSortingMode((uint64_t)v5);
  self->_particleMass = C3DParticleSystemGetParticleMass((uint64_t)v5);
  self->_particleMassVariation = C3DParticleSystemGetParticleMassVariation((uint64_t)v5);
  self->_dampingFactor = C3DParticleSystemGetDampingFactor((uint64_t)v5);
  self->_speedFactor = C3DParticleSystemGetSpeedFactor((uint64_t)v5);
  self->_fixedTimeStep = C3DParticleSystemGetFixedTimeStep((uint64_t)v5);
  self->_stretchFactor = C3DParticleSystemGetStretchFactor((uint64_t)v5);
  self->_imageSequenceRowCount = C3DParticleSystemGetImageSequenceRowCount((uint64_t)v5);
  self->_imageSequenceColumnCount = C3DParticleSystemGetImageSequenceColumnCount((uint64_t)v5);
  self->_imageSequenceInitialFrame = C3DParticleSystemGetImageSequenceInitialFrame((uint64_t)v5);
  self->_imageSequenceInitialFrameVariation = C3DParticleSystemGetImageSequenceInitialFrameVariation((uint64_t)v5);
  self->_imageSequenceFrameRate = C3DParticleSystemGetImageSequenceFrameRate((uint64_t)v5);
  self->_imageSequenceFrameRateVariation = C3DParticleSystemGetImageSequenceFrameRateVariation((uint64_t)v5);
  -[SCNParticleSystem _syncEntityObjCModel](self, "_syncEntityObjCModel");
  if (v4)
    C3DSceneUnlock(v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  objc_msgSend(v4, "setName:", -[SCNParticleSystem name](self, "name"));
  objc_msgSend(v4, "setParticleImage:", -[SCNParticleSystem particleImage](self, "particleImage"));
  -[SCNParticleSystem emissionDuration](self, "emissionDuration");
  objc_msgSend(v4, "setEmissionDuration:");
  -[SCNParticleSystem emissionDurationVariation](self, "emissionDurationVariation");
  objc_msgSend(v4, "setEmissionDurationVariation:");
  -[SCNParticleSystem idleDuration](self, "idleDuration");
  objc_msgSend(v4, "setIdleDuration:");
  -[SCNParticleSystem idleDurationVariation](self, "idleDurationVariation");
  objc_msgSend(v4, "setIdleDurationVariation:");
  -[SCNParticleSystem birthRate](self, "birthRate");
  objc_msgSend(v4, "setBirthRate:");
  -[SCNParticleSystem birthRateVariation](self, "birthRateVariation");
  objc_msgSend(v4, "setBirthRateVariation:");
  -[SCNParticleSystem warmupDuration](self, "warmupDuration");
  objc_msgSend(v4, "setWarmupDuration:");
  objc_msgSend(v4, "setEmitterShape:", -[SCNParticleSystem emitterShape](self, "emitterShape"));
  objc_msgSend(v4, "setBirthLocation:", -[SCNParticleSystem birthLocation](self, "birthLocation"));
  objc_msgSend(v4, "setBirthDirection:", -[SCNParticleSystem birthDirection](self, "birthDirection"));
  -[SCNParticleSystem emittingDirection](self, "emittingDirection");
  objc_msgSend(v4, "setEmittingDirection:");
  -[SCNParticleSystem orientationDirection](self, "orientationDirection");
  objc_msgSend(v4, "setOrientationDirection:");
  -[SCNParticleSystem acceleration](self, "acceleration");
  objc_msgSend(v4, "setAcceleration:");
  -[SCNParticleSystem spreadingAngle](self, "spreadingAngle");
  objc_msgSend(v4, "setSpreadingAngle:");
  objc_msgSend(v4, "setLoops:", -[SCNParticleSystem loops](self, "loops"));
  objc_msgSend(v4, "setIsLocal:", -[SCNParticleSystem isLocal](self, "isLocal"));
  objc_msgSend(v4, "setAffectedByGravity:", -[SCNParticleSystem affectedByGravity](self, "affectedByGravity"));
  objc_msgSend(v4, "setAffectedByPhysicsFields:", -[SCNParticleSystem affectedByPhysicsFields](self, "affectedByPhysicsFields"));
  objc_msgSend(v4, "setPhysicsCollisionsEnabled:", -[SCNParticleSystem physicsCollisionsEnabled](self, "physicsCollisionsEnabled"));
  objc_msgSend(v4, "setLightingEnabled:", -[SCNParticleSystem isLightingEnabled](self, "isLightingEnabled"));
  objc_msgSend(v4, "setSoftParticlesEnabled:", -[SCNParticleSystem areSoftParticlesEnabled](self, "areSoftParticlesEnabled"));
  objc_msgSend(v4, "setParticleDiesOnCollision:", -[SCNParticleSystem particleDiesOnCollision](self, "particleDiesOnCollision"));
  objc_msgSend(v4, "setBlackPassEnabled:", -[SCNParticleSystem isBlackPassEnabled](self, "isBlackPassEnabled"));
  -[SCNParticleSystem particleAngle](self, "particleAngle");
  objc_msgSend(v4, "setParticleAngle:");
  -[SCNParticleSystem particleAngleVariation](self, "particleAngleVariation");
  objc_msgSend(v4, "setParticleAngleVariation:");
  -[SCNParticleSystem particleVelocity](self, "particleVelocity");
  objc_msgSend(v4, "setParticleVelocity:");
  -[SCNParticleSystem particleVelocityVariation](self, "particleVelocityVariation");
  objc_msgSend(v4, "setParticleVelocityVariation:");
  -[SCNParticleSystem particleAngularVelocity](self, "particleAngularVelocity");
  objc_msgSend(v4, "setParticleAngularVelocity:");
  -[SCNParticleSystem particleAngularVelocityVariation](self, "particleAngularVelocityVariation");
  objc_msgSend(v4, "setParticleAngularVelocityVariation:");
  -[SCNParticleSystem particleLifeSpan](self, "particleLifeSpan");
  objc_msgSend(v4, "setParticleLifeSpan:");
  -[SCNParticleSystem particleLifeSpanVariation](self, "particleLifeSpanVariation");
  objc_msgSend(v4, "setParticleLifeSpanVariation:");
  -[SCNParticleSystem particleBounce](self, "particleBounce");
  objc_msgSend(v4, "setParticleBounce:");
  -[SCNParticleSystem particleBounceVariation](self, "particleBounceVariation");
  objc_msgSend(v4, "setParticleBounceVariation:");
  -[SCNParticleSystem particleFriction](self, "particleFriction");
  objc_msgSend(v4, "setParticleFriction:");
  -[SCNParticleSystem particleFrictionVariation](self, "particleFrictionVariation");
  objc_msgSend(v4, "setParticleFrictionVariation:");
  -[SCNParticleSystem particleCharge](self, "particleCharge");
  objc_msgSend(v4, "setParticleCharge:");
  -[SCNParticleSystem particleChargeVariation](self, "particleChargeVariation");
  objc_msgSend(v4, "setParticleChargeVariation:");
  objc_msgSend(v4, "setParticleColor:", -[SCNParticleSystem particleColor](self, "particleColor"));
  -[SCNParticleSystem particleColorVariation](self, "particleColorVariation");
  objc_msgSend(v4, "setParticleColorVariation:");
  objc_msgSend(v4, "setSystemSpawnedOnCollision:", -[SCNParticleSystem systemSpawnedOnCollision](self, "systemSpawnedOnCollision"));
  objc_msgSend(v4, "setSystemSpawnedOnDying:", -[SCNParticleSystem systemSpawnedOnDying](self, "systemSpawnedOnDying"));
  objc_msgSend(v4, "setSystemSpawnedOnLiving:", -[SCNParticleSystem systemSpawnedOnLiving](self, "systemSpawnedOnLiving"));
  -[SCNParticleSystem particleSize](self, "particleSize");
  objc_msgSend(v4, "setParticleSize:");
  -[SCNParticleSystem particleSizeVariation](self, "particleSizeVariation");
  objc_msgSend(v4, "setParticleSizeVariation:");
  objc_msgSend(v4, "setSeed:", -[SCNParticleSystem seed](self, "seed"));
  objc_msgSend(v4, "setBlendMode:", -[SCNParticleSystem blendMode](self, "blendMode"));
  objc_msgSend(v4, "setRenderingMode:", -[SCNParticleSystem renderingMode](self, "renderingMode"));
  objc_msgSend(v4, "setOrientationMode:", -[SCNParticleSystem orientationMode](self, "orientationMode"));
  objc_msgSend(v4, "setImageSequenceAnimationMode:", -[SCNParticleSystem imageSequenceAnimationMode](self, "imageSequenceAnimationMode"));
  objc_msgSend(v4, "setParticleGeometries:", -[SCNParticleSystem particleGeometries](self, "particleGeometries"));
  objc_msgSend(v4, "setColliderNodes:", -[SCNParticleSystem colliderNodes](self, "colliderNodes"));
  objc_msgSend(v4, "setPropertyControllers:", -[SCNParticleSystem propertyControllers](self, "propertyControllers"));
  objc_msgSend(v4, "setSortingMode:", -[SCNParticleSystem sortingMode](self, "sortingMode"));
  -[SCNParticleSystem particleMass](self, "particleMass");
  objc_msgSend(v4, "setParticleMass:");
  -[SCNParticleSystem particleMassVariation](self, "particleMassVariation");
  objc_msgSend(v4, "setParticleMassVariation:");
  -[SCNParticleSystem dampingFactor](self, "dampingFactor");
  objc_msgSend(v4, "setDampingFactor:");
  -[SCNParticleSystem speedFactor](self, "speedFactor");
  objc_msgSend(v4, "setSpeedFactor:");
  -[SCNParticleSystem fixedTimeStep](self, "fixedTimeStep");
  objc_msgSend(v4, "setFixedTimeStep:");
  -[SCNParticleSystem stretchFactor](self, "stretchFactor");
  objc_msgSend(v4, "setStretchFactor:");
  objc_msgSend(v4, "setImageSequenceRowCount:", -[SCNParticleSystem imageSequenceRowCount](self, "imageSequenceRowCount"));
  objc_msgSend(v4, "setImageSequenceColumnCount:", -[SCNParticleSystem imageSequenceColumnCount](self, "imageSequenceColumnCount"));
  -[SCNParticleSystem imageSequenceInitialFrame](self, "imageSequenceInitialFrame");
  objc_msgSend(v4, "setImageSequenceInitialFrame:");
  -[SCNParticleSystem imageSequenceInitialFrameVariation](self, "imageSequenceInitialFrameVariation");
  objc_msgSend(v4, "setImageSequenceInitialFrameVariation:");
  -[SCNParticleSystem imageSequenceFrameRate](self, "imageSequenceFrameRate");
  objc_msgSend(v4, "setImageSequenceFrameRate:");
  -[SCNParticleSystem imageSequenceFrameRateVariation](self, "imageSequenceFrameRateVariation");
  objc_msgSend(v4, "setImageSequenceFrameRateVariation:");
  objc_msgSend(v4, "setWritesToDepthBuffer:", -[SCNParticleSystem writesToDepthBuffer](self, "writesToDepthBuffer"));
  objc_msgSend(v4, "setReferenceName:", -[SCNParticleSystem referenceName](self, "referenceName"));
  objc_msgSend(v4, "_copyAnimationsFrom:", self);
  +[SCNTransaction commitImmediate](SCNTransaction, "commitImmediate");
  return v4;
}

+ (SCNParticleSystem)particleSystemWithParticleSystemRef:(__C3DParticleSystem *)a3
{
  SCNParticleSystem *result;

  result = (SCNParticleSystem *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
    return (SCNParticleSystem *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithParticleSystemRef:", a3);
  return result;
}

- (id)copy
{
  return -[SCNParticleSystem copyWithZone:](self, "copyWithZone:", 0);
}

- (id)presentationInstance
{
  return -[SCNParticleSystem initPresentationSystemWithSystemRef:]([SCNParticleSystem alloc], "initPresentationSystemWithSystemRef:", self->_particleSystem);
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (__C3DParticleSystem)particleSystemRef
{
  return self->_particleSystem;
}

- (id)particleGeometries
{
  id result;
  id v3;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleGeometries;
  result = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (result)
  {
    v3 = result;
    C3DSceneLock((uint64_t)result);
    C3DSceneUnlock((uint64_t)v3);
    return 0;
  }
  return result;
}

- (signed)typeOfProperty:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[12];
  _QWORD v9[13];

  v9[12] = *MEMORY[0x1E0C80C00];
  v4 = (void *)typeOfProperty__s_properties;
  if (!typeOfProperty__s_properties)
  {
    v8[0] = CFSTR("Position");
    v8[1] = CFSTR("Angle");
    v9[0] = &unk_1EA5FF120;
    v9[1] = &unk_1EA5FF138;
    v8[2] = CFSTR("RotationAxis");
    v8[3] = CFSTR("Velocity");
    v9[2] = &unk_1EA5FF120;
    v9[3] = &unk_1EA5FF120;
    v8[4] = CFSTR("AngularVelocity");
    v8[5] = CFSTR("Life");
    v9[4] = &unk_1EA5FF138;
    v9[5] = &unk_1EA5FF138;
    v8[6] = CFSTR("Color");
    v8[7] = CFSTR("Opacity");
    v9[6] = &unk_1EA5FF150;
    v9[7] = &unk_1EA5FF138;
    v8[8] = CFSTR("Size");
    v8[9] = CFSTR("Bounce");
    v9[8] = &unk_1EA5FF138;
    v9[9] = &unk_1EA5FF138;
    v8[10] = CFSTR("Friction");
    v8[11] = CFSTR("Charge");
    v9[10] = &unk_1EA5FF138;
    v9[11] = &unk_1EA5FF138;
    typeOfProperty__s_properties = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 12);
    v5 = (id)typeOfProperty__s_properties;
    v4 = (void *)typeOfProperty__s_properties;
  }
  v6 = (void *)objc_msgSend(v4, "objectForKey:", a3);
  if (v6)
    LOWORD(v6) = objc_msgSend(v6, "intValue");
  return (__int16)v6;
}

- (void)setParticleGeometries:(id)a3
{
  NSObject *v3;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v3 = scn_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleGeometries:].cold.1();
  }
  else if (self->_particleGeometries != a3)
  {
    self->_particleGeometries = (NSArray *)a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", -[SCNParticleSystem sceneRef](self, "sceneRef"), self, &__block_literal_global_71);
  }
}

- (NSArray)colliderNodes
{
  NSArray *result;
  NSArray *v3;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_colliderNodes;
  result = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (result)
  {
    v3 = result;
    C3DSceneLock((uint64_t)result);
    C3DSceneUnlock((uint64_t)v3);
    return 0;
  }
  return result;
}

- (void)setColliderNodes:(NSArray *)colliderNodes
{
  NSArray *v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setColliderNodes:].cold.1();
  }
  else
  {
    v5 = self->_colliderNodes;
    if (v5 != colliderNodes)
    {

      self->_colliderNodes = (NSArray *)-[NSArray copy](colliderNodes, "copy");
      v6 = -[SCNParticleSystem sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __38__SCNParticleSystem_setColliderNodes___block_invoke;
      v8[3] = &unk_1EA59F740;
      v8[4] = colliderNodes;
      v8[5] = self;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v8);
    }
  }
}

void __38__SCNParticleSystem_setColliderNodes___block_invoke(uint64_t a1)
{
  const __CFAllocator *v2;
  CFIndex v3;
  CFMutableArrayRef Mutable;
  void *v5;
  _QWORD v6[5];

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = objc_msgSend(*(id *)(a1 + 32), "count");
  Mutable = CFArrayCreateMutable(v2, v3, MEMORY[0x1E0C9B378]);
  v5 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__SCNParticleSystem_setColliderNodes___block_invoke_2;
  v6[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
  v6[4] = Mutable;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);
  C3DParticleSystemSetColliderNodes(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), Mutable);
  CFRelease(Mutable);
}

void __38__SCNParticleSystem_setColliderNodes___block_invoke_2(uint64_t a1, void *a2)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), (const void *)objc_msgSend(a2, "__CFObject"));
}

- (NSDictionary)propertyControllers
{
  return self->_propertyControllers;
}

- (void)setPropertyControllers:(NSDictionary *)propertyControllers
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setPropertyControllers:].cold.1();
  }
  else
  {

    self->_propertyControllers = (NSDictionary *)-[NSDictionary copy](propertyControllers, "copy");
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__SCNParticleSystem_setPropertyControllers___block_invoke;
    v7[3] = &unk_1EA59F740;
    v7[4] = propertyControllers;
    v7[5] = self;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __44__SCNParticleSystem_setPropertyControllers___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  _WORD *v13;
  void *v14;
  _WORD *v15;
  NSObject *v16;
  _WORD *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  uint64_t v24;
  const __CFString *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  void *v30;
  void *cf;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37;
  char v38[15];
  uint8_t v39[128];
  uint8_t buf[4];
  uint64_t v41;
  uint8_t v42[4];
  uint64_t v43[3];

  *(uint64_t *)((char *)&v43[1] + 4) = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v30 = *(void **)(a1 + 40);
  cf = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v1, "count"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)objc_msgSend(v1, "allKeys");
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v34;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v34 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v5);
        v7 = (void *)objc_msgSend(v1, "valueForKey:", v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v9 = objc_msgSend(v7, "animation");
          if (v9)
          {
            v10 = (void *)v9;
            v11 = objc_msgSend(v30, "typeOfProperty:", v6);
            if (v11)
            {
              v12 = v11;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v13 = CABasicAnimationToC3DAnimation(v10, v12, 0);
                goto LABEL_16;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v13 = CAKeyframeAnimationToC3DAnimation(v10, v12, 0);
LABEL_16:
                v17 = v13;
                if (v13)
                {
                  C3DAnimationSetup(v13, 0);
                  objc_msgSend(v8, "setValue:forKey:", v17, CFSTR("ControllerAnimation"));
                  v14 = v7;
                  v15 = v17;
LABEL_18:
                  objc_msgSend(v14, "setC3dAnimation:", v15);
                }
              }
              else
              {
                v27 = scn_default_log();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                  __44__SCNParticleSystem_setPropertyControllers___block_invoke_cold_2(v42, (uint64_t)v10, v43, v27);
              }
            }
            else
            {
              v16 = scn_default_log();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v41 = v6;
                _os_log_error_impl(&dword_1DCCB8000, v16, OS_LOG_TYPE_ERROR, "Error: Can't introspect type of property %@", buf, 0xCu);
              }
            }
            objc_msgSend(v7, "inputScale");
            if (v18 != 1.0)
            {
              v19 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v7, "inputScale");
              *(float *)&v20 = v20;
              objc_msgSend(v8, "setValue:forKey:", objc_msgSend(v19, "numberWithFloat:", v20), CFSTR("ControllerVariableScale"));
            }
            objc_msgSend(v7, "inputBias");
            if (v21 != 0.0)
            {
              v22 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v7, "inputBias");
              *(float *)&v23 = v23;
              objc_msgSend(v8, "setValue:forKey:", objc_msgSend(v22, "numberWithFloat:", v23), CFSTR("ControllerVariableBias"));
            }
            if (objc_msgSend(v7, "inputOrigin"))
              objc_msgSend(v8, "setValue:forKey:", objc_msgSend((id)objc_msgSend(v7, "inputOrigin"), "nodeRef"), CFSTR("ControllerVariableOrigin"));
            v24 = objc_msgSend(v7, "inputMode");
            v25 = CFSTR("ControllerVariableOverLife");
            if (v24)
            {
              v25 = CFSTR("ControllerVariableOverOtherProperty");
              if (v24 != 2)
              {
                v25 = CFSTR("ControllerVariableOverDistance");
                if (v24 != 1)
                {
                  v26 = scn_default_log();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                    __44__SCNParticleSystem_setPropertyControllers___block_invoke_cold_1(&v37, v38, v26);
                  v25 = 0;
                }
              }
            }
            objc_msgSend(v8, "setValue:forKey:", v25, CFSTR("ControllerVariableMode"));
            objc_msgSend(v8, "setValue:forKey:", objc_msgSend(v7, "inputProperty"), CFSTR("ControllerVariableOverOtherProperty"));
            objc_msgSend(cf, "setObject:forKey:", v8, v6);
            goto LABEL_32;
          }
          v14 = v7;
          v15 = 0;
          goto LABEL_18;
        }
LABEL_32:
        ++v5;
      }
      while (v3 != v5);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      v3 = v28;
    }
    while (v28);
  }
  C3DParticleSystemSetProperyControllers(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), cf);
}

- (id)particleImage
{
  return self->_particleImage;
}

- (void)_updateParticleC3DImage:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__SCNParticleSystem__updateParticleC3DImage___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = a3;
  v6[5] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __45__SCNParticleSystem__updateParticleC3DImage___block_invoke(uint64_t a1)
{
  __C3DImage *v2;
  __C3DImage *v3;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = +[SCNMaterialProperty copyC3DImageFromImage:](SCNMaterialProperty, "copyC3DImageFromImage:");
    if (v2)
    {
      v3 = v2;
      C3DParticleSystemSetParticleTexture(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), v2);
      CFRelease(v3);
    }
  }
  else
  {
    C3DParticleSystemSetParticleTexture(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), 0);
  }
}

- (void)setParticleImage:(id)particleImage
{
  id v5;
  NSObject *v6;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleImage:].cold.1();
  }
  else
  {
    v5 = self->_particleImage;
    if (v5 != particleImage)
    {

      self->_particleImage = particleImage;
      -[SCNParticleSystem _updateParticleC3DImage:](self, "_updateParticleC3DImage:", particleImage);
    }
  }
}

- (void)_setParticleImagePath:(id)a3 withResolvedPath:(id)a4
{
  NSObject *v7;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem _setParticleImagePath:withResolvedPath:].cold.1();
  }
  else
  {

    self->_particleImage = a3;
    -[SCNParticleSystem _updateParticleC3DImage:](self, "_updateParticleC3DImage:", a4);
  }
}

- (SCNVector3)orientationDirection
{
  __n128 OrientationDirection;
  int8x8_t v4;
  __C3DScene *v5;
  uint64_t v6;
  float v7;
  int8x8_t v8;
  unsigned __int32 v9;
  SCNVector3 result;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v6 = (uint64_t)v5;
    if (v5)
      C3DSceneLock((uint64_t)v5);
    OrientationDirection = C3DParticleSystemGetOrientationDirection((__n128 *)self->_particleSystem);
    v4 = vext_s8((int8x8_t)OrientationDirection.n128_u64[0], (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)OrientationDirection, (int8x16_t)OrientationDirection, 8uLL), 4uLL);
    if (v6)
    {
      v8 = v4;
      v9 = OrientationDirection.n128_u32[0];
      C3DSceneUnlock(v6);
      v4 = v8;
      OrientationDirection.n128_u32[0] = v9;
    }
  }
  else
  {
    OrientationDirection.n128_u32[0] = LODWORD(self->_orientationDirection.x);
    v4 = *(int8x8_t *)&self->_orientationDirection.y;
  }
  v7 = *(float *)&v4.i32[1];
  result.x = OrientationDirection.n128_f32[0];
  result.y = *(float *)v4.i32;
  result.z = v7;
  return result;
}

- (void)setOrientationDirection:(SCNVector3)orientationDirection
{
  float z;
  float y;
  float x;
  __C3DScene *v7;
  NSObject *v8;
  _QWORD v9[5];
  float v10;
  float v11;
  float v12;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setOrientationDirection:].cold.1();
  }
  else
  {
    z = orientationDirection.z;
    y = orientationDirection.y;
    x = orientationDirection.x;
    if (!SCNVector3EqualToVector3(orientationDirection, self->_orientationDirection))
    {
      self->_orientationDirection.x = x;
      self->_orientationDirection.y = y;
      self->_orientationDirection.z = z;
      v7 = -[SCNParticleSystem sceneRef](self, "sceneRef");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __45__SCNParticleSystem_setOrientationDirection___block_invoke;
      v9[3] = &unk_1EA59E4C8;
      v9[4] = self;
      v10 = x;
      v11 = y;
      v12 = z;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v7, self, CFSTR("orientationDirection"), v9);
    }
  }
}

void __45__SCNParticleSystem_setOrientationDirection___block_invoke(uint64_t a1, __n128 a2)
{
  a2.n128_u64[0] = *(_QWORD *)(a1 + 40);
  a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
  C3DParticleSystemSetOrientationDirection(*(__n128 **)(*(_QWORD *)(a1 + 32) + 8), a2);
}

- (double)lightEmissionRadiusFactor
{
  double LightEmissionRadiusFactor;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_lightEmissionRadiusFactor;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetLightEmissionRadiusFactor((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  LightEmissionRadiusFactor = C3DParticleSystemGetLightEmissionRadiusFactor((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return LightEmissionRadiusFactor;
}

- (void)setLightEmissionRadiusFactor:(double)a3
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setLightEmissionRadiusFactor:].cold.1();
  }
  else if (self->_lightEmissionRadiusFactor != a3)
  {
    self->_lightEmissionRadiusFactor = a3;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__SCNParticleSystem_setLightEmissionRadiusFactor___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("fixedTimeStep"), v7);
  }
}

float __50__SCNParticleSystem_setLightEmissionRadiusFactor___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetLightEmissionRadiusFactor(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (SCNVector3)acceleration
{
  __n128 Acceleration;
  int8x8_t v4;
  __C3DScene *v5;
  uint64_t v6;
  float v7;
  int8x8_t v8;
  unsigned __int32 v9;
  SCNVector3 result;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v6 = (uint64_t)v5;
    if (v5)
      C3DSceneLock((uint64_t)v5);
    Acceleration = C3DParticleSystemGetAcceleration((__n128 *)self->_particleSystem);
    v4 = vext_s8((int8x8_t)Acceleration.n128_u64[0], (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)Acceleration, (int8x16_t)Acceleration, 8uLL), 4uLL);
    if (v6)
    {
      v8 = v4;
      v9 = Acceleration.n128_u32[0];
      C3DSceneUnlock(v6);
      v4 = v8;
      Acceleration.n128_u32[0] = v9;
    }
  }
  else
  {
    Acceleration.n128_u32[0] = LODWORD(self->_acceleration.x);
    v4 = *(int8x8_t *)&self->_acceleration.y;
  }
  v7 = *(float *)&v4.i32[1];
  result.x = Acceleration.n128_f32[0];
  result.y = *(float *)v4.i32;
  result.z = v7;
  return result;
}

- (BOOL)affectedByGravity
{
  __C3DScene *v4;
  uint64_t v5;
  char AffectedByGravity;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_affectedByGravity;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetAffectedByGravity((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  AffectedByGravity = C3DParticleSystemGetAffectedByGravity((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return AffectedByGravity;
}

- (void)setAffectedByGravity:(BOOL)affectedByGravity
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setAffectedByGravity:].cold.1();
  }
  else if (self->_affectedByGravity != affectedByGravity)
  {
    self->_affectedByGravity = affectedByGravity;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__SCNParticleSystem_setAffectedByGravity___block_invoke;
    v7[3] = &unk_1EA59E478;
    v7[4] = self;
    v8 = affectedByGravity;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("affectedByGravity"), v7);
  }
}

void __42__SCNParticleSystem_setAffectedByGravity___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetAffectedByGravity(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)affectedByPhysicsFields
{
  __C3DScene *v4;
  uint64_t v5;
  char AffectedByPhysicsFields;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_affectedByPhysicsFields;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetAffectedByPhysicsFields((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  AffectedByPhysicsFields = C3DParticleSystemGetAffectedByPhysicsFields((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return AffectedByPhysicsFields;
}

- (void)setAffectedByPhysicsFields:(BOOL)affectedByPhysicsFields
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setAffectedByPhysicsFields:].cold.1();
  }
  else if (self->_affectedByPhysicsFields != affectedByPhysicsFields)
  {
    self->_affectedByPhysicsFields = affectedByPhysicsFields;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__SCNParticleSystem_setAffectedByPhysicsFields___block_invoke;
    v7[3] = &unk_1EA59E478;
    v7[4] = self;
    v8 = affectedByPhysicsFields;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __48__SCNParticleSystem_setAffectedByPhysicsFields___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetAffectedByPhysicsFields(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (SCNParticleBirthDirection)birthDirection
{
  SCNParticleBirthDirection BirthDirection;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_birthDirection;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return (unint64_t)C3DParticleSystemGetBirthDirection((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  BirthDirection = (unint64_t)C3DParticleSystemGetBirthDirection((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return BirthDirection;
}

- (void)setBirthDirection:(SCNParticleBirthDirection)birthDirection
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setBirthDirection:].cold.1();
  }
  else if (self->_birthDirection != birthDirection)
  {
    self->_birthDirection = birthDirection;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__SCNParticleSystem_setBirthDirection___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = birthDirection;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __39__SCNParticleSystem_setBirthDirection___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetBirthDirection(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_BYTE *)(a1 + 40));
}

- (SCNParticleBirthLocation)birthLocation
{
  SCNParticleBirthLocation BirthLocation;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_birthLocation;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return (unint64_t)C3DParticleSystemGetBirthLocation((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  BirthLocation = (unint64_t)C3DParticleSystemGetBirthLocation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return BirthLocation;
}

- (void)setBirthLocation:(SCNParticleBirthLocation)birthLocation
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setBirthLocation:].cold.1();
  }
  else if (self->_birthLocation != birthLocation)
  {
    self->_birthLocation = birthLocation;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__SCNParticleSystem_setBirthLocation___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = birthLocation;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __38__SCNParticleSystem_setBirthLocation___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetBirthLocation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_BYTE *)(a1 + 40));
}

- (CGFloat)birthRate
{
  double BirthRate;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_birthRate;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetBirthRate((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  BirthRate = C3DParticleSystemGetBirthRate((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return BirthRate;
}

- (void)setBirthRate:(CGFloat)birthRate
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setBirthRate:].cold.1();
  }
  else if (self->_birthRate != birthRate)
  {
    self->_birthRate = birthRate;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __34__SCNParticleSystem_setBirthRate___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = birthRate;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("birthRate"), v7);
  }
}

float __34__SCNParticleSystem_setBirthRate___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetBirthRate(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)birthRateVariation
{
  double BirthRateVariation;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_birthRateVariation;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetBirthRateVariation((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  BirthRateVariation = C3DParticleSystemGetBirthRateVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return BirthRateVariation;
}

- (void)setBirthRateVariation:(CGFloat)birthRateVariation
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setBirthRateVariation:].cold.1();
  }
  else if (self->_birthRateVariation != birthRateVariation)
  {
    self->_birthRateVariation = birthRateVariation;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__SCNParticleSystem_setBirthRateVariation___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = birthRateVariation;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("birthRateVariation"), v7);
  }
}

float __43__SCNParticleSystem_setBirthRateVariation___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetBirthRateVariation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (BOOL)blackPassEnabled
{
  __C3DScene *v4;
  uint64_t v5;
  char BlackPassEnabled;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_blackPassEnabled;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetBlackPassEnabled((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  BlackPassEnabled = C3DParticleSystemGetBlackPassEnabled((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return BlackPassEnabled;
}

- (void)setBlackPassEnabled:(BOOL)blackPassEnabled
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setBlackPassEnabled:].cold.1();
  }
  else if (self->_blackPassEnabled != blackPassEnabled)
  {
    self->_blackPassEnabled = blackPassEnabled;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__SCNParticleSystem_setBlackPassEnabled___block_invoke;
    v7[3] = &unk_1EA59E478;
    v7[4] = self;
    v8 = blackPassEnabled;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __41__SCNParticleSystem_setBlackPassEnabled___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetBlackPassEnabled(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (SCNParticleBlendMode)blendMode
{
  SCNParticleBlendMode BlendMode;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_blendMode;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return (unint64_t)C3DParticleSystemGetBlendMode((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  BlendMode = (unint64_t)C3DParticleSystemGetBlendMode((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return BlendMode;
}

- (void)setBlendMode:(SCNParticleBlendMode)blendMode
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setBlendMode:].cold.1();
  }
  else if (self->_blendMode != blendMode)
  {
    self->_blendMode = blendMode;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __34__SCNParticleSystem_setBlendMode___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = blendMode;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __34__SCNParticleSystem_setBlendMode___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetBlendMode(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (CGFloat)dampingFactor
{
  double DampingFactor;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_dampingFactor;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetDampingFactor((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  DampingFactor = C3DParticleSystemGetDampingFactor((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return DampingFactor;
}

- (void)setDampingFactor:(CGFloat)dampingFactor
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setDampingFactor:].cold.1();
  }
  else if (self->_dampingFactor != dampingFactor)
  {
    self->_dampingFactor = dampingFactor;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__SCNParticleSystem_setDampingFactor___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = dampingFactor;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("dampingFactor"), v7);
  }
}

float __38__SCNParticleSystem_setDampingFactor___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetDampingFactor(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)emissionDuration
{
  double EmissionDuration;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_emissionDuration;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetEmissionDuration((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  EmissionDuration = C3DParticleSystemGetEmissionDuration((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return EmissionDuration;
}

- (void)setEmissionDuration:(CGFloat)emissionDuration
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setEmissionDuration:].cold.1();
  }
  else if (self->_emissionDuration != emissionDuration)
  {
    self->_emissionDuration = emissionDuration;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__SCNParticleSystem_setEmissionDuration___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = emissionDuration;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("emissionDuration"), v7);
  }
}

float __41__SCNParticleSystem_setEmissionDuration___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetEmissionDuration(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)emissionDurationVariation
{
  double EmissionDurationVariation;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_emissionDurationVariation;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetEmissionDurationVariation((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  EmissionDurationVariation = C3DParticleSystemGetEmissionDurationVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return EmissionDurationVariation;
}

- (void)setEmissionDurationVariation:(CGFloat)emissionDurationVariation
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setEmissionDurationVariation:].cold.1();
  }
  else if (self->_emissionDurationVariation != emissionDurationVariation)
  {
    self->_emissionDurationVariation = emissionDurationVariation;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__SCNParticleSystem_setEmissionDurationVariation___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = emissionDurationVariation;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("emissionDurationVariation"), v7);
  }
}

float __50__SCNParticleSystem_setEmissionDurationVariation___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetEmissionDurationVariation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (SCNGeometry)emitterShape
{
  SCNGeometry *v3;
  __C3DScene *v4;
  uint64_t v5;
  uint64_t EmitterShape;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    EmitterShape = C3DParticleSystemGetEmitterShape((uint64_t)self->_particleSystem);
    if (EmitterShape)
    {
      v3 = +[SCNGeometry geometryWithGeometryRef:](SCNGeometry, "geometryWithGeometryRef:", EmitterShape);
      if (!v5)
        return v3;
    }
    else
    {
      v3 = 0;
      if (!v5)
        return v3;
    }
    C3DSceneUnlock(v5);
    return v3;
  }
  return self->_emitterShape;
}

- (void)setEmitterShape:(SCNGeometry *)emitterShape
{
  SCNGeometry *v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setEmitterShape:].cold.1();
  }
  else
  {
    v5 = self->_emitterShape;
    if (v5 != emitterShape)
    {

      self->_emitterShape = emitterShape;
      v6 = -[SCNParticleSystem sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __37__SCNParticleSystem_setEmitterShape___block_invoke;
      v8[3] = &unk_1EA59F740;
      v8[4] = self;
      v8[5] = emitterShape;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v8);
    }
  }
}

CFTypeRef __37__SCNParticleSystem_setEmitterShape___block_invoke(uint64_t a1)
{
  return C3DParticleSystemSetEmitterShape(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (CFTypeRef)objc_msgSend(*(id *)(a1 + 40), "__CFObject"));
}

- (SCNVector3)emittingDirection
{
  __n128 EmittingDirection;
  int8x8_t v4;
  __C3DScene *v5;
  uint64_t v6;
  float v7;
  int8x8_t v8;
  unsigned __int32 v9;
  SCNVector3 result;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v6 = (uint64_t)v5;
    if (v5)
      C3DSceneLock((uint64_t)v5);
    EmittingDirection = C3DParticleSystemGetEmittingDirection((__n128 *)self->_particleSystem);
    v4 = vext_s8((int8x8_t)EmittingDirection.n128_u64[0], (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)EmittingDirection, (int8x16_t)EmittingDirection, 8uLL), 4uLL);
    if (v6)
    {
      v8 = v4;
      v9 = EmittingDirection.n128_u32[0];
      C3DSceneUnlock(v6);
      v4 = v8;
      EmittingDirection.n128_u32[0] = v9;
    }
  }
  else
  {
    EmittingDirection.n128_u32[0] = LODWORD(self->_emittingDirection.x);
    v4 = *(int8x8_t *)&self->_emittingDirection.y;
  }
  v7 = *(float *)&v4.i32[1];
  result.x = EmittingDirection.n128_f32[0];
  result.y = *(float *)v4.i32;
  result.z = v7;
  return result;
}

- (double)fixedTimeStep
{
  double FixedTimeStep;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_fixedTimeStep;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetFixedTimeStep((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  FixedTimeStep = C3DParticleSystemGetFixedTimeStep((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return FixedTimeStep;
}

- (void)setFixedTimeStep:(double)a3
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setFixedTimeStep:].cold.1();
  }
  else if (self->_fixedTimeStep != a3)
  {
    self->_fixedTimeStep = a3;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__SCNParticleSystem_setFixedTimeStep___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("fixedTimeStep"), v7);
  }
}

float __38__SCNParticleSystem_setFixedTimeStep___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetFixedTimeStep(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)fresnelExponent
{
  double FresnelExponent;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_fresnelExponent;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetFresnelExponent((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  FresnelExponent = C3DParticleSystemGetFresnelExponent((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return FresnelExponent;
}

- (void)setFresnelExponent:(CGFloat)fresnelExponent
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setFresnelExponent:].cold.1();
  }
  else if (self->_fresnelExponent != fresnelExponent)
  {
    self->_fresnelExponent = fresnelExponent;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__SCNParticleSystem_setFresnelExponent___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = fresnelExponent;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("fresnelExponent"), v7);
  }
}

float __40__SCNParticleSystem_setFresnelExponent___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetFresnelExponent(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)idleDuration
{
  double IdleDuration;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_idleDuration;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetIdleDuration((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  IdleDuration = C3DParticleSystemGetIdleDuration((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return IdleDuration;
}

- (void)setIdleDuration:(CGFloat)idleDuration
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setIdleDuration:].cold.1();
  }
  else if (self->_idleDuration != idleDuration)
  {
    self->_idleDuration = idleDuration;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__SCNParticleSystem_setIdleDuration___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = idleDuration;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("idleDuration"), v7);
  }
}

float __37__SCNParticleSystem_setIdleDuration___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetIdleDuration(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)idleDurationVariation
{
  double IdleDurationVariation;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_idleDurationVariation;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetIdleDurationVariation((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  IdleDurationVariation = C3DParticleSystemGetIdleDurationVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return IdleDurationVariation;
}

- (void)setIdleDurationVariation:(CGFloat)idleDurationVariation
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setIdleDurationVariation:].cold.1();
  }
  else if (self->_idleDurationVariation != idleDurationVariation)
  {
    self->_idleDurationVariation = idleDurationVariation;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__SCNParticleSystem_setIdleDurationVariation___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = idleDurationVariation;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("idleDurationVariation"), v7);
  }
}

float __46__SCNParticleSystem_setIdleDurationVariation___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetIdleDurationVariation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (SCNParticleImageSequenceAnimationMode)imageSequenceAnimationMode
{
  SCNParticleImageSequenceAnimationMode ImageSequenceAnimationMode;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_imageSequenceAnimationMode;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return (unint64_t)C3DParticleSystemGetImageSequenceAnimationMode((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ImageSequenceAnimationMode = (unint64_t)C3DParticleSystemGetImageSequenceAnimationMode((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ImageSequenceAnimationMode;
}

- (void)setImageSequenceAnimationMode:(SCNParticleImageSequenceAnimationMode)imageSequenceAnimationMode
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setImageSequenceAnimationMode:].cold.1();
  }
  else if (self->_imageSequenceAnimationMode != imageSequenceAnimationMode)
  {
    self->_imageSequenceAnimationMode = imageSequenceAnimationMode;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__SCNParticleSystem_setImageSequenceAnimationMode___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = imageSequenceAnimationMode;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __51__SCNParticleSystem_setImageSequenceAnimationMode___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetImageSequenceAnimationMode(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (NSUInteger)imageSequenceColumnCount
{
  NSUInteger ImageSequenceColumnCount;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_imageSequenceColumnCount;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetImageSequenceColumnCount((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ImageSequenceColumnCount = C3DParticleSystemGetImageSequenceColumnCount((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ImageSequenceColumnCount;
}

- (void)setImageSequenceColumnCount:(NSUInteger)imageSequenceColumnCount
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setImageSequenceColumnCount:].cold.1();
  }
  else if (self->_imageSequenceColumnCount != imageSequenceColumnCount)
  {
    self->_imageSequenceColumnCount = imageSequenceColumnCount;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__SCNParticleSystem_setImageSequenceColumnCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = imageSequenceColumnCount;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("imageSequenceColumnCount"), v7);
  }
}

void __49__SCNParticleSystem_setImageSequenceColumnCount___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetImageSequenceColumnCount(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int16 *)(a1 + 40));
}

- (CGFloat)imageSequenceFrameRate
{
  double ImageSequenceFrameRate;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_imageSequenceFrameRate;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetImageSequenceFrameRate((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ImageSequenceFrameRate = C3DParticleSystemGetImageSequenceFrameRate((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ImageSequenceFrameRate;
}

- (void)setImageSequenceFrameRate:(CGFloat)imageSequenceFrameRate
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setImageSequenceFrameRate:].cold.1();
  }
  else if (self->_imageSequenceFrameRate != imageSequenceFrameRate)
  {
    self->_imageSequenceFrameRate = imageSequenceFrameRate;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__SCNParticleSystem_setImageSequenceFrameRate___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = imageSequenceFrameRate;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("imageSequenceFrameRate"), v7);
  }
}

float __47__SCNParticleSystem_setImageSequenceFrameRate___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetImageSequenceFrameRate(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)imageSequenceFrameRateVariation
{
  double ImageSequenceFrameRateVariation;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_imageSequenceFrameRateVariation;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetImageSequenceFrameRateVariation((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ImageSequenceFrameRateVariation = C3DParticleSystemGetImageSequenceFrameRateVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ImageSequenceFrameRateVariation;
}

- (void)setImageSequenceFrameRateVariation:(CGFloat)imageSequenceFrameRateVariation
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setImageSequenceFrameRateVariation:].cold.1();
  }
  else if (self->_imageSequenceFrameRateVariation != imageSequenceFrameRateVariation)
  {
    self->_imageSequenceFrameRateVariation = imageSequenceFrameRateVariation;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__SCNParticleSystem_setImageSequenceFrameRateVariation___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = imageSequenceFrameRateVariation;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("imageSequenceFrameRateVariation"), v7);
  }
}

float __56__SCNParticleSystem_setImageSequenceFrameRateVariation___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetImageSequenceFrameRateVariation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)imageSequenceInitialFrame
{
  double ImageSequenceInitialFrame;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_imageSequenceInitialFrame;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetImageSequenceInitialFrame((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ImageSequenceInitialFrame = C3DParticleSystemGetImageSequenceInitialFrame((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ImageSequenceInitialFrame;
}

- (void)setImageSequenceInitialFrame:(CGFloat)imageSequenceInitialFrame
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setImageSequenceInitialFrame:].cold.1();
  }
  else if (self->_imageSequenceInitialFrame != imageSequenceInitialFrame)
  {
    self->_imageSequenceInitialFrame = imageSequenceInitialFrame;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__SCNParticleSystem_setImageSequenceInitialFrame___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = imageSequenceInitialFrame;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("imageSequenceInitialFrame"), v7);
  }
}

float __50__SCNParticleSystem_setImageSequenceInitialFrame___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetImageSequenceInitialFrame(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)imageSequenceInitialFrameVariation
{
  double ImageSequenceInitialFrameVariation;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_imageSequenceInitialFrameVariation;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetImageSequenceInitialFrameVariation((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ImageSequenceInitialFrameVariation = C3DParticleSystemGetImageSequenceInitialFrameVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ImageSequenceInitialFrameVariation;
}

- (void)setImageSequenceInitialFrameVariation:(CGFloat)imageSequenceInitialFrameVariation
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setImageSequenceInitialFrameVariation:].cold.1();
  }
  else if (self->_imageSequenceInitialFrameVariation != imageSequenceInitialFrameVariation)
  {
    self->_imageSequenceInitialFrameVariation = imageSequenceInitialFrameVariation;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__SCNParticleSystem_setImageSequenceInitialFrameVariation___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = imageSequenceInitialFrameVariation;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("imageSequenceInitialFrameVariation"), v7);
  }
}

float __59__SCNParticleSystem_setImageSequenceInitialFrameVariation___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetImageSequenceInitialFrameVariation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (NSUInteger)imageSequenceRowCount
{
  NSUInteger ImageSequenceRowCount;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_imageSequenceRowCount;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetImageSequenceRowCount((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ImageSequenceRowCount = C3DParticleSystemGetImageSequenceRowCount((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ImageSequenceRowCount;
}

- (void)setImageSequenceRowCount:(NSUInteger)imageSequenceRowCount
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setImageSequenceRowCount:].cold.1();
  }
  else if (self->_imageSequenceRowCount != imageSequenceRowCount)
  {
    self->_imageSequenceRowCount = imageSequenceRowCount;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__SCNParticleSystem_setImageSequenceRowCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = imageSequenceRowCount;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("imageSequenceRowCount"), v7);
  }
}

void __46__SCNParticleSystem_setImageSequenceRowCount___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetImageSequenceRowCount(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int16 *)(a1 + 40));
}

- (BOOL)isLocal
{
  __C3DScene *v4;
  uint64_t v5;
  char IsLocal;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_isLocal;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetIsLocal((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  IsLocal = C3DParticleSystemGetIsLocal((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return IsLocal;
}

- (void)setIsLocal:(BOOL)a3
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setIsLocal:].cold.1();
  }
  else if (self->_isLocal != a3)
  {
    self->_isLocal = a3;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __32__SCNParticleSystem_setIsLocal___block_invoke;
    v7[3] = &unk_1EA59E478;
    v7[4] = self;
    v8 = a3;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("isLocal"), v7);
  }
}

void __32__SCNParticleSystem_setIsLocal___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetIsLocal(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)lightingEnabled
{
  __C3DScene *v4;
  uint64_t v5;
  char LightingEnabled;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_lightingEnabled;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetLightingEnabled((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  LightingEnabled = C3DParticleSystemGetLightingEnabled((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return LightingEnabled;
}

- (void)setLightingEnabled:(BOOL)lightingEnabled
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setLightingEnabled:].cold.1();
  }
  else if (self->_lightingEnabled != lightingEnabled)
  {
    self->_lightingEnabled = lightingEnabled;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__SCNParticleSystem_setLightingEnabled___block_invoke;
    v7[3] = &unk_1EA59E478;
    v7[4] = self;
    v8 = lightingEnabled;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __40__SCNParticleSystem_setLightingEnabled___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetLightingEnabled(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)loops
{
  __C3DScene *v4;
  uint64_t v5;
  char Loops;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_loops;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetLoops((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  Loops = C3DParticleSystemGetLoops((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return Loops;
}

- (void)setLoops:(BOOL)loops
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setLoops:].cold.1();
  }
  else if (self->_loops != loops)
  {
    self->_loops = loops;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __30__SCNParticleSystem_setLoops___block_invoke;
    v7[3] = &unk_1EA59E478;
    v7[4] = self;
    v8 = loops;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("loops"), v7);
  }
}

void __30__SCNParticleSystem_setLoops___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetLoops(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (SCNParticleOrientationMode)orientationMode
{
  SCNParticleOrientationMode OrientationMode;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_orientationMode;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return (unint64_t)C3DParticleSystemGetOrientationMode((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  OrientationMode = (unint64_t)C3DParticleSystemGetOrientationMode((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return OrientationMode;
}

- (void)setOrientationMode:(SCNParticleOrientationMode)orientationMode
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setOrientationMode:].cold.1();
  }
  else if (self->_orientationMode != orientationMode)
  {
    self->_orientationMode = orientationMode;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__SCNParticleSystem_setOrientationMode___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = orientationMode;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __40__SCNParticleSystem_setOrientationMode___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetOrientationMode(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (CGFloat)particleAngle
{
  double ParticleAngle;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleAngle;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetParticleAngle((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleAngle = C3DParticleSystemGetParticleAngle((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleAngle;
}

- (void)setParticleAngle:(CGFloat)particleAngle
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleAngle:].cold.1();
  }
  else if (self->_particleAngle != particleAngle)
  {
    self->_particleAngle = particleAngle;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__SCNParticleSystem_setParticleAngle___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = particleAngle;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("particleAngle"), v7);
  }
}

float __38__SCNParticleSystem_setParticleAngle___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleAngle(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleAngleVariation
{
  double ParticleAngleVariation;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleAngleVariation;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetParticleAngleVariation((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleAngleVariation = C3DParticleSystemGetParticleAngleVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleAngleVariation;
}

- (void)setParticleAngleVariation:(CGFloat)particleAngleVariation
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleAngleVariation:].cold.1();
  }
  else if (self->_particleAngleVariation != particleAngleVariation)
  {
    self->_particleAngleVariation = particleAngleVariation;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__SCNParticleSystem_setParticleAngleVariation___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = particleAngleVariation;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("particleAngleVariation"), v7);
  }
}

float __47__SCNParticleSystem_setParticleAngleVariation___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleAngleVariation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleAngularVelocity
{
  double ParticleAngularVelocity;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleAngularVelocity;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetParticleAngularVelocity((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleAngularVelocity = C3DParticleSystemGetParticleAngularVelocity((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleAngularVelocity;
}

- (void)setParticleAngularVelocity:(CGFloat)particleAngularVelocity
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleAngularVelocity:].cold.1();
  }
  else if (self->_particleAngularVelocity != particleAngularVelocity)
  {
    self->_particleAngularVelocity = particleAngularVelocity;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__SCNParticleSystem_setParticleAngularVelocity___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = particleAngularVelocity;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("particleAngularVelocity"), v7);
  }
}

float __48__SCNParticleSystem_setParticleAngularVelocity___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleAngularVelocity(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleAngularVelocityVariation
{
  double ParticleAngularVelocityVariation;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleAngularVelocityVariation;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetParticleAngularVelocityVariation((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleAngularVelocityVariation = C3DParticleSystemGetParticleAngularVelocityVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleAngularVelocityVariation;
}

- (void)setParticleAngularVelocityVariation:(CGFloat)particleAngularVelocityVariation
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleAngularVelocityVariation:].cold.1();
  }
  else if (self->_particleAngularVelocityVariation != particleAngularVelocityVariation)
  {
    self->_particleAngularVelocityVariation = particleAngularVelocityVariation;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__SCNParticleSystem_setParticleAngularVelocityVariation___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = particleAngularVelocityVariation;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("particleAngularVelocityVariation"), v7);
  }
}

float __57__SCNParticleSystem_setParticleAngularVelocityVariation___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleAngularVelocityVariation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleBounce
{
  double ParticleBounce;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleBounce;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetParticleBounce((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleBounce = C3DParticleSystemGetParticleBounce((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleBounce;
}

- (void)setParticleBounce:(CGFloat)particleBounce
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleBounce:].cold.1();
  }
  else if (self->_particleBounce != particleBounce)
  {
    self->_particleBounce = particleBounce;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__SCNParticleSystem_setParticleBounce___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = particleBounce;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("particleBounce"), v7);
  }
}

float __39__SCNParticleSystem_setParticleBounce___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleBounce(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleBounceVariation
{
  double ParticleBounceVariation;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleBounceVariation;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetParticleBounceVariation((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleBounceVariation = C3DParticleSystemGetParticleBounceVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleBounceVariation;
}

- (void)setParticleBounceVariation:(CGFloat)particleBounceVariation
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleBounceVariation:].cold.1();
  }
  else if (self->_particleBounceVariation != particleBounceVariation)
  {
    self->_particleBounceVariation = particleBounceVariation;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__SCNParticleSystem_setParticleBounceVariation___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = particleBounceVariation;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("particleBounceVariation"), v7);
  }
}

float __48__SCNParticleSystem_setParticleBounceVariation___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleBounceVariation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleCharge
{
  double ParticleCharge;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleCharge;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetParticleCharge((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleCharge = C3DParticleSystemGetParticleCharge((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleCharge;
}

- (void)setParticleCharge:(CGFloat)particleCharge
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleCharge:].cold.1();
  }
  else if (self->_particleCharge != particleCharge)
  {
    self->_particleCharge = particleCharge;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__SCNParticleSystem_setParticleCharge___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = particleCharge;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("particleCharge"), v7);
  }
}

float __39__SCNParticleSystem_setParticleCharge___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleCharge(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleChargeVariation
{
  double ParticleChargeVariation;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleChargeVariation;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetParticleChargeVariation((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleChargeVariation = C3DParticleSystemGetParticleChargeVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleChargeVariation;
}

- (void)setParticleChargeVariation:(CGFloat)particleChargeVariation
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleChargeVariation:].cold.1();
  }
  else if (self->_particleChargeVariation != particleChargeVariation)
  {
    self->_particleChargeVariation = particleChargeVariation;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__SCNParticleSystem_setParticleChargeVariation___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = particleChargeVariation;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("particleChargeVariation"), v7);
  }
}

float __48__SCNParticleSystem_setParticleChargeVariation___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleChargeVariation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (UIColor)particleColor
{
  void *v3;
  __C3DScene *v4;
  uint64_t v5;
  uint64_t ParticleColor;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    ParticleColor = C3DParticleSystemGetParticleColor((uint64_t)self->_particleSystem);
    v3 = (void *)C3DColor4ToRGBCFColor(ParticleColor);
    if (v5)
      C3DSceneUnlock(v5);
  }
  else
  {
    v3 = self->_particleColor;
  }
  return (UIColor *)(id)objc_msgSend(v3, "copy");
}

- (void)setParticleColor:(UIColor *)particleColor
{
  UIColor *v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleColor:].cold.1();
  }
  else
  {
    v5 = self->_particleColor;
    if (v5 != particleColor)
    {

      self->_particleColor = (UIColor *)-[UIColor copy](particleColor, "copy");
      v6 = -[SCNParticleSystem sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __38__SCNParticleSystem_setParticleColor___block_invoke;
      v8[3] = &unk_1EA59F740;
      v8[4] = particleColor;
      v8[5] = self;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("particleColor"), v8);
    }
  }
}

double __38__SCNParticleSystem_setParticleColor___block_invoke(uint64_t a1)
{
  unint64_t v2;
  double result;
  __n128 v4;

  v4.n128_u64[0] = C3DColor4FromRGBCFColor(*(const void **)(a1 + 32), 0);
  v4.n128_u64[1] = v2;
  *(_QWORD *)&result = C3DParticleSystemSetParticleColor((__n128 *)*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), &v4).n128_u64[0];
  return result;
}

- (SCNVector4)particleColorVariation
{
  __n128 ParticleColorVariation;
  __C3DScene *v4;
  uint64_t v5;
  float v6;
  float v7;
  float v8;
  __n128 v9;
  SCNVector4 result;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    ParticleColorVariation = C3DParticleSystemGetParticleColorVariation((__n128 *)self->_particleSystem);
    if (v5)
    {
      v9 = ParticleColorVariation;
      C3DSceneUnlock(v5);
      ParticleColorVariation = v9;
    }
  }
  else
  {
    ParticleColorVariation = (__n128)self->_particleColorVariation;
  }
  v6 = ParticleColorVariation.n128_f32[1];
  v8 = ParticleColorVariation.n128_f32[3];
  v7 = ParticleColorVariation.n128_f32[2];
  result.x = ParticleColorVariation.n128_f32[0];
  result.w = v8;
  result.z = v7;
  result.y = v6;
  return result;
}

- (BOOL)particleDiesOnCollision
{
  __C3DScene *v4;
  uint64_t v5;
  char ParticleDiesOnCollision;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleDiesOnCollision;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetParticleDiesOnCollision((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleDiesOnCollision = C3DParticleSystemGetParticleDiesOnCollision((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleDiesOnCollision;
}

- (void)setParticleDiesOnCollision:(BOOL)particleDiesOnCollision
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleDiesOnCollision:].cold.1();
  }
  else if (self->_particleDiesOnCollision != particleDiesOnCollision)
  {
    self->_particleDiesOnCollision = particleDiesOnCollision;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__SCNParticleSystem_setParticleDiesOnCollision___block_invoke;
    v7[3] = &unk_1EA59E478;
    v7[4] = self;
    v8 = particleDiesOnCollision;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __48__SCNParticleSystem_setParticleDiesOnCollision___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetParticleDiesOnCollision(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_BYTE *)(a1 + 40));
}

- (CGFloat)particleFriction
{
  double ParticleFriction;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleFriction;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetParticleFriction((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleFriction = C3DParticleSystemGetParticleFriction((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleFriction;
}

- (void)setParticleFriction:(CGFloat)particleFriction
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleFriction:].cold.1();
  }
  else if (self->_particleFriction != particleFriction)
  {
    self->_particleFriction = particleFriction;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__SCNParticleSystem_setParticleFriction___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = particleFriction;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("particleFriction"), v7);
  }
}

float __41__SCNParticleSystem_setParticleFriction___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleFriction(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleFrictionVariation
{
  double ParticleFrictionVariation;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleFrictionVariation;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetParticleFrictionVariation((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleFrictionVariation = C3DParticleSystemGetParticleFrictionVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleFrictionVariation;
}

- (void)setParticleFrictionVariation:(CGFloat)particleFrictionVariation
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleFrictionVariation:].cold.1();
  }
  else if (self->_particleFrictionVariation != particleFrictionVariation)
  {
    self->_particleFrictionVariation = particleFrictionVariation;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__SCNParticleSystem_setParticleFrictionVariation___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = particleFrictionVariation;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("particleFrictionVariation"), v7);
  }
}

float __50__SCNParticleSystem_setParticleFrictionVariation___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleFrictionVariation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleLifeSpan
{
  double ParticleLifeSpan;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleLifeSpan;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetParticleLifeSpan((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleLifeSpan = C3DParticleSystemGetParticleLifeSpan((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleLifeSpan;
}

- (void)setParticleLifeSpan:(CGFloat)particleLifeSpan
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleLifeSpan:].cold.1();
  }
  else if (self->_particleLifeSpan != particleLifeSpan)
  {
    self->_particleLifeSpan = particleLifeSpan;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__SCNParticleSystem_setParticleLifeSpan___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = particleLifeSpan;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("particleLifeSpan"), v7);
  }
}

float __41__SCNParticleSystem_setParticleLifeSpan___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleLifeSpan(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleLifeSpanVariation
{
  double ParticleLifeSpanVariation;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleLifeSpanVariation;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetParticleLifeSpanVariation((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleLifeSpanVariation = C3DParticleSystemGetParticleLifeSpanVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleLifeSpanVariation;
}

- (void)setParticleLifeSpanVariation:(CGFloat)particleLifeSpanVariation
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleLifeSpanVariation:].cold.1();
  }
  else if (self->_particleLifeSpanVariation != particleLifeSpanVariation)
  {
    self->_particleLifeSpanVariation = particleLifeSpanVariation;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__SCNParticleSystem_setParticleLifeSpanVariation___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = particleLifeSpanVariation;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("particleLifeSpanVariation"), v7);
  }
}

float __50__SCNParticleSystem_setParticleLifeSpanVariation___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleLifeSpanVariation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleMass
{
  double ParticleMass;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleMass;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetParticleMass((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleMass = C3DParticleSystemGetParticleMass((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleMass;
}

- (void)setParticleMass:(CGFloat)particleMass
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleMass:].cold.1();
  }
  else if (self->_particleMass != particleMass)
  {
    self->_particleMass = particleMass;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__SCNParticleSystem_setParticleMass___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = particleMass;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("particleMass"), v7);
  }
}

float __37__SCNParticleSystem_setParticleMass___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleMass(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleMassVariation
{
  double ParticleMassVariation;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleMassVariation;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetParticleMassVariation((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleMassVariation = C3DParticleSystemGetParticleMassVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleMassVariation;
}

- (void)setParticleMassVariation:(CGFloat)particleMassVariation
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleMassVariation:].cold.1();
  }
  else if (self->_particleMassVariation != particleMassVariation)
  {
    self->_particleMassVariation = particleMassVariation;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__SCNParticleSystem_setParticleMassVariation___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = particleMassVariation;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("particleMassVariation"), v7);
  }
}

float __46__SCNParticleSystem_setParticleMassVariation___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleMassVariation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleSize
{
  double ParticleSize;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleSize;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetParticleSize((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleSize = C3DParticleSystemGetParticleSize((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleSize;
}

- (void)setParticleSize:(CGFloat)particleSize
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleSize:].cold.1();
  }
  else if (self->_particleSize != particleSize)
  {
    self->_particleSize = particleSize;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__SCNParticleSystem_setParticleSize___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = particleSize;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("particleSize"), v7);
  }
}

float __37__SCNParticleSystem_setParticleSize___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleSize(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleSizeVariation
{
  double ParticleSizeVariation;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleSizeVariation;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetParticleSizeVariation((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleSizeVariation = C3DParticleSystemGetParticleSizeVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleSizeVariation;
}

- (void)setParticleSizeVariation:(CGFloat)particleSizeVariation
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleSizeVariation:].cold.1();
  }
  else if (self->_particleSizeVariation != particleSizeVariation)
  {
    self->_particleSizeVariation = particleSizeVariation;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__SCNParticleSystem_setParticleSizeVariation___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = particleSizeVariation;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("particleSizeVariation"), v7);
  }
}

float __46__SCNParticleSystem_setParticleSizeVariation___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleSizeVariation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleVelocity
{
  double ParticleVelocity;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleVelocity;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetParticleVelocity((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleVelocity = C3DParticleSystemGetParticleVelocity((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleVelocity;
}

- (void)setParticleVelocity:(CGFloat)particleVelocity
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleVelocity:].cold.1();
  }
  else if (self->_particleVelocity != particleVelocity)
  {
    self->_particleVelocity = particleVelocity;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__SCNParticleSystem_setParticleVelocity___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = particleVelocity;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("particleVelocity"), v7);
  }
}

float __41__SCNParticleSystem_setParticleVelocity___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleVelocity(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleVelocityVariation
{
  double ParticleVelocityVariation;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleVelocityVariation;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetParticleVelocityVariation((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleVelocityVariation = C3DParticleSystemGetParticleVelocityVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleVelocityVariation;
}

- (void)setParticleVelocityVariation:(CGFloat)particleVelocityVariation
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleVelocityVariation:].cold.1();
  }
  else if (self->_particleVelocityVariation != particleVelocityVariation)
  {
    self->_particleVelocityVariation = particleVelocityVariation;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__SCNParticleSystem_setParticleVelocityVariation___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = particleVelocityVariation;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("particleVelocityVariation"), v7);
  }
}

float __50__SCNParticleSystem_setParticleVelocityVariation___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleVelocityVariation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (BOOL)physicsCollisionsEnabled
{
  __C3DScene *v4;
  uint64_t v5;
  char PhysicsCollisionsEnabled;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_physicsCollisionsEnabled;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetPhysicsCollisionsEnabled((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  PhysicsCollisionsEnabled = C3DParticleSystemGetPhysicsCollisionsEnabled((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return PhysicsCollisionsEnabled;
}

- (void)setPhysicsCollisionsEnabled:(BOOL)a3
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setPhysicsCollisionsEnabled:].cold.1();
  }
  else if (self->_physicsCollisionsEnabled != a3)
  {
    self->_physicsCollisionsEnabled = a3;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__SCNParticleSystem_setPhysicsCollisionsEnabled___block_invoke;
    v7[3] = &unk_1EA59E478;
    v7[4] = self;
    v8 = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __49__SCNParticleSystem_setPhysicsCollisionsEnabled___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetPhysicsCollisionsEnabled(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_BYTE *)(a1 + 40));
}

- (int64_t)renderingMode
{
  int64_t RenderingMode;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_renderingMode;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetRenderingMode((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  RenderingMode = C3DParticleSystemGetRenderingMode((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return RenderingMode;
}

- (void)setRenderingMode:(int64_t)a3
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setRenderingMode:].cold.1();
  }
  else if (self->_renderingMode != a3)
  {
    self->_renderingMode = a3;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__SCNParticleSystem_setRenderingMode___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __38__SCNParticleSystem_setRenderingMode___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetRenderingMode(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (int64_t)seed
{
  int64_t Seed;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_seed;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return (int)C3DParticleSystemGetSeed((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  Seed = (int)C3DParticleSystemGetSeed((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return Seed;
}

- (void)setSeed:(int64_t)a3
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setSeed:].cold.1();
  }
  else if (self->_seed != a3)
  {
    self->_seed = a3;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __29__SCNParticleSystem_setSeed___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __29__SCNParticleSystem_setSeed___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetSeed(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_DWORD *)(a1 + 40));
}

- (BOOL)softParticlesEnabled
{
  __C3DScene *v4;
  uint64_t v5;
  char SoftParticlesEnabled;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_softParticlesEnabled;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetSoftParticlesEnabled((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  SoftParticlesEnabled = C3DParticleSystemGetSoftParticlesEnabled((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return SoftParticlesEnabled;
}

- (void)setSoftParticlesEnabled:(BOOL)a3
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setSoftParticlesEnabled:].cold.1();
  }
  else if (self->_softParticlesEnabled != a3)
  {
    self->_softParticlesEnabled = a3;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__SCNParticleSystem_setSoftParticlesEnabled___block_invoke;
    v7[3] = &unk_1EA59E478;
    v7[4] = self;
    v8 = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __45__SCNParticleSystem_setSoftParticlesEnabled___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetSoftParticlesEnabled(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (SCNParticleSortingMode)sortingMode
{
  SCNParticleSortingMode SortingMode;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_sortingMode;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return (unint64_t)C3DParticleSystemGetSortingMode((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  SortingMode = (unint64_t)C3DParticleSystemGetSortingMode((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return SortingMode;
}

- (void)setSortingMode:(SCNParticleSortingMode)sortingMode
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setSortingMode:].cold.1();
  }
  else if (self->_sortingMode != sortingMode)
  {
    self->_sortingMode = sortingMode;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__SCNParticleSystem_setSortingMode___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = sortingMode;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __36__SCNParticleSystem_setSortingMode___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetSortingMode(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (CGFloat)speedFactor
{
  double SpeedFactor;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_speedFactor;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetSpeedFactor((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  SpeedFactor = C3DParticleSystemGetSpeedFactor((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return SpeedFactor;
}

- (void)setSpeedFactor:(CGFloat)speedFactor
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setSpeedFactor:].cold.1();
  }
  else if (self->_speedFactor != speedFactor)
  {
    self->_speedFactor = speedFactor;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__SCNParticleSystem_setSpeedFactor___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = speedFactor;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("speedFactor"), v7);
  }
}

float __36__SCNParticleSystem_setSpeedFactor___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetSpeedFactor(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)spreadingAngle
{
  double SpreadingAngle;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_spreadingAngle;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetSpreadingAngle((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  SpreadingAngle = C3DParticleSystemGetSpreadingAngle((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return SpreadingAngle;
}

- (void)setSpreadingAngle:(CGFloat)spreadingAngle
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setSpreadingAngle:].cold.1();
  }
  else if (self->_spreadingAngle != spreadingAngle)
  {
    self->_spreadingAngle = spreadingAngle;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__SCNParticleSystem_setSpreadingAngle___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = spreadingAngle;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("spreadingAngle"), v7);
  }
}

float __39__SCNParticleSystem_setSpreadingAngle___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetSpreadingAngle(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)stretchFactor
{
  double StretchFactor;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_stretchFactor;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetStretchFactor((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  StretchFactor = C3DParticleSystemGetStretchFactor((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return StretchFactor;
}

- (void)setStretchFactor:(CGFloat)stretchFactor
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setStretchFactor:].cold.1();
  }
  else if (self->_stretchFactor != stretchFactor)
  {
    self->_stretchFactor = stretchFactor;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__SCNParticleSystem_setStretchFactor___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = stretchFactor;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("stretchFactor"), v7);
  }
}

float __38__SCNParticleSystem_setStretchFactor___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetStretchFactor(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (void)setSystemSpawnedOnCollision:(SCNParticleSystem *)systemSpawnedOnCollision
{
  SCNParticleSystem *v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setSystemSpawnedOnCollision:].cold.1();
  }
  else
  {
    v5 = self->_systemSpawnedOnCollision;
    if (v5 != systemSpawnedOnCollision)
    {

      self->_systemSpawnedOnCollision = systemSpawnedOnCollision;
      v6 = -[SCNParticleSystem sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __49__SCNParticleSystem_setSystemSpawnedOnCollision___block_invoke;
      v8[3] = &unk_1EA59F740;
      v8[4] = self;
      v8[5] = systemSpawnedOnCollision;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v8);
    }
  }
}

CFTypeRef __49__SCNParticleSystem_setSystemSpawnedOnCollision___block_invoke(uint64_t a1)
{
  return C3DParticleSystemSetSystemSpawnedOnCollision(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (CFTypeRef)objc_msgSend(*(id *)(a1 + 40), "__CFObject"));
}

- (void)setSystemSpawnedOnDying:(SCNParticleSystem *)systemSpawnedOnDying
{
  SCNParticleSystem *v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setSystemSpawnedOnDying:].cold.1();
  }
  else
  {
    v5 = self->_systemSpawnedOnDying;
    if (v5 != systemSpawnedOnDying)
    {

      self->_systemSpawnedOnDying = systemSpawnedOnDying;
      v6 = -[SCNParticleSystem sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __45__SCNParticleSystem_setSystemSpawnedOnDying___block_invoke;
      v8[3] = &unk_1EA59F740;
      v8[4] = self;
      v8[5] = systemSpawnedOnDying;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v8);
    }
  }
}

CFTypeRef __45__SCNParticleSystem_setSystemSpawnedOnDying___block_invoke(uint64_t a1)
{
  return C3DParticleSystemSetSystemSpawnedOnDying(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (CFTypeRef)objc_msgSend(*(id *)(a1 + 40), "__CFObject"));
}

- (void)setSystemSpawnedOnLiving:(SCNParticleSystem *)systemSpawnedOnLiving
{
  SCNParticleSystem *v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setSystemSpawnedOnLiving:].cold.1();
  }
  else
  {
    v5 = self->_systemSpawnedOnLiving;
    if (v5 != systemSpawnedOnLiving)
    {

      self->_systemSpawnedOnLiving = systemSpawnedOnLiving;
      v6 = -[SCNParticleSystem sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __46__SCNParticleSystem_setSystemSpawnedOnLiving___block_invoke;
      v8[3] = &unk_1EA59F740;
      v8[4] = self;
      v8[5] = systemSpawnedOnLiving;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v8);
    }
  }
}

CFTypeRef __46__SCNParticleSystem_setSystemSpawnedOnLiving___block_invoke(uint64_t a1)
{
  return C3DParticleSystemSetSystemSpawnedOnLiving(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (CFTypeRef)objc_msgSend(*(id *)(a1 + 40), "__CFObject"));
}

- (CGFloat)warmupDuration
{
  double WarmupDuration;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_warmupDuration;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetWarmupDuration((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  WarmupDuration = C3DParticleSystemGetWarmupDuration((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return WarmupDuration;
}

- (void)setWarmupDuration:(CGFloat)warmupDuration
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setWarmupDuration:].cold.1();
  }
  else if (self->_warmupDuration != warmupDuration)
  {
    self->_warmupDuration = warmupDuration;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__SCNParticleSystem_setWarmupDuration___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = warmupDuration;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("warmupDuration"), v7);
  }
}

float __39__SCNParticleSystem_setWarmupDuration___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetWarmupDuration(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (BOOL)writesToDepthBuffer
{
  __C3DScene *v4;
  uint64_t v5;
  char WritesToDepthBuffer;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_writesToDepthBuffer;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetWritesToDepthBuffer((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  WritesToDepthBuffer = C3DParticleSystemGetWritesToDepthBuffer((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return WritesToDepthBuffer;
}

- (void)setWritesToDepthBuffer:(BOOL)writesToDepthBuffer
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setWritesToDepthBuffer:].cold.1();
  }
  else if (self->_writesToDepthBuffer != writesToDepthBuffer)
  {
    self->_writesToDepthBuffer = writesToDepthBuffer;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__SCNParticleSystem_setWritesToDepthBuffer___block_invoke;
    v7[3] = &unk_1EA59E478;
    v7[4] = self;
    v8 = writesToDepthBuffer;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __44__SCNParticleSystem_setWritesToDepthBuffer___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetWritesToDepthBuffer(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_BYTE *)(a1 + 40));
}

- (SCNParticleSystem)systemSpawnedOnCollision
{
  return self->_systemSpawnedOnCollision;
}

- (SCNParticleSystem)systemSpawnedOnDying
{
  return self->_systemSpawnedOnDying;
}

- (SCNParticleSystem)systemSpawnedOnLiving
{
  return self->_systemSpawnedOnLiving;
}

- (CGFloat)particleIntensity
{
  double ParticleIntensity;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleIntensity;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetParticleIntensity((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleIntensity = C3DParticleSystemGetParticleIntensity((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleIntensity;
}

- (void)setParticleIntensity:(CGFloat)particleIntensity
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleIntensity:].cold.1();
  }
  else if (self->_particleIntensity != particleIntensity)
  {
    self->_particleIntensity = particleIntensity;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__SCNParticleSystem_setParticleIntensity___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = particleIntensity;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("particleIntensity"), v7);
  }
}

float __42__SCNParticleSystem_setParticleIntensity___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleIntensity(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)particleIntensityVariation
{
  double ParticleIntensityVariation;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_particleIntensityVariation;
  v4 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (!v4)
    return C3DParticleSystemGetParticleIntensityVariation((uint64_t)self->_particleSystem);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParticleIntensityVariation = C3DParticleSystemGetParticleIntensityVariation((uint64_t)self->_particleSystem);
  C3DSceneUnlock(v5);
  return ParticleIntensityVariation;
}

- (void)setParticleIntensityVariation:(CGFloat)particleIntensityVariation
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleIntensityVariation:].cold.1();
  }
  else if (self->_particleIntensityVariation != particleIntensityVariation)
  {
    self->_particleIntensityVariation = particleIntensityVariation;
    v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__SCNParticleSystem_setParticleIntensityVariation___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = particleIntensityVariation;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("particleIntensityVariation"), v7);
  }
}

float __51__SCNParticleSystem_setParticleIntensityVariation___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DParticleSystemSetParticleIntensityVariation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (void)setParticleColorVariation:(SCNVector4)particleColorVariation
{
  float w;
  float z;
  float y;
  float x;
  __C3DScene *v8;
  NSObject *v9;
  _QWORD v10[5];
  float v11;
  float v12;
  float v13;
  float v14;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setParticleColorVariation:].cold.1();
  }
  else
  {
    w = particleColorVariation.w;
    z = particleColorVariation.z;
    y = particleColorVariation.y;
    x = particleColorVariation.x;
    if (!SCNVector4EqualToVector4(particleColorVariation, self->_particleColorVariation))
    {
      self->_particleColorVariation.x = x;
      self->_particleColorVariation.y = y;
      self->_particleColorVariation.z = z;
      self->_particleColorVariation.w = w;
      v8 = -[SCNParticleSystem sceneRef](self, "sceneRef");
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __47__SCNParticleSystem_setParticleColorVariation___block_invoke;
      v10[3] = &unk_1EA5A15E8;
      v10[4] = self;
      v11 = x;
      v12 = y;
      v13 = z;
      v14 = w;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v8, self, CFSTR("particleColorVariation"), v10);
    }
  }
}

void __47__SCNParticleSystem_setParticleColorVariation___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetParticleColorVariation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(__n128 *)(a1 + 40));
}

- (void)setEmittingDirection:(SCNVector3)emittingDirection
{
  float z;
  float y;
  float x;
  __C3DScene *v7;
  NSObject *v8;
  _QWORD v9[5];
  float v10;
  float v11;
  float v12;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setEmittingDirection:].cold.1();
  }
  else
  {
    z = emittingDirection.z;
    y = emittingDirection.y;
    x = emittingDirection.x;
    if (!SCNVector3EqualToVector3(emittingDirection, self->_emittingDirection))
    {
      self->_emittingDirection.x = x;
      self->_emittingDirection.y = y;
      self->_emittingDirection.z = z;
      v7 = -[SCNParticleSystem sceneRef](self, "sceneRef");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __42__SCNParticleSystem_setEmittingDirection___block_invoke;
      v9[3] = &unk_1EA59E4C8;
      v9[4] = self;
      v10 = x;
      v11 = y;
      v12 = z;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v7, self, CFSTR("emittingDirection"), v9);
    }
  }
}

void __42__SCNParticleSystem_setEmittingDirection___block_invoke(uint64_t a1, __n128 a2)
{
  a2.n128_u64[0] = *(_QWORD *)(a1 + 40);
  a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
  C3DParticleSystemSetEmittingDirection(*(__n128 **)(*(_QWORD *)(a1 + 32) + 8), a2);
}

- (void)setAcceleration:(SCNVector3)acceleration
{
  float z;
  float y;
  float x;
  __C3DScene *v7;
  NSObject *v8;
  _QWORD v9[5];
  float v10;
  float v11;
  float v12;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNParticleSystem setAcceleration:].cold.1();
  }
  else
  {
    z = acceleration.z;
    y = acceleration.y;
    x = acceleration.x;
    if (!SCNVector3EqualToVector3(acceleration, self->_acceleration))
    {
      self->_acceleration.x = x;
      self->_acceleration.y = y;
      self->_acceleration.z = z;
      v7 = -[SCNParticleSystem sceneRef](self, "sceneRef");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __37__SCNParticleSystem_setAcceleration___block_invoke;
      v9[3] = &unk_1EA59E4C8;
      v9[4] = self;
      v10 = x;
      v11 = y;
      v12 = z;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v7, self, CFSTR("acceleration"), v9);
    }
  }
}

void __37__SCNParticleSystem_setAcceleration___block_invoke(uint64_t a1, __n128 a2)
{
  a2.n128_u64[0] = *(_QWORD *)(a1 + 40);
  a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
  C3DParticleSystemSetAcceleration(*(__n128 **)(*(_QWORD *)(a1 + 32) + 8), a2);
}

- (void)reset
{
  __C3DScene *v3;

  v3 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  if (v3)
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", MEMORY[0x1E0C809B0], 3221225472, __26__SCNParticleSystem_reset__block_invoke, &unk_1EA59E450, self, v3);
}

void __26__SCNParticleSystem_reset__block_invoke(uint64_t a1)
{
  _QWORD *ParticleManager;

  ParticleManager = C3DSceneGetParticleManager(*(_QWORD *)(a1 + 40), 0);
  if (ParticleManager)
    C3DParticleManagerResetAllInstanceOfSystem((uint64_t)ParticleManager, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)handleEvent:(SCNParticleEvent)event forProperties:(NSArray *)properties withBlock:(SCNParticleEventBlock)block
{
  __C3DScene *v9;
  _QWORD v10[8];

  v9 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__SCNParticleSystem_handleEvent_forProperties_withBlock___block_invoke;
  v10[3] = &unk_1EA5A2280;
  v10[6] = block;
  v10[7] = event;
  v10[4] = self;
  v10[5] = properties;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v9, self, v10);
}

void __57__SCNParticleSystem_handleEvent_forProperties_withBlock___block_invoke(uint64_t a1)
{
  C3DParticleSystemSetEventBlock(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 56), *(void **)(a1 + 48), (CFTypeRef)objc_msgSend(*(id *)(a1 + 40), "copy"));
}

- (void)addModifierForProperties:(NSArray *)properties atStage:(SCNParticleModifierStage)stage withBlock:(SCNParticleModifierBlock)block
{
  __C3DScene *v9;
  _QWORD v10[8];

  v9 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__SCNParticleSystem_addModifierForProperties_atStage_withBlock___block_invoke;
  v10[3] = &unk_1EA5A22A8;
  v10[6] = block;
  v10[7] = stage;
  v10[4] = properties;
  v10[5] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v9, self, v10);
}

void __64__SCNParticleSystem_addModifierForProperties_atStage_withBlock___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)C3DParticleModifierCreate();
  C3DParticleModifierSetStage((uint64_t)v2, *(_BYTE *)(a1 + 56));
  C3DParticleModifierSetBlock((uint64_t)v2, *(void **)(a1 + 48));
  C3DParticleModifierSetProperties((uint64_t)v2, (id)objc_msgSend(*(id *)(a1 + 32), "copy"));
  C3DParticleSystemAddModifier(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), v2);
  if (v2)
    CFRelease(v2);
}

- (void)removeModifiersOfStage:(SCNParticleModifierStage)stage
{
  __C3DScene *v5;
  _QWORD v6[6];

  v5 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__SCNParticleSystem_removeModifiersOfStage___block_invoke;
  v6[3] = &unk_1EA59E450;
  v6[4] = self;
  v6[5] = stage;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __44__SCNParticleSystem_removeModifiersOfStage___block_invoke(uint64_t a1)
{
  C3DParticleSystemRemoveModifier(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (void)removeAllModifiers
{
  __C3DScene *v3;
  _QWORD v4[5];

  v3 = -[SCNParticleSystem sceneRef](self, "sceneRef");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__SCNParticleSystem_removeAllModifiers__block_invoke;
  v4[3] = &unk_1EA59E4A0;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v3, self, v4);
}

void __39__SCNParticleSystem_removeAllModifiers__block_invoke(uint64_t a1)
{
  C3DParticleSystemRemoveAllModifiers(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)setReferenceName:(id)a3
{
  NSString *referenceName;

  referenceName = self->_referenceName;
  if (referenceName != a3)
  {

    self->_referenceName = (NSString *)a3;
  }
}

- (id)referenceName
{
  return self->_referenceName;
}

- (BOOL)_isAReference
{
  return -[SCNParticleSystem referenceName](self, "referenceName") != 0;
}

- (void)_customEncodingOfSCNParticleSystem:(id)a3
{
  UIColor *particleColor;
  id particleImage;

  objc_msgSend(a3, "encodeBool:forKey:", self->_loops, CFSTR("loops"));
  particleColor = self->_particleColor;
  if (particleColor)
    SCNEncodeUnsafeObjectForKey(a3, (uint64_t)particleColor, (uint64_t)CFSTR("particleColor"));
  particleImage = self->_particleImage;
  if (particleImage)
    SCNEncodeImageContents(a3, (uint64_t)CFSTR("particleImage"), particleImage);
}

- (void)_customDecodingOfSCNParticleSystem:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("loops")))
    -[SCNParticleSystem setLoops:](self, "setLoops:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("loops")));
  -[SCNParticleSystem setParticleColor:](self, "setParticleColor:", SCNDecodeUnsecureColor(a3, (uint64_t)CFSTR("particleColor")));
  v5 = SCNDecodeImageContents(a3, (uint64_t)CFSTR("particleImage"));
  if (v5)
  {
    v6 = v5;
    v7 = SCNEnclosingURLForSceneDecoder(a3);
    if (v7 && (v8 = SCNResolveImageContents(v6, v7)) != 0)
    {
      -[SCNParticleSystem _updateParticleC3DImage:](self, "_updateParticleC3DImage:", v8);

      self->_particleImage = v6;
    }
    else
    {
      -[SCNParticleSystem setParticleImage:](self, "setParticleImage:", v6);
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  SCNGeometry *emitterShape;
  SCNParticleSystem *systemSpawnedOnCollision;
  SCNParticleSystem *systemSpawnedOnDying;
  SCNParticleSystem *systemSpawnedOnLiving;
  NSArray *particleGeometries;
  NSArray *colliderNodes;
  NSDictionary *propertyControllers;

  if ((*((_BYTE *)self + 16) & 1) != 0)
    -[SCNParticleSystem _syncObjCModel](self, "_syncObjCModel");
  if (-[SCNParticleSystem _isAReference](self, "_isAReference"))
  {
    objc_msgSend(a3, "encodeObject:forKey:", -[SCNParticleSystem referenceName](self, "referenceName"), CFSTR("referenceName"));
  }
  else
  {
    -[SCNParticleSystem _customEncodingOfSCNParticleSystem:](self, "_customEncodingOfSCNParticleSystem:", a3);
    name = self->_name;
    if (name)
      objc_msgSend(a3, "encodeObject:forKey:", name, CFSTR("name"));
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("emissionDuration"), self->_emissionDuration);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("emissionDurationVariation"), self->_emissionDurationVariation);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("idleDuration"), self->_idleDuration);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("idleDurationVariation"), self->_idleDurationVariation);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("birthRate"), self->_birthRate);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("birthRateVariation"), self->_birthRateVariation);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("warmupDuration"), self->_warmupDuration);
    emitterShape = self->_emitterShape;
    if (emitterShape)
      objc_msgSend(a3, "encodeObject:forKey:", emitterShape, CFSTR("emitterShape"));
    objc_msgSend(a3, "encodeInteger:forKey:", self->_birthLocation, CFSTR("birthLocation"));
    objc_msgSend(a3, "encodeInteger:forKey:", self->_birthDirection, CFSTR("birthDirection"));
    SCNEncodeVector3(a3, (uint64_t)CFSTR("emittingDirection"), self->_emittingDirection.x, self->_emittingDirection.y, self->_emittingDirection.z);
    SCNEncodeVector3(a3, (uint64_t)CFSTR("orientationDirection"), self->_orientationDirection.x, self->_orientationDirection.y, self->_orientationDirection.z);
    SCNEncodeVector3(a3, (uint64_t)CFSTR("acceleration"), self->_acceleration.x, self->_acceleration.y, self->_acceleration.z);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("spreadingAngle"), self->_spreadingAngle);
    objc_msgSend(a3, "encodeBool:forKey:", self->_isLocal, CFSTR("isLocal"));
    objc_msgSend(a3, "encodeBool:forKey:", self->_affectedByGravity, CFSTR("affectedByGravity"));
    objc_msgSend(a3, "encodeBool:forKey:", self->_affectedByPhysicsFields, CFSTR("affectedByPhysicsFields"));
    objc_msgSend(a3, "encodeBool:forKey:", self->_physicsCollisionsEnabled, CFSTR("physicsCollisionsEnabled"));
    objc_msgSend(a3, "encodeBool:forKey:", self->_lightingEnabled, CFSTR("lightingEnabled"));
    objc_msgSend(a3, "encodeBool:forKey:", self->_softParticlesEnabled, CFSTR("softParticlesEnabled"));
    objc_msgSend(a3, "encodeBool:forKey:", self->_particleDiesOnCollision, CFSTR("particleDiesOnCollision"));
    objc_msgSend(a3, "encodeBool:forKey:", self->_blackPassEnabled, CFSTR("blackPassEnabled"));
    objc_msgSend(a3, "encodeBool:forKey:", self->_writesToDepthBuffer, CFSTR("writesToDepthBuffer"));
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("particleAngle"), self->_particleAngle);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("particleAngleVariation"), self->_particleAngleVariation);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("particleVelocity"), self->_particleVelocity);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("particleVelocityVariation"), self->_particleVelocityVariation);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("particleAngularVelocity"), self->_particleAngularVelocity);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("particleAngularVelocityVariation"), self->_particleAngularVelocityVariation);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("particleLifeSpan"), self->_particleLifeSpan);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("particleLifeSpanVariation"), self->_particleLifeSpanVariation);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("particleBounce"), self->_particleBounce);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("particleBounceVariation"), self->_particleBounceVariation);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("particleFriction"), self->_particleFriction);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("particleFrictionVariation"), self->_particleFrictionVariation);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("particleCharge"), self->_particleCharge);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("particleChargeVariation"), self->_particleChargeVariation);
    SCNEncodeVector4(a3, (uint64_t)CFSTR("particleColorVariation"), self->_particleColorVariation.x, self->_particleColorVariation.y, self->_particleColorVariation.z, self->_particleColorVariation.w);
    systemSpawnedOnCollision = self->_systemSpawnedOnCollision;
    if (systemSpawnedOnCollision)
      objc_msgSend(a3, "encodeObject:forKey:", systemSpawnedOnCollision, CFSTR("systemSpawnedOnCollision"));
    systemSpawnedOnDying = self->_systemSpawnedOnDying;
    if (systemSpawnedOnDying)
      objc_msgSend(a3, "encodeObject:forKey:", systemSpawnedOnDying, CFSTR("systemSpawnedOnDying"));
    systemSpawnedOnLiving = self->_systemSpawnedOnLiving;
    if (systemSpawnedOnLiving)
      objc_msgSend(a3, "encodeObject:forKey:", systemSpawnedOnLiving, CFSTR("systemSpawnedOnLiving"));
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("particleSize"), self->_particleSize);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("particleSizeVariation"), self->_particleSizeVariation);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("particleIntensity"), self->_particleIntensity);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("particleIntensityVariation"), self->_particleIntensityVariation);
    objc_msgSend(a3, "encodeInteger:forKey:", self->_seed, CFSTR("seed"));
    objc_msgSend(a3, "encodeInteger:forKey:", self->_blendMode, CFSTR("blendMode"));
    objc_msgSend(a3, "encodeInteger:forKey:", self->_renderingMode, CFSTR("renderingMode"));
    objc_msgSend(a3, "encodeInteger:forKey:", self->_orientationMode, CFSTR("orientationMode"));
    objc_msgSend(a3, "encodeInteger:forKey:", self->_imageSequenceAnimationMode, CFSTR("imageSequenceAnimationMode"));
    particleGeometries = self->_particleGeometries;
    if (particleGeometries)
      objc_msgSend(a3, "encodeObject:forKey:", particleGeometries, CFSTR("particleGeometries"));
    colliderNodes = self->_colliderNodes;
    if (colliderNodes)
      objc_msgSend(a3, "encodeObject:forKey:", colliderNodes, CFSTR("colliderNodes"));
    propertyControllers = self->_propertyControllers;
    if (propertyControllers)
      objc_msgSend(a3, "encodeObject:forKey:", propertyControllers, CFSTR("propertyControllers"));
    objc_msgSend(a3, "encodeInteger:forKey:", self->_sortingMode, CFSTR("sortingMode"));
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("particleMass"), self->_particleMass);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("particleMassVariation"), self->_particleMassVariation);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("dampingFactor"), self->_dampingFactor);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("speedFactor"), self->_speedFactor);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("fixedTimeStep"), self->_fixedTimeStep);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("stretchFactor"), self->_stretchFactor);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("fresnelExponent"), self->_fresnelExponent);
    objc_msgSend(a3, "encodeInteger:forKey:", self->_imageSequenceColumnCount, CFSTR("imageSequenceColumnCount"));
    objc_msgSend(a3, "encodeInteger:forKey:", self->_imageSequenceRowCount, CFSTR("imageSequenceRowCount"));
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("imageSequenceInitialFrame"), self->_imageSequenceInitialFrame);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("imageSequenceInitialFrameVariation"), self->_imageSequenceInitialFrameVariation);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("imageSequenceFrameRate"), self->_imageSequenceFrameRate);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("imageSequenceFrameRateVariation"), self->_imageSequenceFrameRateVariation);
    SCNEncodeEntity(a3, self);
    SCNEncodeAnimations(a3, self);
  }
}

- (SCNParticleSystem)initWithCoder:(id)a3
{
  SCNParticleSystem *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  objc_super v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)SCNParticleSystem;
  v4 = -[SCNParticleSystem init](&v21, sel_init);
  if (v4)
  {
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("referenceName")))
    {
      -[SCNParticleSystem setReferenceName:](v4, "setReferenceName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceName")));
      if (-[SCNParticleSystem referenceName](v4, "referenceName"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "assetCatalog"), "particleSystemNamed:", -[SCNParticleSystem referenceName](v4, "referenceName"));
          if (v5)
          {
            v6 = v5;
            objc_msgSend(v5, "setReferenceName:", -[SCNParticleSystem referenceName](v4, "referenceName"));

            return (SCNParticleSystem *)v6;
          }
        }
        else
        {
          v10 = scn_default_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            -[SCNParticleSystem initWithCoder:].cold.2(v10, v11, v12);
        }
      }
      else
      {
        v7 = scn_default_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[SCNParticleSystem initWithCoder:].cold.1(v7, v8, v9);
      }
    }
    v13 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    v14 = C3DParticleSystemCreate();
    v4->_particleSystem = (__C3DParticleSystem *)v14;
    if (v14)
      C3DEntitySetObjCWrapper(v14, v4);
    -[SCNParticleSystem _syncObjCModel](v4, "_syncObjCModel");
    -[SCNParticleSystem _customDecodingOfSCNParticleSystem:](v4, "_customDecodingOfSCNParticleSystem:", a3);
    -[SCNParticleSystem setName:](v4, "setName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name")));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("emissionDuration"));
    -[SCNParticleSystem setEmissionDuration:](v4, "setEmissionDuration:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("emissionDurationVariation"));
    -[SCNParticleSystem setEmissionDurationVariation:](v4, "setEmissionDurationVariation:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("idleDuration"));
    -[SCNParticleSystem setIdleDuration:](v4, "setIdleDuration:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("idleDurationVariation"));
    -[SCNParticleSystem setIdleDurationVariation:](v4, "setIdleDurationVariation:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("birthRate"));
    -[SCNParticleSystem setBirthRate:](v4, "setBirthRate:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("birthRateVariation"));
    -[SCNParticleSystem setBirthRateVariation:](v4, "setBirthRateVariation:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("warmupDuration"));
    -[SCNParticleSystem setWarmupDuration:](v4, "setWarmupDuration:");
    -[SCNParticleSystem setEmitterShape:](v4, "setEmitterShape:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("emitterShape")));
    -[SCNParticleSystem setBirthLocation:](v4, "setBirthLocation:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("birthLocation")));
    -[SCNParticleSystem setBirthDirection:](v4, "setBirthDirection:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("birthDirection")));
    *(float *)&v15 = SCNDecodeVector3(a3, (uint64_t)CFSTR("emittingDirection"));
    -[SCNParticleSystem setEmittingDirection:](v4, "setEmittingDirection:", v15);
    *(float *)&v16 = SCNDecodeVector3(a3, (uint64_t)CFSTR("orientationDirection"));
    -[SCNParticleSystem setOrientationDirection:](v4, "setOrientationDirection:", v16);
    *(float *)&v17 = SCNDecodeVector3(a3, (uint64_t)CFSTR("acceleration"));
    -[SCNParticleSystem setAcceleration:](v4, "setAcceleration:", v17);
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("spreadingAngle"));
    -[SCNParticleSystem setSpreadingAngle:](v4, "setSpreadingAngle:");
    -[SCNParticleSystem setIsLocal:](v4, "setIsLocal:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isLocal")));
    -[SCNParticleSystem setAffectedByGravity:](v4, "setAffectedByGravity:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("affectedByGravity")));
    -[SCNParticleSystem setAffectedByPhysicsFields:](v4, "setAffectedByPhysicsFields:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("affectedByPhysicsFields")));
    -[SCNParticleSystem setPhysicsCollisionsEnabled:](v4, "setPhysicsCollisionsEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("physicsCollisionsEnabled")));
    -[SCNParticleSystem setLightingEnabled:](v4, "setLightingEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("lightingEnabled")));
    -[SCNParticleSystem setSoftParticlesEnabled:](v4, "setSoftParticlesEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("softParticlesEnabled")));
    -[SCNParticleSystem setParticleDiesOnCollision:](v4, "setParticleDiesOnCollision:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("particleDiesOnCollision")));
    -[SCNParticleSystem setBlackPassEnabled:](v4, "setBlackPassEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("blackPassEnabled")));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("particleAngle"));
    -[SCNParticleSystem setParticleAngle:](v4, "setParticleAngle:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("particleAngleVariation"));
    -[SCNParticleSystem setParticleAngleVariation:](v4, "setParticleAngleVariation:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("particleVelocity"));
    -[SCNParticleSystem setParticleVelocity:](v4, "setParticleVelocity:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("particleVelocityVariation"));
    -[SCNParticleSystem setParticleVelocityVariation:](v4, "setParticleVelocityVariation:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("particleAngularVelocity"));
    -[SCNParticleSystem setParticleAngularVelocity:](v4, "setParticleAngularVelocity:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("particleAngularVelocityVariation"));
    -[SCNParticleSystem setParticleAngularVelocityVariation:](v4, "setParticleAngularVelocityVariation:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("particleLifeSpan"));
    -[SCNParticleSystem setParticleLifeSpan:](v4, "setParticleLifeSpan:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("particleLifeSpanVariation"));
    -[SCNParticleSystem setParticleLifeSpanVariation:](v4, "setParticleLifeSpanVariation:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("particleBounce"));
    -[SCNParticleSystem setParticleBounce:](v4, "setParticleBounce:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("particleBounceVariation"));
    -[SCNParticleSystem setParticleBounceVariation:](v4, "setParticleBounceVariation:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("particleFriction"));
    -[SCNParticleSystem setParticleFriction:](v4, "setParticleFriction:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("particleFrictionVariation"));
    -[SCNParticleSystem setParticleFrictionVariation:](v4, "setParticleFrictionVariation:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("particleCharge"));
    -[SCNParticleSystem setParticleCharge:](v4, "setParticleCharge:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("particleChargeVariation"));
    -[SCNParticleSystem setParticleChargeVariation:](v4, "setParticleChargeVariation:");
    *(float *)&v18 = SCNDecodeVector4(a3, (uint64_t)CFSTR("particleColorVariation"));
    -[SCNParticleSystem setParticleColorVariation:](v4, "setParticleColorVariation:", v18);
    -[SCNParticleSystem setSystemSpawnedOnCollision:](v4, "setSystemSpawnedOnCollision:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemSpawnedOnCollision")));
    -[SCNParticleSystem setSystemSpawnedOnDying:](v4, "setSystemSpawnedOnDying:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemSpawnedOnDying")));
    -[SCNParticleSystem setSystemSpawnedOnLiving:](v4, "setSystemSpawnedOnLiving:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemSpawnedOnLiving")));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("particleSize"));
    -[SCNParticleSystem setParticleSize:](v4, "setParticleSize:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("particleSizeVariation"));
    -[SCNParticleSystem setParticleSizeVariation:](v4, "setParticleSizeVariation:");
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("particleIntensity")))
    {
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("particleIntensity"));
      -[SCNParticleSystem setParticleIntensity:](v4, "setParticleIntensity:");
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("particleIntensityVariation"));
      -[SCNParticleSystem setParticleIntensityVariation:](v4, "setParticleIntensityVariation:");
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("writesToDepthBuffer")))
      -[SCNParticleSystem setWritesToDepthBuffer:](v4, "setWritesToDepthBuffer:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("writesToDepthBuffer")));
    -[SCNParticleSystem setSeed:](v4, "setSeed:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("seed")));
    -[SCNParticleSystem setBlendMode:](v4, "setBlendMode:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("blendMode")));
    -[SCNParticleSystem setRenderingMode:](v4, "setRenderingMode:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("renderingMode")));
    -[SCNParticleSystem setOrientationMode:](v4, "setOrientationMode:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("orientationMode")));
    -[SCNParticleSystem setImageSequenceAnimationMode:](v4, "setImageSequenceAnimationMode:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("imageSequenceAnimationMode")));
    -[SCNParticleSystem setParticleGeometries:](v4, "setParticleGeometries:", objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("particleGeometries")));
    -[SCNParticleSystem setColliderNodes:](v4, "setColliderNodes:", objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("colliderNodes")));
    v19 = (void *)MEMORY[0x1E0C99E60];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v22[2] = objc_opt_class();
    v22[3] = objc_opt_class();
    -[SCNParticleSystem setPropertyControllers:](v4, "setPropertyControllers:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v19, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4)), CFSTR("propertyControllers")));
    -[SCNParticleSystem setSortingMode:](v4, "setSortingMode:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("sortingMode")));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("particleMass"));
    -[SCNParticleSystem setParticleMass:](v4, "setParticleMass:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("particleMassVariation"));
    -[SCNParticleSystem setParticleMassVariation:](v4, "setParticleMassVariation:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("dampingFactor"));
    -[SCNParticleSystem setDampingFactor:](v4, "setDampingFactor:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("speedFactor"));
    -[SCNParticleSystem setSpeedFactor:](v4, "setSpeedFactor:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("fixedTimeStep"));
    -[SCNParticleSystem setFixedTimeStep:](v4, "setFixedTimeStep:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("stretchFactor"));
    -[SCNParticleSystem setStretchFactor:](v4, "setStretchFactor:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("fresnelExponent"));
    -[SCNParticleSystem setFresnelExponent:](v4, "setFresnelExponent:");
    -[SCNParticleSystem setImageSequenceColumnCount:](v4, "setImageSequenceColumnCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("imageSequenceColumnCount")));
    -[SCNParticleSystem setImageSequenceRowCount:](v4, "setImageSequenceRowCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("imageSequenceRowCount")));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("imageSequenceInitialFrame"));
    -[SCNParticleSystem setImageSequenceInitialFrame:](v4, "setImageSequenceInitialFrame:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("imageSequenceInitialFrameVariation"));
    -[SCNParticleSystem setImageSequenceInitialFrameVariation:](v4, "setImageSequenceInitialFrameVariation:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("imageSequenceFrameRate"));
    -[SCNParticleSystem setImageSequenceFrameRate:](v4, "setImageSequenceFrameRate:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("imageSequenceFrameRateVariation"));
    -[SCNParticleSystem setImageSequenceFrameRateVariation:](v4, "setImageSequenceFrameRateVariation:");
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    SCNDecodeEntity(a3, v4);
    SCNDecodeAnimations(a3, v4);
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v13);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleGeometries:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setColliderNodes:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setPropertyControllers:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

void __44__SCNParticleSystem_setPropertyControllers___block_invoke_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a3, (uint64_t)a3, "Error: unknown particle controller input mode", a1);
}

void __44__SCNParticleSystem_setPropertyControllers___block_invoke_cold_2(uint8_t *a1, uint64_t a2, uint64_t *a3, NSObject *a4)
{
  uint64_t v7;

  v7 = objc_opt_class();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1DCCB8000, a4, OS_LOG_TYPE_ERROR, "Error: animation class %@ is not supported for particle systems", a1, 0xCu);
}

- (void)setParticleImage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)_setParticleImagePath:withResolvedPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setOrientationDirection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setLightEmissionRadiusFactor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setAffectedByGravity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setAffectedByPhysicsFields:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setBirthDirection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setBirthLocation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setBirthRate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setBirthRateVariation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setBlackPassEnabled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setBlendMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setDampingFactor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setEmissionDuration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setEmissionDurationVariation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setEmitterShape:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setFixedTimeStep:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setFresnelExponent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setIdleDuration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setIdleDurationVariation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setImageSequenceAnimationMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setImageSequenceColumnCount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setImageSequenceFrameRate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setImageSequenceFrameRateVariation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setImageSequenceInitialFrame:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setImageSequenceInitialFrameVariation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setImageSequenceRowCount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setIsLocal:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setLightingEnabled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setLoops:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setOrientationMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleAngle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleAngleVariation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleAngularVelocity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleAngularVelocityVariation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleBounce:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleBounceVariation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleCharge:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleChargeVariation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleColor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleDiesOnCollision:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleFriction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleFrictionVariation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleLifeSpan:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleLifeSpanVariation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleMass:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleMassVariation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleSize:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleSizeVariation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleVelocity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleVelocityVariation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setPhysicsCollisionsEnabled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setRenderingMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setSeed:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setSoftParticlesEnabled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setSortingMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setSpeedFactor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setSpreadingAngle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setStretchFactor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setSystemSpawnedOnCollision:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setSystemSpawnedOnDying:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setSystemSpawnedOnLiving:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setWarmupDuration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setWritesToDepthBuffer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleIntensity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleIntensityVariation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setParticleColorVariation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setEmittingDirection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setAcceleration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_7(&dword_1DCCB8000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a1, a3, "Error: particle reference name is nil", v3);
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_3(&dword_1DCCB8000, a1, a3, "Error: referenced particle systems can't be resolved without a SCNAssetCatalog", v3);
}

@end
