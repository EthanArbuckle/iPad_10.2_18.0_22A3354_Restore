@implementation SCNText

- (void)_syncObjCModel:(__C3DTextGeometry *)a3
{
  float Flatness;
  float ChamferRadius;
  float ExtrusionDepth;
  float DiscretizedStraightLineMaxLength;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  UIFont *v12;
  id v13;
  UIBezierPath *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SCNText;
  -[SCNGeometry _syncObjCModel](&v15, sel__syncObjCModel);
  self->_primitiveType = (int)C3DShapeGeometryGetPrimitiveType((uint64_t)a3);
  Flatness = C3DShapeGeometryGetFlatness((uint64_t)a3);
  self->_flatness = Flatness;
  ChamferRadius = C3DShapeGeometryGetChamferRadius((uint64_t)a3);
  self->_chamferRadius = ChamferRadius;
  ExtrusionDepth = C3DShapeGeometryGetExtrusionDepth((uint64_t)a3);
  self->_extrusionDepth = ExtrusionDepth;
  self->_chamferProfile = (UIBezierPath *)C3DShapeGeometryGetObjCChamferProfile((uint64_t)a3);
  DiscretizedStraightLineMaxLength = C3DShapeGeometryGetDiscretizedStraightLineMaxLength((uint64_t)a3);
  self->_discretizedStraightLineMaxLength = DiscretizedStraightLineMaxLength;
  self->_alignmentMode = C3DTextGeometryGetAlignmentMode((uint64_t)a3);
  self->_truncationMode = C3DTextGeometryGetTruncationMode((uint64_t)a3);
  self->_string = (id)C3DTextGeometryGetString((uint64_t)a3);
  self->_font = (UIFont *)-[SCNText patchFont:](self, "patchFont:", C3DTextGeometryGetFont((uint64_t)a3));
  self->_useCustomContainerFrame = C3DTextGeometryGetUseCustomContainerFrame((uint64_t)a3);
  self->_customContainerFrame.origin.x = C3DTextGeometryGetCustomContainerFrame((uint64_t)a3);
  self->_customContainerFrame.origin.y = v9;
  self->_customContainerFrame.size.width = v10;
  self->_customContainerFrame.size.height = v11;
  self->_wrapped = C3DTextGeometryGetWrapped((uint64_t)a3);
  self->__wantsSeparateGeometryElements = C3DTextGeometryGetUseSeparateGeometryElements((uint64_t)a3);
  v12 = self->_font;
  v13 = self->_string;
  v14 = self->_chamferProfile;
}

- (SCNText)init
{
  const void *v3;
  SCNText *v4;
  SCNText *v5;
  objc_super v7;

  v3 = (const void *)C3DTextGeometryCreate();
  v7.receiver = self;
  v7.super_class = (Class)SCNText;
  v4 = -[SCNGeometry initWithGeometryRef:](&v7, sel_initWithGeometryRef_, v3);
  v5 = v4;
  if (v4)
    -[SCNText _syncObjCModel:](v4, "_syncObjCModel:", -[SCNGeometry geometryRef](v4, "geometryRef"));
  CFRelease(v3);
  return v5;
}

- (SCNText)initWithTextGeometryRef:(__C3DTextGeometry *)a3
{
  SCNText *v3;
  SCNText *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNText;
  v3 = -[SCNGeometry initWithGeometryRef:](&v6, sel_initWithGeometryRef_, a3);
  v4 = v3;
  if (v3)
    -[SCNText _syncObjCModel:](v3, "_syncObjCModel:", -[SCNGeometry geometryRef](v3, "geometryRef"));
  return v4;
}

- (id)initPresentationTextGeometryWithTextGeometryRef:(__C3DTextGeometry *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNText;
  return -[SCNGeometry initPresentationGeometryWithGeometryRef:](&v4, sel_initPresentationGeometryWithGeometryRef_, a3);
}

- (id)presentationGeometry
{
  return -[SCNText initPresentationTextGeometryWithTextGeometryRef:]([SCNText alloc], "initPresentationTextGeometryWithTextGeometryRef:", -[SCNGeometry geometryRef](self, "geometryRef"));
}

- (id)copyAnimationPathForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

+ (id)text
{
  return (id)objc_msgSend(a1, "textWithString:extrusionDepth:", 0, 0.0);
}

+ (SCNText)textWithString:(id)string extrusionDepth:(CGFloat)extrusionDepth
{
  SCNText *v6;

  v6 = (SCNText *)objc_alloc_init((Class)a1);
  -[SCNText setExtrusionDepth:](v6, "setExtrusionDepth:", extrusionDepth);
  -[SCNText setString:](v6, "setString:", string);
  return v6;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[SCNGeometry geometryDescription](self, "geometryDescription");
  v5 = -[SCNText string](self, "string");
  -[SCNText extrusionDepth](self, "extrusionDepth");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ | string=%@ extrusionDepth=%.3f> "), v4, v5, v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  const void *Copy;
  void *v5;

  Copy = (const void *)C3DTextGeometryCreateCopy(-[SCNGeometry geometryRef](self, "geometryRef", a3));
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTextGeometryRef:", Copy);
  CFRelease(Copy);
  objc_msgSend(v5, "_setupObjCModelFrom:", self);
  return v5;
}

- (id)copy
{
  return -[SCNText copyWithZone:](self, "copyWithZone:", 0);
}

- (BOOL)_wantsSeparateGeometryElements
{
  __C3DScene *v3;
  uint64_t v4;
  char UseSeparateGeometryElements;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->__wantsSeparateGeometryElements;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  UseSeparateGeometryElements = C3DTextGeometryGetUseSeparateGeometryElements((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return UseSeparateGeometryElements;
}

- (void)set_wantsSeparateGeometryElements:(BOOL)a3
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
      -[SCNText set_wantsSeparateGeometryElements:].cold.1();
  }
  else if (self->__wantsSeparateGeometryElements != v3)
  {
    self->__wantsSeparateGeometryElements = v3;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__SCNText_set_wantsSeparateGeometryElements___block_invoke;
    v7[3] = &unk_1EA59E478;
    v7[4] = self;
    v8 = v3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __45__SCNText_set_wantsSeparateGeometryElements___block_invoke(uint64_t a1)
{
  C3DTextGeometrySetUseSeparateGeometryElements(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(unsigned __int8 *)(a1 + 40));
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
  double v6;
  float v7;
  __C3DScene *v8;
  _QWORD v9[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNText setChamferRadius:].cold.1();
  }
  else
  {
    v6 = fmax(chamferRadius, 0.0);
    if (v6 != self->_chamferRadius)
    {
      v7 = v6;
      self->_chamferRadius = v7;
      v8 = -[SCNGeometry sceneRef](self, "sceneRef");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __28__SCNText_setChamferRadius___block_invoke;
      v9[3] = &unk_1EA59E450;
      v9[4] = self;
      *(double *)&v9[5] = v6;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v8, self, CFSTR("chamferRadius"), v9);
    }
  }
}

float __28__SCNText_setChamferRadius___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DShapeGeometrySetChamferRadius(v2, v3);
  return result;
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
  double v6;
  float v7;
  __C3DScene *v8;
  _QWORD v9[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNText setDiscretizedStraightLineMaxLength:].cold.1();
  }
  else
  {
    v6 = fmax(a3, 0.0);
    if (v6 != self->_discretizedStraightLineMaxLength)
    {
      v7 = v6;
      self->_discretizedStraightLineMaxLength = v7;
      v8 = -[SCNGeometry sceneRef](self, "sceneRef");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __47__SCNText_setDiscretizedStraightLineMaxLength___block_invoke;
      v9[3] = &unk_1EA59E450;
      v9[4] = self;
      *(double *)&v9[5] = v6;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, self, v9);
    }
  }
}

float __47__SCNText_setDiscretizedStraightLineMaxLength___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DShapeGeometrySetDiscretizedStraightLineMaxLength(v2, v3);
  return result;
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
  double v6;
  float v7;
  __C3DScene *v8;
  _QWORD v9[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNText setExtrusionDepth:].cold.1();
  }
  else
  {
    v6 = fmax(extrusionDepth, 0.0);
    if (v6 != self->_extrusionDepth)
    {
      v7 = v6;
      self->_extrusionDepth = v7;
      v8 = -[SCNGeometry sceneRef](self, "sceneRef");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __29__SCNText_setExtrusionDepth___block_invoke;
      v9[3] = &unk_1EA59E450;
      v9[4] = self;
      *(double *)&v9[5] = v6;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v8, self, CFSTR("extrusionDepth"), v9);
    }
  }
}

float __29__SCNText_setExtrusionDepth___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  C3DShapeGeometrySetExtrusionDepth(v2, v3);
  return result;
}

- (CGFloat)flatness
{
  __C3DScene *v3;
  uint64_t v4;
  double Flatness;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_flatness;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  Flatness = C3DShapeGeometryGetFlatness((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return Flatness;
}

- (void)setFlatness:(CGFloat)flatness
{
  NSObject *v5;
  float v6;
  __C3DScene *v7;
  _QWORD v8[6];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNText setFlatness:].cold.1();
  }
  else if (self->_flatness != flatness)
  {
    v6 = flatness;
    self->_flatness = v6;
    v7 = -[SCNGeometry sceneRef](self, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __23__SCNText_setFlatness___block_invoke;
    v8[3] = &unk_1EA59E450;
    v8[4] = self;
    *(CGFloat *)&v8[5] = flatness;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v8);
  }
}

float __23__SCNText_setFlatness___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  v3 = *(double *)(a1 + 40);
  return C3DShapeGeometrySetFlatness(v2, v3);
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
      -[SCNText setPrimitiveType:].cold.1();
  }
  else if (self->_primitiveType != a3)
  {
    self->_primitiveType = a3;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __28__SCNText_setPrimitiveType___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __28__SCNText_setPrimitiveType___block_invoke(uint64_t a1)
{
  C3DShapeGeometrySetPrimitiveType(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_BYTE *)(a1 + 40));
}

- (id)string
{
  __C3DScene *v3;
  uint64_t v4;
  void *String;

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v3 = -[SCNGeometry sceneRef](self, "sceneRef");
    v4 = (uint64_t)v3;
    if (v3)
      C3DSceneLock((uint64_t)v3);
    String = (void *)C3DTextGeometryGetString((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
    if (v4)
      C3DSceneUnlock(v4);
  }
  else
  {
    String = self->_string;
  }
  return (id)objc_msgSend(String, "copy");
}

- (void)setString:(id)string
{
  NSObject *v5;
  id v6;
  __C3DScene *v7;
  _QWORD v8[5];

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNText setString:].cold.1();
  }
  else
  {
    v6 = self->_string;
    if (v6 != string)
    {

      self->_string = (id)objc_msgSend(string, "copy");
      v7 = -[SCNGeometry sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __21__SCNText_setString___block_invoke;
      v8[3] = &unk_1EA59E4A0;
      v8[4] = self;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v8);
    }
  }
}

void __21__SCNText_setString___block_invoke(uint64_t a1)
{
  C3DTextGeometrySetString(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(void **)(*(_QWORD *)(a1 + 32) + 200));
}

- (BOOL)isWrapped
{
  __C3DScene *v3;
  uint64_t v4;
  char Wrapped;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    return self->_wrapped;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  Wrapped = C3DTextGeometryGetWrapped((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (v4)
    C3DSceneUnlock(v4);
  return Wrapped;
}

- (void)setWrapped:(BOOL)wrapped
{
  _BOOL4 v3;
  NSObject *v5;
  __C3DScene *v6;
  _QWORD v7[5];
  BOOL v8;

  v3 = wrapped;
  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNText setWrapped:].cold.1();
  }
  else if (self->_wrapped != v3)
  {
    self->_wrapped = v3;
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __22__SCNText_setWrapped___block_invoke;
    v7[3] = &unk_1EA59E478;
    v7[4] = self;
    v8 = v3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __22__SCNText_setWrapped___block_invoke(uint64_t a1)
{
  C3DTextGeometrySetWrapped(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(unsigned __int8 *)(a1 + 40));
}

- (id)patchFont:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (!a3)
    return v3;
  if (objc_msgSend((id)objc_msgSend(a3, "fontName"), "hasPrefix:", CFSTR(".SFUI")))
  {
    v4 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(v3, "pointSize");
    v3 = (id)objc_msgSend(v4, "fontWithName:size:", CFSTR("HelveticaNeue"));
    if (!v3)
      return v3;
  }
  if (!objc_msgSend((id)objc_msgSend(v3, "fontName"), "hasPrefix:", CFSTR(".SFNS")))
    return v3;
  v5 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(v3, "pointSize");
  return (id)objc_msgSend(v5, "fontWithName:size:", CFSTR("HelveticaNeue"));
}

- (UIFont)font
{
  __C3DScene *v3;
  uint64_t v4;
  UIFont *Font;

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v3 = -[SCNGeometry sceneRef](self, "sceneRef");
    v4 = (uint64_t)v3;
    if (v3)
      C3DSceneLock((uint64_t)v3);
    Font = (UIFont *)C3DTextGeometryGetFont((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
    if (v4)
      C3DSceneUnlock(v4);
    if (Font)
      return Font;
  }
  else
  {
    Font = self->_font;
    if (Font)
      return Font;
  }
  return (UIFont *)C3DTextGeometryGetDefaultFont();
}

- (void)setFont:(UIFont *)font
{
  id v4;
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_font != font)
  {
    v4 = -[SCNText patchFont:](self, "patchFont:");

    self->_font = (UIFont *)v4;
    v5 = -[SCNGeometry sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __19__SCNText_setFont___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = self;
    v6[5] = v4;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

void __19__SCNText_setFont___block_invoke(uint64_t a1)
{
  C3DTextGeometrySetFont(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(void **)(a1 + 40));
}

- (CGRect)containerFrame
{
  __C3DScene *v3;
  uint64_t v4;
  char UseCustomContainerFrame;
  double x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  CGRect *p_customContainerFrame;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  if (!-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    if (self->_useCustomContainerFrame)
    {
      p_customContainerFrame = &self->_customContainerFrame;
LABEL_11:
      x = p_customContainerFrame->origin.x;
      y = p_customContainerFrame->origin.y;
      width = p_customContainerFrame->size.width;
      height = p_customContainerFrame->size.height;
      goto LABEL_12;
    }
LABEL_10:
    p_customContainerFrame = (CGRect *)MEMORY[0x1E0C9D648];
    goto LABEL_11;
  }
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  UseCustomContainerFrame = C3DTextGeometryGetUseCustomContainerFrame((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  x = C3DTextGeometryGetCustomContainerFrame((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  y = v7;
  width = v9;
  height = v11;
  if (v4)
    C3DSceneUnlock(v4);
  if ((UseCustomContainerFrame & 1) == 0)
    goto LABEL_10;
LABEL_12:
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)setContainerFrame:(CGRect)containerFrame
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSObject *v8;
  __C3DScene *v9;
  _QWORD v10[5];

  height = containerFrame.size.height;
  width = containerFrame.size.width;
  y = containerFrame.origin.y;
  x = containerFrame.origin.x;
  if (!self->_useCustomContainerFrame || !CGRectEqualToRect(self->_customContainerFrame, containerFrame))
  {
    if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    {
      v8 = scn_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SCNText setContainerFrame:].cold.1();
    }
    else
    {
      self->_useCustomContainerFrame = 1;
      self->_customContainerFrame.origin.x = x;
      self->_customContainerFrame.origin.y = y;
      self->_customContainerFrame.size.width = width;
      self->_customContainerFrame.size.height = height;
      v9 = -[SCNGeometry sceneRef](self, "sceneRef");
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __29__SCNText_setContainerFrame___block_invoke;
      v10[3] = &unk_1EA59E4A0;
      v10[4] = self;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v9, self, v10);
    }
  }
}

void __29__SCNText_setContainerFrame___block_invoke(uint64_t a1)
{
  C3DTextGeometrySetUseCustomContainerFrame(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), 1);
  C3DTextGeometrySetCustomContainerFrame(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(CGFloat *)(*(_QWORD *)(a1 + 32) + 232), *(CGFloat *)(*(_QWORD *)(a1 + 32) + 240), *(CGFloat *)(*(_QWORD *)(a1 + 32) + 248), *(CGFloat *)(*(_QWORD *)(a1 + 32) + 256));
}

- (NSString)truncationMode
{
  __C3DScene *v3;
  uint64_t v4;
  int TruncationMode;

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v3 = -[SCNGeometry sceneRef](self, "sceneRef");
    v4 = (uint64_t)v3;
    if (v3)
      C3DSceneLock((uint64_t)v3);
    TruncationMode = C3DTextGeometryGetTruncationMode((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
    if (v4)
      C3DSceneUnlock(v4);
  }
  else
  {
    TruncationMode = self->_truncationMode;
  }
  return (NSString *)CATextTruncationModeFromC3DTextTruncationMode(TruncationMode);
}

- (void)setTruncationMode:(NSString *)truncationMode
{
  int v5;
  NSObject *v6;
  __C3DScene *v7;
  _QWORD v8[5];
  int v9;
  uint8_t buf[4];
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[NSString isEqualToString:](truncationMode, "isEqualToString:", *MEMORY[0x1E0CD31A0]))
    goto LABEL_2;
  if (-[NSString isEqualToString:](truncationMode, "isEqualToString:", *MEMORY[0x1E0CD31A8]))
  {
    v5 = 1;
  }
  else if (-[NSString isEqualToString:](truncationMode, "isEqualToString:", *MEMORY[0x1E0CD3190]))
  {
    v5 = 2;
  }
  else if (-[NSString isEqualToString:](truncationMode, "isEqualToString:", *MEMORY[0x1E0CD3198]))
  {
    v5 = 3;
  }
  else
  {
    v6 = scn_default_log();
    v5 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = truncationMode;
      _os_log_impl(&dword_1DCCB8000, v6, OS_LOG_TYPE_DEFAULT, "Warning: Unknown truncation mode %@", buf, 0xCu);
LABEL_2:
      v5 = 0;
    }
  }
  if (self->_truncationMode != v5)
  {
    self->_truncationMode = v5;
    v7 = -[SCNGeometry sceneRef](self, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __29__SCNText_setTruncationMode___block_invoke;
    v8[3] = &unk_1EA5A2D30;
    v8[4] = self;
    v9 = v5;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v8);
  }
}

void __29__SCNText_setTruncationMode___block_invoke(uint64_t a1)
{
  C3DTextGeometrySetTruncationMode(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_DWORD *)(a1 + 40));
}

- (NSString)alignmentMode
{
  __C3DScene *v3;
  uint64_t v4;
  int AlignmentMode;

  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
  {
    v3 = -[SCNGeometry sceneRef](self, "sceneRef");
    v4 = (uint64_t)v3;
    if (v3)
      C3DSceneLock((uint64_t)v3);
    AlignmentMode = C3DTextGeometryGetAlignmentMode((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
    if (v4)
      C3DSceneUnlock(v4);
  }
  else
  {
    AlignmentMode = self->_alignmentMode;
  }
  return (NSString *)CATextAlignmentModeFromC3DTextAlignmentMode(AlignmentMode);
}

- (void)setAlignmentMode:(NSString *)alignmentMode
{
  int v5;
  NSObject *v6;
  __C3DScene *v7;
  _QWORD v8[5];
  int v9;
  uint8_t buf[4];
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[NSString isEqualToString:](alignmentMode, "isEqualToString:", *MEMORY[0x1E0CD2908]))
    goto LABEL_2;
  if (-[NSString isEqualToString:](alignmentMode, "isEqualToString:", *MEMORY[0x1E0CD2900]))
  {
    v5 = 1;
  }
  else if (-[NSString isEqualToString:](alignmentMode, "isEqualToString:", *MEMORY[0x1E0CD2910]))
  {
    v5 = 2;
  }
  else if (-[NSString isEqualToString:](alignmentMode, "isEqualToString:", *MEMORY[0x1E0CD28F0]))
  {
    v5 = 3;
  }
  else if (-[NSString isEqualToString:](alignmentMode, "isEqualToString:", *MEMORY[0x1E0CD28F8]))
  {
    v5 = 4;
  }
  else
  {
    v6 = scn_default_log();
    v5 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = alignmentMode;
      _os_log_impl(&dword_1DCCB8000, v6, OS_LOG_TYPE_DEFAULT, "Warning: Unknown alignment mode %@", buf, 0xCu);
LABEL_2:
      v5 = 0;
    }
  }
  if (self->_alignmentMode != v5)
  {
    self->_alignmentMode = v5;
    v7 = -[SCNGeometry sceneRef](self, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __28__SCNText_setAlignmentMode___block_invoke;
    v8[3] = &unk_1EA5A2D30;
    v8[4] = self;
    v9 = v5;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v8);
  }
}

void __28__SCNText_setAlignmentMode___block_invoke(uint64_t a1)
{
  C3DTextGeometrySetAlignmentMode(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(_DWORD *)(a1 + 40));
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
  _QWORD v6[6];

  self->_chamferProfile = (UIBezierPath *)-[UIBezierPath copy](chamferProfile, "copy");
  v5 = -[SCNGeometry sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__SCNText_setChamferProfile___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = chamferProfile;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __29__SCNText_setChamferProfile___block_invoke(uint64_t a1)
{
  C3DShapeGeometrySetObjCChamferProfile(objc_msgSend(*(id *)(a1 + 32), "geometryRef"), *(void **)(a1 + 40));
}

- ($D0C595394DC7C874A2E7CF46D96F84E7)params
{
  $D0C595394DC7C874A2E7CF46D96F84E7 *result;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double chamferRadius;
  CGPoint origin;
  UIBezierPath *chamferProfile;
  id string;
  UIFont *font;
  int alignmentMode;
  _OWORD v16[8];

  *(_OWORD *)&retstr->var7.origin.y = 0u;
  *(_OWORD *)&retstr->var7.size.height = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var0.var4 = 0u;
  *(_OWORD *)&retstr->var0.var6 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var2 = 0u;
  result = ($D0C595394DC7C874A2E7CF46D96F84E7 *)-[SCNGeometry isPresentationInstance](self, "isPresentationInstance");
  if ((_DWORD)result)
  {
    C3DTextGeometryGetC3DKitParameters((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"), (uint64_t)v16);
    v6 = v16[5];
    *(_OWORD *)&retstr->var2 = v16[4];
    *(_OWORD *)&retstr->var5 = v6;
    v7 = v16[7];
    *(_OWORD *)&retstr->var7.origin.y = v16[6];
    *(_OWORD *)&retstr->var7.size.height = v7;
    v8 = v16[1];
    *(_OWORD *)&retstr->var0.var0 = v16[0];
    *(_OWORD *)&retstr->var0.var2 = v8;
    v9 = v16[3];
    *(_OWORD *)&retstr->var0.var4 = v16[2];
    *(_OWORD *)&retstr->var0.var6 = v9;
  }
  else
  {
    chamferRadius = self->_chamferRadius;
    retstr->var0.var1 = self->_extrusionDepth;
    retstr->var0.var2 = chamferRadius;
    retstr->var0.var4 = self->_discretizedStraightLineMaxLength;
    origin = self->_customContainerFrame.origin;
    retstr->var7.size = self->_customContainerFrame.size;
    retstr->var0.var0 = self->_primitiveType;
    chamferProfile = self->_chamferProfile;
    retstr->var0.var5 = 0;
    retstr->var0.var6 = chamferProfile;
    string = self->_string;
    font = self->_font;
    retstr->var0.var3 = 0;
    alignmentMode = self->_alignmentMode;
    retstr->var1 = string;
    retstr->var2 = font;
    LODWORD(string) = self->_truncationMode;
    retstr->var3 = alignmentMode;
    retstr->var4 = (int)string;
    retstr->var5 = self->_wrapped;
    retstr->var6 = self->_useCustomContainerFrame;
    retstr->var7.origin = origin;
    retstr->var8 = self->_flatness;
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
  _OWORD v14[8];
  __int128 v15;
  __int128 v16;

  v7 = -[SCNGeometry sceneRef](self, "sceneRef");
  v8 = (uint64_t)v7;
  if (v7)
    C3DSceneLock((uint64_t)v7);
  DWORD2(v16) = 0;
  *(_QWORD *)&v16 = 0;
  DWORD2(v15) = 0;
  *(_QWORD *)&v15 = 0;
  v9 = -[SCNGeometry geometryRef](self, "geometryRef");
  if (self)
    -[SCNText params](self, "params");
  else
    memset(v14, 0, sizeof(v14));
  BoundingBox = C3DTextGeometryGetBoundingBox((uint64_t)v9, &v16, &v15, v14);
  if (BoundingBox)
  {
    if (a3)
    {
      v11 = *((float *)&v16 + 2);
      *(_QWORD *)&a3->x = v16;
      a3->z = v11;
    }
    if (a4)
    {
      v12 = *((float *)&v15 + 2);
      *(_QWORD *)&a4->x = v15;
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
  _OWORD v13[8];
  __int128 v14;

  v7 = -[SCNGeometry sceneRef](self, "sceneRef");
  v8 = (uint64_t)v7;
  if (v7)
    C3DSceneLock((uint64_t)v7);
  v14 = 0uLL;
  v9 = -[SCNGeometry geometryRef](self, "geometryRef");
  if (self)
    -[SCNText params](self, "params");
  else
    memset(v13, 0, sizeof(v13));
  BoundingSphere = C3DTextGeometryGetBoundingSphere((uint64_t)v9, &v14, v13);
  if (BoundingSphere)
  {
    if (a3)
    {
      v11 = *((float *)&v14 + 2);
      *(_QWORD *)&a3->x = v14;
      a3->z = v11;
    }
    if (a4)
      *a4 = *((float *)&v14 + 3);
  }
  if (v8)
    C3DSceneUnlock(v8);
  return BoundingSphere;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNText;
  -[SCNGeometry dealloc](&v3, sel_dealloc);
}

- (void)_customDecodingOfSCNText:(id)a3
{
  void *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[SCNText setChamferProfile:](self, "setChamferProfile:", SCNDecodeBezierPathForKey(a3, (uint64_t)CFSTR("chamferProfile")));
  v5 = (void *)MEMORY[0x1E0C99E60];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  -[SCNText setString:](self, "setString:", SCNDecodeUnsafeObjectForKey(a3, (uint64_t)CFSTR("string"), (void *)objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2))));
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  -[SCNText setFont:](self, "setFont:", -[SCNText patchFont:](self, "patchFont:", SCNDecodeUnsafeObjectForKey(a3, (uint64_t)CFSTR("font"), v6)));
  -[SCNText setAlignmentMode:](self, "setAlignmentMode:", CATextAlignmentModeFromC3DTextAlignmentMode(objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("alignmentMode"))));
  -[SCNText setTruncationMode:](self, "setTruncationMode:", CATextTruncationModeFromC3DTextTruncationMode(objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("truncationMode"))));
}

- (void)_customEncodingOfSCNText:(id)a3
{
  SCNEncodeBezierPathForKey((uint64_t)a3, self->_chamferProfile, (uint64_t)CFSTR("chamferProfile"));
  SCNEncodeUnsafeObjectForKey(a3, (uint64_t)self->_string, (uint64_t)CFSTR("string"));
  SCNEncodeUnsafeObjectForKey(a3, (uint64_t)self->_font, (uint64_t)CFSTR("font"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_alignmentMode, CFSTR("alignmentMode"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_truncationMode, CFSTR("truncationMode"));
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCNText;
  -[SCNGeometry encodeWithCoder:](&v9, sel_encodeWithCoder_);
  if (-[SCNGeometry isPresentationInstance](self, "isPresentationInstance"))
    -[SCNText _syncObjCModel:](self, "_syncObjCModel:", -[SCNGeometry geometryRef](self, "geometryRef"));
  -[SCNText _customEncodingOfSCNText:](self, "_customEncodingOfSCNText:", a3);
  *(float *)&v5 = self->_flatness;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("flatness"), v5);
  *(float *)&v6 = self->_chamferRadius;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("chamferRadius"), v6);
  *(float *)&v7 = self->_extrusionDepth;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("extrusionDepth"), v7);
  *(float *)&v8 = self->_discretizedStraightLineMaxLength;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("discretizedStraightLineMaxLength"), v8);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_primitiveType, CFSTR("primitiveType"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_wrapped, CFSTR("wrapped"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_useCustomContainerFrame, CFSTR("useCustomContainerFrame"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_customContainerFrame.origin.x, self->_customContainerFrame.origin.y, self->_customContainerFrame.size.width, self->_customContainerFrame.size.height), CFSTR("customContainerFrame"));
  objc_msgSend(a3, "encodeBool:forKey:", self->__wantsSeparateGeometryElements, CFSTR("_wantsSeparateGeometryElements"));
}

- (SCNText)initWithCoder:(id)a3
{
  SCNText *v4;
  _BOOL8 v5;
  float v6;
  float v7;
  float v8;
  float v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SCNText;
  v4 = -[SCNGeometry initWithCoder:](&v15, sel_initWithCoder_);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    -[SCNText _customDecodingOfSCNText:](v4, "_customDecodingOfSCNText:", a3);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("flatness"));
    -[SCNText setFlatness:](v4, "setFlatness:", v6);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("chamferRadius"));
    -[SCNText setChamferRadius:](v4, "setChamferRadius:", v7);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("extrusionDepth"));
    -[SCNText setExtrusionDepth:](v4, "setExtrusionDepth:", v8);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("discretizedStraightLineMaxLength"));
    -[SCNText setDiscretizedStraightLineMaxLength:](v4, "setDiscretizedStraightLineMaxLength:", v9);
    -[SCNText setPrimitiveType:](v4, "setPrimitiveType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("primitiveType")));
    -[SCNText setWrapped:](v4, "setWrapped:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("wrapped")));
    v4->_useCustomContainerFrame = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("useCustomContainerFrame"));
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customContainerFrame")), "CGRectValue");
    v4->_customContainerFrame.origin.x = v10;
    v4->_customContainerFrame.origin.y = v11;
    v4->_customContainerFrame.size.width = v12;
    v4->_customContainerFrame.size.height = v13;
    -[SCNText set_wantsSeparateGeometryElements:](v4, "set_wantsSeparateGeometryElements:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_wantsSeparateGeometryElements")));
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)set_wantsSeparateGeometryElements:.cold.1()
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

- (void)setFlatness:.cold.1()
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

- (void)setString:.cold.1()
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

- (void)setWrapped:.cold.1()
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

- (void)setContainerFrame:.cold.1()
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
