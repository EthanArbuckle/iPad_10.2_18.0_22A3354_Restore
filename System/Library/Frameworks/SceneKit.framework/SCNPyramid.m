@implementation SCNPyramid

- (SCNPyramid)init
{
  const void *v3;
  SCNPyramid *v4;
  SCNPyramid *v5;
  objc_super v7;
  objc_super v8;

  v3 = (const void *)C3DParametricGeometryCreate(0, (__int128 *)kC3DPyramidCallBacks);
  v8.receiver = self;
  v8.super_class = (Class)SCNPyramid;
  v4 = -[SCNGeometry initWithGeometryRef:](&v8, sel_initWithGeometryRef_, v3);
  v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)SCNPyramid;
    -[SCNGeometry _syncObjCModel](&v7, sel__syncObjCModel);
    -[SCNPyramid _syncObjCModel:](v5, "_syncObjCModel:", -[SCNGeometry geometryRef](v5, "geometryRef"));
  }
  CFRelease(v3);
  return v5;
}

- (SCNPyramid)initWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  SCNPyramid *v3;
  SCNPyramid *v4;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNPyramid;
  v3 = -[SCNGeometry initWithGeometryRef:](&v7, sel_initWithGeometryRef_, a3);
  v4 = v3;
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)SCNPyramid;
    -[SCNGeometry _syncObjCModel](&v6, sel__syncObjCModel);
    -[SCNPyramid _syncObjCModel:](v4, "_syncObjCModel:", -[SCNGeometry geometryRef](v4, "geometryRef"));
  }
  return v4;
}

- (__C3DGeometry)__createCFObject
{
  return (__C3DGeometry *)C3DParametricGeometryCreate(0, (__int128 *)kC3DPyramidCallBacks);
}

- (id)initPresentationParametricGeometryWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNPyramid;
  return -[SCNGeometry initPresentationGeometryWithGeometryRef:](&v4, sel_initPresentationGeometryWithGeometryRef_, a3);
}

- (id)presentationPyramid
{
  return -[SCNPyramid initPresentationParametricGeometryWithParametricGeometryRef:]([SCNPyramid alloc], "initPresentationParametricGeometryWithParametricGeometryRef:", -[SCNGeometry geometryRef](self, "geometryRef"));
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (void)_syncObjCModel:(__C3DParametricGeometry *)a3
{
  self->_pyramidwidth = C3DParametricGeometryGetFloatValue((uint64_t)a3, 0);
  self->_pyramidheight = C3DParametricGeometryGetFloatValue((uint64_t)a3, 1);
  self->_pyramidlength = C3DParametricGeometryGetFloatValue((uint64_t)a3, 2);
  self->_pyramidwidthSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 11);
  self->_pyramidheightSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 12);
  self->_pyramidlengthSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 13);
  self->_pyramidprimitiveType = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 20);
}

- (CGFloat)height
{
  __C3DScene *v3;
  uint64_t v4;
  double Height;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_pyramidheight;
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
      -[SCNPyramid setHeight:].cold.1();
  }
  else if (self->_pyramidheight != height)
  {
    self->_pyramidheight = height;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __24__SCNPyramid_setHeight___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = height;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("height"), v7);
  }
}

float __24__SCNPyramid_setHeight___block_invoke(uint64_t a1)
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
    return self->_pyramidheightSegmentCount;
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
      -[SCNPyramid setHeightSegmentCount:].cold.1();
  }
  else if (self->_pyramidheightSegmentCount != heightSegmentCount)
  {
    self->_pyramidheightSegmentCount = heightSegmentCount;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__SCNPyramid_setHeightSegmentCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = heightSegmentCount;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("heightSegmentCount"), v7);
  }
}

void __36__SCNPyramid_setHeightSegmentCount___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetHeightSegmentCount(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_DWORD *)(a1 + 40));
}

- (CGFloat)length
{
  __C3DScene *v3;
  uint64_t v4;
  double Length;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_pyramidlength;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  Length = C3DParametricGeometryGetLength((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return Length;
}

- (void)setLength:(CGFloat)length
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNPyramid setLength:].cold.1();
  }
  else if (self->_pyramidlength != length)
  {
    self->_pyramidlength = length;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __24__SCNPyramid_setLength___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = length;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("length"), v7);
  }
}

float __24__SCNPyramid_setLength___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DParametricGeometrySetLength(v2, v3);
  return result;
}

- (NSInteger)lengthSegmentCount
{
  __C3DScene *v3;
  uint64_t v4;
  NSInteger LengthSegmentCount;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_pyramidlengthSegmentCount;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  LengthSegmentCount = (int)C3DParametricGeometryGetLengthSegmentCount((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return LengthSegmentCount;
}

- (void)setLengthSegmentCount:(NSInteger)lengthSegmentCount
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNPyramid setLengthSegmentCount:].cold.1();
  }
  else if (self->_pyramidlengthSegmentCount != lengthSegmentCount)
  {
    self->_pyramidlengthSegmentCount = lengthSegmentCount;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__SCNPyramid_setLengthSegmentCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = lengthSegmentCount;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("lengthSegmentCount"), v7);
  }
}

void __36__SCNPyramid_setLengthSegmentCount___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetLengthSegmentCount(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_DWORD *)(a1 + 40));
}

- (int64_t)primitiveType
{
  __C3DScene *v3;
  uint64_t v4;
  int64_t PrimitiveType;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_pyramidprimitiveType;
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
      -[SCNPyramid setPrimitiveType:].cold.1();
  }
  else if (self->_pyramidprimitiveType != a3)
  {
    self->_pyramidprimitiveType = a3;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __31__SCNPyramid_setPrimitiveType___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __31__SCNPyramid_setPrimitiveType___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetPrimitiveType(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(char *)(a1 + 40));
}

- (CGFloat)width
{
  __C3DScene *v3;
  uint64_t v4;
  double Width;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_pyramidwidth;
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
      -[SCNPyramid setWidth:].cold.1();
  }
  else if (self->_pyramidwidth != width)
  {
    self->_pyramidwidth = width;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __23__SCNPyramid_setWidth___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = width;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("width"), v7);
  }
}

float __23__SCNPyramid_setWidth___block_invoke(uint64_t a1)
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
    return self->_pyramidwidthSegmentCount;
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
      -[SCNPyramid setWidthSegmentCount:].cold.1();
  }
  else if (self->_pyramidwidthSegmentCount != widthSegmentCount)
  {
    self->_pyramidwidthSegmentCount = widthSegmentCount;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __35__SCNPyramid_setWidthSegmentCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = widthSegmentCount;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("widthSegmentCount"), v7);
  }
}

void __35__SCNPyramid_setWidthSegmentCount___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetWidthSegmentCount(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_DWORD *)(a1 + 40));
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
  double v14;
  double v15;
  float64_t v16;
  int32x4_t v17;
  BOOL v18;
  float v19;
  float v20;
  objc_super v22;
  uint64_t v23;
  float v24;
  uint64_t v25;
  float v26;

  v26 = 0.0;
  v25 = 0;
  v24 = 0.0;
  v23 = 0;
  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v7 = -[SCNGeometry sceneRef](self, "sceneRef");
    v8 = (uint64_t)v7;
    if (v7)
      C3DSceneLock((uint64_t)v7);
    if (-[SCNGeometry geometryRef](self, "geometryRef"))
    {
      C3DPyramidGetBoundingBox((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"), (uint64_t)&v25, (uint64_t)&v23);
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
      v22.receiver = self;
      v22.super_class = (Class)SCNPyramid;
      return -[SCNGeometry getBoundingBoxMin:max:](&v22, sel_getBoundingBoxMin_max_, a3, a4);
    }
    -[SCNPyramid width](self, "width");
    v12 = v11;
    -[SCNPyramid height](self, "height");
    v14 = v13;
    -[SCNPyramid length](self, "length");
    v16 = v15;
    v17.i64[0] = v12;
    C3DPyramidGetBoundingBoxForPyramidParameters((uint64_t)&v25, (uint64_t)&v23, v17, v14, v16);
    v10 = v18;
  }
LABEL_12:
  if (a3)
  {
    v19 = v26;
    *(_QWORD *)&a3->x = v25;
    a3->z = v19;
  }
  if (a4)
  {
    v20 = v24;
    *(_QWORD *)&a4->x = v23;
    a4->z = v20;
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
  float64_t v14;
  float64x2_t v15;
  double v16;
  float v17;
  int32x4_t v19;

  v19 = 0uLL;
  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v7 = -[SCNGeometry sceneRef](self, "sceneRef");
    v8 = (uint64_t)v7;
    if (v7)
      C3DSceneLock((uint64_t)v7);
    if (-[SCNGeometry geometryRef](self, "geometryRef")
      && C3DPyramidGetBoundingSphere((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"), &v19))
    {
      if (a3)
      {
        v9 = *(float *)&v19.i32[2];
        *(_QWORD *)&a3->x = v19.i64[0];
        a3->z = v9;
      }
      if (a4)
        *a4 = *(float *)&v19.i32[3];
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
  -[SCNPyramid width](self, "width");
  v12 = v11;
  -[SCNPyramid height](self, "height");
  v14 = v13;
  -[SCNPyramid length](self, "length");
  v15.f64[0] = v14;
  if (!C3DPyramidGetBoundingSphereForPyramidParameters(&v19, v12, v15, v16))
    return 0;
  if (a3)
  {
    v17 = *(float *)&v19.i32[2];
    *(_QWORD *)&a3->x = v19.i64[0];
    a3->z = v17;
  }
  if (a4)
    *a4 = *(float *)&v19.i32[3];
  return 1;
}

+ (SCNPyramid)pyramidWithWidth:(CGFloat)width height:(CGFloat)height length:(CGFloat)length
{
  id v8;

  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setWidth:", width);
  objc_msgSend(v8, "setHeight:", height);
  objc_msgSend(v8, "setLength:", length);
  return (SCNPyramid *)v8;
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
  -[SCNPyramid width](self, "width");
  v6 = v5;
  -[SCNPyramid height](self, "height");
  v8 = v7;
  -[SCNPyramid length](self, "length");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ | width=%.3f height=%.3f length=%.3f>"), v4, v6, v8, v9);
}

- (void)_setupObjCModelFrom:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNPyramid;
  -[SCNGeometry _setupObjCModelFrom:](&v5, sel__setupObjCModelFrom_);
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  objc_msgSend(a3, "width");
  -[SCNPyramid setWidth:](self, "setWidth:");
  objc_msgSend(a3, "height");
  -[SCNPyramid setHeight:](self, "setHeight:");
  objc_msgSend(a3, "length");
  -[SCNPyramid setLength:](self, "setLength:");
  -[SCNPyramid setWidthSegmentCount:](self, "setWidthSegmentCount:", objc_msgSend(a3, "widthSegmentCount"));
  -[SCNPyramid setHeightSegmentCount:](self, "setHeightSegmentCount:", objc_msgSend(a3, "heightSegmentCount"));
  -[SCNPyramid setLengthSegmentCount:](self, "setLengthSegmentCount:", objc_msgSend(a3, "lengthSegmentCount"));
  -[SCNPyramid setPrimitiveType:](self, "setPrimitiveType:", objc_msgSend(a3, "primitiveType"));
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
  return -[SCNPyramid copyWithZone:](self, "copyWithZone:", 0);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNPyramid;
  -[SCNGeometry encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    -[SCNPyramid _syncObjCModel:](self, "_syncObjCModel:", -[SCNGeometry geometryRef](self, "geometryRef"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("pyramidwidth"), self->_pyramidwidth);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("pyramidheight"), self->_pyramidheight);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("pyramidlength"), self->_pyramidlength);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_pyramidwidthSegmentCount, CFSTR("pyramidwidthSegmentCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_pyramidheightSegmentCount, CFSTR("pyramidheightSegmentCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_pyramidlengthSegmentCount, CFSTR("pyramidlengthSegmentCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_pyramidprimitiveType, CFSTR("pyramidprimitiveType"));
}

- (SCNPyramid)initWithCoder:(id)a3
{
  SCNPyramid *v4;
  _BOOL8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNPyramid;
  v4 = -[SCNGeometry initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("pyramidwidth"));
    -[SCNPyramid setWidth:](v4, "setWidth:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("pyramidheight"));
    -[SCNPyramid setHeight:](v4, "setHeight:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("pyramidlength"));
    -[SCNPyramid setLength:](v4, "setLength:");
    -[SCNPyramid setWidthSegmentCount:](v4, "setWidthSegmentCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("pyramidwidthSegmentCount")));
    -[SCNPyramid setHeightSegmentCount:](v4, "setHeightSegmentCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("pyramidheightSegmentCount")));
    -[SCNPyramid setLengthSegmentCount:](v4, "setLengthSegmentCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("pyramidlengthSegmentCount")));
    -[SCNPyramid setPrimitiveType:](v4, "setPrimitiveType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("pyramidprimitiveType")));
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

- (void)setLength:.cold.1()
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

- (void)setLengthSegmentCount:.cold.1()
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
