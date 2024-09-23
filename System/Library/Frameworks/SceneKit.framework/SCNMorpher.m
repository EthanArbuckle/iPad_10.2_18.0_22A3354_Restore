@implementation SCNMorpher

- (SCNMorpher)init
{
  SCNMorpher *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNMorpher;
  v2 = -[SCNMorpher init](&v5, sel_init);
  if (v2)
  {
    v3 = C3DMorphCreate();
    v2->_morpher = (__C3DMorph *)v3;
    if (v3)
      C3DEntitySetObjCWrapper(v3, v2);
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    -[SCNMorpher _syncObjCModel](v2, "_syncObjCModel");
  }
  return v2;
}

- (SCNMorpher)initWithMorphRef:(__C3DMorph *)a3
{
  SCNMorpher *v4;
  __C3DMorph *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNMorpher;
  v4 = -[SCNMorpher init](&v7, sel_init);
  if (v4)
  {
    v5 = (__C3DMorph *)CFRetain(a3);
    v4->_morpher = v5;
    if (v5)
      C3DEntitySetObjCWrapper((uint64_t)v5, v4);
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    -[SCNMorpher _syncObjCModel](v4, "_syncObjCModel");
    -[SCNMorpher _syncObjCAnimations](v4, "_syncObjCAnimations");
  }
  return v4;
}

- (id)initPresentationMorpherWithMorphRef:(__C3DMorph *)a3
{
  SCNMorpher *v4;
  SCNMorpher *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNMorpher;
  v4 = -[SCNMorpher init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)v4 + 16) |= 1u;
    v4->_morpher = (__C3DMorph *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (SCNMorpher)morpherWithMorphRef:(__C3DMorph *)a3
{
  SCNMorpher *result;

  result = (SCNMorpher *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
    return (SCNMorpher *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithMorphRef:", a3);
  return result;
}

+ (id)morpher
{
  return objc_alloc_init((Class)a1);
}

- (void)clearInBetweens
{

  self->_mainTargetsAndInBetweens = 0;
  self->_inBetweenCounts = 0;
  self->_inBetweenInfluenceWeights = 0;
}

- (void)clearCorrectives
{

  self->_correctiveInBetweenInfluenceWeights = 0;
  *(_OWORD *)&self->_correctiveDriverIndices = 0u;
  *(_OWORD *)&self->_correctivesAndInBetweens = 0u;
}

- (void)dealloc
{
  __C3DMorph *morpher;
  objc_super v4;
  _QWORD v5[5];

  morpher = self->_morpher;
  if (morpher)
  {
    if ((*((_BYTE *)self + 16) & 1) == 0)
    {
      C3DEntitySetObjCWrapper((uint64_t)morpher, 0);
      morpher = self->_morpher;
    }
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __21__SCNMorpher_dealloc__block_invoke;
    v5[3] = &__block_descriptor_40_e8_v16__0d8l;
    v5[4] = morpher;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, 0, v5);
  }
  -[SCNMorpher clearInBetweens](self, "clearInBetweens");
  -[SCNMorpher clearCorrectives](self, "clearCorrectives");

  free(self->_weights);
  v4.receiver = self;
  v4.super_class = (Class)SCNMorpher;
  -[SCNMorpher dealloc](&v4, sel_dealloc);
}

void __21__SCNMorpher_dealloc__block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (void)setName:(id)a3
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNMorpher setName:].cold.1();
  }
  else if ((unint64_t)a3 | (unint64_t)self->_name)
  {
    if ((objc_msgSend(a3, "isEqual:") & 1) == 0)
    {

      self->_name = (NSString *)objc_msgSend(a3, "copy");
      v5 = -[SCNMorpher sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __22__SCNMorpher_setName___block_invoke;
      v7[3] = &unk_1EA59F740;
      v7[4] = self;
      v7[5] = a3;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
    }
  }
}

CFStringRef __22__SCNMorpher_setName___block_invoke(uint64_t a1)
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
  v4 = -[SCNMorpher sceneRef](self, "sceneRef");
  v5 = (uint64_t)v4;
  if (v4)
    C3DSceneLock((uint64_t)v4);
  Name = (void *)C3DEntityGetName((uint64_t)-[SCNMorpher __CFObject](self, "__CFObject"));
  if (v5)
    C3DSceneUnlock(v5);
  return Name;
}

- (void)setIdentifier:(id)a3
{
  C3DEntitySetID((uint64_t)-[SCNMorpher __CFObject](self, "__CFObject"), a3);
}

- (id)identifier
{
  return (id)C3DEntityGetID((uint64_t)-[SCNMorpher __CFObject](self, "__CFObject"));
}

- (void)_syncEntityObjCModel
{
  void *v3;

  v3 = -[SCNMorpher __CFObject](self, "__CFObject");

  self->_name = (NSString *)(id)C3DEntityGetName((uint64_t)v3);
}

- (__C3DMorph)morphRef
{
  return self->_morpher;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<SCNMorpher %p>"), self);
}

- (void)__CFObject
{
  return self->_morpher;
}

- (__C3DAnimationManager)animationManager
{
  __C3DAnimationManager *result;

  result = -[SCNMorpher sceneRef](self, "sceneRef");
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
    v9 = -[SCNMorpher __CFObject](self, "__CFObject");
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
    v8 = -[SCNMorpher sceneRef](self, "sceneRef");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __40__SCNMorpher_addAnimationPlayer_forKey___block_invoke;
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

void __40__SCNMorpher_addAnimationPlayer_forKey___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "prepareWithTarget:implicitDuration:", a1[5]);
  if ((SCNAddAnimation(a1[4], a1[5], a1[6]) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1[5] + 8);
    objc_msgSend(*((id *)a1[5] + 5), "removeObjectForKey:", a1[6]);
    os_unfair_lock_unlock((os_unfair_lock_t)a1[5] + 8);
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
    -[SCNMorpher addAnimationPlayer:forKey:](self, "addAnimationPlayer:forKey:", v7, v5);
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
  -[SCNMorpher addAnimation:forKey:](self, "addAnimation:forKey:", a3, 0);
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
  v4 = -[SCNMorpher sceneRef](self, "sceneRef");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__SCNMorpher_removeAllAnimations__block_invoke;
  v5[3] = &unk_1EA59E4A0;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v4, self, v5);
}

void __33__SCNMorpher_removeAllAnimations__block_invoke(uint64_t a1)
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
  v6 = -[SCNMorpher sceneRef](self, "sceneRef");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SCNMorpher_removeAllAnimationsWithBlendOutDuration___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
}

void __54__SCNMorpher_removeAllAnimationsWithBlendOutDuration___block_invoke(uint64_t a1)
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
    v6 = -[SCNMorpher sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__SCNMorpher_removeAnimationForKey___block_invoke;
    v7[3] = &unk_1EA59F740;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __36__SCNMorpher_removeAnimationForKey___block_invoke(uint64_t a1)
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
    v8 = -[SCNMorpher sceneRef](self, "sceneRef");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__SCNMorpher_removeAnimationForKey_blendOutDuration___block_invoke;
    v9[3] = &unk_1EA59E2B0;
    v9[4] = self;
    v9[5] = a3;
    *(double *)&v9[6] = a4;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, self, v9);
  }
}

void __53__SCNMorpher_removeAnimationForKey_blendOutDuration___block_invoke(uint64_t a1)
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

  v3 = -[SCNMorpher sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(SCNOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  v5 = -[SCNMorpher __CFObject](self, "__CFObject");
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

  v3 = -[SCNMorpher _scnAnimationForKey:](self, "_scnAnimationForKey:", a3);
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
        -[SCNMorpher addAnimationPlayer:forKey:](self, "addAnimationPlayer:forKey:", v11, v10);

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
  v9 = -[SCNMorpher __CFObject](self, "__CFObject");
  if (v9)
  {
    v10 = v9;
    v11 = -[SCNMorpher animationManager](self, "animationManager");
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

  v5 = -[SCNMorpher sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__SCNMorpher_pauseAnimationForKey___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __35__SCNMorpher_pauseAnimationForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pauseAnimation:forKey:pausedByNode:", 1, *(_QWORD *)(a1 + 40), 0);
}

- (void)resumeAnimationForKey:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  v5 = -[SCNMorpher sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__SCNMorpher_resumeAnimationForKey___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __36__SCNMorpher_resumeAnimationForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pauseAnimation:forKey:pausedByNode:", 0, *(_QWORD *)(a1 + 40), 0);
}

- (void)setSpeed:(double)a3 forAnimationKey:(id)a4
{
  uint64_t v7;
  __C3DScene *v8;
  _QWORD v9[7];

  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("animations.%@.speed"), a4);
  v8 = -[SCNMorpher sceneRef](self, "sceneRef");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__SCNMorpher_setSpeed_forAnimationKey___block_invoke;
  v9[3] = &unk_1EA59E2B0;
  v9[4] = self;
  v9[5] = a4;
  *(double *)&v9[6] = a3;
  +[SCNTransaction postCommandWithContext:object:keyPath:applyBlock:](SCNTransaction, "postCommandWithContext:object:keyPath:applyBlock:", v8, self, v7, v9);
}

float __39__SCNMorpher_setSpeed_forAnimationKey___block_invoke(uint64_t a1)
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

  v5 = -[SCNMorpher sceneRef](self, "sceneRef");
  v6 = (uint64_t)v5;
  if (v5)
    C3DSceneLock((uint64_t)v5);
  v7 = -[SCNMorpher __CFObject](self, "__CFObject");
  if (v7)
  {
    v8 = v7;
    v9 = -[SCNMorpher animationManager](self, "animationManager");
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

    v15 = -[SCNMorpher sceneRef](self, "sceneRef");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__SCNMorpher_bindAnimatablePath_toObject_withKeyPath_options___block_invoke;
    v16[3] = &unk_1EA59F768;
    v16[4] = self;
    v16[5] = a4;
    v16[6] = a3;
    v16[7] = a5;
    v16[8] = a6;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v15, self, v16);
  }
}

void __62__SCNMorpher_bindAnimatablePath_toObject_withKeyPath_options___block_invoke(uint64_t a1)
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
  v5 = -[SCNMorpher sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__SCNMorpher_unbindAnimatablePath___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __35__SCNMorpher_unbindAnimatablePath___block_invoke(uint64_t a1)
{
  C3DEntityRemoveBindingWithKeyPath((float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject"), *(const __CFString **)(a1 + 40));
}

- (void)removeAllBindings
{
  __C3DScene *v3;
  _QWORD v4[5];

  self->_bindings = 0;
  v3 = -[SCNMorpher sceneRef](self, "sceneRef");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__SCNMorpher_removeAllBindings__block_invoke;
  v4[3] = &unk_1EA59E4A0;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v3, self, v4);
}

void __31__SCNMorpher_removeAllBindings__block_invoke(uint64_t a1)
{
  C3DEntityRemoveAllBindings((CFTypeRef *)objc_msgSend(*(id *)(a1 + 32), "__CFObject"));
}

- (void)_syncObjCModel
{
  __C3DScene *v3;
  uint64_t v4;
  __C3DMorph *morpher;
  __CFArray *v6;
  __CFArray *v7;
  CFIndex Count;
  BOOL v9;
  CFIndex v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *OverrideMaterial;
  id v15;
  unint64_t v16;
  id v17;
  double v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  unint64_t v24;
  id v25;
  unint64_t v26;
  id v27;
  unint64_t v28;
  id v29;
  double v30;
  unint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  v3 = -[SCNMorpher sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  morpher = self->_morpher;
  if (!morpher)
    goto LABEL_32;
  self->_unifyNormal = C3DMorphGetMorphNormals((uint64_t)self->_morpher) ^ 1;
  self->_useSparseTargets = C3DMorphIsUsingSparseTargets((uint64_t)morpher);
  v6 = C3DMorphCopyMainTargets((uint64_t)morpher);
  if (v6)
  {
    v7 = v6;

    -[SCNMorpher clearInBetweens](self, "clearInBetweens");
    -[SCNMorpher clearCorrectives](self, "clearCorrectives");
    self->_mainTargets = (NSArray *)_createSCNGeometryArrayFromC3DGeometryArray(v7);
    Count = CFArrayGetCount(v7);
    v9 = Count > 0;
    if (Count >= 1)
    {
      v10 = Count;
      self->_weightCount = Count;
      v11 = 0;
      self->_weights = (float *)malloc_type_realloc(self->_weights, 4 * Count, 0x100004052888210uLL);
      do
      {
        self->_weights[v11] = C3DMorphGetWeightAtIndex((uint64_t)morpher, v11);
        ++v11;
      }
      while (v10 != v11);
    }
    CFRelease(v7);
  }
  else
  {
    v9 = 0;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v32 = 0u;
  C3DMorpherGetExtraTargetInfo((uint64_t)morpher, (uint64_t)&v32);
  v12 = DWORD1(v32);
  if (DWORD1(v32))
  {
    v13 = (v32 + DWORD1(v32));
    OverrideMaterial = (void *)C3DGeometryGetOverrideMaterial((uint64_t)morpher);
    self->_mainTargetsAndInBetweens = (NSArray *)_createSCNGeometrySubArrayFromC3DGeometryArray(OverrideMaterial, 0, v13);
    v15 = objc_alloc(MEMORY[0x1E0C99DE8]);
    self->_inBetweenCounts = (NSArray *)objc_msgSend(v15, "initWithCapacity:", v32);
    if ((_DWORD)v32)
    {
      v16 = 0;
      do
        -[NSArray addObject:](self->_inBetweenCounts, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*((_QWORD *)&v32 + 1) + 4 * v16++)));
      while (v16 < v32);
    }
    v17 = objc_alloc(MEMORY[0x1E0C99DE8]);
    self->_inBetweenInfluenceWeights = (NSArray *)objc_msgSend(v17, "initWithCapacity:", DWORD1(v32));
    v12 = DWORD1(v32);
    if (DWORD1(v32))
    {
      v19 = 0;
      do
      {
        LODWORD(v18) = *(_DWORD *)(v33 + 4 * v19);
        -[NSArray addObject:](self->_inBetweenInfluenceWeights, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18));
        ++v19;
        v12 = DWORD1(v32);
      }
      while (v19 < DWORD1(v32));
    }
  }
  if (DWORD2(v33))
  {
    v20 = (v12 + v32);
    v21 = (DWORD2(v35) + DWORD2(v33));
    v22 = (void *)C3DGeometryGetOverrideMaterial((uint64_t)morpher);
    self->_correctivesAndInBetweens = (NSArray *)_createSCNGeometrySubArrayFromC3DGeometryArray(v22, v20, v21);
    v23 = objc_alloc(MEMORY[0x1E0C99DE8]);
    self->_correctiveDriverCounts = (NSArray *)objc_msgSend(v23, "initWithCapacity:", DWORD2(v33));
    if (DWORD2(v33))
    {
      v24 = 0;
      do
        -[NSArray addObject:](self->_correctiveDriverCounts, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v34 + 4 * v24++)));
      while (v24 < DWORD2(v33));
    }
    v25 = objc_alloc(MEMORY[0x1E0C99DE8]);
    self->_correctiveDriverIndices = (NSArray *)objc_msgSend(v25, "initWithCapacity:", DWORD2(v34));
    if (DWORD2(v34))
    {
      v26 = 0;
      do
        -[NSArray addObject:](self->_correctiveDriverIndices, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v35 + 4 * v26++)));
      while (v26 < DWORD2(v34));
    }
    if (DWORD2(v35))
    {
      v27 = objc_alloc(MEMORY[0x1E0C99DE8]);
      self->_correctiveInBetweenCounts = (NSArray *)objc_msgSend(v27, "initWithCapacity:", DWORD2(v33));
      if (DWORD2(v33))
      {
        v28 = 0;
        do
          -[NSArray addObject:](self->_correctiveInBetweenCounts, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v36 + 4 * v28++)));
        while (v28 < DWORD2(v33));
      }
      v29 = objc_alloc(MEMORY[0x1E0C99DE8]);
      self->_correctiveInBetweenInfluenceWeights = (NSArray *)objc_msgSend(v29, "initWithCapacity:", DWORD2(v35));
      if (DWORD2(v35))
      {
        v31 = 0;
        do
        {
          LODWORD(v30) = *(_DWORD *)(*((_QWORD *)&v36 + 1) + 4 * v31);
          -[NSArray addObject:](self->_correctiveInBetweenInfluenceWeights, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30));
          ++v31;
        }
        while (v31 < DWORD2(v35));
      }
    }
  }
  self->_calculationMode = C3DMorphGetCalculationMode((uint64_t)morpher) == 1;
  if (!v9)
  {
LABEL_32:
    free(self->_weights);
    self->_weightCount = 0;
  }
  -[SCNMorpher _syncEntityObjCModel](self, "_syncEntityObjCModel");
  if (v4)
    C3DSceneUnlock(v4);
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (id)presentationMorpher
{
  if ((*((_BYTE *)self + 16) & 1) == 0)
    return -[SCNMorpher initPresentationMorpherWithMorphRef:]([SCNMorpher alloc], "initPresentationMorpherWithMorphRef:", *((_QWORD *)self + 1));
  return self;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (void)setTargets:(NSArray *)targets
{
  __C3DScene *v5;
  _QWORD v6[6];

  -[SCNMorpher clearInBetweens](self, "clearInBetweens");
  -[SCNMorpher clearCorrectives](self, "clearCorrectives");

  self->_mainTargets = (NSArray *)-[NSArray copy](targets, "copy");
  self->_mainTargetNamesToIndexes = 0;
  v5 = -[SCNMorpher sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __25__SCNMorpher_setTargets___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = targets;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __25__SCNMorpher_setTargets___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFArray *C3DGeometryArrayFromSCNGeometryArray;

  v2 = objc_msgSend(*(id *)(a1 + 32), "morphRef");
  if (v2)
  {
    v3 = v2;
    C3DGeometryArrayFromSCNGeometryArray = (const __CFArray *)_createC3DGeometryArrayFromSCNGeometryArray(*(void **)(a1 + 40));
    C3DMorphSetTargets(v3, C3DGeometryArrayFromSCNGeometryArray, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 161));

  }
}

- (NSArray)targets
{
  NSArray *result;
  __C3DScene *v4;
  uint64_t v5;
  __C3DMorph *morpher;
  __CFArray *v7;
  __CFArray *v8;
  void *SCNGeometryArrayFromC3DGeometryArray;

  if ((*((_BYTE *)self + 16) & 1) == 0)
  {
    if (-[NSArray count](self->_mainTargets, "count"))
      return self->_mainTargets;
    else
      return (NSArray *)MEMORY[0x1E0C9AA60];
  }
  v4 = -[SCNMorpher sceneRef](self, "sceneRef");
  v5 = (uint64_t)v4;
  if (v4)
    C3DSceneLock((uint64_t)v4);
  morpher = self->_morpher;
  if (!morpher || (v7 = C3DMorphCopyMainTargets((uint64_t)morpher)) == 0)
  {
    SCNGeometryArrayFromC3DGeometryArray = 0;
    if (!v5)
      goto LABEL_12;
    goto LABEL_11;
  }
  v8 = v7;
  SCNGeometryArrayFromC3DGeometryArray = _createSCNGeometryArrayFromC3DGeometryArray(v7);
  CFRelease(v8);
  if (v5)
LABEL_11:
    C3DSceneUnlock(v5);
LABEL_12:
  result = SCNGeometryArrayFromC3DGeometryArray;
  if (!result)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  return result;
}

- (NSArray)weights
{
  NSUInteger v3;
  NSArray *v4;
  double v5;
  unint64_t v6;
  unint64_t j;
  BOOL v8;
  NSUInteger v9;
  __C3DScene *v10;
  uint64_t v11;
  __C3DMorph *morpher;
  uint64_t WeightCount;
  NSArray *v14;
  uint64_t i;
  double v16;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v10 = -[SCNMorpher sceneRef](self, "sceneRef");
    v11 = (uint64_t)v10;
    if (v10)
      C3DSceneLock((uint64_t)v10);
    morpher = self->_morpher;
    if (morpher)
    {
      WeightCount = C3DMorphGetWeightCount((uint64_t)self->_morpher);
      v14 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", WeightCount);
      if (WeightCount >= 1)
      {
        for (i = 0; i != WeightCount; ++i)
        {
          *(float *)&v16 = C3DMorphGetWeightAtIndex((uint64_t)morpher, i);
          -[NSArray addObject:](v14, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16));
        }
      }
      if (!v11)
        goto LABEL_17;
    }
    else
    {
      v14 = 0;
      if (!v11)
      {
LABEL_17:
        if (v14)
          return v14;
        else
          return (NSArray *)MEMORY[0x1E0C9AA60];
      }
    }
    C3DSceneUnlock(v11);
    goto LABEL_17;
  }
  v3 = -[NSArray count](self->_mainTargets, "count");
  v4 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->_weightCount);
  v6 = self->_weightCount;
  if (v6)
  {
    for (j = 0; j < v6; ++j)
    {
      *(float *)&v5 = self->_weights[j];
      -[NSArray addObject:](v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5));
      v6 = self->_weightCount;
    }
  }
  v8 = v3 > v6;
  v9 = v3 - v6;
  if (v8)
  {
    do
    {
      -[NSArray addObject:](v4, "addObject:", &unk_1EA5FF830);
      --v9;
    }
    while (v9);
  }
  return v4;
}

- (void)setWeights:(NSArray *)weights
{
  unint64_t v5;
  float *v6;
  unint64_t v7;
  unint64_t weightCount;
  float v9;
  __C3DScene *v10;
  _QWORD v11[6];

  v5 = -[NSArray count](weights, "count");
  self->_weightCount = v5;
  v6 = self->_weights;
  if (v5)
  {
    self->_weights = (float *)malloc_type_realloc(v6, 4 * v5, 0x100004052888210uLL);
    if (self->_weightCount)
    {
      v7 = 0;
      do
      {
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](weights, "objectAtIndexedSubscript:", v7), "floatValue");
        weightCount = self->_weightCount;
        self->_weights[v7++] = v9;
      }
      while (v7 < weightCount);
    }
  }
  else
  {
    free(v6);
    self->_weights = 0;
  }
  v10 = -[SCNMorpher sceneRef](self, "sceneRef");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __25__SCNMorpher_setWeights___block_invoke;
  v11[3] = &unk_1EA59F740;
  v11[4] = self;
  v11[5] = weights;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v10, self, v11);
}

void __25__SCNMorpher_setWeights___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  float v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "morphRef");
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(*(id *)(a1 + 40), "count");
    if (v4 >= 1)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i), "floatValue");
        C3DMorphSetWeightAtIndex(v3, i, v7);
      }
    }
  }
}

- (int64_t)_weightIndexForTargetNamed:(id)a3
{
  NSDictionary *mainTargetNamesToIndexes;
  NSArray *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  mainTargetNamesToIndexes = self->_mainTargetNamesToIndexes;
  if (!mainTargetNamesToIndexes)
  {
    v15 = a3;
    v5 = -[SCNMorpher targets](self, "targets");
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSArray count](v5, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v12, "name"))
            objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9++), objc_msgSend(v12, "name"));
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }
    mainTargetNamesToIndexes = (NSDictionary *)objc_msgSend(v6, "copy");
    self->_mainTargetNamesToIndexes = mainTargetNamesToIndexes;
    a3 = v15;
  }
  v13 = -[NSDictionary objectForKeyedSubscript:](mainTargetNamesToIndexes, "objectForKeyedSubscript:", a3);
  if (v13)
    return objc_msgSend(v13, "integerValue");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setWeight:(CGFloat)weight forTargetNamed:(NSString *)targetName
{
  int64_t v6;

  v6 = -[SCNMorpher _weightIndexForTargetNamed:](self, "_weightIndexForTargetNamed:", targetName);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    -[SCNMorpher setWeight:forTargetAtIndex:](self, "setWeight:forTargetAtIndex:", v6, weight);
}

- (CGFloat)weightForTargetNamed:(NSString *)targetName
{
  int64_t v4;
  CGFloat result;

  v4 = -[SCNMorpher _weightIndexForTargetNamed:](self, "_weightIndexForTargetNamed:", targetName);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0.0;
  -[SCNMorpher weightForTargetAtIndex:](self, "weightForTargetAtIndex:", v4);
  return result;
}

+ (id)weightIndexStringForIndex:(int64_t)a3
{
  if (weightIndexStringForIndex__onceToken != -1)
    dispatch_once(&weightIndexStringForIndex__onceToken, &__block_literal_global_108);
  if (a3 > 127)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("weights[%d]"), a3);
  else
    return (id)weightIndexStringForIndex__s_strings[a3];
}

uint64_t __40__SCNMorpher_weightIndexStringForIndex___block_invoke()
{
  uint64_t i;
  uint64_t result;

  for (i = 0; i != 128; ++i)
  {
    result = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("weights[%d]"), i);
    weightIndexStringForIndex__s_strings[i] = result;
  }
  return result;
}

- (void)setWeight:(CGFloat)weight forTargetAtIndex:(NSUInteger)targetIndex
{
  NSUInteger v7;
  float *v8;
  float *weights;
  float v10;
  id v11;
  __C3DScene *v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  _QWORD v16[7];
  uint8_t buf[4];
  SCNMorpher *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v13 = scn_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SCNMorpher setWeight:forTargetAtIndex:].cold.1();
  }
  else
  {
    v7 = -[NSArray count](self->_mainTargets, "count");
    if (v7 <= targetIndex)
    {
      v14 = v7;
      v15 = scn_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v18 = self;
        v19 = 1024;
        v20 = targetIndex;
        v21 = 1024;
        v22 = v14;
        _os_log_error_impl(&dword_1DCCB8000, v15, OS_LOG_TYPE_ERROR, "Error: %@ setWeight:forTargetAtIndex:%d - index out of bounds (%d)", buf, 0x18u);
      }
    }
    else
    {
      if (self->_weightCount <= targetIndex)
      {
        v8 = (float *)malloc_type_realloc(self->_weights, 4 * (targetIndex + 1), 0x100004052888210uLL);
        self->_weights = v8;
        bzero(&v8[self->_weightCount], 4 * (targetIndex + 1 - self->_weightCount));
        self->_weightCount = targetIndex + 1;
      }
      weights = self->_weights;
      if (weights[targetIndex] != weight)
      {
        v10 = weight;
        weights[targetIndex] = v10;
        v11 = +[SCNMorpher weightIndexStringForIndex:](SCNMorpher, "weightIndexStringForIndex:", targetIndex);
        v12 = -[SCNMorpher sceneRef](self, "sceneRef");
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __41__SCNMorpher_setWeight_forTargetAtIndex___block_invoke;
        v16[3] = &unk_1EA5A15E8;
        v16[4] = self;
        v16[5] = targetIndex;
        *(CGFloat *)&v16[6] = weight;
        +[SCNTransaction postCommandWithContext:object:key:subscriptIndex:derivedKeyPath:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:subscriptIndex:derivedKeyPath:applyBlock:", v12, self, CFSTR("weights"), targetIndex, v11, v16);
      }
    }
  }
}

float __41__SCNMorpher_setWeight_forTargetAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float result;
  float v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "morphRef");
  if (v2)
  {
    v4 = *(double *)(a1 + 48);
    C3DMorphSetWeightAtIndex(v2, *(_QWORD *)(a1 + 40), v4);
  }
  return result;
}

- (CGFloat)weightForTargetAtIndex:(NSUInteger)targetIndex
{
  double WeightAtIndex;
  __C3DScene *v6;
  uint64_t v7;
  __C3DMorph *morpher;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = -[SCNMorpher sceneRef](self, "sceneRef");
    v7 = (uint64_t)v6;
    if (v6)
      C3DSceneLock((uint64_t)v6);
    morpher = self->_morpher;
    if (morpher)
    {
      WeightAtIndex = C3DMorphGetWeightAtIndex((uint64_t)morpher, targetIndex);
      if (!v7)
        return WeightAtIndex;
    }
    else
    {
      WeightAtIndex = 0.0;
      if (!v7)
        return WeightAtIndex;
    }
    C3DSceneUnlock(v7);
    return WeightAtIndex;
  }
  WeightAtIndex = 0.0;
  if (self->_weightCount > targetIndex)
    return self->_weights[targetIndex];
  return WeightAtIndex;
}

- (double)_presentationWeightForTargetAtIndex:(unint64_t)a3 token:(const void *)a4
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __C3DMorph *morpher;

  if (*(__C3DScene **)a4 != -[SCNMorpher sceneRef](self, "sceneRef"))
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[SCNMorpher _presentationWeightForTargetAtIndex:token:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  morpher = self->_morpher;
  if (morpher)
    return C3DMorphGetWeightAtIndex((uint64_t)morpher, a3);
  else
    return 0.0;
}

- (id)targetsAndInBetween
{
  id result;

  result = self->_mainTargetsAndInBetweens;
  if (!result)
    return self->_mainTargets;
  return result;
}

- (id)correctives
{
  void *v3;
  NSArray *correctiveInBetweenCounts;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](self->_correctivesAndInBetweens, "count"))
    return 0;
  if (!-[NSArray count](self->_correctiveInBetweenCounts, "count"))
    return self->_correctivesAndInBetweens;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_correctiveDriverCounts, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  correctiveInBetweenCounts = self->_correctiveInBetweenCounts;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](correctiveInBetweenCounts, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(correctiveInBetweenCounts);
        v7 += objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "unsignedIntegerValue");
        objc_msgSend(v3, "addObject:", -[NSArray objectAtIndexedSubscript:](self->_correctivesAndInBetweens, "objectAtIndexedSubscript:", v7 - 1));
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](correctiveInBetweenCounts, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)correctivesAndInBetween
{
  return self->_correctivesAndInBetweens;
}

- (void)_updateTargetsAndInBetween:(id)a3
{
  NSArray *mainTargetsAndInBetweens;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  mainTargetsAndInBetweens = self->_mainTargetsAndInBetweens;
  if (!mainTargetsAndInBetweens)
    mainTargetsAndInBetweens = self->_mainTargets;
  v6 = -[NSArray count](mainTargetsAndInBetweens, "count");
  if (v6 != objc_msgSend(a3, "count"))
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[SCNMorpher _updateTargetsAndInBetween:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  -[SCNMorpher setTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:correctives:driverCounts:driverIndices:inBetweenCounts:inBetweenWeights:](self, "setTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:correctives:driverCounts:driverIndices:inBetweenCounts:inBetweenWeights:", a3, self->_inBetweenCounts, self->_inBetweenInfluenceWeights, self->_correctivesAndInBetweens, self->_correctiveDriverCounts, self->_correctiveDriverIndices, self->_correctiveInBetweenCounts, self->_correctiveInBetweenInfluenceWeights);
}

- (void)_updateCorrectivesAndInBetween:(id)a3
{
  NSUInteger v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *mainTargetsAndInBetweens;

  v5 = -[NSArray count](self->_correctivesAndInBetweens, "count");
  if (v5 != objc_msgSend(a3, "count"))
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[SCNMorpher _updateCorrectivesAndInBetween:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  mainTargetsAndInBetweens = self->_mainTargetsAndInBetweens;
  if (!mainTargetsAndInBetweens)
    mainTargetsAndInBetweens = self->_mainTargets;
  -[SCNMorpher setTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:correctives:driverCounts:driverIndices:inBetweenCounts:inBetweenWeights:](self, "setTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:correctives:driverCounts:driverIndices:inBetweenCounts:inBetweenWeights:", mainTargetsAndInBetweens, self->_inBetweenCounts, self->_inBetweenInfluenceWeights, a3, self->_correctiveDriverCounts, self->_correctiveDriverIndices, self->_correctiveInBetweenCounts, self->_correctiveInBetweenInfluenceWeights);
}

- (id)inBetweenCounts
{
  return self->_inBetweenCounts;
}

- (id)inBetweenWeights
{
  return self->_inBetweenInfluenceWeights;
}

- (id)inBetweenTargetsForTargetAtIndex:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!-[NSArray count](self->_inBetweenCounts, "count"))
    return 0;
  v5 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_inBetweenCounts, "objectAtIndexedSubscript:", a3), "unsignedIntegerValue");
  v6 = v5 - 1;
  if (v5 == 1)
    return 0;
  if (a3)
  {
    v7 = 0;
    v8 = 0;
    do
      v8 += objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_inBetweenCounts, "objectAtIndexedSubscript:", v7++), "unsignedIntegerValue");
    while (a3 != v7);
  }
  else
  {
    v8 = 0;
  }
  return -[NSArray subarrayWithRange:](self->_mainTargetsAndInBetweens, "subarrayWithRange:", v8, v6);
}

- (id)inBetweenWeightsForTargetAtIndex:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!-[NSArray count](self->_inBetweenCounts, "count"))
    return 0;
  v5 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_inBetweenCounts, "objectAtIndexedSubscript:", a3), "unsignedIntegerValue");
  v6 = v5 - 1;
  if (v5 == 1)
    return 0;
  if (a3)
  {
    v7 = 0;
    v8 = 0;
    do
      v8 = v8
         + objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_inBetweenCounts, "objectAtIndexedSubscript:", v7++), "unsignedIntegerValue")- 1;
    while (a3 != v7);
  }
  else
  {
    v8 = 0;
  }
  return -[NSArray subarrayWithRange:](self->_inBetweenInfluenceWeights, "subarrayWithRange:", v8, v6);
}

- (id)correctiveDriverCounts
{
  return self->_correctiveDriverCounts;
}

- (id)correctiveDriverIndices
{
  return self->_correctiveDriverIndices;
}

- (unint64_t)correctiveDriverCountForCorrectiveAtIndex:(unint64_t)a3
{
  if (-[NSArray count](self->_correctiveDriverCounts, "count"))
    return objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_correctiveDriverCounts, "objectAtIndexedSubscript:", a3), "unsignedIntegerValue");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)correctiveDriverIndicesForCorrectiveAtIndex:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (!-[NSArray count](self->_correctiveDriverCounts, "count"))
    return 0;
  v5 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_correctiveDriverCounts, "objectAtIndexedSubscript:", a3), "unsignedIntegerValue");
  if (!-[NSArray count](self->_correctiveDriverIndices, "count"))
    return 0;
  if (a3)
  {
    v6 = 0;
    v7 = 0;
    do
      v7 += objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_correctiveDriverCounts, "objectAtIndexedSubscript:", v6++), "unsignedIntegerValue");
    while (a3 != v6);
  }
  else
  {
    v7 = 0;
  }
  return -[NSArray subarrayWithRange:](self->_correctiveDriverIndices, "subarrayWithRange:", v7, v5);
}

- (id)correctiveInBetweenCounts
{
  return self->_correctiveInBetweenCounts;
}

- (id)correctiveInBetweenWeights
{
  return self->_correctiveInBetweenInfluenceWeights;
}

- (id)inBetweenTargetsForCorrectiveAtIndex:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!-[NSArray count](self->_correctiveInBetweenCounts, "count"))
    return 0;
  v5 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_correctiveInBetweenCounts, "objectAtIndexedSubscript:", a3), "unsignedIntegerValue");
  v6 = v5 - 1;
  if (v5 == 1)
    return 0;
  if (a3)
  {
    v7 = 0;
    v8 = 0;
    do
      v8 += objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_correctiveInBetweenCounts, "objectAtIndexedSubscript:", v7++), "unsignedIntegerValue");
    while (a3 != v7);
  }
  else
  {
    v8 = 0;
  }
  return -[NSArray subarrayWithRange:](self->_correctivesAndInBetweens, "subarrayWithRange:", v8, v6);
}

- (id)inBetweenWeightsForCorrectiveAtIndex:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!-[NSArray count](self->_correctiveInBetweenCounts, "count"))
    return 0;
  v5 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_correctiveInBetweenCounts, "objectAtIndexedSubscript:", a3), "unsignedIntegerValue");
  v6 = v5 - 1;
  if (v5 == 1)
    return 0;
  if (a3)
  {
    v7 = 0;
    v8 = 0;
    do
      v8 = v8
         + objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_correctiveInBetweenCounts, "objectAtIndexedSubscript:", v7++), "unsignedIntegerValue")- 1;
    while (a3 != v7);
  }
  else
  {
    v8 = 0;
  }
  return -[NSArray subarrayWithRange:](self->_correctiveInBetweenInfluenceWeights, "subarrayWithRange:", v8, v6);
}

- (void)setTargets:(id)a3 withInBetweenTargetCounts:(id)a4 inBetweenWeights:(id)a5
{
  -[SCNMorpher setTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:correctives:driverCounts:driverIndices:inBetweenCounts:inBetweenWeights:](self, "setTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:correctives:driverCounts:driverIndices:inBetweenCounts:inBetweenWeights:", a3, a4, a5, 0, 0, 0, 0, 0);
}

- (void)setTargetsAndInBetweens:(id)a3 inBetweenCounts:(id)a4 inBetweenWeights:(id)a5 correctives:(id)a6 driverCounts:(id)a7 driverIndices:(id)a8 inBetweenCounts:(id)a9 inBetweenWeights:(id)a10
{
  id v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  id v21;
  NSArray *v22;
  NSArray *v23;
  uint64_t v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  NSObject *v30;
  NSArray *mainTargetsAndInBetweens;
  BOOL v32;
  NSObject *v33;
  NSArray *mainTargets;
  NSArray *inBetweenInfluenceWeights;
  NSArray *v36;
  NSArray *inBetweenCounts;
  NSArray *v38;
  NSArray *correctivesAndInBetweens;
  NSArray *v40;
  NSArray *correctiveDriverCounts;
  NSArray *correctiveDriverIndices;
  NSArray *correctiveInBetweenCounts;
  id v44;
  NSArray *correctiveInBetweenInfluenceWeights;
  id v46;
  void *C3DGeometryArrayFromSCNGeometryArray;
  __C3DScene *v48;
  BOOL v49;
  id v50;
  id v51;
  SCNMorpher *v52;
  char v53;
  uint64_t v54;
  BOOL v55;
  _QWORD v56[13];
  char v57;
  BOOL v58;
  BOOL v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  NSArray *v64;
  NSArray *v65;
  NSArray *v66;
  NSArray *v67;
  uint8_t buf[4];
  uint64_t v69;
  _BYTE v70[128];
  uint64_t v71;

  v17 = a9;
  v71 = *MEMORY[0x1E0C80C00];
  v67 = (NSArray *)a3;
  v65 = (NSArray *)a5;
  v66 = (NSArray *)a4;
  v64 = (NSArray *)a6;
  v18 = objc_msgSend(a4, "count");
  v19 = objc_msgSend(a6, "count");
  if (v19)
  {
    v54 = v19;
    v55 = v19 != 0;
    v20 = objc_msgSend(v17, "count") != 0;
    if (!v18)
      goto LABEL_23;
  }
  else
  {
    if (!v18)
    {
      -[SCNMorpher setTargets:](self, "setTargets:", a3);
      return;
    }
    v54 = 0;
    v55 = v19 != 0;
    v20 = 0;
  }
  if (-[SCNMorpher _validateTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:]((_BOOL8)self, a3, a4, a5))
  {
    v50 = a7;
    v51 = a8;
    -[SCNMorpher _sortTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:](self, &v67, (void **)&v66, (void **)&v65);
    v49 = v20;
    if (v20)
      -[SCNMorpher _sortTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:](self, &v64, &a9, &a10);
    v52 = self;
    v21 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v22 = v66;
    v23 = (NSArray *)objc_msgSend(v21, "initWithCapacity:", -[NSArray count](v66, "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    v25 = v67;
    if (v24)
    {
      v26 = v24;
      v27 = 0;
      v28 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v61 != v28)
            objc_enumerationMutation(v22);
          v27 += objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "unsignedIntegerValue");
          if (v27 - 1 >= -[NSArray count](v25, "count"))
          {
            v30 = scn_default_log();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
              -[SCNMorpher setTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:correctives:driverCounts:driverIndices:inBetweenCounts:inBetweenWeights:].cold.1(buf, &v69, v30);
          }
          -[NSArray addObject:](v23, "addObject:", -[NSArray objectAtIndexedSubscript:](v25, "objectAtIndexedSubscript:", v27 - 1));
        }
        v26 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
      }
      while (v26);
    }
    self = v52;

    v52->_mainTargets = v23;
    mainTargetsAndInBetweens = v52->_mainTargetsAndInBetweens;
    if (mainTargetsAndInBetweens != v25)
    {

      v52->_mainTargetsAndInBetweens = (NSArray *)-[NSArray copy](v25, "copy");
    }
    v53 = 1;
    a7 = v50;
    a8 = v51;
    v32 = v49;
    goto LABEL_28;
  }
  v33 = scn_default_log();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1DCCB8000, v33, OS_LOG_TYPE_ERROR, "Error: invalid in-between buffer, ignoring in-betweens", buf, 2u);
    v32 = v20;
    if (!v20)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_23:
  v32 = v20;
  if (v20)
LABEL_24:
    -[SCNMorpher _sortTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:](self, &v64, &a9, &a10);
LABEL_25:
  mainTargets = self->_mainTargets;
  v25 = v67;
  if (mainTargets != v67)
  {

    self->_mainTargets = (NSArray *)-[NSArray copy](v25, "copy");
  }

  v53 = 0;
  self->_mainTargetsAndInBetweens = 0;
LABEL_28:

  self->_mainTargetNamesToIndexes = 0;
  free(self->_weights);
  self->_weightCount = 0;
  self->_weights = 0;
  inBetweenInfluenceWeights = self->_inBetweenInfluenceWeights;
  v36 = v65;
  if (inBetweenInfluenceWeights != v65)
  {

    self->_inBetweenInfluenceWeights = (NSArray *)-[NSArray copy](v36, "copy");
  }
  inBetweenCounts = self->_inBetweenCounts;
  v38 = v66;
  if (inBetweenCounts != v66)
  {

    self->_inBetweenCounts = (NSArray *)-[NSArray copy](v38, "copy");
  }
  correctivesAndInBetweens = self->_correctivesAndInBetweens;
  v40 = v64;
  if (correctivesAndInBetweens != v64)
  {

    self->_correctivesAndInBetweens = (NSArray *)-[NSArray copy](v40, "copy");
  }
  correctiveDriverCounts = self->_correctiveDriverCounts;
  if (correctiveDriverCounts != a7)
  {

    self->_correctiveDriverCounts = (NSArray *)objc_msgSend(a7, "copy");
  }
  correctiveDriverIndices = self->_correctiveDriverIndices;
  if (correctiveDriverIndices != a8)
  {

    self->_correctiveDriverIndices = (NSArray *)objc_msgSend(a8, "copy");
  }
  correctiveInBetweenCounts = self->_correctiveInBetweenCounts;
  v44 = a9;
  if (correctiveInBetweenCounts != a9)
  {

    self->_correctiveInBetweenCounts = (NSArray *)objc_msgSend(v44, "copy");
  }
  correctiveInBetweenInfluenceWeights = self->_correctiveInBetweenInfluenceWeights;
  v46 = a10;
  if (correctiveInBetweenInfluenceWeights != a10)
  {

    self->_correctiveInBetweenInfluenceWeights = (NSArray *)objc_msgSend(v46, "copy");
  }
  if (v54)
    v25 = -[NSArray arrayByAddingObjectsFromArray:](v25, "arrayByAddingObjectsFromArray:", v40);
  C3DGeometryArrayFromSCNGeometryArray = _createC3DGeometryArrayFromSCNGeometryArray(v25);
  v48 = -[SCNMorpher sceneRef](self, "sceneRef");
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __143__SCNMorpher_setTargetsAndInBetweens_inBetweenCounts_inBetweenWeights_correctives_driverCounts_driverIndices_inBetweenCounts_inBetweenWeights___block_invoke;
  v56[3] = &unk_1EA5A37C0;
  v57 = v53;
  v56[4] = v38;
  v56[5] = v36;
  v58 = v55;
  v56[6] = v67;
  v56[7] = a7;
  v59 = v32;
  v56[8] = a8;
  v56[9] = v44;
  v56[10] = v46;
  v56[11] = self;
  v56[12] = C3DGeometryArrayFromSCNGeometryArray;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v48, self, v56);

}

- (BOOL)_validateTargetsAndInBetweens:(void *)a3 inBetweenCounts:(void *)a4 inBetweenWeights:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[4];
  int v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = 0;
      v10 = *(_QWORD *)v18;
      v15 = &v22;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(a3);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "unsignedIntegerValue", v15);
          v8 += v12;
          if (v8 - 1 >= (unint64_t)objc_msgSend(a2, "count"))
          {
            v13 = scn_default_log();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
              -[SCNMorpher setTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:correctives:driverCounts:driverIndices:inBetweenCounts:inBetweenWeights:].cold.1(v21, v15, v13);
          }
          if (v8 - 1 >= (unint64_t)objc_msgSend(a2, "count"))
            return 0;
          v9 = v9 + v12 - 1;
        }
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        if (v7)
          continue;
        break;
      }
    }
    else
    {
      v9 = 0;
    }
    if (objc_msgSend(a4, "count") != v9)
    {
      v14 = scn_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[SCNMorpher _validateTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:].cold.1(a4);
    }
    return objc_msgSend(a4, "count") == v9;
  }
  return result;
}

- (id)_sortTargetsAndInBetweens:(void *)a3 inBetweenCounts:(void *)a4 inBetweenWeights:
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  float v17;
  uint64_t v18;
  unint64_t v19;
  float v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t i;
  uint64_t v39;
  id v40;
  _QWORD *v41;
  void **v42;
  void **v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id obj;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[6];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7 = (void *)*a2;
    v8 = *a3;
    v9 = *a4;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = v8;
    v49 = v7;
    result = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
    if (result)
    {
      v10 = result;
      v41 = a2;
      v42 = a3;
      v43 = a4;
      v11 = 0;
      v12 = *(_QWORD *)v60;
      v13 = 1;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v60 != v12)
            objc_enumerationMutation(obj);
          v15 = objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)v14), "unsignedIntegerValue");
          if (v15 >= 2)
          {
            v16 = v15 - 1;
            v17 = 0.0;
            v18 = v11;
            v19 = v15 - 1;
            while (1)
            {
              objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v18), "floatValue");
              if (v17 > v20)
                break;
              ++v18;
              v17 = v20;
              if (!--v19)
                goto LABEL_13;
            }
            v13 = 0;
LABEL_13:
            v11 += v16;
          }
          v14 = (char *)v14 + 1;
        }
        while (v14 != v10);
        result = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
        v10 = result;
      }
      while (result);
      if ((v13 & 1) == 0)
      {
        v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v49, "count"));
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
        if (v24)
        {
          v25 = v24;
          v26 = 0;
          v27 = 0;
          v47 = *(_QWORD *)v56;
          v28 = 0x1E0CB3000uLL;
          do
          {
            v29 = 0;
            v44 = v25;
            do
            {
              if (*(_QWORD *)v56 != v47)
                objc_enumerationMutation(obj);
              v30 = objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * v29), "unsignedIntegerValue");
              v31 = v27;
              if (v30 >= 2)
              {
                v46 = v29;
                objc_msgSend(v21, "removeAllObjects", v27);
                v32 = 0;
                v45 = v30;
                v33 = v30 - 1;
                do
                  objc_msgSend(v21, "addObject:", objc_msgSend(*(id *)(v28 + 2024), "numberWithUnsignedInteger:", v32++));
                while (v33 != v32);
                v54[0] = MEMORY[0x1E0C809B0];
                v54[1] = 3221225472;
                v54[2] = __73__SCNMorpher__sortTargetsAndInBetweens_inBetweenCounts_inBetweenWeights___block_invoke;
                v54[3] = &unk_1EA5A37E8;
                v54[4] = v9;
                v54[5] = v26;
                objc_msgSend(v21, "sortUsingComparator:", v54);
                v52 = 0u;
                v53 = 0u;
                v50 = 0u;
                v51 = 0u;
                v34 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
                if (v34)
                {
                  v35 = v34;
                  v36 = *(_QWORD *)v51;
                  do
                  {
                    v37 = v21;
                    for (i = 0; i != v35; ++i)
                    {
                      if (*(_QWORD *)v51 != v36)
                        objc_enumerationMutation(v37);
                      v39 = objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "unsignedIntegerValue");
                      objc_msgSend(v22, "addObject:", objc_msgSend(v49, "objectAtIndexedSubscript:", v39 + v27));
                      objc_msgSend(v23, "addObject:", objc_msgSend(v9, "objectAtIndexedSubscript:", v39 + v26));
                    }
                    v21 = v37;
                    v35 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
                  }
                  while (v35);
                }
                v25 = v44;
                v30 = v45;
                v31 = v27 + v45 - 1;
                v28 = 0x1E0CB3000;
                v29 = v46;
              }
              objc_msgSend(v22, "addObject:", objc_msgSend(v49, "objectAtIndexedSubscript:", v31));
              v27 += v30;
              v26 = v26 + v30 - 1;
              ++v29;
            }
            while (v29 != v25);
            v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
          }
          while (v25);
        }

        v40 = v22;
        result = v23;
        *v41 = v40;
        *v42 = obj;
        *v43 = result;
      }
    }
  }
  return result;
}

void __143__SCNMorpher_setTargetsAndInBetweens_inBetweenCounts_inBetweenWeights_correctives_driverCounts_driverIndices_inBetweenCounts_inBetweenWeights___block_invoke(uint64_t a1)
{
  unsigned int v2;
  _DWORD *v3;
  uint64_t i;
  unsigned int v5;
  _DWORD *v6;
  uint64_t j;
  int v8;
  unsigned int v9;
  size_t v10;
  _DWORD *v11;
  uint64_t k;
  unsigned int v13;
  _DWORD *v14;
  uint64_t v15;
  _DWORD *v16;
  uint64_t m;
  unsigned int v18;
  _DWORD *v19;
  uint64_t v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  const void *v25;
  size_t v26;
  uint64_t n;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  const void *v33[3];
  unsigned int v34;
  int v35;
  _DWORD *v36;
  unsigned int v37;
  int v38;
  _DWORD *v39;
  unsigned int v40;
  int v41;
  _DWORD *v42;
  _DWORD *v43;

  if (*(_BYTE *)(a1 + 104))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "count");
    v3 = malloc_type_malloc(4 * v2, 0x100004052888210uLL);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        v3[i] = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i), "intValue");
    }
    v5 = objc_msgSend(*(id *)(a1 + 40), "count");
    v6 = malloc_type_malloc(4 * v5, 0x100004052888210uLL);
    if (v5)
    {
      for (j = 0; j != v5; v6[j++] = v8)
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", j), "floatValue");
    }
  }
  else
  {
    v6 = 0;
    v3 = 0;
    v5 = 0;
    v2 = objc_msgSend(*(id *)(a1 + 48), "count");
  }
  v31 = v5;
  v32 = v2;
  if (*(_BYTE *)(a1 + 105))
  {
    v9 = objc_msgSend(*(id *)(a1 + 56), "count");
    v10 = 4 * v9;
    v11 = malloc_type_malloc(v10, 0x100004052888210uLL);
    if (v9)
    {
      for (k = 0; k != v9; ++k)
        v11[k] = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", k), "intValue");
    }
    v29 = v9;
    v13 = objc_msgSend(*(id *)(a1 + 64), "count");
    v14 = malloc_type_malloc(4 * v13, 0x100004052888210uLL);
    v28 = v13;
    if (v13)
    {
      v15 = 0;
      do
      {
        v14[v15] = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "objectAtIndexedSubscript:", v15), "intValue");
        ++v15;
      }
      while (v28 != v15);
    }
    if (*(_BYTE *)(a1 + 106))
    {
      v16 = malloc_type_malloc(v10, 0x100004052888210uLL);
      if (v29)
      {
        for (m = 0; m != v29; ++m)
          v16[m] = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 72), "objectAtIndexedSubscript:", m), "intValue");
      }
      v18 = objc_msgSend(*(id *)(a1 + 80), "count");
      v19 = malloc_type_malloc(4 * v18, 0x100004052888210uLL);
      if (v18)
      {
        v20 = 0;
        v30 = v18;
        do
        {
          objc_msgSend((id)objc_msgSend(*(id *)(a1 + 80), "objectAtIndexedSubscript:", v20), "floatValue");
          v19[v20++] = v21;
        }
        while (v18 != v20);
      }
      else
      {
        v30 = 0;
      }
    }
    else
    {
      v30 = 0;
      v16 = 0;
      v19 = 0;
    }
    v23 = v28;
    v22 = v29;
  }
  else
  {
    v22 = 0;
    v11 = 0;
    v23 = 0;
    v14 = 0;
    v30 = 0;
    v16 = 0;
    v19 = 0;
  }
  v24 = objc_msgSend(*(id *)(a1 + 88), "morphRef");
  v25 = *(const void **)(a1 + 96);
  v26 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 88) + 161);
  v33[0] = (const void *)__PAIR64__(v31, v32);
  v33[1] = v3;
  v33[2] = v6;
  v34 = v22;
  v35 = 0;
  v36 = v11;
  v37 = v23;
  v38 = 0;
  v39 = v14;
  v40 = v30;
  v41 = 0;
  v42 = v16;
  v43 = v19;
  C3DMorphSetTargetsWithExtraTargetInfo(v24, v25, v26, v33);
  free(v3);
  free(v6);
  free(v11);
  free(v14);
  free(v16);
  free(v19);
  if (v32)
  {
    for (n = 0; n != v32; C3DMorphSetWeightAtIndex(v24, n++, 0.0))
      ;
  }
}

uint64_t __73__SCNMorpher__sortTargetsAndInBetweens_inBetweenCounts_inBetweenWeights___block_invoke(uint64_t a1, void *a2, void *a3)
{
  float v5;
  float v6;
  float v7;

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(a2, "unsignedIntegerValue") + *(_QWORD *)(a1 + 40)), "floatValue");
  v6 = v5;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(a3, "unsignedIntegerValue") + *(_QWORD *)(a1 + 40)), "floatValue");
  if (v6 < v7)
    return -1;
  else
    return v6 > v7;
}

- (void)setCalculationMode:(SCNMorpherCalculationMode)calculationMode
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNMorpher setCalculationMode:].cold.1();
  }
  else if (self->_calculationMode != calculationMode)
  {
    self->_calculationMode = calculationMode;
    v5 = -[SCNMorpher sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__SCNMorpher_setCalculationMode___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = calculationMode;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

uint64_t __33__SCNMorpher_setCalculationMode___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "morphRef");
  if (result)
    return C3DMorphSetCalculationMode(result, *(_QWORD *)(a1 + 40) == 1);
  return result;
}

- (SCNMorpherCalculationMode)calculationMode
{
  SCNMorpherCalculationMode v3;
  __C3DScene *v4;
  uint64_t v5;
  __C3DMorph *morpher;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNMorpher sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    morpher = self->_morpher;
    if (morpher)
    {
      v3 = (unint64_t)(C3DMorphGetCalculationMode((uint64_t)morpher) == 1);
      if (!v5)
        return v3;
    }
    else
    {
      v3 = SCNMorpherCalculationModeNormalized;
      if (!v5)
        return v3;
    }
    C3DSceneUnlock(v5);
    return v3;
  }
  return self->_calculationMode;
}

- (BOOL)unifiesNormals
{
  return self->_unifyNormal;
}

- (void)setUnifiesNormals:(BOOL)unifiesNormals
{
  __C3DScene *v5;
  _QWORD v6[5];
  BOOL v7;

  if (self->_unifyNormal != unifiesNormals)
  {
    self->_unifyNormal = unifiesNormals;
    v5 = -[SCNMorpher sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __32__SCNMorpher_setUnifiesNormals___block_invoke;
    v6[3] = &unk_1EA59E478;
    v6[4] = self;
    v7 = unifiesNormals;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

uint64_t __32__SCNMorpher_setUnifiesNormals___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "morphRef");
  if (result)
    return C3DMorphSetMorphNormals(result, *(_BYTE *)(a1 + 40) == 0);
  return result;
}

- (BOOL)shouldMorphNormals
{
  return !self->_unifyNormal;
}

- (void)setShouldMorphNormals:(BOOL)a3
{
  -[SCNMorpher setUnifiesNormals:](self, "setUnifiesNormals:", !a3);
}

- (BOOL)shouldClearCPUDataAfterUpload
{
  return C3DMorphGetClearCPUDataAfterUpload((uint64_t)self->_morpher);
}

- (void)setShouldClearCPUDataAfterUpload:(BOOL)a3
{
  C3DMorphSetClearCPUDataAfterUpload((uint64_t)self->_morpher, a3);
}

- (float)weightIncrementalThreshold
{
  __C3DScene *v3;
  uint64_t v4;
  float WeightIncrementalThreshold;

  v3 = -[SCNMorpher sceneRef](self, "sceneRef");
  if (!v3)
    return C3DMorphGetWeightIncrementalThreshold((uint64_t)self->_morpher);
  v4 = (uint64_t)v3;
  C3DSceneLock((uint64_t)v3);
  WeightIncrementalThreshold = C3DMorphGetWeightIncrementalThreshold((uint64_t)self->_morpher);
  C3DSceneUnlock(v4);
  return WeightIncrementalThreshold;
}

- (void)setWeightIncrementalThreshold:(float)a3
{
  __C3DScene *v5;
  _QWORD v6[5];
  float v7;

  v5 = -[SCNMorpher sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__SCNMorpher_setWeightIncrementalThreshold___block_invoke;
  v6[3] = &unk_1EA5A2D30;
  v6[4] = self;
  v7 = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __44__SCNMorpher_setWeightIncrementalThreshold___block_invoke(uint64_t a1)
{
  C3DMorphSetWeightIncrementalThreshold(objc_msgSend(*(id *)(a1 + 32), "morphRef"), *(float *)(a1 + 40));
}

- (void)convertToAdditiveWithBaseGeometry:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  v5 = -[SCNMorpher sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__SCNMorpher_convertToAdditiveWithBaseGeometry___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __48__SCNMorpher_convertToAdditiveWithBaseGeometry___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = C3DMorphConvertToCalculationMode(objc_msgSend(*(id *)(a1 + 32), "morphRef"), objc_msgSend(*(id *)(a1 + 40), "geometryRef"), 1, (uint64_t)&__block_literal_global_29_0);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_syncObjCModel");
  return result;
}

- (BOOL)_isUsingSparseTargets
{
  return self->_useSparseTargets;
}

- (void)convertToSparseWithBaseGeometry:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  v5 = -[SCNMorpher sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__SCNMorpher_convertToSparseWithBaseGeometry___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __46__SCNMorpher_convertToSparseWithBaseGeometry___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = C3DMorphConvertToSparse(objc_msgSend(*(id *)(a1 + 32), "morphRef"), objc_msgSend(*(id *)(a1 + 40), "geometryRef"), 1, (uint64_t)&__block_literal_global_29_0);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_syncObjCModel");
  return result;
}

- (__C3DScene)sceneRef
{
  return (__C3DScene *)C3DGetScene((_QWORD *)-[SCNMorpher __CFObject](self, "__CFObject"));
}

- (id)scene
{
  id result;

  result = -[SCNMorpher sceneRef](self, "sceneRef");
  if (result)
    return C3DEntityGetObjCWrapper((id *)result);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  NSArray *mainTargetsAndInBetweens;
  unint64_t weightCount;
  uint64_t i;

  v4 = objc_alloc_init((Class)objc_opt_class());
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  v4[161] = self->_useSparseTargets;
  if (self->_inBetweenCounts || self->_correctiveDriverCounts)
  {
    mainTargetsAndInBetweens = self->_mainTargetsAndInBetweens;
    if (!mainTargetsAndInBetweens)
      mainTargetsAndInBetweens = self->_mainTargets;
    objc_msgSend(v4, "setTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:correctives:driverCounts:driverIndices:inBetweenCounts:inBetweenWeights:", mainTargetsAndInBetweens, self->_correctiveInBetweenCounts, self->_correctiveInBetweenInfluenceWeights);
  }
  else
  {
    objc_msgSend(v4, "setTargets:", -[SCNMorpher targets](self, "targets"));
    weightCount = self->_weightCount;
    if (weightCount)
    {
      for (i = 0; i != weightCount; ++i)
      {
        -[SCNMorpher weightForTargetAtIndex:](self, "weightForTargetAtIndex:", i);
        objc_msgSend(v4, "setWeight:forTargetAtIndex:", i);
      }
    }
  }
  objc_msgSend(v4, "setCalculationMode:", -[SCNMorpher calculationMode](self, "calculationMode"));
  objc_msgSend(v4, "setName:", -[SCNMorpher name](self, "name"));
  objc_msgSend(v4, "setIdentifier:", -[SCNMorpher identifier](self, "identifier"));
  objc_msgSend(v4, "setUnifiesNormals:", -[SCNMorpher unifiesNormals](self, "unifiesNormals"));
  objc_msgSend(v4, "_copyAnimationsFrom:", self);
  +[SCNTransaction commitImmediate](SCNTransaction, "commitImmediate");
  return v4;
}

- (id)copy
{
  return -[SCNMorpher copyWithZone:](self, "copyWithZone:", 0);
}

- (void)_customDecodingOfSCNMorpher:(id)a3
{
  __C3DMorph *v4;

  v4 = (__C3DMorph *)C3DMorphCreate();
  self->_morpher = v4;
  if (v4)
    C3DEntitySetObjCWrapper((uint64_t)v4, self);
}

- (id)valueForUndefinedKey:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v10;
  objc_super v11;

  if (objc_msgSend(a3, "rangeOfString:", CFSTR("weights["))
    || (v6 = v5, (unint64_t)objc_msgSend(a3, "length") < 2)
    || (v7 = (void *)objc_msgSend(a3, "substringFromIndex:", v6),
        v8 = objc_msgSend(v7, "rangeOfString:", CFSTR("]")),
        v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v11.receiver = self;
    v11.super_class = (Class)SCNMorpher;
    return -[SCNMorpher valueForUndefinedKey:](&v11, sel_valueForUndefinedKey_, a3);
  }
  else
  {
    -[SCNMorpher weightForTargetAtIndex:](self, "weightForTargetAtIndex:", objc_msgSend((id)objc_msgSend(v7, "substringToIndex:", v8), "integerValue"));
    *(float *)&v10 = v10;
    return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  }
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  float v13;
  objc_super v14;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v11 = scn_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SCNMorpher setValue:forUndefinedKey:].cold.1();
  }
  else if (objc_msgSend(a4, "rangeOfString:", CFSTR("weights["))
         || (v8 = v7, (unint64_t)objc_msgSend(a4, "length") < 2)
         || (v9 = (void *)objc_msgSend(a4, "substringFromIndex:", v8),
             v10 = objc_msgSend(v9, "rangeOfString:", CFSTR("]")),
             v10 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v14.receiver = self;
    v14.super_class = (Class)SCNMorpher;
    -[SCNMorpher setValue:forUndefinedKey:](&v14, sel_setValue_forUndefinedKey_, a3, a4);
  }
  else
  {
    v12 = objc_msgSend((id)objc_msgSend(v9, "substringToIndex:", v10), "integerValue");
    objc_msgSend(a3, "floatValue");
    -[SCNMorpher setWeight:forTargetAtIndex:](self, "setWeight:forTargetAtIndex:", v12, v13);
  }
}

- (void)_customEncodingOfSCNMorpher:(id)a3
{
  uint64_t WeightsSource;
  uint64_t ID;

  WeightsSource = C3DMorphGetWeightsSource((uint64_t)self->_morpher);
  if (WeightsSource)
  {
    ID = C3DEntityGetID(WeightsSource);
    if (ID)
      objc_msgSend(a3, "encodeObject:forKey:", ID, CFSTR("weightID"));
  }
}

- (void)_didDecodeSCNMorpher:(id)a3
{
  uint64_t v4;
  const void *v5;
  uint64_t WeightsSource;

  v4 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("weightID"));
  if (v4)
  {
    v5 = (const void *)v4;
    WeightsSource = C3DMorphGetWeightsSource((uint64_t)self->_morpher);
    if (WeightsSource)
      C3DEntitySetID(WeightsSource, v5);
  }
}

- (void)encodeWithCoder:(id)a3
{
  char v5;
  NSArray **p_inBetweenInfluenceWeights;
  const __CFString *v7;
  NSString *name;

  if ((*((_BYTE *)self + 16) & 1) != 0)
    -[SCNMorpher _syncObjCModel](self, "_syncObjCModel");
  -[SCNMorpher _customEncodingOfSCNMorpher:](self, "_customEncodingOfSCNMorpher:", a3);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_calculationMode, CFSTR("calculationMode"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_useSparseTargets, CFSTR("useSparseTargets"));
  if (self->_weightCount)
    objc_msgSend(a3, "encodeObject:forKey:", -[SCNMorpher weights](self, "weights"), CFSTR("weights"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(a3, "skipMorphTargets");
  else
    v5 = 0;
  if (-[NSArray count](self->_inBetweenCounts, "count"))
  {
    p_inBetweenInfluenceWeights = &self->_inBetweenInfluenceWeights;
    if (-[NSArray count](self->_inBetweenInfluenceWeights, "count"))
    {
      if ((v5 & 1) == 0)
        objc_msgSend(a3, "encodeObject:forKey:", self->_mainTargetsAndInBetweens, CFSTR("targets"));
      objc_msgSend(a3, "encodeObject:forKey:", self->_inBetweenCounts, CFSTR("inBetweenCounts"));
      v7 = CFSTR("inBetweenInfluenceWeights");
      goto LABEL_15;
    }
  }
  if ((v5 & 1) == 0)
  {
    p_inBetweenInfluenceWeights = &self->_mainTargets;
    v7 = CFSTR("targets");
LABEL_15:
    objc_msgSend(a3, "encodeObject:forKey:", *p_inBetweenInfluenceWeights, v7);
  }
  if (-[NSArray count](self->_correctiveDriverCounts, "count")
    && -[NSArray count](self->_correctiveDriverIndices, "count"))
  {
    if ((v5 & 1) == 0)
      objc_msgSend(a3, "encodeObject:forKey:", self->_correctivesAndInBetweens, CFSTR("correctives"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_correctiveDriverCounts, CFSTR("correctiveDriverCounts"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_correctiveDriverIndices, CFSTR("correctiveDriverIndices"));
    if (-[NSArray count](self->_correctiveInBetweenCounts, "count")
      && -[NSArray count](self->_correctiveInBetweenInfluenceWeights, "count"))
    {
      objc_msgSend(a3, "encodeObject:forKey:", self->_correctiveInBetweenCounts, CFSTR("correctiveInBetweenCounts"));
      objc_msgSend(a3, "encodeObject:forKey:", self->_correctiveInBetweenInfluenceWeights, CFSTR("correctiveInBetweenInfluenceWeights"));
    }
  }
  name = self->_name;
  if (name)
    objc_msgSend(a3, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(a3, "encodeBool:forKey:", !self->_unifyNormal, CFSTR("shouldMorphNormals"));
  SCNEncodeEntity(a3, self);
  SCNEncodeAnimations(a3, self);
}

- (SCNMorpher)initWithCoder:(id)a3
{
  SCNMorpher *v4;
  _UNKNOWN **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)SCNMorpher;
  v4 = -[SCNMorpher init](&v36, sel_init);
  if (!v4)
    return v4;
  v5 = &off_1EA593000;
  v6 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  -[SCNMorpher _customDecodingOfSCNMorpher:](v4, "_customDecodingOfSCNMorpher:", a3);
  v4->_useSparseTargets = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("useSparseTargets"));
  -[SCNMorpher setCalculationMode:](v4, "setCalculationMode:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("calculationMode")));
  v7 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("inBetweenCounts"));
  v8 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("inBetweenInfluenceWeights"));
  if (v7 | v8)
  {
    v10 = (void *)v8;
    goto LABEL_16;
  }
  v29 = v6;
  v7 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("channelTargetCounts"));
  v9 = (void *)objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("channelTargetWeights"));
  if (!objc_msgSend((id)v7, "count") || !objc_msgSend(v9, "count"))
  {
    v10 = 0;
    v7 = 0;
    goto LABEL_15;
  }
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (!objc_msgSend((id)v7, "count"))
  {
LABEL_15:
    v6 = v29;
    goto LABEL_16;
  }
  v11 = 0;
  v12 = 0;
  do
  {
    v13 = objc_msgSend((id)objc_msgSend((id)v7, "objectAtIndexedSubscript:", v12), "unsignedIntegerValue");
    v14 = v13 - 1;
    if (v13 != 1)
    {
      v15 = v14 + v11;
      do
      {
        objc_msgSend(v10, "addObject:", objc_msgSend(v9, "objectAtIndexedSubscript:", v11++));
        --v14;
      }
      while (v14);
      v11 = v15;
    }
    ++v11;
    ++v12;
  }
  while (v12 < objc_msgSend((id)v7, "count"));
  v5 = &off_1EA593000;
  v6 = v29;
LABEL_16:
  v16 = (void *)objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("correctiveDriverCounts"));
  objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("correctiveDriverIndices"));
  v17 = (void *)objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("correctiveInBetweenCounts"));
  v31 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("correctiveInBetweenInfluenceWeights"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = objc_msgSend(a3, "allTargetsFromAnimCodec");
    if (v18)
    {
      v19 = (void *)v18;
      if (objc_msgSend(v17, "count"))
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (!v20)
        {
          v27 = 0;
          goto LABEL_33;
        }
        v21 = v20;
        v30 = v6;
        v22 = 0;
        v23 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v33 != v23)
              objc_enumerationMutation(v17);
            v22 += objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "unsignedIntegerValue");
          }
          v21 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v21);
        if (v22)
          goto LABEL_27;
      }
      else
      {
        v30 = v6;
        v22 = objc_msgSend(v16, "count");
        if (v22)
        {
LABEL_27:
          v25 = objc_msgSend(v19, "count") - v22;
          v26 = objc_msgSend(v19, "subarrayWithRange:", 0, v25);
          v27 = objc_msgSend(v19, "subarrayWithRange:", v25, v22);
          v19 = (void *)v26;
LABEL_31:
          v5 = &off_1EA593000;
          v6 = v30;
          goto LABEL_33;
        }
      }
      v27 = 0;
      goto LABEL_31;
    }
  }
  v19 = (void *)objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("targets"));
  v27 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("correctives"));
LABEL_33:
  if (v7 | v27)
    -[SCNMorpher setTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:correctives:driverCounts:driverIndices:inBetweenCounts:inBetweenWeights:](v4, "setTargetsAndInBetweens:inBetweenCounts:inBetweenWeights:correctives:driverCounts:driverIndices:inBetweenCounts:inBetweenWeights:", v19, v7, v10, v17, v31);
  else
    -[SCNMorpher setTargets:](v4, "setTargets:", v19);
  -[SCNMorpher setWeights:](v4, "setWeights:", objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("weights")));
  -[SCNMorpher setName:](v4, "setName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name")));
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("shouldMorphNormals")))
    -[SCNMorpher setUnifiesNormals:](v4, "setUnifiesNormals:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("shouldMorphNormals")) ^ 1);
  v4->_animationsLock._os_unfair_lock_opaque = 0;
  SCNDecodeEntity(a3, v4);
  SCNDecodeAnimations(a3, v4);
  -[SCNMorpher _didDecodeSCNMorpher:](v4, "_didDecodeSCNMorpher:", a3);
  objc_msgSend(v5[323], "setImmediateMode:", v6);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)SCNUID_classForElementOfArray:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("weights")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("channelTargetWeights")) & 1) != 0
    || objc_msgSend(a3, "isEqualToString:", CFSTR("channelTargetCounts")))
  {
    return (Class)objc_opt_class();
  }
  else
  {
    return 0;
  }
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

- (void)setWeight:forTargetAtIndex:.cold.1()
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

- (void)_presentationWeightForTargetAtIndex:(uint64_t)a3 token:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Presentation instance query targets the wrong scene", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_updateTargetsAndInBetween:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Update can't be done in place", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_updateCorrectivesAndInBetween:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Update can't be done in place", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setTargetsAndInBetweens:(NSObject *)a3 inBetweenCounts:inBetweenWeights:correctives:driverCounts:driverIndices:inBetweenCounts:inBetweenWeights:.cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "inBetweenIndex < targetsAndInBetweens.count";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Invalid in-between count (out of bounds) passed to morpher initialization", a1);
}

- (void)_validateTargetsAndInBetweens:(void *)a1 inBetweenCounts:inBetweenWeights:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_3_6(&dword_1DCCB8000, v1, v2, "Assertion '%s' failed. Expected %u in-betweens but found %u", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_4();
}

- (void)setCalculationMode:.cold.1()
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

- (void)setValue:forUndefinedKey:.cold.1()
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

@end
