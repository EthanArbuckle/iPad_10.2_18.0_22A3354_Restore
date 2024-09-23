@implementation SCNManipulator

- (NSOrderedSet)targets
{
  return self->_targets;
}

- (void)setTargets:(id)a3
{
  SCNAuthoringEnvironment *v5;
  NSOrderedSet *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = -[SCNManipulator authoringEnvironment](self, "authoringEnvironment");
  objc_sync_enter(v5);
  v6 = self->_targets;
  self->_targets = 0;
  if (a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(a3, "count"));
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(a3);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
          if (!objc_msgSend(v11, "component"))
          {
            for (i = objc_msgSend(v11, "parentItem"); ; i = objc_msgSend(v13, "parentItem"))
            {
              v13 = (void *)i;
              if (!i)
                break;
              if ((objc_msgSend(a3, "containsObject:", i) & 1) != 0)
                goto LABEL_9;
            }
          }
          objc_msgSend(v7, "addObject:", v11);
LABEL_9:
          ++v10;
        }
        while (v10 != v8);
        v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v8 = v14;
      }
      while (v14);
    }
    self->_targets = (NSOrderedSet *)v7;
  }
  objc_sync_exit(v5);
  -[SCNManipulator updateManipulatorNode](self, "updateManipulatorNode");
}

- (SCNNode)target
{
  SCNAuthoringEnvironment *v3;
  SCNNode *v4;

  v3 = -[SCNManipulator authoringEnvironment](self, "authoringEnvironment");
  objc_sync_enter(v3);
  if (-[NSOrderedSet count](self->_targets, "count"))
    v4 = -[NSOrderedSet firstObject](self->_targets, "firstObject");
  else
    v4 = 0;
  objc_sync_exit(v3);
  return v4;
}

- (void)setTarget:(id)a3
{
  if (a3)
    a3 = (id)objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:");
  -[SCNManipulator setTargets:](self, "setTargets:", a3);
}

- (SCNAuthoringEnvironment)authoringEnvironment
{
  return self->_authoringEnvironment;
}

- (void)_setAuthoringEnvironment:(id)a3
{
  self->_authoringEnvironment = (SCNAuthoringEnvironment *)a3;
}

- (SCNMatrix4)transform
{
  SCNMatrix4 *result;

  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  C3DMatrix4x4ToSCNMatrix4((uint64_t)&self->_worldMatrix.components[1], retstr);
  return result;
}

- (SCNManipulator)init
{
  SCNManipulator *v2;
  SCNManipulator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNManipulator;
  v2 = -[SCNManipulator init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    C3DMatrix4x4MakeRotationY((C3DMatrix4x4 *)v2->_xAxisToZAxisTransform.components, 1.5708);
    C3DMatrix4x4MakeRotationX((C3DMatrix4x4 *)v3->_yAxisToZAxisTransform.components, -1.5708);
    C3DMatrix4x4MakeRotationY((C3DMatrix4x4 *)v3->_xyPlaneToYZPlaneTransform.components, -1.5708);
    C3DMatrix4x4MakeRotationX((C3DMatrix4x4 *)v3->_xyPlaneToXZPlaneTransform.components, 1.5708);
    v3->_zAlignment = 0;
    *(_OWORD *)&v3->_xAlignment = 0u;
    v3->_snapXIndexes = (NSMutableIndexSet *)(id)objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v3->_snapYIndexes = (NSMutableIndexSet *)(id)objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v3->_snapZIndexes = (NSMutableIndexSet *)(id)objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v3->_features = 3;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SCNManipulator _deleteOriginalData](self, "_deleteOriginalData");

  free(self->_snapToAlignOnX);
  free(self->_snapToAlignOnY);
  free(self->_snapToAlignOnZ);
  -[SCNNode removeFromParentNode](self->_node, "removeFromParentNode");

  v3.receiver = self;
  v3.super_class = (Class)SCNManipulator;
  -[SCNManipulator dealloc](&v3, sel_dealloc);
}

- (id)copy
{
  SCNManipulator *v3;

  v3 = objc_alloc_init(SCNManipulator);
  -[SCNManipulator setTarget:](v3, "setTarget:", -[SCNManipulator target](self, "target"));
  return v3;
}

- (int64_t)effectiveEditingSpace
{
  if ((unint64_t)-[SCNAuthoringEnvironment editingSpace](-[SCNManipulator authoringEnvironment](self, "authoringEnvironment"), "editingSpace") > 1|| -[NSOrderedSet count](self->_targets, "count") <= 1)
  {
    return -[SCNAuthoringEnvironment editingSpace](-[SCNManipulator authoringEnvironment](self, "authoringEnvironment"), "editingSpace");
  }
  else
  {
    return 2;
  }
}

- (BOOL)isDragging
{
  return self->_isMouseDown;
}

- (SCNNode)manipulatorNode
{
  SCNNode *result;

  result = self->_node;
  if (!result)
  {
    -[SCNManipulator setupNode](self, "setupNode");
    return self->_node;
  }
  return result;
}

- (void)setupNode
{
  void *v3;
  void *v4;
  SCNNode *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  SCNNode *v21;
  SCNNode *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  SCNNode *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  SCNNode *v39;
  SCNNode *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  SCNNode *v54;
  SCNBillboardConstraint *v55;
  SCNNode *v56;
  SCNSphere *v57;
  SCNNode *v58;
  SCNBox *v59;
  SCNNode *v60;
  _BOOL4 v61;

  v61 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  self->_node = +[SCNNode node](SCNNode, "node");
  v3 = _arrowNode(objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorRed));
  v4 = _arrowNode(objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorGreen));
  v5 = (SCNNode *)_arrowNode(objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorBlue));
  self->_zArrow = v5;
  LODWORD(v6) = 0;
  LODWORD(v7) = 0;
  LODWORD(v8) = -1077342245;
  objc_msgSend(v3, "setEulerAngles:", v6, v7, v8);
  LODWORD(v9) = 0;
  LODWORD(v10) = 0;
  LODWORD(v11) = 1070141403;
  -[SCNNode setEulerAngles:](v5, "setEulerAngles:", v11, v9, v10);
  objc_msgSend(v3, "setCategoryBitMask:", 273);
  objc_msgSend(v4, "setCategoryBitMask:", 289);
  -[SCNNode setCategoryBitMask:](v5, "setCategoryBitMask:", 305);
  v12 = _axisNode(objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorRed));
  v13 = _axisNode(objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorGreen));
  v14 = _axisNode(objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorBlue));
  LODWORD(v15) = 0;
  LODWORD(v16) = 0;
  LODWORD(v17) = -1077342245;
  objc_msgSend(v12, "setEulerAngles:", v15, v16, v17);
  LODWORD(v18) = 0;
  LODWORD(v19) = 0;
  LODWORD(v20) = 1070141403;
  objc_msgSend(v14, "setEulerAngles:", v20, v18, v19);
  v21 = +[SCNNode node](SCNNode, "node");
  self->_axis = v21;
  -[SCNNode addChildNode:](v21, "addChildNode:", v12);
  -[SCNNode addChildNode:](self->_axis, "addChildNode:", v13);
  -[SCNNode addChildNode:](self->_axis, "addChildNode:", v14);
  -[SCNNode setHidden:](self->_axis, "setHidden:", 1);
  -[SCNNode addChildNode:](self->_node, "addChildNode:", self->_axis);
  v22 = +[SCNNode node](SCNNode, "node");
  -[SCNNode addChildNode:](v22, "addChildNode:", v3);
  -[SCNNode addChildNode:](v22, "addChildNode:", v4);
  -[SCNNode addChildNode:](v22, "addChildNode:", v5);
  self->_translateHandles = v22;
  -[SCNNode addChildNode:](self->_node, "addChildNode:", v22);
  self->_planarTranslationHandleXY = (SCNNode *)_translationPlaneNode(objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorBlue));
  self->_planarTranslationHandleYZ = (SCNNode *)_translationPlaneNode(objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorRed));
  self->_planarTranslationHandleXZ = (SCNNode *)_translationPlaneNode(objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorGreen));
  LODWORD(v23) = 0;
  LODWORD(v24) = 0;
  LODWORD(v25) = -1077342245;
  -[SCNNode setEulerAngles:](self->_planarTranslationHandleYZ, "setEulerAngles:", v23, v25, v24);
  LODWORD(v26) = 0;
  LODWORD(v27) = 0;
  LODWORD(v28) = 1070141403;
  -[SCNNode setEulerAngles:](self->_planarTranslationHandleXZ, "setEulerAngles:", v28, v26, v27);
  -[SCNNode setCategoryBitMask:](self->_planarTranslationHandleXY, "setCategoryBitMask:", 561);
  -[SCNNode setCategoryBitMask:](self->_planarTranslationHandleYZ, "setCategoryBitMask:", 529);
  -[SCNNode setCategoryBitMask:](self->_planarTranslationHandleXZ, "setCategoryBitMask:", 545);
  v29 = +[SCNNode node](SCNNode, "node");
  self->_planarTranslationHandles = v29;
  -[SCNNode addChildNode:](v29, "addChildNode:", self->_planarTranslationHandleXY);
  -[SCNNode addChildNode:](self->_planarTranslationHandles, "addChildNode:", self->_planarTranslationHandleYZ);
  -[SCNNode addChildNode:](self->_planarTranslationHandles, "addChildNode:", self->_planarTranslationHandleXZ);
  -[SCNNode addChildNode:](self->_node, "addChildNode:", self->_planarTranslationHandles);
  self->_arcHandleXY = (SCNNode *)_rotationArcNode(objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorBlue));
  self->_arcHandleYZ = (SCNNode *)_rotationArcNode(objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorRed));
  self->_arcHandleXZ = (SCNNode *)_rotationArcNode(objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorGreen));
  LODWORD(v30) = 0;
  LODWORD(v31) = -1077342245;
  LODWORD(v32) = 1078530011;
  -[SCNNode setEulerAngles:](self->_arcHandleXY, "setEulerAngles:", v31, v30, v32);
  LODWORD(v33) = 0;
  LODWORD(v34) = 1078530011;
  LODWORD(v35) = -1077342245;
  -[SCNNode setEulerAngles:](self->_arcHandleYZ, "setEulerAngles:", v34, v33, v35);
  LODWORD(v36) = 0;
  LODWORD(v37) = 0;
  LODWORD(v38) = 1078530011;
  -[SCNNode setEulerAngles:](self->_arcHandleXZ, "setEulerAngles:", v36, v38, v37);
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[SCNNode childNodes](self->_arcHandleXY, "childNodes"), "objectAtIndexedSubscript:", 0), "setCategoryBitMask:", 561);
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[SCNNode childNodes](self->_arcHandleYZ, "childNodes"), "objectAtIndexedSubscript:", 0), "setCategoryBitMask:", 529);
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[SCNNode childNodes](self->_arcHandleXZ, "childNodes"), "objectAtIndexedSubscript:", 0), "setCategoryBitMask:", 545);
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[SCNNode childNodes](self->_arcHandleXY, "childNodes"), "objectAtIndexedSubscript:", 1), "setCategoryBitMask:", 817);
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[SCNNode childNodes](self->_arcHandleYZ, "childNodes"), "objectAtIndexedSubscript:", 1), "setCategoryBitMask:", 785);
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[SCNNode childNodes](self->_arcHandleXZ, "childNodes"), "objectAtIndexedSubscript:", 1), "setCategoryBitMask:", 801);
  v39 = +[SCNNode node](SCNNode, "node");
  self->_arcHandles = v39;
  -[SCNNode addChildNode:](v39, "addChildNode:", self->_arcHandleXY);
  -[SCNNode addChildNode:](self->_arcHandles, "addChildNode:", self->_arcHandleYZ);
  -[SCNNode addChildNode:](self->_arcHandles, "addChildNode:", self->_arcHandleXZ);
  -[SCNNode addChildNode:](self->_node, "addChildNode:", self->_arcHandles);
  v40 = +[SCNNode node](SCNNode, "node");
  v41 = _wireframeCircle(objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorRed), 1.0);
  v42 = _wireframeCircle(objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorGreen), 1.0);
  v43 = _wireframeCircle(objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorBlue), 1.0);
  v44 = _wireframeCircle(objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", &C3DAuthoringEnvironmentColorGrayDark), 1.02);
  objc_msgSend(v41, "setRenderingOrder:", 2);
  objc_msgSend(v42, "setRenderingOrder:", 2);
  objc_msgSend(v43, "setRenderingOrder:", 2);
  objc_msgSend(v44, "setRenderingOrder:", 0);
  LODWORD(v45) = 0;
  LODWORD(v46) = 0;
  LODWORD(v47) = -1077342245;
  objc_msgSend(v41, "setEulerAngles:", v45, v46, v47);
  LODWORD(v48) = 0;
  LODWORD(v49) = 0;
  LODWORD(v50) = 1070141403;
  objc_msgSend(v43, "setEulerAngles:", v50, v48, v49);
  LODWORD(v51) = 0;
  LODWORD(v52) = 0;
  LODWORD(v53) = 1070141403;
  objc_msgSend(v44, "setEulerAngles:", v53, v51, v52);
  objc_msgSend(v41, "setCategoryBitMask:", 785);
  objc_msgSend(v42, "setCategoryBitMask:", 801);
  objc_msgSend(v43, "setCategoryBitMask:", 817);
  objc_msgSend(v44, "setCategoryBitMask:", 769);
  v54 = +[SCNNode node](SCNNode, "node");
  -[SCNNode addChildNode:](v54, "addChildNode:", v44);
  v55 = +[SCNBillboardConstraint billboardConstraint](SCNBillboardConstraint, "billboardConstraint");
  self->_billboard = v55;
  -[SCNBillboardConstraint setPreserveScale:](v55, "setPreserveScale:", 1);
  self->_screenSpaceRotation = v54;
  v56 = +[SCNNode node](SCNNode, "node");
  self->_rotationHandles = v56;
  -[SCNNode addChildNode:](v56, "addChildNode:", v41);
  -[SCNNode addChildNode:](self->_rotationHandles, "addChildNode:", v42);
  -[SCNNode addChildNode:](self->_rotationHandles, "addChildNode:", v43);
  -[SCNNode addChildNode:](v40, "addChildNode:", self->_rotationHandles);
  -[SCNNode addChildNode:](v40, "addChildNode:", v54);
  -[SCNNode addChildNode:](self->_node, "addChildNode:", v40);
  v57 = +[SCNSphere sphereWithRadius:](SCNSphere, "sphereWithRadius:", 0.99);
  -[SCNSphere setGeodesic:](v57, "setGeodesic:", 1);
  -[SCNSphere setSegmentCount:](v57, "setSegmentCount:", 24);
  -[SCNMaterial setLightingModelName:](-[SCNGeometry firstMaterial](v57, "firstMaterial"), "setLightingModelName:", CFSTR("SCNLightingModelConstant"));
  -[SCNMaterial setColorBufferWriteMask:](-[SCNGeometry firstMaterial](v57, "firstMaterial"), "setColorBufferWriteMask:", 0);
  v58 = +[SCNNode nodeWithGeometry:](SCNNode, "nodeWithGeometry:", v57);
  -[SCNNode setOpacity:](v58, "setOpacity:", 0.01);
  -[SCNNode setRenderingOrder:](v58, "setRenderingOrder:", 1);
  self->_occluder = v58;
  -[SCNNode addChildNode:](self->_node, "addChildNode:", v58);
  v59 = +[SCNBox boxWithWidth:height:length:chamferRadius:](SCNBox, "boxWithWidth:height:length:chamferRadius:", 0.2, 0.2, 0.2, 0.0);
  -[SCNMaterialProperty setContents:](-[SCNMaterial diffuse](-[SCNGeometry firstMaterial](v59, "firstMaterial"), "diffuse"), "setContents:", objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorYellow));
  -[SCNMaterial setLightingModelName:](-[SCNGeometry firstMaterial](v59, "firstMaterial"), "setLightingModelName:", CFSTR("SCNLightingModelConstant"));
  v60 = +[SCNNode nodeWithGeometry:](SCNNode, "nodeWithGeometry:", v59);
  self->_scaleNode = v60;
  -[SCNNode setCategoryBitMask:](v60, "setCategoryBitMask:", 1073);
  -[SCNNode setHidden:](self->_scaleNode, "setHidden:", 1);
  -[SCNNode addChildNode:](self->_node, "addChildNode:", self->_scaleNode);
  -[SCNManipulator updateManipulatorComponents](self, "updateManipulatorComponents");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v61);
}

- (void)updateManipulatorPosition:(__C3DEngineContext *)a3
{
  _BOOL8 v5;
  __int128 v6;
  __int128 v7;
  float v8;
  float v9;
  SCNNode *node;
  float32x2_t *planarTranslationLayout;
  double v12;
  double v13;
  double v14;
  int64_t v15;
  double v16;
  float32x4_t *Matrix4x4;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v47;
  float64x2_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  int32x4_t v54;
  float64x2_t v55;
  float64x2_t v56;
  int32x4_t v57;
  float64x2_t v58;
  _OWORD v59[4];
  float32x4_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  float32x4_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;

  v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  __computeAnchorMatrix(self, &v64);
  v6 = v65;
  *(float32x4_t *)&self->_worldMatrix.components[1] = v64;
  *(_OWORD *)&self->_worldMatrix.components[5] = v6;
  v7 = v67;
  *(_OWORD *)&self->_worldMatrix.components[9] = v66;
  *(_OWORD *)&self->_worldMatrix.components[13] = v7;
  -[SCNNode setSimdWorldTransform:](self->_node, "setSimdWorldTransform:", *(double *)&self->_worldMatrix.components[1], *(double *)&self->_worldMatrix.components[5], *(double *)&self->_worldMatrix.components[9], *(double *)&self->_worldMatrix.components[13]);
  C3DSizeForScreenSpaceSizeAndTransform((__n128 *)a3);
  v9 = v8;
  node = self->_node;
  if (v8 <= 0.000001)
  {
    -[SCNNode setOpacity:](node, "setOpacity:", 0.0);
  }
  else
  {
    planarTranslationLayout = (float32x2_t *)self->_planarTranslationLayout;
    -[SCNNode setOpacity:](node, "setOpacity:", 1.0);
    *(float *)&v12 = v9;
    *(float *)&v13 = v9;
    *(float *)&v14 = v9;
    -[SCNNode setScale:](self->_node, "setScale:", v12, v13, v14);
    v15 = -[SCNManipulator effectiveEditingSpace](self, "effectiveEditingSpace");
    if (!self->_layoutLocked || v15 == 3)
    {
      if (v15 == 3)
      {
        __asm { FMOV            V0.4S, #1.0 }
        *(_OWORD *)self->_planarTranslationLayout = _Q0;
      }
      else
      {
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        Matrix4x4 = (float32x4_t *)C3DEngineContextGetMatrix4x4((uint64_t)a3, 1);
        C3DMatrix4x4Mult((uint64_t)&self->_worldMatrix.components[1], Matrix4x4, &v64);
        v60 = v64;
        v61 = v65;
        v62 = v66;
        v63 = v67;
        *(double *)v23.i64 = C3DVector3Rotate((float32x2_t *)&v60, (float32x4_t)xmmword_1DD007970);
        v57 = v23;
        v60 = v64;
        v61 = v65;
        v62 = v66;
        v63 = v67;
        *(double *)v24.i64 = C3DVector3Rotate((float32x2_t *)&v60, (float32x4_t)xmmword_1DD007920);
        v54 = v24;
        v60 = v64;
        v61 = v65;
        v62 = v66;
        v63 = v67;
        C3DVector3Rotate((float32x2_t *)&v60, (float32x4_t)xmmword_1DD007600);
        v27 = vzip2q_s32(v57, v54);
        __asm
        {
          FMOV            V2.2S, #1.0
          FMOV            V3.2S, #-1.0
        }
        *(int8x8_t *)v27.i8 = vbsl_s8((int8x8_t)vcltz_f32(*(float32x2_t *)v27.i8), _D3, _D2);
        if (v28 >= 0.0)
          v29 = 1.0;
        else
          v29 = -1.0;
        v30 = 1.5708;
        v31 = 3.1416;
        if (*(float *)&v27.i32[1] == 1.0)
          v32 = 0.0;
        else
          v32 = 1.5708;
        if (*(float *)&v27.i32[1] == 1.0)
          v33 = 3.1416;
        else
          v33 = -1.5708;
        if (*(float *)&v27.i32[1] == 1.0)
          v34 = -1.5708;
        else
          v34 = 0.0;
        if (*(float *)&v27.i32[1] == 1.0)
          v35 = -1.5708;
        else
          v35 = 1.5708;
        if (v29 == 1.0)
          v36 = v34;
        else
          v36 = v35;
        if (v29 == 1.0)
          v37 = v33;
        else
          v37 = 0.0;
        if (v29 == 1.0)
          v38 = v32;
        else
          v38 = 0.0;
        if (v29 != 1.0)
        {
          v31 = -1.5708;
          v30 = 0.0;
        }
        *(float *)&v27.i32[2] = v29;
        *(int32x4_t *)self->_planarTranslationLayout = v27;
        if (*(float *)v27.i32 == 1.0)
          v39 = v31;
        else
          v39 = v30;
        -[SCNNode setEulerAngles:](self->_arcHandleXY, "setEulerAngles:", *(_OWORD *)&v54);
        *(float *)&v40 = v37;
        *(float *)&v41 = v38;
        *(float *)&v42 = v36;
        -[SCNNode setEulerAngles:](self->_arcHandleYZ, "setEulerAngles:", v40, v41, v42);
        LODWORD(v43) = 0;
        LODWORD(v44) = 0;
        *(float *)&v45 = v39;
        -[SCNNode setEulerAngles:](self->_arcHandleXZ, "setEulerAngles:", v43, v45, v44);
      }
    }
    v58 = (float64x2_t)vdupq_n_s64(0x3FD3333333333333uLL);
    __asm { FMOV            V1.2D, #0.5 }
    v55 = _Q1;
    v47 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(vmulq_f64(vcvtq_f64_f32(*planarTranslationLayout), v58), _Q1)));
    LODWORD(_Q1.f64[0]) = HIDWORD(v47);
    LODWORD(v16) = 0;
    -[SCNNode setPosition:](self->_planarTranslationHandleXY, "setPosition:", v47, _Q1.f64[0], v16, *(_OWORD *)&v55);
    v48 = vmulq_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)&self->_planarTranslationLayout[4]), v58), v56);
    v49 = COERCE_DOUBLE(vcvt_f32_f64(v48));
    LODWORD(v50) = HIDWORD(v49);
    LODWORD(v48.f64[0]) = 0;
    -[SCNNode setPosition:](self->_planarTranslationHandleYZ, "setPosition:", v48.f64[0], v49, v50);
    HIDWORD(v51) = 1070805811;
    v52 = COERCE_FLOAT(*(_OWORD *)planarTranslationLayout->f32) * 0.3 * 0.5;
    *(float *)&v52 = v52;
    v53 = COERCE_FLOAT(*(_QWORD *)&self->_planarTranslationLayout[8]) * 0.3 * 0.5;
    *(float *)&v51 = v53;
    LODWORD(v53) = 0;
    -[SCNNode setPosition:](self->_planarTranslationHandleXZ, "setPosition:", v52, v53, v51);
    if (self->_screenSpaceRotation)
    {
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      if (C3DConstraintBillboardMatrixForNode((uint64_t)a3, (uint64_t)-[SCNConstraint __CFObject](self->_billboard, "__CFObject"), (float32x4_t *)-[SCNNode nodeRef](self->_screenSpaceRotation, "nodeRef"), &v64, 1.0))
      {
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        C3DMatrix4x4ToSCNMatrix4((uint64_t)&v64, &v60);
        v59[0] = v60;
        v59[1] = v61;
        v59[2] = v62;
        v59[3] = v63;
        -[SCNNode setTransform:](self->_screenSpaceRotation, "setTransform:", v59);
      }
    }
  }
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
}

- (void)updateManipulatorNode
{
  SCNNode *node;

  node = self->_node;
  if (!node)
  {
    -[SCNManipulator setupNode](self, "setupNode");
    node = self->_node;
  }
  if (!-[SCNNode parentNode](node, "parentNode"))
    -[SCNNode addChildNode:](-[SCNAuthoringEnvironment authoringOverlayLayer](-[SCNManipulator authoringEnvironment](self, "authoringEnvironment"), "authoringOverlayLayer"), "addChildNode:", -[SCNManipulator manipulatorNode](self, "manipulatorNode"));
}

- (void)updateManipulatorComponents
{
  char v3;
  int64_t v4;
  _BOOL4 v5;
  int v6;
  _BOOL4 v7;
  _BOOL4 v8;
  BOOL v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;

  v3 = -[SCNManipulator _effectiveFeatures](self, "_effectiveFeatures");
  v4 = -[SCNManipulator effectiveEditingSpace](self, "effectiveEditingSpace");
  v5 = (v3 & 4) != 0 && !self->_readonly;
  v6 = !v5;
  -[SCNNode setHidden:](self->_scaleNode, "setHidden:", !v5);
  if ((v3 & 2) != 0)
  {
    v7 = !self->_readonly;
    if ((v3 & 1) != 0)
      goto LABEL_6;
  }
  else
  {
    v7 = 0;
    if ((v3 & 1) != 0)
    {
LABEL_6:
      v8 = !self->_readonly;
      goto LABEL_9;
    }
  }
  v8 = 0;
LABEL_9:
  v9 = v4 == 3;
  v10 = v4 == 3;
  v11 = v8 & v6 | !v7;
  if (v9)
    v12 = 1;
  else
    v12 = v11;
  -[SCNNode setHidden:](self->_rotationHandles, "setHidden:", v12);
  -[SCNNode setHidden:](self->_screenSpaceRotation, "setHidden:", v11);
  -[SCNNode setHidden:](self->_translateHandles, "setHidden:", v6 & !v8);
  v13 = self->_readonly || !v8;
  -[SCNNode setHidden:](self->_planarTranslationHandles, "setHidden:", (v5 || v7) | v13);
  v14 = !v7 || !v8;
  if (self->_readonly)
    v14 = 1;
  -[SCNNode setHidden:](self->_arcHandles, "setHidden:", v14 | v5);
  -[SCNNode setHidden:](self->_axis, "setHidden:", !self->_readonly);
  -[SCNNode setHidden:](self->_zArrow, "setHidden:", v10);
  -[SCNNode setHidden:](self->_planarTranslationHandleXZ, "setHidden:", v10);
  -[SCNNode setHidden:](self->_planarTranslationHandleYZ, "setHidden:", v10);
  -[SCNNode setHidden:](self->_arcHandleXZ, "setHidden:", v10);
  -[SCNNode setHidden:](self->_arcHandleYZ, "setHidden:", v10);
}

- (unint64_t)_effectiveFeatures
{
  unint64_t features;
  unint64_t v3;

  features = self->_features;
  v3 = features | 4;
  if ((features & 4) != 0)
    v3 = 7;
  if (self->_alternateMode)
    return v3;
  else
    return self->_features;
}

- (void)setFeatures:(unint64_t)a3
{
  self->_features = a3;
  -[SCNManipulator updateManipulatorComponents](self, "updateManipulatorComponents");
}

- (void)setAlternateMode:(BOOL)a3
{
  self->_alternateMode = a3;
  -[SCNManipulator updateManipulatorComponents](self, "updateManipulatorComponents");
}

- (void)setReadonly:(BOOL)a3
{
  self->_readonly = a3;
  -[SCNManipulator updateManipulatorComponents](self, "updateManipulatorComponents");
}

- (unint64_t)features
{
  return self->_features;
}

- (void)lockLayout
{
  self->_layoutLocked = 1;
}

- (void)unlockLayout
{
  self->_layoutLocked = 0;
}

- (void)unhighlightSelectedNode
{
  -[SCNNode enumerateHierarchyUsingBlock:](self->_highlightNode, "enumerateHierarchyUsingBlock:", &__block_literal_global_14);
  self->_highlightNode = 0;
}

uint64_t __41__SCNManipulator_unhighlightSelectedNode__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "geometry"), "firstMaterial"), "emission"), "setContents:", objc_msgSend(MEMORY[0x1E0CEA478], "blackColor"));
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "geometry"), "firstMaterial"), "multiply"), "setContents:", objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor"));
}

- (id)hitTest:(id *)a3
{
  SCNNode *node;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  SCNNode *v15;
  SCNNode *v16;
  void *v17;
  char v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  node = self->_node;
  if (!node)
    return 0;
  -[SCNNode opacity](node, "opacity");
  if (v6 == 0.0)
    return 0;
  if (-[SCNNode isHidden](self->_node, "isHidden"))
    return 0;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v7, "setObject:forKey:", self->_node, CFSTR("kHitTestRootNode"));
  v8 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("kHitTestSkipHiddenNode"));
  objc_msgSend(v7, "setObject:forKey:", &unk_1EA5FEEB0, CFSTR("kHitTestSearchMode"));
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("kHitTestClipToZRange"));
  objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4), CFSTR("kHitTestLayerMask"));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = (void *)objc_msgSend(a3->var1, "hitTest:options:", v7, a3->var3.x, a3->var3.y, 0);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v10)
    return 0;
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v22 != v13)
        objc_enumerationMutation(v9);
      v15 = (SCNNode *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "node");
      if (v15 == self->_occluder)
        goto LABEL_20;
      v16 = v15;
      while (-[SCNNode categoryBitMask](v15, "categoryBitMask") == 0xFFFF)
      {
        v15 = -[SCNNode parentNode](v16, "parentNode");
        v16 = v15;
      }
      if ((v12 & 1) != 0 && -[SCNNode parentNode](v16, "parentNode") == self->_rotationHandles)
      {
LABEL_20:
        v12 = 1;
      }
      else
      {
        v17 = v16;
        if (!v16)
          return v16;
        do
        {
          v18 = objc_msgSend(v17, "isHidden");
          v19 = objc_msgSend(v17, "parentNode");
          if ((v18 & 1) != 0)
            break;
          v17 = (void *)v19;
        }
        while (v19);
        if ((v18 & 1) == 0)
          return v16;
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    v16 = 0;
  }
  while (v11);
  return v16;
}

- (void)_updateActionWithEvent:(id *)a3
{
  __int128 v4;
  CGPoint var2;
  SCNNode *v6;
  SCNNode *highlightNode;
  _OWORD v8[5];

  v4 = *(_OWORD *)&a3->var4.x;
  v8[2] = a3->var3;
  v8[3] = v4;
  v8[4] = *(_OWORD *)&a3->var5.y;
  var2 = a3->var2;
  v8[0] = *(_OWORD *)&a3->var0;
  v8[1] = var2;
  v6 = -[SCNManipulator hitTest:](self, "hitTest:", v8);
  highlightNode = self->_highlightNode;
  if (highlightNode != v6)
    -[SCNManipulator unhighlightSelectedNode](self, "unhighlightSelectedNode");
  if (v6)
  {
    self->_action = -[SCNNode categoryBitMask](v6, "categoryBitMask") >> 8;
    self->_selectedAxis = -[SCNNode categoryBitMask](v6, "categoryBitMask") >> 4;
    if (highlightNode != v6)
    {
      self->_highlightNode = v6;
      -[SCNNode enumerateHierarchyUsingBlock:](v6, "enumerateHierarchyUsingBlock:", &__block_literal_global_15_0);
    }
  }
  else
  {
    self->_action = 0;
  }
}

uint64_t __41__SCNManipulator__updateActionWithEvent___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "geometry"), "firstMaterial"), "emission"), "setContents:", objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor"));
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "geometry"), "firstMaterial"), "multiply"), "setContents:", objc_msgSend(MEMORY[0x1E0CEA478], "orangeColor"));
}

- (BOOL)mouseMoved:(id *)a3
{
  int action;
  __int128 v7;
  CGPoint var2;
  _OWORD v9[5];

  action = self->_action;
  self->_action = 0;
  if (-[NSOrderedSet count](self->_targets, "count") && !self->_readonly)
  {
    if (-[SCNNode isHidden](self->_node, "isHidden"))
      return 0;
    v7 = *(_OWORD *)&a3->var4.x;
    v9[2] = a3->var3;
    v9[3] = v7;
    v9[4] = *(_OWORD *)&a3->var5.y;
    var2 = a3->var2;
    v9[0] = *(_OWORD *)&a3->var0;
    v9[1] = var2;
    -[SCNManipulator _updateActionWithEvent:](self, "_updateActionWithEvent:", v9);
  }
  return action != self->_action;
}

- (void)updateItemsPosition
{
  int v5;
  int v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "count");
  v6 = *a2;
  v7 = 136315650;
  v8 = "setToApplyTo.count <= _originalDataCount";
  v9 = 1024;
  v10 = v5;
  v11 = 1024;
  v12 = v6;
  _os_log_fault_impl(&dword_1DCCB8000, a3, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. The set we are updating contains more elements than the number of positions we have in store, something it wrong (%d vs %d)", (uint8_t *)&v7, 0x18u);
}

- (void)updateItemsRotation:(SCNManipulator *)self
{
  float32x4_t v2;
  uint64_t v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __n128 *v14;
  NSOrderedSet *targets;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  __int128 *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _OWORD v26[4];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _OWORD v31[4];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  simd_float4x4 v36;
  float32x4_t v37[4];
  _OWORD v38[4];
  float32x4_t v39;
  float32x4_t v40[4];
  _OWORD v41[4];
  simd_float4x4 v42;
  float32x4_t v43[4];
  SCNMatrix4 m;
  SCNMatrix4 v45;
  SCNMatrix4 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  float32x4_t v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v51 = v2;
  v4 = 800;
  if (!self->_cloning)
    v4 = 16;
  v5 = *(Class *)((char *)&self->super.isa + v4);
  v6 = -[SCNAuthoringEnvironment editingSpace](-[SCNManipulator authoringEnvironment](self, "authoringEnvironment"), "editingSpace");
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v48 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        v13 = (void *)objc_msgSend(v12, "parentItem");
        if (v13)
        {
          memset(&v46, 0, sizeof(v46));
          objc_msgSend(v13, "worldTransform");
          memset(&v45, 0, sizeof(v45));
          m = v46;
          SCNMatrix4Invert(&v45, &m);
          memset(&m, 0, sizeof(m));
          C3DMatrix4x4FromSCNMatrix4(&m, (uint64_t)&v45);
          memset(v43, 0, sizeof(v43));
          memset(&v42, 0, sizeof(v42));
          memset(v41, 0, sizeof(v41));
          memset(v40, 0, sizeof(v40));
          v39.i32[2] = 0;
          v39.i64[0] = 0;
          memset(v38, 0, sizeof(v38));
          if (v12)
            objc_msgSend(v12, "worldTransform");
          memset(v37, 0, sizeof(v37));
          C3DMatrix4x4FromSCNMatrix4(v37, (uint64_t)v38);
          C3DMatrix4x4GetScale(v37, &v39);
          C3DMatrix4x4MakeAffine(v43, (float32x4_t *)(*(_QWORD *)self->_anon_188 + 16 * (v9 + i)), (float32x4_t *)(*(_QWORD *)&self->_anon_188[8] + 16 * (v9 + i)), (float32x2_t *)&v39);
          memset(&v36, 0, sizeof(v36));
          if (v6)
            v14 = (__n128 *)&self->_worldInitialMatrix.components[13];
          else
            v14 = (__n128 *)(*(_QWORD *)self->_anon_188 + 16 * (v9 + i));
          C3DMatrix4x4MakeTranslation((uint64_t)&v36, v14);
          C3DMatrix4x4Invert(&v36, &v42);
          C3DMatrix4x4Mult((uint64_t)v43, (float32x4_t *)&v42, v43);
          C3DMatrix4x4MakeRotation(v40, &v51);
          C3DMatrix4x4Mult((uint64_t)v43, v40, v43);
          C3DMatrix4x4Mult((uint64_t)v43, (float32x4_t *)&v36, v43);
          C3DMatrix4x4Mult((uint64_t)v43, (float32x4_t *)&m, v41);
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          C3DMatrix4x4ToSCNMatrix4((uint64_t)v41, &v32);
          v31[0] = v32;
          v31[1] = v33;
          v31[2] = v34;
          v31[3] = v35;
          objc_msgSend(v12, "setTransform:", v31);
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      v9 += i;
    }
    while (v8);
  }
  if (self->_cloning)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    targets = self->_targets;
    v16 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](targets, "countByEnumeratingWithState:objects:count:", &v27, v52, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(targets);
          v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          v22 = (__int128 *)(*(_QWORD *)&self->_anon_188[16] + ((unint64_t)(v18 + j) << 6));
          v23 = v22[3];
          v25 = *v22;
          v24 = v22[1];
          v26[2] = v22[2];
          v26[3] = v23;
          v26[0] = v25;
          v26[1] = v24;
          objc_msgSend(v21, "setTransform:", v26);
        }
        v17 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](targets, "countByEnumeratingWithState:objects:count:", &v27, v52, 16);
        v18 += j;
      }
      while (v17);
    }
  }
}

- (void)updateItemsScale:(float)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  NSOrderedSet *targets;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  __int128 *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  float v24;
  _OWORD v25[4];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _OWORD v30[4];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  float32x4_t v35[4];
  float32x4_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = 800;
  if (!self->_cloning)
    v4 = 16;
  v5 = *(Class *)((char *)&self->super.isa + v4);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v42, 16, *(_QWORD *)&a3);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (objc_msgSend(v11, "parentItem"))
        {
          v36.i32[2] = 0;
          v36.i64[0] = 0;
          v12 = 16 * (v8 + i);
          v36 = vmulq_n_f32(*(float32x4_t *)(*(_QWORD *)&self->_anon_188[24] + v12), v24);
          v34 = 0u;
          memset(v35, 0, sizeof(v35));
          v32 = 0u;
          v33 = 0u;
          v31 = 0u;
          C3DMatrix4x4MakeAffine(v35, (float32x4_t *)(*(_QWORD *)self->_anon_188 + v12), (float32x4_t *)(*(_QWORD *)&self->_anon_188[8] + v12), (float32x2_t *)&v36);
          C3DMatrix4x4ToSCNMatrix4((uint64_t)v35, &v31);
          v30[0] = v31;
          v30[1] = v32;
          v30[2] = v33;
          v30[3] = v34;
          objc_msgSend(v11, "setWorldTransform:", v30);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      v8 += i;
    }
    while (v7);
  }
  if (self->_cloning)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    targets = self->_targets;
    v14 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](targets, "countByEnumeratingWithState:objects:count:", &v26, v41, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(targets);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          v20 = (__int128 *)(*(_QWORD *)&self->_anon_188[16] + ((unint64_t)(v16 + j) << 6));
          v21 = v20[3];
          v23 = *v20;
          v22 = v20[1];
          v25[2] = v20[2];
          v25[3] = v21;
          v25[0] = v23;
          v25[1] = v22;
          objc_msgSend(v19, "setTransform:", v25);
        }
        v15 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](targets, "countByEnumeratingWithState:objects:count:", &v26, v41, 16);
        v16 += j;
      }
      while (v15);
    }
  }
}

- (void)_saveOriginalData
{
  unsigned int v3;
  NSOrderedSet *targets;
  _QWORD v5[5];

  -[SCNManipulator _deleteOriginalData](self, "_deleteOriginalData");
  v3 = -[NSOrderedSet count](self->_targets, "count");
  self->_originalDataCount = v3;
  if (v3)
  {
    *(_QWORD *)&self->_anon_188[8] = malloc_type_malloc(16 * v3, 0x1000040451B5BE8uLL);
    *(_QWORD *)self->_anon_188 = malloc_type_malloc(16 * self->_originalDataCount, 0x1000040451B5BE8uLL);
    *(_QWORD *)&self->_anon_188[24] = malloc_type_malloc(16 * self->_originalDataCount, 0x1000040451B5BE8uLL);
    *(_QWORD *)&self->_anon_188[16] = malloc_type_malloc((unint64_t)self->_originalDataCount << 6, 0x1000040FA0F61DDuLL);
    targets = self->_targets;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __35__SCNManipulator__saveOriginalData__block_invoke;
    v5[3] = &unk_1EA59E670;
    v5[4] = self;
    -[NSOrderedSet enumerateObjectsUsingBlock:](targets, "enumerateObjectsUsingBlock:", v5);
  }
}

double __35__SCNManipulator__saveOriginalData__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  _OWORD *v11;
  __int128 v12;
  double result;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[3];
  __int128 v19;

  v19 = 0u;
  memset(v18, 0, sizeof(v18));
  if (a2)
  {
    objc_msgSend(a2, "worldTransform");
    v7 = *(_QWORD *)(a1 + 32);
    v6 = a1 + 32;
    v8 = *(_QWORD *)(v7 + 408);
    objc_msgSend(a2, "transform");
  }
  else
  {
    v6 = a1 + 32;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 408);
    v16 = 0uLL;
    v17 = 0uLL;
    v14 = 0uLL;
    v15 = 0uLL;
  }
  v9 = v14;
  v10 = v15;
  v11 = (_OWORD *)(v8 + (a3 << 6));
  v12 = v17;
  v11[2] = v16;
  v11[3] = v12;
  *v11 = v9;
  v11[1] = v10;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  C3DMatrix4x4FromSCNMatrix4(&v14, (uint64_t)v18);
  C3DMatrix4x4GetAffineTransforms((uint64_t)&v14, 0, (int8x16_t *)(*(_QWORD *)(*(_QWORD *)v6 + 400) + 16 * a3), (float32x4_t *)(*(_QWORD *)(*(_QWORD *)v6 + 416) + 16 * a3));
  result = *(double *)&v19;
  *(_OWORD *)(*(_QWORD *)(*(_QWORD *)v6 + 392) + 16 * a3) = v19;
  return result;
}

- (void)_deleteOriginalData
{
  unsigned __int8 *anon_188;

  anon_188 = self->_anon_188;
  free(*(void **)self->_anon_188);
  free(*(void **)&self->_anon_188[8]);
  free(*(void **)&self->_anon_188[24]);
  free(*(void **)&self->_anon_188[16]);
  self->_originalDataCount = 0;
  *(_OWORD *)anon_188 = 0u;
  *((_OWORD *)anon_188 + 1) = 0u;
}

- (BOOL)_applyWithEvent:(id *)a3
{
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v6;
  float32x4_t v7;
  float v8;
  float v9;
  float v10;
  float32x4_t v11;
  double v12;
  long double v13;
  _BOOL4 v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  double v37;
  long double v38;
  _BOOL4 v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float v50;
  float v51;
  unsigned int selectedAxis;
  float v58;
  simd_float4 v59;
  simd_float4 v60;
  float32x4_t v61;
  int32x4_t v62;
  float32x2_t v63;
  float32x2_t v64;
  float32x4_t v65;
  float v66;
  BOOL v67;
  double v68;
  double v69;
  double v70;
  float v71;
  double v72;
  SCNAuthoringEnvironment *v73;
  int64_t v74;
  float var0;
  uint64_t v76;
  int64_t v77;
  float v78;
  uint64_t v79;
  int64_t v80;
  float v81;
  uint64_t v82;
  int64_t v83;
  float v84;
  uint64_t v85;
  int64_t v86;
  float v87;
  uint64_t v88;
  int64_t v89;
  float v90;
  uint64_t v91;
  __n128 v92;
  float32x4_t v94;
  __n128 v95;
  float v96;
  float32x4_t v97[4];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  float32x4_t v102;
  simd_float4x4 v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v3.i64[0] = *(_QWORD *)&a3->var4.x;
  v6 = v3;
  v6.i32[2] = LODWORD(a3->var4.z);
  v3.i32[2] = v6.i32[2];
  v4.i64[0] = *(_QWORD *)&a3->var5.x;
  v4.i32[2] = LODWORD(a3->var5.z);
  v7 = vsubq_f32(v4, v3);
  v8 = self->_worldMatrix.components[13];
  v9 = self->_worldMatrix.components[14];
  v10 = self->_worldMatrix.components[15];
  switch(self->_action)
  {
    case 1u:
      *(double *)v11.i64 = __resolveAxisMove((float32x4_t *)self, v6, v7);
      v95 = (__n128)vaddq_f32(v11, *(float32x4_t *)&self->_anon_130[32]);
      +[SCNTransaction begin](SCNTransaction, "begin");
      +[SCNTransaction setDisableActions:](SCNTransaction, "setDisableActions:", 1);
      LOBYTE(v98) = 0;
      -[SCNAuthoringEnvironment gridUnit](-[SCNManipulator authoringEnvironment](self, "authoringEnvironment"), "gridUnit");
      v13 = v12;
      memset(&v103, 255, 24);
      v14 = -[SCNAuthoringEnvironment shouldSnapToAlign](-[SCNManipulator authoringEnvironment](self, "authoringEnvironment"), "shouldSnapToAlign");
      v18 = 0;
      v19 = 0;
      if (v14)
      {
        *(float *)&v15 = v8;
        *(float *)&v16 = v9;
        *(float *)&v17 = v10;
        -[SCNManipulator _snapPositionToAlign:original:unit:axisMove:rayStart:rayDir:didSnap:snapIndexes:](self, "_snapPositionToAlign:original:unit:axisMove:rayStart:rayDir:didSnap:snapIndexes:", 1, &v98, &v103, v95.n128_f64[0], v15, v16, v17, (double)v13, *(double *)self->_anon_130, *(double *)&self->_anon_130[16]);
      }
      if (!-[SCNAuthoringEnvironment shouldSnapOnGrid](-[SCNManipulator authoringEnvironment](self, "authoringEnvironment", v18, v19), "shouldSnapOnGrid"))goto LABEL_36;
      if (v13 == 0.0)
        goto LABEL_36;
      v97[0].i8[0] = 0;
      _snapPositionToGrid(1, v97, v95, v8, v9, v10, v13, *(float32x4_t *)self->_anon_130, *(float32x4_t *)&self->_anon_130[16]);
      if (!v97[0].i8[0])
        goto LABEL_36;
      if ((_BYTE)v98)
      {
        v21 = vsubq_f32(v20, (float32x4_t)v95);
        v22 = vmulq_f32(v21, v21);
        v23 = vsubq_f32(v94, (float32x4_t)v95);
        v24 = vmulq_f32(v23, v23);
        if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).f32[0]) >= sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v24, 2), vaddq_f32(v24, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v24.f32, 1))).f32[0]))
        {
LABEL_36:
          if (!(_BYTE)v98)
            goto LABEL_72;
          v74 = v103.columns[0].i64[0];
          if (v103.columns[0].i64[0] != -1 && v103.columns[0].i64[0] < self->_snapToAlignCount)
          {
            var0 = self->_snapToAlignOnX[v103.columns[0].i64[0]].var0;
            v76 = v103.columns[0].i64[0];
            do
            {
              if (vabds_f32(self->_snapToAlignOnX[v76].var0, var0) >= 0.00001)
                break;
              -[NSMutableIndexSet addIndex:](self->_snapXIndexes, "addIndex:", v74++);
              ++v76;
            }
            while (v74 < self->_snapToAlignCount);
          }
          v77 = v103.columns[0].i64[1];
          if (v103.columns[0].i64[1] != -1 && v103.columns[0].i64[1] < self->_snapToAlignCount)
          {
            v78 = self->_snapToAlignOnY[v103.columns[0].i64[1]].var0;
            v79 = v103.columns[0].i64[1];
            do
            {
              if (vabds_f32(self->_snapToAlignOnY[v79].var0, v78) >= 0.00001)
                break;
              -[NSMutableIndexSet addIndex:](self->_snapYIndexes, "addIndex:", v77++);
              ++v79;
            }
            while (v77 < self->_snapToAlignCount);
          }
          v80 = v103.columns[1].i64[0];
          if (v103.columns[1].i64[0] != -1 && v103.columns[1].i64[0] < self->_snapToAlignCount)
          {
            v81 = self->_snapToAlignOnZ[v103.columns[1].i64[0]].var0;
            v82 = v103.columns[1].i64[0];
            do
            {
              if (vabds_f32(self->_snapToAlignOnZ[v82].var0, v81) >= 0.00001)
                break;
              -[NSMutableIndexSet addIndex:](self->_snapZIndexes, "addIndex:", v80++);
              ++v82;
            }
            while (v80 < self->_snapToAlignCount);
          }
          goto LABEL_71;
        }
        memset(&v103, 255, 24);
      }
      else
      {
        LOBYTE(v98) = 1;
      }
      v94 = v20;
      goto LABEL_36;
    case 2u:
      v34 = *(float32x4_t *)&self->_anon_130[16];
      v35 = vmulq_f32(v7, v34);
      v36 = vmulq_f32(v34, vsubq_f32(*(float32x4_t *)&self->_anon_130[32], v6));
      v95 = (__n128)vaddq_f32(*(float32x4_t *)&self->_anon_130[48], vmlaq_n_f32(v6, v7, vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v36, 2), vaddq_f32(v36, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 1))), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v35, 2), vaddq_f32(v35, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v35.f32, 1)))).f32[0]));
      +[SCNTransaction begin](SCNTransaction, "begin");
      +[SCNTransaction setDisableActions:](SCNTransaction, "setDisableActions:", 1);
      LOBYTE(v98) = 0;
      -[SCNAuthoringEnvironment gridUnit](-[SCNManipulator authoringEnvironment](self, "authoringEnvironment"), "gridUnit");
      v38 = v37;
      memset(&v103, 255, 24);
      v39 = -[SCNAuthoringEnvironment shouldSnapToAlign](-[SCNManipulator authoringEnvironment](self, "authoringEnvironment"), "shouldSnapToAlign");
      v43 = 0;
      v44 = 0;
      if (v39)
      {
        *(float *)&v40 = v8;
        *(float *)&v41 = v9;
        *(float *)&v42 = v10;
        -[SCNManipulator _snapPositionToAlign:original:unit:axisMove:rayStart:rayDir:didSnap:snapIndexes:](self, "_snapPositionToAlign:original:unit:axisMove:rayStart:rayDir:didSnap:snapIndexes:", 0, &v98, &v103, v95.n128_f64[0], v40, v41, v42, (double)v38, 0.0, 0.0);
      }
      if (!-[SCNAuthoringEnvironment shouldSnapOnGrid](-[SCNManipulator authoringEnvironment](self, "authoringEnvironment", v43, v44), "shouldSnapOnGrid"))goto LABEL_55;
      if (v38 == 0.0)
        goto LABEL_55;
      v97[0].i8[0] = 0;
      _snapPositionToGrid(0, v97, v95, v8, v9, v10, v38, *(float32x4_t *)&self->_anon_130[32], *(float32x4_t *)&self->_anon_130[16]);
      if (!v97[0].i8[0])
        goto LABEL_55;
      if ((_BYTE)v98)
      {
        v46 = vsubq_f32(v45, (float32x4_t)v95);
        v47 = vmulq_f32(v46, v46);
        v48 = vsubq_f32(v94, (float32x4_t)v95);
        v49 = vmulq_f32(v48, v48);
        if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v47, 2), vaddq_f32(v47, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v47.f32, 1))).f32[0]) >= sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v49, 2), vaddq_f32(v49, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v49.f32, 1))).f32[0]))goto LABEL_55;
        memset(&v103, 255, 24);
      }
      else
      {
        LOBYTE(v98) = 1;
      }
      v94 = v45;
LABEL_55:
      if ((_BYTE)v98)
      {
        v83 = v103.columns[0].i64[0];
        if (v103.columns[0].i64[0] != -1 && v103.columns[0].i64[0] < self->_snapToAlignCount)
        {
          v84 = self->_snapToAlignOnX[v103.columns[0].i64[0]].var0;
          v85 = v103.columns[0].i64[0];
          do
          {
            if (vabds_f32(self->_snapToAlignOnX[v85].var0, v84) >= 0.00001)
              break;
            -[NSMutableIndexSet addIndex:](self->_snapXIndexes, "addIndex:", v83++);
            ++v85;
          }
          while (v83 < self->_snapToAlignCount);
        }
        v86 = v103.columns[0].i64[1];
        if (v103.columns[0].i64[1] != -1 && v103.columns[0].i64[1] < self->_snapToAlignCount)
        {
          v87 = self->_snapToAlignOnY[v103.columns[0].i64[1]].var0;
          v88 = v103.columns[0].i64[1];
          do
          {
            if (vabds_f32(self->_snapToAlignOnY[v88].var0, v87) >= 0.00001)
              break;
            -[NSMutableIndexSet addIndex:](self->_snapYIndexes, "addIndex:", v86++);
            ++v88;
          }
          while (v86 < self->_snapToAlignCount);
        }
        v89 = v103.columns[1].i64[0];
        if (v103.columns[1].i64[0] != -1 && v103.columns[1].i64[0] < self->_snapToAlignCount)
        {
          v90 = self->_snapToAlignOnZ[v103.columns[1].i64[0]].var0;
          v91 = v103.columns[1].i64[0];
          do
          {
            if (vabds_f32(self->_snapToAlignOnZ[v91].var0, v90) >= 0.00001)
              break;
            -[NSMutableIndexSet addIndex:](self->_snapZIndexes, "addIndex:", v89++);
            ++v91;
          }
          while (v89 < self->_snapToAlignCount);
        }
LABEL_71:
        v95 = (__n128)v94;
      }
LABEL_72:
      v92 = v95;
      v92.n128_u32[3] = *((_DWORD *)&self->_worldMatrix + 16);
      *(__n128 *)&self->_worldMatrix.components[13] = v92;
      -[SCNManipulator updateItemsPosition](self, "updateItemsPosition", *(_OWORD *)&v94);
      +[SCNTransaction commit](SCNTransaction, "commit");
      return 1;
    case 3u:
      v50 = a3->var2.y - self->_originalMouseLocation.y;
      v51 = (float)(*(float *)self->_anon_130 * v50) * 0.01;
      v102 = 0uLL;
      selectedAxis = self->_selectedAxis;
      v96 = v51;
      if (self->_selectedAxis)
      {
        __asm { FMOV            V1.2S, #1.0 }
        *(int8x8_t *)v6.f32 = vand_s8(_D1, (int8x8_t)vceq_s32(vdup_n_s32(selectedAxis), (int32x2_t)0x200000001));
        v58 = 0.0;
        if (selectedAxis == 3)
          v58 = 1.0;
        v6.f32[2] = v58;
        v59 = *(simd_float4 *)&self->_worldInitialMatrix.components[5];
        v103.columns[0] = *(simd_float4 *)&self->_worldInitialMatrix.components[1];
        v103.columns[1] = v59;
        v60 = *(simd_float4 *)&self->_worldInitialMatrix.components[13];
        v103.columns[2] = *(simd_float4 *)&self->_worldInitialMatrix.components[9];
        v103.columns[3] = v60;
        *(float32x2_t *)v61.f32 = C3DVector3RotateAndScale((float32x2_t *)&v103, v6);
        v62 = (int32x4_t)vmulq_f32(v61, v61);
        v62.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v62, 2), vadd_f32(*(float32x2_t *)v62.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v62.i8, 1))).u32[0];
        v63 = vrsqrte_f32((float32x2_t)v62.u32[0]);
        v64 = vmul_f32(v63, vrsqrts_f32((float32x2_t)v62.u32[0], vmul_f32(v63, v63)));
        v65 = vmulq_n_f32(v61, vmul_f32(v64, vrsqrts_f32((float32x2_t)v62.u32[0], vmul_f32(v64, v64))).f32[0]);
      }
      else
      {
        memset(&v103, 0, sizeof(v103));
        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        v73 = -[SCNManipulator authoringEnvironment](self, "authoringEnvironment");
        if (v73)
        {
          -[SCNAuthoringEnvironment viewMatrix](v73, "viewMatrix");
        }
        else
        {
          v100 = 0u;
          v101 = 0u;
          v98 = 0u;
          v99 = 0u;
        }
        C3DMatrix4x4FromSCNMatrix4(&v103, (uint64_t)&v98);
        C3DMatrix4x4Invert(&v103, &v103);
        v97[0] = (float32x4_t)v103.columns[0];
        v97[1] = (float32x4_t)v103.columns[1];
        v97[2] = (float32x4_t)v103.columns[2];
        v97[3] = (float32x4_t)v103.columns[3];
        *(double *)v65.i64 = C3DVector3Rotate((float32x2_t *)v97, (float32x4_t)xmmword_1DD007960);
      }
      v65.f32[3] = v96;
      v97[0] = v65;
      C3DQuaternionMakeAxisAngle(&v102, v97);
      memset(&v103, 0, sizeof(v103));
      C3DMatrix4x4MakeRotation(&v103, &v102);
      +[SCNTransaction begin](SCNTransaction, "begin", C3DMatrix4x4Mult3x3((uint64_t)&self->_worldInitialMatrix.components[1], (float32x4_t *)&v103, (uint64_t)&self->_worldMatrix.components[1]).n128_f64[0]);
      v33 = 1;
      +[SCNTransaction setDisableActions:](SCNTransaction, "setDisableActions:", 1);
      -[SCNManipulator updateItemsRotation:](self, "updateItemsRotation:", *(double *)v102.i64);
      goto LABEL_33;
    case 4u:
      v66 = a3->var2.y - self->_originalMouseLocation.y;
      v67 = v66 <= 0.0;
      v68 = v66;
      v69 = 1.0 / ((100.0 - v68) / 100.0);
      v70 = (v68 + 100.0) / 100.0;
      if (v67)
        v70 = v69;
      v71 = v70;
      +[SCNTransaction begin](SCNTransaction, "begin");
      v33 = 1;
      +[SCNTransaction setDisableActions:](SCNTransaction, "setDisableActions:", 1);
      *(float *)&v72 = v71;
      -[SCNManipulator updateItemsScale:](self, "updateItemsScale:", v72);
LABEL_33:
      +[SCNTransaction commit](SCNTransaction, "commit");
      return v33;
    default:
      v25 = scn_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[SCNManipulator _applyWithEvent:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);
      return 0;
  }
}

- (void)clearSnapIndexes
{
  free(self->_snapToAlignOnX);
  free(self->_snapToAlignOnY);
  free(self->_snapToAlignOnZ);
  *(_OWORD *)&self->_snapToAlignCount = 0u;
  *(_OWORD *)&self->_snapToAlignOnY = 0u;
  -[NSMutableIndexSet removeAllIndexes](self->_snapXIndexes, "removeAllIndexes");
  -[NSMutableIndexSet removeAllIndexes](self->_snapYIndexes, "removeAllIndexes");
  -[NSMutableIndexSet removeAllIndexes](self->_snapZIndexes, "removeAllIndexes");
}

- (BOOL)mouseDragged:(id *)a3
{
  __int128 v5;
  CGPoint var2;
  __int128 v7;
  CGPoint v8;
  __int128 v10;
  CGPoint v11;
  CGPoint var3;
  __int128 v13;
  __int128 v14;

  if (!self->_action)
    return 0;
  v5 = *(_OWORD *)&a3->var4.x;
  var3 = a3->var3;
  v13 = v5;
  v14 = *(_OWORD *)&a3->var5.y;
  var2 = a3->var2;
  v10 = *(_OWORD *)&a3->var0;
  v11 = var2;
  -[SCNManipulator _updateCloneStateWithEvent:](self, "_updateCloneStateWithEvent:", &v10);
  v7 = *(_OWORD *)&a3->var4.x;
  var3 = a3->var3;
  v13 = v7;
  v14 = *(_OWORD *)&a3->var5.y;
  v8 = a3->var2;
  v10 = *(_OWORD *)&a3->var0;
  v11 = v8;
  return -[SCNManipulator _applyWithEvent:](self, "_applyWithEvent:", &v10);
}

- (BOOL)mouseDown:(id *)a3
{
  __int128 v5;
  CGPoint var2;
  BOOL v7;
  float32x4_t v8;
  CGPoint v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  float32x4_t v13;
  float32x4_t *v14;
  unsigned int selectedAxis;
  float v21;
  CGPoint v22;
  __int128 v23;
  float32x4_t v24;
  CGPoint v25;
  __int128 v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x2_t v31;
  float32x2_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  unsigned int v36;
  float v38;
  CGPoint v39;
  __int128 v40;
  CGPoint v41;
  float32x4_t v42;
  __int128 v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  CGPoint v52;
  unsigned int v54;
  float32x4_t v55;
  float v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  BOOL v62;
  float v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  float32x4_t v77;
  CGPoint v78;
  CGPoint v79;
  __int128 v80;
  float32x4_t v81;
  CGPoint v82;
  CGPoint var3;
  __int128 v84;
  __int128 v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  if (-[SCNManipulator readonly](self, "readonly"))
    return 0;
  v5 = *(_OWORD *)&a3->var4.x;
  var3 = a3->var3;
  v84 = v5;
  v85 = *(_OWORD *)&a3->var5.y;
  var2 = a3->var2;
  v81 = *(float32x4_t *)&a3->var0;
  v82 = var2;
  -[SCNManipulator _updateActionWithEvent:](self, "_updateActionWithEvent:", &v81);
  if (!self->_action)
    return 0;
  v7 = 1;
  self->_isMouseDown = 1;
  -[SCNManipulator _saveOriginalData](self, "_saveOriginalData");
  __computeAnchorMatrix(self, &v81);
  v9 = v82;
  *(float32x4_t *)&self->_worldMatrix.components[1] = v81;
  *(CGPoint *)&self->_worldMatrix.components[5] = v9;
  v10 = v84;
  *(CGPoint *)&self->_worldMatrix.components[9] = var3;
  *(_OWORD *)&self->_worldMatrix.components[13] = v10;
  v11 = *(_OWORD *)&self->_worldMatrix.components[5];
  *(_OWORD *)&self->_worldInitialMatrix.components[1] = *(_OWORD *)&self->_worldMatrix.components[1];
  *(_OWORD *)&self->_worldInitialMatrix.components[5] = v11;
  v12 = *(_OWORD *)&self->_worldMatrix.components[13];
  *(_OWORD *)&self->_worldInitialMatrix.components[9] = *(_OWORD *)&self->_worldMatrix.components[9];
  *(_OWORD *)&self->_worldInitialMatrix.components[13] = v12;
  v13 = (float32x4_t)a3->var2;
  self->_originalMouseLocation = (CGPoint)v13;
  v14 = (float32x4_t *)&self->_worldMatrix.components[1];
  switch(self->_action)
  {
    case 1u:
      selectedAxis = self->_selectedAxis;
      __asm { FMOV            V1.2S, #1.0 }
      *(int8x8_t *)v13.f32 = vand_s8((int8x8_t)vceq_s32(vdup_n_s32(selectedAxis), (int32x2_t)0x200000001), _D1);
      v21 = 0.0;
      if (selectedAxis == 3)
        v21 = 1.0;
      v13.f32[2] = v21;
      v73 = vmulq_f32(v13, (float32x4_t)vdupq_n_s32(0x42C80000u));
      v22 = *(CGPoint *)&self->_worldMatrix.components[5];
      v81 = *v14;
      v82 = v22;
      v23 = *(_OWORD *)&self->_worldMatrix.components[13];
      v24 = *v14;
      v25 = *(CGPoint *)&self->_worldMatrix.components[5];
      var3 = *(CGPoint *)&self->_worldMatrix.components[9];
      v84 = v23;
      v77 = v24;
      v78 = v25;
      v26 = *(_OWORD *)&self->_worldMatrix.components[13];
      v79 = *(CGPoint *)&self->_worldMatrix.components[9];
      v80 = v26;
      *(double *)v27.i64 = C3DVector3MultMatrix4x4(&v77, (float32x4_t)0);
      v75 = v27;
      v77 = v81;
      v78 = v82;
      v79 = var3;
      v80 = v84;
      *(double *)v28.i64 = C3DVector3MultMatrix4x4(&v77, v73);
      v29 = vsubq_f32(v28, v75);
      v30 = vmulq_f32(v29, v29);
      v30.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)v30, 2), vadd_f32(*(float32x2_t *)v30.f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v30.f32, 1))).u32[0];
      v31 = vrsqrte_f32((float32x2_t)v30.u32[0]);
      v32 = vmul_f32(v31, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(v31, v31)));
      v33 = vmulq_n_f32(v29, vmul_f32(v32, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(v32, v32))).f32[0]);
      *(float32x4_t *)self->_anon_130 = v75;
      *(float32x4_t *)&self->_anon_130[16] = v33;
      v33.i64[0] = *(_QWORD *)&a3->var4.x;
      v34 = v33;
      v34.i32[2] = LODWORD(a3->var4.z);
      v33.i32[2] = v34.i32[2];
      v30.i64[0] = *(_QWORD *)&a3->var5.x;
      v30.i32[2] = LODWORD(a3->var5.z);
      *(double *)v35.i64 = __resolveAxisMove((float32x4_t *)self, v33, vsubq_f32(v30, v34));
      *(float32x4_t *)&self->_anon_130[32] = vsubq_f32(v75, v35);
      break;
    case 2u:
      v36 = self->_selectedAxis;
      __asm { FMOV            V1.2S, #1.0 }
      *(int8x8_t *)v8.f32 = vand_s8((int8x8_t)vceq_s32(vdup_n_s32(v36), (int32x2_t)0x200000001), _D1);
      v38 = 0.0;
      if (v36 == 3)
        v38 = 1.0;
      v8.f32[2] = v38;
      v76 = v8;
      v39 = *(CGPoint *)&self->_worldMatrix.components[5];
      v81 = *v14;
      v82 = v39;
      v40 = *(_OWORD *)&self->_worldMatrix.components[13];
      v42 = *v14;
      v41 = *(CGPoint *)&self->_worldMatrix.components[5];
      var3 = *(CGPoint *)&self->_worldMatrix.components[9];
      v84 = v40;
      v77 = v42;
      v78 = v41;
      v43 = *(_OWORD *)&self->_worldMatrix.components[13];
      v79 = *(CGPoint *)&self->_worldMatrix.components[9];
      v80 = v43;
      *(double *)v44.i64 = C3DVector3MultMatrix4x4(&v77, (float32x4_t)0);
      v74 = v44;
      v77 = v81;
      v78 = v82;
      v79 = var3;
      v80 = v84;
      *(double *)v45.i64 = C3DVector3MultMatrix4x4(&v77, v76);
      v46.i32[3] = v74.i32[3];
      v47 = vsubq_f32(v45, v74);
      *(float32x4_t *)&self->_anon_130[16] = v47;
      *(float32x4_t *)&self->_anon_130[32] = v74;
      *(float32x4_t *)self->_anon_130 = v74;
      v46.i64[0] = *(_QWORD *)&a3->var4.x;
      v46.i32[2] = LODWORD(a3->var4.z);
      v48.i64[0] = *(_QWORD *)&a3->var5.x;
      v48.i32[2] = LODWORD(a3->var5.z);
      v49 = vsubq_f32(v48, v46);
      v50 = vmulq_f32(v47, v49);
      v51 = vmulq_f32(v47, vsubq_f32(v74, v46));
      *(float32x4_t *)&self->_anon_130[48] = vsubq_f32(v74, vmlaq_n_f32(v46, v49, vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v51, 2), vaddq_f32(v51, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v51.f32, 1))), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v50, 2), vaddq_f32(v50, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v50.f32, 1)))).f32[0]));
      break;
    case 3u:
      v52 = *(CGPoint *)&self->_worldMatrix.components[5];
      v81 = *v14;
      v82 = v52;
      v55 = *(float32x4_t *)&self->_worldMatrix.components[9];
      _Q1 = *(_OWORD *)&self->_worldMatrix.components[13];
      v54 = self->_selectedAxis;
      var3 = (CGPoint)v55;
      v84 = _Q1;
      __asm { FMOV            V1.2S, #1.0 }
      *(int8x8_t *)v55.f32 = vand_s8(*(int8x8_t *)&_Q1, (int8x8_t)vceq_s32(vdup_n_s32(v54), (int32x2_t)0x200000001));
      v56 = 0.0;
      if (v54 == 3)
        v56 = 1.0;
      v55.f32[2] = v56;
      *(float32x2_t *)v57.f32 = C3DVector3RotateAndScale((float32x2_t *)&v81, v55);
      v58 = vmulq_f32(v57, v57);
      v59 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v58, 2);
      v58.i32[0] = vadd_f32(*(float32x2_t *)v59.f32, vadd_f32(*(float32x2_t *)v58.f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v58.f32, 1))).u32[0];
      *(float32x2_t *)v59.f32 = vrsqrte_f32((float32x2_t)v58.u32[0]);
      *(float32x2_t *)v59.f32 = vmul_f32(*(float32x2_t *)v59.f32, vrsqrts_f32((float32x2_t)v58.u32[0], vmul_f32(*(float32x2_t *)v59.f32, *(float32x2_t *)v59.f32)));
      v58.i32[0] = vmul_f32(*(float32x2_t *)v59.f32, vrsqrts_f32((float32x2_t)v58.u32[0], vmul_f32(*(float32x2_t *)v59.f32, *(float32x2_t *)v59.f32))).u32[0];
      v59.i64[0] = *(_QWORD *)&a3->var5.x;
      v59.i32[2] = LODWORD(a3->var5.z);
      v60 = vmulq_n_f32(v57, v58.f32[0]);
      v58.i64[0] = *(_QWORD *)&a3->var4.x;
      v58.i32[2] = LODWORD(a3->var4.z);
      v61 = vmulq_f32(v60, vsubq_f32(v59, v58));
      v62 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v61, 2), vaddq_f32(v61, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v61.f32, 1))).f32[0] <= 0.0;
      v63 = -1.0;
      if (v62)
        v63 = 1.0;
      *(float *)self->_anon_130 = v63;
      break;
    case 4u:
      return v7;
    default:
      v64 = scn_default_log();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        -[SCNManipulator _applyWithEvent:].cold.1(v64, v65, v66, v67, v68, v69, v70, v71);
      return 0;
  }
  return v7;
}

- (BOOL)mouseUp:(id *)a3
{
  BOOL v5;
  __int128 v6;
  CGPoint var2;
  __int128 v8;
  CGPoint v9;
  __int128 v10;
  CGPoint v11;
  SCNAuthoringEnvironmentDelegate *v13;
  SCNAuthoringEnvironmentDelegate *v14;
  _OWORD v15[5];
  __int128 v16;
  CGPoint v17;
  CGPoint var3;
  __int128 v19;
  __int128 v20;

  if (-[SCNManipulator readonly](self, "readonly"))
    return 0;
  -[SCNManipulator clearSnapIndexes](self, "clearSnapIndexes");
  v5 = self->_action != 0;
  if (self->_action)
  {
    v6 = *(_OWORD *)&a3->var4.x;
    var3 = a3->var3;
    v19 = v6;
    v20 = *(_OWORD *)&a3->var5.y;
    var2 = a3->var2;
    v16 = *(_OWORD *)&a3->var0;
    v17 = var2;
    -[SCNManipulator _updateCloneStateWithEvent:](self, "_updateCloneStateWithEvent:", &v16);
    v8 = *(_OWORD *)&a3->var4.x;
    var3 = a3->var3;
    v19 = v8;
    v20 = *(_OWORD *)&a3->var5.y;
    v9 = a3->var2;
    v16 = *(_OWORD *)&a3->var0;
    v17 = v9;
    -[SCNManipulator _applyWithEvent:](self, "_applyWithEvent:", &v16);
    if (self->_cloning)
    {
      -[SCNManipulator validateClones](self, "validateClones");
    }
    else
    {
      v13 = -[SCNAuthoringEnvironment delegate](self->_authoringEnvironment, "delegate");
      if (v13)
      {
        v14 = v13;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[SCNAuthoringEnvironmentDelegate authoringEnvironment:didMoveItems:fromTransform:](v14, "authoringEnvironment:didMoveItems:fromTransform:", self->_authoringEnvironment, -[NSOrderedSet array](self->_targets, "array"), *(_QWORD *)&self->_anon_188[16]);
      }
    }
  }

  self->_cloneSet = 0;
  self->_cloning = 0;
  self->_action = 0;
  *(_OWORD *)self->_anon_130 = 0u;
  *(_OWORD *)&self->_anon_130[16] = 0u;
  *(_OWORD *)&self->_anon_130[32] = 0u;
  *(_OWORD *)&self->_anon_130[48] = 0u;
  self->_isMouseDown = 0;
  v10 = *(_OWORD *)&a3->var4.x;
  v15[2] = a3->var3;
  v15[3] = v10;
  v15[4] = *(_OWORD *)&a3->var5.y;
  v11 = a3->var2;
  v15[0] = *(_OWORD *)&a3->var0;
  v15[1] = v11;
  -[SCNManipulator mouseMoved:](self, "mouseMoved:", v15);
  return v5;
}

- (id)scene
{
  return (id)-[SCNSceneRenderer scene](-[SCNAuthoringEnvironment sceneRenderer](-[SCNManipulator authoringEnvironment](self, "authoringEnvironment"), "sceneRenderer"), "scene");
}

- (void)removeClonesFromScene
{
  -[NSOrderedSet firstObject](self->_cloneSet, "firstObject");
  objc_msgSend((id)objc_opt_class(), "removeItemsFromScene:", -[NSOrderedSet array](self->_cloneSet, "array"));
}

- (void)addClonesToScene
{
  id v3;

  v3 = -[SCNManipulator scene](self, "scene");
  -[NSOrderedSet firstObject](self->_cloneSet, "firstObject");
  objc_msgSend((id)objc_opt_class(), "addItems:toScene:", -[NSOrderedSet array](self->_cloneSet, "array"), v3);
}

- (void)validateClones
{
  SCNAuthoringEnvironmentDelegate *v3;
  SCNAuthoringEnvironmentDelegate *v4;
  SCNAuthoringEnvironment *v5;
  NSOrderedSet *cloneSet;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[SCNAuthoringEnvironment delegate](self->_authoringEnvironment, "delegate");
  if (v3)
  {
    v4 = v3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = -[SCNManipulator authoringEnvironment](self, "authoringEnvironment");
      objc_sync_enter(v5);
      -[NSOrderedSet firstObject](self->_cloneSet, "firstObject");
      objc_msgSend((id)objc_opt_class(), "removeItemsFromScene:", -[NSOrderedSet array](self->_cloneSet, "array"));
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      cloneSet = self->_cloneSet;
      v7 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](cloneSet, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v11;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(cloneSet);
            objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "validateClone");
          }
          v7 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](cloneSet, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }
      objc_sync_exit(v5);
      -[SCNAuthoringEnvironmentDelegate authoringEnvironment:didCloneSelection:](v4, "authoringEnvironment:didCloneSelection:", self->_authoringEnvironment, -[NSOrderedSet array](self->_cloneSet, "array"));
    }
  }
}

- (id)setupClones
{
  void *v3;
  id v4;
  NSOrderedSet *targets;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v4 = -[SCNManipulator scene](self, "scene");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  targets = self->_targets;
  v6 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](targets, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(targets);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "cloneForManipulators");
        if (v10)
        {
          v11 = v10;
          v12 = (void *)objc_opt_class();
          v18 = v11;
          objc_msgSend(v12, "addItems:toScene:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1), v4);
          objc_msgSend(v3, "addObject:", v11);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](targets, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v7);
  }
  return v3;
}

- (id)snapGuideIndexesOnAxis:(unint64_t)a3
{
  uint64_t v3;

  v3 = 608;
  if (a3 == 2)
    v3 = 600;
  if (a3 == 1)
    v3 = 592;
  return *(Class *)((char *)&self->super.isa + v3);
}

- (const)snapInfoAtIndex:(unint64_t)a3 axis:(unint64_t)a4
{
  uint64_t v4;

  v4 = 584;
  if (a4 == 2)
    v4 = 576;
  if (a4 == 1)
    v4 = 568;
  return (const $650CE108227E718D0103F828694BDA85 *)(*(char **)((char *)&self->super.isa + v4) + 24 * a3);
}

- (void)_prepareSnapToAlignData:(SCNManipulator *)self minOffset:(SEL)a2 maxOffset:(unsigned __int16)a3
{
  __int128 v3;
  __int128 v4;
  int v5;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  float v13;
  float v14;
  float v15;
  float v16;
  void *v17;
  float32x4_t *v18;
  float32x4_t *WorldMatrix;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  float v30;
  float v31;
  float v32;
  float *v33;
  __int128 v34;
  __int128 v35;
  float32x4_t v36;
  int32x4_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  float32x4_t v41;

  v34 = v3;
  v35 = v4;
  if ((a3 - 1) >= 3)
  {
    NSLog(CFSTR("_prepareSnapToAlignDataForAxis - unexpected axis"), a2);
  }
  else
  {
    v5 = a3;
    v7 = 8 * (unsigned __int16)(a3 - 1) + 568;
    free(*(void **)((char *)&self->super.isa + v7));
    *(Class *)((char *)&self->super.isa + v7) = 0;
    if (-[NSOrderedSet count](self->_targets, "count"))
    {
      v8 = (void *)objc_msgSend((id)objc_msgSend(-[SCNManipulator scene](self, "scene"), "rootNode"), "childNodesPassingTest:", &__block_literal_global_26_0);
      v9 = objc_msgSend(v8, "count");
      v10 = v9;
      if (v9)
      {
        v11 = 0;
        v12 = 0;
        *(Class *)((char *)&self->super.isa + v7) = (Class)malloc_type_calloc(0x18uLL, 5 * v9, 0x1F81AE88uLL);
        v13 = *((float *)&v34 + 2);
        v14 = *((float *)&v35 + 2);
        v15 = *((float *)&v34 + 1);
        v16 = *((float *)&v35 + 1);
        while (1)
        {
          v17 = (void *)objc_msgSend(v8, "objectAtIndex:", v11, v34, v35);
          if ((_itemsContainsNode(self->_targets, v17) & 1) == 0)
            break;
LABEL_19:
          if (v10 == ++v11)
          {
            self->_snapToAlignCount = v12;
            qsort(*(void **)((char *)&self->super.isa + v7), v12, 0x18uLL, (int (__cdecl *)(const void *, const void *))_sortSnapData);
            return;
          }
        }
        v18 = (float32x4_t *)objc_msgSend(v17, "nodeRef");
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        if (v17)
          objc_msgSend(v17, "worldTransform");
        v36 = 0u;
        v37 = 0u;
        if ((C3DNodeGetLocalBoundingBox((uint64_t)v18, &v36) & 1) != 0)
        {
          WorldMatrix = C3DNodeGetWorldMatrix(v18);
          v20 = WorldMatrix[1];
          v21 = WorldMatrix[2];
          v22 = vaddq_f32(WorldMatrix[3], vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32(v20, *(float32x2_t *)v36.f32, 1), *WorldMatrix, v36.f32[0]), v21, v36, 2));
          v22.i32[3] = 1.0;
          v23 = (float32x4_t)v37;
          v23.i32[1] = v37.i32[0];
          v23.i32[2] = v37.i32[0];
          v24 = vaddq_f32(vaddq_f32(vabsq_f32(vmulq_f32(*WorldMatrix, v23)), vabsq_f32(vmulq_f32((float32x4_t)vuzp2q_s32(vdupq_lane_s32(*(int32x2_t *)v37.i8, 1), v37), v20))), vabsq_f32(vmulq_f32((float32x4_t)vzip2q_s32(vtrn1q_s32(v37, v37), v37), v21)));
        }
        else
        {
          v22 = v41;
          v22.i32[3] = 1.0;
          v24 = 0uLL;
        }
        v36 = v22;
        v37 = (int32x4_t)v24;
        v25 = 3 * v12;
        (*(_QWORD **)((char *)&self->super.isa + v7))[v25 + 1] = v18;
        v26 = v12 + 1;
        (*(_QWORD **)((char *)&self->super.isa + v7))[3 * v12 + 4] = v18;
        v27 = v12 + 2;
        (*(_QWORD **)((char *)&self->super.isa + v7))[3 * v12 + 7] = v18;
        v28 = v12 + 3;
        (*(_QWORD **)((char *)&self->super.isa + v7))[3 * v12 + 10] = v18;
        (*(_QWORD **)((char *)&self->super.isa + v7))[3 * v12 + 13] = v18;
        v29 = *(uint64_t *)((char *)&self->super.isa + v7);
        *(_DWORD *)(v29 + 8 * v25 + 16) = 0;
        switch(v5)
        {
          case 3:
            *(_DWORD *)(v29 + 24 * v12) = v41.i32[2];
            *(float *)(v29 + 24 * v26) = v13 + (float)(v36.f32[2] + *(float *)&v37.i32[2]);
            *(float *)(v29 + 24 * v27) = v14 + (float)(v36.f32[2] + *(float *)&v37.i32[2]);
            *(float *)(v29 + 24 * v28) = v13 + (float)(v36.f32[2] - *(float *)&v37.i32[2]);
            v30 = v14 + (float)(v36.f32[2] - *(float *)&v37.i32[2]);
            v31 = v13;
            v32 = v14;
            break;
          case 2:
            *(_DWORD *)(v29 + 24 * v12) = v41.i32[1];
            *(float *)(v29 + 24 * v26) = v15 + (float)(v36.f32[1] + *(float *)&v37.i32[1]);
            *(float *)(v29 + 24 * v27) = v16 + (float)(v36.f32[1] + *(float *)&v37.i32[1]);
            *(float *)(v29 + 24 * v28) = v15 + (float)(v36.f32[1] - *(float *)&v37.i32[1]);
            v30 = v16 + (float)(v36.f32[1] - *(float *)&v37.i32[1]);
            v31 = v15;
            v32 = v16;
            break;
          case 1:
            *(_DWORD *)(v29 + 24 * v12) = v41.i32[0];
            *(float *)(v29 + 24 * v26) = (float)(v36.f32[0] + *(float *)v37.i32) + *(float *)&v34;
            *(float *)(v29 + 24 * v27) = (float)(v36.f32[0] + *(float *)v37.i32) + *(float *)&v35;
            *(float *)(v29 + 24 * v28) = (float)(v36.f32[0] - *(float *)v37.i32) + *(float *)&v34;
            v30 = (float)(v36.f32[0] - *(float *)v37.i32) + *(float *)&v35;
            v31 = *(float *)&v34;
            v32 = *(float *)&v35;
            break;
          default:
LABEL_18:
            v12 += 5;
            goto LABEL_19;
        }
        v33 = (float *)(v29 + 24 * (v12 + 4));
        *v33 = v30;
        *(float *)(v29 + 24 * v26 + 16) = v31;
        *(float *)(v29 + 24 * v27 + 16) = v32;
        *(float *)(v29 + 24 * v28 + 16) = v31;
        v33[4] = v32;
        goto LABEL_18;
      }
    }
  }
}

BOOL __62__SCNManipulator__prepareSnapToAlignData_minOffset_maxOffset___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "geometry") != 0;
}

- (void)prepareSnapToAlignData
{
  NSOrderedSet *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  int32x4_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  unsigned int v16;
  unsigned int v17;
  float v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  float32x2_t v23;
  __int32 v24;
  float v25;
  float v26;
  float v27;
  int8x8_t v28;
  float32x2_t v29;
  float32x2_t v30;
  __int128 v31;
  float v32;
  float32x2_t v33;
  float32x2_t v34;
  float32x2_t v35;
  double v36;
  __int128 v37;
  double v38;
  int32x4_t v39;
  int32x4_t v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  uint64_t v45;
  int v46;
  unint64_t v47;
  float v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v35 = 0;
  v3 = -[SCNManipulator targets](self, "targets");
  v4 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v50;
    *(_QWORD *)&v8 = 0x80000000800000;
    *((_QWORD *)&v8 + 1) = 0x80000000800000;
    v37 = v8;
    v39 = vdupq_n_s32(0x7F7FFFFFu);
    do
    {
      v9 = 0;
      v10 = v39;
      do
      {
        v40 = v10;
        if (*(_QWORD *)v50 != v7)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v9);
        if (objc_msgSend(v11, "node")
          && (v48 = 0.0,
              v47 = 0,
              v46 = 0,
              v45 = 0,
              objc_msgSend((id)objc_msgSend(v11, "node"), "getBoundingBoxMin:max:", &v47, &v45)))
        {
          v12 = (void *)objc_msgSend(v11, "node");
          LODWORD(v14) = HIDWORD(v47);
          LODWORD(v13) = v47;
          *(float *)&v15 = v48;
          objc_msgSend(v12, "convertPosition:toNode:", 0, v13, v14, v15);
          v47 = __PAIR64__(v17, v16);
          v48 = v18;
          v19 = (void *)objc_msgSend(v11, "node");
          LODWORD(v21) = HIDWORD(v45);
          LODWORD(v20) = v45;
          LODWORD(v22) = v46;
          objc_msgSend(v19, "convertPosition:toNode:", 0, v20, v21, v22);
          v26 = *(float *)&v40.i32[2];
          if (v48 >= v25)
            v27 = v25;
          else
            v27 = v48;
          if (v48 >= v25)
            v25 = v48;
          if (*(float *)&v40.i32[2] >= v27)
            v26 = v27;
          v23.i32[1] = v24;
          v28 = (int8x8_t)vcgt_f32(v23, (float32x2_t)v47);
          v29 = (float32x2_t)vbsl_s8(v28, (int8x8_t)v47, (int8x8_t)v23);
          *(int8x8_t *)v10.i8 = vbsl_s8((int8x8_t)vcgt_f32(v29, *(float32x2_t *)v40.i8), *(int8x8_t *)v40.i8, (int8x8_t)v29);
          v10.i64[1] = __PAIR64__(v40.u32[3], LODWORD(v26));
          v30 = (float32x2_t)vbsl_s8(v28, (int8x8_t)v23, (int8x8_t)v47);
          *(int8x8_t *)&v31 = vbsl_s8((int8x8_t)vcgt_f32(v30, *(float32x2_t *)&v37), (int8x8_t)v30, *(int8x8_t *)&v37);
          v32 = *((float *)&v37 + 2);
          if (*((float *)&v37 + 2) < v25)
            v32 = v25;
          *((_QWORD *)&v31 + 1) = __PAIR64__(HIDWORD(v37), LODWORD(v32));
          v6 = 1;
          v37 = v31;
        }
        else
        {
          v10 = v40;
        }
        ++v9;
      }
      while (v5 != v9);
      v39 = v10;
      v5 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v5);
    *(double *)&v33 = 0.0;
    if ((v6 & 1) != 0)
    {
      if (self)
      {
        -[SCNManipulator transform](self, "transform", 0.0);
        -[SCNManipulator transform](self, "transform");
        -[SCNManipulator transform](self, "transform");
        -[SCNManipulator transform](self, "transform");
        -[SCNManipulator transform](self, "transform");
        -[SCNManipulator transform](self, "transform");
        v33 = vsub_f32(*(float32x2_t *)v39.i8, (float32x2_t)__PAIR64__(v41, v42));
        v34 = vsub_f32(*(float32x2_t *)&v37, (float32x2_t)__PAIR64__(v43, v44));
      }
      else
      {
        v34 = (float32x2_t)v37;
        v33 = *(float32x2_t *)v39.i8;
      }
      v35 = v34;
    }
  }
  else
  {
    *(double *)&v33 = 0.0;
  }
  v38 = *(double *)&v33;
  -[SCNManipulator _prepareSnapToAlignData:minOffset:maxOffset:](self, "_prepareSnapToAlignData:minOffset:maxOffset:", 1, *(_QWORD *)&v35);
  -[SCNManipulator _prepareSnapToAlignData:minOffset:maxOffset:](self, "_prepareSnapToAlignData:minOffset:maxOffset:", 2, v38, v36);
  -[SCNManipulator _prepareSnapToAlignData:minOffset:maxOffset:](self, "_prepareSnapToAlignData:minOffset:maxOffset:", 3, v38, v36);
}

- (void)prepareSnapToAlignDataIfNeeded
{
  uint64_t v3;

  if (!self->_snapToAlignCount)
  {
    v3 = objc_msgSend(-[SCNManipulator scene](self, "scene"), "sceneRef");
    +[SCNTransaction lock](SCNTransaction, "lock");
    if (v3)
    {
      C3DSceneLock(v3);
      -[SCNManipulator prepareSnapToAlignData](self, "prepareSnapToAlignData");
      C3DSceneUnlock(v3);
    }
    else
    {
      -[SCNManipulator prepareSnapToAlignData](self, "prepareSnapToAlignData");
    }
    +[SCNTransaction unlock](SCNTransaction, "unlock");
  }
}

- (void)_snapPositionToAlign:(float)a3 original:(float)a4 unit:(float)a5 axisMove:(double)a6 rayStart:(__n128)a7 rayDir:(__n128)a8 didSnap:(uint64_t)a9 snapIndexes:(int)a10
{
  __n128 v20;
  _BOOL8 v21;
  float32x4_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  float32x4_t v28;
  float32x4_t v29;
  __int32 v31;
  __n128 v32;
  __n128 v33;
  __n128 v34;
  __n128 v35;

  v34 = a8;
  v35 = a7;
  objc_msgSend(a1, "prepareSnapToAlignDataIfNeeded");
  *a11 = 0;
  if (a1[70] && a1[71])
  {
    v32 = 0u;
    v33 = 0u;
    v31 = 0;
    C3DRay3Make(&v32, &v35, &v34);
    v20 = a2;
    v21 = 0;
    v22 = (float32x4_t)a2;
    if (vabds_f32(a2.n128_f32[0], a3) > 0.00001)
    {
      v23 = _snapPositionToAlign(a1[71], a1[70], &v31, a2.n128_f32[0], a6);
      *a12 = v23;
      if (v23 == -1)
      {
        v21 = 0;
        v20 = a2;
        v22 = (float32x4_t)a2;
      }
      else
      {
        v22.i32[0] = v31;
        v20 = a2;
        *(uint64_t *)((char *)v22.i64 + 4) = *(uint64_t *)((char *)a2.n128_i64 + 4);
        v21 = 1;
      }
    }
    if (vabds_f32(v20.n128_f32[1], a4) <= 0.00001)
    {
      v25 = 0;
    }
    else
    {
      v28 = v22;
      v24 = _snapPositionToAlign(a1[72], a1[70], &v31, v20.n128_f32[1], a6);
      a12[1] = v24;
      if (v24 == -1)
      {
        v25 = 0;
        v22 = v28;
        v20 = a2;
      }
      else
      {
        v20 = a2;
        v22.i64[0] = __PAIR64__(v31, v28.u32[0]);
        v22.i64[1] = v28.i64[1];
        v25 = 1;
      }
    }
    if (vabds_f32(v20.n128_f32[2], a5) <= 0.00001)
    {
      v27 = 0;
    }
    else
    {
      v29 = v22;
      v26 = _snapPositionToAlign(a1[73], a1[70], &v31, v20.n128_f32[2], a6);
      a12[2] = v26;
      if (v26 == -1)
      {
        v27 = 0;
        v22 = v29;
        v20 = a2;
      }
      else
      {
        v20 = a2;
        v22.i64[0] = v29.i64[0];
        v22.i64[1] = __PAIR64__(v29.u32[3], v31);
        v27 = 1;
      }
    }
    *a11 = v21 | v25 | v27;
    if (v21 | v25 | v27)
    {
      if (a10)
        _adjustSnapForAxisMove(v21, v25, v27, a12, v22, v20, v32, v33);
    }
  }
}

- (BOOL)readonly
{
  return self->_readonly;
}

- (int64_t)xAlignment
{
  return self->_xAlignment;
}

- (void)setXAlignment:(int64_t)a3
{
  self->_xAlignment = a3;
}

- (int64_t)yAlignment
{
  return self->_yAlignment;
}

- (void)setYAlignment:(int64_t)a3
{
  self->_yAlignment = a3;
}

- (int64_t)zAlignment
{
  return self->_zAlignment;
}

- (void)setZAlignment:(int64_t)a3
{
  self->_zAlignment = a3;
}

- (void)_applyWithEvent:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Unreachable code: Unknown manipulator action", a5, a6, a7, a8, 0);
}

@end
