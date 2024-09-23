@implementation SCNCamera

- (__C3DCamera)cameraRef
{
  uint64_t v0;

  return *(__C3DCamera **)(v0 + 8);
}

- (void)_syncEntityObjCModel
{
  void *v3;

  v3 = -[SCNCamera __CFObject](self, "__CFObject");

  self->_name = (NSString *)(id)C3DEntityGetName((uint64_t)v3);
}

- (void)__CFObject
{
  return self->_camera;
}

- (void)_syncObjCModel
{
  __C3DScene *v3;
  uint64_t v4;
  char v5;
  uint64_t ProjectionInfosPtr;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  double XFov;
  uint64_t v14;
  float Fov;
  float v16;
  float v17;
  uint64_t v18;
  float YFov;
  _BYTE *v20;
  char v21;

  v3 = -[SCNCamera sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  *(float *)&self->_categoryBitMask = C3DCameraGetAspectRatio((uint64_t)self->_camera);
  self->_sensorSize = C3DCameraGetSensorSize((uint64_t)self->_camera);
  *(double *)&self->_lensShift[4] = C3DCameraGetLensShift((uint64_t)self->_camera);
  *(double *)&self->_postProjectionTransformTranslation[4] = C3DCameraGetPostProjectionTransformTranslation((uint64_t)self->_camera);
  *(double *)&self->_postProjectionTransformScale[4] = C3DCameraGetPostProjectionTransformScale((uint64_t)self->_camera);
  if (C3DCameraUsesLegacyFov((uint64_t)self->_camera))
    v5 = 4;
  else
    v5 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xFB | v5;
  ProjectionInfosPtr = C3DCameraGetProjectionInfosPtr((uint64_t)self->_camera);
  self->_orthographicScale = C3DProjectionInfosGetOrthographicScale(ProjectionInfosPtr);
  v7 = C3DCameraGetProjectionInfosPtr((uint64_t)self->_camera);
  self->_zFar = C3DProjectionInfosGetZFar(v7);
  v8 = C3DCameraGetProjectionInfosPtr((uint64_t)self->_camera);
  self->_zNear = C3DProjectionInfosGetZNear(v8);
  *(float *)&self->_bladeCount = C3DCameraGetDepthOfFieldIntensity((uint64_t)self->_camera);
  self->_focalLength = C3DCameraGetFocalLength((uint64_t)self->_camera);
  self->_dofIntensity = C3DCameraGetFocusDistance((uint64_t)self->_camera);
  self->_focusDistance = C3DCameraGetFStop((uint64_t)self->_camera);
  self->_focalBlurSampleCount = (int)C3DCameraGetBladeCount((uint64_t)self->_camera);
  *(_QWORD *)&self->_aspectRatio = (int)C3DCameraGetDofSampleCount((uint64_t)self->_camera);
  *(_QWORD *)&self->_projectionTransform.m11 = C3DCameraGetCategoryBitMask((uint64_t)self->_camera);
  LOBYTE(self->_averageGray) = C3DCameraGetWantsHDR((uint64_t)self->_camera);
  self->_exposureOffset = C3DCameraGetWhitePoint((uint64_t)self->_camera);
  self->_minimumExposure = C3DCameraGetAverageGray((uint64_t)self->_camera);
  LOBYTE(self->_exposureAdaptationBrighteningSpeedFactor) = C3DCameraGetWantsExposureAdaptation((uint64_t)self->_camera);
  self->_maximumExposure = C3DCameraGetExposureOffset((uint64_t)self->_camera);
  self->_exposureAdaptationDarkeningSpeedFactor = C3DCameraGetExposureAdaptationDuration((uint64_t)self->_camera);
  *(float *)&self->_exposureAdaptationHistogramRangeHighProbability = C3DCameraGetExposureAdaptationBrighteningSpeedFactor((uint64_t)self->_camera);
  *((float *)&self->_exposureAdaptationHistogramRangeHighProbability + 1) = C3DCameraGetExposureAdaptationDarkeningSpeedFactor((uint64_t)self->_camera);
  *(double *)&self->_exposureAdaptationMode = C3DCameraGetExposureAdaptationHistogramRangeLowProbability((uint64_t)self->_camera);
  self->_exposureAdaptationHistogramRangeLowProbability = C3DCameraGetExposureAdaptationHistogramRangeHighProbability((uint64_t)self->_camera);
  *(_QWORD *)&self->_bloomIntensity = C3DCameraGetExposureAdaptationMode((uint64_t)self->_camera);
  if (C3DCameraGetFovIsHorizontal((uint64_t)self->_camera))
    v9 = 64;
  else
    v9 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xBF | v9;
  v10 = C3DCameraUsesLegacyFov((uint64_t)self->_camera);
  v11 = *((_BYTE *)self + 16);
  if ((v10 & 1) != 0)
  {
    *((_BYTE *)self + 16) = v11 | 4;
    v12 = C3DCameraGetProjectionInfosPtr((uint64_t)self->_camera);
    XFov = C3DProjectionInfosGetXFov(v12);
    if ((v11 & 1) != 0)
    {
      v17 = XFov;
      self->_xFov = v17;
      v18 = C3DCameraGetProjectionInfosPtr((uint64_t)self->_camera);
      YFov = C3DProjectionInfosGetYFov(v18);
      self->_yFov = YFov;
    }
    else
    {
      -[SCNCamera setXFov:](self, "setXFov:", XFov);
      v14 = C3DCameraGetProjectionInfosPtr((uint64_t)self->_camera);
      -[SCNCamera setYFov:](self, "setYFov:", C3DProjectionInfosGetYFov(v14));
    }
  }
  else
  {
    *((_BYTE *)self + 16) = v11 & 0xFB;
    Fov = C3DCameraGetFov((uint64_t)self->_camera);
    self->_fieldOfView = Fov;
    if ((*((_BYTE *)self + 16) & 0x40) != 0)
      v16 = 0.0;
    else
      v16 = Fov;
    if ((*((_BYTE *)self + 16) & 0x40) == 0)
      Fov = 0.0;
    self->_xFov = Fov;
    self->_yFov = v16;
  }
  *(float *)&self->_wantsExposureAdaptation = C3DCameraGetMinimumExposure((uint64_t)self->_camera);
  self->_exposureAdaptationDuration = C3DCameraGetMaximumExposure((uint64_t)self->_camera);
  *(float *)&self->_bloomIteration = C3DCameraGetBloomIntensity((uint64_t)self->_camera);
  self->_bloomIterationSpread = C3DCameraGetBloomThreshold((uint64_t)self->_camera);
  LODWORD(self->_bloomBlurRadius) = C3DCameraGetBloomIteration((uint64_t)self->_camera);
  self->_motionBlurIntensity = C3DCameraGetBloomIterationSpread((uint64_t)self->_camera);
  self->_vignettingPower = C3DCameraGetBloomBlurRadius((uint64_t)self->_camera);
  self->_vignettingIntensity = C3DCameraGetMotionBlurIntensity((uint64_t)self->_camera);
  self->_colorFringeStrength = C3DCameraGetVignettingPower((uint64_t)self->_camera);
  self->_colorFringeIntensity = C3DCameraGetVignettingIntensity((uint64_t)self->_camera);
  self->_saturation = C3DCameraGetColorFringeStrength((uint64_t)self->_camera);
  self->_contrast = C3DCameraGetColorFringeIntensity((uint64_t)self->_camera);
  self->_grainIntensity = C3DCameraGetSaturation((uint64_t)self->_camera);
  self->_grainScale = C3DCameraGetContrast((uint64_t)self->_camera);
  *(float *)&self->_grainIsColored = C3DCameraGetGrainIntensity((uint64_t)self->_camera);
  self->_whiteBalanceTemperature = C3DCameraGetGrainScale((uint64_t)self->_camera);
  LOBYTE(self->_whiteBalanceTint) = C3DCameraGetGrainIsColored((uint64_t)self->_camera);
  *(float *)&self[1].super.isa = C3DCameraGetARGrainSlice((uint64_t)self->_camera);
  *(_QWORD *)&self->_grainSlice = C3DCameraGetARGrainTexture((uint64_t)self->_camera);
  *(&self->_whiteBalanceTint + 1) = C3DCameraGetWhiteBalanceTemperature((uint64_t)self->_camera);
  self->_screenSpaceAmbientOcclusion.intensity = C3DCameraGetWhiteBalanceTint((uint64_t)self->_camera);
  self->_screenSpaceAmbientOcclusion.bias = C3DCameraGetScreenSpaceAmbientOcclusionIntensity((uint64_t)self->_camera);
  self->_screenSpaceAmbientOcclusion.depthThreshold = C3DCameraGetScreenSpaceAmbientOcclusionRadius((uint64_t)self->_camera);
  self->_screenSpaceAmbientOcclusion.normalThreshold = C3DCameraGetScreenSpaceAmbientOcclusionBias((uint64_t)self->_camera);
  *(&self->_screenSpaceAmbientOcclusion.normalThreshold + 1) = C3DCameraGetScreenSpaceAmbientOcclusionDepthThreshold((uint64_t)self->_camera);
  *(float *)&self->_screenSpaceAmbientOcclusion.sampleCount = C3DCameraGetScreenSpaceAmbientOcclusionNormalThreshold((uint64_t)self->_camera);
  self->_screenSpaceAmbientOcclusion.downSample = (int)C3DCameraGetScreenSpaceAmbientOcclusionSampleCount((uint64_t)self->_camera);
  self->_grainTexture = (MTLTexture *)(int)C3DCameraGetScreenSpaceAmbientOcclusionDownSample((uint64_t)self->_camera);
  v20 = (_BYTE *)C3DCameraGetProjectionInfosPtr((uint64_t)self->_camera);
  if (C3DProjectionInfosGetOrtho(v20))
    v21 = 8;
  else
    v21 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xF7 | v21;
  -[SCNCamera _updateFocalLength](self, "_updateFocalLength");
  -[SCNCamera _syncEntityObjCModel](self, "_syncEntityObjCModel");
  if (v4)
    C3DSceneUnlock(v4);
}

- (__C3DScene)sceneRef
{
  return (__C3DScene *)C3DGetScene((_QWORD *)-[SCNCamera __CFObject](self, "__CFObject"));
}

- (void)_updateFocalLength
{
  float v3;
  double v4;
  float v5;

  v3 = self->_fieldOfView / 180.0 * 3.14159265;
  v4 = self->_sensorSize * 0.5;
  v5 = v4 / tanf(v3 * 0.5);
  self->_focalLength = v5;
}

+ (SCNCamera)camera
{
  return (SCNCamera *)objc_alloc_init((Class)a1);
}

- (SCNCamera)init
{
  SCNCamera *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNCamera;
  v2 = -[SCNCamera init](&v5, sel_init);
  if (v2)
  {
    v3 = C3DCameraCreate();
    v2->_camera = (__C3DCamera *)v3;
    if (v3)
      C3DEntitySetObjCWrapper(v3, v2);
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    -[SCNCamera _syncObjCModel](v2, "_syncObjCModel");
  }
  return v2;
}

+ (SCNCamera)cameraWithMDLCamera:(MDLCamera *)mdlCamera
{
  SCNCamera *v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  float v17;
  float v18;
  uint64_t i;
  float v20;
  double v21;
  void *v22;

  v4 = (SCNCamera *)objc_msgSend(a1, "camera");
  -[MDLCamera focalLength](mdlCamera, "focalLength");
  -[SCNCamera setFocalLength:](v4, "setFocalLength:", v5);
  -[MDLCamera sensorVerticalAperture](mdlCamera, "sensorVerticalAperture");
  -[SCNCamera setSensorHeight:](v4, "setSensorHeight:", v6);
  -[MDLCamera fStop](mdlCamera, "fStop");
  -[SCNCamera setFStop:](v4, "setFStop:", v7);
  -[MDLCamera focusDistance](mdlCamera, "focusDistance");
  -[SCNCamera setFocusDistance:](v4, "setFocusDistance:", v8);
  -[MDLCamera sensorAspect](mdlCamera, "sensorAspect");
  -[SCNCamera setAspectRatio:](v4, "setAspectRatio:", v9);
  -[SCNCamera setApertureBladeCount:](v4, "setApertureBladeCount:", -[MDLCamera apertureBladeCount](mdlCamera, "apertureBladeCount"));
  -[MDLCamera nearVisibilityDistance](mdlCamera, "nearVisibilityDistance");
  -[SCNCamera setZNear:](v4, "setZNear:", v10);
  -[MDLCamera farVisibilityDistance](mdlCamera, "farVisibilityDistance");
  -[SCNCamera setZFar:](v4, "setZFar:", v11);
  -[SCNCamera setFocalBlurRadius:](v4, "setFocalBlurRadius:", 0.0);
  -[SCNCamera setUsesOrthographicProjection:](v4, "setUsesOrthographicProjection:", -[MDLCamera projection](mdlCamera, "projection") == MDLCameraProjectionOrthographic);
  if (-[MDLCamera focalLengthAnimation](mdlCamera, "focalLengthAnimation"))
  {
    -[MDLCamera focalLengthAnimation](mdlCamera, "focalLengthAnimation");
    v12 = (void *)objc_opt_class();
    if (objc_msgSend(v12, "isSubclassOfClass:", objc_opt_class()))
    {
      v13 = (void *)-[MDLCamera focalLengthAnimation](mdlCamera, "focalLengthAnimation");
      v14 = (void *)objc_msgSend(v13, "values");
      v15 = objc_msgSend(v14, "count");
      v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v15);
      -[MDLCamera sensorVerticalAperture](mdlCamera, "sensorVerticalAperture");
      if (v15)
      {
        v18 = v17;
        for (i = 0; i != v15; ++i)
        {
          objc_msgSend((id)objc_msgSend(v14, "objectAtIndex:", i), "floatValue");
          *(float *)&v21 = (float)(atanf(v18 / (float)(v20 + v20)) * 360.0) / 3.1416;
          objc_msgSend(v16, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21));
        }
      }
      v22 = (void *)objc_msgSend(MEMORY[0x1E0CD2798], "animation");
      objc_msgSend(v22, "setKeyPath:", CFSTR("fieldOfView"));
      objc_msgSend(v22, "setValues:", v16);
      objc_msgSend(v22, "setKeyTimes:", objc_msgSend(v13, "keyTimes"));
      objc_msgSend(v13, "duration");
      objc_msgSend(v22, "setDuration:");
      objc_msgSend(v22, "setUsesSceneTimeBase:", 1);
      objc_msgSend(v22, "setRemovedOnCompletion:", 0);
      -[SCNCamera addAnimation:forKey:](v4, "addAnimation:forKey:", v22, 0);
    }
  }
  if (-[MDLCamera focalDistanceAnimation](mdlCamera, "focalDistanceAnimation"))
    -[SCNCamera addAnimation:forKey:](v4, "addAnimation:forKey:", -[MDLCamera focalDistanceAnimation](mdlCamera, "focalDistanceAnimation"), CFSTR("focalDistance"));
  if (-[MDLCamera fStopAnimation](mdlCamera, "fStopAnimation"))
    -[SCNCamera addAnimation:forKey:](v4, "addAnimation:forKey:", -[MDLCamera fStopAnimation](mdlCamera, "fStopAnimation"), CFSTR("fstop"));
  return v4;
}

- (SCNCamera)initWithCameraRef:(__C3DCamera *)a3
{
  SCNCamera *v4;
  __C3DCamera *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNCamera;
  v4 = -[SCNCamera init](&v7, sel_init);
  if (v4)
  {
    v5 = (__C3DCamera *)CFRetain(a3);
    v4->_camera = v5;
    if (v5)
      C3DEntitySetObjCWrapper((uint64_t)v5, v4);
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    -[SCNCamera _syncObjCModel](v4, "_syncObjCModel");
    -[SCNCamera _syncObjCAnimations](v4, "_syncObjCAnimations");
  }
  return v4;
}

- (id)initPresentationCameraWithCameraRef:(__C3DCamera *)a3
{
  SCNCamera *v4;
  SCNCamera *v5;
  __C3DCamera *v6;
  char v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCNCamera;
  v4 = -[SCNCamera init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)v4 + 16) |= 1u;
    v6 = (__C3DCamera *)CFRetain(a3);
    v5->_camera = v6;
    if (C3DCameraUsesLegacyFov((uint64_t)v6))
      v7 = 4;
    else
      v7 = 0;
    *((_BYTE *)v5 + 16) = *((_BYTE *)v5 + 16) & 0xFB | v7;
    v5->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (SCNCamera)cameraWithCameraRef:(__C3DCamera *)a3
{
  SCNCamera *result;

  result = (SCNCamera *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
    return (SCNCamera *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithCameraRef:", a3);
  return result;
}

- (void)dealloc
{
  __C3DCamera *camera;
  objc_super v4;
  _QWORD v5[5];

  camera = self->_camera;
  if (camera)
  {
    if ((*((_BYTE *)self + 16) & 1) == 0)
    {
      C3DEntitySetObjCWrapper((uint64_t)camera, 0);
      camera = self->_camera;
    }
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __20__SCNCamera_dealloc__block_invoke;
    v5[3] = &__block_descriptor_40_e8_v16__0d8l;
    v5[4] = camera;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, 0, v5);
  }

  objc_msgSend(*(id *)&self->_wantsHDR, "parentWillDie:", self);
  v4.receiver = self;
  v4.super_class = (Class)SCNCamera;
  -[SCNCamera dealloc](&v4, sel_dealloc);
}

void __20__SCNCamera_dealloc__block_invoke(uint64_t a1)
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

  v3 = -[NSString length](-[SCNCamera name](self, "name"), "length");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  if (v3)
    return (NSString *)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p '%@'>"), v6, self, -[SCNCamera name](self, "name"));
  else
    return (NSString *)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p>"), v6, self, v8);
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
      -[SCNCamera setName:].cold.1();
  }
  else if ((unint64_t)name | (unint64_t)self->_name)
  {
    if ((-[NSString isEqual:](name, "isEqual:") & 1) == 0)
    {

      self->_name = (NSString *)-[NSString copy](name, "copy");
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __21__SCNCamera_setName___block_invoke;
      v7[3] = &unk_1EA59F740;
      v7[4] = self;
      v7[5] = name;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
    }
  }
}

CFStringRef __21__SCNCamera_setName___block_invoke(uint64_t a1)
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
  v4 = -[SCNCamera sceneRef](self, "sceneRef");
  v5 = (uint64_t)v4;
  if (v4)
    C3DSceneLock((uint64_t)v4);
  Name = (NSString *)C3DEntityGetName((uint64_t)-[SCNCamera __CFObject](self, "__CFObject"));
  if (v5)
    C3DSceneUnlock(v5);
  return Name;
}

- (void)setIdentifier:(id)a3
{
  C3DEntitySetID((uint64_t)-[SCNCamera __CFObject](self, "__CFObject"), a3);
}

- (id)identifier
{
  return (id)C3DEntityGetID((uint64_t)-[SCNCamera __CFObject](self, "__CFObject"));
}

- (id)scene
{
  id result;

  result = -[SCNCamera sceneRef](self, "sceneRef");
  if (result)
    return C3DEntityGetObjCWrapper((id *)result);
  return result;
}

- (__C3DAnimationManager)animationManager
{
  __C3DAnimationManager *result;

  result = -[SCNCamera sceneRef](self, "sceneRef");
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
    v9 = -[SCNCamera __CFObject](self, "__CFObject");
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
    v8 = -[SCNCamera sceneRef](self, "sceneRef");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __39__SCNCamera_addAnimationPlayer_forKey___block_invoke;
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

void __39__SCNCamera_addAnimationPlayer_forKey___block_invoke(id *a1)
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
    -[SCNCamera addAnimationPlayer:forKey:](self, "addAnimationPlayer:forKey:", v7, v5);
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
  -[SCNCamera addAnimation:forKey:](self, "addAnimation:forKey:", a3, 0);
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
  v4 = -[SCNCamera sceneRef](self, "sceneRef");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__SCNCamera_removeAllAnimations__block_invoke;
  v5[3] = &unk_1EA59E4A0;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v4, self, v5);
}

void __32__SCNCamera_removeAllAnimations__block_invoke(uint64_t a1)
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
  v6 = -[SCNCamera sceneRef](self, "sceneRef");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SCNCamera_removeAllAnimationsWithBlendOutDuration___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
}

void __53__SCNCamera_removeAllAnimationsWithBlendOutDuration___block_invoke(uint64_t a1)
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
    v6 = -[SCNCamera sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __35__SCNCamera_removeAnimationForKey___block_invoke;
    v7[3] = &unk_1EA59F740;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __35__SCNCamera_removeAnimationForKey___block_invoke(uint64_t a1)
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
    v8 = -[SCNCamera sceneRef](self, "sceneRef");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__SCNCamera_removeAnimationForKey_blendOutDuration___block_invoke;
    v9[3] = &unk_1EA59E2B0;
    v9[4] = self;
    v9[5] = a3;
    *(double *)&v9[6] = a4;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, self, v9);
  }
}

void __52__SCNCamera_removeAnimationForKey_blendOutDuration___block_invoke(uint64_t a1)
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

  v3 = -[SCNCamera sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(SCNOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  v5 = -[SCNCamera __CFObject](self, "__CFObject");
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

  v3 = -[SCNCamera _scnAnimationForKey:](self, "_scnAnimationForKey:", a3);
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
        -[SCNCamera addAnimationPlayer:forKey:](self, "addAnimationPlayer:forKey:", v11, v10);

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
  v9 = -[SCNCamera __CFObject](self, "__CFObject");
  if (v9)
  {
    v10 = v9;
    v11 = -[SCNCamera animationManager](self, "animationManager");
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

  v5 = -[SCNCamera sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__SCNCamera_pauseAnimationForKey___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __34__SCNCamera_pauseAnimationForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pauseAnimation:forKey:pausedByNode:", 1, *(_QWORD *)(a1 + 40), 0);
}

- (void)resumeAnimationForKey:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  v5 = -[SCNCamera sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__SCNCamera_resumeAnimationForKey___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __35__SCNCamera_resumeAnimationForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pauseAnimation:forKey:pausedByNode:", 0, *(_QWORD *)(a1 + 40), 0);
}

- (void)setSpeed:(double)a3 forAnimationKey:(id)a4
{
  uint64_t v7;
  __C3DScene *v8;
  _QWORD v9[7];

  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("animations.%@.speed"), a4);
  v8 = -[SCNCamera sceneRef](self, "sceneRef");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__SCNCamera_setSpeed_forAnimationKey___block_invoke;
  v9[3] = &unk_1EA59E2B0;
  v9[4] = self;
  v9[5] = a4;
  *(double *)&v9[6] = a3;
  +[SCNTransaction postCommandWithContext:object:keyPath:applyBlock:](SCNTransaction, "postCommandWithContext:object:keyPath:applyBlock:", v8, self, v7, v9);
}

float __38__SCNCamera_setSpeed_forAnimationKey___block_invoke(uint64_t a1)
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

  v5 = -[SCNCamera sceneRef](self, "sceneRef");
  v6 = (uint64_t)v5;
  if (v5)
    C3DSceneLock((uint64_t)v5);
  v7 = -[SCNCamera __CFObject](self, "__CFObject");
  if (v7)
  {
    v8 = v7;
    v9 = -[SCNCamera animationManager](self, "animationManager");
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

    v15 = -[SCNCamera sceneRef](self, "sceneRef");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__SCNCamera_bindAnimatablePath_toObject_withKeyPath_options___block_invoke;
    v16[3] = &unk_1EA59F768;
    v16[4] = self;
    v16[5] = a4;
    v16[6] = a3;
    v16[7] = a5;
    v16[8] = a6;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v15, self, v16);
  }
}

void __61__SCNCamera_bindAnimatablePath_toObject_withKeyPath_options___block_invoke(uint64_t a1)
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
  v5 = -[SCNCamera sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__SCNCamera_unbindAnimatablePath___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __34__SCNCamera_unbindAnimatablePath___block_invoke(uint64_t a1)
{
  C3DEntityRemoveBindingWithKeyPath((float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject"), *(const __CFString **)(a1 + 40));
}

- (void)removeAllBindings
{
  __C3DScene *v3;
  _QWORD v4[5];

  self->_bindings = 0;
  v3 = -[SCNCamera sceneRef](self, "sceneRef");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__SCNCamera_removeAllBindings__block_invoke;
  v4[3] = &unk_1EA59E4A0;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v3, self, v4);
}

void __30__SCNCamera_removeAllBindings__block_invoke(uint64_t a1)
{
  C3DEntityRemoveAllBindings((CFTypeRef *)objc_msgSend(*(id *)(a1 + 32), "__CFObject"));
}

- (void)setTechnique:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  self->_colorGrading = (SCNMaterialProperty *)a3;
  v5 = -[SCNCamera sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__SCNCamera_setTechnique___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = a3;
  v6[5] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __26__SCNCamera_setTechnique___block_invoke(uint64_t a1)
{
  C3DCameraSetTechnique((_QWORD *)objc_msgSend(*(id *)(a1 + 40), "cameraRef"), (CFTypeRef)objc_msgSend(*(id *)(a1 + 32), "techniqueRef"));
}

- (SCNTechnique)technique
{
  __C3DScene *v4;
  uint64_t v5;
  uint64_t Technique;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return (SCNTechnique *)self->_colorGrading;
  v4 = -[SCNCamera sceneRef](self, "sceneRef");
  if (v4)
  {
    v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    Technique = C3DCameraGetTechnique((uint64_t)self->_camera);
    C3DSceneUnlock(v5);
    if (Technique)
      return +[SCNTechnique techniqueWithTechniqueRef:](SCNTechnique, "techniqueWithTechniqueRef:", Technique);
  }
  else
  {
    Technique = C3DCameraGetTechnique((uint64_t)self->_camera);
    if (Technique)
      return +[SCNTechnique techniqueWithTechniqueRef:](SCNTechnique, "techniqueWithTechniqueRef:", Technique);
  }
  return 0;
}

- (id)presentationCamera
{
  if ((*((_BYTE *)self + 16) & 1) == 0)
    return -[SCNCamera initPresentationCameraWithCameraRef:]([SCNCamera alloc], "initPresentationCameraWithCameraRef:", *((_QWORD *)self + 1));
  return self;
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (BOOL)hasCustomProjectionTransform
{
  return (*((unsigned __int8 *)self + 16) >> 1) & 1;
}

- (CGFloat)screenSpaceAmbientOcclusionIntensity
{
  float ScreenSpaceAmbientOcclusionIntensity;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      ScreenSpaceAmbientOcclusionIntensity = C3DCameraGetScreenSpaceAmbientOcclusionIntensity((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetScreenSpaceAmbientOcclusionIntensity((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_screenSpaceAmbientOcclusion.bias;
  }
  return ScreenSpaceAmbientOcclusionIntensity;
}

- (void)setScreenSpaceAmbientOcclusionIntensity:(CGFloat)screenSpaceAmbientOcclusionIntensity
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setScreenSpaceAmbientOcclusionIntensity:].cold.1();
  }
  else
  {
    v4 = screenSpaceAmbientOcclusionIntensity;
    if (self->_screenSpaceAmbientOcclusion.bias != v4)
    {
      self->_screenSpaceAmbientOcclusion.bias = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __53__SCNCamera_setScreenSpaceAmbientOcclusionIntensity___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("screenSpaceAmbientOcclusionIntensity"), v7);
    }
  }
}

void __53__SCNCamera_setScreenSpaceAmbientOcclusionIntensity___block_invoke(uint64_t a1)
{
  C3DCameraSetScreenSpaceAmbientOcclusionIntensity(*(float **)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)screenSpaceAmbientOcclusionRadius
{
  float ScreenSpaceAmbientOcclusionRadius;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      ScreenSpaceAmbientOcclusionRadius = C3DCameraGetScreenSpaceAmbientOcclusionRadius((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetScreenSpaceAmbientOcclusionRadius((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_screenSpaceAmbientOcclusion.depthThreshold;
  }
  return ScreenSpaceAmbientOcclusionRadius;
}

- (void)setScreenSpaceAmbientOcclusionRadius:(CGFloat)screenSpaceAmbientOcclusionRadius
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setScreenSpaceAmbientOcclusionRadius:].cold.1();
  }
  else
  {
    v4 = screenSpaceAmbientOcclusionRadius;
    if (self->_screenSpaceAmbientOcclusion.depthThreshold != v4)
    {
      self->_screenSpaceAmbientOcclusion.depthThreshold = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __50__SCNCamera_setScreenSpaceAmbientOcclusionRadius___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("screenSpaceAmbientOcclusionRadius"), v7);
    }
  }
}

void __50__SCNCamera_setScreenSpaceAmbientOcclusionRadius___block_invoke(uint64_t a1)
{
  C3DCameraSetScreenSpaceAmbientOcclusionRadius(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)screenSpaceAmbientOcclusionBias
{
  float ScreenSpaceAmbientOcclusionBias;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      ScreenSpaceAmbientOcclusionBias = C3DCameraGetScreenSpaceAmbientOcclusionBias((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetScreenSpaceAmbientOcclusionBias((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_screenSpaceAmbientOcclusion.normalThreshold;
  }
  return ScreenSpaceAmbientOcclusionBias;
}

- (void)setScreenSpaceAmbientOcclusionBias:(CGFloat)screenSpaceAmbientOcclusionBias
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setScreenSpaceAmbientOcclusionBias:].cold.1();
  }
  else
  {
    v4 = screenSpaceAmbientOcclusionBias;
    if (self->_screenSpaceAmbientOcclusion.normalThreshold != v4)
    {
      self->_screenSpaceAmbientOcclusion.normalThreshold = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __48__SCNCamera_setScreenSpaceAmbientOcclusionBias___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("screenSpaceAmbientOcclusionBias"), v7);
    }
  }
}

void __48__SCNCamera_setScreenSpaceAmbientOcclusionBias___block_invoke(uint64_t a1)
{
  C3DCameraSetScreenSpaceAmbientOcclusionBias(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)screenSpaceAmbientOcclusionDepthThreshold
{
  float ScreenSpaceAmbientOcclusionDepthThreshold;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      ScreenSpaceAmbientOcclusionDepthThreshold = C3DCameraGetScreenSpaceAmbientOcclusionDepthThreshold((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetScreenSpaceAmbientOcclusionDepthThreshold((uint64_t)self->_camera);
    }
  }
  else
  {
    return *(&self->_screenSpaceAmbientOcclusion.normalThreshold + 1);
  }
  return ScreenSpaceAmbientOcclusionDepthThreshold;
}

- (void)setScreenSpaceAmbientOcclusionDepthThreshold:(CGFloat)screenSpaceAmbientOcclusionDepthThreshold
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setScreenSpaceAmbientOcclusionDepthThreshold:].cold.1();
  }
  else
  {
    v4 = screenSpaceAmbientOcclusionDepthThreshold;
    if (*(&self->_screenSpaceAmbientOcclusion.normalThreshold + 1) != v4)
    {
      *(&self->_screenSpaceAmbientOcclusion.normalThreshold + 1) = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __58__SCNCamera_setScreenSpaceAmbientOcclusionDepthThreshold___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("screenSpaceAmbientOcclusionDepthThreshold"), v7);
    }
  }
}

void __58__SCNCamera_setScreenSpaceAmbientOcclusionDepthThreshold___block_invoke(uint64_t a1)
{
  C3DCameraSetScreenSpaceAmbientOcclusionDepthThreshold(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)screenSpaceAmbientOcclusionNormalThreshold
{
  float ScreenSpaceAmbientOcclusionNormalThreshold;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      ScreenSpaceAmbientOcclusionNormalThreshold = C3DCameraGetScreenSpaceAmbientOcclusionNormalThreshold((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetScreenSpaceAmbientOcclusionNormalThreshold((uint64_t)self->_camera);
    }
  }
  else
  {
    return *(float *)&self->_screenSpaceAmbientOcclusion.sampleCount;
  }
  return ScreenSpaceAmbientOcclusionNormalThreshold;
}

- (void)setScreenSpaceAmbientOcclusionNormalThreshold:(CGFloat)screenSpaceAmbientOcclusionNormalThreshold
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setScreenSpaceAmbientOcclusionNormalThreshold:].cold.1();
  }
  else
  {
    v4 = screenSpaceAmbientOcclusionNormalThreshold;
    if (*(float *)&self->_screenSpaceAmbientOcclusion.sampleCount != v4)
    {
      *(float *)&self->_screenSpaceAmbientOcclusion.sampleCount = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __59__SCNCamera_setScreenSpaceAmbientOcclusionNormalThreshold___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("screenSpaceAmbientOcclusionNormalThreshold"), v7);
    }
  }
}

void __59__SCNCamera_setScreenSpaceAmbientOcclusionNormalThreshold___block_invoke(uint64_t a1)
{
  C3DCameraSetScreenSpaceAmbientOcclusionNormalThreshold(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (int64_t)screenSpaceAmbientOcclusionSampleCount
{
  int64_t ScreenSpaceAmbientOcclusionSampleCount;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_screenSpaceAmbientOcclusion.downSample;
  v4 = -[SCNCamera sceneRef](self, "sceneRef");
  if (!v4)
    return (int)C3DCameraGetScreenSpaceAmbientOcclusionSampleCount((uint64_t)self->_camera);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ScreenSpaceAmbientOcclusionSampleCount = (int)C3DCameraGetScreenSpaceAmbientOcclusionSampleCount((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return ScreenSpaceAmbientOcclusionSampleCount;
}

- (void)setScreenSpaceAmbientOcclusionSampleCount:(int64_t)a3
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setScreenSpaceAmbientOcclusionSampleCount:].cold.1();
  }
  else if (self->_screenSpaceAmbientOcclusion.downSample != a3)
  {
    self->_screenSpaceAmbientOcclusion.downSample = a3;
    v5 = -[SCNCamera sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__SCNCamera_setScreenSpaceAmbientOcclusionSampleCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __55__SCNCamera_setScreenSpaceAmbientOcclusionSampleCount___block_invoke(uint64_t a1)
{
  C3DCameraSetScreenSpaceAmbientOcclusionSampleCount(*(_DWORD **)(*(_QWORD *)(a1 + 32) + 8), *(_DWORD *)(a1 + 40));
}

- (int64_t)screenSpaceAmbientOcclusionDownSample
{
  int64_t ScreenSpaceAmbientOcclusionDownSample;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return (int64_t)self->_grainTexture;
  v4 = -[SCNCamera sceneRef](self, "sceneRef");
  if (!v4)
    return (int)C3DCameraGetScreenSpaceAmbientOcclusionDownSample((uint64_t)self->_camera);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ScreenSpaceAmbientOcclusionDownSample = (int)C3DCameraGetScreenSpaceAmbientOcclusionDownSample((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return ScreenSpaceAmbientOcclusionDownSample;
}

- (void)setScreenSpaceAmbientOcclusionDownSample:(int64_t)a3
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setScreenSpaceAmbientOcclusionDownSample:].cold.1();
  }
  else if (self->_grainTexture != (MTLTexture *)a3)
  {
    self->_grainTexture = (MTLTexture *)a3;
    v5 = -[SCNCamera sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__SCNCamera_setScreenSpaceAmbientOcclusionDownSample___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __54__SCNCamera_setScreenSpaceAmbientOcclusionDownSample___block_invoke(uint64_t a1)
{
  C3DCameraSetScreenSpaceAmbientOcclusionDownSample(*(_DWORD **)(*(_QWORD *)(a1 + 32) + 8), *(_DWORD *)(a1 + 40));
}

- (BOOL)automaticallyAdjustsZRange
{
  unsigned int v2;
  int v3;
  __C3DScene *v5;
  uint64_t v6;
  char AutomaticallyAdjustsZRange;

  v2 = *((unsigned __int8 *)self + 16);
  if ((v2 & 1) != 0)
  {
    v5 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v5)
    {
      v6 = (uint64_t)v5;
      C3DSceneLock((uint64_t)v5);
      AutomaticallyAdjustsZRange = C3DCameraGetAutomaticallyAdjustsZRange((uint64_t)self->_camera);
      C3DSceneUnlock(v6);
      LOBYTE(v3) = AutomaticallyAdjustsZRange;
    }
    else
    {
      LOBYTE(v3) = C3DCameraGetAutomaticallyAdjustsZRange((uint64_t)self->_camera);
    }
  }
  else
  {
    return (v2 >> 4) & 1;
  }
  return v3;
}

- (void)setAutomaticallyAdjustsZRange:(BOOL)automaticallyAdjustsZRange
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
      -[SCNCamera setAutomaticallyAdjustsZRange:].cold.1();
  }
  else if (((((v4 & 0x10) == 0) ^ automaticallyAdjustsZRange) & 1) == 0)
  {
    if (automaticallyAdjustsZRange)
      v6 = 16;
    else
      v6 = 0;
    *((_BYTE *)self + 16) = v4 & 0xEF | v6;
    v7 = -[SCNCamera sceneRef](self, "sceneRef");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__SCNCamera_setAutomaticallyAdjustsZRange___block_invoke;
    v9[3] = &unk_1EA59E478;
    v9[4] = self;
    v10 = automaticallyAdjustsZRange;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v9);
  }
}

void __43__SCNCamera_setAutomaticallyAdjustsZRange___block_invoke(uint64_t a1)
{
  C3DCameraSetAutomaticallyAdjustsZRange(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (CGFloat)averageGray
{
  float AverageGray;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      AverageGray = C3DCameraGetAverageGray((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetAverageGray((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_minimumExposure;
  }
  return AverageGray;
}

- (void)setAverageGray:(CGFloat)averageGray
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setAverageGray:].cold.1();
  }
  else
  {
    v4 = averageGray;
    if (self->_minimumExposure != v4)
    {
      self->_minimumExposure = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __28__SCNCamera_setAverageGray___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("averageGray"), v7);
    }
  }
}

void __28__SCNCamera_setAverageGray___block_invoke(uint64_t a1)
{
  C3DCameraSetAverageGray(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)bloomBlurRadius
{
  float BloomBlurRadius;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      BloomBlurRadius = C3DCameraGetBloomBlurRadius((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetBloomBlurRadius((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_vignettingPower;
  }
  return BloomBlurRadius;
}

- (void)setBloomBlurRadius:(CGFloat)bloomBlurRadius
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setBloomBlurRadius:].cold.1();
  }
  else
  {
    v4 = bloomBlurRadius;
    if (self->_vignettingPower != v4)
    {
      self->_vignettingPower = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __32__SCNCamera_setBloomBlurRadius___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("bloomBlurRadius"), v7);
    }
  }
}

void __32__SCNCamera_setBloomBlurRadius___block_invoke(uint64_t a1)
{
  C3DCameraSetBloomBlurRadius(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)bloomIntensity
{
  int bloomIteration;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      *(float *)&bloomIteration = C3DCameraGetBloomIntensity((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      *(float *)&bloomIteration = C3DCameraGetBloomIntensity((uint64_t)self->_camera);
    }
  }
  else
  {
    bloomIteration = self->_bloomIteration;
  }
  return *(float *)&bloomIteration;
}

- (void)setBloomIntensity:(CGFloat)bloomIntensity
{
  int v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  int v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setBloomIntensity:].cold.1();
  }
  else
  {
    *(float *)&v4 = bloomIntensity;
    if (*(float *)&self->_bloomIteration != *(float *)&v4)
    {
      self->_bloomIteration = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __31__SCNCamera_setBloomIntensity___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("bloomIntensity"), v7);
    }
  }
}

void __31__SCNCamera_setBloomIntensity___block_invoke(uint64_t a1)
{
  C3DCameraSetBloomIntensity(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)bloomThreshold
{
  float BloomThreshold;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      BloomThreshold = C3DCameraGetBloomThreshold((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetBloomThreshold((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_bloomIterationSpread;
  }
  return BloomThreshold;
}

- (void)setBloomThreshold:(CGFloat)bloomThreshold
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setBloomThreshold:].cold.1();
  }
  else
  {
    v4 = bloomThreshold;
    if (self->_bloomIterationSpread != v4)
    {
      self->_bloomIterationSpread = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __31__SCNCamera_setBloomThreshold___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("bloomThreshold"), v7);
    }
  }
}

void __31__SCNCamera_setBloomThreshold___block_invoke(uint64_t a1)
{
  C3DCameraSetBloomThreshold(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (NSInteger)bloomIterationCount
{
  int BloomIteration;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      BloomIteration = C3DCameraGetBloomIteration((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return (int)C3DCameraGetBloomIteration((uint64_t)self->_camera);
    }
  }
  else
  {
    return SLODWORD(self->_bloomBlurRadius);
  }
  return BloomIteration;
}

- (void)setBloomIterationCount:(NSInteger)bloomIterationCount
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setBloomIterationCount:].cold.1();
  }
  else if (LODWORD(self->_bloomBlurRadius) != bloomIterationCount)
  {
    LODWORD(self->_bloomBlurRadius) = bloomIterationCount;
    v5 = -[SCNCamera sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__SCNCamera_setBloomIterationCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = bloomIterationCount;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("bloomIteration"), v7);
  }
}

void __36__SCNCamera_setBloomIterationCount___block_invoke(uint64_t a1)
{
  C3DCameraSetBloomIteration(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_DWORD *)(a1 + 40));
}

- (CGFloat)bloomIterationSpread
{
  float BloomIterationSpread;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      BloomIterationSpread = C3DCameraGetBloomIterationSpread((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetBloomIterationSpread((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_motionBlurIntensity;
  }
  return BloomIterationSpread;
}

- (void)setBloomIterationSpread:(CGFloat)bloomIterationSpread
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setBloomIterationSpread:].cold.1();
  }
  else
  {
    v4 = bloomIterationSpread;
    if (self->_motionBlurIntensity != v4)
    {
      self->_motionBlurIntensity = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __37__SCNCamera_setBloomIterationSpread___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("bloomIterationSpread"), v7);
    }
  }
}

void __37__SCNCamera_setBloomIterationSpread___block_invoke(uint64_t a1)
{
  C3DCameraSetBloomIterationSpread(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (NSUInteger)categoryBitMask
{
  __C3DScene *v4;
  uint64_t v5;
  NSUInteger CategoryBitMask;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return *(_QWORD *)&self->_projectionTransform.m11;
  v4 = -[SCNCamera sceneRef](self, "sceneRef");
  if (!v4)
    return C3DCameraGetCategoryBitMask((uint64_t)self->_camera);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  CategoryBitMask = C3DCameraGetCategoryBitMask((uint64_t)self->_camera);
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
      -[SCNCamera setCategoryBitMask:].cold.1();
  }
  else if (*(_QWORD *)&self->_projectionTransform.m11 != categoryBitMask)
  {
    *(_QWORD *)&self->_projectionTransform.m11 = categoryBitMask;
    v5 = -[SCNCamera sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __32__SCNCamera_setCategoryBitMask___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = categoryBitMask;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __32__SCNCamera_setCategoryBitMask___block_invoke(uint64_t a1)
{
  C3DCameraSetCategoryBitMask(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40));
}

- (CGFloat)colorFringeStrength
{
  float ColorFringeStrength;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      ColorFringeStrength = C3DCameraGetColorFringeStrength((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetColorFringeStrength((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_saturation;
  }
  return ColorFringeStrength;
}

- (void)setColorFringeStrength:(CGFloat)colorFringeStrength
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setColorFringeStrength:].cold.1();
  }
  else
  {
    v4 = colorFringeStrength;
    if (self->_saturation != v4)
    {
      self->_saturation = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __36__SCNCamera_setColorFringeStrength___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("colorFringeStrength"), v7);
    }
  }
}

void __36__SCNCamera_setColorFringeStrength___block_invoke(uint64_t a1)
{
  C3DCameraSetColorFringeStrength(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)colorFringeIntensity
{
  float ColorFringeIntensity;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      ColorFringeIntensity = C3DCameraGetColorFringeIntensity((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetColorFringeIntensity((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_contrast;
  }
  return ColorFringeIntensity;
}

- (void)setColorFringeIntensity:(CGFloat)colorFringeIntensity
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setColorFringeIntensity:].cold.1();
  }
  else
  {
    v4 = colorFringeIntensity;
    if (self->_contrast != v4)
    {
      self->_contrast = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __37__SCNCamera_setColorFringeIntensity___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("colorFringeIntensity"), v7);
    }
  }
}

void __37__SCNCamera_setColorFringeIntensity___block_invoke(uint64_t a1)
{
  C3DCameraSetColorFringeIntensity(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)contrast
{
  float Contrast;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      Contrast = C3DCameraGetContrast((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetContrast((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_grainScale;
  }
  return Contrast;
}

- (void)setContrast:(CGFloat)contrast
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setContrast:].cold.1();
  }
  else
  {
    v4 = contrast;
    if (self->_grainScale != v4)
    {
      self->_grainScale = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __25__SCNCamera_setContrast___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("contrast"), v7);
    }
  }
}

void __25__SCNCamera_setContrast___block_invoke(uint64_t a1)
{
  C3DCameraSetContrast(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)grainIntensity
{
  float GrainIntensity;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      GrainIntensity = C3DCameraGetGrainIntensity((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetGrainIntensity((uint64_t)self->_camera);
    }
  }
  else
  {
    return *(float *)&self->_grainIsColored;
  }
  return GrainIntensity;
}

- (void)setGrainIntensity:(CGFloat)grainIntensity
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setGrainIntensity:].cold.1();
  }
  else
  {
    v4 = grainIntensity;
    if (*(float *)&self->_grainIsColored != v4)
    {
      *(float *)&self->_grainIsColored = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __31__SCNCamera_setGrainIntensity___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("grainIntensity"), v7);
    }
  }
}

void __31__SCNCamera_setGrainIntensity___block_invoke(uint64_t a1)
{
  C3DCameraSetGrainIntensity(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)grainScale
{
  float GrainScale;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      GrainScale = C3DCameraGetGrainScale((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetGrainScale((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_whiteBalanceTemperature;
  }
  return GrainScale;
}

- (void)setGrainScale:(CGFloat)grainScale
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setGrainScale:].cold.1();
  }
  else
  {
    v4 = grainScale;
    if (self->_whiteBalanceTemperature != v4)
    {
      self->_whiteBalanceTemperature = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __27__SCNCamera_setGrainScale___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("grainScale"), v7);
    }
  }
}

void __27__SCNCamera_setGrainScale___block_invoke(uint64_t a1)
{
  C3DCameraSetGrainScale(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (BOOL)grainIsColored
{
  __C3DScene *v4;
  uint64_t v5;
  char IsColored;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return LOBYTE(self->_whiteBalanceTint);
  v4 = -[SCNCamera sceneRef](self, "sceneRef");
  if (!v4)
    return C3DCameraGetGrainIsColored((uint64_t)self->_camera);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  IsColored = C3DCameraGetGrainIsColored((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return IsColored;
}

- (void)setGrainIsColored:(BOOL)grainIsColored
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setGrainIsColored:].cold.1();
  }
  else if (LOBYTE(self->_whiteBalanceTint) != grainIsColored)
  {
    LOBYTE(self->_whiteBalanceTint) = grainIsColored;
    v5 = -[SCNCamera sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __31__SCNCamera_setGrainIsColored___block_invoke;
    v7[3] = &unk_1EA59E478;
    v7[4] = self;
    v8 = grainIsColored;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __31__SCNCamera_setGrainIsColored___block_invoke(uint64_t a1)
{
  C3DCameraSetGrainIsColored(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (double)grainSlice
{
  float ARGrainSlice;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      ARGrainSlice = C3DCameraGetARGrainSlice((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetARGrainSlice((uint64_t)self->_camera);
    }
  }
  else
  {
    return *(float *)&self[1].super.isa;
  }
  return ARGrainSlice;
}

- (void)setGrainSlice:(double)a3
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setGrainSlice:].cold.1();
  }
  else
  {
    v4 = a3;
    if (*(float *)&self[1].super.isa != v4)
    {
      *(float *)&self[1].super.isa = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __27__SCNCamera_setGrainSlice___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, 0, v7);
    }
  }
}

void __27__SCNCamera_setGrainSlice___block_invoke(uint64_t a1)
{
  C3DCameraSetARGrainSlice(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (id)grainTexture
{
  __C3DScene *v4;
  uint64_t v5;
  void *ARGrainTexture;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return *(id *)&self->_grainSlice;
  v4 = -[SCNCamera sceneRef](self, "sceneRef");
  if (!v4)
    return (id)C3DCameraGetARGrainTexture((uint64_t)self->_camera);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ARGrainTexture = (void *)C3DCameraGetARGrainTexture((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return ARGrainTexture;
}

- (void)setGrainTexture:(id)a3
{
  id v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNCamera setGrainTexture:].cold.1();
  }
  else
  {
    v5 = *(id *)&self->_grainSlice;
    if (v5 != a3)
    {

      *(_QWORD *)&self->_grainSlice = a3;
      v6 = -[SCNCamera sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __29__SCNCamera_setGrainTexture___block_invoke;
      v8[3] = &unk_1EA59F740;
      v8[4] = self;
      v8[5] = a3;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, 0, v8);
    }
  }
}

CFTypeRef __29__SCNCamera_setGrainTexture___block_invoke(uint64_t a1)
{
  return C3DCameraSetARGrainTexture(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(CFTypeRef *)(a1 + 40));
}

- (CGFloat)whiteBalanceTemperature
{
  float WhiteBalanceTemperature;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      WhiteBalanceTemperature = C3DCameraGetWhiteBalanceTemperature((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetWhiteBalanceTemperature((uint64_t)self->_camera);
    }
  }
  else
  {
    return *(&self->_whiteBalanceTint + 1);
  }
  return WhiteBalanceTemperature;
}

- (void)setWhiteBalanceTemperature:(CGFloat)whiteBalanceTemperature
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setWhiteBalanceTemperature:].cold.1();
  }
  else
  {
    v4 = whiteBalanceTemperature;
    if (*(&self->_whiteBalanceTint + 1) != v4)
    {
      *(&self->_whiteBalanceTint + 1) = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __40__SCNCamera_setWhiteBalanceTemperature___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("whiteBalanceTemperature"), v7);
    }
  }
}

void __40__SCNCamera_setWhiteBalanceTemperature___block_invoke(uint64_t a1)
{
  C3DCameraSetWhiteBalanceTemperature(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)whiteBalanceTint
{
  float WhiteBalanceTint;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      WhiteBalanceTint = C3DCameraGetWhiteBalanceTint((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetWhiteBalanceTint((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_screenSpaceAmbientOcclusion.intensity;
  }
  return WhiteBalanceTint;
}

- (void)setWhiteBalanceTint:(CGFloat)whiteBalanceTint
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setWhiteBalanceTint:].cold.1();
  }
  else
  {
    v4 = whiteBalanceTint;
    if (self->_screenSpaceAmbientOcclusion.intensity != v4)
    {
      self->_screenSpaceAmbientOcclusion.intensity = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __33__SCNCamera_setWhiteBalanceTint___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("whiteBalanceTint"), v7);
    }
  }
}

void __33__SCNCamera_setWhiteBalanceTint___block_invoke(uint64_t a1)
{
  C3DCameraSetWhiteBalanceTint(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)exposureAdaptationBrighteningSpeedFactor
{
  float ExposureAdaptationBrighteningSpeedFactor;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      ExposureAdaptationBrighteningSpeedFactor = C3DCameraGetExposureAdaptationBrighteningSpeedFactor((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetExposureAdaptationBrighteningSpeedFactor((uint64_t)self->_camera);
    }
  }
  else
  {
    return *(float *)&self->_exposureAdaptationHistogramRangeHighProbability;
  }
  return ExposureAdaptationBrighteningSpeedFactor;
}

- (void)setExposureAdaptationBrighteningSpeedFactor:(CGFloat)exposureAdaptationBrighteningSpeedFactor
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setExposureAdaptationBrighteningSpeedFactor:].cold.1();
  }
  else
  {
    v4 = exposureAdaptationBrighteningSpeedFactor;
    if (*(float *)&self->_exposureAdaptationHistogramRangeHighProbability != v4)
    {
      *(float *)&self->_exposureAdaptationHistogramRangeHighProbability = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __57__SCNCamera_setExposureAdaptationBrighteningSpeedFactor___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("exposureAdaptationBrighteningSpeedFactor"), v7);
    }
  }
}

void __57__SCNCamera_setExposureAdaptationBrighteningSpeedFactor___block_invoke(uint64_t a1)
{
  C3DCameraSetExposureAdaptationBrighteningSpeedFactor(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)exposureAdaptationDarkeningSpeedFactor
{
  float ExposureAdaptationDarkeningSpeedFactor;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      ExposureAdaptationDarkeningSpeedFactor = C3DCameraGetExposureAdaptationDarkeningSpeedFactor((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetExposureAdaptationDarkeningSpeedFactor((uint64_t)self->_camera);
    }
  }
  else
  {
    return *((float *)&self->_exposureAdaptationHistogramRangeHighProbability + 1);
  }
  return ExposureAdaptationDarkeningSpeedFactor;
}

- (void)setExposureAdaptationDarkeningSpeedFactor:(CGFloat)exposureAdaptationDarkeningSpeedFactor
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setExposureAdaptationDarkeningSpeedFactor:].cold.1();
  }
  else
  {
    v4 = exposureAdaptationDarkeningSpeedFactor;
    if (*((float *)&self->_exposureAdaptationHistogramRangeHighProbability + 1) != v4)
    {
      *((float *)&self->_exposureAdaptationHistogramRangeHighProbability + 1) = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __55__SCNCamera_setExposureAdaptationDarkeningSpeedFactor___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("exposureAdaptationDarkeningSpeedFactor"), v7);
    }
  }
}

void __55__SCNCamera_setExposureAdaptationDarkeningSpeedFactor___block_invoke(uint64_t a1)
{
  C3DCameraSetExposureAdaptationDarkeningSpeedFactor(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (double)exposureAdaptationDuration
{
  float ExposureAdaptationDuration;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      ExposureAdaptationDuration = C3DCameraGetExposureAdaptationDuration((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetExposureAdaptationDuration((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_exposureAdaptationDarkeningSpeedFactor;
  }
  return ExposureAdaptationDuration;
}

- (void)setExposureAdaptationDuration:(double)a3
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setExposureAdaptationDuration:].cold.1();
  }
  else
  {
    v4 = a3;
    if (self->_exposureAdaptationDarkeningSpeedFactor != v4)
    {
      self->_exposureAdaptationDarkeningSpeedFactor = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __43__SCNCamera_setExposureAdaptationDuration___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("exposureAdaptationDuration"), v7);
    }
  }
}

void __43__SCNCamera_setExposureAdaptationDuration___block_invoke(uint64_t a1)
{
  C3DCameraSetExposureAdaptationDuration(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (double)exposureAdaptationHistogramRangeHighProbability
{
  double ExposureAdaptationHistogramRangeHighProbability;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_exposureAdaptationHistogramRangeLowProbability;
  v4 = -[SCNCamera sceneRef](self, "sceneRef");
  if (!v4)
    return C3DCameraGetExposureAdaptationHistogramRangeHighProbability((uint64_t)self->_camera);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ExposureAdaptationHistogramRangeHighProbability = C3DCameraGetExposureAdaptationHistogramRangeHighProbability((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return ExposureAdaptationHistogramRangeHighProbability;
}

- (void)setExposureAdaptationHistogramRangeHighProbability:(double)a3
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setExposureAdaptationHistogramRangeHighProbability:].cold.1();
  }
  else if (self->_exposureAdaptationHistogramRangeLowProbability != a3)
  {
    self->_exposureAdaptationHistogramRangeLowProbability = a3;
    v5 = -[SCNCamera sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__SCNCamera_setExposureAdaptationHistogramRangeHighProbability___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("exposureAdaptationHistogramRangeHighProbability"), v7);
  }
}

float __64__SCNCamera_setExposureAdaptationHistogramRangeHighProbability___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DCameraSetExposureAdaptationHistogramRangeHighProbability(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (double)exposureAdaptationHistogramRangeLowProbability
{
  double ExposureAdaptationHistogramRangeLowProbability;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return *(double *)&self->_exposureAdaptationMode;
  v4 = -[SCNCamera sceneRef](self, "sceneRef");
  if (!v4)
    return C3DCameraGetExposureAdaptationHistogramRangeLowProbability((uint64_t)self->_camera);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ExposureAdaptationHistogramRangeLowProbability = C3DCameraGetExposureAdaptationHistogramRangeLowProbability((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return ExposureAdaptationHistogramRangeLowProbability;
}

- (void)setExposureAdaptationHistogramRangeLowProbability:(double)a3
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setExposureAdaptationHistogramRangeLowProbability:].cold.1();
  }
  else if (*(double *)&self->_exposureAdaptationMode != a3)
  {
    *(double *)&self->_exposureAdaptationMode = a3;
    v5 = -[SCNCamera sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__SCNCamera_setExposureAdaptationHistogramRangeLowProbability___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("exposureAdaptationHistogramRangeLowProbability"), v7);
  }
}

float __63__SCNCamera_setExposureAdaptationHistogramRangeLowProbability___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DCameraSetExposureAdaptationHistogramRangeLowProbability(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (int64_t)exposureAdaptationMode
{
  int64_t ExposureAdaptationMode;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return *(_QWORD *)&self->_bloomIntensity;
  v4 = -[SCNCamera sceneRef](self, "sceneRef");
  if (!v4)
    return C3DCameraGetExposureAdaptationMode((uint64_t)self->_camera);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ExposureAdaptationMode = C3DCameraGetExposureAdaptationMode((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return ExposureAdaptationMode;
}

- (void)setExposureAdaptationMode:(int64_t)a3
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setExposureAdaptationMode:].cold.1();
  }
  else if (*(_QWORD *)&self->_bloomIntensity != a3)
  {
    *(_QWORD *)&self->_bloomIntensity = a3;
    v5 = -[SCNCamera sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__SCNCamera_setExposureAdaptationMode___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __39__SCNCamera_setExposureAdaptationMode___block_invoke(uint64_t a1)
{
  C3DCameraSetExposureAdaptationMode(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_BYTE *)(a1 + 40));
}

- (CGFloat)exposureOffset
{
  float ExposureOffset;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      ExposureOffset = C3DCameraGetExposureOffset((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetExposureOffset((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_maximumExposure;
  }
  return ExposureOffset;
}

- (void)setExposureOffset:(CGFloat)exposureOffset
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setExposureOffset:].cold.1();
  }
  else
  {
    v4 = exposureOffset;
    if (self->_maximumExposure != v4)
    {
      self->_maximumExposure = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __31__SCNCamera_setExposureOffset___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("exposureOffset"), v7);
    }
  }
}

void __31__SCNCamera_setExposureOffset___block_invoke(uint64_t a1)
{
  C3DCameraSetExposureOffset(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (BOOL)wantsDepthOfField
{
  float v2;

  -[SCNCamera dofIntensity](self, "dofIntensity");
  return v2 > 0.0;
}

- (void)setWantsDepthOfField:(BOOL)wantsDepthOfField
{
  double v3;

  LODWORD(v3) = 0;
  if (wantsDepthOfField)
    *(float *)&v3 = 1.0;
  -[SCNCamera setDofIntensity:](self, "setDofIntensity:", v3);
}

- (float)dofIntensity
{
  __C3DScene *v4;
  uint64_t v5;
  float DepthOfFieldIntensity;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return *(float *)&self->_bladeCount;
  v4 = -[SCNCamera sceneRef](self, "sceneRef");
  if (!v4)
    return C3DCameraGetDepthOfFieldIntensity((uint64_t)self->_camera);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  DepthOfFieldIntensity = C3DCameraGetDepthOfFieldIntensity((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return DepthOfFieldIntensity;
}

- (void)setDofIntensity:(float)a3
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setDofIntensity:].cold.1();
  }
  else if (*(float *)&self->_bladeCount != a3)
  {
    *(float *)&self->_bladeCount = a3;
    v5 = -[SCNCamera sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __29__SCNCamera_setDofIntensity___block_invoke;
    v7[3] = &unk_1EA5A2D30;
    v7[4] = self;
    v8 = a3;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("dofIntensity"), v7);
  }
}

void __29__SCNCamera_setDofIntensity___block_invoke(uint64_t a1)
{
  C3DCameraSetDepthOfFieldIntensity(*(float **)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)focalBlurRadius
{
  float DepthOfFieldIntensity;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      DepthOfFieldIntensity = C3DCameraGetDepthOfFieldIntensity((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetDepthOfFieldIntensity((uint64_t)self->_camera);
    }
  }
  else
  {
    return *(float *)&self->_bladeCount;
  }
  return DepthOfFieldIntensity;
}

- (CGFloat)maximumExposure
{
  float MaximumExposure;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      MaximumExposure = C3DCameraGetMaximumExposure((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetMaximumExposure((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_exposureAdaptationDuration;
  }
  return MaximumExposure;
}

- (void)setMaximumExposure:(CGFloat)maximumExposure
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setMaximumExposure:].cold.1();
  }
  else
  {
    v4 = maximumExposure;
    if (self->_exposureAdaptationDuration != v4)
    {
      self->_exposureAdaptationDuration = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __32__SCNCamera_setMaximumExposure___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("maximumExposure"), v7);
    }
  }
}

void __32__SCNCamera_setMaximumExposure___block_invoke(uint64_t a1)
{
  C3DCameraSetMaximumExposure(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)minimumExposure
{
  float MinimumExposure;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      MinimumExposure = C3DCameraGetMinimumExposure((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetMinimumExposure((uint64_t)self->_camera);
    }
  }
  else
  {
    return *(float *)&self->_wantsExposureAdaptation;
  }
  return MinimumExposure;
}

- (void)setMinimumExposure:(CGFloat)minimumExposure
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setMinimumExposure:].cold.1();
  }
  else
  {
    v4 = minimumExposure;
    if (*(float *)&self->_wantsExposureAdaptation != v4)
    {
      *(float *)&self->_wantsExposureAdaptation = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __32__SCNCamera_setMinimumExposure___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("minimumExposure"), v7);
    }
  }
}

void __32__SCNCamera_setMinimumExposure___block_invoke(uint64_t a1)
{
  C3DCameraSetMinimumExposure(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)motionBlurIntensity
{
  float MotionBlurIntensity;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      MotionBlurIntensity = C3DCameraGetMotionBlurIntensity((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetMotionBlurIntensity((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_vignettingIntensity;
  }
  return MotionBlurIntensity;
}

- (void)setMotionBlurIntensity:(CGFloat)motionBlurIntensity
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setMotionBlurIntensity:].cold.1();
  }
  else
  {
    v4 = motionBlurIntensity;
    if (self->_vignettingIntensity != v4)
    {
      self->_vignettingIntensity = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __36__SCNCamera_setMotionBlurIntensity___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("motionBlurIntensity"), v7);
    }
  }
}

void __36__SCNCamera_setMotionBlurIntensity___block_invoke(uint64_t a1)
{
  C3DCameraSetMotionBlurIntensity(*(float **)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (double)orthographicScale
{
  __C3DScene *v4;
  uint64_t v5;
  double OrthographicScale;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_orthographicScale;
  v4 = -[SCNCamera sceneRef](self, "sceneRef");
  if (!v4)
    return C3DCameraGetOrthographicScale((uint64_t)self->_camera);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  OrthographicScale = C3DCameraGetOrthographicScale((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return OrthographicScale;
}

- (void)setOrthographicScale:(double)orthographicScale
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setOrthographicScale:].cold.1();
  }
  else
  {
    *((_BYTE *)self + 16) &= ~2u;
    if (self->_orthographicScale != orthographicScale)
    {
      self->_orthographicScale = orthographicScale;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __34__SCNCamera_setOrthographicScale___block_invoke;
      v7[3] = &unk_1EA59E450;
      v7[4] = self;
      *(double *)&v7[5] = orthographicScale;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("orthographicScale"), v7);
    }
  }
}

void __34__SCNCamera_setOrthographicScale___block_invoke(uint64_t a1)
{
  C3DCameraSetOrthographicScale(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(double *)(a1 + 40));
}

- (CGFloat)saturation
{
  float Saturation;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      Saturation = C3DCameraGetSaturation((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetSaturation((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_grainIntensity;
  }
  return Saturation;
}

- (void)setSaturation:(CGFloat)saturation
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setSaturation:].cold.1();
  }
  else
  {
    v4 = saturation;
    if (self->_grainIntensity != v4)
    {
      self->_grainIntensity = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __27__SCNCamera_setSaturation___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("saturation"), v7);
    }
  }
}

void __27__SCNCamera_setSaturation___block_invoke(uint64_t a1)
{
  C3DCameraSetSaturation(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (BOOL)usesOrthographicProjection
{
  unsigned int v2;
  int v3;
  __C3DScene *v5;
  uint64_t v6;
  char UsesOrthographicProjection;

  v2 = *((unsigned __int8 *)self + 16);
  if ((v2 & 1) != 0)
  {
    v5 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v5)
    {
      v6 = (uint64_t)v5;
      C3DSceneLock((uint64_t)v5);
      UsesOrthographicProjection = C3DCameraGetUsesOrthographicProjection((uint64_t)self->_camera);
      C3DSceneUnlock(v6);
      LOBYTE(v3) = UsesOrthographicProjection;
    }
    else
    {
      LOBYTE(v3) = C3DCameraGetUsesOrthographicProjection((uint64_t)self->_camera);
    }
  }
  else
  {
    return (v2 >> 3) & 1;
  }
  return v3;
}

- (void)setUsesOrthographicProjection:(BOOL)usesOrthographicProjection
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
      -[SCNCamera setUsesOrthographicProjection:].cold.1();
  }
  else
  {
    *((_BYTE *)self + 16) = v4 & 0xFD;
    if (((((v4 & 8) == 0) ^ usesOrthographicProjection) & 1) == 0)
    {
      if (usesOrthographicProjection)
        v6 = 8;
      else
        v6 = 0;
      *((_BYTE *)self + 16) = v4 & 0xF5 | v6;
      v7 = -[SCNCamera sceneRef](self, "sceneRef");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __43__SCNCamera_setUsesOrthographicProjection___block_invoke;
      v9[3] = &unk_1EA59E478;
      v9[4] = self;
      v10 = usesOrthographicProjection;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v9);
    }
  }
}

void __43__SCNCamera_setUsesOrthographicProjection___block_invoke(uint64_t a1)
{
  C3DCameraSetUsesOrthographicProjection(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_BYTE *)(a1 + 40));
}

- (CGFloat)vignettingIntensity
{
  float VignettingIntensity;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      VignettingIntensity = C3DCameraGetVignettingIntensity((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetVignettingIntensity((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_colorFringeIntensity;
  }
  return VignettingIntensity;
}

- (void)setVignettingIntensity:(CGFloat)vignettingIntensity
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setVignettingIntensity:].cold.1();
  }
  else
  {
    v4 = vignettingIntensity;
    if (self->_colorFringeIntensity != v4)
    {
      self->_colorFringeIntensity = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __36__SCNCamera_setVignettingIntensity___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("vignettingIntensity"), v7);
    }
  }
}

void __36__SCNCamera_setVignettingIntensity___block_invoke(uint64_t a1)
{
  C3DCameraSetVignettingIntensity(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)vignettingPower
{
  float VignettingPower;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      VignettingPower = C3DCameraGetVignettingPower((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetVignettingPower((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_colorFringeStrength;
  }
  return VignettingPower;
}

- (void)setVignettingPower:(CGFloat)vignettingPower
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setVignettingPower:].cold.1();
  }
  else
  {
    v4 = vignettingPower;
    if (self->_colorFringeStrength != v4)
    {
      self->_colorFringeStrength = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __32__SCNCamera_setVignettingPower___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("vignettingPower"), v7);
    }
  }
}

void __32__SCNCamera_setVignettingPower___block_invoke(uint64_t a1)
{
  C3DCameraSetVignettingPower(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (BOOL)wantsExposureAdaptation
{
  __C3DScene *v4;
  uint64_t v5;
  char WantsExposureAdaptation;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return LOBYTE(self->_exposureAdaptationBrighteningSpeedFactor);
  v4 = -[SCNCamera sceneRef](self, "sceneRef");
  if (!v4)
    return C3DCameraGetWantsExposureAdaptation((uint64_t)self->_camera);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  WantsExposureAdaptation = C3DCameraGetWantsExposureAdaptation((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return WantsExposureAdaptation;
}

- (void)setWantsExposureAdaptation:(BOOL)wantsExposureAdaptation
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setWantsExposureAdaptation:].cold.1();
  }
  else if (LOBYTE(self->_exposureAdaptationBrighteningSpeedFactor) != wantsExposureAdaptation)
  {
    LOBYTE(self->_exposureAdaptationBrighteningSpeedFactor) = wantsExposureAdaptation;
    v5 = -[SCNCamera sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__SCNCamera_setWantsExposureAdaptation___block_invoke;
    v7[3] = &unk_1EA59E478;
    v7[4] = self;
    v8 = wantsExposureAdaptation;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __40__SCNCamera_setWantsExposureAdaptation___block_invoke(uint64_t a1)
{
  C3DCameraSetWantsExposureAdaptation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)wantsHDR
{
  __C3DScene *v4;
  uint64_t v5;
  char WantsHDR;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return LOBYTE(self->_averageGray);
  v4 = -[SCNCamera sceneRef](self, "sceneRef");
  if (!v4)
    return C3DCameraGetWantsHDR((uint64_t)self->_camera);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  WantsHDR = C3DCameraGetWantsHDR((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return WantsHDR;
}

- (void)setWantsHDR:(BOOL)wantsHDR
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setWantsHDR:].cold.1();
  }
  else if (LOBYTE(self->_averageGray) != wantsHDR)
  {
    LOBYTE(self->_averageGray) = wantsHDR;
    v5 = -[SCNCamera sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __25__SCNCamera_setWantsHDR___block_invoke;
    v7[3] = &unk_1EA59E478;
    v7[4] = self;
    v8 = wantsHDR;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __25__SCNCamera_setWantsHDR___block_invoke(uint64_t a1)
{
  C3DCameraSetWantsHDR(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(_BYTE *)(a1 + 40));
}

- (CGFloat)whitePoint
{
  float WhitePoint;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      WhitePoint = C3DCameraGetWhitePoint((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetWhitePoint((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_exposureOffset;
  }
  return WhitePoint;
}

- (void)setWhitePoint:(CGFloat)whitePoint
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setWhitePoint:].cold.1();
  }
  else
  {
    v4 = whitePoint;
    if (self->_exposureOffset != v4)
    {
      self->_exposureOffset = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __27__SCNCamera_setWhitePoint___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("whitePoint"), v7);
    }
  }
}

void __27__SCNCamera_setWhitePoint___block_invoke(uint64_t a1)
{
  C3DCameraSetWhitePoint(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (double)xFov
{
  __C3DScene *v4;
  uint64_t v5;
  double XFov;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_xFov;
  v4 = -[SCNCamera sceneRef](self, "sceneRef");
  if (!v4)
    return C3DCameraGetXFov((uint64_t)self->_camera);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  XFov = C3DCameraGetXFov((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return XFov;
}

- (void)setXFov:(double)xFov
{
  double v4;
  char v5;
  float v6;
  __C3DScene *v7;
  NSObject *v8;
  _QWORD v9[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNCamera setXFov:].cold.1();
  }
  else
  {
    if (xFov >= 1.0e-35)
      v4 = xFov;
    else
      v4 = 0.0;
    v5 = *((_BYTE *)self + 16) & 0xF9;
    *((_BYTE *)self + 16) = v5 | 4;
    if (v4 != self->_xFov)
    {
      v6 = v4;
      self->_xFov = v6;
      if (v6 != 0.0)
      {
        *((_BYTE *)self + 16) = v5 | 0x44;
        self->_fieldOfView = v6;
        -[SCNCamera _updateFocalLength](self, "_updateFocalLength");
      }
      v7 = -[SCNCamera sceneRef](self, "sceneRef");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __21__SCNCamera_setXFov___block_invoke;
      v9[3] = &unk_1EA59E450;
      v9[4] = self;
      *(double *)&v9[5] = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v7, self, CFSTR("xFov"), v9);
    }
  }
}

void __21__SCNCamera_setXFov___block_invoke(uint64_t a1)
{
  C3DCameraSetXFov(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(double *)(a1 + 40));
}

- (double)yFov
{
  __C3DScene *v4;
  uint64_t v5;
  double YFov;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_yFov;
  v4 = -[SCNCamera sceneRef](self, "sceneRef");
  if (!v4)
    return C3DCameraGetYFov((uint64_t)self->_camera);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  YFov = C3DCameraGetYFov((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return YFov;
}

- (void)setYFov:(double)yFov
{
  double v4;
  char v5;
  float v6;
  __C3DScene *v7;
  NSObject *v8;
  _QWORD v9[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNCamera setYFov:].cold.1();
  }
  else
  {
    if (yFov >= 1.0e-35)
      v4 = yFov;
    else
      v4 = 0.0;
    v5 = *((_BYTE *)self + 16) & 0xF9 | 4;
    *((_BYTE *)self + 16) = v5;
    if (v4 != self->_yFov)
    {
      v6 = v4;
      self->_yFov = v6;
      if (v6 != 0.0)
      {
        *((_BYTE *)self + 16) = v5 & 0xBD;
        self->_fieldOfView = v6;
        -[SCNCamera _updateFocalLength](self, "_updateFocalLength");
      }
      v7 = -[SCNCamera sceneRef](self, "sceneRef");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __21__SCNCamera_setYFov___block_invoke;
      v9[3] = &unk_1EA59E450;
      v9[4] = self;
      *(double *)&v9[5] = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v7, self, CFSTR("yFov"), v9);
    }
  }
}

void __21__SCNCamera_setYFov___block_invoke(uint64_t a1)
{
  C3DCameraSetYFov(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(double *)(a1 + 40));
}

- (double)zFar
{
  __C3DScene *v4;
  uint64_t v5;
  double ZFar;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_zFar;
  v4 = -[SCNCamera sceneRef](self, "sceneRef");
  if (!v4)
    return C3DCameraGetZFar((uint64_t)self->_camera);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ZFar = C3DCameraGetZFar((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return ZFar;
}

- (void)setZFar:(double)zFar
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setZFar:].cold.1();
  }
  else
  {
    *((_BYTE *)self + 16) &= ~2u;
    if (self->_zFar != zFar)
    {
      self->_zFar = zFar;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __21__SCNCamera_setZFar___block_invoke;
      v7[3] = &unk_1EA59E450;
      v7[4] = self;
      *(double *)&v7[5] = zFar;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("zFar"), v7);
    }
  }
}

void __21__SCNCamera_setZFar___block_invoke(uint64_t a1)
{
  C3DCameraSetZFar(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(double *)(a1 + 40));
}

- (double)zNear
{
  __C3DScene *v4;
  uint64_t v5;
  double ZNear;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_zNear;
  v4 = -[SCNCamera sceneRef](self, "sceneRef");
  if (!v4)
    return C3DCameraGetZNear((uint64_t)self->_camera);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ZNear = C3DCameraGetZNear((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return ZNear;
}

- (void)setZNear:(double)zNear
{
  char v4;
  double v5;
  int v6;
  NSObject *v8;
  __C3DScene *v9;
  NSObject *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  SCNCamera *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = *((_BYTE *)self + 16);
  if ((v4 & 1) != 0)
  {
    v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SCNCamera setZNear:].cold.1();
  }
  else
  {
    v5 = zNear;
    *((_BYTE *)self + 16) = v4 & 0xFD;
    v6 = v4 & 8;
    if (zNear == 0.0 && v6 == 0)
    {
      v8 = scn_default_log();
      v5 = 0.0001;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = self;
        _os_log_impl(&dword_1DCCB8000, v8, OS_LOG_TYPE_DEFAULT, "Warning: %@: zNear of 0 is not allowed", buf, 0xCu);
      }
    }
    if (v5 != self->_zNear)
    {
      self->_zNear = v5;
      v9 = -[SCNCamera sceneRef](self, "sceneRef");
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __22__SCNCamera_setZNear___block_invoke;
      v11[3] = &unk_1EA59E450;
      v11[4] = self;
      *(double *)&v11[5] = v5;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v9, self, CFSTR("zNear"), v11);
    }
  }
}

void __22__SCNCamera_setZNear___block_invoke(uint64_t a1)
{
  C3DCameraSetZNear(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(double *)(a1 + 40));
}

- (double)lensShift
{
  uint64_t v3;
  uint64_t v4;
  double LensShift;

  if ((*(_BYTE *)(a1 + 16) & 1) == 0)
    return *(double *)(a1 + 96);
  v3 = objc_msgSend((id)a1, "sceneRef");
  if (!v3)
    return C3DCameraGetLensShift(*(_QWORD *)(a1 + 8));
  v4 = v3;
  C3DSceneLock(v3);
  LensShift = C3DCameraGetLensShift(*(_QWORD *)(a1 + 8));
  C3DSceneUnlock(v4);
  return LensShift;
}

- (void)setLensShift:(SCNCamera *)self
{
  float32x2_t v2;
  float32x2_t v4;
  uint32x2_t v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNCamera setLensShift:].cold.1();
  }
  else
  {
    v4 = v2;
    v5 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_lensShift[4], v2));
    if ((vpmax_u32(v5, v5).u32[0] & 0x80000000) != 0)
    {
      *(float32x2_t *)&self->_lensShift[4] = v4;
      v6 = -[SCNCamera sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __26__SCNCamera_setLensShift___block_invoke;
      v8[3] = &unk_1EA59E450;
      v8[4] = self;
      v8[5] = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("lensShift"), v8);
    }
  }
}

void __26__SCNCamera_setLensShift___block_invoke(uint64_t a1)
{
  C3DCameraSetLensShift(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(double *)(a1 + 40));
}

- (CGAffineTransform)postProjectionTransform
{
  CGAffineTransform *v3;
  uint64_t v5;
  __int128 v6;
  CGFloat b;
  CGFloat c;
  uint64_t v9;
  uint64_t v10;
  double PostProjectionTransformScale;
  double PostProjectionTransformTranslation;

  v3 = self;
  v5 = MEMORY[0x1E0C9BAA8];
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  if ((LOBYTE(self->c) & 1) != 0)
  {
    v9 = -[CGAffineTransform sceneRef](self, "sceneRef");
    v10 = v9;
    if (v9)
      C3DSceneLock(v9);
    PostProjectionTransformTranslation = C3DCameraGetPostProjectionTransformTranslation(*(_QWORD *)&v3->b);
    PostProjectionTransformScale = C3DCameraGetPostProjectionTransformScale(*(_QWORD *)&v3->b);
    retstr->ty = *((float *)&PostProjectionTransformTranslation + 1);
    retstr->a = *(float *)&PostProjectionTransformScale;
    *(float64x2_t *)&retstr->d = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)&PostProjectionTransformScale, *(int8x8_t *)&PostProjectionTransformTranslation, 4uLL));
    if (v10)
      return (CGAffineTransform *)C3DSceneUnlock(v10);
  }
  else
  {
    b = self[2].b;
    c = self[2].c;
    retstr->ty = *((float *)&b + 1);
    retstr->a = *(float *)&c;
    *(float64x2_t *)&retstr->d = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)&c, *(int8x8_t *)&b, 4uLL));
  }
  return self;
}

- (void)setPostProjectionTransform:(CGAffineTransform *)a3
{
  float32x2_t v4;
  float64x2_t v5;
  float32x2_t v6;
  __C3DScene *v7;
  uint32x2_t v8;
  __C3DScene *v9;
  NSObject *v10;
  _QWORD v11[6];
  _QWORD v12[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SCNCamera setPostProjectionTransform:].cold.1();
  }
  else
  {
    v4 = vcvt_f32_f64(*(float64x2_t *)&a3->tx);
    v5.f64[0] = a3->a;
    v5.f64[1] = a3->d;
    v6 = vcvt_f32_f64(v5);
    *(int8x8_t *)&v5.f64[0] = vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_postProjectionTransformTranslation[4], v4));
    if ((vpmax_u32(*(uint32x2_t *)&v5.f64[0], *(uint32x2_t *)&v5.f64[0]).u32[0] & 0x80000000) != 0)
    {
      *(float32x2_t *)&self->_postProjectionTransformTranslation[4] = v4;
      v7 = -[SCNCamera sceneRef](self, "sceneRef");
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __40__SCNCamera_setPostProjectionTransform___block_invoke;
      v12[3] = &unk_1EA59E450;
      v12[4] = self;
      v12[5] = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v7, self, CFSTR("postProjectionTransformTranslation"), v12);
    }
    v8 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_postProjectionTransformScale[4], v6));
    if ((vpmax_u32(v8, v8).u32[0] & 0x80000000) != 0)
    {
      *(float32x2_t *)&self->_postProjectionTransformScale[4] = v6;
      v9 = -[SCNCamera sceneRef](self, "sceneRef");
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __40__SCNCamera_setPostProjectionTransform___block_invoke_2;
      v11[3] = &unk_1EA59E450;
      v11[4] = self;
      v11[5] = v6;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v9, self, CFSTR("postProjectionTransformScale"), v11);
    }
  }
}

void __40__SCNCamera_setPostProjectionTransform___block_invoke(uint64_t a1)
{
  C3DCameraSetPostProjectionTransformTranslation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(double *)(a1 + 40));
}

void __40__SCNCamera_setPostProjectionTransform___block_invoke_2(uint64_t a1)
{
  C3DCameraSetPostProjectionTransformScale(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(double *)(a1 + 40));
}

- (void)setPostProjectionTransformTranslation:(SCNCamera *)self
{
  float32x2_t v2;
  float32x2_t v4;
  uint32x2_t v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNCamera setPostProjectionTransformTranslation:].cold.1();
  }
  else
  {
    v4 = v2;
    v5 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_postProjectionTransformTranslation[4], v2));
    if ((vpmax_u32(v5, v5).u32[0] & 0x80000000) != 0)
    {
      *(float32x2_t *)&self->_postProjectionTransformTranslation[4] = v4;
      v6 = -[SCNCamera sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __51__SCNCamera_setPostProjectionTransformTranslation___block_invoke;
      v8[3] = &unk_1EA59E450;
      v8[4] = self;
      v8[5] = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("postProjectionTransformTranslation"), v8);
    }
  }
}

void __51__SCNCamera_setPostProjectionTransformTranslation___block_invoke(uint64_t a1)
{
  C3DCameraSetPostProjectionTransformTranslation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(double *)(a1 + 40));
}

- (void)setPostProjectionTransformScale:(SCNCamera *)self
{
  float32x2_t v2;
  float32x2_t v4;
  uint32x2_t v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNCamera setPostProjectionTransformScale:].cold.1();
  }
  else
  {
    v4 = v2;
    v5 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_postProjectionTransformScale[4], v2));
    if ((vpmax_u32(v5, v5).u32[0] & 0x80000000) != 0)
    {
      *(float32x2_t *)&self->_postProjectionTransformScale[4] = v4;
      v6 = -[SCNCamera sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __45__SCNCamera_setPostProjectionTransformScale___block_invoke;
      v8[3] = &unk_1EA59E450;
      v8[4] = self;
      v8[5] = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("postProjectionTransformScale"), v8);
    }
  }
}

void __45__SCNCamera_setPostProjectionTransformScale___block_invoke(uint64_t a1)
{
  C3DCameraSetPostProjectionTransformScale(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(double *)(a1 + 40));
}

- (void)_updateFieldOfView
{
  float focalLength;
  long double v4;
  double v5;
  float v6;

  focalLength = self->_focalLength;
  if (focalLength <= 0.0)
  {
    v5 = 3.14159274;
  }
  else
  {
    v4 = atan(self->_sensorSize * 0.5 / focalLength);
    *(float *)&v4 = v4 + v4;
    v5 = *(float *)&v4;
  }
  v6 = v5 / 3.14159265 * 180.0;
  self->_fieldOfView = v6;
  *((_BYTE *)self + 16) &= ~4u;
}

- (void)_checkSettingsConsistency
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. inconsistent physically-based camera settings", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (id)keyPathsForValuesAffectingFieldOfView
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("focalLength"), CFSTR("sensorHeight"), 0);
}

+ (id)keyPathsForValuesAffectingFocalLength
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("fieldOfView"), 0);
}

- (CGFloat)fieldOfView
{
  float Fov;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      Fov = C3DCameraGetFov((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetFov((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_fieldOfView;
  }
  return Fov;
}

- (void)setFieldOfView:(CGFloat)fieldOfView
{
  char v4;
  float v5;
  float v6;
  float v7;
  __C3DScene *v8;
  NSObject *v9;
  _QWORD v10[5];
  float v11;

  v4 = *((_BYTE *)self + 16);
  if ((v4 & 1) != 0)
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SCNCamera setFieldOfView:].cold.1();
  }
  else
  {
    *((_BYTE *)self + 16) = v4 & 0xFD;
    v5 = fieldOfView;
    if ((v4 & 4) != 0 || self->_fieldOfView != v5)
    {
      self->_fieldOfView = v5;
      *((_BYTE *)self + 16) = v4 & 0xF9;
      v6 = 0.0;
      if ((v4 & 0x40) != 0)
        v7 = 0.0;
      else
        v7 = v5;
      if ((v4 & 0x40) != 0)
        v6 = v5;
      self->_xFov = v6;
      self->_yFov = v7;
      -[SCNCamera _updateFocalLength](self, "_updateFocalLength");
      v8 = -[SCNCamera sceneRef](self, "sceneRef");
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __28__SCNCamera_setFieldOfView___block_invoke;
      v10[3] = &unk_1EA5A2D30;
      v10[4] = self;
      v11 = v5;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v8, self, CFSTR("fieldOfView"), v10);
    }
  }
}

float __28__SCNCamera_setFieldOfView___block_invoke(uint64_t a1)
{
  return C3DCameraSetFov(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)sensorHeight
{
  float SensorSize;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      SensorSize = C3DCameraGetSensorSize((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetSensorSize((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_sensorSize;
  }
  return SensorSize;
}

- (void)setSensorHeight:(CGFloat)sensorHeight
{
  char v4;
  float v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[5];
  float v9;

  v4 = *((_BYTE *)self + 16);
  if ((v4 & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNCamera setSensorHeight:].cold.1();
  }
  else
  {
    *((_BYTE *)self + 16) = v4 & 0xFD;
    v5 = sensorHeight;
    if ((v4 & 4) != 0 || self->_sensorSize != v5)
    {
      self->_sensorSize = v5;
      -[SCNCamera _updateFieldOfView](self, "_updateFieldOfView");
      v6 = -[SCNCamera sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __29__SCNCamera_setSensorHeight___block_invoke;
      v8[3] = &unk_1EA5A2D30;
      v8[4] = self;
      v9 = v5;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("sensorHeight"), v8);
    }
  }
}

float __29__SCNCamera_setSensorHeight___block_invoke(uint64_t a1)
{
  return C3DCameraSetSensorSize(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)focalLength
{
  float FocalLength;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      FocalLength = C3DCameraGetFocalLength((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetFocalLength((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_focalLength;
  }
  return FocalLength;
}

- (void)setFocalLength:(CGFloat)focalLength
{
  char v4;
  float v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[5];
  float v9;

  v4 = *((_BYTE *)self + 16);
  if ((v4 & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNCamera setFocalLength:].cold.1();
  }
  else
  {
    *((_BYTE *)self + 16) = v4 & 0xFD;
    v5 = focalLength;
    if ((v4 & 4) != 0 || self->_focalLength != v5)
    {
      self->_focalLength = v5;
      -[SCNCamera _updateFieldOfView](self, "_updateFieldOfView");
      v6 = -[SCNCamera sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __28__SCNCamera_setFocalLength___block_invoke;
      v8[3] = &unk_1EA5A2D30;
      v8[4] = self;
      v9 = v5;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("focalLength"), v8);
    }
  }
}

void __28__SCNCamera_setFocalLength___block_invoke(uint64_t a1)
{
  C3DCameraSetFocalLength(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)aperture
{
  double v3;
  double v4;
  double v5;

  -[SCNCamera sensorHeight](self, "sensorHeight");
  v4 = v3;
  -[SCNCamera fStop](self, "fStop");
  return v4 / v5;
}

- (void)setAperture:(CGFloat)aperture
{
  double v5;

  -[SCNCamera sensorHeight](self, "sensorHeight");
  -[SCNCamera setFStop:](self, "setFStop:", v5 / aperture);
}

- (CGFloat)fStop
{
  float FStop;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      FStop = C3DCameraGetFStop((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetFStop((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_focusDistance;
  }
  return FStop;
}

- (void)setFStop:(CGFloat)fStop
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setFStop:].cold.1();
  }
  else
  {
    v4 = fStop;
    if (self->_focusDistance != v4)
    {
      self->_focusDistance = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __22__SCNCamera_setFStop___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("fStop"), v7);
    }
  }
}

void __22__SCNCamera_setFStop___block_invoke(uint64_t a1)
{
  C3DCameraSetFStop(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (NSInteger)apertureBladeCount
{
  NSInteger BladeCount;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_focalBlurSampleCount;
  v4 = -[SCNCamera sceneRef](self, "sceneRef");
  if (!v4)
    return (int)C3DCameraGetBladeCount((uint64_t)self->_camera);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  BladeCount = (int)C3DCameraGetBladeCount((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return BladeCount;
}

- (void)setApertureBladeCount:(NSInteger)apertureBladeCount
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setApertureBladeCount:].cold.1();
  }
  else if (self->_focalBlurSampleCount != apertureBladeCount)
  {
    self->_focalBlurSampleCount = apertureBladeCount;
    v5 = -[SCNCamera sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __35__SCNCamera_setApertureBladeCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = apertureBladeCount;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("apertureBladeCount"), v7);
  }
}

void __35__SCNCamera_setApertureBladeCount___block_invoke(uint64_t a1)
{
  C3DCameraSetBladeCount(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_DWORD *)(a1 + 40));
}

- (NSInteger)focalBlurSampleCount
{
  NSInteger DofSampleCount;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return *(_QWORD *)&self->_aspectRatio;
  v4 = -[SCNCamera sceneRef](self, "sceneRef");
  if (!v4)
    return (int)C3DCameraGetDofSampleCount((uint64_t)self->_camera);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  DofSampleCount = (int)C3DCameraGetDofSampleCount((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return DofSampleCount;
}

- (void)setFocalBlurSampleCount:(NSInteger)focalBlurSampleCount
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setFocalBlurSampleCount:].cold.1();
  }
  else if (*(_QWORD *)&self->_aspectRatio != focalBlurSampleCount)
  {
    *(_QWORD *)&self->_aspectRatio = focalBlurSampleCount;
    v5 = -[SCNCamera sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__SCNCamera_setFocalBlurSampleCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = focalBlurSampleCount;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __37__SCNCamera_setFocalBlurSampleCount___block_invoke(uint64_t a1)
{
  C3DCameraSetDofSampleCount(*(_DWORD **)(*(_QWORD *)(a1 + 32) + 8), *(_DWORD *)(a1 + 40));
}

- (CGFloat)focusDistance
{
  float FocusDistance;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      FocusDistance = C3DCameraGetFocusDistance((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetFocusDistance((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_dofIntensity;
  }
  return FocusDistance;
}

- (void)setFocusDistance:(CGFloat)focusDistance
{
  float v4;
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[5];
  float v8;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNCamera setFocusDistance:].cold.1();
  }
  else
  {
    v4 = focusDistance;
    if (self->_dofIntensity != v4)
    {
      self->_dofIntensity = v4;
      v5 = -[SCNCamera sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __30__SCNCamera_setFocusDistance___block_invoke;
      v7[3] = &unk_1EA5A2D30;
      v7[4] = self;
      v8 = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("focusDistance"), v7);
    }
  }
}

void __30__SCNCamera_setFocusDistance___block_invoke(uint64_t a1)
{
  C3DCameraSetFocusDistance(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (int64_t)fillMode
{
  unint64_t v2;
  int64_t LetterboxMode;
  __C3DScene *v5;
  uint64_t v6;

  v2 = *((unsigned __int8 *)self + 16);
  if ((v2 & 1) == 0)
    return (v2 >> 5) & 1;
  v5 = -[SCNCamera sceneRef](self, "sceneRef");
  if (!v5)
    return C3DCameraGetLetterboxMode((uint64_t)self->_camera);
  v6 = (uint64_t)v5;
  C3DSceneLock((uint64_t)v5);
  LetterboxMode = C3DCameraGetLetterboxMode((uint64_t)self->_camera);
  C3DSceneUnlock(v6);
  return LetterboxMode;
}

- (void)setFillMode:(int64_t)a3
{
  unint64_t v3;
  __C3DScene *v6;
  _QWORD v7[6];

  v3 = *((unsigned __int8 *)self + 16);
  *((_BYTE *)self + 16) = v3 & 0xFB;
  if (((v3 >> 5) & 1) != a3)
  {
    *((_BYTE *)self + 16) = v3 & 0xDB | (32 * (a3 & 1));
    v6 = -[SCNCamera sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __25__SCNCamera_setFillMode___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __25__SCNCamera_setFillMode___block_invoke(uint64_t a1)
{
  C3DCameraSetLetterboxMode(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40) == 1);
}

- (SCNCameraProjectionDirection)projectionDirection
{
  unint64_t v2;
  SCNCameraProjectionDirection IsHorizontal;
  __C3DScene *v5;
  uint64_t v6;

  v2 = *((unsigned __int8 *)self + 16);
  if ((v2 & 1) == 0)
    return (v2 >> 6) & 1;
  v5 = -[SCNCamera sceneRef](self, "sceneRef");
  if (!v5)
    return (unint64_t)C3DCameraGetFovIsHorizontal((uint64_t)self->_camera);
  v6 = (uint64_t)v5;
  C3DSceneLock((uint64_t)v5);
  IsHorizontal = (unint64_t)C3DCameraGetFovIsHorizontal((uint64_t)self->_camera);
  C3DSceneUnlock(v6);
  return IsHorizontal;
}

- (void)setProjectionDirection:(SCNCameraProjectionDirection)projectionDirection
{
  unint64_t v3;
  float fieldOfView;
  float v7;
  __C3DScene *v8;
  _QWORD v9[6];

  v3 = *((unsigned __int8 *)self + 16);
  if (((v3 >> 6) & 1) != projectionDirection)
  {
    *((_BYTE *)self + 16) = v3 & 0xBF | ((projectionDirection & 1) << 6);
    fieldOfView = self->_fieldOfView;
    if ((projectionDirection & 1) != 0)
      v7 = 0.0;
    else
      v7 = self->_fieldOfView;
    if ((projectionDirection & 1) == 0)
      fieldOfView = 0.0;
    self->_xFov = fieldOfView;
    self->_yFov = v7;
    v8 = -[SCNCamera sceneRef](self, "sceneRef");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __36__SCNCamera_setProjectionDirection___block_invoke;
    v9[3] = &unk_1EA59E450;
    v9[4] = self;
    v9[5] = projectionDirection;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, self, v9);
  }
}

void __36__SCNCamera_setProjectionDirection___block_invoke(uint64_t a1)
{
  C3DCameraSetFovHorizontal(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40) == 1);
}

- (double)aspectRatio
{
  float AspectRatio;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v4 = -[SCNCamera sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      AspectRatio = C3DCameraGetAspectRatio((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetAspectRatio((uint64_t)self->_camera);
    }
  }
  else
  {
    return *(float *)&self->_categoryBitMask;
  }
  return AspectRatio;
}

- (void)setAspectRatio:(double)a3
{
  char v3;
  float v6;
  __C3DScene *v7;
  _QWORD v8[5];

  v3 = *((_BYTE *)self + 16);
  if (*(float *)&self->_categoryBitMask != a3 || (v3 & 4) != 0)
  {
    *((_BYTE *)self + 16) = v3 & 0xFB;
    v6 = a3;
    *(float *)&self->_categoryBitMask = v6;
    v7 = -[SCNCamera sceneRef](self, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __28__SCNCamera_setAspectRatio___block_invoke;
    v8[3] = &unk_1EA59E4A0;
    v8[4] = self;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v7, self, CFSTR("aspectRatio"), v8);
  }
}

double __28__SCNCamera_setAspectRatio___block_invoke(uint64_t a1)
{
  return C3DCameraSetAspectRatio(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(float *)(*(_QWORD *)(a1 + 32) + 152));
}

- (BOOL)useLegacyFov
{
  return (*((unsigned __int8 *)self + 16) >> 2) & 1;
}

- (void)setProjectionTransform:(SCNMatrix4 *)projectionTransform
{
  char v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __C3DScene *v13;
  __int128 v14;
  __int128 v15;
  NSObject *v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  SCNMatrix4 b;
  SCNMatrix4 a;

  v4 = *((_BYTE *)self + 16);
  if ((v4 & 1) != 0)
  {
    v16 = scn_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SCNCamera setProjectionTransform:].cold.1();
  }
  else
  {
    *((_BYTE *)self + 16) = v4 | 2;
    if ((v4 & 2) == 0)
      goto LABEL_4;
    v6 = *(_OWORD *)&projectionTransform->m21;
    *(_OWORD *)&a.m11 = *(_OWORD *)&projectionTransform->m11;
    *(_OWORD *)&a.m21 = v6;
    v7 = *(_OWORD *)&projectionTransform->m41;
    *(_OWORD *)&a.m31 = *(_OWORD *)&projectionTransform->m31;
    *(_OWORD *)&a.m41 = v7;
    v8 = *(_OWORD *)&self->_projectionTransform.m23;
    *(_OWORD *)&b.m11 = *(_OWORD *)&self->_projectionTransform.m13;
    *(_OWORD *)&b.m21 = v8;
    v9 = *(_OWORD *)&self->_projectionTransform.m43;
    *(_OWORD *)&b.m31 = *(_OWORD *)&self->_projectionTransform.m33;
    *(_OWORD *)&b.m41 = v9;
    if (!SCNMatrix4EqualToMatrix4(&a, &b))
    {
LABEL_4:
      v10 = *(_OWORD *)&projectionTransform->m11;
      v11 = *(_OWORD *)&projectionTransform->m21;
      v12 = *(_OWORD *)&projectionTransform->m31;
      *(_OWORD *)&self->_projectionTransform.m43 = *(_OWORD *)&projectionTransform->m41;
      *(_OWORD *)&self->_projectionTransform.m33 = v12;
      *(_OWORD *)&self->_projectionTransform.m23 = v11;
      *(_OWORD *)&self->_projectionTransform.m13 = v10;
      v13 = -[SCNCamera sceneRef](self, "sceneRef");
      v17[1] = 3221225472;
      v14 = *(_OWORD *)&projectionTransform->m21;
      v18 = *(_OWORD *)&projectionTransform->m11;
      v19 = v14;
      v15 = *(_OWORD *)&projectionTransform->m41;
      v20 = *(_OWORD *)&projectionTransform->m31;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[2] = __36__SCNCamera_setProjectionTransform___block_invoke;
      v17[3] = &unk_1EA5A16D8;
      v21 = v15;
      v17[4] = self;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v13, self, CFSTR("projectionTransform"), v17);
    }
  }
}

double __36__SCNCamera_setProjectionTransform___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double result;
  _OWORD v5[4];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[4];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  simd_float4x4 v15;

  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  C3DMatrix4x4FromSCNMatrix4(&v6, a1 + 40);
  if (*((float *)&v8 + 2) > 0.0)
  {
    v15 = __invert_f4(*(simd_float4x4 *)_PromotedConst_0);
    v2 = 0;
    v10[0] = v6;
    v10[1] = v7;
    v10[2] = v8;
    v10[3] = v9;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    do
    {
      *(__int128 *)((char *)&v11 + v2 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v15.columns[0], COERCE_FLOAT(v10[v2])), (float32x4_t)v15.columns[1], *(float32x2_t *)&v10[v2], 1), (float32x4_t)v15.columns[2], (float32x4_t)v10[v2], 2), (float32x4_t)v15.columns[3], (float32x4_t)v10[v2], 3);
      ++v2;
    }
    while (v2 != 4);
    v6 = v11;
    v7 = v12;
    v8 = v13;
    v9 = v14;
  }
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  v5[3] = v9;
  *(_QWORD *)&result = C3DCameraSetProjectionTransform(v3, (uint64_t)v5).n128_u64[0];
  return result;
}

- (SCNMatrix4)projectionTransform
{
  if (self)
    return (SCNMatrix4 *)-[SCNMatrix4 projectionTransformWithViewportSize:](self, "projectionTransformWithViewportSize:", 1.0, 1.0);
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  return self;
}

- (SCNMatrix4)projectionTransformWithViewportSize:(SEL)a3
{
  SCNMatrix4 *v4;
  unsigned int m21_low;
  float32x2_t v7;
  uint64_t v8;
  CGFloat v9;
  char *Matrix;
  uint64_t v11;
  uint64_t v12;
  float64x2_t v13;
  char *ProjectionInfosPtr;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CGFloat height;
  CGFloat width;
  float32x4_t v21;
  _OWORD v22[2];
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
  float64x2_t v34;
  SCNMatrix4 v35;

  v4 = self;
  memset(&v35, 0, sizeof(v35));
  m21_low = LOBYTE(self->m21);
  if ((m21_low & 1) != 0)
  {
    height = viewportSize.height;
    width = viewportSize.width;
    v11 = -[SCNMatrix4 sceneRef](self, "sceneRef");
    v12 = v11;
    if (v11)
      C3DSceneLock(v11);
    v13.f64[0] = width;
    v13.f64[1] = height;
    v22[0] = vcvt_hight_f32_f64(0, v13);
    ProjectionInfosPtr = (char *)C3DCameraGetProjectionInfosPtr(*(_QWORD *)&v4->m13);
    self = (SCNMatrix4 *)C3DProjectionInfosGetMatrix(ProjectionInfosPtr, (uint64_t)v22, 0);
    if (self)
    {
      C3DMatrix4x4ToSCNMatrix4((uint64_t)self, &v35);
      if (!v12)
        goto LABEL_9;
    }
    else
    {
      v35 = SCNMatrix4Identity;
      if (!v12)
        goto LABEL_9;
    }
    self = (SCNMatrix4 *)C3DSceneUnlock(v12);
    goto LABEL_9;
  }
  if ((m21_low & 2) != 0)
  {
    v18 = *(_OWORD *)&self[2].m43;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[2].m33;
    *(_OWORD *)&retstr->m21 = v18;
    v16 = *(_OWORD *)&self[3].m13;
    v17 = *(_OWORD *)&self[3].m23;
    goto LABEL_11;
  }
  v24 = 0u;
  v25 = 0u;
  memset(v22, 0, sizeof(v22));
  *(double *)&v25 = self[2].m23;
  *(_OWORD *)((char *)v22 + 8) = *(_OWORD *)&self[1].m11;
  v7 = *(float32x2_t *)&self->m41;
  *(_QWORD *)&v24 = *(_QWORD *)&self->m43;
  DWORD2(v24) = LODWORD(self[1].m21);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  v23 = 0u;
  v33 = 0u;
  v34 = vcvtq_f64_f32(v7);
  LOBYTE(v22[0]) = (m21_low >> 1) & 0x20 | ((m21_low & 8) != 0) | (((m21_low & 0x20) != 0) << 6) | (16
                                                                                                  * ((m21_low & 4) != 0));
  v8 = *(_QWORD *)&self[1].m33;
  *((_QWORD *)&v22[1] + 1) = *(_QWORD *)&self[1].m31;
  *(_QWORD *)&v23 = v8;
  *((_QWORD *)&v23 + 1) = *(_QWORD *)&self[1].m41;
  v9 = viewportSize.height;
  v21 = vcvt_hight_f32_f64(0, (float64x2_t)viewportSize);
  Matrix = C3DProjectionInfosGetMatrix((char *)v22, (uint64_t)&v21, 0);
  C3DMatrix4x4ToSCNMatrix4((uint64_t)Matrix, &v35);
LABEL_9:
  v15 = *(_OWORD *)&v35.m21;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v35.m11;
  *(_OWORD *)&retstr->m21 = v15;
  v16 = *(_OWORD *)&v35.m31;
  v17 = *(_OWORD *)&v35.m41;
LABEL_11:
  *(_OWORD *)&retstr->m31 = v16;
  *(_OWORD *)&retstr->m41 = v17;
  return self;
}

- (SCNMaterialProperty)colorGrading
{
  SCNMaterialProperty *result;

  result = *(SCNMaterialProperty **)&self->_wantsHDR;
  if (!result)
  {
    result = -[SCNMaterialProperty initWithParent:propertyType:]([SCNMaterialProperty alloc], "initWithParent:propertyType:", self, 26);
    *(_QWORD *)&self->_wantsHDR = result;
  }
  return result;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  _OWORD v6[6];

  v4 = objc_alloc_init((Class)objc_opt_class());
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  objc_msgSend(v4, "setName:", -[SCNCamera name](self, "name"));
  objc_msgSend(v4, "setIdentifier:", -[SCNCamera identifier](self, "identifier"));
  objc_msgSend(v4, "setWantsDepthOfField:", -[SCNCamera wantsDepthOfField](self, "wantsDepthOfField"));
  objc_msgSend(v4, "setApertureBladeCount:", -[SCNCamera apertureBladeCount](self, "apertureBladeCount"));
  objc_msgSend(v4, "setFocalBlurSampleCount:", -[SCNCamera focalBlurSampleCount](self, "focalBlurSampleCount"));
  -[SCNCamera focalSize](self, "focalSize");
  objc_msgSend(v4, "setFocalSize:");
  objc_msgSend(v4, "setName:", -[SCNCamera name](self, "name"));
  -[SCNCamera aspectRatio](self, "aspectRatio");
  objc_msgSend(v4, "setAspectRatio:");
  -[SCNCamera focusDistance](self, "focusDistance");
  objc_msgSend(v4, "setFocusDistance:");
  -[SCNCamera fStop](self, "fStop");
  objc_msgSend(v4, "setFStop:");
  if ((*((_BYTE *)self + 16) & 4) != 0)
  {
    -[SCNCamera xFov](self, "xFov");
    objc_msgSend(v4, "setXFov:");
    -[SCNCamera yFov](self, "yFov");
    objc_msgSend(v4, "setYFov:");
  }
  else
  {
    -[SCNCamera sensorHeight](self, "sensorHeight");
    objc_msgSend(v4, "setSensorHeight:");
    -[SCNCamera fieldOfView](self, "fieldOfView");
    objc_msgSend(v4, "setFieldOfView:");
  }
  -[SCNCamera lensShift](self, "lensShift");
  objc_msgSend(v4, "setLensShift:");
  -[SCNCamera postProjectionTransform](self, "postProjectionTransform");
  v6[0] = v6[3];
  v6[1] = v6[4];
  v6[2] = v6[5];
  objc_msgSend(v4, "setPostProjectionTransform:", v6);
  objc_msgSend(v4, "setFillMode:", -[SCNCamera fillMode](self, "fillMode"));
  objc_msgSend(v4, "setProjectionDirection:", -[SCNCamera projectionDirection](self, "projectionDirection"));
  -[SCNCamera zNear](self, "zNear");
  objc_msgSend(v4, "setZNear:");
  -[SCNCamera zFar](self, "zFar");
  objc_msgSend(v4, "setZFar:");
  -[SCNCamera orthographicScale](self, "orthographicScale");
  objc_msgSend(v4, "setOrthographicScale:");
  objc_msgSend(v4, "setAutomaticallyAdjustsZRange:", -[SCNCamera automaticallyAdjustsZRange](self, "automaticallyAdjustsZRange"));
  objc_msgSend(v4, "setUsesOrthographicProjection:", -[SCNCamera usesOrthographicProjection](self, "usesOrthographicProjection"));
  objc_msgSend(v4, "setWantsHDR:", -[SCNCamera wantsHDR](self, "wantsHDR"));
  -[SCNCamera whitePoint](self, "whitePoint");
  objc_msgSend(v4, "setWhitePoint:");
  -[SCNCamera averageGray](self, "averageGray");
  objc_msgSend(v4, "setAverageGray:");
  objc_msgSend(v4, "setWantsExposureAdaptation:", -[SCNCamera wantsExposureAdaptation](self, "wantsExposureAdaptation"));
  -[SCNCamera exposureAdaptationDuration](self, "exposureAdaptationDuration");
  objc_msgSend(v4, "setExposureAdaptationDuration:");
  -[SCNCamera exposureAdaptationBrighteningSpeedFactor](self, "exposureAdaptationBrighteningSpeedFactor");
  objc_msgSend(v4, "setExposureAdaptationBrighteningSpeedFactor:");
  -[SCNCamera exposureAdaptationDarkeningSpeedFactor](self, "exposureAdaptationDarkeningSpeedFactor");
  objc_msgSend(v4, "setExposureAdaptationDarkeningSpeedFactor:");
  -[SCNCamera exposureAdaptationHistogramRangeLowProbability](self, "exposureAdaptationHistogramRangeLowProbability");
  objc_msgSend(v4, "setExposureAdaptationHistogramRangeLowProbability:");
  -[SCNCamera exposureAdaptationHistogramRangeHighProbability](self, "exposureAdaptationHistogramRangeHighProbability");
  objc_msgSend(v4, "setExposureAdaptationHistogramRangeHighProbability:");
  objc_msgSend(v4, "setExposureAdaptationMode:", -[SCNCamera exposureAdaptationMode](self, "exposureAdaptationMode"));
  -[SCNCamera minimumExposure](self, "minimumExposure");
  objc_msgSend(v4, "setMinimumExposure:");
  -[SCNCamera maximumExposure](self, "maximumExposure");
  objc_msgSend(v4, "setMaximumExposure:");
  -[SCNCamera bloomIntensity](self, "bloomIntensity");
  objc_msgSend(v4, "setBloomIntensity:");
  -[SCNCamera bloomThreshold](self, "bloomThreshold");
  objc_msgSend(v4, "setBloomThreshold:");
  objc_msgSend(v4, "setBloomIterationCount:", -[SCNCamera bloomIterationCount](self, "bloomIterationCount"));
  -[SCNCamera bloomIterationSpread](self, "bloomIterationSpread");
  objc_msgSend(v4, "setBloomIterationSpread:");
  -[SCNCamera bloomBlurRadius](self, "bloomBlurRadius");
  objc_msgSend(v4, "setBloomBlurRadius:");
  -[SCNCamera vignettingPower](self, "vignettingPower");
  objc_msgSend(v4, "setVignettingPower:");
  -[SCNCamera vignettingIntensity](self, "vignettingIntensity");
  objc_msgSend(v4, "setVignettingIntensity:");
  -[SCNCamera colorFringeStrength](self, "colorFringeStrength");
  objc_msgSend(v4, "setColorFringeStrength:");
  -[SCNCamera colorFringeIntensity](self, "colorFringeIntensity");
  objc_msgSend(v4, "setColorFringeIntensity:");
  -[SCNCamera saturation](self, "saturation");
  objc_msgSend(v4, "setSaturation:");
  -[SCNCamera contrast](self, "contrast");
  objc_msgSend(v4, "setContrast:");
  -[SCNCamera grainIntensity](self, "grainIntensity");
  objc_msgSend(v4, "setGrainIntensity:");
  -[SCNCamera grainScale](self, "grainScale");
  objc_msgSend(v4, "setGrainScale:");
  objc_msgSend(v4, "setGrainIsColored:", -[SCNCamera grainIsColored](self, "grainIsColored"));
  -[SCNCamera whiteBalanceTemperature](self, "whiteBalanceTemperature");
  objc_msgSend(v4, "setWhiteBalanceTemperature:");
  -[SCNCamera whiteBalanceTint](self, "whiteBalanceTint");
  objc_msgSend(v4, "setWhiteBalanceTint:");
  -[SCNCamera motionBlurIntensity](self, "motionBlurIntensity");
  objc_msgSend(v4, "setMotionBlurIntensity:");
  -[SCNCamera screenSpaceAmbientOcclusionIntensity](self, "screenSpaceAmbientOcclusionIntensity");
  objc_msgSend(v4, "setScreenSpaceAmbientOcclusionIntensity:");
  -[SCNCamera screenSpaceAmbientOcclusionRadius](self, "screenSpaceAmbientOcclusionRadius");
  objc_msgSend(v4, "setScreenSpaceAmbientOcclusionRadius:");
  -[SCNCamera screenSpaceAmbientOcclusionBias](self, "screenSpaceAmbientOcclusionBias");
  objc_msgSend(v4, "setScreenSpaceAmbientOcclusionBias:");
  -[SCNCamera screenSpaceAmbientOcclusionDepthThreshold](self, "screenSpaceAmbientOcclusionDepthThreshold");
  objc_msgSend(v4, "setScreenSpaceAmbientOcclusionDepthThreshold:");
  -[SCNCamera screenSpaceAmbientOcclusionNormalThreshold](self, "screenSpaceAmbientOcclusionNormalThreshold");
  objc_msgSend(v4, "setScreenSpaceAmbientOcclusionNormalThreshold:");
  objc_msgSend(v4, "setScreenSpaceAmbientOcclusionSampleCount:", -[SCNCamera screenSpaceAmbientOcclusionSampleCount](self, "screenSpaceAmbientOcclusionSampleCount"));
  objc_msgSend(v4, "setScreenSpaceAmbientOcclusionDownSample:", -[SCNCamera screenSpaceAmbientOcclusionDownSample](self, "screenSpaceAmbientOcclusionDownSample"));
  objc_msgSend(v4, "setCategoryBitMask:", -[SCNCamera categoryBitMask](self, "categoryBitMask"));
  objc_msgSend(v4, "_copyAnimationsFrom:", self);
  +[SCNTransaction commitImmediate](SCNTransaction, "commitImmediate");
  return v4;
}

- (id)copy
{
  return -[SCNCamera copyWithZone:](self, "copyWithZone:", 0);
}

- (void)_customEncodingOfSCNCamera:(id)a3
{
  __int128 v3;
  __int128 v4;
  _OWORD v5[4];

  if ((*((_BYTE *)self + 16) & 2) != 0)
  {
    v3 = *(_OWORD *)&self->_projectionTransform.m23;
    v5[0] = *(_OWORD *)&self->_projectionTransform.m13;
    v5[1] = v3;
    v4 = *(_OWORD *)&self->_projectionTransform.m43;
    v5[2] = *(_OWORD *)&self->_projectionTransform.m33;
    v5[3] = v4;
    SCNEncodeSCNMatrix4(a3, CFSTR("projectionTransform"), (uint64_t)v5);
  }
}

- (CGFloat)focalSize
{
  return 0.0;
}

- (void)_didDecodeSCNCamera:(id)a3
{
  _OWORD v5[4];
  _OWORD v6[4];

  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("projectionTransform")))
  {
    SCNDecodeSCNMatrix4(a3, (uint64_t)CFSTR("projectionTransform"), v6);
    v5[0] = v6[0];
    v5[1] = v6[1];
    v5[2] = v6[2];
    v5[3] = v6[3];
    -[SCNCamera setProjectionTransform:](self, "setProjectionTransform:", v5);
  }
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  NSString *name;
  double v7;
  double yFov;
  const __CFString *v9;
  uint32x2_t v10;
  double v11;
  uint32x2_t v12;
  double v13;
  uint32x2_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  SCNMaterialProperty *colorGrading;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double exposureAdaptationHistogramRangeLowProbability;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;

  if ((*((_BYTE *)self + 16) & 1) != 0)
    -[SCNCamera _syncObjCModel](self, "_syncObjCModel");
  -[SCNCamera _customEncodingOfSCNCamera:](self, "_customEncodingOfSCNCamera:", a3);
  objc_msgSend(a3, "encodeInt:forKey:", (*((unsigned __int8 *)self + 16) >> 3) & 1, CFSTR("usesOrthographicProjection"));
  objc_msgSend(a3, "encodeInt:forKey:", (*((unsigned __int8 *)self + 16) >> 4) & 1, CFSTR("automaticallyAdjustsZRange"));
  objc_msgSend(a3, "encodeInt:forKey:", (*((unsigned __int8 *)self + 16) >> 5) & 1, CFSTR("fillMode"));
  objc_msgSend(a3, "encodeInt:forKey:", (*((unsigned __int8 *)self + 16) >> 6) & 1, CFSTR("projectionDirection"));
  name = self->_name;
  if (name)
    objc_msgSend(a3, "encodeObject:forKey:", name, CFSTR("name"));
  if ((*((_BYTE *)self + 16) & 4) != 0)
  {
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("xFov"), self->_xFov);
    yFov = self->_yFov;
    v9 = CFSTR("yFov");
  }
  else
  {
    *(float *)&v5 = self->_fieldOfView;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("fov"), v5);
    *(float *)&v7 = self->_sensorSize;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("sensorSize"), v7);
    yFov = self->_fieldOfView;
    if ((*((_BYTE *)self + 16) & 0x40) != 0)
      v9 = CFSTR("xFov");
    else
      v9 = CFSTR("yFov");
  }
  objc_msgSend(a3, "encodeDouble:forKey:", v9, yFov);
  v10 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(*(float32x2_t *)&self->_lensShift[4]));
  if ((vpmax_u32(v10, v10).u32[0] & 0x80000000) != 0)
  {
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("lensShiftX"));
    LODWORD(v11) = *(_DWORD *)self->_postProjectionTransformTranslation;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("lensShiftY"), v11);
  }
  v12 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(*(float32x2_t *)&self->_postProjectionTransformTranslation[4]));
  if ((vpmax_u32(v12, v12).u32[0] & 0x80000000) != 0)
  {
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("postProjectionTransformTranslationX"));
    LODWORD(v13) = *(_DWORD *)self->_postProjectionTransformScale;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("postProjectionTransformTranslationY"), v13);
  }
  __asm { FMOV            V1.2S, #1.0 }
  v19 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_postProjectionTransformScale[4], _D1));
  if ((vpmax_u32(v19, v19).u32[0] & 0x80000000) != 0)
  {
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("postProjectionTransformScaleX"));
    *(float *)&v20 = self->_fStop;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("postProjectionTransformScaleY"), v20);
  }
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("orthographicScale"), self->_orthographicScale);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("zNear"), self->_zNear);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("zFar"), self->_zFar);
  LODWORD(v21) = self->_bladeCount;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("dofIntensity"), v21);
  *(float *)&v22 = self->_dofIntensity;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("focusDistance"), v22);
  *(float *)&v23 = self->_focusDistance;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("fStop"), v23);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_focalBlurSampleCount, CFSTR("bladeCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", *(_QWORD *)&self->_aspectRatio, CFSTR("focalBlurSampleCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", *(_QWORD *)&self->_bloomIntensity, CFSTR("exposureAdaptationMode"));
  objc_msgSend(a3, "encodeInteger:forKey:", *(_QWORD *)&self->_projectionTransform.m11, CFSTR("categoryBitMask"));
  colorGrading = self->_colorGrading;
  if (colorGrading)
    objc_msgSend(a3, "encodeObject:forKey:", colorGrading, CFSTR("technique"));
  v25 = *(_QWORD *)&self->_wantsHDR;
  if (v25)
    objc_msgSend(a3, "encodeObject:forKey:", v25, CFSTR("colorGrading"));
  objc_msgSend(a3, "encodeBool:forKey:", LOBYTE(self->_averageGray), CFSTR("wantsHDR"));
  objc_msgSend(a3, "encodeBool:forKey:", LOBYTE(self->_exposureAdaptationBrighteningSpeedFactor), CFSTR("wantsExposureAdaptation"));
  *(float *)&v26 = self->_exposureOffset;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("whitePoint"), v26);
  *(float *)&v27 = self->_minimumExposure;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("averageGray"), v27);
  *(float *)&v28 = self->_maximumExposure;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("exposureOffset"), v28);
  *(float *)&v29 = self->_exposureAdaptationDarkeningSpeedFactor;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("exposureAdaptationDuration"), v29);
  LODWORD(v30) = LODWORD(self->_exposureAdaptationHistogramRangeHighProbability);
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("exposureAdaptationBrighteningSpeedFactor"), v30);
  LODWORD(v31) = HIDWORD(self->_exposureAdaptationHistogramRangeHighProbability);
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("exposureAdaptationDarkeningSpeedFactor"), v31);
  v32 = *(double *)&self->_exposureAdaptationMode;
  *(float *)&v32 = v32;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("exposureAdaptationHistogramRangeLowProbability"), v32);
  exposureAdaptationHistogramRangeLowProbability = self->_exposureAdaptationHistogramRangeLowProbability;
  *(float *)&exposureAdaptationHistogramRangeLowProbability = exposureAdaptationHistogramRangeLowProbability;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("exposureAdaptationHistogramRangeHighProbability"), exposureAdaptationHistogramRangeLowProbability);
  LODWORD(v34) = *(_DWORD *)&self->_wantsExposureAdaptation;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("minimumExposure"), v34);
  *(float *)&v35 = self->_exposureAdaptationDuration;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("maximumExposure"), v35);
  LODWORD(v36) = self->_bloomIteration;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("bloomIntensity"), v36);
  *(float *)&v37 = self->_bloomIterationSpread;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("bloomThreshold"), v37);
  objc_msgSend(a3, "encodeInteger:forKey:", SLODWORD(self->_bloomBlurRadius), CFSTR("bloomIteration"));
  *(float *)&v38 = self->_motionBlurIntensity;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("bloomIterationSpread"), v38);
  *(float *)&v39 = self->_vignettingPower;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("bloomBlurRadius"), v39);
  *(float *)&v40 = self->_vignettingIntensity;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("motionBlurIntensity"), v40);
  *(float *)&v41 = self->_colorFringeStrength;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("vignettingPower"), v41);
  *(float *)&v42 = self->_colorFringeIntensity;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("vignettingIntensity"), v42);
  *(float *)&v43 = self->_saturation;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("colorFringeStrength"), v43);
  *(float *)&v44 = self->_contrast;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("colorFringeIntensity"), v44);
  *(float *)&v45 = self->_grainIntensity;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("saturation"), v45);
  *(float *)&v46 = self->_grainScale;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("contrast"), v46);
  LODWORD(v47) = *(_DWORD *)&self->_grainIsColored;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("grainIntensity"), v47);
  *(float *)&v48 = self->_whiteBalanceTemperature;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("grainScale"), v48);
  objc_msgSend(a3, "encodeBool:forKey:", LOBYTE(self->_whiteBalanceTint), CFSTR("grainIsColored"));
  LODWORD(v49) = *((_DWORD *)&self->_whiteBalanceTint + 1);
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("whiteBalanceTemperature"), v49);
  *(float *)&v50 = self->_screenSpaceAmbientOcclusion.intensity;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("whiteBalanceTint"), v50);
  *(float *)&v51 = self->_screenSpaceAmbientOcclusion.bias;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("screenSpaceAmbientOcclusionIntensity"), v51);
  *(float *)&v52 = self->_screenSpaceAmbientOcclusion.depthThreshold;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("screenSpaceAmbientOcclusionRadius"), v52);
  *(float *)&v53 = self->_screenSpaceAmbientOcclusion.normalThreshold;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("screenSpaceAmbientOcclusionBias"), v53);
  LODWORD(v54) = *((_DWORD *)&self->_screenSpaceAmbientOcclusion.normalThreshold + 1);
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("screenSpaceAmbientOcclusionDepthThreshold"), v54);
  LODWORD(v55) = self->_screenSpaceAmbientOcclusion.sampleCount;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("screenSpaceAmbientOcclusionNormalThreshold"), v55);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_screenSpaceAmbientOcclusion.downSample, CFSTR("screenSpaceAmbientOcclusionSampleCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_grainTexture, CFSTR("screenSpaceAmbientOcclusionDownSample"));
  SCNEncodeEntity(a3, self);
  SCNEncodeAnimations(a3, self);
}

- (SCNCamera)initWithCoder:(id)a3
{
  SCNCamera *v4;
  _BOOL8 v5;
  uint64_t v6;
  float v7;
  float v8;
  float v9;
  float v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  objc_super v60;

  v60.receiver = self;
  v60.super_class = (Class)SCNCamera;
  v4 = -[SCNCamera init](&v60, sel_init);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    v6 = C3DCameraCreate();
    v4->_camera = (__C3DCamera *)v6;
    if (v6)
      C3DEntitySetObjCWrapper(v6, v4);
    -[SCNCamera _syncObjCModel](v4, "_syncObjCModel");
    -[SCNCamera setUsesOrthographicProjection:](v4, "setUsesOrthographicProjection:", objc_msgSend(a3, "decodeIntForKey:", CFSTR("usesOrthographicProjection")) != 0);
    -[SCNCamera setAutomaticallyAdjustsZRange:](v4, "setAutomaticallyAdjustsZRange:", objc_msgSend(a3, "decodeIntForKey:", CFSTR("automaticallyAdjustsZRange")) != 0);
    -[SCNCamera setFillMode:](v4, "setFillMode:", (int)objc_msgSend(a3, "decodeIntForKey:", CFSTR("fillMode")));
    -[SCNCamera setProjectionDirection:](v4, "setProjectionDirection:", (int)objc_msgSend(a3, "decodeIntForKey:", CFSTR("projectionDirection")));
    -[SCNCamera setName:](v4, "setName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("fov")))
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("sensorSize"));
      -[SCNCamera setSensorHeight:](v4, "setSensorHeight:", v7);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("fov"));
      -[SCNCamera setFieldOfView:](v4, "setFieldOfView:", v8);
    }
    else
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("xFov"));
      -[SCNCamera setXFov:](v4, "setXFov:", v9);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("yFov"));
      -[SCNCamera setYFov:](v4, "setYFov:", v10);
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("lensShiftX")))
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("lensShiftX"));
      v57 = v11;
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("lensShiftY"));
      -[SCNCamera setLensShift:](v4, "setLensShift:", COERCE_DOUBLE(__PAIR64__(v12, v57)));
    }
    else
    {
      *(_QWORD *)&v4->_lensShift[4] = 0;
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("postProjectionTransformTranslationX")))
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("postProjectionTransformTranslationX"));
      v58 = v13;
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("postProjectionTransformTranslationY"));
      -[SCNCamera setPostProjectionTransformTranslation:](v4, "setPostProjectionTransformTranslation:", COERCE_DOUBLE(__PAIR64__(v14, v58)));
    }
    else
    {
      *(_QWORD *)&v4->_postProjectionTransformTranslation[4] = 0;
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("postProjectionTransformScaleX")))
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("postProjectionTransformScaleX"));
      v59 = v15;
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("postProjectionTransformScaleY"));
      -[SCNCamera setPostProjectionTransformScale:](v4, "setPostProjectionTransformScale:", COERCE_DOUBLE(__PAIR64__(v16, v59)));
    }
    else
    {
      __asm { FMOV            V0.2S, #1.0 }
      *(_QWORD *)&v4->_postProjectionTransformScale[4] = _D0;
    }
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("orthographicScale"));
    -[SCNCamera setOrthographicScale:](v4, "setOrthographicScale:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("zNear"));
    -[SCNCamera setZNear:](v4, "setZNear:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("zFar"));
    -[SCNCamera setZFar:](v4, "setZFar:");
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("focusDistance"));
    -[SCNCamera setFocusDistance:](v4, "setFocusDistance:", v22);
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("dofIntensity")))
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("dofIntensity"));
      -[SCNCamera setWantsDepthOfField:](v4, "setWantsDepthOfField:", v23 > 0.0);
    }
    else
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("focalBlurRadius"));
      -[SCNCamera setFocalBlurRadius:](v4, "setFocalBlurRadius:", v24);
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("fStop")))
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("fStop"));
      -[SCNCamera setFStop:](v4, "setFStop:", v25);
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("bladeCount")))
      -[SCNCamera setApertureBladeCount:](v4, "setApertureBladeCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("bladeCount")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("focalBlurSampleCount")))
      -[SCNCamera setFocalBlurSampleCount:](v4, "setFocalBlurSampleCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("focalBlurSampleCount")));
    -[SCNCamera setCategoryBitMask:](v4, "setCategoryBitMask:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("categoryBitMask")));
    -[SCNCamera setTechnique:](v4, "setTechnique:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("technique")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("wantsHDR")))
    {
      -[SCNCamera setWantsHDR:](v4, "setWantsHDR:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("wantsHDR")));
      -[SCNCamera setWantsExposureAdaptation:](v4, "setWantsExposureAdaptation:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("wantsExposureAdaptation")));
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("whitePoint"));
      -[SCNCamera setWhitePoint:](v4, "setWhitePoint:", v26);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("averageGray"));
      -[SCNCamera setAverageGray:](v4, "setAverageGray:", v27);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("exposureOffset"));
      -[SCNCamera setExposureOffset:](v4, "setExposureOffset:", v28);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("exposureAdaptationDuration"));
      -[SCNCamera setExposureAdaptationDuration:](v4, "setExposureAdaptationDuration:", v29);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("exposureAdaptationBrighteningSpeedFactor"));
      -[SCNCamera setExposureAdaptationBrighteningSpeedFactor:](v4, "setExposureAdaptationBrighteningSpeedFactor:", v30);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("exposureAdaptationDarkeningSpeedFactor"));
      -[SCNCamera setExposureAdaptationDarkeningSpeedFactor:](v4, "setExposureAdaptationDarkeningSpeedFactor:", v31);
      if (objc_msgSend(a3, "containsValueForKey:", CFSTR("exposureAdaptationMode")))
      {
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("exposureAdaptationHistogramRangeLowProbability"));
        -[SCNCamera setExposureAdaptationHistogramRangeLowProbability:](v4, "setExposureAdaptationHistogramRangeLowProbability:", v32);
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("exposureAdaptationHistogramRangeHighProbability"));
        -[SCNCamera setExposureAdaptationHistogramRangeHighProbability:](v4, "setExposureAdaptationHistogramRangeHighProbability:", v33);
        -[SCNCamera setExposureAdaptationMode:](v4, "setExposureAdaptationMode:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("exposureAdaptationMode")));
      }
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("minimumExposure"));
      -[SCNCamera setMinimumExposure:](v4, "setMinimumExposure:", v34);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("maximumExposure"));
      -[SCNCamera setMaximumExposure:](v4, "setMaximumExposure:", v35);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("bloomIntensity"));
      -[SCNCamera setBloomIntensity:](v4, "setBloomIntensity:", v36);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("bloomThreshold"));
      -[SCNCamera setBloomThreshold:](v4, "setBloomThreshold:", v37);
      if (objc_msgSend(a3, "containsValueForKey:", CFSTR("bloomIteration")))
      {
        -[SCNCamera setBloomIterationCount:](v4, "setBloomIterationCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("bloomIteration")));
        objc_msgSend(a3, "decodeFloatForKey:", CFSTR("bloomIterationSpread"));
        -[SCNCamera setBloomIterationSpread:](v4, "setBloomIterationSpread:", v38);
      }
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("bloomBlurRadius"));
      -[SCNCamera setBloomBlurRadius:](v4, "setBloomBlurRadius:", v39);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("motionBlurIntensity"));
      -[SCNCamera setMotionBlurIntensity:](v4, "setMotionBlurIntensity:", v40);
    }
    *(_QWORD *)&v4->_wantsHDR = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("colorGrading"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("vignettingPower")))
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("vignettingPower"));
      -[SCNCamera setVignettingPower:](v4, "setVignettingPower:", v41);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("vignettingIntensity"));
      -[SCNCamera setVignettingIntensity:](v4, "setVignettingIntensity:", v42);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("colorFringeStrength"));
      -[SCNCamera setColorFringeStrength:](v4, "setColorFringeStrength:", v43);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("colorFringeIntensity"));
      -[SCNCamera setColorFringeIntensity:](v4, "setColorFringeIntensity:", v44);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("saturation"));
      -[SCNCamera setSaturation:](v4, "setSaturation:", v45);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("contrast"));
      -[SCNCamera setContrast:](v4, "setContrast:", v46);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("whiteBalanceTemperature"));
      -[SCNCamera setWhiteBalanceTemperature:](v4, "setWhiteBalanceTemperature:", v47);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("whiteBalanceTint"));
      -[SCNCamera setWhiteBalanceTint:](v4, "setWhiteBalanceTint:", v48);
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("grainIntensity")))
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("grainIntensity"));
      -[SCNCamera setGrainIntensity:](v4, "setGrainIntensity:", v49);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("grainScale"));
      -[SCNCamera setGrainScale:](v4, "setGrainScale:", v50);
      -[SCNCamera setGrainIsColored:](v4, "setGrainIsColored:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("grainIsColored")));
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("screenSpaceAmbientOcclusionIntensity")))
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("screenSpaceAmbientOcclusionIntensity"));
      -[SCNCamera setScreenSpaceAmbientOcclusionIntensity:](v4, "setScreenSpaceAmbientOcclusionIntensity:", v51);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("screenSpaceAmbientOcclusionRadius"));
      -[SCNCamera setScreenSpaceAmbientOcclusionRadius:](v4, "setScreenSpaceAmbientOcclusionRadius:", v52);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("screenSpaceAmbientOcclusionBias"));
      -[SCNCamera setScreenSpaceAmbientOcclusionBias:](v4, "setScreenSpaceAmbientOcclusionBias:", v53);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("screenSpaceAmbientOcclusionDepthThreshold"));
      -[SCNCamera setScreenSpaceAmbientOcclusionDepthThreshold:](v4, "setScreenSpaceAmbientOcclusionDepthThreshold:", v54);
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("screenSpaceAmbientOcclusionNormalThreshold"));
      -[SCNCamera setScreenSpaceAmbientOcclusionNormalThreshold:](v4, "setScreenSpaceAmbientOcclusionNormalThreshold:", v55);
      -[SCNCamera setScreenSpaceAmbientOcclusionSampleCount:](v4, "setScreenSpaceAmbientOcclusionSampleCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("screenSpaceAmbientOcclusionSampleCount")));
      -[SCNCamera setScreenSpaceAmbientOcclusionDownSample:](v4, "setScreenSpaceAmbientOcclusionDownSample:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("screenSpaceAmbientOcclusionDownSample")));
    }
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    SCNDecodeEntity(a3, v4);
    SCNDecodeAnimations(a3, v4);
    -[SCNCamera _didDecodeSCNCamera:](v4, "_didDecodeSCNCamera:", a3);
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugQuickLookObject
{
  __C3DScene *v3;
  SCNScene *v4;
  SCNNode *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v3 = -[SCNCamera sceneRef](self, "sceneRef");
  if (!v3)
    return 0;
  v4 = +[SCNScene sceneWithSceneRef:](SCNScene, "sceneWithSceneRef:", v3);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__10;
  v13 = __Block_byref_object_dispose__10;
  v14 = 0;
  v5 = -[SCNScene rootNode](v4, "rootNode");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__SCNCamera_SCN_DTAdditions__debugQuickLookObject__block_invoke;
  v8[3] = &unk_1EA5A0108;
  v8[4] = self;
  v8[5] = &v9;
  -[SCNNode enumerateChildNodesUsingBlock:](v5, "enumerateChildNodesUsingBlock:", v8);
  if (!v10[5])
  {
    _Block_object_dispose(&v9, 8);
    return 0;
  }
  v6 = -[SCNScene debugQuickLookObjectWithPointOfView:](v4, "debugQuickLookObjectWithPointOfView:");
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __50__SCNCamera_SCN_DTAdditions__debugQuickLookObject__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "camera");
  if (result == *(_QWORD *)(a1 + 32))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
    *a3 = 1;
  }
  return result;
}

- (id)debugQuickLookData
{
  return UIImagePNGRepresentation((UIImage *)-[SCNCamera debugQuickLookObject](self, "debugQuickLookObject"));
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

- (void)setScreenSpaceAmbientOcclusionIntensity:.cold.1()
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

- (void)setScreenSpaceAmbientOcclusionRadius:.cold.1()
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

- (void)setScreenSpaceAmbientOcclusionBias:.cold.1()
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

- (void)setScreenSpaceAmbientOcclusionDepthThreshold:.cold.1()
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

- (void)setScreenSpaceAmbientOcclusionNormalThreshold:.cold.1()
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

- (void)setScreenSpaceAmbientOcclusionSampleCount:.cold.1()
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

- (void)setScreenSpaceAmbientOcclusionDownSample:.cold.1()
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

- (void)setAutomaticallyAdjustsZRange:.cold.1()
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

- (void)setAverageGray:.cold.1()
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

- (void)setBloomBlurRadius:.cold.1()
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

- (void)setBloomIntensity:.cold.1()
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

- (void)setBloomThreshold:.cold.1()
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

- (void)setBloomIterationCount:.cold.1()
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

- (void)setBloomIterationSpread:.cold.1()
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

- (void)setColorFringeStrength:.cold.1()
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

- (void)setColorFringeIntensity:.cold.1()
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

- (void)setContrast:.cold.1()
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

- (void)setGrainIntensity:.cold.1()
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

- (void)setGrainScale:.cold.1()
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

- (void)setGrainIsColored:.cold.1()
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

- (void)setGrainSlice:.cold.1()
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

- (void)setGrainTexture:.cold.1()
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

- (void)setWhiteBalanceTemperature:.cold.1()
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

- (void)setWhiteBalanceTint:.cold.1()
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

- (void)setExposureAdaptationBrighteningSpeedFactor:.cold.1()
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

- (void)setExposureAdaptationDarkeningSpeedFactor:.cold.1()
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

- (void)setExposureAdaptationDuration:.cold.1()
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

- (void)setExposureAdaptationHistogramRangeHighProbability:.cold.1()
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

- (void)setExposureAdaptationHistogramRangeLowProbability:.cold.1()
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

- (void)setExposureAdaptationMode:.cold.1()
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

- (void)setExposureOffset:.cold.1()
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

- (void)setDofIntensity:.cold.1()
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

- (void)setMaximumExposure:.cold.1()
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

- (void)setMinimumExposure:.cold.1()
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

- (void)setMotionBlurIntensity:.cold.1()
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

- (void)setSaturation:.cold.1()
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

- (void)setUsesOrthographicProjection:.cold.1()
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

- (void)setVignettingIntensity:.cold.1()
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

- (void)setVignettingPower:.cold.1()
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

- (void)setWantsExposureAdaptation:.cold.1()
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

- (void)setWantsHDR:.cold.1()
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

- (void)setWhitePoint:.cold.1()
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

- (void)setXFov:.cold.1()
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

- (void)setYFov:.cold.1()
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

- (void)setLensShift:.cold.1()
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

- (void)setPostProjectionTransform:.cold.1()
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

- (void)setPostProjectionTransformTranslation:.cold.1()
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

- (void)setPostProjectionTransformScale:.cold.1()
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

- (void)setFieldOfView:.cold.1()
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

- (void)setSensorHeight:.cold.1()
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

- (void)setFocalLength:.cold.1()
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

- (void)setFStop:.cold.1()
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

- (void)setApertureBladeCount:.cold.1()
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

- (void)setFocalBlurSampleCount:.cold.1()
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

- (void)setFocusDistance:.cold.1()
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

- (void)setProjectionTransform:.cold.1()
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
