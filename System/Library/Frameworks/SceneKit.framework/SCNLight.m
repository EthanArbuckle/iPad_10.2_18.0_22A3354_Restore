@implementation SCNLight

+ (SCNLight)lightWithMDLLight:(MDLLight *)mdlLight
{
  SCNLight *v4;
  float v5;
  float v6;
  float v7;
  float v8;
  MDLLightType v9;

  v4 = (SCNLight *)objc_msgSend(a1, "light");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SCNLight setColor:](v4, "setColor:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", -[MDLLight color](mdlLight, "color")));
    -[MDLLight attenuationStartDistance](mdlLight, "attenuationStartDistance");
    -[SCNLight setAttenuationStartDistance:](v4, "setAttenuationStartDistance:", v5);
    -[MDLLight attenuationEndDistance](mdlLight, "attenuationEndDistance");
    -[SCNLight setAttenuationEndDistance:](v4, "setAttenuationEndDistance:", v6);
    -[MDLLight innerConeAngle](mdlLight, "innerConeAngle");
    -[SCNLight setSpotInnerAngle:](v4, "setSpotInnerAngle:", v7);
    -[MDLLight outerConeAngle](mdlLight, "outerConeAngle");
    -[SCNLight setSpotOuterAngle:](v4, "setSpotOuterAngle:", v8);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[SCNLight setColor:](v4, "setColor:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0));
  }
  v9 = -[MDLLight lightType](mdlLight, "lightType");
  if (v9 - 1 <= 3)
    -[SCNLight setType:](v4, "setType:", *off_1EA59DFB8[v9 - 1]);
  return v4;
}

+ (SCNLight)lightWithMDLLightProbe:(id)a3
{
  SCNLight *v3;

  v3 = (SCNLight *)objc_msgSend(a1, "light", a3);
  -[SCNLight setType:](v3, "setType:", CFSTR("probe"));
  return v3;
}

- (SCNLight)init
{
  SCNLight *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNLight;
  v2 = -[SCNLight init](&v5, sel_init);
  if (v2)
  {
    v3 = C3DLightCreate();
    v2->_light = (__C3DLight *)v3;
    if (v3)
      C3DEntitySetObjCWrapper(v3, v2);
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    -[SCNLight _syncObjCModel](v2, "_syncObjCModel");
  }
  return v2;
}

- (SCNLight)initWithLightRef:(__C3DLight *)a3
{
  SCNLight *v4;
  __C3DLight *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNLight;
  v4 = -[SCNLight init](&v7, sel_init);
  if (v4)
  {
    v5 = (__C3DLight *)CFRetain(a3);
    v4->_light = v5;
    if (v5)
      C3DEntitySetObjCWrapper((uint64_t)v5, v4);
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    -[SCNLight _syncObjCModel](v4, "_syncObjCModel");
    -[SCNLight _syncObjCAnimations](v4, "_syncObjCAnimations");
  }
  return v4;
}

- (id)initPresentationLightWithLightRef:(__C3DLight *)a3
{
  SCNLight *v4;
  SCNLight *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNLight;
  v4 = -[SCNLight init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)v4 + 16) |= 1u;
    v4->_light = (__C3DLight *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (__C3DLight)lightRef
{
  return self->_light;
}

+ (SCNLight)light
{
  return (SCNLight *)objc_alloc_init((Class)a1);
}

+ (SCNLight)lightWithLightRef:(__C3DLight *)a3
{
  SCNLight *result;

  result = (SCNLight *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
    return (SCNLight *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithLightRef:", a3);
  return result;
}

- (void)dealloc
{
  __C3DLight *light;
  objc_super v4;
  _QWORD v5[5];

  light = self->_light;
  if (light)
  {
    if ((*((_BYTE *)self + 16) & 1) == 0)
    {
      C3DEntitySetObjCWrapper((uint64_t)light, 0);
      light = self->_light;
    }
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __19__SCNLight_dealloc__block_invoke;
    v5[3] = &__block_descriptor_40_e8_v16__0d8l;
    v5[4] = light;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, 0, v5);
  }

  -[SCNMaterialProperty parentWillDie:](self->_gobo, "parentWillDie:", self);
  -[SCNMaterialProperty parentWillDie:](self->_probeEnvironment, "parentWillDie:", self);

  v4.receiver = self;
  v4.super_class = (Class)SCNLight;
  -[SCNLight dealloc](&v4, sel_dealloc);
}

void __19__SCNLight_dealloc__block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (NSString)description
{
  NSUInteger v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  uint64_t v8;

  v3 = -[NSString length](-[SCNLight name](self, "name"), "length");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  if (v3)
    return (NSString *)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p '%@' | type=%@>"), v6, self, -[SCNLight name](self, "name"), -[SCNLight type](self, "type"));
  else
    return (NSString *)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p | type=%@>"), v6, self, -[SCNLight type](self, "type"), v8);
}

- (void)setName:(NSString *)name
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNLight setName:].cold.1();
  }
  else if ((unint64_t)name | (unint64_t)self->_name)
  {
    if ((-[NSString isEqual:](name, "isEqual:") & 1) == 0)
    {

      self->_name = (NSString *)-[NSString copy](name, "copy");
      v5 = -[SCNLight sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __20__SCNLight_setName___block_invoke;
      v7[3] = &unk_1EA59F740;
      v7[4] = self;
      v7[5] = name;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
    }
  }
}

CFStringRef __20__SCNLight_setName___block_invoke(uint64_t a1)
{
  return C3DEntitySetName(objc_msgSend(*(id *)(a1 + 32), "__CFObject"), *(CFStringRef *)(a1 + 40));
}

- (NSString)name
{
  NSString *Name;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_name;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  v5 = (uint64_t)v4;
  if (v4)
    C3DSceneLock((uint64_t)v4);
  Name = (NSString *)C3DEntityGetName((uint64_t)-[SCNLight __CFObject](self, "__CFObject"));
  if (v5)
    C3DSceneUnlock(v5);
  return Name;
}

- (void)setIdentifier:(id)a3
{
  C3DEntitySetID((uint64_t)-[SCNLight __CFObject](self, "__CFObject"), a3);
}

- (id)identifier
{
  return (id)C3DEntityGetID((uint64_t)-[SCNLight __CFObject](self, "__CFObject"));
}

- (void)_syncEntityObjCModel
{
  void *v3;

  v3 = -[SCNLight __CFObject](self, "__CFObject");

  self->_name = (NSString *)(id)C3DEntityGetName((uint64_t)v3);
}

- (void)_syncObjCModel
{
  __C3DScene *v3;
  uint64_t v4;
  int Type;
  uint64_t Color;
  uint64_t v7;
  char v8;
  SCNMaterialProperty *Gobo;
  int v10;
  float32x4_t v11;
  char v17;
  char v18;
  char v19;
  SCNMaterialProperty *ProbeEnvironment;
  _OWORD v21[2];
  __int128 v22;
  float32x4_t v23;
  _QWORD v24[2];

  v3 = -[SCNLight sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);

  Type = C3DLightGetType((uint64_t)self->_light);
  self->_type = SCNLightTypeFromC3DLightType(Type);
  Color = C3DLightGetColor((uint64_t)self->_light);

  self->_color = (id)objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", Color);
  self->_intensity = C3DLightGetIntensity((uint64_t)self->_light);
  self->_temperature = C3DLightGetTemperature((uint64_t)self->_light);
  v24[0] = C3DLightGetShadowColor((uint64_t)self->_light);
  v24[1] = v7;

  self->_shadowColor = (id)objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", v24);
  if (C3DLightGetCastsShadow((uint64_t)self->_light))
    v8 = 2;
  else
    v8 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xFD | v8;
  self->_shadowRadius = C3DLightGetShadowRadius((uint64_t)self->_light);
  self->_zNear = C3DLightGetZNear((uint64_t)self->_light);
  self->_zFar = C3DLightGetZFar((uint64_t)self->_light);
  self->_shadowBias = C3DLightGetShadowBias((uint64_t)self->_light);
  self->_attenuationEndDistance = C3DLightGetAttenuationStartDistance((uint64_t)self->_light);
  self->_attenuationFalloffExponent = C3DLightGetAttenuationEndDistance((uint64_t)self->_light);
  self->_spotInnerAngle = C3DLightGetAttenuationFalloffExponent((uint64_t)self->_light);
  self->_spotOuterAngle = C3DLightGetSpotInnerAngle((uint64_t)self->_light);
  self->_spotFalloffExponent = C3DLightGetSpotOuterAngle((uint64_t)self->_light);
  *(&self->_spotFalloffExponent + 1) = C3DLightGetSpotFalloffExponent((uint64_t)self->_light);

  Gobo = (SCNMaterialProperty *)C3DLightGetGobo((uint64_t)self->_light, 0);
  if (Gobo)
    Gobo = -[SCNMaterialProperty initWithParent:propertyType:]([SCNMaterialProperty alloc], "initWithParent:propertyType:", self, 22);
  self->_gobo = Gobo;
  v22 = 0u;
  v23 = 0u;
  C3DLightGetAreaDescription((uint64_t)self->_light, &v22);
  v10 = v22;
  self->_areaType = v22;
  v11 = v23;
  switch(v10)
  {
    case 0:
      __asm { FMOV            V0.4S, #1.0 }
      _Q0.f32[0] = v23.f32[0] + v23.f32[0];
      break;
    case 1:
    case 2:
      v11.i32[2] = 0.5;
      goto LABEL_10;
    case 3:
LABEL_10:
      _Q0 = vaddq_f32(v11, v11);
      break;
    default:
      __asm { FMOV            V0.4S, #1.0; jumptable 00000001DCE28DF4 default case }
      break;
  }
  *(float32x4_t *)self->_areaExtents = _Q0;
  v21[0] = v22;
  v21[1] = v23;
  self->_areaPolygonVertices = (NSArray *)_SCNAreaLightpolygonVerticesFromDescription((uint64_t)v21);
  self->_drawsArea = C3DLightGetDrawsArea((uint64_t)self->_light);
  self->_doubleSided = C3DLightGetDoubleSided((uint64_t)self->_light);
  self->_categoryBitMask = C3DLightGetCategoryBitMask((uint64_t)self->_light);
  self->_orthographicScale = C3DLightGetOrthographicScale((uint64_t)self->_light);
  self->_shadowSampleCount = C3DLightGetShadowSampleCount((uint64_t)self->_light);
  if (C3DLightGetUsesDeferredShadows((uint64_t)self->_light))
    v17 = 4;
  else
    v17 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xFB | v17;
  if (C3DLightGetAutomaticallyAdjustsShadowProjection((uint64_t)self->_light))
    v18 = 0x80;
  else
    v18 = 0;
  *((_BYTE *)self + 16) = v18 & 0x80 | *((_BYTE *)self + 16) & 0x7F;
  self->_maximumShadowDistance = C3DMeshElementGetPointSize((uint64_t)self->_light);
  self->_shadowCascadeCount = C3DLightGetShadowCascadeCount((uint64_t)self->_light);
  self->_shadowCascadeSplittingFactor = C3DLightGetShadowCascadeSplittingFactor((uint64_t)self->_light);
  *((_BYTE *)self + 17) = *((_BYTE *)self + 17) & 0xFE | C3DLightGetForceCasterBackFaceOnly((uint64_t)self->_light);
  if (C3DLightGetEnableSampleDistributed((uint64_t)self->_light))
    v19 = 2;
  else
    v19 = 0;
  *((_BYTE *)self + 17) = *((_BYTE *)self + 17) & 0xFD | v19;

  ProbeEnvironment = (SCNMaterialProperty *)C3DLightGetProbeEnvironment((uint64_t)self->_light, 0);
  if (ProbeEnvironment)
    ProbeEnvironment = -[SCNMaterialProperty initWithParent:propertyType:]([SCNMaterialProperty alloc], "initWithParent:propertyType:", self, 25);
  self->_probeEnvironment = ProbeEnvironment;
  self->_probeType = C3DLightGetProbeType((uint64_t)self->_light);
  self->_probeUpdateType = C3DLightGetProbeUpdateType((uint64_t)self->_light);
  self->_parallaxCorrectionEnabled = C3DLightGetParallaxCorrectionEnabled((uint64_t)self->_light);
  *(__n128 *)&self->_probeExtents[7] = C3DLightGetProbeExtents((__n128 *)self->_light);
  *(__n128 *)&self->_probeOffset[7] = C3DLightGetProbeOffset((__n128 *)self->_light);
  *(__n128 *)&self->_parallaxExtentsFactor[7] = C3DLightGetParallaxExtentsFactor((__n128 *)self->_light);
  *(__n128 *)&self->_parallaxCenterOffset[7] = C3DLightGetParallaxCenterOffset((__n128 *)self->_light);
  -[SCNLight _syncEntityObjCModel](self, "_syncEntityObjCModel");
  if (v4)
    C3DSceneUnlock(v4);
}

- (id)presentationLight
{
  if ((*((_BYTE *)self + 16) & 1) == 0)
    return -[SCNLight initPresentationLightWithLightRef:]([SCNLight alloc], "initPresentationLightWithLightRef:", *((_QWORD *)self + 1));
  return self;
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (__C3DScene)sceneRef
{
  return (__C3DScene *)C3DGetScene((_QWORD *)-[SCNLight __CFObject](self, "__CFObject"));
}

- (id)scene
{
  id result;

  result = -[SCNLight sceneRef](self, "sceneRef");
  if (result)
    return C3DEntityGetObjCWrapper((id *)result);
  return result;
}

- (void)__CFObject
{
  return self->_light;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 property:(id)a4
{
  if (self->_gobo == a4)
    return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("gobo"), a3));
  else
    return 0;
}

- (__C3DAnimationManager)animationManager
{
  __C3DAnimationManager *result;

  result = -[SCNLight sceneRef](self, "sceneRef");
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
    v9 = -[SCNLight __CFObject](self, "__CFObject");
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
    v8 = -[SCNLight sceneRef](self, "sceneRef");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __38__SCNLight_addAnimationPlayer_forKey___block_invoke;
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

void __38__SCNLight_addAnimationPlayer_forKey___block_invoke(id *a1)
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
    -[SCNLight addAnimationPlayer:forKey:](self, "addAnimationPlayer:forKey:", v7, v5);
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
  -[SCNLight addAnimation:forKey:](self, "addAnimation:forKey:", a3, 0);
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
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__SCNLight_removeAllAnimations__block_invoke;
  v5[3] = &unk_1EA59E4A0;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v4, self, v5);
}

void __31__SCNLight_removeAllAnimations__block_invoke(uint64_t a1)
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
  v6 = -[SCNLight sceneRef](self, "sceneRef");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SCNLight_removeAllAnimationsWithBlendOutDuration___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
}

void __52__SCNLight_removeAllAnimationsWithBlendOutDuration___block_invoke(uint64_t a1)
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
    v6 = -[SCNLight sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __34__SCNLight_removeAnimationForKey___block_invoke;
    v7[3] = &unk_1EA59F740;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __34__SCNLight_removeAnimationForKey___block_invoke(uint64_t a1)
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
    v8 = -[SCNLight sceneRef](self, "sceneRef");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__SCNLight_removeAnimationForKey_blendOutDuration___block_invoke;
    v9[3] = &unk_1EA59E2B0;
    v9[4] = self;
    v9[5] = a3;
    *(double *)&v9[6] = a4;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, self, v9);
  }
}

void __51__SCNLight_removeAnimationForKey_blendOutDuration___block_invoke(uint64_t a1)
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

  v3 = -[SCNLight _scnAnimationForKey:](self, "_scnAnimationForKey:", a3);
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
        -[SCNLight addAnimationPlayer:forKey:](self, "addAnimationPlayer:forKey:", v11, v10);

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
  v9 = -[SCNLight __CFObject](self, "__CFObject");
  if (v9)
  {
    v10 = v9;
    v11 = -[SCNLight animationManager](self, "animationManager");
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

  v5 = -[SCNLight sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__SCNLight_pauseAnimationForKey___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __33__SCNLight_pauseAnimationForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pauseAnimation:forKey:pausedByNode:", 1, *(_QWORD *)(a1 + 40), 0);
}

- (void)resumeAnimationForKey:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  v5 = -[SCNLight sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__SCNLight_resumeAnimationForKey___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __34__SCNLight_resumeAnimationForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pauseAnimation:forKey:pausedByNode:", 0, *(_QWORD *)(a1 + 40), 0);
}

- (void)setSpeed:(double)a3 forAnimationKey:(id)a4
{
  uint64_t v7;
  __C3DScene *v8;
  _QWORD v9[7];

  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("animations.%@.speed"), a4);
  v8 = -[SCNLight sceneRef](self, "sceneRef");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__SCNLight_setSpeed_forAnimationKey___block_invoke;
  v9[3] = &unk_1EA59E2B0;
  v9[4] = self;
  v9[5] = a4;
  *(double *)&v9[6] = a3;
  +[SCNTransaction postCommandWithContext:object:keyPath:applyBlock:](SCNTransaction, "postCommandWithContext:object:keyPath:applyBlock:", v8, self, v7, v9);
}

float __37__SCNLight_setSpeed_forAnimationKey___block_invoke(uint64_t a1)
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

  v5 = -[SCNLight sceneRef](self, "sceneRef");
  v6 = (uint64_t)v5;
  if (v5)
    C3DSceneLock((uint64_t)v5);
  v7 = -[SCNLight __CFObject](self, "__CFObject");
  if (v7)
  {
    v8 = v7;
    v9 = -[SCNLight animationManager](self, "animationManager");
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

    v15 = -[SCNLight sceneRef](self, "sceneRef");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__SCNLight_bindAnimatablePath_toObject_withKeyPath_options___block_invoke;
    v16[3] = &unk_1EA59F768;
    v16[4] = self;
    v16[5] = a4;
    v16[6] = a3;
    v16[7] = a5;
    v16[8] = a6;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v15, self, v16);
  }
}

void __60__SCNLight_bindAnimatablePath_toObject_withKeyPath_options___block_invoke(uint64_t a1)
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
  v5 = -[SCNLight sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__SCNLight_unbindAnimatablePath___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __33__SCNLight_unbindAnimatablePath___block_invoke(uint64_t a1)
{
  C3DEntityRemoveBindingWithKeyPath((float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject"), *(const __CFString **)(a1 + 40));
}

- (void)removeAllBindings
{
  __C3DScene *v3;
  _QWORD v4[5];

  self->_bindings = 0;
  v3 = -[SCNLight sceneRef](self, "sceneRef");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__SCNLight_removeAllBindings__block_invoke;
  v4[3] = &unk_1EA59E4A0;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v3, self, v4);
}

void __29__SCNLight_removeAllBindings__block_invoke(uint64_t a1)
{
  C3DEntityRemoveAllBindings((CFTypeRef *)objc_msgSend(*(id *)(a1 + 32), "__CFObject"));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v11;

  if (objc_msgSend(a3, "isEqual:", CFSTR("color")))
  {
    -[SCNLight setColor:](self, "setColor:", a4);
  }
  else if ((objc_msgSend(a3, "isEqual:", CFSTR("image")) & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)SCNLight;
    -[SCNLight observeValueForKeyPath:ofObject:change:context:](&v11, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5, a6);
  }
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  objc_msgSend(v4, "setIdentifier:", -[SCNLight identifier](self, "identifier"));
  -[SCNLight intensity](self, "intensity");
  objc_msgSend(v4, "setIntensity:");
  objc_msgSend(v4, "setColor:", -[SCNLight color](self, "color"));
  objc_msgSend(v4, "setName:", -[SCNLight name](self, "name"));
  objc_msgSend(v4, "setType:", -[SCNLight type](self, "type"));
  objc_msgSend(v4, "setShadowColor:", -[SCNLight shadowColor](self, "shadowColor"));
  -[SCNLight shadowRadius](self, "shadowRadius");
  objc_msgSend(v4, "setShadowRadius:");
  objc_msgSend(v4, "setCastsShadow:", -[SCNLight castsShadow](self, "castsShadow"));
  objc_msgSend(v4, "setShadowSampleCount:", -[SCNLight shadowSampleCount](self, "shadowSampleCount"));
  -[SCNLight orthographicScale](self, "orthographicScale");
  objc_msgSend(v4, "setOrthographicScale:");
  -[SCNLight zNear](self, "zNear");
  objc_msgSend(v4, "setZNear:");
  -[SCNLight zFar](self, "zFar");
  objc_msgSend(v4, "setZFar:");
  objc_msgSend(v4, "setCategoryBitMask:", -[SCNLight categoryBitMask](self, "categoryBitMask"));
  -[SCNLight attenuationEndDistance](self, "attenuationEndDistance");
  objc_msgSend(v4, "setAttenuationEndDistance:");
  -[SCNLight attenuationStartDistance](self, "attenuationStartDistance");
  objc_msgSend(v4, "setAttenuationStartDistance:");
  -[SCNLight attenuationFalloffExponent](self, "attenuationFalloffExponent");
  objc_msgSend(v4, "setAttenuationFalloffExponent:");
  -[SCNLight spotInnerAngle](self, "spotInnerAngle");
  objc_msgSend(v4, "setSpotInnerAngle:");
  -[SCNLight spotOuterAngle](self, "spotOuterAngle");
  objc_msgSend(v4, "setSpotOuterAngle:");
  -[SCNLight maximumShadowDistance](self, "maximumShadowDistance");
  objc_msgSend(v4, "setMaximumShadowDistance:");
  objc_msgSend(v4, "setAutomaticallyAdjustsShadowProjection:", -[SCNLight automaticallyAdjustsShadowProjection](self, "automaticallyAdjustsShadowProjection"));
  objc_msgSend(v4, "setShadowCascadeCount:", -[SCNLight shadowCascadeCount](self, "shadowCascadeCount"));
  if (self->_gobo)
    objc_msgSend((id)objc_msgSend(v4, "gobo"), "copyPropertiesFrom:", self->_gobo);
  objc_msgSend(v4, "setIESProfileURL:", -[SCNLight IESProfileURL](self, "IESProfileURL"));
  objc_msgSend(v4, "setAreaType:", -[SCNLight areaType](self, "areaType"));
  -[SCNLight areaExtents](self, "areaExtents");
  objc_msgSend(v4, "setAreaExtents:");
  objc_msgSend(v4, "setAreaPolygonVertices:", -[SCNLight areaPolygonVertices](self, "areaPolygonVertices"));
  objc_msgSend(v4, "setDrawsArea:", -[SCNLight drawsArea](self, "drawsArea"));
  objc_msgSend(v4, "setDoubleSided:", -[SCNLight doubleSided](self, "doubleSided"));
  objc_msgSend(v4, "setProbeType:", -[SCNLight probeType](self, "probeType"));
  objc_msgSend(v4, "setProbeUpdateType:", -[SCNLight probeUpdateType](self, "probeUpdateType"));
  -[SCNLight probeExtents](self, "probeExtents");
  objc_msgSend(v4, "setProbeExtents:");
  -[SCNLight probeOffset](self, "probeOffset");
  objc_msgSend(v4, "setProbeOffset:");
  objc_msgSend(v4, "setParallaxCorrectionEnabled:", -[SCNLight parallaxCorrectionEnabled](self, "parallaxCorrectionEnabled"));
  if (self->_probeEnvironment)
    objc_msgSend((id)objc_msgSend(v4, "probeEnvironment"), "copyPropertiesFrom:", self->_probeEnvironment);
  objc_msgSend(v4, "_copyAnimationsFrom:", self);
  +[SCNTransaction commitImmediate](SCNTransaction, "commitImmediate");
  return v4;
}

- (id)copy
{
  return -[SCNLight copyWithZone:](self, "copyWithZone:", 0);
}

- (void)setAttribute:(id)attribute forKey:(NSString *)key
{
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;

  if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("SCNLightAttenuationStartKey")))
  {
    objc_msgSend(attribute, "floatValue");
    -[SCNLight setAttenuationStartDistance:](self, "setAttenuationStartDistance:", v7);
  }
  else if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("SCNLightAttenuationEndKey")))
  {
    objc_msgSend(attribute, "floatValue");
    -[SCNLight setAttenuationEndDistance:](self, "setAttenuationEndDistance:", v8);
  }
  else if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("SCNLightAttenuationFalloffExponentKey")))
  {
    objc_msgSend(attribute, "floatValue");
    -[SCNLight setAttenuationFalloffExponent:](self, "setAttenuationFalloffExponent:", v9);
  }
  else if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("SCNLightSpotInnerAngleKey")))
  {
    objc_msgSend(attribute, "floatValue");
    -[SCNLight setSpotInnerAngle:](self, "setSpotInnerAngle:", v10);
  }
  else if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("SCNLightSpotOuterAngleKey")))
  {
    objc_msgSend(attribute, "floatValue");
    -[SCNLight setSpotOuterAngle:](self, "setSpotOuterAngle:", v11);
  }
  else if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("SCNLightSpotFalloffExponentKey")))
  {
    objc_msgSend(attribute, "floatValue");
    -[SCNLight setSpotFalloffExponent:](self, "setSpotFalloffExponent:", v12);
  }
  else if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("SCNLightShadowNearClippingKey")))
  {
    objc_msgSend(attribute, "floatValue");
    -[SCNLight setZNear:](self, "setZNear:", v13);
  }
  else if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("SCNLightShadowFarClippingKey")))
  {
    objc_msgSend(attribute, "floatValue");
    -[SCNLight setZFar:](self, "setZFar:", v14);
  }
}

- (id)attributeForKey:(NSString *)key
{
  double v5;

  if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("SCNLightAttenuationStartKey")))
  {
    -[SCNLight attenuationStartDistance](self, "attenuationStartDistance");
LABEL_17:
    *(float *)&v5 = v5;
    return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  }
  if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("SCNLightAttenuationEndKey")))
  {
    -[SCNLight attenuationEndDistance](self, "attenuationEndDistance");
    goto LABEL_17;
  }
  if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("SCNLightAttenuationFalloffExponentKey")))
  {
    -[SCNLight attenuationFalloffExponent](self, "attenuationFalloffExponent");
    goto LABEL_17;
  }
  if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("SCNLightSpotInnerAngleKey")))
  {
    -[SCNLight spotInnerAngle](self, "spotInnerAngle");
    goto LABEL_17;
  }
  if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("SCNLightSpotOuterAngleKey")))
  {
    -[SCNLight spotOuterAngle](self, "spotOuterAngle");
    goto LABEL_17;
  }
  if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("SCNLightSpotFalloffExponentKey")))
  {
    -[SCNLight spotFalloffExponent](self, "spotFalloffExponent");
    goto LABEL_17;
  }
  if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("SCNLightShadowNearClippingKey")))
  {
    -[SCNLight zNear](self, "zNear");
    goto LABEL_17;
  }
  if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("SCNLightShadowFarClippingKey")))
  {
    -[SCNLight zFar](self, "zFar");
    goto LABEL_17;
  }
  return 0;
}

- (NSData)sphericalHarmonicsCoefficients
{
  return self->_sphericalHarmonics;
}

- (void)setSphericalHarmonicsCoefficients:(id)a3
{
  NSData *sphericalHarmonics;
  __C3DScene *v6;
  _QWORD v7[6];

  sphericalHarmonics = self->_sphericalHarmonics;
  if (sphericalHarmonics != a3)
  {

    self->_sphericalHarmonics = (NSData *)objc_msgSend(a3, "copy");
    v6 = -[SCNLight sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__SCNLight_setSphericalHarmonicsCoefficients___block_invoke;
    v7[3] = &unk_1EA59F740;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __46__SCNLight_setSphericalHarmonicsCoefficients___block_invoke(uint64_t a1)
{
  C3DLightSetIrradianceSH(*(_QWORD **)(*(_QWORD *)(a1 + 32) + 8), *(CFTypeRef *)(a1 + 40));
}

- (BOOL)shouldBakeDirectLighting
{
  return (*((unsigned __int8 *)self + 16) >> 5) & 1;
}

- (void)setShouldBakeDirectLighting:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xDF | v3;
}

- (BOOL)shouldBakeIndirectLighting
{
  return (*((unsigned __int8 *)self + 16) >> 6) & 1;
}

- (void)setShouldBakeIndirectLighting:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xBF | v3;
}

- (CGFloat)attenuationEndDistance
{
  float AttenuationEndDistance;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNLight sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      AttenuationEndDistance = C3DLightGetAttenuationEndDistance((uint64_t)self->_light);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DLightGetAttenuationEndDistance((uint64_t)self->_light);
    }
  }
  else
  {
    return self->_attenuationFalloffExponent;
  }
  return AttenuationEndDistance;
}

- (void)setAttenuationEndDistance:(CGFloat)attenuationEndDistance
{
  float v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNLight setAttenuationEndDistance:].cold.1();
  }
  else if (self->_attenuationFalloffExponent != attenuationEndDistance)
  {
    v5 = attenuationEndDistance;
    self->_attenuationFalloffExponent = v5;
    v6 = -[SCNLight sceneRef](self, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38__SCNLight_setAttenuationEndDistance___block_invoke;
    v8[3] = &unk_1EA59E450;
    v8[4] = self;
    *(CGFloat *)&v8[5] = attenuationEndDistance;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("attenuationEndDistance"), v8);
  }
}

float __38__SCNLight_setAttenuationEndDistance___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DLightSetAttenuationEndDistance(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)attenuationFalloffExponent
{
  float AttenuationFalloffExponent;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNLight sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      AttenuationFalloffExponent = C3DLightGetAttenuationFalloffExponent((uint64_t)self->_light);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DLightGetAttenuationFalloffExponent((uint64_t)self->_light);
    }
  }
  else
  {
    return self->_spotInnerAngle;
  }
  return AttenuationFalloffExponent;
}

- (void)setAttenuationFalloffExponent:(CGFloat)attenuationFalloffExponent
{
  float v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNLight setAttenuationFalloffExponent:].cold.1();
  }
  else if (self->_spotInnerAngle != attenuationFalloffExponent)
  {
    v5 = attenuationFalloffExponent;
    self->_spotInnerAngle = v5;
    v6 = -[SCNLight sceneRef](self, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__SCNLight_setAttenuationFalloffExponent___block_invoke;
    v8[3] = &unk_1EA59E450;
    v8[4] = self;
    *(CGFloat *)&v8[5] = attenuationFalloffExponent;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("attenuationFalloffExponent"), v8);
  }
}

float __42__SCNLight_setAttenuationFalloffExponent___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DLightSetAttenuationFalloffExponent(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)attenuationStartDistance
{
  float AttenuationStartDistance;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNLight sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      AttenuationStartDistance = C3DLightGetAttenuationStartDistance((uint64_t)self->_light);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DLightGetAttenuationStartDistance((uint64_t)self->_light);
    }
  }
  else
  {
    return self->_attenuationEndDistance;
  }
  return AttenuationStartDistance;
}

- (void)setAttenuationStartDistance:(CGFloat)attenuationStartDistance
{
  float v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNLight setAttenuationStartDistance:].cold.1();
  }
  else if (self->_attenuationEndDistance != attenuationStartDistance)
  {
    v5 = attenuationStartDistance;
    self->_attenuationEndDistance = v5;
    v6 = -[SCNLight sceneRef](self, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__SCNLight_setAttenuationStartDistance___block_invoke;
    v8[3] = &unk_1EA59E450;
    v8[4] = self;
    *(CGFloat *)&v8[5] = attenuationStartDistance;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("attenuationStartDistance"), v8);
  }
}

float __40__SCNLight_setAttenuationStartDistance___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DLightSetAttenuationStartDistance(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (BOOL)isBaked
{
  unsigned int v2;
  int v3;
  __C3DScene *v5;
  uint64_t v6;
  char Baked;

  v2 = *((unsigned __int8 *)self + 16);
  if ((v2 & 1) != 0)
  {
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    if (v5)
    {
      v6 = (uint64_t)v5;
      C3DSceneLock((uint64_t)v5);
      Baked = C3DLightGetBaked((uint64_t)self->_light);
      C3DSceneUnlock(v6);
      LOBYTE(v3) = Baked;
    }
    else
    {
      LOBYTE(v3) = C3DLightGetBaked((uint64_t)self->_light);
    }
  }
  else
  {
    return (v2 >> 4) & 1;
  }
  return v3;
}

- (void)setBaked:(BOOL)a3
{
  char v4;
  char v6;
  __C3DScene *v7;
  NSObject *v8;
  _QWORD v9[5];
  BOOL v10;

  v4 = *((_BYTE *)self + 16);
  if ((v4 & 1) != 0)
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNLight setBaked:].cold.1();
  }
  else if (((((v4 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v6 = 16;
    else
      v6 = 0;
    *((_BYTE *)self + 16) = v4 & 0xEF | v6;
    v7 = -[SCNLight sceneRef](self, "sceneRef");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __21__SCNLight_setBaked___block_invoke;
    v9[3] = &unk_1EA59E478;
    v9[4] = self;
    v10 = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v9);
  }
}

void __21__SCNLight_setBaked___block_invoke(uint64_t a1)
{
  C3DLightSetBaked(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)castsShadow
{
  unsigned int v2;
  int v3;
  __C3DScene *v5;
  uint64_t v6;
  char CastsShadow;

  v2 = *((unsigned __int8 *)self + 16);
  if ((v2 & 1) != 0)
  {
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    if (v5)
    {
      v6 = (uint64_t)v5;
      C3DSceneLock((uint64_t)v5);
      CastsShadow = C3DLightGetCastsShadow((uint64_t)self->_light);
      C3DSceneUnlock(v6);
      LOBYTE(v3) = CastsShadow;
    }
    else
    {
      LOBYTE(v3) = C3DLightGetCastsShadow((uint64_t)self->_light);
    }
  }
  else
  {
    return (v2 >> 1) & 1;
  }
  return v3;
}

- (void)setCastsShadow:(BOOL)castsShadow
{
  char v4;
  char v6;
  __C3DScene *v7;
  NSObject *v8;
  _QWORD v9[5];
  BOOL v10;

  v4 = *((_BYTE *)self + 16);
  if ((v4 & 1) != 0)
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNLight setCastsShadow:].cold.1();
  }
  else if (((((v4 & 2) == 0) ^ castsShadow) & 1) == 0)
  {
    if (castsShadow)
      v6 = 2;
    else
      v6 = 0;
    *((_BYTE *)self + 16) = v4 & 0xFD | v6;
    v7 = -[SCNLight sceneRef](self, "sceneRef");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __27__SCNLight_setCastsShadow___block_invoke;
    v9[3] = &unk_1EA59E478;
    v9[4] = self;
    v10 = castsShadow;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v9);
  }
}

void __27__SCNLight_setCastsShadow___block_invoke(uint64_t a1)
{
  C3DLightSetCastsShadow(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (NSUInteger)categoryBitMask
{
  __C3DScene *v4;
  uint64_t v5;
  NSUInteger CategoryBitMask;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_categoryBitMask;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  if (!v4)
    return C3DLightGetCategoryBitMask((uint64_t)self->_light);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  CategoryBitMask = C3DLightGetCategoryBitMask((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return CategoryBitMask;
}

- (void)setCategoryBitMask:(NSUInteger)categoryBitMask
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNLight setCategoryBitMask:].cold.1();
  }
  else if (self->_categoryBitMask != categoryBitMask)
  {
    self->_categoryBitMask = categoryBitMask;
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __31__SCNLight_setCategoryBitMask___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = categoryBitMask;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __31__SCNLight_setCategoryBitMask___block_invoke(uint64_t a1)
{
  C3DLightSetCategoryBitMask(*(_QWORD **)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40));
}

- (id)color
{
  void *v3;
  __C3DScene *v4;
  uint64_t v5;
  uint64_t Color;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_color;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  v5 = (uint64_t)v4;
  if (v4)
    C3DSceneLock((uint64_t)v4);
  Color = C3DLightGetColor((uint64_t)self->_light);
  v3 = (void *)C3DColor4ToRGBCFColor(Color);
  if (v5)
    C3DSceneUnlock(v5);
  return v3;
}

- (void)setColor:(id)color
{
  id v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNLight setColor:].cold.1();
  }
  else
  {
    v5 = self->_color;
    if (v5 != color)
    {

      self->_color = color;
      v6 = -[SCNLight sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __21__SCNLight_setColor___block_invoke;
      v8[3] = &unk_1EA59F740;
      v8[4] = color;
      v8[5] = self;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("color"), v8);
    }
  }
}

void __21__SCNLight_setColor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[2];

  v3[0] = C3DColor4FromRGBCFColor(*(const void **)(a1 + 32), 0);
  v3[1] = v2;
  C3DLightSetColor(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), (float *)v3);
}

- (CGFloat)intensity
{
  double Intensity;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_intensity;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  if (!v4)
    return C3DLightGetIntensity((uint64_t)self->_light);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  Intensity = C3DLightGetIntensity((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return Intensity;
}

- (void)setIntensity:(CGFloat)intensity
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNLight setIntensity:].cold.1();
  }
  else if (self->_intensity != intensity)
  {
    self->_intensity = intensity;
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __25__SCNLight_setIntensity___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = intensity;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("intensity"), v7);
  }
}

float __25__SCNLight_setIntensity___block_invoke(uint64_t a1, float32x4_t a2, float32x4_t a3, double a4, double a5, double a6, double a7, __n128 a8)
{
  float result;

  a2.i64[0] = *(_QWORD *)(a1 + 40);
  a2.f32[0] = *(double *)a2.i64;
  C3DLightSetIntensity(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), a2, a3, a4, a5, a6, a7, a8);
  return result;
}

- (CGFloat)orthographicScale
{
  double OrthographicScale;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_orthographicScale;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  if (!v4)
    return C3DLightGetOrthographicScale((uint64_t)self->_light);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  OrthographicScale = C3DLightGetOrthographicScale((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return OrthographicScale;
}

- (void)setOrthographicScale:(CGFloat)orthographicScale
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNLight setOrthographicScale:].cold.1();
  }
  else if (self->_orthographicScale != orthographicScale)
  {
    self->_orthographicScale = orthographicScale;
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__SCNLight_setOrthographicScale___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = orthographicScale;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("orthographicScale"), v7);
  }
}

float __33__SCNLight_setOrthographicScale___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DLightSetOrthographicScale(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)shadowBias
{
  __C3DScene *v4;
  uint64_t v5;
  double ShadowBias;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_shadowBias;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  if (!v4)
    return C3DLightGetShadowBias((uint64_t)self->_light);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ShadowBias = C3DLightGetShadowBias((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return ShadowBias;
}

- (void)setShadowBias:(CGFloat)shadowBias
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNLight setShadowBias:].cold.1();
  }
  else if (self->_shadowBias != shadowBias)
  {
    self->_shadowBias = shadowBias;
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __26__SCNLight_setShadowBias___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = shadowBias;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("shadowBias"), v7);
  }
}

void __26__SCNLight_setShadowBias___block_invoke(uint64_t a1)
{
  C3DLightSetShadowBias(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(double *)(a1 + 40));
}

- (id)shadowColor
{
  void *v3;
  __C3DScene *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[2];

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_shadowColor;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  v5 = (uint64_t)v4;
  if (v4)
    C3DSceneLock((uint64_t)v4);
  v8[0] = C3DLightGetShadowColor((uint64_t)self->_light);
  v8[1] = v6;
  v3 = (void *)C3DColor4ToRGBCFColor((uint64_t)v8);
  if (v5)
    C3DSceneUnlock(v5);
  return v3;
}

- (void)setShadowColor:(id)shadowColor
{
  id v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNLight setShadowColor:].cold.1();
  }
  else
  {
    v5 = self->_shadowColor;
    if (v5 != shadowColor)
    {

      self->_shadowColor = shadowColor;
      v6 = -[SCNLight sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __27__SCNLight_setShadowColor___block_invoke;
      v8[3] = &unk_1EA59F740;
      v8[4] = shadowColor;
      v8[5] = self;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("shadowColor"), v8);
    }
  }
}

double __27__SCNLight_setShadowColor___block_invoke(uint64_t a1)
{
  unint64_t v2;
  double result;
  __n128 v4;

  v4.n128_u64[0] = C3DColor4FromRGBCFColor(*(const void **)(a1 + 32), 0);
  v4.n128_u64[1] = v2;
  *(_QWORD *)&result = C3DLightSetShadowColor((__n128 *)*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), &v4).n128_u64[0];
  return result;
}

- (CGSize)shadowMapSize
{
  CGSize shadowMapSize;
  __C3DScene *v4;
  uint64_t v5;
  double height;
  CGSize v7;
  CGSize result;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNLight sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    shadowMapSize = (CGSize)vcvtq_f64_f32(COERCE_FLOAT32X2_T(C3DLightGetShadowMapSize((uint64_t)self->_light)));
    if (v5)
    {
      v7 = shadowMapSize;
      C3DSceneUnlock(v5);
      shadowMapSize = v7;
    }
  }
  else
  {
    shadowMapSize = self->_shadowMapSize;
  }
  height = shadowMapSize.height;
  result.width = shadowMapSize.width;
  result.height = height;
  return result;
}

- (void)setShadowMapSize:(CGSize)shadowMapSize
{
  CGFloat height;
  CGFloat width;
  __C3DScene *v7;
  NSObject *v8;
  _QWORD v9[7];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNLight setShadowMapSize:].cold.1();
  }
  else
  {
    height = shadowMapSize.height;
    width = shadowMapSize.width;
    if (shadowMapSize.width != self->_shadowMapSize.width || shadowMapSize.height != self->_shadowMapSize.height)
    {
      self->_shadowMapSize = shadowMapSize;
      v7 = -[SCNLight sceneRef](self, "sceneRef");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __29__SCNLight_setShadowMapSize___block_invoke;
      v9[3] = &unk_1EA5A15E8;
      v9[4] = self;
      *(CGFloat *)&v9[5] = width;
      *(CGFloat *)&v9[6] = height;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v9);
    }
  }
}

void __29__SCNLight_setShadowMapSize___block_invoke(uint64_t a1)
{
  C3DLightSetShadowMapSize(*(float32x2_t **)(*(_QWORD *)(a1 + 32) + 8), vcvt_f32_f64(*(float64x2_t *)(a1 + 40)));
}

- (CGFloat)shadowRadius
{
  float ShadowRadius;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNLight sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      ShadowRadius = C3DLightGetShadowRadius((uint64_t)self->_light);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DLightGetShadowRadius((uint64_t)self->_light);
    }
  }
  else
  {
    return self->_shadowRadius;
  }
  return ShadowRadius;
}

- (void)setShadowRadius:(CGFloat)shadowRadius
{
  float v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNLight setShadowRadius:].cold.1();
  }
  else if (self->_shadowRadius != shadowRadius)
  {
    v5 = shadowRadius;
    self->_shadowRadius = v5;
    v6 = -[SCNLight sceneRef](self, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __28__SCNLight_setShadowRadius___block_invoke;
    v8[3] = &unk_1EA59E450;
    v8[4] = self;
    *(CGFloat *)&v8[5] = shadowRadius;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("shadowRadius"), v8);
  }
}

float __28__SCNLight_setShadowRadius___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DLightSetShadowRadius(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (NSUInteger)shadowSampleCount
{
  NSUInteger ShadowSampleCount;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_shadowSampleCount;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  if (!v4)
    return C3DLightGetShadowSampleCount((uint64_t)self->_light);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ShadowSampleCount = C3DLightGetShadowSampleCount((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return ShadowSampleCount;
}

- (void)setShadowSampleCount:(NSUInteger)shadowSampleCount
{
  NSUInteger v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNLight setShadowSampleCount:].cold.1();
  }
  else
  {
    if (shadowSampleCount >= 0x40)
      v4 = 64;
    else
      v4 = shadowSampleCount;
    if (v4 != self->_shadowSampleCount)
    {
      self->_shadowSampleCount = v4;
      v5 = -[SCNLight sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __33__SCNLight_setShadowSampleCount___block_invoke;
      v7[3] = &unk_1EA59E450;
      v7[4] = self;
      v7[5] = v4;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
    }
  }
}

void __33__SCNLight_setShadowSampleCount___block_invoke(uint64_t a1)
{
  C3DLightSetShadowSampleCount(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_DWORD *)(a1 + 40));
}

- (double)spotFalloffExponent
{
  float SpotFalloffExponent;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNLight sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      SpotFalloffExponent = C3DLightGetSpotFalloffExponent((uint64_t)self->_light);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DLightGetSpotFalloffExponent((uint64_t)self->_light);
    }
  }
  else
  {
    return *(&self->_spotFalloffExponent + 1);
  }
  return SpotFalloffExponent;
}

- (void)setSpotFalloffExponent:(double)a3
{
  float v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNLight setSpotFalloffExponent:].cold.1();
  }
  else if (*(&self->_spotFalloffExponent + 1) != a3)
  {
    v5 = a3;
    *(&self->_spotFalloffExponent + 1) = v5;
    v6 = -[SCNLight sceneRef](self, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __35__SCNLight_setSpotFalloffExponent___block_invoke;
    v8[3] = &unk_1EA59E450;
    v8[4] = self;
    *(double *)&v8[5] = a3;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("spotFalloffExponent"), v8);
  }
}

float __35__SCNLight_setSpotFalloffExponent___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DLightSetSpotFalloffExponent(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)spotInnerAngle
{
  float SpotInnerAngle;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNLight sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      SpotInnerAngle = C3DLightGetSpotInnerAngle((uint64_t)self->_light);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DLightGetSpotInnerAngle((uint64_t)self->_light);
    }
  }
  else
  {
    return self->_spotOuterAngle;
  }
  return SpotInnerAngle;
}

- (void)setSpotInnerAngle:(CGFloat)spotInnerAngle
{
  float v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNLight setSpotInnerAngle:].cold.1();
  }
  else if (self->_spotOuterAngle != spotInnerAngle)
  {
    v5 = spotInnerAngle;
    self->_spotOuterAngle = v5;
    v6 = -[SCNLight sceneRef](self, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __30__SCNLight_setSpotInnerAngle___block_invoke;
    v8[3] = &unk_1EA59E450;
    v8[4] = self;
    *(CGFloat *)&v8[5] = spotInnerAngle;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("spotInnerAngle"), v8);
  }
}

float __30__SCNLight_setSpotInnerAngle___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DLightSetSpotInnerAngle(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)spotOuterAngle
{
  float SpotOuterAngle;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNLight sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      SpotOuterAngle = C3DLightGetSpotOuterAngle((uint64_t)self->_light);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DLightGetSpotOuterAngle((uint64_t)self->_light);
    }
  }
  else
  {
    return self->_spotFalloffExponent;
  }
  return SpotOuterAngle;
}

- (void)setSpotOuterAngle:(CGFloat)spotOuterAngle
{
  float v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNLight setSpotOuterAngle:].cold.1();
  }
  else if (self->_spotFalloffExponent != spotOuterAngle)
  {
    v5 = spotOuterAngle;
    self->_spotFalloffExponent = v5;
    v6 = -[SCNLight sceneRef](self, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __30__SCNLight_setSpotOuterAngle___block_invoke;
    v8[3] = &unk_1EA59E450;
    v8[4] = self;
    *(CGFloat *)&v8[5] = spotOuterAngle;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("spotOuterAngle"), v8);
  }
}

float __30__SCNLight_setSpotOuterAngle___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DLightSetSpotOuterAngle(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (id)technique
{
  SCNTechnique *v3;
  __C3DScene *v4;
  uint64_t v5;
  uint64_t Technique;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNLight sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    Technique = C3DLightGetTechnique((uint64_t)self->_light);
    if (Technique)
    {
      v3 = +[SCNTechnique techniqueWithTechniqueRef:](SCNTechnique, "techniqueWithTechniqueRef:", Technique);
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
  return self->_technique;
}

- (void)setTechnique:(id)a3
{
  SCNTechnique *technique;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNLight setTechnique:].cold.1();
  }
  else
  {
    technique = self->_technique;
    if (technique != a3)
    {

      self->_technique = (SCNTechnique *)a3;
      v6 = -[SCNLight sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __25__SCNLight_setTechnique___block_invoke;
      v8[3] = &unk_1EA59F740;
      v8[4] = self;
      v8[5] = a3;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v8);
    }
  }
}

void __25__SCNLight_setTechnique___block_invoke(uint64_t a1)
{
  C3DLightSetTechnique(*(_QWORD **)(*(_QWORD *)(a1 + 32) + 8), (CFTypeRef)objc_msgSend(*(id *)(a1 + 40), "__CFObject"));
}

- (CGFloat)temperature
{
  double Temperature;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_temperature;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  if (!v4)
    return C3DLightGetTemperature((uint64_t)self->_light);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  Temperature = C3DLightGetTemperature((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return Temperature;
}

- (void)setTemperature:(CGFloat)temperature
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNLight setTemperature:].cold.1();
  }
  else if (self->_temperature != temperature)
  {
    self->_temperature = temperature;
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __27__SCNLight_setTemperature___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = temperature;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("temperature"), v7);
  }
}

float __27__SCNLight_setTemperature___block_invoke(uint64_t a1, float32x4_t a2, float32x4_t a3, double a4, double a5, double a6, double a7, __n128 a8)
{
  float result;

  a2.i64[0] = *(_QWORD *)(a1 + 40);
  a2.f32[0] = *(double *)a2.i64;
  C3DLightSetTemperature(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), a2, a3, a4, a5, a6, a7, a8);
  return result;
}

- (void)_resyncObjCModelOfPerTypeParameters
{
  __int128 v3;

  self->_spotOuterAngle = 0.0;
  self->_spotFalloffExponent = 45.0;
  *((_DWORD *)&self->_spotFalloffExponent + 1) = 1065353216;
  self->_drawsArea = kDefaultAreaDrawsArea;
  self->_doubleSided = kDefaultAreaDoubleSided;
  *(_QWORD *)&v3 = 0x3F0000003F000000;
  *((_QWORD *)&v3 + 1) = 0x3F0000003F000000;
  *(_OWORD *)self->_areaExtents = v3;
  self->_areaType = 1;
  self->_probeType = kDefaultProbeType;
  self->_probeUpdateType = kDefaultProbeUpdateType;
  self->_parallaxCorrectionEnabled = kDefaultParallaxCorrectionEnabled;
  *(_OWORD *)&self->_probeExtents[7] = kDefaultProbeExtents;
  *(_OWORD *)&self->_probeOffset[7] = kDefaultProbeOffset;
  *(_OWORD *)&self->_parallaxExtentsFactor[7] = kDefaultProbeParallaxExtents;
  *(_OWORD *)&self->_parallaxCenterOffset[7] = kDefaultProbeParallaxOffset;

  self->_IESProfileURL = 0;
}

- (SCNLightType)type
{
  SCNLightType v3;
  __C3DScene *v4;
  uint64_t v5;
  int Type;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNLight sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    Type = C3DLightGetType((uint64_t)self->_light);
    v3 = SCNLightTypeFromC3DLightType(Type);
    if (v5)
      C3DSceneUnlock(v5);
  }
  else
  {
    v3 = self->_type;
  }
  return (SCNLightType)(id)-[NSString copy](v3, "copy");
}

- (void)setType:(SCNLightType)type
{
  NSString *v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[5];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNLight setType:].cold.1();
  }
  else
  {
    v5 = self->_type;
    if (v5 != type)
    {

      self->_type = (NSString *)-[NSString copy](type, "copy");
      -[SCNLight _resyncObjCModelOfPerTypeParameters](self, "_resyncObjCModelOfPerTypeParameters");
      v6 = -[SCNLight sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __20__SCNLight_setType___block_invoke;
      v8[3] = &unk_1EA59E4A0;
      v8[4] = self;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v8);
    }
  }
}

void __20__SCNLight_setType___block_invoke(uint64_t a1)
{
  int v2;

  v2 = SCNLightTypeToC3DLightType(*(void **)(*(_QWORD *)(a1 + 32) + 48));
  C3DLightSetType(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v2);
  if (v2 == 6)
    _SCNLightUpdateC3DLightDescription(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336), *(void **)(*(_QWORD *)(a1 + 32) + 368), *(float32x4_t *)(*(_QWORD *)(a1 + 32) + 352));
}

- (BOOL)usesDeferredShadows
{
  unsigned int v2;
  int v3;
  __C3DScene *v5;
  uint64_t v6;
  char UsesDeferredShadows;

  v2 = *((unsigned __int8 *)self + 16);
  if ((v2 & 1) != 0)
  {
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    if (v5)
    {
      v6 = (uint64_t)v5;
      C3DSceneLock((uint64_t)v5);
      UsesDeferredShadows = C3DLightGetUsesDeferredShadows((uint64_t)self->_light);
      C3DSceneUnlock(v6);
      LOBYTE(v3) = UsesDeferredShadows;
    }
    else
    {
      LOBYTE(v3) = C3DLightGetUsesDeferredShadows((uint64_t)self->_light);
    }
  }
  else
  {
    return (v2 >> 2) & 1;
  }
  return v3;
}

- (void)setUsesDeferredShadows:(BOOL)a3
{
  char v4;
  char v6;
  __C3DScene *v7;
  NSObject *v8;
  _QWORD v9[5];
  BOOL v10;

  v4 = *((_BYTE *)self + 16);
  if ((v4 & 1) != 0)
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNLight setUsesDeferredShadows:].cold.1();
  }
  else if (((((v4 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v6 = 4;
    else
      v6 = 0;
    *((_BYTE *)self + 16) = v4 & 0xFB | v6;
    v7 = -[SCNLight sceneRef](self, "sceneRef");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __35__SCNLight_setUsesDeferredShadows___block_invoke;
    v9[3] = &unk_1EA59E478;
    v9[4] = self;
    v10 = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v9);
  }
}

void __35__SCNLight_setUsesDeferredShadows___block_invoke(uint64_t a1)
{
  C3DLightSetUsesDeferredShadows(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)usesModulatedMode
{
  unsigned int v2;
  int v3;
  __C3DScene *v5;
  uint64_t v6;
  char UsesModulatedMode;

  v2 = *((unsigned __int8 *)self + 16);
  if ((v2 & 1) != 0)
  {
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    if (v5)
    {
      v6 = (uint64_t)v5;
      C3DSceneLock((uint64_t)v5);
      UsesModulatedMode = C3DLightGetUsesModulatedMode((uint64_t)self->_light);
      C3DSceneUnlock(v6);
      LOBYTE(v3) = UsesModulatedMode;
    }
    else
    {
      LOBYTE(v3) = C3DLightGetUsesModulatedMode((uint64_t)self->_light);
    }
  }
  else
  {
    return (v2 >> 3) & 1;
  }
  return v3;
}

- (void)setUsesModulatedMode:(BOOL)a3
{
  char v4;
  char v6;
  __C3DScene *v7;
  NSObject *v8;
  _QWORD v9[5];
  BOOL v10;

  v4 = *((_BYTE *)self + 16);
  if ((v4 & 1) != 0)
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNLight setUsesModulatedMode:].cold.1();
  }
  else if (((((v4 & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v6 = 8;
    else
      v6 = 0;
    *((_BYTE *)self + 16) = v4 & 0xF7 | v6;
    v7 = -[SCNLight sceneRef](self, "sceneRef");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __33__SCNLight_setUsesModulatedMode___block_invoke;
    v9[3] = &unk_1EA59E478;
    v9[4] = self;
    v10 = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v9);
  }
}

void __33__SCNLight_setUsesModulatedMode___block_invoke(uint64_t a1)
{
  C3DLightSetUsesModulatedMode(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (CGFloat)zFar
{
  __C3DScene *v4;
  uint64_t v5;
  double ZFar;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_zFar;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  if (!v4)
    return C3DLightGetZFar((uint64_t)self->_light);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ZFar = C3DLightGetZFar((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return ZFar;
}

- (void)setZFar:(CGFloat)zFar
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNLight setZFar:].cold.1();
  }
  else if (self->_zFar != zFar)
  {
    self->_zFar = zFar;
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __20__SCNLight_setZFar___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = zFar;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("zFar"), v7);
  }
}

void __20__SCNLight_setZFar___block_invoke(uint64_t a1)
{
  C3DLightSetZFar(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(double *)(a1 + 40));
}

- (CGFloat)zNear
{
  __C3DScene *v4;
  uint64_t v5;
  double ZNear;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_zNear;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  if (!v4)
    return C3DLightGetZNear((uint64_t)self->_light);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ZNear = C3DLightGetZNear((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return ZNear;
}

- (void)setZNear:(CGFloat)zNear
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNLight setZNear:].cold.1();
  }
  else if (self->_zNear != zNear)
  {
    self->_zNear = zNear;
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __21__SCNLight_setZNear___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = zNear;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("zNear"), v7);
  }
}

void __21__SCNLight_setZNear___block_invoke(uint64_t a1)
{
  C3DLightSetZNear(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(double *)(a1 + 40));
}

- (NSUInteger)shadowCascadeCount
{
  unsigned int ShadowCascadeCount;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNLight sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      ShadowCascadeCount = C3DLightGetShadowCascadeCount((uint64_t)self->_light);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DLightGetShadowCascadeCount((uint64_t)self->_light);
    }
  }
  else
  {
    return self->_shadowCascadeCount;
  }
  return ShadowCascadeCount;
}

- (void)setShadowCascadeCount:(NSUInteger)shadowCascadeCount
{
  unsigned __int8 v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  unsigned __int8 v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNLight setShadowCascadeCount:].cold.1();
  }
  else if (self->_shadowCascadeCount != shadowCascadeCount)
  {
    if ((shadowCascadeCount & 0xFC) != 0)
      v4 = 4;
    else
      v4 = shadowCascadeCount;
    self->_shadowCascadeCount = v4;
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __34__SCNLight_setShadowCascadeCount___block_invoke;
    v7[3] = &unk_1EA59E478;
    v7[4] = self;
    v8 = v4;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __34__SCNLight_setShadowCascadeCount___block_invoke(uint64_t a1)
{
  C3DLightSetShadowCascadeCount(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)automaticallyAdjustsShadowProjection
{
  unsigned int v2;
  int v3;
  __C3DScene *v5;
  uint64_t v6;
  char AutomaticallyAdjustsShadowProjection;

  v2 = *((unsigned __int8 *)self + 16);
  if ((v2 & 1) != 0)
  {
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    if (v5)
    {
      v6 = (uint64_t)v5;
      C3DSceneLock((uint64_t)v5);
      AutomaticallyAdjustsShadowProjection = C3DLightGetAutomaticallyAdjustsShadowProjection((uint64_t)self->_light);
      C3DSceneUnlock(v6);
      LOBYTE(v3) = AutomaticallyAdjustsShadowProjection;
    }
    else
    {
      LOBYTE(v3) = C3DLightGetAutomaticallyAdjustsShadowProjection((uint64_t)self->_light);
    }
  }
  else
  {
    return v2 >> 7;
  }
  return v3;
}

- (void)setAutomaticallyAdjustsShadowProjection:(BOOL)automaticallyAdjustsShadowProjection
{
  unsigned int v4;
  char v6;
  __C3DScene *v7;
  NSObject *v8;
  _QWORD v9[5];
  BOOL v10;

  v4 = *((unsigned __int8 *)self + 16);
  if ((v4 & 1) != 0)
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNLight setAutomaticallyAdjustsShadowProjection:].cold.1();
  }
  else if (automaticallyAdjustsShadowProjection != v4 >> 7)
  {
    if (automaticallyAdjustsShadowProjection)
      v6 = 0x80;
    else
      v6 = 0;
    *((_BYTE *)self + 16) = v6 & 0x80 | v4 & 0x7F;
    v7 = -[SCNLight sceneRef](self, "sceneRef");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__SCNLight_setAutomaticallyAdjustsShadowProjection___block_invoke;
    v9[3] = &unk_1EA59E478;
    v9[4] = self;
    v10 = automaticallyAdjustsShadowProjection;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v9);
  }
}

void __52__SCNLight_setAutomaticallyAdjustsShadowProjection___block_invoke(uint64_t a1)
{
  C3DLightSetAutomaticallyAdjustsShadowProjection(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (CGFloat)maximumShadowDistance
{
  double PointSize;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_maximumShadowDistance;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  if (!v4)
    return C3DMeshElementGetPointSize((uint64_t)self->_light);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  PointSize = C3DMeshElementGetPointSize((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return PointSize;
}

- (void)setMaximumShadowDistance:(CGFloat)maximumShadowDistance
{
  CGFloat v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNLight setMaximumShadowDistance:].cold.1();
  }
  else
  {
    v4 = maximumShadowDistance;
    LOBYTE(maximumShadowDistance) = self->_shadowCascadeCount;
    if ((double)*(unint64_t *)&maximumShadowDistance != v4)
    {
      self->_maximumShadowDistance = v4;
      v5 = -[SCNLight sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __37__SCNLight_setMaximumShadowDistance___block_invoke;
      v7[3] = &unk_1EA59E450;
      v7[4] = self;
      *(CGFloat *)&v7[5] = v4;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
    }
  }
}

float __37__SCNLight_setMaximumShadowDistance___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DLightSetMaximumShadowDistance(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (BOOL)forcesBackFaceCasters
{
  __C3DScene *v4;
  uint64_t v5;
  char ForceCasterBackFaceOnly;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return *((_BYTE *)self + 17) & 1;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  if (!v4)
    return C3DLightGetForceCasterBackFaceOnly((uint64_t)self->_light);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ForceCasterBackFaceOnly = C3DLightGetForceCasterBackFaceOnly((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return ForceCasterBackFaceOnly;
}

- (void)setForcesBackFaceCasters:(BOOL)forcesBackFaceCasters
{
  char v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[5];
  BOOL v9;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNLight setForcesBackFaceCasters:].cold.1();
  }
  else
  {
    v5 = *((_BYTE *)self + 17);
    if (((((v5 & 1) == 0) ^ forcesBackFaceCasters) & 1) == 0)
    {
      *((_BYTE *)self + 17) = v5 & 0xFE | forcesBackFaceCasters;
      v6 = -[SCNLight sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __37__SCNLight_setForcesBackFaceCasters___block_invoke;
      v8[3] = &unk_1EA59E478;
      v8[4] = self;
      v9 = forcesBackFaceCasters;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v8);
    }
  }
}

void __37__SCNLight_setForcesBackFaceCasters___block_invoke(uint64_t a1)
{
  C3DLightSetForceCasterBackFaceOnly(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)sampleDistributedShadowMaps
{
  int v3;
  __C3DScene *v4;
  uint64_t v5;
  char EnableSampleDistributed;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNLight sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      EnableSampleDistributed = C3DLightGetEnableSampleDistributed((uint64_t)self->_light);
      C3DSceneUnlock(v5);
      LOBYTE(v3) = EnableSampleDistributed;
    }
    else
    {
      LOBYTE(v3) = C3DLightGetEnableSampleDistributed((uint64_t)self->_light);
    }
  }
  else
  {
    return (*((unsigned __int8 *)self + 17) >> 1) & 1;
  }
  return v3;
}

- (void)setSampleDistributedShadowMaps:(BOOL)sampleDistributedShadowMaps
{
  char v5;
  char v6;
  __C3DScene *v7;
  NSObject *v8;
  _QWORD v9[5];
  BOOL v10;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNLight setSampleDistributedShadowMaps:].cold.1();
  }
  else
  {
    v5 = *((_BYTE *)self + 17);
    if (((((v5 & 2) == 0) ^ sampleDistributedShadowMaps) & 1) == 0)
    {
      if (sampleDistributedShadowMaps)
        v6 = 2;
      else
        v6 = 0;
      *((_BYTE *)self + 17) = v5 & 0xFD | v6;
      v7 = -[SCNLight sceneRef](self, "sceneRef");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __43__SCNLight_setSampleDistributedShadowMaps___block_invoke;
      v9[3] = &unk_1EA59E478;
      v9[4] = self;
      v10 = sampleDistributedShadowMaps;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v9);
    }
  }
}

void __43__SCNLight_setSampleDistributedShadowMaps___block_invoke(uint64_t a1)
{
  C3DLightSetEnableSampleDistributed(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (CGFloat)shadowCascadeSplittingFactor
{
  double ShadowCascadeSplittingFactor;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_shadowCascadeSplittingFactor;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  if (!v4)
    return C3DLightGetShadowCascadeSplittingFactor((uint64_t)self->_light);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ShadowCascadeSplittingFactor = C3DLightGetShadowCascadeSplittingFactor((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return ShadowCascadeSplittingFactor;
}

- (void)setShadowCascadeSplittingFactor:(CGFloat)shadowCascadeSplittingFactor
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNLight setShadowCascadeSplittingFactor:].cold.1();
  }
  else if (self->_shadowCascadeSplittingFactor != shadowCascadeSplittingFactor)
  {
    self->_shadowCascadeSplittingFactor = shadowCascadeSplittingFactor;
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__SCNLight_setShadowCascadeSplittingFactor___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = shadowCascadeSplittingFactor;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

float __44__SCNLight_setShadowCascadeSplittingFactor___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DLightSetShadowCascadeSplittingFactor(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (double)_shadowCascadeDebugFactor
{
  double ShadowCascadeDebugFactor;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_cascadeDebugFactor;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  if (!v4)
    return C3DLightGetShadowCascadeDebugFactor((uint64_t)self->_light);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ShadowCascadeDebugFactor = C3DLightGetShadowCascadeDebugFactor((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return ShadowCascadeDebugFactor;
}

- (void)set_shadowCascadeDebugFactor:(double)a3
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNLight set_shadowCascadeDebugFactor:].cold.1();
  }
  else if (self->_cascadeDebugFactor != a3)
  {
    self->_cascadeDebugFactor = a3;
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__SCNLight_set_shadowCascadeDebugFactor___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:keyPath:applyBlock:](SCNTransaction, "postCommandWithContext:object:keyPath:applyBlock:", v5, self, CFSTR("shadowCascadeDebugFactor"), v7);
  }
}

float __41__SCNLight_set_shadowCascadeDebugFactor___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DLightSetShadowCascadeDebugFactor(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (SCNShadowMode)shadowMode
{
  if (-[SCNLight usesDeferredShadows](self, "usesDeferredShadows"))
    return 1;
  if (-[SCNLight usesModulatedMode](self, "usesModulatedMode"))
    return 2;
  return 0;
}

- (void)setShadowMode:(SCNShadowMode)shadowMode
{
  -[SCNLight setUsesDeferredShadows:](self, "setUsesDeferredShadows:", shadowMode == SCNShadowModeDeferred);
  -[SCNLight setUsesModulatedMode:](self, "setUsesModulatedMode:", shadowMode == SCNShadowModeModulated);
}

- (SCNLightProbeType)probeType
{
  SCNLightProbeType ProbeType;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_probeType;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  if (!v4)
    return (unint64_t)C3DLightGetProbeType((uint64_t)self->_light);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ProbeType = (unint64_t)C3DLightGetProbeType((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return ProbeType;
}

- (void)setProbeType:(SCNLightProbeType)probeType
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_probeType != probeType)
  {
    self->_probeType = probeType;
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __25__SCNLight_setProbeType___block_invoke;
    v6[3] = &unk_1EA59E450;
    v6[4] = self;
    v6[5] = probeType;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

void __25__SCNLight_setProbeType___block_invoke(uint64_t a1)
{
  C3DLightSetProbeType(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_BYTE *)(a1 + 40));
}

- (SCNLightProbeUpdateType)probeUpdateType
{
  SCNLightProbeUpdateType ProbeUpdateType;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_probeUpdateType;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  if (!v4)
    return (unint64_t)C3DLightGetProbeUpdateType((uint64_t)self->_light);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ProbeUpdateType = (unint64_t)C3DLightGetProbeUpdateType((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return ProbeUpdateType;
}

- (void)setProbeUpdateType:(SCNLightProbeUpdateType)probeUpdateType
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_probeUpdateType != probeUpdateType)
  {
    self->_probeUpdateType = probeUpdateType;
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __31__SCNLight_setProbeUpdateType___block_invoke;
    v6[3] = &unk_1EA59E450;
    v6[4] = self;
    v6[5] = probeUpdateType;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

void __31__SCNLight_setProbeUpdateType___block_invoke(uint64_t a1)
{
  C3DLightSetProbeUpdateType(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_BYTE *)(a1 + 40));
}

- (BOOL)parallaxCorrectionEnabled
{
  __C3DScene *v4;
  uint64_t v5;
  BOOL ParallaxCorrectionEnabled;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_parallaxCorrectionEnabled;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  if (!v4)
    return C3DLightGetParallaxCorrectionEnabled((uint64_t)self->_light);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ParallaxCorrectionEnabled = C3DLightGetParallaxCorrectionEnabled((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return ParallaxCorrectionEnabled;
}

- (void)setParallaxCorrectionEnabled:(BOOL)parallaxCorrectionEnabled
{
  __C3DScene *v5;
  _QWORD v6[5];
  BOOL v7;

  if (self->_parallaxCorrectionEnabled != parallaxCorrectionEnabled)
  {
    self->_parallaxCorrectionEnabled = parallaxCorrectionEnabled;
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__SCNLight_setParallaxCorrectionEnabled___block_invoke;
    v6[3] = &unk_1EA59E478;
    v6[4] = self;
    v7 = parallaxCorrectionEnabled;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

void __41__SCNLight_setParallaxCorrectionEnabled___block_invoke(uint64_t a1)
{
  C3DLightSetParallaxCorrectionEnabled(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_BYTE *)(a1 + 40));
}

- (simd_float3)parallaxCenterOffset
{
  __C3DScene *v4;
  uint64_t v5;
  __n128 ParallaxCenterOffset;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNLight sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      ParallaxCenterOffset = C3DLightGetParallaxCenterOffset((__n128 *)self->_light);
      C3DSceneUnlock(v5);
      return (simd_float3)ParallaxCenterOffset;
    }
    else
    {
      return (simd_float3)C3DLightGetParallaxCenterOffset((__n128 *)self->_light);
    }
  }
  else
  {
    return *(simd_float3 *)&self->_parallaxCenterOffset[7];
  }
}

- (void)setParallaxCenterOffset:(simd_float3)parallaxCenterOffset
{
  uint32x4_t v3;
  __C3DScene *v5;
  _QWORD v7[4];
  simd_float3 v8;
  SCNLight *v9;

  v3 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_parallaxCenterOffset[7], (float32x4_t)parallaxCenterOffset));
  v3.i32[3] = v3.i32[2];
  if ((vmaxvq_u32(v3) & 0x80000000) != 0)
  {
    *(simd_float3 *)&self->_parallaxCenterOffset[7] = parallaxCenterOffset;
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__SCNLight_setParallaxCenterOffset___block_invoke;
    v7[3] = &unk_1EA5A1FD8;
    v9 = self;
    v8 = parallaxCenterOffset;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __36__SCNLight_setParallaxCenterOffset___block_invoke(__n128 *a1)
{
  C3DLightSetParallaxCenterOffset(*(__n128 **)(a1[3].n128_u64[0] + 8), a1[2]);
}

- (simd_float3)parallaxExtentsFactor
{
  __C3DScene *v4;
  uint64_t v5;
  __n128 ParallaxExtentsFactor;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNLight sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      ParallaxExtentsFactor = C3DLightGetParallaxExtentsFactor((__n128 *)self->_light);
      C3DSceneUnlock(v5);
      return (simd_float3)ParallaxExtentsFactor;
    }
    else
    {
      return (simd_float3)C3DLightGetParallaxExtentsFactor((__n128 *)self->_light);
    }
  }
  else
  {
    return *(simd_float3 *)&self->_parallaxExtentsFactor[7];
  }
}

- (void)setParallaxExtentsFactor:(simd_float3)parallaxExtentsFactor
{
  uint32x4_t v3;
  __C3DScene *v5;
  _QWORD v7[4];
  simd_float3 v8;
  SCNLight *v9;

  v3 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_parallaxExtentsFactor[7], (float32x4_t)parallaxExtentsFactor));
  v3.i32[3] = v3.i32[2];
  if ((vmaxvq_u32(v3) & 0x80000000) != 0)
  {
    *(simd_float3 *)&self->_parallaxExtentsFactor[7] = parallaxExtentsFactor;
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__SCNLight_setParallaxExtentsFactor___block_invoke;
    v7[3] = &unk_1EA5A1FD8;
    v9 = self;
    v8 = parallaxExtentsFactor;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __37__SCNLight_setParallaxExtentsFactor___block_invoke(__n128 *a1)
{
  C3DLightSetParallaxExtentsFactor(*(__n128 **)(a1[3].n128_u64[0] + 8), a1[2]);
}

- (simd_float3)probeExtents
{
  __C3DScene *v4;
  uint64_t v5;
  __n128 ProbeExtents;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNLight sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      ProbeExtents = C3DLightGetProbeExtents((__n128 *)self->_light);
      C3DSceneUnlock(v5);
      return (simd_float3)ProbeExtents;
    }
    else
    {
      return (simd_float3)C3DLightGetProbeExtents((__n128 *)self->_light);
    }
  }
  else
  {
    return *(simd_float3 *)&self->_probeExtents[7];
  }
}

- (void)setProbeExtents:(simd_float3)probeExtents
{
  uint32x4_t v3;
  __C3DScene *v5;
  _QWORD v7[4];
  simd_float3 v8;
  SCNLight *v9;

  v3 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_probeExtents[7], (float32x4_t)probeExtents));
  v3.i32[3] = v3.i32[2];
  if ((vmaxvq_u32(v3) & 0x80000000) != 0)
  {
    *(simd_float3 *)&self->_probeExtents[7] = probeExtents;
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __28__SCNLight_setProbeExtents___block_invoke;
    v7[3] = &unk_1EA5A1FD8;
    v9 = self;
    v8 = probeExtents;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

double __28__SCNLight_setProbeExtents___block_invoke(float32x4_t *a1)
{
  double result;

  *(_QWORD *)&result = C3DLightSetProbeExtents((float32x4_t *)*(_QWORD *)(a1[3].i64[0] + 8), a1[2]).u64[0];
  return result;
}

- (simd_float3)probeOffset
{
  __C3DScene *v4;
  uint64_t v5;
  __n128 ProbeOffset;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNLight sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      ProbeOffset = C3DLightGetProbeOffset((__n128 *)self->_light);
      C3DSceneUnlock(v5);
      return (simd_float3)ProbeOffset;
    }
    else
    {
      return (simd_float3)C3DLightGetProbeOffset((__n128 *)self->_light);
    }
  }
  else
  {
    return *(simd_float3 *)&self->_probeOffset[7];
  }
}

- (void)setProbeOffset:(simd_float3)probeOffset
{
  uint32x4_t v3;
  __C3DScene *v5;
  _QWORD v7[4];
  simd_float3 v8;
  SCNLight *v9;

  v3 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_probeOffset[7], (float32x4_t)probeOffset));
  v3.i32[3] = v3.i32[2];
  if ((vmaxvq_u32(v3) & 0x80000000) != 0)
  {
    *(simd_float3 *)&self->_probeOffset[7] = probeOffset;
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __27__SCNLight_setProbeOffset___block_invoke;
    v7[3] = &unk_1EA5A1FD8;
    v9 = self;
    v8 = probeOffset;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __27__SCNLight_setProbeOffset___block_invoke(__n128 *a1)
{
  C3DLightSetProbeOffset(*(__n128 **)(a1[3].n128_u64[0] + 8), a1[2]);
}

- (SCNMaterialProperty)probeEnvironment
{
  SCNMaterialProperty *result;

  result = self->_probeEnvironment;
  if (!result)
  {
    result = -[SCNMaterialProperty initWithParent:propertyType:]([SCNMaterialProperty alloc], "initWithParent:propertyType:", self, 25);
    self->_probeEnvironment = result;
  }
  if ((*((_BYTE *)self + 16) & 1) != 0)
    return (SCNMaterialProperty *)-[SCNMaterialProperty presentationMaterialProperty](result, "presentationMaterialProperty");
  return result;
}

- (SCNLightAreaType)areaType
{
  SCNLightAreaType v3;
  __C3DScene *v4;
  uint64_t v5;
  __int128 v7[2];

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_areaType;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  if (v4)
  {
    v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    C3DLightGetAreaDescription((uint64_t)self->_light, v7);
    v3 = (unint64_t)LOBYTE(v7[0]);
    C3DSceneUnlock(v5);
  }
  else
  {
    C3DLightGetAreaDescription((uint64_t)self->_light, v7);
    return (unint64_t)LOBYTE(v7[0]);
  }
  return v3;
}

- (void)setAreaType:(SCNLightAreaType)areaType
{
  __C3DScene *v4;
  _QWORD v5[5];

  if (self->_areaType != areaType)
  {
    self->_areaType = areaType;
    v4 = -[SCNLight sceneRef](self, "sceneRef");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __24__SCNLight_setAreaType___block_invoke;
    v5[3] = &unk_1EA59E4A0;
    v5[4] = self;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v4, self, v5);
  }
}

void __24__SCNLight_setAreaType___block_invoke(uint64_t a1)
{
  _SCNLightUpdateC3DLightDescription(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336), *(void **)(*(_QWORD *)(a1 + 32) + 368), *(float32x4_t *)(*(_QWORD *)(a1 + 32) + 352));
}

- (simd_float3)areaExtents
{
  simd_float3 result;
  __C3DScene *v4;
  uint64_t v5;
  float32x4_t v6;
  simd_float3 v11;
  __int128 v12;
  float32x4_t v13;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNLight sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    C3DLightGetAreaDescription((uint64_t)self->_light, &v12);
    switch((char)v12)
    {
      case 0:
        v6.i64[1] = 0x3F0000003F000000;
        v6.i64[0] = v13.u32[0] | 0x3F00000000000000;
        goto LABEL_11;
      case 1:
      case 2:
        v6 = v13;
        v6.i32[2] = 0.5;
        goto LABEL_11;
      case 3:
        v6 = v13;
LABEL_11:
        result = (simd_float3)vaddq_f32(v6, v6);
        if (v5)
          goto LABEL_12;
        return result;
      default:
        __asm { FMOV            V0.4S, #1.0; jumptable 00000001DCE2DF90 default case }
        if (!v5)
          return result;
LABEL_12:
        v11 = result;
        C3DSceneUnlock(v5);
        result = v11;
        break;
    }
  }
  else
  {
    return *(simd_float3 *)self->_areaExtents;
  }
  return result;
}

- (void)setAreaExtents:(simd_float3)areaExtents
{
  uint32x4_t v3;
  __C3DScene *v5;
  _QWORD v6[5];

  v3 = (uint32x4_t)vceqq_f32(*(float32x4_t *)self->_areaExtents, (float32x4_t)areaExtents);
  v3.i32[3] = v3.i32[2];
  if ((vminvq_u32(v3) & 0x80000000) == 0)
  {
    *(simd_float3 *)self->_areaExtents = areaExtents;
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __27__SCNLight_setAreaExtents___block_invoke;
    v6[3] = &unk_1EA59E4A0;
    v6[4] = self;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

void __27__SCNLight_setAreaExtents___block_invoke(uint64_t a1)
{
  _SCNLightUpdateC3DLightDescription(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336), *(void **)(*(_QWORD *)(a1 + 32) + 368), *(float32x4_t *)(*(_QWORD *)(a1 + 32) + 352));
}

- (BOOL)drawsArea
{
  __C3DScene *v4;
  uint64_t v5;
  char DrawsArea;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_drawsArea;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  if (!v4)
    return C3DLightGetDrawsArea((uint64_t)self->_light);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  DrawsArea = C3DLightGetDrawsArea((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return DrawsArea;
}

- (void)setDrawsArea:(BOOL)drawsArea
{
  __C3DScene *v5;
  _QWORD v6[5];
  BOOL v7;

  if (self->_drawsArea != drawsArea)
  {
    self->_drawsArea = drawsArea;
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __25__SCNLight_setDrawsArea___block_invoke;
    v6[3] = &unk_1EA59E478;
    v6[4] = self;
    v7 = drawsArea;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

void __25__SCNLight_setDrawsArea___block_invoke(uint64_t a1)
{
  C3DLightSetDrawsArea(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)doubleSided
{
  __C3DScene *v4;
  uint64_t v5;
  char DoubleSided;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_doubleSided;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  if (!v4)
    return C3DLightGetDoubleSided((uint64_t)self->_light);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  DoubleSided = C3DLightGetDoubleSided((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return DoubleSided;
}

- (void)setDoubleSided:(BOOL)doubleSided
{
  __C3DScene *v5;
  _QWORD v6[5];
  BOOL v7;

  if (self->_doubleSided != doubleSided)
  {
    self->_doubleSided = doubleSided;
    v5 = -[SCNLight sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __27__SCNLight_setDoubleSided___block_invoke;
    v6[3] = &unk_1EA59E478;
    v6[4] = self;
    v7 = doubleSided;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

void __27__SCNLight_setDoubleSided___block_invoke(uint64_t a1, float32x4_t a2, float32x4_t a3, double a4, double a5, double a6, double a7, __n128 a8)
{
  C3DLightSetDoubleSided(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_BYTE *)(a1 + 40), a2, a3, a4, a5, a6, a7, a8);
}

- (NSArray)areaPolygonVertices
{
  NSArray *v3;
  __C3DScene *v4;
  uint64_t v5;
  _OWORD v7[2];
  __int128 v8;
  __int128 v9;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_areaPolygonVertices;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  v5 = (uint64_t)v4;
  if (v4)
    C3DSceneLock((uint64_t)v4);
  v8 = 0u;
  v9 = 0u;
  C3DLightGetAreaDescription((uint64_t)self->_light, &v8);
  v7[0] = v8;
  v7[1] = v9;
  v3 = (NSArray *)_SCNAreaLightpolygonVerticesFromDescription((uint64_t)v7);
  if (v5)
    C3DSceneUnlock(v5);
  return v3;
}

- (void)setAreaPolygonVertices:(NSArray *)areaPolygonVertices
{
  NSArray *v3;
  __C3DScene *v6;
  _QWORD v7[5];

  v3 = self->_areaPolygonVertices;
  if (v3 != areaPolygonVertices)
  {

    self->_areaPolygonVertices = (NSArray *)-[NSArray copy](areaPolygonVertices, "copy");
    v6 = -[SCNLight sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __35__SCNLight_setAreaPolygonVertices___block_invoke;
    v7[3] = &unk_1EA59E4A0;
    v7[4] = self;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __35__SCNLight_setAreaPolygonVertices___block_invoke(uint64_t a1)
{
  _SCNLightUpdateC3DLightDescription(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336), *(void **)(*(_QWORD *)(a1 + 32) + 368), *(float32x4_t *)(*(_QWORD *)(a1 + 32) + 352));
}

- (BOOL)hasGobo
{
  return self->_gobo != 0;
}

- (SCNMaterialProperty)gobo
{
  SCNMaterialProperty *result;

  result = self->_gobo;
  if (!result)
  {
    result = -[SCNMaterialProperty initWithParent:propertyType:]([SCNMaterialProperty alloc], "initWithParent:propertyType:", self, 22);
    self->_gobo = result;
  }
  if ((*((_BYTE *)self + 16) & 1) != 0)
    return (SCNMaterialProperty *)-[SCNMaterialProperty presentationMaterialProperty](result, "presentationMaterialProperty");
  return result;
}

- (NSURL)IESProfileURL
{
  __C3DScene *v4;
  uint64_t v5;
  NSURL *IESProfileURL;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_IESProfileURL;
  v4 = -[SCNLight sceneRef](self, "sceneRef");
  if (!v4)
    return (NSURL *)C3DLightGetIESProfileURL((uint64_t)self->_light);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  IESProfileURL = (NSURL *)C3DLightGetIESProfileURL((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return IESProfileURL;
}

- (void)setIESProfileURL:(id)a3 resolvedURL:(id)a4
{
  __C3DScene *v7;
  _QWORD *v8;
  _QWORD v9[5];
  _QWORD v10[6];

  self->_IESProfileURL = (NSURL *)objc_msgSend(a3, "copy");
  v7 = -[SCNLight sceneRef](self, "sceneRef");
  if (a3)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__SCNLight_setIESProfileURL_resolvedURL___block_invoke;
    v10[3] = &unk_1EA59F740;
    v10[4] = self;
    v10[5] = a4;
    v8 = v10;
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__SCNLight_setIESProfileURL_resolvedURL___block_invoke_2;
    v9[3] = &unk_1EA59E4A0;
    v9[4] = self;
    v8 = v9;
  }
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v8);
}

void __41__SCNLight_setIESProfileURL_resolvedURL___block_invoke(uint64_t a1)
{
  C3DLightSetType(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 5);
  C3DLightSetIESProfileURL(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(a1 + 40));
}

void __41__SCNLight_setIESProfileURL_resolvedURL___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 8);
  v3 = SCNLightTypeToC3DLightType(*(void **)(v1 + 48));
  C3DLightSetType(v2, v3);
}

- (void)setIESProfileURL:(NSURL *)IESProfileURL
{
  _BOOL4 v5;
  NSURL *v6;
  NSString *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;

  if (IESProfileURL)
  {
    v5 = -[NSURL isFileURL](IESProfileURL, "isFileURL");
    v6 = IESProfileURL;
    if (v5)
    {
      v7 = -[NSURL relativePath](IESProfileURL, "relativePath");
      if (!-[NSString isAbsolutePath](v7, "isAbsolutePath"))
      {
        v8 = SCNHasSpecialResourceBundle();
        v9 = (void *)SCNGetResourceBundle();
        if (v8)
          v10 = (void *)objc_msgSend(v9, "bundlePath");
        else
          v10 = (void *)objc_msgSend(v9, "resourcePath");
        v7 = (NSString *)objc_msgSend(v10, "stringByAppendingPathComponent:", v7);
      }
      v6 = IESProfileURL;
      if (v7)
        v6 = (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7, IESProfileURL);
    }
  }
  else
  {
    v6 = 0;
  }
  -[SCNLight setIESProfileURL:resolvedURL:](self, "setIESProfileURL:resolvedURL:", IESProfileURL, v6);
}

- (void)_customEncodingOfSCNLight:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;
  float v15;
  float v16;
  double maximumShadowDistance;
  double shadowCascadeSplittingFactor;

  -[SCNLight attenuationStartDistance](self, "attenuationStartDistance");
  *(float *)&v5 = v5;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("attenuationStartDistance"), v5);
  -[SCNLight attenuationEndDistance](self, "attenuationEndDistance");
  *(float *)&v6 = v6;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("attenuationEndDistance"), v6);
  -[SCNLight attenuationFalloffExponent](self, "attenuationFalloffExponent");
  *(float *)&v7 = v7;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("attenuationFalloffExponent"), v7);
  -[SCNLight spotInnerAngle](self, "spotInnerAngle");
  *(float *)&v8 = v8;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("spotInnerAngle"), v8);
  -[SCNLight spotOuterAngle](self, "spotOuterAngle");
  *(float *)&v9 = v9;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("spotOuterAngle"), v9);
  objc_msgSend(a3, "encodeInt:forKey:", (*((unsigned __int8 *)self + 16) >> 2) & 1, CFSTR("usesDeferredShadows"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_categoryBitMask, CFSTR("lightCategoryBitMask"));
  LODWORD(v10) = *((_DWORD *)&self->_spotFalloffExponent + 1);
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("spotFallOffExponent"), v10);
  if (-[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("probe")))
  {
    objc_msgSend(a3, "encodeInt:forKey:", LODWORD(self->_probeType), CFSTR("probeType"));
    objc_msgSend(a3, "encodeInt:forKey:", LODWORD(self->_probeUpdateType), CFSTR("probeUpdateType"));
    objc_msgSend(a3, "encodeBool:forKey:", self->_parallaxCorrectionEnabled, CFSTR("parallaxCorrectionEnabled"));
    LODWORD(v11) = *(_DWORD *)&self->_probeExtents[7];
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("probeExtentsX"), v11);
    LODWORD(v12) = *(_DWORD *)&self->_probeExtents[11];
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("probeExtentsY"), v12);
    LODWORD(v13) = *(_DWORD *)&self->_probeExtents[15];
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("probeExtentsZ"), v13);
    if (COERCE_FLOAT(*(_OWORD *)&self->_probeOffset[7]) == 0.0)
    {
      LODWORD(v14) = HIDWORD(*(_QWORD *)&self->_probeOffset[7]);
    }
    else
    {
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("probeOffsetX"));
      v14 = *(float *)&self->_probeOffset[11];
    }
    if (v14 != 0.0)
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("probeOffsetY"));
    if (*(float *)&self->_probeOffset[15] != 0.0)
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("probeOffsetZ"));
    if (COERCE_FLOAT(*(_OWORD *)&self->_parallaxCenterOffset[7]) == 0.0)
    {
      LODWORD(v15) = HIDWORD(*(_QWORD *)&self->_parallaxCenterOffset[7]);
    }
    else
    {
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("parallaxOffsetX"));
      v15 = *(float *)&self->_parallaxCenterOffset[11];
    }
    if (v15 != 0.0)
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("parallaxOffsetY"));
    if (*(float *)&self->_parallaxCenterOffset[15] != 0.0)
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("parallaxOffsetZ"));
    if (COERCE_FLOAT(*(_OWORD *)&self->_parallaxExtentsFactor[7]) == 1.0)
    {
      LODWORD(v16) = HIDWORD(*(_QWORD *)&self->_parallaxExtentsFactor[7]);
    }
    else
    {
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("parallaxExtentsFactorX"));
      v16 = *(float *)&self->_parallaxExtentsFactor[11];
    }
    if (v16 != 1.0)
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("parallaxExtentsFactorY"));
    if (*(float *)&self->_parallaxExtentsFactor[15] != 1.0)
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("parallaxExtentsFactorZ"));
  }
  maximumShadowDistance = self->_maximumShadowDistance;
  *(float *)&maximumShadowDistance = maximumShadowDistance;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("maximumShadowDistance"), maximumShadowDistance);
  objc_msgSend(a3, "encodeBool:forKey:", *((unsigned __int8 *)self + 16) >> 7, CFSTR("autoShadowProjection"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_shadowCascadeCount, CFSTR("shadowCascadeCount"));
  shadowCascadeSplittingFactor = self->_shadowCascadeSplittingFactor;
  *(float *)&shadowCascadeSplittingFactor = shadowCascadeSplittingFactor;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("shadowCascadeSplittingFactor"), shadowCascadeSplittingFactor);
  objc_msgSend(a3, "encodeBool:forKey:", *((_BYTE *)self + 17) & 1, CFSTR("forcesBackFaceCasters"));
  objc_msgSend(a3, "encodeBool:forKey:", (*((unsigned __int8 *)self + 17) >> 1) & 1, CFSTR("sampleDistributedShadowMaps"));
  objc_msgSend(a3, "encodeInt32:forKey:", 1, CFSTR("version"));
}

- (void)_customDecodingOfSCNLight:(id)a3
{
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;

  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("attenuationStartDistance"));
  -[SCNLight setAttenuationStartDistance:](self, "setAttenuationStartDistance:", v5);
  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("attenuationEndDistance"));
  -[SCNLight setAttenuationEndDistance:](self, "setAttenuationEndDistance:", v6);
  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("attenuationFalloffExponent"));
  -[SCNLight setAttenuationFalloffExponent:](self, "setAttenuationFalloffExponent:", v7);
  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("spotInnerAngle"));
  -[SCNLight setSpotInnerAngle:](self, "setSpotInnerAngle:", v8);
  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("spotOuterAngle"));
  -[SCNLight setSpotOuterAngle:](self, "setSpotOuterAngle:", v9);
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("maximumShadowDistance")))
  {
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("maximumShadowDistance"));
    -[SCNLight setMaximumShadowDistance:](self, "setMaximumShadowDistance:", v10);
  }
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("autoShadowProjection")))
    -[SCNLight setAutomaticallyAdjustsShadowProjection:](self, "setAutomaticallyAdjustsShadowProjection:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("autoShadowProjection")));
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("forcesBackFaceCasters")))
    -[SCNLight setForcesBackFaceCasters:](self, "setForcesBackFaceCasters:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("forcesBackFaceCasters")));
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("sampleDistributedShadowMaps")))
    -[SCNLight setSampleDistributedShadowMaps:](self, "setSampleDistributedShadowMaps:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("sampleDistributedShadowMaps")));
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("shadowCascadeCount")))
    -[SCNLight setShadowCascadeCount:](self, "setShadowCascadeCount:", (int)objc_msgSend(a3, "decodeIntForKey:", CFSTR("shadowCascadeCount")));
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("shadowCascadeSplittingFactor")))
  {
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("shadowCascadeSplittingFactor"));
    -[SCNLight setShadowCascadeSplittingFactor:](self, "setShadowCascadeSplittingFactor:", v11);
  }
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("spotFallOffExponent")))
  {
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("spotFallOffExponent"));
    -[SCNLight setSpotFalloffExponent:](self, "setSpotFalloffExponent:", v12);
  }
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("usesDeferredShadows")))
    -[SCNLight setUsesDeferredShadows:](self, "setUsesDeferredShadows:", objc_msgSend(a3, "decodeIntForKey:", CFSTR("usesDeferredShadows")) != 0);
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("lightCategoryBitMask")))
    -[SCNLight setCategoryBitMask:](self, "setCategoryBitMask:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("lightCategoryBitMask")));
}

- (void)_didDecodeSCNLight:(id)a3
{
  if (!objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("version")) && self->_shadowSampleCount == 16)
    -[SCNLight setShadowSampleCount:](self, "setShadowSampleCount:", 1);
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  NSData *sphericalHarmonics;
  NSString *name;
  NSString *type;
  id color;
  id shadowColor;
  uint64_t shadowSampleCount;
  SCNMaterialProperty *gobo;
  NSURL *IESProfileURL;
  SCNTechnique *technique;
  double v15;
  double v16;
  double v17;
  SCNMaterialProperty *probeEnvironment;

  if ((*((_BYTE *)self + 16) & 1) != 0)
    -[SCNLight _syncObjCModel](self, "_syncObjCModel");
  -[SCNLight _customEncodingOfSCNLight:](self, "_customEncodingOfSCNLight:", a3);
  objc_msgSend(a3, "encodeInt:forKey:", (*((unsigned __int8 *)self + 16) >> 1) & 1, CFSTR("castsShadow"));
  objc_msgSend(a3, "encodeInt:forKey:", (*((unsigned __int8 *)self + 16) >> 3) & 1, CFSTR("usesModulatedMode"));
  objc_msgSend(a3, "encodeInt:forKey:", (*((unsigned __int8 *)self + 16) >> 4) & 1, CFSTR("baked"));
  objc_msgSend(a3, "encodeInt:forKey:", (*((unsigned __int8 *)self + 16) >> 5) & 1, CFSTR("shouldBakeDirectLighting"));
  objc_msgSend(a3, "encodeInt:forKey:", (*((unsigned __int8 *)self + 16) >> 6) & 1, CFSTR("shouldBakeIndirectLighting"));
  sphericalHarmonics = self->_sphericalHarmonics;
  if (sphericalHarmonics)
    objc_msgSend(a3, "encodeObject:forKey:", sphericalHarmonics, CFSTR("sphericalHarmonics"));
  name = self->_name;
  if (name)
    objc_msgSend(a3, "encodeObject:forKey:", name, CFSTR("name"));
  type = self->_type;
  if (type)
    objc_msgSend(a3, "encodeObject:forKey:", type, CFSTR("type"));
  color = self->_color;
  if (color)
  {
    SCNEncodeUnsafeObjectForKey(a3, (uint64_t)color, (uint64_t)CFSTR("color"));
    SCNEncodeColor(a3, self->_color, (uint64_t)CFSTR("scncolor"));
  }
  shadowColor = self->_shadowColor;
  if (shadowColor)
  {
    SCNEncodeUnsafeObjectForKey(a3, (uint64_t)shadowColor, (uint64_t)CFSTR("shadowColor"));
    SCNEncodeColor(a3, self->_shadowColor, (uint64_t)CFSTR("scnShadowColor"));
  }
  *(float *)&v5 = self->_shadowRadius;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("shadowRadius"), v5);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("intensity"), self->_intensity);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("temperature"), self->_temperature);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("orthographicScale"), self->_orthographicScale);
  if (self->_shadowSampleCount)
    shadowSampleCount = self->_shadowSampleCount;
  else
    shadowSampleCount = 16;
  objc_msgSend(a3, "encodeInteger:forKey:", shadowSampleCount, CFSTR("shadowSampleCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_shadowSampleCount, CFSTR("shadowSampleCount2"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", self->_shadowMapSize.width, self->_shadowMapSize.height), CFSTR("shadowMapSize"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("zNear"), self->_zNear);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("zFar"), self->_zFar);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("shadowBias"), self->_shadowBias);
  gobo = self->_gobo;
  if (gobo)
    objc_msgSend(a3, "encodeObject:forKey:", gobo, CFSTR("gobo"));
  IESProfileURL = self->_IESProfileURL;
  if (IESProfileURL)
    objc_msgSend(a3, "encodeObject:forKey:", IESProfileURL, CFSTR("IESProfileURL"));
  technique = self->_technique;
  if (technique)
    objc_msgSend(a3, "encodeObject:forKey:", technique, CFSTR("technique"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_areaType, CFSTR("areaType"));
  LODWORD(v15) = *(_DWORD *)self->_areaExtents;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("areaExtentsX"), v15);
  LODWORD(v16) = *(_DWORD *)&self->_areaExtents[4];
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("areaExtentsY"), v16);
  LODWORD(v17) = *(_DWORD *)&self->_areaExtents[8];
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("areaExtentsZ"), v17);
  objc_msgSend(a3, "encodeObject:forKey:", self->_areaPolygonVertices, CFSTR("areaPolygonVertices"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_drawsArea, CFSTR("drawsArea"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_doubleSided, CFSTR("doubleSided"));
  probeEnvironment = self->_probeEnvironment;
  if (probeEnvironment)
    objc_msgSend(a3, "encodeObject:forKey:", probeEnvironment, CFSTR("probeEnvironment"));
  SCNEncodeEntity(a3, self);
  SCNEncodeAnimations(a3, self);
}

- (SCNLight)initWithCoder:(id)a3
{
  SCNLight *v4;
  _BOOL8 v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  int v18;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  float v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  double v43;
  unsigned int v44;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)SCNLight;
  v4 = -[SCNLight init](&v45, sel_init);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    v6 = C3DLightCreate();
    v4->_light = (__C3DLight *)v6;
    if (v6)
      C3DEntitySetObjCWrapper(v6, v4);
    -[SCNLight _syncObjCModel](v4, "_syncObjCModel");
    -[SCNLight setType:](v4, "setType:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type")));
    -[SCNLight _customDecodingOfSCNLight:](v4, "_customDecodingOfSCNLight:", a3);
    -[SCNLight setCastsShadow:](v4, "setCastsShadow:", objc_msgSend(a3, "decodeIntForKey:", CFSTR("castsShadow")) != 0);
    -[SCNLight setUsesModulatedMode:](v4, "setUsesModulatedMode:", objc_msgSend(a3, "decodeIntForKey:", CFSTR("usesModulatedMode")) != 0);
    -[SCNLight setBaked:](v4, "setBaked:", objc_msgSend(a3, "decodeIntForKey:", CFSTR("baked")) != 0);
    -[SCNLight setShouldBakeDirectLighting:](v4, "setShouldBakeDirectLighting:", objc_msgSend(a3, "decodeIntForKey:", CFSTR("shouldBakeDirectLighting")) != 0);
    -[SCNLight setShouldBakeIndirectLighting:](v4, "setShouldBakeIndirectLighting:", objc_msgSend(a3, "decodeIntForKey:", CFSTR("shouldBakeIndirectLighting")) != 0);
    -[SCNLight set_sphericalHarmonics:](v4, "set_sphericalHarmonics:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sphericalHarmonics")));
    -[SCNLight setName:](v4, "setName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name")));
    if (-[NSString isEqualToString:](v4->_type, "isEqualToString:", CFSTR("probe")))
    {
      -[SCNLight setProbeType:](v4, "setProbeType:", (int)objc_msgSend(a3, "decodeIntForKey:", CFSTR("probeType")));
      -[SCNLight setProbeUpdateType:](v4, "setProbeUpdateType:", (int)objc_msgSend(a3, "decodeIntForKey:", CFSTR("probeUpdateType")));
      -[SCNLight setParallaxCorrectionEnabled:](v4, "setParallaxCorrectionEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("parallaxCorrectionEnabled")));
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("probeExtentsX"));
      v40 = v7;
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("probeExtentsY"));
      v36 = v8;
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("probeExtentsZ"));
      -[SCNLight setProbeExtents:](v4, "setProbeExtents:", COERCE_DOUBLE(__PAIR64__(v36, v40)));
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("probeOffsetX"));
      v41 = v9;
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("probeOffsetX"));
      v37 = v10;
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("probeOffsetX"));
      -[SCNLight setProbeOffset:](v4, "setProbeOffset:", COERCE_DOUBLE(__PAIR64__(v37, v41)));
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("parallaxOffsetX"));
      v42 = v11;
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("parallaxOffsetY"));
      v38 = v12;
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("parallaxOffsetZ"));
      -[SCNLight setParallaxCenterOffset:](v4, "setParallaxCenterOffset:", COERCE_DOUBLE(__PAIR64__(v38, v42)));
      if (objc_msgSend(a3, "containsValueForKey:", CFSTR("parallaxExtentsFactorX")))
      {
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("parallaxExtentsFactorX"));
        __asm { FMOV            V1.4S, #1.0 }
        LODWORD(_Q1) = v18;
        *(_QWORD *)&v43 = _Q1;
      }
      else
      {
        __asm { FMOV            V0.4S, #1.0 }
        *(_QWORD *)&v43 = _Q0;
      }
      if (objc_msgSend(a3, "containsValueForKey:", CFSTR("parallaxExtentsFactorY")))
      {
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("parallaxExtentsFactorY"));
        *(_QWORD *)&v43 = __PAIR64__(v20, LODWORD(v43));
      }
      if (objc_msgSend(a3, "containsValueForKey:", CFSTR("parallaxExtentsFactorZ")))
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("parallaxExtentsFactorZ"));
      -[SCNLight setParallaxExtentsFactor:](v4, "setParallaxExtentsFactor:", v43);
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("scncolor")))
    {
      v21 = SCNDecodeColor(a3, (uint64_t)CFSTR("scncolor"));
    }
    else
    {
      v22 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
      v21 = SCNDecodeUnsafeObjectForKey(a3, (uint64_t)CFSTR("color"), v22);
    }
    -[SCNLight setColor:](v4, "setColor:", v21);
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("scnShadowColor")))
    {
      v23 = SCNDecodeColor(a3, (uint64_t)CFSTR("scnShadowColor"));
    }
    else
    {
      v24 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
      v23 = SCNDecodeUnsafeObjectForKey(a3, (uint64_t)CFSTR("shadowColor"), v24);
    }
    -[SCNLight setShadowColor:](v4, "setShadowColor:", v23);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("shadowRadius"));
    -[SCNLight setShadowRadius:](v4, "setShadowRadius:", v25);
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("intensity")))
    {
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("intensity"));
      -[SCNLight setIntensity:](v4, "setIntensity:");
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("temperature")))
    {
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("temperature"));
      -[SCNLight setTemperature:](v4, "setTemperature:");
    }
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("orthographicScale"));
    -[SCNLight setOrthographicScale:](v4, "setOrthographicScale:");
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("shadowSampleCount2")))
    {
      v26 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("shadowSampleCount2"));
    }
    else
    {
      v27 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("shadowSampleCount"));
      if (v27 == 16)
        v26 = 0;
      else
        v26 = v27;
    }
    -[SCNLight setShadowSampleCount:](v4, "setShadowSampleCount:", v26);
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shadowMapSize")), "CGSizeValue");
    -[SCNLight setShadowMapSize:](v4, "setShadowMapSize:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("zNear"));
    -[SCNLight setZNear:](v4, "setZNear:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("zFar"));
    -[SCNLight setZFar:](v4, "setZFar:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("shadowBias"));
    -[SCNLight setShadowBias:](v4, "setShadowBias:");
    v4->_gobo = (SCNMaterialProperty *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gobo"));
    v4->_probeEnvironment = (SCNMaterialProperty *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("probeEnvironment"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("IESProfileURL")))
    {
      v28 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IESProfileURL"));
      if (objc_msgSend(v28, "isFileURL")
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (v29 = (void *)objc_msgSend(v28, "relativePath"), (objc_msgSend(v29, "isAbsolutePath") & 1) == 0)
        && (v30 = objc_msgSend((id)objc_msgSend(a3, "documentEnclosingURL"), "URLByAppendingPathComponent:", v29)) != 0)
      {
        -[SCNLight setIESProfileURL:resolvedURL:](v4, "setIESProfileURL:resolvedURL:", v28, v30);
      }
      else
      {
        -[SCNLight setIESProfileURL:](v4, "setIESProfileURL:", v28);
      }
    }
    -[SCNLight setTechnique:](v4, "setTechnique:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("technique")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("areaType")))
    {
      -[SCNLight setAreaType:](v4, "setAreaType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("areaType")));
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("areaExtentsX"));
      v44 = v31;
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("areaExtentsY"));
      v39 = v32;
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("areaExtentsZ"));
      -[SCNLight setAreaExtents:](v4, "setAreaExtents:", COERCE_DOUBLE(__PAIR64__(v39, v44)));
      -[SCNLight setAreaPolygonVertices:](v4, "setAreaPolygonVertices:", objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("areaPolygonVertices")));
      -[SCNLight setDrawsArea:](v4, "setDrawsArea:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("drawsArea")));
      v33 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("doubleSided"));
    }
    else
    {
      -[SCNLight setAreaType:](v4, "setAreaType:", 4);
      __asm { FMOV            V0.4S, #1.0 }
      -[SCNLight setAreaExtents:](v4, "setAreaExtents:", *(double *)&_Q0);
      -[SCNLight setAreaPolygonVertices:](v4, "setAreaPolygonVertices:", 0);
      -[SCNLight setDrawsArea:](v4, "setDrawsArea:", 1);
      v33 = 0;
    }
    -[SCNLight setDoubleSided:](v4, "setDoubleSided:", v33);
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    SCNDecodeEntity(a3, v4);
    SCNDecodeAnimations(a3, v4);
    -[SCNLight _didDecodeSCNLight:](v4, "_didDecodeSCNLight:", a3);
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
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

- (void)__removeAnimation:(uint64_t)a3 forKey:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. __removeAnimationForKey: cftype is not an entity", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setAttenuationEndDistance:.cold.1()
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

- (void)setAttenuationFalloffExponent:.cold.1()
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

- (void)setAttenuationStartDistance:.cold.1()
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

- (void)setBaked:.cold.1()
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

- (void)setCastsShadow:.cold.1()
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

- (void)setCategoryBitMask:.cold.1()
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

- (void)setColor:.cold.1()
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

- (void)setIntensity:.cold.1()
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

- (void)setOrthographicScale:.cold.1()
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

- (void)setShadowBias:.cold.1()
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

- (void)setShadowColor:.cold.1()
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

- (void)setShadowMapSize:.cold.1()
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

- (void)setShadowRadius:.cold.1()
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

- (void)setShadowSampleCount:.cold.1()
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

- (void)setSpotFalloffExponent:.cold.1()
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

- (void)setSpotInnerAngle:.cold.1()
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

- (void)setSpotOuterAngle:.cold.1()
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

- (void)setTechnique:.cold.1()
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

- (void)setTemperature:.cold.1()
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

- (void)setType:.cold.1()
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

- (void)setUsesDeferredShadows:.cold.1()
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

- (void)setUsesModulatedMode:.cold.1()
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

- (void)setZFar:.cold.1()
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

- (void)setZNear:.cold.1()
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

- (void)setShadowCascadeCount:.cold.1()
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

- (void)setAutomaticallyAdjustsShadowProjection:.cold.1()
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

- (void)setMaximumShadowDistance:.cold.1()
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

- (void)setForcesBackFaceCasters:.cold.1()
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

- (void)setSampleDistributedShadowMaps:.cold.1()
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

- (void)setShadowCascadeSplittingFactor:.cold.1()
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

- (void)set_shadowCascadeDebugFactor:.cold.1()
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
