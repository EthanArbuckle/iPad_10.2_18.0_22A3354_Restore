@implementation SCNCone

- (SCNCone)init
{
  const void *v3;
  SCNCone *v4;
  SCNCone *v5;
  objc_super v7;
  objc_super v8;

  v3 = (const void *)C3DParametricGeometryCreate(0, (__int128 *)kC3DConeCallBacks);
  v8.receiver = self;
  v8.super_class = (Class)SCNCone;
  v4 = -[SCNGeometry initWithGeometryRef:](&v8, sel_initWithGeometryRef_, v3);
  v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)SCNCone;
    -[SCNGeometry _syncObjCModel](&v7, sel__syncObjCModel);
    -[SCNCone _syncObjCModel:](v5, "_syncObjCModel:", -[SCNGeometry geometryRef](v5, "geometryRef"));
  }
  CFRelease(v3);
  return v5;
}

- (SCNCone)initWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  SCNCone *v3;
  SCNCone *v4;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNCone;
  v3 = -[SCNGeometry initWithGeometryRef:](&v7, sel_initWithGeometryRef_, a3);
  v4 = v3;
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)SCNCone;
    -[SCNGeometry _syncObjCModel](&v6, sel__syncObjCModel);
    -[SCNCone _syncObjCModel:](v4, "_syncObjCModel:", -[SCNGeometry geometryRef](v4, "geometryRef"));
  }
  return v4;
}

- (__C3DGeometry)__createCFObject
{
  return (__C3DGeometry *)C3DParametricGeometryCreate(0, (__int128 *)kC3DConeCallBacks);
}

- (id)initPresentationParametricGeometryWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNCone;
  return -[SCNGeometry initPresentationGeometryWithGeometryRef:](&v4, sel_initPresentationGeometryWithGeometryRef_, a3);
}

- (id)presentationCone
{
  return -[SCNCone initPresentationParametricGeometryWithParametricGeometryRef:]([SCNCone alloc], "initPresentationParametricGeometryWithParametricGeometryRef:", -[SCNGeometry geometryRef](self, "geometryRef"));
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (void)_syncObjCModel:(__C3DParametricGeometry *)a3
{
  self->_conetopRadius = C3DParametricGeometryGetFloatValue((uint64_t)a3, 5);
  self->_conebottomRadius = C3DParametricGeometryGetFloatValue((uint64_t)a3, 6);
  self->_coneheight = C3DParametricGeometryGetFloatValue((uint64_t)a3, 1);
  self->_coneheightSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 12);
  self->_coneradialSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 15);
  self->_coneprimitiveType = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 20);
}

- (CGFloat)bottomRadius
{
  __C3DScene *v3;
  uint64_t v4;
  double BottomRadius;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_conebottomRadius;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  BottomRadius = C3DParametricGeometryGetBottomRadius((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return BottomRadius;
}

- (void)setBottomRadius:(CGFloat)bottomRadius
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNCone setBottomRadius:].cold.1();
  }
  else if (self->_conebottomRadius != bottomRadius)
  {
    self->_conebottomRadius = bottomRadius;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __27__SCNCone_setBottomRadius___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = bottomRadius;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("bottomRadius"), v7);
  }
}

float __27__SCNCone_setBottomRadius___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DParametricGeometrySetBottomRadius(v2, v3);
  return result;
}

- (CGFloat)height
{
  __C3DScene *v3;
  uint64_t v4;
  double Height;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_coneheight;
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
      -[SCNCone setHeight:].cold.1();
  }
  else if (self->_coneheight != height)
  {
    self->_coneheight = height;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __21__SCNCone_setHeight___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = height;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("height"), v7);
  }
}

float __21__SCNCone_setHeight___block_invoke(uint64_t a1)
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
    return self->_coneheightSegmentCount;
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
      -[SCNCone setHeightSegmentCount:].cold.1();
  }
  else if (self->_coneheightSegmentCount != heightSegmentCount)
  {
    self->_coneheightSegmentCount = heightSegmentCount;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__SCNCone_setHeightSegmentCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = heightSegmentCount;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("heightSegmentCount"), v7);
  }
}

void __33__SCNCone_setHeightSegmentCount___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetHeightSegmentCount(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_DWORD *)(a1 + 40));
}

- (int64_t)primitiveType
{
  __C3DScene *v3;
  uint64_t v4;
  int64_t PrimitiveType;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_coneprimitiveType;
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
      -[SCNCone setPrimitiveType:].cold.1();
  }
  else if (self->_coneprimitiveType != a3)
  {
    self->_coneprimitiveType = a3;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __28__SCNCone_setPrimitiveType___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __28__SCNCone_setPrimitiveType___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetPrimitiveType(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(char *)(a1 + 40));
}

- (NSInteger)radialSegmentCount
{
  __C3DScene *v3;
  uint64_t v4;
  NSInteger RadialSegmentCount;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_coneradialSegmentCount;
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
      -[SCNCone setRadialSegmentCount:].cold.1();
  }
  else if (self->_coneradialSegmentCount != radialSegmentCount)
  {
    self->_coneradialSegmentCount = radialSegmentCount;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__SCNCone_setRadialSegmentCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = radialSegmentCount;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("radialSegmentCount"), v7);
  }
}

void __33__SCNCone_setRadialSegmentCount___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetRadialSegmentCount(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_DWORD *)(a1 + 40));
}

- (CGFloat)topRadius
{
  __C3DScene *v3;
  uint64_t v4;
  double TopRadius;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_conetopRadius;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  TopRadius = C3DParametricGeometryGetTopRadius((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return TopRadius;
}

- (void)setTopRadius:(CGFloat)topRadius
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNCone setTopRadius:].cold.1();
  }
  else if (self->_conetopRadius != topRadius)
  {
    self->_conetopRadius = topRadius;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __24__SCNCone_setTopRadius___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = topRadius;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("topRadius"), v7);
  }
}

float __24__SCNCone_setTopRadius___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DParametricGeometrySetTopRadius(v2, v3);
  return result;
}

- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4
{
  __C3DScene *v7;
  uint64_t v8;
  char BoundingBox;
  double v10;
  float64_t v11;
  double v12;
  float64_t v13;
  double v14;
  double v15;
  float64x2_t v16;
  char v17;
  float v18;
  float v19;
  objc_super v21;
  uint64_t v22;
  float v23;
  uint64_t v24;
  float v25;

  v25 = 0.0;
  v24 = 0;
  v23 = 0.0;
  v22 = 0;
  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v7 = -[SCNGeometry sceneRef](self, "sceneRef");
    v8 = (uint64_t)v7;
    if (v7)
      C3DSceneLock((uint64_t)v7);
    if (-[SCNGeometry geometryRef](self, "geometryRef"))
    {
      BoundingBox = C3DConeGetBoundingBox((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"), (uint64_t)&v24, (uint64_t)&v22);
      if (!v8)
        goto LABEL_12;
      goto LABEL_11;
    }
    BoundingBox = 0;
    if (v8)
LABEL_11:
      C3DSceneUnlock(v8);
  }
  else
  {
    if (-[SCNGeometry _hasFixedBoundingBoxExtrema](self, "_hasFixedBoundingBoxExtrema"))
    {
      v21.receiver = self;
      v21.super_class = (Class)SCNCone;
      return -[SCNGeometry getBoundingBoxMin:max:](&v21, sel_getBoundingBoxMin_max_, a3, a4);
    }
    -[SCNCone topRadius](self, "topRadius");
    v11 = v10;
    -[SCNCone bottomRadius](self, "bottomRadius");
    v13 = v12;
    -[SCNCone height](self, "height");
    v15 = v14;
    v16.f64[0] = v11;
    C3DConeGetBoundingBoxForConeParameters((uint64_t)&v24, (uint64_t)&v22, v16, v13, v15);
    BoundingBox = v17;
  }
LABEL_12:
  if (a3)
  {
    v18 = v25;
    *(_QWORD *)&a3->x = v24;
    a3->z = v18;
  }
  if (a4)
  {
    v19 = v23;
    *(_QWORD *)&a4->x = v22;
    a4->z = v19;
  }
  return BoundingBox;
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
  double v14;
  double v15;
  float v16;
  __int128 v18;

  v18 = 0uLL;
  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v7 = -[SCNGeometry sceneRef](self, "sceneRef");
    v8 = (uint64_t)v7;
    if (v7)
      C3DSceneLock((uint64_t)v7);
    if (-[SCNGeometry geometryRef](self, "geometryRef")
      && C3DConeGetBoundingSphere((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"), &v18))
    {
      if (a3)
      {
        v9 = *((float *)&v18 + 2);
        *(_QWORD *)&a3->x = v18;
        a3->z = v9;
      }
      if (a4)
        *a4 = *((float *)&v18 + 3);
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
  -[SCNCone topRadius](self, "topRadius");
  v12 = v11;
  -[SCNCone bottomRadius](self, "bottomRadius");
  v14 = v13;
  -[SCNCone height](self, "height");
  if (!C3DConeGetBoundingSphereForConeParameters(&v18, v12, v14, v15))
    return 0;
  if (a3)
  {
    v16 = *((float *)&v18 + 2);
    *(_QWORD *)&a3->x = v18;
    a3->z = v16;
  }
  if (a4)
    *a4 = *((float *)&v18 + 3);
  return 1;
}

+ (SCNCone)coneWithTopRadius:(CGFloat)topRadius bottomRadius:(CGFloat)bottomRadius height:(CGFloat)height
{
  id v8;

  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setTopRadius:", topRadius);
  objc_msgSend(v8, "setBottomRadius:", bottomRadius);
  objc_msgSend(v8, "setHeight:", height);
  return (SCNCone *)v8;
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
  -[SCNCone topRadius](self, "topRadius");
  v6 = v5;
  -[SCNCone bottomRadius](self, "bottomRadius");
  v8 = v7;
  -[SCNCone height](self, "height");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ | topRadius=%.3f bottomRadius=%.3f height=%.3f>"), v4, v6, v8, v9);
}

- (void)_setupObjCModelFrom:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNCone;
  -[SCNGeometry _setupObjCModelFrom:](&v5, sel__setupObjCModelFrom_);
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  objc_msgSend(a3, "topRadius");
  -[SCNCone setTopRadius:](self, "setTopRadius:");
  objc_msgSend(a3, "bottomRadius");
  -[SCNCone setBottomRadius:](self, "setBottomRadius:");
  objc_msgSend(a3, "height");
  -[SCNCone setHeight:](self, "setHeight:");
  -[SCNCone setHeightSegmentCount:](self, "setHeightSegmentCount:", objc_msgSend(a3, "heightSegmentCount"));
  -[SCNCone setRadialSegmentCount:](self, "setRadialSegmentCount:", objc_msgSend(a3, "radialSegmentCount"));
  -[SCNCone setPrimitiveType:](self, "setPrimitiveType:", objc_msgSend(a3, "primitiveType"));
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
  return -[SCNCone copyWithZone:](self, "copyWithZone:", 0);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNCone;
  -[SCNGeometry encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    -[SCNCone _syncObjCModel:](self, "_syncObjCModel:", -[SCNGeometry geometryRef](self, "geometryRef"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("conetopRadius"), self->_conetopRadius);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("conebottomRadius"), self->_conebottomRadius);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("coneheight"), self->_coneheight);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_coneheightSegmentCount, CFSTR("coneheightSegmentCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_coneradialSegmentCount, CFSTR("coneradialSegmentCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_coneprimitiveType, CFSTR("coneprimitiveType"));
}

- (SCNCone)initWithCoder:(id)a3
{
  SCNCone *v4;
  _BOOL8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNCone;
  v4 = -[SCNGeometry initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("conetopRadius"));
    -[SCNCone setTopRadius:](v4, "setTopRadius:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("conebottomRadius"));
    -[SCNCone setBottomRadius:](v4, "setBottomRadius:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("coneheight"));
    -[SCNCone setHeight:](v4, "setHeight:");
    -[SCNCone setHeightSegmentCount:](v4, "setHeightSegmentCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("coneheightSegmentCount")));
    -[SCNCone setRadialSegmentCount:](v4, "setRadialSegmentCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("coneradialSegmentCount")));
    -[SCNCone setPrimitiveType:](v4, "setPrimitiveType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("coneprimitiveType")));
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setBottomRadius:.cold.1()
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

- (void)setTopRadius:.cold.1()
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
