@implementation SCNBox

- (SCNBox)init
{
  const void *v3;
  SCNBox *v4;
  SCNBox *v5;
  objc_super v7;
  objc_super v8;

  v3 = (const void *)C3DParametricGeometryCreate(0, (__int128 *)&kC3DBoxCallBacks);
  v8.receiver = self;
  v8.super_class = (Class)SCNBox;
  v4 = -[SCNGeometry initWithGeometryRef:](&v8, sel_initWithGeometryRef_, v3);
  v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)SCNBox;
    -[SCNGeometry _syncObjCModel](&v7, sel__syncObjCModel);
    -[SCNBox _syncObjCModel:](v5, "_syncObjCModel:", -[SCNGeometry geometryRef](v5, "geometryRef"));
  }
  CFRelease(v3);
  return v5;
}

- (SCNBox)initWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  SCNBox *v3;
  SCNBox *v4;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNBox;
  v3 = -[SCNGeometry initWithGeometryRef:](&v7, sel_initWithGeometryRef_, a3);
  v4 = v3;
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)SCNBox;
    -[SCNGeometry _syncObjCModel](&v6, sel__syncObjCModel);
    -[SCNBox _syncObjCModel:](v4, "_syncObjCModel:", -[SCNGeometry geometryRef](v4, "geometryRef"));
  }
  return v4;
}

- (__C3DGeometry)__createCFObject
{
  return (__C3DGeometry *)C3DParametricGeometryCreate(0, (__int128 *)&kC3DBoxCallBacks);
}

- (id)initPresentationParametricGeometryWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNBox;
  return -[SCNGeometry initPresentationGeometryWithGeometryRef:](&v4, sel_initPresentationGeometryWithGeometryRef_, a3);
}

- (id)presentationBox
{
  return -[SCNBox initPresentationParametricGeometryWithParametricGeometryRef:]([SCNBox alloc], "initPresentationParametricGeometryWithParametricGeometryRef:", -[SCNGeometry geometryRef](self, "geometryRef"));
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (void)_syncObjCModel:(__C3DParametricGeometry *)a3
{
  self->_boxwidth = C3DParametricGeometryGetFloatValue((uint64_t)a3, 0);
  self->_boxheight = C3DParametricGeometryGetFloatValue((uint64_t)a3, 1);
  self->_boxlength = C3DParametricGeometryGetFloatValue((uint64_t)a3, 2);
  self->_boxchamferRadius = C3DParametricGeometryGetFloatValue((uint64_t)a3, 3);
  self->_boxwidthSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 11);
  self->_boxheightSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 12);
  self->_boxlengthSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 13);
  self->_boxchamferSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 14);
  self->_boxprimitiveType = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 20);
}

- (CGFloat)chamferRadius
{
  __C3DScene *v3;
  uint64_t v4;
  double ChamferRadius;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_boxchamferRadius;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  ChamferRadius = C3DParametricGeometryGetChamferRadius((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return ChamferRadius;
}

- (void)setChamferRadius:(CGFloat)chamferRadius
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNBox setChamferRadius:].cold.1();
  }
  else if (self->_boxchamferRadius != chamferRadius)
  {
    self->_boxchamferRadius = chamferRadius;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __27__SCNBox_setChamferRadius___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = chamferRadius;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("chamferRadius"), v7);
  }
}

float __27__SCNBox_setChamferRadius___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DParametricGeometrySetChamferRadius(v2, v3);
  return result;
}

- (NSInteger)chamferSegmentCount
{
  __C3DScene *v3;
  uint64_t v4;
  NSInteger ChamferSegmentCount;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_boxchamferSegmentCount;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  ChamferSegmentCount = (int)C3DParametricGeometryGetChamferSegmentCount((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return ChamferSegmentCount;
}

- (void)setChamferSegmentCount:(NSInteger)chamferSegmentCount
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNBox setChamferSegmentCount:].cold.1();
  }
  else if (self->_boxchamferSegmentCount != chamferSegmentCount)
  {
    self->_boxchamferSegmentCount = chamferSegmentCount;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__SCNBox_setChamferSegmentCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = chamferSegmentCount;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("chamferSegmentCount"), v7);
  }
}

void __33__SCNBox_setChamferSegmentCount___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetChamferSegmentCount(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_DWORD *)(a1 + 40));
}

- (CGFloat)height
{
  __C3DScene *v3;
  uint64_t v4;
  double Height;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_boxheight;
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
      -[SCNBox setHeight:].cold.1();
  }
  else if (self->_boxheight != height)
  {
    self->_boxheight = height;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __20__SCNBox_setHeight___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = height;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("height"), v7);
  }
}

float __20__SCNBox_setHeight___block_invoke(uint64_t a1)
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
    return self->_boxheightSegmentCount;
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
      -[SCNBox setHeightSegmentCount:].cold.1();
  }
  else if (self->_boxheightSegmentCount != heightSegmentCount)
  {
    self->_boxheightSegmentCount = heightSegmentCount;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __32__SCNBox_setHeightSegmentCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = heightSegmentCount;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("heightSegmentCount"), v7);
  }
}

void __32__SCNBox_setHeightSegmentCount___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetHeightSegmentCount(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_DWORD *)(a1 + 40));
}

- (CGFloat)length
{
  __C3DScene *v3;
  uint64_t v4;
  double Length;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_boxlength;
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
      -[SCNBox setLength:].cold.1();
  }
  else if (self->_boxlength != length)
  {
    self->_boxlength = length;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __20__SCNBox_setLength___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = length;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("length"), v7);
  }
}

float __20__SCNBox_setLength___block_invoke(uint64_t a1)
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
    return self->_boxlengthSegmentCount;
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
      -[SCNBox setLengthSegmentCount:].cold.1();
  }
  else if (self->_boxlengthSegmentCount != lengthSegmentCount)
  {
    self->_boxlengthSegmentCount = lengthSegmentCount;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __32__SCNBox_setLengthSegmentCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = lengthSegmentCount;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("lengthSegmentCount"), v7);
  }
}

void __32__SCNBox_setLengthSegmentCount___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetLengthSegmentCount(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_DWORD *)(a1 + 40));
}

- (int64_t)primitiveType
{
  __C3DScene *v3;
  uint64_t v4;
  int64_t PrimitiveType;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_boxprimitiveType;
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
      -[SCNBox setPrimitiveType:].cold.1();
  }
  else if (self->_boxprimitiveType != a3)
  {
    self->_boxprimitiveType = a3;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __27__SCNBox_setPrimitiveType___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __27__SCNBox_setPrimitiveType___block_invoke(uint64_t a1)
{
  C3DParametricGeometrySetPrimitiveType(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(char *)(a1 + 40));
}

- (CGFloat)width
{
  __C3DScene *v3;
  uint64_t v4;
  double Width;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_boxwidth;
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
      -[SCNBox setWidth:].cold.1();
  }
  else if (self->_boxwidth != width)
  {
    self->_boxwidth = width;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __19__SCNBox_setWidth___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = width;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("width"), v7);
  }
}

float __19__SCNBox_setWidth___block_invoke(uint64_t a1)
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
    return self->_boxwidthSegmentCount;
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
      -[SCNBox setWidthSegmentCount:].cold.1();
  }
  else if (self->_boxwidthSegmentCount != widthSegmentCount)
  {
    self->_boxwidthSegmentCount = widthSegmentCount;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __31__SCNBox_setWidthSegmentCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = widthSegmentCount;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("widthSegmentCount"), v7);
  }
}

void __31__SCNBox_setWidthSegmentCount___block_invoke(uint64_t a1)
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
  double v15;
  double v16;
  float64x2_t v17;
  BOOL v18;
  float v19;
  float v20;
  objc_super v22;
  float32x2_t v23;
  float v24;
  float32x2_t v25;
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
      C3DBoxGetBoundingBox((float32x2_t *)-[SCNGeometry geometryRef](self, "geometryRef"), &v25, &v23);
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
      v22.super_class = (Class)SCNBox;
      return -[SCNGeometry getBoundingBoxMin:max:](&v22, sel_getBoundingBoxMin_max_, a3, a4);
    }
    -[SCNBox width](self, "width");
    v12 = v11;
    -[SCNBox height](self, "height");
    v14 = v13;
    -[SCNBox length](self, "length");
    v16 = v15;
    v17.f64[0] = v12;
    C3DBoxGetBoundingBoxForBoxParameters(&v25, (uint64_t)&v23, v17, v14, v16);
    v10 = v18;
  }
LABEL_12:
  if (a3)
  {
    v19 = v26;
    *(float32x2_t *)&a3->x = v25;
    a3->z = v19;
  }
  if (a4)
  {
    v20 = v24;
    *(float32x2_t *)&a4->x = v23;
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
      && C3DBoxGetBoundingSphere((float *)-[SCNGeometry geometryRef](self, "geometryRef"), &v18))
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
  -[SCNBox width](self, "width");
  v12 = v11;
  -[SCNBox height](self, "height");
  v14 = v13;
  -[SCNBox length](self, "length");
  if (!C3DBoxGetBoundingSphereForBoxParameters(&v18, v12, v14, v15))
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

+ (SCNBox)boxWithWidth:(CGFloat)width height:(CGFloat)height length:(CGFloat)length chamferRadius:(CGFloat)chamferRadius
{
  id v10;

  v10 = objc_alloc_init((Class)a1);
  objc_msgSend(v10, "setWidth:", width);
  objc_msgSend(v10, "setHeight:", height);
  objc_msgSend(v10, "setLength:", length);
  objc_msgSend(v10, "setChamferRadius:", chamferRadius);
  return (SCNBox *)v10;
}

+ (id)box
{
  return (id)objc_msgSend(a1, "boxWithWidth:height:length:chamferRadius:", 1.0, 1.0, 1.0, 0.0);
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
  uint64_t v10;
  uint64_t v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[SCNGeometry geometryDescription](self, "geometryDescription");
  -[SCNBox width](self, "width");
  v6 = v5;
  -[SCNBox height](self, "height");
  v8 = v7;
  -[SCNBox length](self, "length");
  v10 = v9;
  -[SCNBox chamferRadius](self, "chamferRadius");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ | width=%.3f height=%.3f length=%.3f chamferRadius=%.3f>"), v4, v6, v8, v10, v11);
}

- (void)_setupObjCModelFrom:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNBox;
  -[SCNGeometry _setupObjCModelFrom:](&v5, sel__setupObjCModelFrom_);
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  objc_msgSend(a3, "width");
  -[SCNBox setWidth:](self, "setWidth:");
  objc_msgSend(a3, "height");
  -[SCNBox setHeight:](self, "setHeight:");
  objc_msgSend(a3, "length");
  -[SCNBox setLength:](self, "setLength:");
  objc_msgSend(a3, "chamferRadius");
  -[SCNBox setChamferRadius:](self, "setChamferRadius:");
  -[SCNBox setWidthSegmentCount:](self, "setWidthSegmentCount:", objc_msgSend(a3, "widthSegmentCount"));
  -[SCNBox setHeightSegmentCount:](self, "setHeightSegmentCount:", objc_msgSend(a3, "heightSegmentCount"));
  -[SCNBox setLengthSegmentCount:](self, "setLengthSegmentCount:", objc_msgSend(a3, "lengthSegmentCount"));
  -[SCNBox setChamferSegmentCount:](self, "setChamferSegmentCount:", objc_msgSend(a3, "chamferSegmentCount"));
  -[SCNBox setPrimitiveType:](self, "setPrimitiveType:", objc_msgSend(a3, "primitiveType"));
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
  return -[SCNBox copyWithZone:](self, "copyWithZone:", 0);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNBox;
  -[SCNGeometry encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    -[SCNBox _syncObjCModel:](self, "_syncObjCModel:", -[SCNGeometry geometryRef](self, "geometryRef"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("boxwidth"), self->_boxwidth);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("boxheight"), self->_boxheight);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("boxlength"), self->_boxlength);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("boxchamferRadius"), self->_boxchamferRadius);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_boxwidthSegmentCount, CFSTR("boxwidthSegmentCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_boxheightSegmentCount, CFSTR("boxheightSegmentCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_boxlengthSegmentCount, CFSTR("boxlengthSegmentCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_boxchamferSegmentCount, CFSTR("boxchamferSegmentCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_boxprimitiveType, CFSTR("boxprimitiveType"));
}

- (SCNBox)initWithCoder:(id)a3
{
  SCNBox *v4;
  _BOOL8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNBox;
  v4 = -[SCNGeometry initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("boxwidth"));
    -[SCNBox setWidth:](v4, "setWidth:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("boxheight"));
    -[SCNBox setHeight:](v4, "setHeight:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("boxlength"));
    -[SCNBox setLength:](v4, "setLength:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("boxchamferRadius"));
    -[SCNBox setChamferRadius:](v4, "setChamferRadius:");
    -[SCNBox setWidthSegmentCount:](v4, "setWidthSegmentCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("boxwidthSegmentCount")));
    -[SCNBox setHeightSegmentCount:](v4, "setHeightSegmentCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("boxheightSegmentCount")));
    -[SCNBox setLengthSegmentCount:](v4, "setLengthSegmentCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("boxlengthSegmentCount")));
    -[SCNBox setChamferSegmentCount:](v4, "setChamferSegmentCount:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("boxchamferSegmentCount")));
    -[SCNBox setPrimitiveType:](v4, "setPrimitiveType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("boxprimitiveType")));
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setChamferRadius:.cold.1()
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

- (void)setChamferSegmentCount:.cold.1()
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
