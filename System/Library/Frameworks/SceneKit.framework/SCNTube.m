@implementation SCNTube

- (SCNTube)init
{
  const void *v3;
  SCNTube *v4;
  SCNTube *v5;
  objc_super v7;
  objc_super v8;

  v3 = (const void *)C3DParametricGeometryCreate(0, (__int128 *)kC3DTubeCallBacks);
  v8.receiver = self;
  v8.super_class = (Class)SCNTube;
  v4 = -[SCNGeometry initWithGeometryRef:](&v8, sel_initWithGeometryRef_, v3);
  v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)SCNTube;
    -[SCNGeometry _syncObjCModel](&v7, sel__syncObjCModel);
    -[SCNTube _syncObjCModel:](v5, "_syncObjCModel:", -[SCNGeometry geometryRef](v5, "geometryRef"));
  }
  CFRelease(v3);
  return v5;
}

- (SCNTube)initWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  SCNTube *v3;
  SCNTube *v4;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNTube;
  v3 = -[SCNGeometry initWithGeometryRef:](&v7, sel_initWithGeometryRef_, a3);
  v4 = v3;
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)SCNTube;
    -[SCNGeometry _syncObjCModel](&v6, sel__syncObjCModel);
    -[SCNTube _syncObjCModel:](v4, "_syncObjCModel:", -[SCNGeometry geometryRef](v4, "geometryRef"));
  }
  return v4;
}

- (__C3DGeometry)__createCFObject
{
  return (__C3DGeometry *)C3DParametricGeometryCreate(0, (__int128 *)kC3DTubeCallBacks);
}

- (id)initPresentationParametricGeometryWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNTube;
  return -[SCNGeometry initPresentationGeometryWithGeometryRef:](&v4, sel_initPresentationGeometryWithGeometryRef_, a3);
}

- (id)presentationTube
{
  return -[SCNTube initPresentationParametricGeometryWithParametricGeometryRef:]([SCNTube alloc], "initPresentationParametricGeometryWithParametricGeometryRef:", -[SCNGeometry geometryRef](self, "geometryRef"));
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (void)_syncObjCModel:(__C3DParametricGeometry *)a3
{
  self->_tubeinnerRadius = C3DParametricGeometryGetFloatValue((uint64_t)a3, 7);
  self->_tubeouterRadius = C3DParametricGeometryGetFloatValue((uint64_t)a3, 8);
  self->_tubeheight = C3DParametricGeometryGetFloatValue((uint64_t)a3, 1);
  self->_tuberadialSpan = C3DParametricGeometryGetFloatValue((uint64_t)a3, 21);
  self->_tubeheightSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 12);
  self->_tuberadialSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 15);
  self->_tubeprimitiveType = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 20);
}

- (CGFloat)height
{
  __C3DScene *v3;
  uint64_t v4;
  double Height;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_tubeheight;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  Height = C3DParametricGeometryGetHeight((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return Height;
}

- (void)setHeight:(CGFloat)height
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNTube setHeight:].cold.1();
  }
  else if (self->_tubeheight != height)
  {
    self->_tubeheight = height;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __21__SCNTube_setHeight___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = height;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("height"), v7);
  }
}

float __21__SCNTube_setHeight___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DParametricGeometrySetHeight(v2, v3);
  return result;
}

- (NSInteger)heightSegmentCount
{
  __C3DScene *v3;
  uint64_t v4;
  NSInteger HeightSegmentCount;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_tubeheightSegmentCount;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  HeightSegmentCount = (int)C3DParametricGeometryGetHeightSegmentCount((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return HeightSegmentCount;
}

- (void)setHeightSegmentCount:(NSInteger)heightSegmentCount
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNTube setHeightSegmentCount:].cold.1();
  }
  else if (self->_tubeheightSegmentCount != heightSegmentCount)
  {
    self->_tubeheightSegmentCount = heightSegmentCount;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__SCNTube_setHeightSegmentCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = heightSegmentCount;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("heightSegmentCount"), v7);
  }
}

void __33__SCNTube_setHeightSegmentCount___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetHeightSegmentCount(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_DWORD *)(a1 + 40));
}

- (CGFloat)innerRadius
{
  __C3DScene *v3;
  uint64_t v4;
  double InnerRadius;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_tubeinnerRadius;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  InnerRadius = C3DParametricGeometryGetInnerRadius((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return InnerRadius;
}

- (void)setInnerRadius:(CGFloat)innerRadius
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNTube setInnerRadius:].cold.1();
  }
  else if (self->_tubeinnerRadius != innerRadius)
  {
    self->_tubeinnerRadius = innerRadius;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __26__SCNTube_setInnerRadius___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = innerRadius;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("innerRadius"), v7);
  }
}

float __26__SCNTube_setInnerRadius___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DParametricGeometrySetInnerRadius(v2, v3);
  return result;
}

- (CGFloat)outerRadius
{
  __C3DScene *v3;
  uint64_t v4;
  double OuterRadius;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_tubeouterRadius;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  OuterRadius = C3DParametricGeometryGetOuterRadius((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return OuterRadius;
}

- (void)setOuterRadius:(CGFloat)outerRadius
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNTube setOuterRadius:].cold.1();
  }
  else if (self->_tubeouterRadius != outerRadius)
  {
    self->_tubeouterRadius = outerRadius;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __26__SCNTube_setOuterRadius___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = outerRadius;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("outerRadius"), v7);
  }
}

float __26__SCNTube_setOuterRadius___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DParametricGeometrySetOuterRadius(v2, v3);
  return result;
}

- (int64_t)primitiveType
{
  __C3DScene *v3;
  uint64_t v4;
  int64_t PrimitiveType;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_tubeprimitiveType;
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
      -[SCNTube setPrimitiveType:].cold.1();
  }
  else if (self->_tubeprimitiveType != a3)
  {
    self->_tubeprimitiveType = a3;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __28__SCNTube_setPrimitiveType___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __28__SCNTube_setPrimitiveType___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetPrimitiveType(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(char *)(a1 + 40));
}

- (NSInteger)radialSegmentCount
{
  __C3DScene *v3;
  uint64_t v4;
  NSInteger RadialSegmentCount;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_tuberadialSegmentCount;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  RadialSegmentCount = (int)C3DParametricGeometryGetRadialSegmentCount((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return RadialSegmentCount;
}

- (void)setRadialSegmentCount:(NSInteger)radialSegmentCount
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNTube setRadialSegmentCount:].cold.1();
  }
  else if (self->_tuberadialSegmentCount != radialSegmentCount)
  {
    self->_tuberadialSegmentCount = radialSegmentCount;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__SCNTube_setRadialSegmentCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = radialSegmentCount;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("radialSegmentCount"), v7);
  }
}

void __33__SCNTube_setRadialSegmentCount___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetRadialSegmentCount(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_DWORD *)(a1 + 40));
}

- (double)radialSpan
{
  __C3DScene *v3;
  uint64_t v4;
  double RadialSpan;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_tuberadialSpan;
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
      -[SCNTube setRadialSpan:].cold.1();
  }
  else if (self->_tuberadialSpan != a3)
  {
    self->_tuberadialSpan = a3;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __25__SCNTube_setRadialSpan___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("radialSpan"), v7);
  }
}

float __25__SCNTube_setRadialSpan___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DParametricGeometrySetRadialSpan(v2, v3);
  return result;
}

- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4
{
  __C3DScene *v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  double v11;
  float64_t v12;
  double v13;
  double v14;
  float64x2_t v15;
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
      C3DTubeGetBoundingBox((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"), (uint64_t)&v23, (uint64_t)&v21);
      v10 = v9;
      if (!v8)
        goto LABEL_12;
      goto LABEL_11;
    }
    v10 = 0;
    if (v8)
LABEL_11:
      C3DSceneUnlock(v8);
  }
  else
  {
    if (-[SCNGeometry _hasFixedBoundingBoxExtrema](self, "_hasFixedBoundingBoxExtrema"))
    {
      v20.receiver = self;
      v20.super_class = (Class)SCNTube;
      return -[SCNGeometry getBoundingBoxMin:max:](&v20, sel_getBoundingBoxMin_max_, a3, a4);
    }
    -[SCNTube outerRadius](self, "outerRadius");
    v12 = v11;
    -[SCNTube height](self, "height");
    v14 = v13;
    v15.f64[0] = v12;
    C3DCylinderGetBoundingBoxForCylinderParameters((uint64_t)&v23, (uint64_t)&v21, v15, v14);
    v10 = v16;
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
  return v10;
}

- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4
{
  __C3DScene *v7;
  uint64_t v8;
  float v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  float v14;
  __int128 v16;

  v16 = 0uLL;
  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v7 = -[SCNGeometry sceneRef](self, "sceneRef");
    v8 = (uint64_t)v7;
    if (v7)
      C3DSceneLock((uint64_t)v7);
    if (-[SCNGeometry geometryRef](self, "geometryRef")
      && C3DTubeGetBoundingSphere((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"), &v16))
    {
      if (a3)
      {
        v9 = *((float *)&v16 + 2);
        *(_QWORD *)&a3->x = v16;
        a3->z = v9;
      }
      if (a4)
        *a4 = *((float *)&v16 + 3);
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
  -[SCNTube outerRadius](self, "outerRadius");
  v12 = v11;
  -[SCNTube height](self, "height");
  if (!C3DCylinderGetBoundingSphereForCylinderParameters(&v16, v12, v13))
    return 0;
  if (a3)
  {
    v14 = *((float *)&v16 + 2);
    *(_QWORD *)&a3->x = v16;
    a3->z = v14;
  }
  if (a4)
    *a4 = *((float *)&v16 + 3);
  return 1;
}

+ (SCNTube)tubeWithInnerRadius:(CGFloat)innerRadius outerRadius:(CGFloat)outerRadius height:(CGFloat)height
{
  id v8;

  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setInnerRadius:", innerRadius);
  objc_msgSend(v8, "setOuterRadius:", outerRadius);
  objc_msgSend(v8, "setHeight:", height);
  return (SCNTube *)v8;
}

- (id)description
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[SCNGeometry geometryDescription](self, "geometryDescription");
  -[SCNTube innerRadius](self, "innerRadius");
  v6 = v5;
  -[SCNTube outerRadius](self, "outerRadius");
  v8 = v7;
  -[SCNTube height](self, "height");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ | innerRadius=%.3f outerRadius=%.3f height=%.3f>"), v4, v6, v8, v9);
}

- (void)_setupObjCModelFrom:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNTube;
  -[SCNGeometry _setupObjCModelFrom:](&v5, sel__setupObjCModelFrom_);
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  objc_msgSend(a3, "innerRadius");
  -[SCNTube setInnerRadius:](self, "setInnerRadius:");
  objc_msgSend(a3, "outerRadius");
  -[SCNTube setOuterRadius:](self, "setOuterRadius:");
  objc_msgSend(a3, "height");
  -[SCNTube setHeight:](self, "setHeight:");
  objc_msgSend(a3, "radialSpan");
  -[SCNTube setRadialSpan:](self, "setRadialSpan:");
  -[SCNTube setHeightSegmentCount:](self, "setHeightSegmentCount:", objc_msgSend(a3, "heightSegmentCount"));
  -[SCNTube setRadialSegmentCount:](self, "setRadialSegmentCount:", objc_msgSend(a3, "radialSegmentCount"));
  -[SCNTube setPrimitiveType:](self, "setPrimitiveType:", objc_msgSend(a3, "primitiveType"));
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
  return -[SCNTube copyWithZone:](self, "copyWithZone:", 0);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNTube;
  -[SCNGeometry encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    -[SCNTube _syncObjCModel:](self, "_syncObjCModel:", -[SCNGeometry geometryRef](self, "geometryRef"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("tubeinnerRadius"), self->_tubeinnerRadius);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("tubeouterRadius"), self->_tubeouterRadius);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("tubeheight"), self->_tubeheight);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("tuberadialSpan"), self->_tuberadialSpan);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_tubeheightSegmentCount, CFSTR("tubeheightSegmentCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_tuberadialSegmentCount, CFSTR("tuberadialSegmentCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_tubeprimitiveType, CFSTR("tubeprimitiveType"));
}

- (SCNTube)initWithCoder:(id)a3
{
  SCNTube *v4;
  _BOOL8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNTube;
  v4 = -[SCNGeometry initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("tubeinnerRadius"));
    -[SCNTube setInnerRadius:](v4, "setInnerRadius:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("tubeouterRadius"));
    -[SCNTube setOuterRadius:](v4, "setOuterRadius:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("tubeheight"));
    -[SCNTube setHeight:](v4, "setHeight:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("tuberadialSpan"));
    -[SCNTube setRadialSpan:](v4, "setRadialSpan:");
    -[SCNTube setHeightSegmentCount:](v4, "setHeightSegmentCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("tubeheightSegmentCount")));
    -[SCNTube setRadialSegmentCount:](v4, "setRadialSegmentCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("tuberadialSegmentCount")));
    -[SCNTube setPrimitiveType:](v4, "setPrimitiveType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("tubeprimitiveType")));
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setHeight:.cold.1()
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

- (void)setHeightSegmentCount:.cold.1()
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

- (void)setInnerRadius:.cold.1()
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

- (void)setOuterRadius:.cold.1()
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

- (void)setRadialSegmentCount:.cold.1()
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

@end
