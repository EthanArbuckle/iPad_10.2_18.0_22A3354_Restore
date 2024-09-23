@implementation SCNSphere

- (SCNSphere)init
{
  const void *v3;
  SCNSphere *v4;
  SCNSphere *v5;
  objc_super v7;
  objc_super v8;

  v3 = (const void *)C3DParametricGeometryCreate(0, (__int128 *)kC3DSphereCallBacks);
  v8.receiver = self;
  v8.super_class = (Class)SCNSphere;
  v4 = -[SCNGeometry initWithGeometryRef:](&v8, sel_initWithGeometryRef_, v3);
  v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)SCNSphere;
    -[SCNGeometry _syncObjCModel](&v7, sel__syncObjCModel);
    -[SCNSphere _syncObjCModel:](v5, "_syncObjCModel:", -[SCNGeometry geometryRef](v5, "geometryRef"));
  }
  CFRelease(v3);
  return v5;
}

- (SCNSphere)initWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  SCNSphere *v3;
  SCNSphere *v4;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNSphere;
  v3 = -[SCNGeometry initWithGeometryRef:](&v7, sel_initWithGeometryRef_, a3);
  v4 = v3;
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)SCNSphere;
    -[SCNGeometry _syncObjCModel](&v6, sel__syncObjCModel);
    -[SCNSphere _syncObjCModel:](v4, "_syncObjCModel:", -[SCNGeometry geometryRef](v4, "geometryRef"));
  }
  return v4;
}

- (__C3DGeometry)__createCFObject
{
  return (__C3DGeometry *)C3DParametricGeometryCreate(0, (__int128 *)kC3DSphereCallBacks);
}

- (id)initPresentationParametricGeometryWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNSphere;
  return -[SCNGeometry initPresentationGeometryWithGeometryRef:](&v4, sel_initPresentationGeometryWithGeometryRef_, a3);
}

- (id)presentationSphere
{
  return -[SCNSphere initPresentationParametricGeometryWithParametricGeometryRef:]([SCNSphere alloc], "initPresentationParametricGeometryWithParametricGeometryRef:", -[SCNGeometry geometryRef](self, "geometryRef"));
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (void)_syncObjCModel:(__C3DParametricGeometry *)a3
{
  unsigned int IntValue;

  self->_sphereradius = C3DParametricGeometryGetFloatValue((uint64_t)a3, 4);
  self->_sphereradialSpan = C3DParametricGeometryGetFloatValue((uint64_t)a3, 21);
  self->_spheresegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 23);
  self->_sphereprimitiveType = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 20);
  IntValue = C3DParametricGeometryGetIntValue((uint64_t)a3, 22);
  self->_spheregeodesic = IntValue == 1;
  self->_spherehemispheric = IntValue == 2;
}

- (BOOL)isGeodesic
{
  __C3DScene *v3;
  uint64_t v4;
  BOOL IsGeodesic;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_spheregeodesic;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  IsGeodesic = C3DParametricGeometryIsGeodesic((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return IsGeodesic;
}

- (void)setGeodesic:(BOOL)geodesic
{
  _BOOL4 v3;
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[5];
  BOOL v8;

  v3 = geodesic;
  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNSphere setGeodesic:].cold.1();
  }
  else if (self->_spheregeodesic != v3)
  {
    self->_spheregeodesic = v3;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __25__SCNSphere_setGeodesic___block_invoke;
    v7[3] = &unk_1EA59E478;
    v7[4] = self;
    v8 = v3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __25__SCNSphere_setGeodesic___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetGeodesic(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)isHemispheric
{
  __C3DScene *v3;
  uint64_t v4;
  BOOL IsHemispheric;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_spherehemispheric;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  IsHemispheric = C3DParametricGeometryIsHemispheric((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return IsHemispheric;
}

- (void)setHemispheric:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[5];
  BOOL v8;

  v3 = a3;
  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNSphere setHemispheric:].cold.1();
  }
  else if (self->_spherehemispheric != v3)
  {
    self->_spherehemispheric = v3;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __28__SCNSphere_setHemispheric___block_invoke;
    v7[3] = &unk_1EA59E478;
    v7[4] = self;
    v8 = v3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __28__SCNSphere_setHemispheric___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetHemispheric(objc_msgSend(*(id *)(a1 + 32), "geometryRef"));
}

- (int64_t)primitiveType
{
  __C3DScene *v3;
  uint64_t v4;
  int64_t PrimitiveType;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_sphereprimitiveType;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  PrimitiveType = (int)C3DParametricGeometryGetPrimitiveType((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return PrimitiveType;
}

- (void)setPrimitiveType:(int64_t)a3
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNSphere setPrimitiveType:].cold.1();
  }
  else if (self->_sphereprimitiveType != a3)
  {
    self->_sphereprimitiveType = a3;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __30__SCNSphere_setPrimitiveType___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __30__SCNSphere_setPrimitiveType___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetPrimitiveType(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(char *)(a1 + 40));
}

- (double)radialSpan
{
  __C3DScene *v3;
  uint64_t v4;
  double RadialSpan;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_sphereradialSpan;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  RadialSpan = C3DParametricGeometryGetRadialSpan((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return RadialSpan;
}

- (void)setRadialSpan:(double)a3
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNSphere setRadialSpan:].cold.1();
  }
  else if (self->_sphereradialSpan != a3)
  {
    self->_sphereradialSpan = a3;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __27__SCNSphere_setRadialSpan___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("radialSpan"), v7);
  }
}

float __27__SCNSphere_setRadialSpan___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DParametricGeometrySetRadialSpan(v2, v3);
  return result;
}

- (CGFloat)radius
{
  __C3DScene *v3;
  uint64_t v4;
  double Radius;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_sphereradius;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  Radius = C3DParametricGeometryGetRadius((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return Radius;
}

- (void)setRadius:(CGFloat)radius
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNSphere setRadius:].cold.1();
  }
  else if (self->_sphereradius != radius)
  {
    self->_sphereradius = radius;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __23__SCNSphere_setRadius___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = radius;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("radius"), v7);
  }
}

float __23__SCNSphere_setRadius___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DParametricGeometrySetCapRadius(v2, v3);
  return result;
}

- (NSInteger)segmentCount
{
  __C3DScene *v3;
  uint64_t v4;
  NSInteger SegmentCount;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_spheresegmentCount;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  SegmentCount = (int)C3DParametricGeometryGetSegmentCount((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return SegmentCount;
}

- (void)setSegmentCount:(NSInteger)segmentCount
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNSphere setSegmentCount:].cold.1();
  }
  else if (self->_spheresegmentCount != segmentCount)
  {
    self->_spheresegmentCount = segmentCount;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __29__SCNSphere_setSegmentCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = segmentCount;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("segmentCount"), v7);
  }
}

void __29__SCNSphere_setSegmentCount___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetSegmentCount(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_DWORD *)(a1 + 40));
}

- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4
{
  __C3DScene *v7;
  uint64_t v8;
  __C3DGeometry *v9;
  double v10;
  double v11;
  BOOL v12;
  BOOL v13;
  double v14;
  double v15;
  BOOL v16;
  float v17;
  float v18;
  objc_super v20;
  uint64_t v21;
  float v22;
  uint64_t v23;
  float v24;

  v24 = 0.0;
  v23 = 0;
  v22 = 0.0;
  v21 = 0;
  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v7 = -[SCNGeometry sceneRef](self, "sceneRef");
    v8 = (uint64_t)v7;
    if (v7)
      C3DSceneLock((uint64_t)v7);
    if (-[SCNGeometry geometryRef](self, "geometryRef"))
    {
      v9 = -[SCNGeometry geometryRef](self, "geometryRef");
      C3DSphereGetBoundingBox((uint64_t)v9, (uint64_t)&v23, (uint64_t)&v21, v10, v11);
      v13 = v12;
      if (!v8)
        goto LABEL_12;
      goto LABEL_11;
    }
    v13 = 0;
    if (v8)
LABEL_11:
      C3DSceneUnlock(v8);
  }
  else
  {
    if (-[SCNGeometry _hasFixedBoundingBoxExtrema](self, "_hasFixedBoundingBoxExtrema"))
    {
      v20.receiver = self;
      v20.super_class = (Class)SCNSphere;
      return -[SCNGeometry getBoundingBoxMin:max:](&v20, sel_getBoundingBoxMin_max_, a3, a4);
    }
    -[SCNSphere radius](self, "radius");
    C3DSphereGetBoundingBoxForSphereParameters((uint64_t)&v23, (uint64_t)&v21, v14, v15);
    v13 = v16;
  }
LABEL_12:
  if (a3)
  {
    v17 = v24;
    *(_QWORD *)&a3->x = v23;
    a3->z = v17;
  }
  if (a4)
  {
    v18 = v22;
    *(_QWORD *)&a4->x = v21;
    a4->z = v18;
  }
  return v13;
}

- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4
{
  __C3DScene *v7;
  uint64_t v8;
  float v9;
  BOOL v10;
  double v11;
  float v12;
  __int128 v14;

  v14 = 0uLL;
  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v7 = -[SCNGeometry sceneRef](self, "sceneRef");
    v8 = (uint64_t)v7;
    if (v7)
      C3DSceneLock((uint64_t)v7);
    if (-[SCNGeometry geometryRef](self, "geometryRef")
      && C3DSphereGetBoundingSphere((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"), &v14))
    {
      if (a3)
      {
        v9 = *((float *)&v14 + 2);
        *(_QWORD *)&a3->x = v14;
        a3->z = v9;
      }
      if (a4)
        *a4 = *((float *)&v14 + 3);
      v10 = 1;
      if (!v8)
        return v10;
    }
    else
    {
      v10 = 0;
      if (!v8)
        return v10;
    }
    C3DSceneUnlock(v8);
    return v10;
  }
  -[SCNSphere radius](self, "radius");
  if (!C3DSphereGetBoundingSphereForSphereParameters(&v14, v11))
    return 0;
  if (a3)
  {
    v12 = *((float *)&v14 + 2);
    *(_QWORD *)&a3->x = v14;
    a3->z = v12;
  }
  if (a4)
    *a4 = *((float *)&v14 + 3);
  return 1;
}

+ (SCNSphere)sphereWithRadius:(CGFloat)radius
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setRadius:", radius);
  return (SCNSphere *)v4;
}

- (id)description
{
  void *v3;
  id v4;
  uint64_t v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[SCNGeometry geometryDescription](self, "geometryDescription");
  -[SCNSphere radius](self, "radius");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ | radius=%.3f>"), v4, v5);
}

- (void)_setupObjCModelFrom:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNSphere;
  -[SCNGeometry _setupObjCModelFrom:](&v5, sel__setupObjCModelFrom_);
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  objc_msgSend(a3, "radius");
  -[SCNSphere setRadius:](self, "setRadius:");
  objc_msgSend(a3, "radialSpan");
  -[SCNSphere setRadialSpan:](self, "setRadialSpan:");
  -[SCNSphere setSegmentCount:](self, "setSegmentCount:", objc_msgSend(a3, "segmentCount"));
  -[SCNSphere setGeodesic:](self, "setGeodesic:", objc_msgSend(a3, "isGeodesic"));
  -[SCNSphere setHemispheric:](self, "setHemispheric:", objc_msgSend(a3, "isHemispheric"));
  -[SCNSphere setPrimitiveType:](self, "setPrimitiveType:", objc_msgSend(a3, "primitiveType"));
  +[SCNTransaction commitImmediate](SCNTransaction, "commitImmediate");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "_setupObjCModelFrom:", self);
  -[SCNGeometry _copyAttributesTo:](self, "_copyAttributesTo:", v4);
  return v4;
}

- (id)copy
{
  return -[SCNSphere copyWithZone:](self, "copyWithZone:", 0);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNSphere;
  -[SCNGeometry encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    -[SCNSphere _syncObjCModel:](self, "_syncObjCModel:", -[SCNGeometry geometryRef](self, "geometryRef"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("sphereradius"), self->_sphereradius);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("sphereradialSpan"), self->_sphereradialSpan);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_spheresegmentCount, CFSTR("spheresegmentCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_sphereprimitiveType, CFSTR("sphereprimitiveType"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_spheregeodesic, CFSTR("spheregeodesic"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_spherehemispheric, CFSTR("spherehemispheric"));
}

- (SCNSphere)initWithCoder:(id)a3
{
  SCNSphere *v4;
  _BOOL8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNSphere;
  v4 = -[SCNGeometry initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("sphereradius"));
    -[SCNSphere setRadius:](v4, "setRadius:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("sphereradialSpan"));
    -[SCNSphere setRadialSpan:](v4, "setRadialSpan:");
    -[SCNSphere setSegmentCount:](v4, "setSegmentCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("spheresegmentCount")));
    -[SCNSphere setPrimitiveType:](v4, "setPrimitiveType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("sphereprimitiveType")));
    -[SCNSphere setGeodesic:](v4, "setGeodesic:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("spheregeodesic")));
    -[SCNSphere setHemispheric:](v4, "setHemispheric:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("spherehemispheric")));
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setGeodesic:.cold.1()
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

- (void)setHemispheric:.cold.1()
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

- (void)setPrimitiveType:.cold.1()
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

- (void)setRadialSpan:.cold.1()
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

- (void)setRadius:.cold.1()
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

- (void)setSegmentCount:.cold.1()
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
