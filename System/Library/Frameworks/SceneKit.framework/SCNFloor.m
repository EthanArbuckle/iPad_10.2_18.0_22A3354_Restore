@implementation SCNFloor

- (void)_syncObjCModel
{
  objc_super v3;

  self->_reflectivity = C3DFloorGetReflectivity((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  self->_reflectionFalloffStart = C3DFloorGetReflectionFalloffStart((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  self->_reflectionFalloffEnd = C3DFloorGetReflectionFalloffEnd((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  self->_reflectionResolutionScaleFactor = C3DFloorGetReflectionResolutionScaleFactor((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  self->_reflectionCategoryBitMask = C3DFloorGetReflectionCategoryBitMask((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  v3.receiver = self;
  v3.super_class = (Class)SCNFloor;
  -[SCNGeometry _syncObjCModel](&v3, sel__syncObjCModel);
}

- (SCNFloor)init
{
  const void *v3;
  SCNFloor *v4;
  objc_super v6;

  v3 = (const void *)C3DFloorCreate();
  v6.receiver = self;
  v6.super_class = (Class)SCNFloor;
  v4 = -[SCNGeometry initWithGeometryRef:](&v6, sel_initWithGeometryRef_, v3);
  CFRelease(v3);
  return v4;
}

- (SCNFloor)initWithFloorGeometryRef:(__C3DFloor *)a3
{
  SCNFloor *v3;
  SCNFloor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNFloor;
  v3 = -[SCNGeometry initWithGeometryRef:](&v6, sel_initWithGeometryRef_, a3);
  v4 = v3;
  if (v3)
    -[SCNFloor _syncObjCModel](v3, "_syncObjCModel");
  return v4;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SCNFloor;
  -[SCNGeometry dealloc](&v2, sel_dealloc);
}

+ (SCNFloor)floor
{
  return (SCNFloor *)objc_alloc_init((Class)a1);
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (void)setReflectionResolutionScaleFactor:(CGFloat)reflectionResolutionScaleFactor
{
  float v4;
  double v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 168) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNFloor setReflectionResolutionScaleFactor:].cold.1();
  }
  else if (self->_reflectionResolutionScaleFactor != reflectionResolutionScaleFactor)
  {
    v4 = reflectionResolutionScaleFactor;
    self->_reflectionResolutionScaleFactor = v4;
    if (reflectionResolutionScaleFactor == 0.0)
      v5 = 0.5;
    else
      v5 = reflectionResolutionScaleFactor;
    *((_BYTE *)self + 168) = *((_BYTE *)self + 168) & 0xFD | (2 * (reflectionResolutionScaleFactor != 0.0));
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__SCNFloor_setReflectionResolutionScaleFactor___block_invoke;
    v8[3] = &unk_1EA59E450;
    v8[4] = self;
    *(double *)&v8[5] = v5;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v8);
  }
}

float __47__SCNFloor_setReflectionResolutionScaleFactor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DFloorSetReflectionResolutionScaleFactor(v2, v3);
  return result;
}

- (void)setReflectionCategoryBitMask:(NSUInteger)reflectionCategoryBitMask
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 168) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNFloor setReflectionCategoryBitMask:].cold.1();
  }
  else if (self->_reflectionCategoryBitMask != reflectionCategoryBitMask)
  {
    self->_reflectionCategoryBitMask = reflectionCategoryBitMask;
    v5 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__SCNFloor_setReflectionCategoryBitMask___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = reflectionCategoryBitMask;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

uint64_t __41__SCNFloor_setReflectionCategoryBitMask___block_invoke(uint64_t a1)
{
  return C3DFloorSetReflectionCategoryBitMask(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), (unint64_t)(float)*(unint64_t *)(a1 + 40));
}

- (NSUInteger)reflectionCategoryBitMask
{
  NSUInteger ReflectionCategoryBitMask;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 168) & 1) == 0)
    return self->_reflectionCategoryBitMask;
  v4 = -[SCNGeometry sceneRef](self, "sceneRef");
  v5 = (uint64_t)v4;
  if (v4)
    C3DSceneLock((uint64_t)v4);
  ReflectionCategoryBitMask = C3DFloorGetReflectionCategoryBitMask((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v5)
    C3DSceneUnlock(v5);
  return ReflectionCategoryBitMask;
}

- (void)setWidth:(CGFloat)width
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 168) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNFloor setWidth:].cold.1();
  }
  else if (self->_width != width)
  {
    self->_width = width;
    v5 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __21__SCNFloor_setWidth___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = width;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("width"), v7);
  }
}

uint64_t __21__SCNFloor_setWidth___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  return C3DFloorSetWidth(v2, v3);
}

- (CGFloat)width
{
  double Width;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 168) & 1) == 0)
    return self->_width;
  v4 = -[SCNGeometry sceneRef](self, "sceneRef");
  v5 = (uint64_t)v4;
  if (v4)
    C3DSceneLock((uint64_t)v4);
  Width = C3DFloorGetWidth((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v5)
    C3DSceneUnlock(v5);
  return Width;
}

- (void)setLength:(CGFloat)length
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 168) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNFloor setLength:].cold.1();
  }
  else if (self->_length != length)
  {
    self->_length = length;
    v5 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __22__SCNFloor_setLength___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    *(CGFloat *)&v7[5] = length;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("length"), v7);
  }
}

uint64_t __22__SCNFloor_setLength___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  return C3DFloorSetLength(v2, v3);
}

- (CGFloat)length
{
  double Length;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 168) & 1) == 0)
    return self->_length;
  v4 = -[SCNGeometry sceneRef](self, "sceneRef");
  v5 = (uint64_t)v4;
  if (v4)
    C3DSceneLock((uint64_t)v4);
  Length = C3DFloorGetLength((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v5)
    C3DSceneUnlock(v5);
  return Length;
}

- (CGFloat)reflectionFalloffEnd
{
  float ReflectionFalloffEnd;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 168) & 1) != 0)
  {
    v4 = -[SCNGeometry sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    ReflectionFalloffEnd = C3DFloorGetReflectionFalloffEnd((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
    if (v5)
      C3DSceneUnlock(v5);
  }
  else
  {
    return self->_reflectionFalloffEnd;
  }
  return ReflectionFalloffEnd;
}

- (void)setReflectionFalloffEnd:(CGFloat)reflectionFalloffEnd
{
  float v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 168) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNFloor setReflectionFalloffEnd:].cold.1();
  }
  else if (self->_reflectionFalloffEnd != reflectionFalloffEnd)
  {
    v5 = reflectionFalloffEnd;
    self->_reflectionFalloffEnd = v5;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __36__SCNFloor_setReflectionFalloffEnd___block_invoke;
    v8[3] = &unk_1EA59E450;
    v8[4] = self;
    *(CGFloat *)&v8[5] = reflectionFalloffEnd;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("reflectionFalloffEnd"), v8);
  }
}

float __36__SCNFloor_setReflectionFalloffEnd___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DFloorSetReflectionFalloffEnd(v2, v3);
  return result;
}

- (CGFloat)reflectionFalloffStart
{
  float ReflectionFalloffStart;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 168) & 1) != 0)
  {
    v4 = -[SCNGeometry sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    ReflectionFalloffStart = C3DFloorGetReflectionFalloffStart((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
    if (v5)
      C3DSceneUnlock(v5);
  }
  else
  {
    return self->_reflectionFalloffStart;
  }
  return ReflectionFalloffStart;
}

- (void)setReflectionFalloffStart:(CGFloat)reflectionFalloffStart
{
  float v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 168) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNFloor setReflectionFalloffStart:].cold.1();
  }
  else if (self->_reflectionFalloffStart != reflectionFalloffStart)
  {
    v5 = reflectionFalloffStart;
    self->_reflectionFalloffStart = v5;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38__SCNFloor_setReflectionFalloffStart___block_invoke;
    v8[3] = &unk_1EA59E450;
    v8[4] = self;
    *(CGFloat *)&v8[5] = reflectionFalloffStart;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("reflectionFalloffStart"), v8);
  }
}

float __38__SCNFloor_setReflectionFalloffStart___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DFloorSetReflectionFalloffStart(v2, v3);
  return result;
}

- (CGFloat)reflectionResolutionScaleFactor
{
  float ReflectionResolutionScaleFactor;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 168) & 1) != 0)
  {
    v4 = -[SCNGeometry sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    ReflectionResolutionScaleFactor = C3DFloorGetReflectionResolutionScaleFactor((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
    if (v5)
      C3DSceneUnlock(v5);
  }
  else
  {
    return self->_reflectionResolutionScaleFactor;
  }
  return ReflectionResolutionScaleFactor;
}

- (unint64_t)reflectionSampleCount
{
  unint64_t ReflectionSampleCount;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 168) & 1) == 0)
    return self->_reflectionSampleCount;
  v4 = -[SCNGeometry sceneRef](self, "sceneRef");
  v5 = (uint64_t)v4;
  if (v4)
    C3DSceneLock((uint64_t)v4);
  ReflectionSampleCount = (int)C3DFloorGetReflectionSampleCount((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v5)
    C3DSceneUnlock(v5);
  return ReflectionSampleCount;
}

- (void)setReflectionSampleCount:(unint64_t)a3
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 168) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNFloor setReflectionSampleCount:].cold.1();
  }
  else if (self->_reflectionSampleCount != a3)
  {
    self->_reflectionSampleCount = a3;
    v5 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__SCNFloor_setReflectionSampleCount___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

void __37__SCNFloor_setReflectionSampleCount___block_invoke(uint64_t a1)
{
  C3DFloorSetReflectionSampleCount(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_QWORD *)(a1 + 40));
}

- (CGFloat)reflectivity
{
  float Reflectivity;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 168) & 1) != 0)
  {
    v4 = -[SCNGeometry sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    Reflectivity = C3DFloorGetReflectivity((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
    if (v5)
      C3DSceneUnlock(v5);
  }
  else
  {
    return self->_reflectivity;
  }
  return Reflectivity;
}

- (void)setReflectivity:(CGFloat)reflectivity
{
  float v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 168) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNFloor setReflectivity:].cold.1();
  }
  else if (self->_reflectivity != reflectivity)
  {
    v5 = reflectivity;
    self->_reflectivity = v5;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __28__SCNFloor_setReflectivity___block_invoke;
    v8[3] = &unk_1EA59E450;
    v8[4] = self;
    *(CGFloat *)&v8[5] = reflectivity;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("reflectivity"), v8);
  }
}

float __28__SCNFloor_setReflectivity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DFloorSetReflectivity(v2, v3);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  objc_msgSend(v4, "_setupObjCModelFrom:", self);
  -[SCNFloor reflectivity](self, "reflectivity");
  objc_msgSend(v4, "setReflectivity:");
  -[SCNFloor reflectionFalloffEnd](self, "reflectionFalloffEnd");
  objc_msgSend(v4, "setReflectionFalloffEnd:");
  -[SCNFloor reflectionFalloffStart](self, "reflectionFalloffStart");
  objc_msgSend(v4, "setReflectionFalloffStart:");
  -[SCNFloor reflectionResolutionScaleFactor](self, "reflectionResolutionScaleFactor");
  objc_msgSend(v4, "setReflectionResolutionScaleFactor:");
  objc_msgSend(v4, "setReflectionSampleCount:", -[SCNFloor reflectionSampleCount](self, "reflectionSampleCount"));
  objc_msgSend(v4, "setReflectionCategoryBitMask:", -[SCNFloor reflectionCategoryBitMask](self, "reflectionCategoryBitMask"));
  -[SCNFloor width](self, "width");
  objc_msgSend(v4, "setWidth:");
  -[SCNFloor length](self, "length");
  objc_msgSend(v4, "setLength:");
  objc_msgSend(v4, "_copyAnimationsFrom:", self);
  +[SCNTransaction commitImmediate](SCNTransaction, "commitImmediate");
  return v4;
}

- (void)_customDecodingOfSCNFloor:(id)a3
{
  self->_reflectivity = C3DFloorGetReflectivity((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef", a3));
  self->_reflectionCategoryBitMask = C3DFloorGetReflectionCategoryBitMask((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  double v6;
  double v7;
  double width;
  double length;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SCNFloor;
  -[SCNGeometry encodeWithCoder:](&v11, sel_encodeWithCoder_);
  *(float *)&v5 = self->_reflectivity;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("reflectivity"), v5);
  *(float *)&v6 = self->_reflectionFalloffStart;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("reflectionFalloffStart"), v6);
  *(float *)&v7 = self->_reflectionFalloffEnd;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("reflectionFalloffEnd"), v7);
  width = self->_width;
  *(float *)&width = width;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("width"), width);
  length = self->_length;
  *(float *)&length = length;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("length"), length);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_reflectionCategoryBitMask, CFSTR("reflectionCategoryBitMask"));
  if ((*((_BYTE *)self + 168) & 2) != 0)
  {
    *(float *)&v10 = self->_reflectionResolutionScaleFactor;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("reflectionResolutionScaleFactor"), v10);
  }
}

- (SCNFloor)initWithCoder:(id)a3
{
  SCNFloor *v4;
  _BOOL8 v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SCNFloor;
  v4 = -[SCNGeometry initWithCoder:](&v13, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    -[SCNFloor _customDecodingOfSCNFloor:](v4, "_customDecodingOfSCNFloor:", a3);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("reflectivity"));
    -[SCNFloor setReflectivity:](v4, "setReflectivity:", v6);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("reflectionFalloffStart"));
    -[SCNFloor setReflectionFalloffStart:](v4, "setReflectionFalloffStart:", v7);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("reflectionFalloffEnd"));
    -[SCNFloor setReflectionFalloffEnd:](v4, "setReflectionFalloffEnd:", v8);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("width"));
    -[SCNFloor setWidth:](v4, "setWidth:", v9);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("length"));
    -[SCNFloor setLength:](v4, "setLength:", v10);
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("reflectionCategoryBitMask")))
      -[SCNFloor setReflectionCategoryBitMask:](v4, "setReflectionCategoryBitMask:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("reflectionCategoryBitMask")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("reflectionResolutionScaleFactor")))
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("reflectionResolutionScaleFactor"));
      if (v11 != 0.0)
      {
        -[SCNFloor setReflectionResolutionScaleFactor:](v4, "setReflectionResolutionScaleFactor:", v11);
        *((_BYTE *)v4 + 168) |= 2u;
      }
    }
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setReflectionResolutionScaleFactor:.cold.1()
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

- (void)setReflectionCategoryBitMask:.cold.1()
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

- (void)setReflectionFalloffEnd:.cold.1()
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

- (void)setReflectionFalloffStart:.cold.1()
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

- (void)setReflectionSampleCount:.cold.1()
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

- (void)setReflectivity:.cold.1()
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
