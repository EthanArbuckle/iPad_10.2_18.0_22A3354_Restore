@implementation SCNShape

- (void)_syncObjCModel:(__C3DShapeGeometry *)a3
{
  float ChamferRadius;
  float ExtrusionDepth;
  float DiscretizedStraightLineMaxLength;

  self->_primitiveType = (int)C3DShapeGeometryGetPrimitiveType((uint64_t)a3);
  ChamferRadius = C3DShapeGeometryGetChamferRadius((uint64_t)a3);
  self->_chamferRadius = ChamferRadius;
  ExtrusionDepth = C3DShapeGeometryGetExtrusionDepth((uint64_t)a3);
  self->_extrusionDepth = ExtrusionDepth;
  self->_chamferProfile = (UIBezierPath *)(id)C3DShapeGeometryGetObjCChamferProfile((uint64_t)a3);
  DiscretizedStraightLineMaxLength = C3DShapeGeometryGetDiscretizedStraightLineMaxLength((uint64_t)a3);
  self->_discretizedStraightLineMaxLength = DiscretizedStraightLineMaxLength;
  self->_path = (UIBezierPath *)(id)C3DFloorGetReflectionCategoryBitMask((uint64_t)a3);
  self->_chamferMode = (int)C3DShapeGeometryGetChamferMode((uint64_t)a3);
}

- (SCNShape)init
{
  const void *v3;
  SCNShape *v4;
  SCNShape *v5;
  objc_super v7;
  objc_super v8;

  v3 = (const void *)C3DShapeGeometryCreate();
  v8.receiver = self;
  v8.super_class = (Class)SCNShape;
  v4 = -[SCNGeometry initWithGeometryRef:](&v8, sel_initWithGeometryRef_, v3);
  v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)SCNShape;
    -[SCNGeometry _syncObjCModel](&v7, sel__syncObjCModel);
    -[SCNShape _syncObjCModel:](v5, "_syncObjCModel:", -[SCNGeometry geometryRef](v5, "geometryRef"));
  }
  CFRelease(v3);
  return v5;
}

- (id)initPresentationShapeGeometryWithShapeGeometryRef:(__C3DShapeGeometry *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNShape;
  return -[SCNGeometry initPresentationGeometryWithGeometryRef:](&v4, sel_initPresentationGeometryWithGeometryRef_, a3);
}

- (id)presentationGeometry
{
  return -[SCNShape initPresentationShapeGeometryWithShapeGeometryRef:]([SCNShape alloc], "initPresentationShapeGeometryWithShapeGeometryRef:", -[SCNGeometry geometryRef](self, "geometryRef"));
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

+ (SCNShape)shapeWithPath:(UIBezierPath *)path extrusionDepth:(CGFloat)extrusionDepth
{
  SCNShape *v6;

  v6 = (SCNShape *)objc_alloc_init((Class)a1);
  -[SCNShape setExtrusionDepth:](v6, "setExtrusionDepth:", extrusionDepth);
  -[SCNShape setPath:](v6, "setPath:", path);
  return v6;
}

- (id)description
{
  void *v3;
  id v4;
  UIBezierPath *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[SCNGeometry geometryDescription](self, "geometryDescription");
  v5 = -[SCNShape path](self, "path");
  -[SCNShape extrusionDepth](self, "extrusionDepth");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ | path=%@ extrusionDepth=%.3f> "), v4, v5, v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIBezierPath *v4;
  SCNShape *v6;

  v4 = -[SCNShape path](self, "path", a3);
  -[SCNShape extrusionDepth](self, "extrusionDepth");
  v6 = +[SCNShape shapeWithPath:extrusionDepth:](SCNShape, "shapeWithPath:extrusionDepth:", v4);
  -[SCNShape setChamferMode:](v6, "setChamferMode:", -[SCNShape chamferMode](self, "chamferMode"));
  -[SCNShape chamferRadius](self, "chamferRadius");
  -[SCNShape setChamferRadius:](v6, "setChamferRadius:");
  -[SCNShape setChamferProfile:](v6, "setChamferProfile:", -[SCNShape chamferProfile](self, "chamferProfile"));
  -[SCNGeometry _setupObjCModelFrom:](v6, "_setupObjCModelFrom:", self);
  return v6;
}

- (id)copy
{
  return -[SCNShape copyWithZone:](self, "copyWithZone:", 0);
}

- (SCNChamferMode)chamferMode
{
  __C3DScene *v3;
  uint64_t v4;
  SCNChamferMode ChamferMode;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_chamferMode;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  ChamferMode = (int)C3DShapeGeometryGetChamferMode((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return ChamferMode;
}

- (void)setChamferMode:(SCNChamferMode)chamferMode
{
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNShape setChamferMode:].cold.1();
  }
  else if (self->_chamferMode != chamferMode)
  {
    self->_chamferMode = chamferMode;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __27__SCNShape_setChamferMode___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = chamferMode;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __27__SCNShape_setChamferMode___block_invoke(uint64_t a1)
{
  C3DShapeGeometrySetChamferMode(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_DWORD *)(a1 + 40));
}

- (CGFloat)chamferRadius
{
  __C3DScene *v3;
  uint64_t v4;
  double ChamferRadius;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_chamferRadius;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  ChamferRadius = C3DShapeGeometryGetChamferRadius((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return ChamferRadius;
}

- (void)setChamferRadius:(CGFloat)chamferRadius
{
  NSObject *v5;
  float v6;
  __C3DScene *v7;
  _QWORD v8[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNShape setChamferRadius:].cold.1();
  }
  else if (self->_chamferRadius != chamferRadius)
  {
    v6 = chamferRadius;
    self->_chamferRadius = v6;
    v7 = -[SCNGeometry sceneRef](self, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __29__SCNShape_setChamferRadius___block_invoke;
    v8[3] = &unk_1EA59E450;
    v8[4] = self;
    *(CGFloat *)&v8[5] = chamferRadius;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v7, self, CFSTR("chamferRadius"), v8);
  }
}

void __29__SCNShape_setChamferRadius___block_invoke(uint64_t a1)
{
  C3DShapeGeometrySetChamferRadius(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(double *)(a1 + 40));
}

- (double)discretizedStraightLineMaxLength
{
  __C3DScene *v3;
  uint64_t v4;
  double DiscretizedStraightLineMaxLength;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_discretizedStraightLineMaxLength;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  DiscretizedStraightLineMaxLength = C3DShapeGeometryGetDiscretizedStraightLineMaxLength((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return DiscretizedStraightLineMaxLength;
}

- (void)setDiscretizedStraightLineMaxLength:(double)a3
{
  NSObject *v5;
  float v6;
  __C3DScene *v7;
  _QWORD v8[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNShape setDiscretizedStraightLineMaxLength:].cold.1();
  }
  else if (self->_discretizedStraightLineMaxLength != a3)
  {
    v6 = a3;
    self->_discretizedStraightLineMaxLength = v6;
    v7 = -[SCNGeometry sceneRef](self, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__SCNShape_setDiscretizedStraightLineMaxLength___block_invoke;
    v8[3] = &unk_1EA59E450;
    v8[4] = self;
    *(double *)&v8[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v8);
  }
}

void __48__SCNShape_setDiscretizedStraightLineMaxLength___block_invoke(uint64_t a1)
{
  C3DShapeGeometrySetDiscretizedStraightLineMaxLength(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(double *)(a1 + 40));
}

- (CGFloat)extrusionDepth
{
  __C3DScene *v3;
  uint64_t v4;
  double ExtrusionDepth;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_extrusionDepth;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  ExtrusionDepth = C3DShapeGeometryGetExtrusionDepth((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return ExtrusionDepth;
}

- (void)setExtrusionDepth:(CGFloat)extrusionDepth
{
  NSObject *v5;
  float v6;
  __C3DScene *v7;
  _QWORD v8[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNShape setExtrusionDepth:].cold.1();
  }
  else if (self->_extrusionDepth != extrusionDepth)
  {
    v6 = extrusionDepth;
    self->_extrusionDepth = v6;
    v7 = -[SCNGeometry sceneRef](self, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __30__SCNShape_setExtrusionDepth___block_invoke;
    v8[3] = &unk_1EA59E450;
    v8[4] = self;
    *(CGFloat *)&v8[5] = extrusionDepth;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v7, self, CFSTR("extrusionDepth"), v8);
  }
}

void __30__SCNShape_setExtrusionDepth___block_invoke(uint64_t a1)
{
  C3DShapeGeometrySetExtrusionDepth(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(double *)(a1 + 40));
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
  PrimitiveType = (int)C3DShapeGeometryGetPrimitiveType((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
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
      -[SCNShape setPrimitiveType:].cold.1();
  }
  else if (self->_primitiveType != a3)
  {
    self->_primitiveType = a3;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __29__SCNShape_setPrimitiveType___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __29__SCNShape_setPrimitiveType___block_invoke(uint64_t a1)
{
  C3DShapeGeometrySetPrimitiveType(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_BYTE *)(a1 + 40));
}

- (UIBezierPath)path
{
  __C3DScene *v3;
  uint64_t v4;
  void *ReflectionCategoryBitMask;

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v3 = -[SCNGeometry sceneRef](self, "sceneRef");
    v4 = (uint64_t)v3;
    if (v3)
      C3DSceneLock((uint64_t)v3);
    ReflectionCategoryBitMask = (void *)C3DFloorGetReflectionCategoryBitMask((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
    if (v4)
      C3DSceneUnlock(v4);
  }
  else
  {
    ReflectionCategoryBitMask = self->_path;
  }
  return (UIBezierPath *)(id)objc_msgSend(ReflectionCategoryBitMask, "copy");
}

- (void)setPath:(UIBezierPath *)path
{
  __C3DScene *v5;
  _QWORD v6[5];

  self->_path = (UIBezierPath *)-[UIBezierPath copy](path, "copy");
  v5 = -[SCNGeometry sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __20__SCNShape_setPath___block_invoke;
  v6[3] = &unk_1EA59E4A0;
  v6[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __20__SCNShape_setPath___block_invoke(uint64_t a1)
{
  C3DShapeGeometrySetObjCPath(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(void **)(*(_QWORD *)(a1 + 32) + 208));
}

- (UIBezierPath)chamferProfile
{
  __C3DScene *v3;
  uint64_t v4;
  void *ObjCChamferProfile;

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v3 = -[SCNGeometry sceneRef](self, "sceneRef");
    v4 = (uint64_t)v3;
    if (v3)
      C3DSceneLock((uint64_t)v3);
    ObjCChamferProfile = (void *)C3DShapeGeometryGetObjCChamferProfile((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
    if (v4)
      C3DSceneUnlock(v4);
  }
  else
  {
    ObjCChamferProfile = self->_chamferProfile;
  }
  return (UIBezierPath *)(id)objc_msgSend(ObjCChamferProfile, "copy");
}

- (void)setChamferProfile:(UIBezierPath *)chamferProfile
{
  __C3DScene *v5;
  _QWORD v6[5];

  self->_chamferProfile = (UIBezierPath *)-[UIBezierPath copy](chamferProfile, "copy");
  v5 = -[SCNGeometry sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__SCNShape_setChamferProfile___block_invoke;
  v6[3] = &unk_1EA59E4A0;
  v6[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __30__SCNShape_setChamferProfile___block_invoke(uint64_t a1)
{
  C3DShapeGeometrySetObjCChamferProfile(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(void **)(*(_QWORD *)(a1 + 32) + 184));
}

- ($DB7092C30E680F051A254E3F9658D24C)params
{
  $DB7092C30E680F051A254E3F9658D24C *result;
  __int128 v6;
  float extrusionDepth;
  double chamferRadius;
  int64_t chamferMode;
  UIBezierPath *path;
  UIBezierPath *chamferProfile;
  _OWORD v12[3];
  void *v13;

  retstr->var6 = 0;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  result = ($DB7092C30E680F051A254E3F9658D24C *)-[SCNGeometry isPresentationInstance](self, "isPresentationInstance");
  if ((_DWORD)result)
  {
    C3DShapeGeometryGetC3DKitParameters((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"), (uint64_t)v12);
    v6 = v12[1];
    *(_OWORD *)&retstr->var0 = v12[0];
    *(_OWORD *)&retstr->var2 = v6;
    *(_OWORD *)&retstr->var4 = v12[2];
    retstr->var6 = v13;
  }
  else
  {
    extrusionDepth = self->_extrusionDepth;
    retstr->var0 = self->_primitiveType;
    chamferRadius = self->_chamferRadius;
    chamferMode = self->_chamferMode;
    retstr->var1 = extrusionDepth;
    retstr->var2 = chamferRadius;
    retstr->var3 = chamferMode;
    path = self->_path;
    chamferProfile = self->_chamferProfile;
    retstr->var4 = self->_discretizedStraightLineMaxLength;
    retstr->var5 = path;
    retstr->var6 = chamferProfile;
  }
  return result;
}

- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4
{
  __C3DScene *v7;
  uint64_t v8;
  __C3DGeometry *v9;
  int BoundingBox;
  float v11;
  float v12;
  _OWORD v14[3];
  uint64_t v15;
  __int128 v16;
  __int128 v17;

  v7 = -[SCNGeometry sceneRef](self, "sceneRef");
  v8 = (uint64_t)v7;
  if (v7)
    C3DSceneLock((uint64_t)v7);
  DWORD2(v17) = 0;
  *(_QWORD *)&v17 = 0;
  DWORD2(v16) = 0;
  *(_QWORD *)&v16 = 0;
  v9 = -[SCNGeometry geometryRef](self, "geometryRef");
  if (self)
  {
    -[SCNShape params](self, "params");
  }
  else
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
  }
  BoundingBox = C3DShapeGeometryGetBoundingBox(v9, &v17, &v16, (uint64_t)v14);
  if (BoundingBox)
  {
    if (a3)
    {
      v11 = *((float *)&v17 + 2);
      *(_QWORD *)&a3->x = v17;
      a3->z = v11;
    }
    if (a4)
    {
      v12 = *((float *)&v16 + 2);
      *(_QWORD *)&a4->x = v16;
      a4->z = v12;
    }
  }
  if (v8)
    C3DSceneUnlock(v8);
  return BoundingBox;
}

- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4
{
  __C3DScene *v7;
  uint64_t v8;
  __C3DGeometry *v9;
  int BoundingSphere;
  float v11;
  _OWORD v13[3];
  uint64_t v14;
  __int128 v15;

  v7 = -[SCNGeometry sceneRef](self, "sceneRef");
  v8 = (uint64_t)v7;
  if (v7)
    C3DSceneLock((uint64_t)v7);
  v15 = 0uLL;
  v9 = -[SCNGeometry geometryRef](self, "geometryRef");
  if (self)
  {
    -[SCNShape params](self, "params");
  }
  else
  {
    v14 = 0;
    memset(v13, 0, sizeof(v13));
  }
  BoundingSphere = C3DShapeGeometryGetBoundingSphere(v9, &v15, (uint64_t)v13);
  if (BoundingSphere)
  {
    if (a3)
    {
      v11 = *((float *)&v15 + 2);
      *(_QWORD *)&a3->x = v15;
      a3->z = v11;
    }
    if (a4)
      *a4 = *((float *)&v15 + 3);
  }
  if (v8)
    C3DSceneUnlock(v8);
  return BoundingSphere;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNShape;
  -[SCNGeometry dealloc](&v3, sel_dealloc);
}

- (void)_customDecodingOfSCNShape:(id)a3
{
  -[SCNShape setChamferProfile:](self, "setChamferProfile:", SCNDecodeBezierPathForKey(a3, (uint64_t)CFSTR("chamferProfile")));
  -[SCNShape setPath:](self, "setPath:", SCNDecodeBezierPathForKey(a3, (uint64_t)CFSTR("path")));
}

- (void)_customEncodingOfSCNShape:(id)a3
{
  SCNEncodeBezierPathForKey((uint64_t)a3, self->_chamferProfile, (uint64_t)CFSTR("chamferProfile"));
  SCNEncodeBezierPathForKey((uint64_t)a3, self->_path, (uint64_t)CFSTR("path"));
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNShape;
  -[SCNGeometry encodeWithCoder:](&v8, sel_encodeWithCoder_);
  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    -[SCNShape _syncObjCModel:](self, "_syncObjCModel:", -[SCNGeometry geometryRef](self, "geometryRef"));
  -[SCNShape _customEncodingOfSCNShape:](self, "_customEncodingOfSCNShape:", a3);
  *(float *)&v5 = self->_chamferRadius;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("chamferRadius"), v5);
  *(float *)&v6 = self->_extrusionDepth;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("extrusionDepth"), v6);
  *(float *)&v7 = self->_discretizedStraightLineMaxLength;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("discretizedStraightLineMaxLength"), v7);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_primitiveType, CFSTR("primitiveType"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_chamferMode, CFSTR("chamferMode"));
}

- (SCNShape)initWithCoder:(id)a3
{
  SCNShape *v4;
  _BOOL8 v5;
  float v6;
  float v7;
  float v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCNShape;
  v4 = -[SCNGeometry initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    -[SCNShape _customDecodingOfSCNShape:](v4, "_customDecodingOfSCNShape:", a3);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("chamferRadius"));
    -[SCNShape setChamferRadius:](v4, "setChamferRadius:", v6);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("extrusionDepth"));
    -[SCNShape setExtrusionDepth:](v4, "setExtrusionDepth:", v7);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("discretizedStraightLineMaxLength"));
    -[SCNShape setDiscretizedStraightLineMaxLength:](v4, "setDiscretizedStraightLineMaxLength:", v8);
    -[SCNShape setPrimitiveType:](v4, "setPrimitiveType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("primitiveType")));
    -[SCNShape setChamferMode:](v4, "setChamferMode:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("chamferMode")));
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setChamferMode:.cold.1()
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

- (void)setDiscretizedStraightLineMaxLength:.cold.1()
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

- (void)setExtrusionDepth:.cold.1()
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

@end
