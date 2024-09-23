@implementation SCNPlane

- (SCNPlane)init
{
  const void *v3;
  SCNPlane *v4;
  SCNPlane *v5;
  objc_super v7;
  objc_super v8;

  v3 = (const void *)C3DParametricGeometryCreate(0, (__int128 *)kC3DPlaneCallBacks);
  v8.receiver = self;
  v8.super_class = (Class)SCNPlane;
  v4 = -[SCNGeometry initWithGeometryRef:](&v8, sel_initWithGeometryRef_, v3);
  v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)SCNPlane;
    -[SCNGeometry _syncObjCModel](&v7, sel__syncObjCModel);
    -[SCNPlane _syncObjCModel:](v5, "_syncObjCModel:", -[SCNGeometry geometryRef](v5, "geometryRef"));
  }
  CFRelease(v3);
  return v5;
}

- (SCNPlane)initWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  SCNPlane *v3;
  SCNPlane *v4;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNPlane;
  v3 = -[SCNGeometry initWithGeometryRef:](&v7, sel_initWithGeometryRef_, a3);
  v4 = v3;
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)SCNPlane;
    -[SCNGeometry _syncObjCModel](&v6, sel__syncObjCModel);
    -[SCNPlane _syncObjCModel:](v4, "_syncObjCModel:", -[SCNGeometry geometryRef](v4, "geometryRef"));
  }
  return v4;
}

- (__C3DGeometry)__createCFObject
{
  return (__C3DGeometry *)C3DParametricGeometryCreate(0, (__int128 *)kC3DPlaneCallBacks);
}

- (id)initPresentationParametricGeometryWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNPlane;
  return -[SCNGeometry initPresentationGeometryWithGeometryRef:](&v4, sel_initPresentationGeometryWithGeometryRef_, a3);
}

- (id)presentationPlane
{
  return -[SCNPlane initPresentationParametricGeometryWithParametricGeometryRef:]([SCNPlane alloc], "initPresentationParametricGeometryWithParametricGeometryRef:", -[SCNGeometry geometryRef](self, "geometryRef"));
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (void)_syncObjCModel:(__C3DParametricGeometry *)a3
{
  self->_width = C3DParametricGeometryGetFloatValue((uint64_t)a3, 0);
  self->_height = C3DParametricGeometryGetFloatValue((uint64_t)a3, 1);
  self->_cornerRadius = C3DParametricGeometryGetFloatValue((uint64_t)a3, 3);
  self->_widthSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 11);
  self->_heightSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 12);
  self->_cornerSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 14);
  self->_primitiveType = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 20);
}

- (CGFloat)cornerRadius
{
  __C3DScene *v3;
  uint64_t v4;
  double ChamferRadius;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_cornerRadius;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  ChamferRadius = C3DParametricGeometryGetChamferRadius((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return ChamferRadius;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNPlane setCornerRadius:].cold.1();
  }
  else if (self->_cornerRadius != cornerRadius)
  {
    self->_cornerRadius = cornerRadius;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __28__SCNPlane_setCornerRadius___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = cornerRadius;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("cornerRadius"), v7);
  }
}

float __28__SCNPlane_setCornerRadius___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DParametricGeometrySetChamferRadius(v2, v3);
  return result;
}

- (NSInteger)cornerSegmentCount
{
  __C3DScene *v3;
  uint64_t v4;
  NSInteger ChamferSegmentCount;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_cornerSegmentCount;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  ChamferSegmentCount = (int)C3DParametricGeometryGetChamferSegmentCount((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return ChamferSegmentCount;
}

- (void)setCornerSegmentCount:(NSInteger)cornerSegmentCount
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNPlane setCornerSegmentCount:].cold.1();
  }
  else if (self->_cornerSegmentCount != cornerSegmentCount)
  {
    self->_cornerSegmentCount = cornerSegmentCount;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __34__SCNPlane_setCornerSegmentCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = cornerSegmentCount;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("cornerSegmentCount"), v7);
  }
}

void __34__SCNPlane_setCornerSegmentCount___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetChamferSegmentCount(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_DWORD *)(a1 + 40));
}

- (CGFloat)height
{
  __C3DScene *v3;
  uint64_t v4;
  double Height;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_height;
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
      -[SCNPlane setHeight:].cold.1();
  }
  else if (self->_height != height)
  {
    self->_height = height;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __22__SCNPlane_setHeight___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = height;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("height"), v7);
  }
}

float __22__SCNPlane_setHeight___block_invoke(uint64_t a1)
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
    return self->_heightSegmentCount;
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
      -[SCNPlane setHeightSegmentCount:].cold.1();
  }
  else if (self->_heightSegmentCount != heightSegmentCount)
  {
    self->_heightSegmentCount = heightSegmentCount;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __34__SCNPlane_setHeightSegmentCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = heightSegmentCount;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("heightSegmentCount"), v7);
  }
}

void __34__SCNPlane_setHeightSegmentCount___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetHeightSegmentCount(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_DWORD *)(a1 + 40));
}

- (int64_t)primitiveType
{
  __C3DScene *v3;
  uint64_t v4;
  int64_t PrimitiveType;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_primitiveType;
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
      -[SCNPlane setPrimitiveType:].cold.1();
  }
  else if (self->_primitiveType != a3)
  {
    self->_primitiveType = a3;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __29__SCNPlane_setPrimitiveType___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __29__SCNPlane_setPrimitiveType___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetPrimitiveType(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(char *)(a1 + 40));
}

- (CGFloat)width
{
  __C3DScene *v3;
  uint64_t v4;
  double Width;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_width;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  Width = C3DParametricGeometryGetWidth((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return Width;
}

- (void)setWidth:(CGFloat)width
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNPlane setWidth:].cold.1();
  }
  else if (self->_width != width)
  {
    self->_width = width;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __21__SCNPlane_setWidth___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = width;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("width"), v7);
  }
}

float __21__SCNPlane_setWidth___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DParametricGeometrySetWidth(v2, v3);
  return result;
}

- (NSInteger)widthSegmentCount
{
  __C3DScene *v3;
  uint64_t v4;
  NSInteger WidthSegmentCount;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_widthSegmentCount;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  WidthSegmentCount = (int)C3DParametricGeometryGetWidthSegmentCount((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return WidthSegmentCount;
}

- (void)setWidthSegmentCount:(NSInteger)widthSegmentCount
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNPlane setWidthSegmentCount:].cold.1();
  }
  else if (self->_widthSegmentCount != widthSegmentCount)
  {
    self->_widthSegmentCount = widthSegmentCount;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__SCNPlane_setWidthSegmentCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = widthSegmentCount;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("widthSegmentCount"), v7);
  }
}

void __33__SCNPlane_setWidthSegmentCount___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetWidthSegmentCount(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_DWORD *)(a1 + 40));
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
  float64_t v14;
  float64x2_t v15;
  BOOL v16;
  float v17;
  float v18;
  objc_super v20;
  float32x2_t v21;
  float v22;
  float32x2_t v23;
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
      C3DPlaneGetBoundingBox((float32x2_t *)-[SCNGeometry geometryRef](self, "geometryRef"), &v23, &v21);
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
      v20.super_class = (Class)SCNPlane;
      return -[SCNGeometry getBoundingBoxMin:max:](&v20, sel_getBoundingBoxMin_max_, a3, a4);
    }
    -[SCNPlane width](self, "width");
    v12 = v11;
    -[SCNPlane height](self, "height");
    v14 = v13;
    v15.f64[0] = v12;
    C3DPlaneGetBoundingBoxForPlaneParameters(&v23, (uint64_t)&v21, v15, v14);
    v10 = v16;
  }
LABEL_12:
  if (a3)
  {
    v17 = v24;
    *(float32x2_t *)&a3->x = v23;
    a3->z = v17;
  }
  if (a4)
  {
    v18 = v22;
    *(float32x2_t *)&a4->x = v21;
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
      && C3DPlaneGetBoundingSphere((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"), &v16))
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
  -[SCNPlane width](self, "width");
  v12 = v11;
  -[SCNPlane height](self, "height");
  if (!C3DPlaneGetBoundingSphereForPlaneParameters(&v16, v12, v13))
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

+ (SCNPlane)planeWithWidth:(CGFloat)width height:(CGFloat)height
{
  id v6;

  v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v6, "setWidth:", width);
  objc_msgSend(v6, "setHeight:", height);
  return (SCNPlane *)v6;
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
  -[SCNPlane width](self, "width");
  v6 = v5;
  -[SCNPlane height](self, "height");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ | width=%.3f height=%.3f>"), v4, v6, v7);
}

- (void)_setupObjCModelFrom:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNPlane;
  -[SCNGeometry _setupObjCModelFrom:](&v5, sel__setupObjCModelFrom_);
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  objc_msgSend(a3, "width");
  -[SCNPlane setWidth:](self, "setWidth:");
  objc_msgSend(a3, "height");
  -[SCNPlane setHeight:](self, "setHeight:");
  objc_msgSend(a3, "cornerRadius");
  -[SCNPlane setCornerRadius:](self, "setCornerRadius:");
  -[SCNPlane setWidthSegmentCount:](self, "setWidthSegmentCount:", objc_msgSend(a3, "widthSegmentCount"));
  -[SCNPlane setHeightSegmentCount:](self, "setHeightSegmentCount:", objc_msgSend(a3, "heightSegmentCount"));
  -[SCNPlane setCornerSegmentCount:](self, "setCornerSegmentCount:", objc_msgSend(a3, "cornerSegmentCount"));
  -[SCNPlane setPrimitiveType:](self, "setPrimitiveType:", objc_msgSend(a3, "primitiveType"));
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
  return -[SCNPlane copyWithZone:](self, "copyWithZone:", 0);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNPlane;
  -[SCNGeometry encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    -[SCNPlane _syncObjCModel:](self, "_syncObjCModel:", -[SCNGeometry geometryRef](self, "geometryRef"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("width"), self->_width);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("height"), self->_height);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("cornerRadius"), self->_cornerRadius);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_widthSegmentCount, CFSTR("widthSegmentCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_heightSegmentCount, CFSTR("heightSegmentCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_cornerSegmentCount, CFSTR("cornerSegmentCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_primitiveType, CFSTR("primitiveType"));
}

- (SCNPlane)initWithCoder:(id)a3
{
  SCNPlane *v4;
  _BOOL8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNPlane;
  v4 = -[SCNGeometry initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("width"));
    -[SCNPlane setWidth:](v4, "setWidth:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("height"));
    -[SCNPlane setHeight:](v4, "setHeight:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("cornerRadius"));
    -[SCNPlane setCornerRadius:](v4, "setCornerRadius:");
    -[SCNPlane setWidthSegmentCount:](v4, "setWidthSegmentCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("widthSegmentCount")));
    -[SCNPlane setHeightSegmentCount:](v4, "setHeightSegmentCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("heightSegmentCount")));
    -[SCNPlane setCornerSegmentCount:](v4, "setCornerSegmentCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("cornerSegmentCount")));
    -[SCNPlane setPrimitiveType:](v4, "setPrimitiveType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("primitiveType")));
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setCornerRadius:.cold.1()
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

- (void)setCornerSegmentCount:.cold.1()
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

- (void)setWidth:.cold.1()
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

- (void)setWidthSegmentCount:.cold.1()
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
