@implementation SCNAuthoringEnvironment

- (SCNAuthoringEnvironment)init
{
  -[SCNAuthoringEnvironment doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (id)_initWithEngineContext:(__C3DEngineContext *)a3
{
  SCNAuthoringEnvironment *v4;
  SCNAuthoringEnvironment *v5;
  int64_t *p_authoringDisplayMask;
  _BYTE v8[28];
  _OWORD v9[2];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCNAuthoringEnvironment;
  v4 = -[SCNAuthoringEnvironment init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    p_authoringDisplayMask = &v4->_authoringDisplayMask;
    LOBYTE(v4->_gridUnit) = 0;
    *(_QWORD *)&v4->_consoleLineCount = C3DWireframeRendererCreate();
    v5->_engineContext = a3;
    v5->_statisticsInfo.fpsString = (__CFString *)-1;
    *p_authoringDisplayMask = objc_msgSend((id)objc_opt_class(), "defaultAuthoringDisplayMask");
    v5->_selectedNodes = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    memset(v9, 0, 28);
    C3DRasterizerStatesDescGetDefault(v9);
    WORD4(v9[0]) = 1;
    BYTE10(v9[0]) = 4;
    LODWORD(v9[0]) = 0;
    *(_OWORD *)v8 = v9[0];
    *(_OWORD *)&v8[12] = *(_OWORD *)((char *)v9 + 12);
    v5->_depthOnCullOnStates = (__C3DRasterizerStates *)C3DRasterizerStatesCreate((uint64_t)v8);
    LODWORD(v9[0]) = 2;
    *(_OWORD *)v8 = v9[0];
    *(_OWORD *)&v8[12] = *(_OWORD *)((char *)v9 + 12);
    v5->_depthOnCullOffStates = (__C3DRasterizerStates *)C3DRasterizerStatesCreate((uint64_t)v8);
    BYTE8(v9[0]) = 0;
    BYTE10(v9[0]) = 1;
    LODWORD(v9[0]) = 0;
    *(_OWORD *)v8 = v9[0];
    *(_OWORD *)&v8[12] = *(_OWORD *)((char *)v9 + 12);
    v5->_depthOffCullOnStates = (__C3DRasterizerStates *)C3DRasterizerStatesCreate((uint64_t)v8);
    LODWORD(v9[0]) = 2;
    *(_OWORD *)v8 = v9[0];
    *(_OWORD *)&v8[12] = *(_OWORD *)((char *)v9 + 12);
    v5->_depthOffCullOffStates = (__C3DRasterizerStates *)C3DRasterizerStatesCreate((uint64_t)v8);
    -[SCNAuthoringEnvironment update](v5, "update");
  }
  return v5;
}

+ (int64_t)defaultAuthoringDisplayMask
{
  return 0;
}

+ (id)rendererForSceneRenderer:(id)a3
{
  NSObject *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      return (id)objc_msgSend(a3, "renderer");
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[SCNAuthoringEnvironment rendererForSceneRenderer:].cold.1();
    return 0;
  }
  return a3;
}

+ (id)authoringEnvironmentForSceneRenderer:(id)a3
{
  return (id)objc_msgSend(a1, "authoringEnvironmentForSceneRenderer:createIfNeeded:", a3, 1);
}

+ (id)authoringEnvironmentForSceneRenderer:(id)a3 createIfNeeded:(BOOL)a4
{
  _BYTE *AuthoringEnvironment;
  _BYTE *v6;

  AuthoringEnvironment = C3DEngineContextGetAuthoringEnvironment(objc_msgSend((id)objc_msgSend(a1, "rendererForSceneRenderer:"), "_engineContext"), a4);
  v6 = AuthoringEnvironment;
  if (AuthoringEnvironment)
  {
    *((_QWORD *)AuthoringEnvironment + 2) = a3;
    objc_opt_class();
    v6[24] = objc_opt_isKindOfClass() & 1;
  }
  return v6;
}

- (SCNSceneRenderer)sceneRenderer
{
  return self->_sceneRenderer;
}

- (id)renderer
{
  return (id)objc_msgSend((id)objc_opt_class(), "rendererForSceneRenderer:", self->_sceneRenderer);
}

- (SCNMatrix4)viewMatrix
{
  SCNMatrix4 *result;
  uint64_t Matrix4x4;

  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  result = (SCNMatrix4 *)self->_engineContext;
  if (result)
  {
    Matrix4x4 = C3DEngineContextGetMatrix4x4((uint64_t)result, 1);
    C3DMatrix4x4ToSCNMatrix4(Matrix4x4, retstr);
  }
  else
  {
    *retstr = SCNMatrix4Identity;
  }
  return result;
}

- (BOOL)selectionIsReadonly
{
  return objc_msgSend((id)-[objc_class manipulator](self[1].super.isa, "manipulator"), "readonly");
}

- (void)setSelectionIsReadonly:(BOOL)a3
{
  objc_msgSend((id)-[objc_class manipulator](self[1].super.isa, "manipulator"), "setReadonly:", a3);
}

- (void)setEditingSpace:(int64_t)a3
{
  if (self->_editingSpace != a3)
  {
    self->_editingSpace = a3;
    -[SCNManipulator editingSpaceChanged](-[SCNAuthoringEnvironment manipulator](self, "manipulator"), "editingSpaceChanged");
  }
}

- (void)_setupAuthoringEnv2:(id)a3
{
  int64_t *p_authoringDisplayMask;
  id v4;

  p_authoringDisplayMask = &self->_authoringDisplayMask;
  if (!self[1].super.isa)
  {
    v4 = +[SCNAuthoringEnvironment2 authoringEnvironmentForScene:createIfNeeded:](SCNAuthoringEnvironment2, "authoringEnvironmentForScene:createIfNeeded:", a3, 1);
    p_authoringDisplayMask[135] = (int64_t)v4;
    objc_msgSend(v4, "setDisplayMask:", *p_authoringDisplayMask);
  }
}

- (void)setupAuthoringEnv2
{
  id *Scene;
  id *ObjCWrapper;

  if (!self[1].super.isa)
  {
    Scene = (id *)C3DEngineContextGetScene((uint64_t)self->_engineContext);
    ObjCWrapper = C3DEntityGetObjCWrapper(Scene);
    if (ObjCWrapper)
      -[SCNAuthoringEnvironment _setupAuthoringEnv2:](self, "_setupAuthoringEnv2:", ObjCWrapper);
  }
}

- (id)authoringEnvironment2
{
  SCNAuthoringEnvironment *v2;
  Class isa;

  v2 = self + 1;
  isa = self[1].super.isa;
  if (!isa)
  {
    -[SCNAuthoringEnvironment setupAuthoringEnv2](self, "setupAuthoringEnv2");
    return v2->super.isa;
  }
  return isa;
}

- (void)update
{
  uint64_t RendererContextGL;
  int ShowsAuthoringEnvironment;
  uint64_t RenderContext;

  RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
  if (!RendererContextGL)
  {
    RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);
    if (!RenderContext)
      return;
LABEL_6:
    if (!-[SCNMTLRenderContext showsAuthoringEnvironment](RenderContext))
      return;
    goto LABEL_7;
  }
  ShowsAuthoringEnvironment = C3DRendererContextGetShowsAuthoringEnvironment(RendererContextGL);
  RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);
  if (RenderContext)
    goto LABEL_6;
  if (ShowsAuthoringEnvironment)
LABEL_7:
    -[objc_class setDisplayMask:](self[1].super.isa, "setDisplayMask:", self->_authoringDisplayMask);
}

- (void)sceneDidChange:(id)a3
{
  objc_msgSend((id)objc_msgSend(-[SCNAuthoringEnvironment authoringEnvironment2](self, "authoringEnvironment2"), "manipulator"), "_setAuthoringEnvironment:", 0);

  self[1].super.isa = 0;
  -[SCNAuthoringEnvironment _setupAuthoringEnv2:](self, "_setupAuthoringEnv2:", a3);
}

- (SCNNode)authoringOverlayLayer
{
  return (SCNNode *)objc_msgSend(-[SCNAuthoringEnvironment authoringEnvironment2](self, "authoringEnvironment2"), "authoringOverlayLayer");
}

- (SCNManipulator)manipulator
{
  return (SCNManipulator *)-[objc_class manipulator](self[1].super.isa, "manipulator");
}

- (void)setAuthoringDisplayMask:(int64_t)a3
{
  int64_t *p_authoringDisplayMask;
  void *v6;

  p_authoringDisplayMask = &self->_authoringDisplayMask;
  self->_authoringDisplayMask = a3;
  objc_msgSend(-[SCNAuthoringEnvironment renderer](self, "renderer"), "_reloadDebugOptions");
  if ((a3 & 0x33C) != 0)
    -[SCNAuthoringEnvironment setupAuthoringEnv2](self, "setupAuthoringEnv2");
  v6 = (void *)p_authoringDisplayMask[135];
  if (v6)
    objc_msgSend(v6, "setDisplayMask:", a3);
}

- (int64_t)authoringDisplayMask
{
  return self->_authoringDisplayMask;
}

- (NSArray)selectedNodes
{
  return *(NSArray **)&self->_isOrbiting;
}

- (id)selectedItems
{
  return self->_selectedNodes;
}

- (void)beginEditingNode:(id)a3
{
  id v3;
  Class isa;
  _QWORD v6[2];

  v3 = a3;
  v6[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6[0] = a3;
    a3 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  }
  -[SCNAuthoringEnvironment beginEditingNodes:](self, "beginEditingNodes:", a3);
  isa = self[1].super.isa;
  if (isa)
    -[objc_class selectNode:](isa, "selectNode:", v3);
}

- (void)beginEditingNodes:(id)a3
{
  id *p_selectedNodes;
  void *v6;
  uint64_t v7;
  uint64_t SharedInstance;
  const void *Scene;
  id v10;
  _QWORD v11[5];

  p_selectedNodes = (id *)&self->_selectedNodes;
  v6 = (void *)objc_msgSend(-[SCNAuthoringEnvironment authoringEnvironment2](self, "authoringEnvironment2"), "manipulator");
  objc_msgSend(v6, "_setAuthoringEnvironment:", self);
  objc_sync_enter(self);

  p_selectedNodes[1] = (id)objc_msgSend(a3, "copy");
  v7 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__SCNAuthoringEnvironment_beginEditingNodes___block_invoke;
  v11[3] = &unk_1EA59E670;
  v11[4] = v7;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v11);

  *p_selectedNodes = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v7);
  SharedInstance = C3DNotificationCenterGetSharedInstance();
  Scene = (const void *)C3DEngineContextGetScene((uint64_t)self->_engineContext);
  C3DNotificationCenterPostNotification(SharedInstance, CFSTR("kC3DNotificationEngineContextInvalidatePasses"), Scene, 0, 1u);
  objc_sync_exit(self);
  if (objc_msgSend(*p_selectedNodes, "count"))
    v10 = *p_selectedNodes;
  else
    v10 = 0;
  objc_msgSend(v6, "setTargets:", v10);
}

uint64_t __45__SCNAuthoringEnvironment_beginEditingNodes___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = a2;
  if (objc_msgSend(a2, "authoringEnvironmentNode")
    && objc_msgSend(v2, "authoringEnvironmentCompanionNode"))
  {
    v2 = (void *)objc_msgSend(v2, "authoringEnvironmentCompanionNode");
  }
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", +[SCNNodeManipulableItem nodeManipulatorItemWithNode:screenSize:](SCNNodeManipulableItem, "nodeManipulatorItemWithNode:screenSize:", v2, 0.0));
}

- (void)saveInitialSelection
{

  self->_selection = (NSMutableOrderedSet *)objc_msgSend((id)objc_msgSend(-[SCNAuthoringEnvironment selectedItems](self, "selectedItems"), "set"), "copy");
}

- (void)beginOrbiting
{
  LOBYTE(self->_gridUnit) = 1;
}

- (void)endOrbiting
{
  LOBYTE(self->_gridUnit) = 0;
}

- (BOOL)didTapAtPoint:(CGPoint)a3
{
  float *p_waitDisplayLinkTime;
  CGFloat y;
  CGFloat x;
  float v7;
  float v8;
  unint64_t v9;
  double v10;
  CGFloat v11;
  CGFloat width;
  CGFloat height;
  _BOOL4 v14;
  uint64_t v15;
  _BOOL4 v16;
  float v18;
  uint64_t v19;
  CGPoint v20;
  CGPoint v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  p_waitDisplayLinkTime = &self->_statisticsInfo.waitDisplayLinkTime;
  if (!LOBYTE(self->_statisticsInfo.waitDisplayLinkTime))
    goto LABEL_13;
  y = a3.y;
  x = a3.x;
  v19 = 0;
  __appendText_(0, &v19, 0, CFSTR("$1$"), 0, (uint64_t)&self->_boldTextInfo, 0, 0);
  v18 = *(float *)&v19;
  if (*((_BYTE *)p_waitDisplayLinkTime + 1))
  {
    v7 = self->_normalTextInfo.lineHeight * 7.0 + 14.0;
    v8 = v7 + 3.0;
  }
  else
  {
    v8 = 3.0;
  }
  v9 = C3DEngineContextGetDrawableSafeAreaInsets((__n128 *)self->_engineContext).n128_u64[0];
  v22.origin.y = (float)(v8 + *((float *)&v9 + 1));
  v22.size.height = v18;
  v22.origin.x = (float)(*(float *)&v9 + 7.0);
  v22.size.width = v18;
  v23 = CGRectInset(v22, -10.0, -10.0);
  v10 = v23.origin.x;
  v11 = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;
  v20.x = x;
  v20.y = y;
  v14 = CGRectContainsPoint(v23, v20);
  if (v14)
  {
    v15 = 0;
  }
  else
  {
    v24.origin.x = v10 + (float)(v18 + 5.0);
    v24.origin.y = v11;
    v24.size.width = width;
    v24.size.height = height;
    v21.x = x;
    v21.y = y;
    v16 = CGRectContainsPoint(v24, v21);
    if (!v16)
      return v16;
    v15 = 1;
  }
  *((_QWORD *)p_waitDisplayLinkTime + 2) = v15;
  if (!*(_BYTE *)p_waitDisplayLinkTime)
  {
LABEL_13:
    LOBYTE(v16) = 0;
    return v16;
  }
  if (v14)
    *((_BYTE *)p_waitDisplayLinkTime + 1) ^= 1u;
  *((_QWORD *)p_waitDisplayLinkTime + 2) = -1;
  LOBYTE(v16) = 1;
  return v16;
}

- (void)drawLineFromPoint:(SCNVector3)a3 toPoint:(SCNVector3)a4 color:(id)a5
{
  uint64_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float v10;
  float v11;
  float32x4_t v12;
  float y;
  float z;
  _QWORD v15[2];

  z = a4.z;
  y = a4.y;
  v12.i64[0] = *(_QWORD *)&a4.x;
  v11 = a3.z;
  v10 = a3.y;
  v9.i64[0] = *(_QWORD *)&a3.x;
  v15[0] = C3DColor4FromRGBCFColor(a5, 0);
  v15[1] = v6;
  v7 = v9;
  v7.f32[1] = v10;
  v7.f32[2] = v11;
  v8 = v12;
  v8.f32[1] = y;
  v8.f32[2] = z;
  C3DAuthoringEnvironmentAppendDebugSegment((uint64_t)self, 0, (float *)v15, 0, v7, v8);
}

- (void)drawString:(id)a3 atPoint:(CGPoint)a4 color:(id)a5
{
  uint64_t v7;
  float64x2_t v8;
  CGFloat x;
  CGFloat y;
  uint64_t v11[2];

  x = a4.x;
  y = a4.y;
  v11[0] = C3DColor4FromRGBCFColor(a5, 0);
  v11[1] = v7;
  v8.f64[0] = x;
  v8.f64[1] = y;
  C3DAuthoringEnvironmentAppendDebugString((uint64_t)self, (const __CFString *)a3, v11, COERCE_DOUBLE(vcvt_f32_f64(v8)));
}

- (void)dealloc
{
  NSMutableOrderedSet **p_selection;
  __C3DImage *texture;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *symbolRects;
  double *characterWidth_typography;
  __C3DImage *v7;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v8;
  double *v9;
  __C3DFXProgram *wireframeProgram;
  __C3DFXProgram *colorOnlyProgram;
  __C3DFXProgram *colorAndTextureProgram;
  __C3DFXProgram *noColorProgram;
  __C3DFXProgram *lightProbesProgram;
  NSMutableOrderedSet *v15;
  NSMutableOrderedSet *v16;
  NSMutableOrderedSet *v17;
  objc_super v18;

  p_selection = &self->_selection;
  objc_msgSend((id)objc_msgSend(-[SCNAuthoringEnvironment authoringEnvironment2](self, "authoringEnvironment2"), "manipulator"), "_setAuthoringEnvironment:", 0);
  C3DRasterizerStatesRelease(self->_depthOnCullOnStates);
  C3DRasterizerStatesRelease(self->_depthOnCullOffStates);
  C3DRasterizerStatesRelease(self->_depthOffCullOnStates);
  C3DRasterizerStatesRelease(self->_depthOffCullOffStates);

  __destroyGLInfo((uint64_t)self, (uint64_t)&self->_logsInfo);
  __destroyGLInfo((uint64_t)self, (uint64_t)&self->_dynamicLinesInfo);
  __destroyGLInfo((uint64_t)self, (uint64_t)&self->_dynamicLinesNoDepthTestInfo);
  __destroyGLInfo((uint64_t)self, (uint64_t)&self->_overlayDynamicLinesInfo);
  __destroyGLInfo((uint64_t)self, (uint64_t)&self->_overlayDynamicTriangleInfo);
  __destroyGLInfo((uint64_t)self, (uint64_t)&self->_dynamicTrianglesInfo);
  __destroyGLInfo((uint64_t)self, (uint64_t)&self->_lightProbesInfo);
  __destroyGLInfo((uint64_t)self, (uint64_t)&self->_textInfo);
  __destroyGLInfo((uint64_t)self, (uint64_t)&self->_boldLogsInfo);
  texture = self->_normalTextInfo.textureInfo.texture;
  if (texture)
  {
    CFRelease(texture);
    self->_normalTextInfo.textureInfo.texture = 0;
  }
  symbolRects = self->_normalTextInfo.symbolRects;
  if (symbolRects)
    free(symbolRects);
  characterWidth_typography = self->_normalTextInfo.characterWidth_typography;
  if (characterWidth_typography)
    free(characterWidth_typography);
  v7 = self->_boldTextInfo.textureInfo.texture;
  if (v7)
  {
    CFRelease(v7);
    self->_boldTextInfo.textureInfo.texture = 0;
  }
  v8 = self->_boldTextInfo.symbolRects;
  if (v8)
    free(v8);
  v9 = self->_boldTextInfo.characterWidth_typography;
  if (v9)
    free(v9);

  wireframeProgram = self->_wireframeProgram;
  if (wireframeProgram)
  {
    CFRelease(wireframeProgram);
    self->_wireframeProgram = 0;
  }
  colorOnlyProgram = self->_colorOnlyProgram;
  if (colorOnlyProgram)
  {
    CFRelease(colorOnlyProgram);
    self->_colorOnlyProgram = 0;
  }
  colorAndTextureProgram = self->_colorAndTextureProgram;
  if (colorAndTextureProgram)
  {
    CFRelease(colorAndTextureProgram);
    self->_colorAndTextureProgram = 0;
  }
  noColorProgram = self->_noColorProgram;
  if (noColorProgram)
  {
    CFRelease(noColorProgram);
    self->_noColorProgram = 0;
  }
  lightProbesProgram = self->_lightProbesProgram;
  if (lightProbesProgram)
  {
    CFRelease(lightProbesProgram);
    self->_lightProbesProgram = 0;
  }
  v15 = p_selection[13];
  if (v15)
  {
    CFRelease(v15);
    p_selection[13] = 0;
  }
  v16 = p_selection[12];
  if (v16)
  {
    CFRelease(v16);
    p_selection[12] = 0;
  }
  v17 = p_selection[11];
  if (v17)
  {
    CFRelease(v17);
    p_selection[11] = 0;
  }
  C3DWireframeRendererDestroy((WireframeMeshRenderer *)p_selection[6]);

  v18.receiver = self;
  v18.super_class = (Class)SCNAuthoringEnvironment;
  -[SCNAuthoringEnvironment dealloc](&v18, sel_dealloc);
}

- (BOOL)isEditingSubComponent
{
  return 0;
}

- (BOOL)shouldSnapOnGrid
{
  return self->_shouldSnapOnGrid;
}

- (void)setShouldSnapOnGrid:(BOOL)a3
{
  self->_shouldSnapOnGrid = a3;
}

- (BOOL)shouldSnapToAlign
{
  return self->_shouldSnapToAlign;
}

- (void)setShouldSnapToAlign:(BOOL)a3
{
  self->_shouldSnapToAlign = a3;
}

- (double)gridUnit
{
  return *(double *)&self->_visibleManipulableItems;
}

- (int64_t)editingSpace
{
  return self->_editingSpace;
}

- (SCNAuthoringEnvironmentDelegate)delegate
{
  return (SCNAuthoringEnvironmentDelegate *)self->_authEnv2;
}

- (void)setDelegate:(id)a3
{
  self->_authEnv2 = (SCNAuthoringEnvironment2 *)a3;
}

- (BOOL)graphicalSelectionEnabled
{
  return self->_graphicalSelectionEnabled;
}

- (void)setGraphicalSelectionEnabled:(BOOL)a3
{
  self->_graphicalSelectionEnabled = a3;
}

- (BOOL)surroundToSelect
{
  return BYTE1(self->_initialSelection);
}

- (void)setSurroundToSelect:(BOOL)a3
{
  BYTE1(self->_initialSelection) = a3;
}

+ (void)rendererForSceneRenderer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Unknown SCNSceneRenderer conforming class", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
