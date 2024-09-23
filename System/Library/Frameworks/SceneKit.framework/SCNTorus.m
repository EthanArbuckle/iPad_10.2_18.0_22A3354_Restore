@implementation SCNTorus

- (SCNTorus)init
{
  const void *v3;
  SCNTorus *v4;
  SCNTorus *v5;
  objc_super v7;
  objc_super v8;

  v3 = (const void *)C3DParametricGeometryCreate(0, (__int128 *)kC3DTorusCallBacks);
  v8.receiver = self;
  v8.super_class = (Class)SCNTorus;
  v4 = -[SCNGeometry initWithGeometryRef:](&v8, sel_initWithGeometryRef_, v3);
  v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)SCNTorus;
    -[SCNGeometry _syncObjCModel](&v7, sel__syncObjCModel);
    -[SCNTorus _syncObjCModel:](v5, "_syncObjCModel:", -[SCNGeometry geometryRef](v5, "geometryRef"));
  }
  CFRelease(v3);
  return v5;
}

- (SCNTorus)initWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  SCNTorus *v3;
  SCNTorus *v4;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNTorus;
  v3 = -[SCNGeometry initWithGeometryRef:](&v7, sel_initWithGeometryRef_, a3);
  v4 = v3;
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)SCNTorus;
    -[SCNGeometry _syncObjCModel](&v6, sel__syncObjCModel);
    -[SCNTorus _syncObjCModel:](v4, "_syncObjCModel:", -[SCNGeometry geometryRef](v4, "geometryRef"));
  }
  return v4;
}

- (__C3DGeometry)__createCFObject
{
  return (__C3DGeometry *)C3DParametricGeometryCreate(0, (__int128 *)kC3DTorusCallBacks);
}

- (id)initPresentationParametricGeometryWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNTorus;
  return -[SCNGeometry initPresentationGeometryWithGeometryRef:](&v4, sel_initPresentationGeometryWithGeometryRef_, a3);
}

- (id)presentationTorus
{
  return -[SCNTorus initPresentationParametricGeometryWithParametricGeometryRef:]([SCNTorus alloc], "initPresentationParametricGeometryWithParametricGeometryRef:", -[SCNGeometry geometryRef](self, "geometryRef"));
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (void)_syncObjCModel:(__C3DParametricGeometry *)a3
{
  self->_torusringRadius = C3DParametricGeometryGetFloatValue((uint64_t)a3, 9);
  self->_toruspipeRadius = C3DParametricGeometryGetFloatValue((uint64_t)a3, 10);
  self->_torusradialSpan = C3DParametricGeometryGetFloatValue((uint64_t)a3, 21);
  self->_torusringSegmentCount = (int)C3DParametricGeometryGetRingSegmentCount((uint64_t)a3);
  self->_toruspipeSegmentCount = (int)C3DParametricGeometryGetPipeSegmentCount((uint64_t)a3);
  self->_torusprimitiveType = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 20);
}

- (CGFloat)pipeRadius
{
  __C3DScene *v3;
  uint64_t v4;
  double PipeRadius;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_toruspipeRadius;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  PipeRadius = C3DParametricGeometryGetPipeRadius((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return PipeRadius;
}

- (void)setPipeRadius:(CGFloat)pipeRadius
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNTorus setPipeRadius:].cold.1();
  }
  else if (self->_toruspipeRadius != pipeRadius)
  {
    self->_toruspipeRadius = pipeRadius;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __26__SCNTorus_setPipeRadius___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = pipeRadius;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("pipeRadius"), v7);
  }
}

float __26__SCNTorus_setPipeRadius___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DParametricGeometrySetPipeRadius(v2, v3);
  return result;
}

- (NSInteger)pipeSegmentCount
{
  __C3DScene *v3;
  uint64_t v4;
  NSInteger PipeSegmentCount;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_toruspipeSegmentCount;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  PipeSegmentCount = (int)C3DParametricGeometryGetPipeSegmentCount((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return PipeSegmentCount;
}

- (void)setPipeSegmentCount:(NSInteger)pipeSegmentCount
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNTorus setPipeSegmentCount:].cold.1();
  }
  else if (self->_toruspipeSegmentCount != pipeSegmentCount)
  {
    self->_toruspipeSegmentCount = pipeSegmentCount;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __32__SCNTorus_setPipeSegmentCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = pipeSegmentCount;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("pipeSegmentCount"), v7);
  }
}

void __32__SCNTorus_setPipeSegmentCount___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetPipeSegmentCount(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_DWORD *)(a1 + 40));
}

- (int64_t)primitiveType
{
  __C3DScene *v3;
  uint64_t v4;
  int64_t PrimitiveType;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_torusprimitiveType;
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
      -[SCNTorus setPrimitiveType:].cold.1();
  }
  else if (self->_torusprimitiveType != a3)
  {
    self->_torusprimitiveType = a3;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __29__SCNTorus_setPrimitiveType___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __29__SCNTorus_setPrimitiveType___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetPrimitiveType(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(char *)(a1 + 40));
}

- (double)radialSpan
{
  __C3DScene *v3;
  uint64_t v4;
  double RadialSpan;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_torusradialSpan;
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
      -[SCNTorus setRadialSpan:].cold.1();
  }
  else if (self->_torusradialSpan != a3)
  {
    self->_torusradialSpan = a3;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __26__SCNTorus_setRadialSpan___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("radialSpan"), v7);
  }
}

float __26__SCNTorus_setRadialSpan___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DParametricGeometrySetRadialSpan(v2, v3);
  return result;
}

- (CGFloat)ringRadius
{
  __C3DScene *v3;
  uint64_t v4;
  double RingRadius;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_torusringRadius;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  RingRadius = C3DParametricGeometryGetRingRadius((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return RingRadius;
}

- (void)setRingRadius:(CGFloat)ringRadius
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNTorus setRingRadius:].cold.1();
  }
  else if (self->_torusringRadius != ringRadius)
  {
    self->_torusringRadius = ringRadius;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __26__SCNTorus_setRingRadius___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = ringRadius;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("ringRadius"), v7);
  }
}

float __26__SCNTorus_setRingRadius___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DParametricGeometrySetRingRadius(v2, v3);
  return result;
}

- (NSInteger)ringSegmentCount
{
  __C3DScene *v3;
  uint64_t v4;
  NSInteger RingSegmentCount;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_torusringSegmentCount;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  RingSegmentCount = (int)C3DParametricGeometryGetRingSegmentCount((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return RingSegmentCount;
}

- (void)setRingSegmentCount:(NSInteger)ringSegmentCount
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNTorus setRingSegmentCount:].cold.1();
  }
  else if (self->_torusringSegmentCount != ringSegmentCount)
  {
    self->_torusringSegmentCount = ringSegmentCount;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __32__SCNTorus_setRingSegmentCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = ringSegmentCount;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("ringSegmentCount"), v7);
  }
}

void __32__SCNTorus_setRingSegmentCount___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetRingSegmentCount(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_DWORD *)(a1 + 40));
}

- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4
{
  __C3DScene *v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  float64_t v14;
  float32x4_t v15;
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
      C3DTorusGetBoundingBox((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"), (uint64_t)&v23, (uint64_t)&v21);
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
      v20.super_class = (Class)SCNTorus;
      return -[SCNGeometry getBoundingBoxMin:max:](&v20, sel_getBoundingBoxMin_max_, a3, a4);
    }
    -[SCNTorus ringRadius](self, "ringRadius");
    v12 = v11;
    -[SCNTorus pipeRadius](self, "pipeRadius");
    v14 = v13;
    v15.i64[0] = v12;
    C3DTorusGetBoundingBoxForTorusParameters((uint64_t)&v23, (uint64_t)&v21, v15, v14);
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
      && C3DTorusGetBoundingSphere((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"), &v16))
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
  -[SCNTorus ringRadius](self, "ringRadius");
  v12 = v11;
  -[SCNTorus pipeRadius](self, "pipeRadius");
  if (!C3DTorusGetBoundingSphereForTorusParameters(&v16, v12, v13))
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

+ (SCNTorus)torusWithRingRadius:(CGFloat)ringRadius pipeRadius:(CGFloat)pipeRadius
{
  id v6;

  v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v6, "setRingRadius:", ringRadius);
  objc_msgSend(v6, "setPipeRadius:", pipeRadius);
  return (SCNTorus *)v6;
}

- (id)description
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[SCNGeometry geometryDescription](self, "geometryDescription");
  -[SCNTorus ringRadius](self, "ringRadius");
  v6 = v5;
  -[SCNTorus pipeRadius](self, "pipeRadius");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ | ringRadius=%.3f pipeRadius=%.3f>"), v4, v6, v7);
}

- (void)_setupObjCModelFrom:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNTorus;
  -[SCNGeometry _setupObjCModelFrom:](&v5, sel__setupObjCModelFrom_);
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  objc_msgSend(a3, "ringRadius");
  -[SCNTorus setRingRadius:](self, "setRingRadius:");
  objc_msgSend(a3, "pipeRadius");
  -[SCNTorus setPipeRadius:](self, "setPipeRadius:");
  objc_msgSend(a3, "radialSpan");
  -[SCNTorus setRadialSpan:](self, "setRadialSpan:");
  -[SCNTorus setRingSegmentCount:](self, "setRingSegmentCount:", objc_msgSend(a3, "ringSegmentCount"));
  -[SCNTorus setPipeSegmentCount:](self, "setPipeSegmentCount:", objc_msgSend(a3, "pipeSegmentCount"));
  -[SCNTorus setPrimitiveType:](self, "setPrimitiveType:", objc_msgSend(a3, "primitiveType"));
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
  return -[SCNTorus copyWithZone:](self, "copyWithZone:", 0);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNTorus;
  -[SCNGeometry encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    -[SCNTorus _syncObjCModel:](self, "_syncObjCModel:", -[SCNGeometry geometryRef](self, "geometryRef"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("torusringRadius"), self->_torusringRadius);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("toruspipeRadius"), self->_toruspipeRadius);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("torusradialSpan"), self->_torusradialSpan);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_torusringSegmentCount, CFSTR("torusringSegmentCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_toruspipeSegmentCount, CFSTR("toruspipeSegmentCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_torusprimitiveType, CFSTR("torusprimitiveType"));
}

- (SCNTorus)initWithCoder:(id)a3
{
  SCNTorus *v4;
  _BOOL8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNTorus;
  v4 = -[SCNGeometry initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("torusringRadius"));
    -[SCNTorus setRingRadius:](v4, "setRingRadius:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("toruspipeRadius"));
    -[SCNTorus setPipeRadius:](v4, "setPipeRadius:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("torusradialSpan"));
    -[SCNTorus setRadialSpan:](v4, "setRadialSpan:");
    -[SCNTorus setRingSegmentCount:](v4, "setRingSegmentCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("torusringSegmentCount")));
    -[SCNTorus setPipeSegmentCount:](v4, "setPipeSegmentCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("toruspipeSegmentCount")));
    -[SCNTorus setPrimitiveType:](v4, "setPrimitiveType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("torusprimitiveType")));
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setPipeRadius:.cold.1()
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

- (void)setPipeSegmentCount:.cold.1()
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

- (void)setRingRadius:.cold.1()
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

- (void)setRingSegmentCount:.cold.1()
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
