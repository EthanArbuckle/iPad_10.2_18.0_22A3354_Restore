@implementation SCNNode

- (__C3DScene)sceneRef
{
  return (__C3DScene *)C3DGetScene((_QWORD *)-[SCNNode __CFObject](self, "__CFObject"));
}

- (void)__CFObject
{
  return self->_node;
}

void __24__SCNNode__setPosition___block_invoke(__n128 *a1)
{
  C3DNodeSetPosition(*(_QWORD *)(a1[3].n128_u64[0] + 8), a1[2]);
}

float __22__SCNNode_setOpacity___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DNodeSetOpacity(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

void __21__SCNNode__setScale___block_invoke(__n128 *a1)
{
  C3DNodeSetScale(*(float32x4_t **)(a1[3].n128_u64[0] + 8), a1[2]);
}

void __26__SCNNode__setQuaternion___block_invoke(__n128 *a1)
{
  C3DNodeSetQuaternion(*(float32x4_t **)(a1[3].n128_u64[0] + 8), a1[2]);
}

- (SCNNode)childNodeWithName:(NSString *)name recursively:(BOOL)recursively
{
  _BOOL4 v4;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SCNNode *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  SCNNode *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v4 = recursively;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = -[SCNNode childNodes](self, "childNodes");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v9)
        objc_enumerationMutation(v6);
      v11 = *(SCNNode **)(*((_QWORD *)&v22 + 1) + 8 * v10);
      if (-[NSString isEqualToString:](-[SCNNode name](v11, "name"), "isEqualToString:", name))
        break;
      if (v8 == ++v10)
      {
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }
  if (!v11 && v4)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v6);
          v16 = (SCNNode *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "childNodeWithName:recursively:", name, 1);
          if (v16)
            return v16;
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        v11 = 0;
        if (v13)
          continue;
        break;
      }
    }
    else
    {
      return 0;
    }
  }
  return v11;
}

- (NSString)name
{
  NSString *Name;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 40) & 1) == 0)
    return self->_name;
  v4 = -[SCNNode sceneRef](self, "sceneRef");
  v5 = (uint64_t)v4;
  if (v4)
    C3DSceneLock((uint64_t)v4);
  Name = (NSString *)C3DEntityGetName((uint64_t)-[SCNNode __CFObject](self, "__CFObject"));
  if (v5)
    C3DSceneUnlock(v5);
  return Name;
}

- (NSArray)childNodes
{
  NSArray *v3;
  NSArray *v4;
  __C3DScene *v5;
  uint64_t v6;
  unsigned int ChildNodesCount;
  uint64_t v8;
  uint64_t v9;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v5 = -[SCNNode sceneRef](self, "sceneRef");
    v6 = (uint64_t)v5;
    if (v5)
      C3DSceneLock((uint64_t)v5);
    ChildNodesCount = C3DNodeGetChildNodesCount((uint64_t)self->_node);
    v8 = ChildNodesCount;
    v4 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", ChildNodesCount);
    if (ChildNodesCount)
    {
      v9 = 0;
      do
        -[NSArray addObject:](v4, "addObject:", +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", C3DNodeGetChildNodeAtIndex((uint64_t)self->_node, v9++)));
      while (v8 != v9);
    }
    if (v6)
      C3DSceneUnlock(v6);
  }
  else
  {
    v3 = (NSArray *)(id)-[NSMutableArray copy](self->_childNodes, "copy");
    if (-[NSArray count](v3, "count"))
      return v3;
    else
      return (NSArray *)MEMORY[0x1E0C9AA60];
  }
  return v4;
}

- (void)_syncObjCModel
{
  __C3DScene *v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  char v7;
  char v8;
  char v9;
  _OWORD v10[4];

  v3 = -[SCNNode sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  C3DNodeGetMatrix((uint64_t)self->_node, (uint64_t)v10);
  v5 = v10[1];
  *(_OWORD *)&self->_anon_30[2] = v10[0];
  *(_OWORD *)&self->_anon_30[18] = v5;
  v6 = v10[3];
  *(_OWORD *)&self->_anon_30[34] = v10[2];
  *(_OWORD *)&self->_anon_30[50] = v6;
  *((_BYTE *)self + 41) = *((_BYTE *)self + 41) & 0xFC | 2;
  self->_opacity = C3DNodeGetOpacity((uint64_t)self->_node);
  self->_renderingOrder = (int64_t)C3DNodeGetRenderingOrder((uint64_t)self->_node);
  if (C3DNodeIsHidden((uint64_t)self->_node))
    v7 = 0x80;
  else
    v7 = 0;
  *((_BYTE *)self + 41) = v7 & 0x80 | *((_BYTE *)self + 41) & 0x7F;
  *((_BYTE *)self + 42) = *((_BYTE *)self + 42) & 0xFE | C3DNodeGetCastsShadow((uint64_t)self->_node);
  self->_categoryBitMask = C3DNodeGetCategoryBitMask((uint64_t)self->_node);
  *((_BYTE *)self + 41) = ((C3DNodeGetMovability((uint64_t)self->_node) & 1) << 6) | *((_BYTE *)self + 41) & 0xBF;
  if (C3DNodeIsJoint((uint64_t)self->_node))
    v8 = 8;
  else
    v8 = 0;
  *((_BYTE *)self + 41) = *((_BYTE *)self + 41) & 0xF7 | v8;
  if (C3DNodeGetHasPivot((uint64_t)self->_node))
    v9 = 4;
  else
    v9 = 0;
  *((_BYTE *)self + 41) = *((_BYTE *)self + 41) & 0xFB | v9;
  -[SCNNode _syncEntityObjCModel](self, "_syncEntityObjCModel");
  if (v4)
    C3DSceneUnlock(v4);
}

- (void)_syncEntityObjCModel
{
  void *v3;

  v3 = -[SCNNode __CFObject](self, "__CFObject");

  self->_name = (NSString *)(id)C3DEntityGetName((uint64_t)v3);
}

+ (SCNNode)nodeWithMDLObject:(id)a3 options:(id)a4
{
  SCNNode *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  SCNLight *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  SCNNode *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  void *v36;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _OWORD v51[4];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = (SCNNode *)objc_msgSend(a1, "node");
  -[SCNNode setName:](v6, "setName:", objc_msgSend(a3, "name"));
  if (objc_msgSend(a3, "transform"))
  {
    objc_msgSend((id)objc_msgSend(a3, "transform"), "matrix");
    v51[0] = v7;
    v51[1] = v8;
    v51[2] = v9;
    v51[3] = v10;
    -[SCNNode setTransform:](v6, "setTransform:", v51);
    objc_msgSend(a3, "transform");
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v12 = (void *)objc_msgSend(a3, "transform");
    if ((isKindOfClass & 1) != 0)
    {
LABEL_5:
      v13 = (void *)objc_msgSend(v12, "transformAnimation");
      if (v13)
      {
        v14 = v13;
        objc_msgSend(v13, "duration");
        if (v15 != 0.0)
          -[SCNNode addAnimation:forKey:](v6, "addAnimation:forKey:", v14, CFSTR("transform"));
      }
      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(a3, "transform");
      goto LABEL_5;
    }
  }
LABEL_8:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v16 = (void *)objc_msgSend(a3, "submeshes");
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v48;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v48 != v20)
            objc_enumerationMutation(v16);
          v22 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          if (objc_msgSend(v22, "faceIndexing") && objc_msgSend(v22, "geometryType") != 5)
            return 0;
          if (objc_msgSend(v22, "faceIndexing"))
            ++v19;
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
        if (v18)
          continue;
        break;
      }
      if (v19 >= 2)
      {
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        obj = (id)objc_msgSend(a3, "submeshes");
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v44;
          do
          {
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v44 != v33)
                objc_enumerationMutation(obj);
              v35 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
              v36 = (void *)objc_msgSend(a1, "node");
              objc_msgSend(v36, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%d"), objc_msgSend(a3, "name"), 0));
              objc_msgSend(v36, "setGeometry:", +[SCNGeometry geometryWithMDLMesh:submesh:options:](SCNGeometry, "geometryWithMDLMesh:submesh:options:", a3, v35, a4));
              -[SCNNode addChildNode:](v6, "addChildNode:", v36);
            }
            v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
          }
          while (v32);
        }
        goto LABEL_29;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SCNNode setGeometry:](v6, "setGeometry:", +[SCNGeometry geometryWithMDLMesh:options:](SCNGeometry, "geometryWithMDLMesh:options:", a3, a4));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = +[SCNLight lightWithMDLLight:](SCNLight, "lightWithMDLLight:", a3);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[SCNNode setCamera:](v6, "setCamera:", +[SCNCamera cameraWithMDLCamera:](SCNCamera, "cameraWithMDLCamera:", a3));
        goto LABEL_29;
      }
      v23 = +[SCNLight lightWithMDLLightProbe:](SCNLight, "lightWithMDLLightProbe:", a3);
    }
    -[SCNNode setLight:](v6, "setLight:", v23);
  }
LABEL_29:
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v24 = (void *)objc_msgSend(a3, "children");
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v40;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(v24);
        v29 = +[SCNNode nodeWithMDLObject:options:](SCNNode, "nodeWithMDLObject:options:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k), a4);
        if (v29)
          -[SCNNode addChildNode:](v6, "addChildNode:", v29);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    }
    while (v26);
  }
  return v6;
}

- (void)setName:(NSString *)name
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNNode setName:].cold.1();
  }
  else if ((unint64_t)name | (unint64_t)self->_name)
  {
    if ((-[NSString isEqual:](name, "isEqual:") & 1) == 0)
    {

      self->_name = (NSString *)-[NSString copy](name, "copy");
      v5 = -[SCNNode sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __19__SCNNode_setName___block_invoke;
      v7[3] = &unk_1EA59F740;
      v7[4] = self;
      v7[5] = name;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
    }
  }
}

CFStringRef __19__SCNNode_setName___block_invoke(uint64_t a1)
{
  return C3DEntitySetName(objc_msgSend(*(id *)(a1 + 32), "__CFObject"), *(CFStringRef *)(a1 + 40));
}

- (void)addChildNode:(SCNNode *)child
{
  objc_sync_enter(self);
  -[SCNNode insertObject:inChildNodesAtIndex:](self, "insertObject:inChildNodesAtIndex:", child, -[SCNNode countOfChildNodes](self, "countOfChildNodes"));
  objc_sync_exit(self);
}

- (unint64_t)countOfChildNodes
{
  return -[NSMutableArray count](self->_childNodes, "count");
}

- (void)__insertObject:(id)a3 inChildNodesAtIndex:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  __C3DScene *v10;
  _QWORD v11[8];

  if (a3)
  {
    objc_sync_enter(self);
    if (!self->_childNodes)
      self->_childNodes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (-[SCNNode canAddChildNode:](self, "canAddChildNode:", a3))
    {
      if ((SCNNode *)objc_msgSend(a3, "parentNode") != self)
      {
        v7 = a3;
        objc_msgSend(a3, "removeFromParentNode");
        objc_msgSend(a3, "_setParent:", self);
        -[NSMutableArray insertObject:atIndex:](self->_childNodes, "insertObject:atIndex:", a3, a4);
        if ((*((_BYTE *)a3 + 42) & 0x20) != 0)
          -[SCNNode _setHasFocusableChild](self, "_setHasFocusableChild");
        if (a4)
          v8 = -[NSMutableArray objectAtIndex:](self->_childNodes, "objectAtIndex:", a4 - 1);
        else
          v8 = 0;
        v10 = -[SCNNode sceneRef](self, "sceneRef");
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __46__SCNNode___insertObject_inChildNodesAtIndex___block_invoke;
        v11[3] = &unk_1EA5A1700;
        v11[4] = v8;
        v11[5] = self;
        v11[6] = a3;
        v11[7] = a4;
        +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v10, self, v11);
        if (*((char *)self + 40) < 0)
          objc_msgSend(a3, "_setPausedOrPausedByInheritance:", 1);

      }
    }
    else
    {
      v9 = scn_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SCNNode __insertObject:inChildNodesAtIndex:].cold.1();
    }
    objc_sync_exit(self);
  }
}

- (void)removeFromParentNode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: error in removeFromParentNode : inconsistent tree", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (id)scene
{
  id result;

  result = -[SCNNode sceneRef](self, "sceneRef");
  if (result)
    return C3DEntityGetObjCWrapper((id *)result);
  return result;
}

- (BOOL)canAddChildNode:(id)a3
{
  BOOL i;

  for (i = self == 0; self; i = self == 0)
  {
    if (self == a3)
      break;
    self = -[SCNNode parentNode](self, "parentNode");
  }
  return i;
}

- (SCNNode)parentNode
{
  SCNNode *v3;
  __C3DScene *v4;
  uint64_t v5;
  uint64_t Parent;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v4 = -[SCNNode sceneRef](self, "sceneRef");
    v5 = (uint64_t)v4;
    if (v4)
      C3DSceneLock((uint64_t)v4);
    Parent = C3DNodeGetParent((uint64_t)self->_node);
    if (Parent)
    {
      v3 = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", Parent);
      if (!v5)
        return v3;
    }
    else
    {
      v3 = 0;
      if (!v5)
        return v3;
    }
    C3DSceneUnlock(v5);
    return v3;
  }
  return self->_parent;
}

- (void)_setParent:(id)a3
{
  self->_parent = (SCNNode *)a3;
}

- (void)setSimdTransform:(simd_float4x4)simdTransform
{
  int32x4_t v4;
  float32x4_t v5;
  BOOL v6;
  float v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  float32x4_t v16;
  uint32x4_t v17;
  float32x4_t *v18;
  float32x4_t v19;
  float32x4_t v20;
  int32x4_t v21;
  float v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  NSObject *v26;
  float32_t v28;
  float32x4_t v29;
  int32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32_t v33;
  float32x4_t v34;
  int8x16_t v35;
  float32x4_t v36;
  float32x4_t v37;
  int32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float v45;
  float32x2_t v46;
  float32x2_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  __C3DScene *v51;
  int8x16_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  _QWORD v57[4];
  simd_float4x4 v58;
  SCNNode *v59;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v26 = scn_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[SCNNode(SIMD) setSimdTransform:].cold.1();
  }
  else if ((*((_BYTE *)self + 41) & 2) == 0
         || (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32((float32x4_t)simdTransform.columns[1], *(float32x4_t *)&self->_anon_30[18]), (int8x16_t)vceqq_f32((float32x4_t)simdTransform.columns[0], *(float32x4_t *)&self->_anon_30[2])), vandq_s8((int8x16_t)vceqq_f32((float32x4_t)simdTransform.columns[2], *(float32x4_t *)&self->_anon_30[34]), (int8x16_t)vceqq_f32((float32x4_t)simdTransform.columns[3], *(float32x4_t *)&self->_anon_30[50])))) & 0x80000000) == 0)
  {
    -[SCNNode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("transform"));
    v4 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)simdTransform.columns[2], (int32x4_t)simdTransform.columns[2]), (int8x16_t)simdTransform.columns[2], 0xCuLL), vnegq_f32((float32x4_t)simdTransform.columns[1])), (float32x4_t)simdTransform.columns[2], (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)simdTransform.columns[1], (int32x4_t)simdTransform.columns[1]), (int8x16_t)simdTransform.columns[1], 0xCuLL));
    v5 = vmulq_f32((float32x4_t)simdTransform.columns[0], (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v4, v4), (int8x16_t)v4, 0xCuLL));
    v6 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 2), vaddq_f32(v5, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 1))).f32[0] < 0.0;
    v7 = 1.0;
    v8 = vmulq_f32((float32x4_t)simdTransform.columns[0], (float32x4_t)simdTransform.columns[0]);
    v9 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 1);
    if (v6)
      v7 = -1.0;
    v10 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 2), vaddq_f32(v8, v9));
    v10.f32[0] = sqrtf(v10.f32[0]);
    v11 = vmulq_f32((float32x4_t)simdTransform.columns[1], (float32x4_t)simdTransform.columns[1]);
    v12 = vmulq_f32((float32x4_t)simdTransform.columns[2], (float32x4_t)simdTransform.columns[2]);
    v10.i32[1] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2), vaddq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 1))).f32[0]);
    v10.i32[2] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2), vaddq_f32(v12, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 1))).f32[0]);
    v13 = vmulq_n_f32(v10, v7);
    v14 = vcltzq_f32(v13);
    v15 = (int32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)v14, (int8x16_t)vcgezq_f32(v13)));
    v15.i32[3] = v15.i32[2];
    v15.i32[0] = vmaxvq_u32((uint32x4_t)v15);
    v14.i32[0] = -1;
    v16 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v15, v14), 0), (int8x16_t)v13, (int8x16_t)0);
    v17 = (uint32x4_t)vceqzq_f32(v16);
    v17.i32[3] = v17.i32[2];
    v18 = (float32x4_t *)MEMORY[0x1E0C83FF0];
    if ((vmaxvq_u32(v17) & 0x80000000) != 0)
    {
      v52 = *(int8x16_t *)(MEMORY[0x1E0C83FF0] + 48);
      v54 = (float32x4_t)v52;
      v16 = 0uLL;
    }
    else
    {
      v19 = vdivq_f32((float32x4_t)simdTransform.columns[0], (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 0));
      v20 = vdivq_f32((float32x4_t)simdTransform.columns[1], (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 1));
      v21 = (int32x4_t)vdivq_f32((float32x4_t)simdTransform.columns[2], (float32x4_t)vdupq_laneq_s32((int32x4_t)v16, 2));
      v22 = *(float *)&v21.i32[2] + (float)(v19.f32[0] + v20.f32[1]);
      if (v22 <= 0.0)
      {
        if (v19.f32[0] <= v20.f32[1] || v19.f32[0] <= *(float *)&v21.i32[2])
        {
          if (v20.f32[1] <= *(float *)&v21.i32[2])
          {
            v33 = (float)(*(float *)&v21.i32[2] + 1.0) - v19.f32[0];
            v34 = (float32x4_t)vzip2q_s32((int32x4_t)v19, vzip1q_s32(v21, (int32x4_t)v19));
            v35 = (int8x16_t)vrev64q_s32((int32x4_t)v20);
            v36 = (float32x4_t)vextq_s8(v35, v35, 8uLL);
            v36.i32[0] = v21.i32[0];
            v25.i64[0] = vaddq_f32(v34, v36).u64[0];
            v34.f32[2] = v33;
            v19 = vsubq_f32(v34, v36);
            v25.i64[1] = v19.i64[1];
            v21.i32[0] = v19.i32[2];
          }
          else
          {
            v28 = (float)(v20.f32[1] + 1.0) - v19.f32[0];
            v29 = v20;
            v29.i32[0] = v19.i32[1];
            v20.i32[1] = v21.i32[2];
            v20.i32[2] = v21.i32[1];
            v30 = (int32x4_t)vaddq_f32(v29, v20);
            v29.f32[1] = v28;
            v29.i32[3] = v21.i32[0];
            v20.i32[3] = v19.i32[2];
            v19 = vsubq_f32(v29, v20);
            v25 = (float32x4_t)vtrn2q_s32(vrev64q_s32(v30), (int32x4_t)v19);
            v21.i32[0] = v19.i32[1];
          }
        }
        else
        {
          v31 = v19;
          v31.f32[0] = (float)(v19.f32[0] + 1.0) - v20.f32[1];
          v31.i32[3] = v20.i32[2];
          v32 = (float32x4_t)vextq_s8((int8x16_t)v21, (int8x16_t)v21, 8uLL);
          v21 = (int32x4_t)vsubq_f32(v31, v32);
          v32.i32[1] = v20.i32[0];
          v25 = vaddq_f32(v19, v32);
          v25.i32[0] = v21.i32[0];
          v25.i32[3] = v21.i32[3];
        }
      }
      else
      {
        v23 = (float32x4_t)vzip2q_s32((int32x4_t)v20, vuzp1q_s32((int32x4_t)v20, v21));
        v23.i32[2] = v19.i32[1];
        v24 = (float32x4_t)vtrn2q_s32(v21, vzip2q_s32(v21, (int32x4_t)v19));
        v24.i32[2] = v20.i32[0];
        v25 = vsubq_f32(v23, v24);
        v24.i32[3] = 1.0;
        v23.f32[3] = v22;
        v19 = vaddq_f32(v23, v24);
        v25.i32[3] = v19.i32[3];
        v21.i32[0] = v19.i32[3];
      }
      v19.i32[0] = 0;
      v37 = vmulq_n_f32(v25, 0.5 / sqrtf(*(float *)v21.i32));
      v38 = (int32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v37), (int8x16_t)vcgezq_f32(v37)));
      v38.i32[0] = vmaxvq_u32((uint32x4_t)v38);
      v52 = *(int8x16_t *)(MEMORY[0x1E0C83FF0] + 48);
      v54 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32((int32x4_t)v19, v38), 0), v52, (int8x16_t)v37);
    }
    v55 = v16;
    -[SCNNode _setPosition:](self, "_setPosition:", *(double *)simdTransform.columns[3].i64, *(_OWORD *)&v52);
    -[SCNNode _setQuaternion:](self, "_setQuaternion:", *(double *)v54.i64);
    -[SCNNode _setScale:](self, "_setScale:", *(double *)v55.i64);
    *(simd_float4x4 *)&self->_anon_30[2] = simdTransform;
    v39 = *v18;
    v40 = v18[1];
    v41 = v54;
    v42 = vmulq_f32(v41, v41);
    v43 = vaddq_f32(v42, v42);
    v44 = vmulq_laneq_f32(v41, v41, 3);
    v45 = vmulq_lane_f32(v41, *(float32x2_t *)v41.f32, 1).f32[0];
    v39.f32[0] = (float)(1.0 - v43.f32[1]) - v43.f32[2];
    v39.f32[1] = (float)(v45 + v44.f32[2]) + (float)(v45 + v44.f32[2]);
    v40.f32[0] = (float)(v45 - v44.f32[2]) + (float)(v45 - v44.f32[2]);
    v43.f32[0] = 1.0 - v43.f32[0];
    v40.f32[1] = v43.f32[0] - v43.f32[2];
    v46 = vmul_laneq_f32(*(float32x2_t *)v54.f32, v54, 2);
    v39.f32[2] = (float)(v46.f32[0] - v44.f32[1]) + (float)(v46.f32[0] - v44.f32[1]);
    v40.f32[2] = (float)(v46.f32[1] + v44.f32[0]) + (float)(v46.f32[1] + v44.f32[0]);
    *(int32x2_t *)v44.f32 = vrev64_s32(*(int32x2_t *)v44.f32);
    v47.i32[0] = vadd_f32(v46, *(float32x2_t *)v44.f32).u32[0];
    v47.i32[1] = vsub_f32(v46, *(float32x2_t *)&v44).i32[1];
    *((_BYTE *)self + 41) |= 2u;
    *(float32x2_t *)v44.f32 = vadd_f32(v47, v47);
    v44.i32[3] = HIDWORD(v18[2].i64[1]);
    v44.f32[2] = v43.f32[0] - v43.f32[1];
    v48 = vmulq_laneq_f32(v44, v55, 2);
    v49 = vaddq_f32((float32x4_t)simdTransform.columns[3], v53);
    v49.i32[3] = v53.i32[3];
    v50 = (float32x4_t)vdupq_n_s32(0x358637BDu);
    if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v50, vabdq_f32((float32x4_t)simdTransform.columns[1], vmulq_lane_f32(v40, *(float32x2_t *)v55.f32, 1))), (int8x16_t)vcgeq_f32(v50, vabdq_f32((float32x4_t)simdTransform.columns[3], v49))), (int8x16_t)vcgeq_f32(v50, vabdq_f32((float32x4_t)simdTransform.columns[2], v48))), (int8x16_t)vcgeq_f32(v50, vabdq_f32((float32x4_t)simdTransform.columns[0], vmulq_n_f32(v39, v55.f32[0]))))) & 0x80000000) == 0)
    {
      v51 = -[SCNNode sceneRef](self, "sceneRef");
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __34__SCNNode_SIMD__setSimdTransform___block_invoke;
      v57[3] = &unk_1EA5A23D0;
      v58 = simdTransform;
      v59 = self;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v51, self, CFSTR("scale"), v57);
    }
    if ((*((_WORD *)self + 22) & 0x100) != 0)
      objc_msgSend(-[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 8), "resetTransform");
    -[SCNNode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("transform"));
  }
}

+ (SCNNode)node
{
  return (SCNNode *)objc_alloc_init((Class)a1);
}

- (SCNNode)init
{
  SCNNode *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNNode;
  v2 = -[SCNNode init](&v5, sel_init);
  if (v2)
  {
    v3 = C3DNodeCreate();
    v2->_node = (__C3DNode *)v3;
    if (v3)
      C3DEntitySetObjCWrapper(v3, v2);
    *((_BYTE *)v2 + 40) |= 0x3Eu;
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    v2->_valueForKeyLock._os_unfair_lock_opaque = 0;
    -[SCNNode _syncObjCModel](v2, "_syncObjCModel");
  }
  return v2;
}

- (void)setTransform:(SCNMatrix4 *)transform
{
  -[SCNNode setSimdTransform:](self, "setSimdTransform:", *(double *)&transform->m11, *(double *)&transform->m21, *(double *)&transform->m31, *(double *)&transform->m41);
}

void __23__SCNNode_setGeometry___block_invoke(uint64_t a1)
{
  C3DNodeSetGeometry(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (__C3DGeometry *)objc_msgSend(*(id *)(a1 + 40), "geometryRef"));
}

- (void)_setPosition:(SCNNode *)self
{
  float32x4_t v2;
  uint32x4_t v4;
  __C3DScene *v5;
  NSObject *v6;
  float32x4_t v7;
  _QWORD v8[4];
  float32x4_t v9;
  SCNNode *v10;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNNode _setPosition:].cold.1();
  }
  else
  {
    v7 = v2;
    if ((*((_BYTE *)self + 41) & 1) == 0)
    {
      -[SCNNode _updateAffine](self, "_updateAffine");
      v2 = v7;
    }
    v4 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_position[2], v2);
    v4.i32[3] = v4.i32[2];
    if ((vminvq_u32(v4) & 0x80000000) == 0)
    {
      -[SCNNode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("position"));
      *((_BYTE *)self + 41) &= ~2u;
      *(float32x4_t *)&self->_position[2] = v7;
      v5 = -[SCNNode sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __24__SCNNode__setPosition___block_invoke;
      v8[3] = &unk_1EA5A1FD8;
      v10 = self;
      v9 = v7;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("translation"), v8);
      -[SCNNode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("position"));
    }
  }
}

- (void)_updateAffine
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. cannot update affine without matrix", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_setScale:(SCNNode *)self
{
  float32x4_t v2;
  uint32x4_t v4;
  __C3DScene *v5;
  NSObject *v6;
  float32x4_t v7;
  _QWORD v8[4];
  float32x4_t v9;
  SCNNode *v10;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNNode _setScale:].cold.1();
  }
  else
  {
    v7 = v2;
    if ((*((_BYTE *)self + 41) & 1) == 0)
    {
      -[SCNNode _updateAffine](self, "_updateAffine");
      v2 = v7;
    }
    v4 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_scale[2], v2);
    v4.i32[3] = v4.i32[2];
    if ((vminvq_u32(v4) & 0x80000000) == 0)
    {
      -[SCNNode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("scale"));
      *((_BYTE *)self + 41) &= ~2u;
      *(float32x4_t *)&self->_scale[2] = v7;
      v5 = -[SCNNode sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __21__SCNNode__setScale___block_invoke;
      v8[3] = &unk_1EA5A1FD8;
      v10 = self;
      v9 = v7;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("scale"), v8);
      -[SCNNode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("scale"));
    }
  }
}

- (void)_setQuaternion:(float32x4_t *)a1
{
  float32x4_t v3;
  __int8 v4;
  uint64_t v5;
  NSObject *v6;
  float32x4_t v8;
  _QWORD v9[4];
  float32x4_t v10;
  float32x4_t *v11;

  if ((a1[2].i8[8] & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNNode _setQuaternion:].cold.1();
  }
  else
  {
    if ((a1[2].i8[9] & 1) == 0)
      -[float32x4_t _updateAffine](a1, "_updateAffine");
    -[float32x4_t _quaternion](a1, "_quaternion", *(_OWORD *)&a2);
    if ((vminvq_u32((uint32x4_t)vceqq_f32(v8, v3)) & 0x80000000) == 0)
    {
      -[float32x4_t willChangeValueForKey:](a1, "willChangeValueForKey:", CFSTR("orientation"));
      v4 = a1[2].i8[9];
      a1[8] = v8;
      a1[2].i8[9] = v4 & 0xCD | 0x20;
      v5 = -[float32x4_t sceneRef](a1, "sceneRef");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __26__SCNNode__setQuaternion___block_invoke;
      v9[3] = &unk_1EA5A1FD8;
      v10 = v8;
      v11 = a1;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, a1, CFSTR("orientation"), v9);
      -[float32x4_t didChangeValueForKey:](a1, "didChangeValueForKey:", CFSTR("orientation"));
    }
  }
}

- (void)_quaternion
{
  unsigned int v2;
  int v3;
  float v4;
  float v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;

  v2 = *(unsigned __int8 *)(a1 + 41);
  if ((v2 & 1) == 0)
  {
    objc_msgSend((id)a1, "_updateAffine");
    v2 = *(unsigned __int8 *)(a1 + 41);
  }
  v3 = (v2 >> 4) & 3;
  if (v3)
  {
    if (v3 == 1)
    {
      objc_msgSend((id)a1, "simdRotation");
      v7 = v6;
      v8 = vmulq_f32(v6, v6);
      if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 2), vaddq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 1))).f32[0] > 0.000000001)__sincosf_stret(vmuls_lane_f32(0.5, v7, 3));
    }
  }
  else
  {
    v4 = *(float *)(a1 + 132);
    v5 = *(float *)(a1 + 136);
    __sincosf_stret(*(float *)(a1 + 128) * 0.5);
    __sincosf_stret(v4 * 0.5);
    __sincosf_stret(v5 * 0.5);
  }
}

- (BOOL)_childNodesPassingTest:(id)a3 recursively:(BOOL)a4 output:(id)a5
{
  _BOOL4 v6;
  BOOL v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  _BYTE v22[128];
  uint64_t v23;

  v6 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  if ((*((unsigned int (**)(id, SCNNode *, char *))a3 + 2))(a3, self, &v21))
    objc_msgSend(a5, "addObject:", self);
  if (v21)
    v9 = 1;
  else
    v9 = !v6;
  if (v9)
    return v21 != 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = -[SCNNode childNodes](self, "childNodes", 0);
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (!v11)
    return v21 != 0;
  v12 = v11;
  v13 = *(_QWORD *)v18;
  v14 = 1;
LABEL_9:
  v15 = 0;
  while (1)
  {
    if (*(_QWORD *)v18 != v13)
      objc_enumerationMutation(v10);
    v21 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15), "_childNodesPassingTest:recursively:output:", a3, 1, a5);
    if ((v21 & 1) != 0)
      return v14;
    if (v12 == ++v15)
    {
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v12)
        goto LABEL_9;
      return v21 != 0;
    }
  }
}

- (simd_float4x4)simdWorldTransform
{
  simd_float4 v3;
  simd_float4 v4;
  simd_float4 v5;
  simd_float4 v6;
  unint64_t v7;
  SCNNode *v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  unint64_t v13;
  __C3DScene *v14;
  uint64_t v15;
  simd_float4 v16;
  simd_float4 v17;
  simd_float4 v18;
  simd_float4 v19;
  simd_float4 v20;
  simd_float4 v21;
  simd_float4 v22;
  simd_float4 v23;
  simd_float4 v24;
  simd_float4 v25;
  simd_float4 v26;
  simd_float4 v27;
  simd_float4 v28;
  simd_float4 v29;
  simd_float4 v30;
  simd_float4 v31;
  simd_float4 v32;
  simd_float4 v33;
  simd_float4 v34;
  simd_float4 v35;
  simd_float4x4 v36;
  simd_float4x4 v37;
  simd_float4x4 result;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v14 = -[SCNNode sceneRef](self, "sceneRef");
    if (v14)
    {
      v15 = (uint64_t)v14;
      C3DSceneLock((uint64_t)v14);
      C3DNodeComputeWorldMatrix((float32x4_t *)self->_node, (uint64_t)&v32);
      C3DSceneUnlock(v15);
    }
    else
    {
      C3DNodeComputeWorldMatrix((float32x4_t *)self->_node, (uint64_t)&v32);
    }
    goto LABEL_14;
  }
  -[SCNNode simdTransform](self, "simdTransform");
  v24 = v4;
  v26 = v3;
  v20 = v6;
  v22 = v5;
  if ((*((_BYTE *)self + 41) & 4) != 0)
  {
    -[SCNNode simdPivot](self, "simdPivot");
    v37 = __invert_f4(v36);
    v7 = 0;
    v28 = v26;
    v29 = v24;
    v30 = v22;
    v31 = v20;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v32 + v7) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v37.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v28 + v7))), (float32x4_t)v37.columns[1], *(float32x2_t *)&v28.f32[v7 / 4], 1), (float32x4_t)v37.columns[2], *(float32x4_t *)((char *)&v28 + v7), 2), (float32x4_t)v37.columns[3], *(float32x4_t *)((char *)&v28 + v7), 3);
      v7 += 16;
    }
    while (v7 != 64);
    v24 = v33;
    v26 = v32;
    v20 = v35;
    v22 = v34;
  }
  v8 = -[SCNNode parentNode](self, "parentNode", *(_OWORD *)&v20, *(_OWORD *)&v22, *(_OWORD *)&v24, *(_OWORD *)&v26, *(_OWORD *)&v28, *(_OWORD *)&v29, *(_OWORD *)&v30, *(_OWORD *)&v31);
  if (v8)
  {
    -[SCNNode simdWorldTransform](v8, "simdWorldTransform");
    v13 = 0;
    v28 = v27;
    v29 = v25;
    v30 = v23;
    v31 = v21;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v32 + v13) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v9, COERCE_FLOAT(*(_OWORD *)((char *)&v28 + v13))), v10, *(float32x2_t *)&v28.f32[v13 / 4], 1), v11, *(float32x4_t *)((char *)&v28 + v13), 2), v12, *(float32x4_t *)((char *)&v28 + v13), 3);
      v13 += 16;
    }
    while (v13 != 64);
LABEL_14:
    v16 = v32;
    v17 = v33;
    v18 = v34;
    v19 = v35;
    goto LABEL_15;
  }
  v17 = v25;
  v16 = v27;
  v19 = v21;
  v18 = v23;
LABEL_15:
  result.columns[3] = v19;
  result.columns[2] = v18;
  result.columns[1] = v17;
  result.columns[0] = v16;
  return result;
}

- (SCNNode)clone
{
  id v3;

  v3 = -[SCNNode _copyRecursively](self, "_copyRecursively");
  _transposeSkinnerToClone(v3, self, v3);
  _copyAnimations(self, v3);
  return (SCNNode *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  char v5;
  int v6;
  _BOOL4 v7;
  SCNLight *v8;
  id v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSMutableDictionary *valueForKey;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init((Class)objc_opt_class());
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  objc_msgSend(v4, "setName:", -[SCNNode name](self, "name"));
  objc_msgSend(v4, "setIdentifier:", -[SCNNode identifier](self, "identifier"));
  v5 = *((_BYTE *)self + 41);
  -[SCNNode simdTransform](self, "simdTransform");
  objc_msgSend(v4, "setSimdTransform:");
  if ((v5 & 1) != 0)
  {
    -[SCNNode simdScale](self, "simdScale");
    objc_msgSend(v4, "setSimdScale:");
    v6 = (*((unsigned __int8 *)self + 41) >> 4) & 3;
    switch(v6)
    {
      case 2:
        -[SCNNode simdOrientation](self, "simdOrientation");
        objc_msgSend(v4, "setSimdOrientation:");
        break;
      case 1:
        -[SCNNode simdRotation](self, "simdRotation");
        objc_msgSend(v4, "setSimdRotation:");
        break;
      case 0:
        -[SCNNode simdEulerAngles](self, "simdEulerAngles");
        objc_msgSend(v4, "setSimdEulerAngles:");
        break;
    }
  }
  if ((*((_BYTE *)self + 41) & 4) != 0)
  {
    -[SCNNode simdPivot](self, "simdPivot");
    objc_msgSend(v4, "setSimdPivot:");
  }
  objc_msgSend(v4, "setHidden:", -[SCNNode isHidden](self, "isHidden"));
  -[SCNNode opacity](self, "opacity");
  objc_msgSend(v4, "setOpacity:");
  objc_msgSend(v4, "setRenderingOrder:", -[SCNNode renderingOrder](self, "renderingOrder"));
  objc_msgSend(v4, "setCategoryBitMask:", -[SCNNode categoryBitMask](self, "categoryBitMask"));
  objc_msgSend(v4, "setMovabilityHint:", -[SCNNode movabilityHint](self, "movabilityHint"));
  v7 = -[NSString isEqualToString:](-[SCNLight type](-[SCNNode light](self, "light"), "type"), "isEqualToString:", CFSTR("probe"));
  v8 = -[SCNNode light](self, "light");
  if (v7)
  {
    v9 = -[SCNLight copy](v8, "copy");
    objc_msgSend(v4, "setLight:", v9);

  }
  else
  {
    objc_msgSend(v4, "setLight:", v8);
  }
  objc_msgSend(v4, "setCamera:", -[SCNNode camera](self, "camera"));
  objc_msgSend(v4, "setRendererDelegate:", -[SCNNode rendererDelegate](self, "rendererDelegate"));
  objc_msgSend(v4, "setPhysicsField:", -[SCNPhysicsField copy](-[SCNNode physicsField](self, "physicsField"), "copy"));
  objc_msgSend(v4, "setCastsShadow:", -[SCNNode castsShadow](self, "castsShadow"));
  objc_msgSend(v4, "setUsesDepthPrePass:", -[SCNNode usesDepthPrePass](self, "usesDepthPrePass"));
  objc_msgSend(v4, "setConstraints:", -[SCNNode constraints](self, "constraints"));
  objc_msgSend(v4, "setPostMorphingDeformers:", -[SCNNode postMorphingDeformers](self, "postMorphingDeformers"));
  objc_msgSend(v4, "setPostSkinningDeformers:", -[SCNNode postSkinningDeformers](self, "postSkinningDeformers"));
  objc_msgSend(v4, "setAuthoringEnvironmentNode:", -[SCNNode authoringEnvironmentNode](self, "authoringEnvironmentNode"));
  objc_msgSend(v4, "setFocusBehavior:", -[SCNNode focusBehavior](self, "focusBehavior"));
  if (-[SCNNode authoringEnvironmentNode](self, "authoringEnvironmentNode")
    && -[SCNNode authoringEnvironmentCompanionNode](self, "authoringEnvironmentCompanionNode"))
  {
    objc_msgSend(v4, "setAuthoringEnvironmentCompanionNode:", -[SCNNode authoringEnvironmentCompanionNode](self, "authoringEnvironmentCompanionNode"));
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = -[SCNNode particleSystems](self, "particleSystems");
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v4, "addParticleSystem:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v12);
  }
  objc_msgSend(v4, "setGizmo:", -[SCNNode isGizmo](self, "isGizmo"));
  os_unfair_lock_lock(&self->_valueForKeyLock);
  valueForKey = self->_valueForKey;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __24__SCNNode_copyWithZone___block_invoke;
  v26[3] = &unk_1EA59F6F0;
  v26[4] = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](valueForKey, "enumerateKeysAndObjectsUsingBlock:", v26);
  os_unfair_lock_unlock(&self->_valueForKeyLock);
  if ((*((_BYTE *)self + 42) & 4) == 0)
  {
    objc_msgSend(v4, "_copyAnimationsFrom:", self);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v16 = -[SCNNode actionKeys](self, "actionKeys", 0);
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(v4, "runAction:forKey:", -[SCNNode actionForKey:](self, "actionForKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j)), *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j));
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      }
      while (v18);
    }
  }
  +[SCNTransaction commitImmediate](SCNTransaction, "commitImmediate");
  objc_msgSend(v4, "setGeometry:", -[SCNNode geometry](self, "geometry"));
  objc_msgSend(v4, "setMorpher:", -[SCNMorpher copy](-[SCNNode morpher](self, "morpher"), "copy"));
  objc_msgSend(v4, "setSkinner:", -[SCNSkinner copy](-[SCNNode skinner](self, "skinner"), "copy"));
  objc_msgSend(v4, "setPhysicsBody:", -[SCNPhysicsBody copy](-[SCNNode physicsBody](self, "physicsBody"), "copy"));
  return v4;
}

- (void)setGeometry:(SCNGeometry *)geometry
{
  SCNSkinner *v5;
  __C3DScene *v6;
  SCNPhysicsBody *v7;
  SCNPhysicsBody *v8;
  _QWORD v9[6];

  if (-[SCNNode geometry](self, "geometry") != geometry)
  {
    -[SCNNode _setComponent:withType:](self, "_setComponent:withType:", geometry, 2);
    v5 = -[SCNNode skinner](self, "skinner");
    if (v5)
      -[SCNSkinner _setBaseGeometry:](v5, "_setBaseGeometry:", geometry);
    v6 = -[SCNNode sceneRef](self, "sceneRef");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __23__SCNNode_setGeometry___block_invoke;
    v9[3] = &unk_1EA59F740;
    v9[4] = self;
    v9[5] = geometry;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v9);
    v7 = -[SCNNode physicsBody](self, "physicsBody");
    if (v7)
    {
      v8 = v7;
      if (!-[SCNPhysicsBody physicsShape](v7, "physicsShape"))
        -[SCNPhysicsBody setPhysicsShape:](v8, "setPhysicsShape:", +[SCNPhysicsShape shapeWithGeometry:options:](SCNPhysicsShape, "shapeWithGeometry:options:", geometry, 0));
    }
  }
}

- (id)__geometry
{
  SCNGeometry *v3;
  SCNGeometry *v4;
  __C3DScene *v5;
  uint64_t v6;
  uint64_t Geometry;

  v3 = -[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 2);
  v4 = v3;
  if ((*((_BYTE *)self + 40) & 4) != 0 || v3)
    goto LABEL_8;
  *((_BYTE *)self + 40) |= 4u;
  v5 = -[SCNNode sceneRef](self, "sceneRef");
  v6 = (uint64_t)v5;
  if (v5)
    C3DSceneLock((uint64_t)v5);
  Geometry = C3DNodeGetGeometry((uint64_t)self->_node);
  if (Geometry)
  {
    v4 = +[SCNGeometry geometryWithGeometryRef:](SCNGeometry, "geometryWithGeometryRef:", Geometry);
    -[SCNNode _setComponent:withType:](self, "_setComponent:withType:", v4, 2);
    if (!v6)
      goto LABEL_8;
    goto LABEL_7;
  }
  v4 = 0;
  if (v6)
LABEL_7:
    C3DSceneUnlock(v6);
LABEL_8:
  if ((*((_BYTE *)self + 40) & 1) != 0)
    return -[SCNGeometry presentationGeometry](v4, "presentationGeometry");
  else
    return v4;
}

- (id)_findComponentWithType:(int64_t)a3
{
  SCNNodeComponent *components;

  if ((((*((_WORD *)self + 22) & 0x1FFFu) >> a3) & 1) == 0)
    return 0;
  components = self->_components;
  if (!components)
    return 0;
  while (-[SCNNodeComponent type](components, "type") != a3)
  {
    components = -[SCNNodeComponent next](components, "next");
    if (!components)
      return 0;
  }
  return -[SCNNodeComponent component](components, "component");
}

- (id)__skinner
{
  SCNSkinner *v3;
  SCNSkinner *v4;
  __C3DScene *v5;
  uint64_t v6;
  uint64_t Skinner;

  v3 = -[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 3);
  v4 = v3;
  if ((*((_BYTE *)self + 40) & 0x10) == 0 && !v3)
  {
    v5 = -[SCNNode sceneRef](self, "sceneRef");
    v6 = (uint64_t)v5;
    if (v5)
      C3DSceneLock((uint64_t)v5);
    *((_BYTE *)self + 40) |= 0x10u;
    Skinner = C3DNodeGetSkinner((uint64_t)self->_node);
    if (!Skinner)
    {
      v4 = 0;
      if (!v6)
        return v4;
      goto LABEL_9;
    }
    v4 = +[SCNSkinner skinnerWithSkinnerRef:](SCNSkinner, "skinnerWithSkinnerRef:", Skinner);
    if (-[SCNNode geometry](self, "geometry"))
      -[SCNSkinner _setBaseGeometry:](v4, "_setBaseGeometry:", -[SCNNode geometry](self, "geometry"));
    -[SCNNode _setComponent:withType:](self, "_setComponent:withType:", v4, 3);
    if (v6)
LABEL_9:
      C3DSceneUnlock(v6);
  }
  return v4;
}

- (SCNPhysicsBody)physicsBody
{
  return (SCNPhysicsBody *)-[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 8);
}

- (void)_setComponent:(id)a3 withType:(int64_t)a4
{
  if (a3)
    -[SCNNode _assignComponent:toContainerWithType:](self, "_assignComponent:toContainerWithType:", a3, a4);
  else
    -[SCNNode _removeComponentWithType:](self, "_removeComponentWithType:", a4);
}

- (void)_assignComponent:(id)a3 toContainerWithType:(int64_t)a4
{
  int v7;
  SCNNodeComponent *components;
  __objc2_class **v9;
  SCNNodeComponent *v10;

  v7 = 1 << a4;
  if ((*((_WORD *)self + 22) & (unsigned __int16)(1 << a4) & 0x1FFF) != 0 && (components = self->_components) != 0)
  {
    while (-[SCNNodeComponent type](components, "type") != a4)
    {
      components = -[SCNNodeComponent next](components, "next");
      if (!components)
        goto LABEL_5;
    }
    -[SCNNodeComponent setComponent:](components, "setComponent:", a3);
  }
  else
  {
LABEL_5:
    v9 = off_1EA593910;
    if (a4 != 10)
      v9 = off_1EA593908;
    v10 = (SCNNodeComponent *)objc_msgSend(objc_alloc(*v9), "initWithType:component:", a4, a3);
    -[SCNNodeComponent setNext:](v10, "setNext:", self->_components);

    self->_components = v10;
    *((_WORD *)self + 22) |= v7 & 0x1FFF;
  }
}

- (void)setHidden:(BOOL)hidden
{
  unsigned int v5;
  char v6;
  __C3DScene *v7;
  NSObject *v8;
  _QWORD v9[5];
  BOOL v10;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNNode setHidden:].cold.1();
  }
  else
  {
    v5 = *((unsigned __int8 *)self + 41);
    if (hidden != v5 >> 7)
    {
      if (hidden)
        v6 = 0x80;
      else
        v6 = 0;
      *((_BYTE *)self + 41) = v6 & 0x80 | v5 & 0x7F;
      v7 = -[SCNNode sceneRef](self, "sceneRef");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __21__SCNNode_setHidden___block_invoke;
      v9[3] = &unk_1EA59E478;
      v9[4] = self;
      v10 = hidden;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v7, self, CFSTR("hidden"), v9);
    }
  }
}

- (id)__light
{
  SCNLight *v3;
  SCNLight *v4;
  __C3DScene *v5;
  uint64_t v6;
  const __CFDictionary *Light;

  v3 = -[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 0);
  v4 = v3;
  if ((*((_BYTE *)self + 40) & 2) != 0 || v3)
    goto LABEL_8;
  v5 = -[SCNNode sceneRef](self, "sceneRef");
  v6 = (uint64_t)v5;
  if (v5)
    C3DSceneLock((uint64_t)v5);
  *((_BYTE *)self + 40) |= 2u;
  Light = C3DNodeGetLight((uint64_t)self->_node);
  if (Light)
  {
    v4 = +[SCNLight lightWithLightRef:](SCNLight, "lightWithLightRef:", Light);
    -[SCNNode _setComponent:withType:](self, "_setComponent:withType:", v4, 0);
    if (!v6)
      goto LABEL_8;
    goto LABEL_7;
  }
  v4 = 0;
  if (v6)
LABEL_7:
    C3DSceneUnlock(v6);
LABEL_8:
  if ((*((_BYTE *)self + 40) & 1) != 0)
    return -[SCNLight presentationLight](v4, "presentationLight");
  else
    return v4;
}

- (BOOL)authoringEnvironmentNode
{
  return (*((unsigned __int8 *)self + 42) >> 6) & 1;
}

- (simd_float4x4)simdTransform
{
  simd_float4 v3;
  simd_float4 v4;
  simd_float4 v5;
  simd_float4 v6;
  __C3DScene *v7;
  uint64_t v8;
  simd_float4 v9;
  simd_float4 v10;
  simd_float4 v11;
  simd_float4 v12;
  simd_float4x4 result;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v7 = -[SCNNode sceneRef](self, "sceneRef");
    if (v7)
    {
      v8 = (uint64_t)v7;
      C3DSceneLock((uint64_t)v7);
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      C3DNodeGetMatrix((uint64_t)self->_node, (uint64_t)&v9);
      C3DSceneUnlock(v8);
    }
    else
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      C3DNodeGetMatrix((uint64_t)self->_node, (uint64_t)&v9);
    }
    v3 = v9;
    v4 = v10;
    v5 = v11;
    v6 = v12;
  }
  else
  {
    if ((*((_BYTE *)self + 41) & 2) == 0)
      -[SCNNode _updateTransform](self, "_updateTransform");
    v3 = *(simd_float4 *)&self->_anon_30[2];
    v4 = *(simd_float4 *)&self->_anon_30[18];
    v5 = *(simd_float4 *)&self->_anon_30[34];
    v6 = *(simd_float4 *)&self->_anon_30[50];
  }
  result.columns[3] = v6;
  result.columns[2] = v5;
  result.columns[1] = v4;
  result.columns[0] = v3;
  return result;
}

- (void)setOpacity:(CGFloat)opacity
{
  double v4;
  float v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNNode setOpacity:].cold.1();
  }
  else
  {
    if (opacity > 1.0)
      opacity = 1.0;
    v4 = fmax(opacity, 0.0);
    if (v4 != self->_opacity)
    {
      v5 = v4;
      self->_opacity = v5;
      v6 = -[SCNNode sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __22__SCNNode_setOpacity___block_invoke;
      v8[3] = &unk_1EA59E450;
      v8[4] = self;
      *(double *)&v8[5] = v4;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v6, self, CFSTR("opacity"), v8);
    }
  }
}

- (id)postSkinningDeformers
{
  return -[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 12);
}

- (id)postMorphingDeformers
{
  return -[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 11);
}

- (SCNPhysicsField)physicsField
{
  return (SCNPhysicsField *)-[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 9);
}

- (id)__morpher
{
  SCNMorpher *v3;
  SCNMorpher *v4;
  __C3DScene *v5;
  uint64_t v6;
  uint64_t Morpher;

  v3 = -[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 4);
  v4 = v3;
  if ((*((_BYTE *)self + 40) & 0x20) != 0 || v3)
    goto LABEL_8;
  v5 = -[SCNNode sceneRef](self, "sceneRef");
  v6 = (uint64_t)v5;
  if (v5)
    C3DSceneLock((uint64_t)v5);
  *((_BYTE *)self + 40) |= 0x20u;
  Morpher = C3DNodeGetMorpher((uint64_t)self->_node);
  if (Morpher)
  {
    v4 = +[SCNMorpher morpherWithMorphRef:](SCNMorpher, "morpherWithMorphRef:", C3DGeometryGetOverrideMaterial(Morpher));
    -[SCNNode _setComponent:withType:](self, "_setComponent:withType:", v4, 4);
    if (!v6)
      goto LABEL_8;
    goto LABEL_7;
  }
  v4 = 0;
  if (v6)
LABEL_7:
    C3DSceneUnlock(v6);
LABEL_8:
  if ((*((_BYTE *)self + 40) & 1) != 0)
    return -[SCNMorpher presentationInstance](v4, "presentationInstance");
  else
    return v4;
}

- (void)setCamera:(SCNCamera *)camera
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (-[SCNNode camera](self, "camera") != camera)
  {
    -[SCNNode _setComponent:withType:](self, "_setComponent:withType:", camera, 1);
    v5 = -[SCNNode sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __21__SCNNode_setCamera___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = self;
    v6[5] = camera;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

- (id)__camera
{
  SCNCamera *v3;
  SCNCamera *v4;
  __C3DScene *v5;
  uint64_t v6;
  const __CFDictionary *Camera;

  v3 = -[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 1);
  v4 = v3;
  if ((*((_BYTE *)self + 40) & 8) != 0 || v3)
    goto LABEL_8;
  v5 = -[SCNNode sceneRef](self, "sceneRef");
  v6 = (uint64_t)v5;
  if (v5)
    C3DSceneLock((uint64_t)v5);
  *((_BYTE *)self + 40) |= 8u;
  Camera = C3DNodeGetCamera((uint64_t)self->_node);
  if (Camera)
  {
    v4 = +[SCNCamera cameraWithCameraRef:](SCNCamera, "cameraWithCameraRef:", Camera);
    -[SCNNode _setComponent:withType:](self, "_setComponent:withType:", v4, 1);
    if (!v6)
      goto LABEL_8;
    goto LABEL_7;
  }
  v4 = 0;
  if (v6)
LABEL_7:
    C3DSceneUnlock(v6);
LABEL_8:
  if ((*((_BYTE *)self + 40) & 1) != 0)
    return -[SCNCamera presentationCamera](v4, "presentationCamera");
  else
    return v4;
}

- (BOOL)usesDepthPrePass
{
  int v3;
  __C3DScene *v4;
  uint64_t v5;
  char UsesDepthPrePass;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v4 = -[SCNNode sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      UsesDepthPrePass = C3DNodeGetUsesDepthPrePass((uint64_t)self->_node);
      C3DSceneUnlock(v5);
      LOBYTE(v3) = UsesDepthPrePass;
    }
    else
    {
      LOBYTE(v3) = C3DNodeGetUsesDepthPrePass((uint64_t)self->_node);
    }
  }
  else
  {
    return (*((unsigned __int8 *)self + 42) >> 1) & 1;
  }
  return v3;
}

- (void)setUsesDepthPrePass:(BOOL)a3
{
  char v5;
  char v6;
  __C3DScene *v7;
  NSObject *v8;
  _QWORD v9[5];
  BOOL v10;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNNode setUsesDepthPrePass:].cold.1();
  }
  else
  {
    v5 = *((_BYTE *)self + 42);
    if (((((v5 & 2) == 0) ^ a3) & 1) == 0)
    {
      if (a3)
        v6 = 2;
      else
        v6 = 0;
      *((_BYTE *)self + 42) = v5 & 0xFD | v6;
      v7 = -[SCNNode sceneRef](self, "sceneRef");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __31__SCNNode_setUsesDepthPrePass___block_invoke;
      v9[3] = &unk_1EA59E478;
      v9[4] = self;
      v10 = a3;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v9);
    }
  }
}

- (void)setSkinner:(SCNSkinner *)skinner
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (-[SCNNode skinner](self, "skinner") != skinner)
  {
    if (-[SCNNode geometry](self, "geometry"))
      -[SCNSkinner _setBaseGeometry:](skinner, "_setBaseGeometry:", -[SCNNode geometry](self, "geometry"));
    -[SCNNode _setComponent:withType:](self, "_setComponent:withType:", skinner, 3);
    v5 = -[SCNNode sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __22__SCNNode_setSkinner___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = self;
    v6[5] = skinner;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

- (void)setRenderingOrder:(NSInteger)renderingOrder
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNNode setRenderingOrder:].cold.1();
  }
  else if (self->_renderingOrder != renderingOrder)
  {
    self->_renderingOrder = renderingOrder;
    v5 = -[SCNNode sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __29__SCNNode_setRenderingOrder___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = renderingOrder;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

- (void)setRendererDelegate:(id)rendererDelegate
{
  void *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (self->_rendererDelegate != rendererDelegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      self->_rendererDelegate = rendererDelegate;
      v5 = (void *)C3DRendererDelegateCreate((uint64_t)_rendererCallback, 0, (uint64_t)self);
    }
    else
    {
      v5 = 0;
      self->_rendererDelegate = 0;
    }
    v6 = -[SCNNode sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __31__SCNNode_setRendererDelegate___block_invoke;
    v7[3] = &unk_1EA59F740;
    v7[4] = self;
    v7[5] = v5;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);

  }
}

- (void)setPostSkinningDeformers:(id)a3
{
  void *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNNode postSkinningDeformers](self, "postSkinningDeformers") != a3)
  {
    v5 = (void *)objc_msgSend(a3, "copy");
    -[SCNNode _setComponent:withType:](self, "_setComponent:withType:", v5, 12);
    v6 = -[SCNNode sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__SCNNode_setPostSkinningDeformers___block_invoke;
    v7[3] = &unk_1EA59F740;
    v7[4] = self;
    v7[5] = v5;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);

  }
}

- (void)setPostMorphingDeformers:(id)a3
{
  void *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  if (-[SCNNode postMorphingDeformers](self, "postMorphingDeformers") != a3)
  {
    v5 = (void *)objc_msgSend(a3, "copy");
    -[SCNNode _setComponent:withType:](self, "_setComponent:withType:", v5, 11);
    v6 = -[SCNNode sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__SCNNode_setPostMorphingDeformers___block_invoke;
    v7[3] = &unk_1EA59F740;
    v7[4] = self;
    v7[5] = v5;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);

  }
}

- (void)setPhysicsField:(SCNPhysicsField *)physicsField
{
  SCNPhysicsField *v5;
  SCNPhysicsField *v6;
  SCNPhysicsField *v7;
  __C3DScene *v8;
  _QWORD v9[7];

  v5 = -[SCNNode physicsField](self, "physicsField");
  if (v5 != physicsField)
  {
    v6 = v5;
    if (v5)
    {
      v7 = v5;
      -[SCNNode _removeComponentWithType:](self, "_removeComponentWithType:", 9);
    }
    if (physicsField)
      -[SCNNode _assignComponent:toContainerWithType:](self, "_assignComponent:toContainerWithType:", physicsField, 9);
    v8 = -[SCNNode sceneRef](self, "sceneRef");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __27__SCNNode_setPhysicsField___block_invoke;
    v9[3] = &unk_1EA59F718;
    v9[4] = v6;
    v9[5] = physicsField;
    v9[6] = self;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, self, v9);
  }
}

- (void)setPhysicsBody:(SCNPhysicsBody *)physicsBody
{
  SCNPhysicsBody *v5;
  SCNPhysicsBody *v6;
  NSObject *v7;
  NSObject *v8;

  v5 = -[SCNNode physicsBody](self, "physicsBody");
  if (v5 != physicsBody)
  {
    v6 = v5;
    if (v5)
    {
      if (-[SCNPhysicsBody _owner](v5, "_owner") != self)
      {
        v7 = scn_default_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[SCNNode setPhysicsBody:].cold.2(v6);
      }
      -[SCNPhysicsBody _removeOwner](v6, "_removeOwner");
      -[SCNNode _removeComponentWithType:](self, "_removeComponentWithType:", 8);
    }
    if (physicsBody)
    {
      if (-[SCNPhysicsBody _owner](physicsBody, "_owner"))
      {
        v8 = scn_default_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[SCNNode setPhysicsBody:].cold.1(physicsBody);
      }
      -[SCNNode _assignComponent:toContainerWithType:](self, "_assignComponent:toContainerWithType:", physicsBody, 8);
      -[SCNPhysicsBody _setOwner:](physicsBody, "_setOwner:", self);
      -[SCNPhysicsBody resetTransform](physicsBody, "resetTransform");
    }
  }
}

- (void)setMovabilityHint:(SCNMovabilityHint)movabilityHint
{
  unint64_t v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[6];

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNNode setMovabilityHint:].cold.1();
  }
  else
  {
    v5 = *((unsigned __int8 *)self + 41);
    if (((v5 >> 6) & 1) != movabilityHint)
    {
      *((_BYTE *)self + 41) = v5 & 0xBF | ((movabilityHint & 1) << 6);
      v6 = -[SCNNode sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __29__SCNNode_setMovabilityHint___block_invoke;
      v8[3] = &unk_1EA59E450;
      v8[4] = self;
      v8[5] = movabilityHint;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v8);
    }
  }
}

- (void)setMorpher:(SCNMorpher *)morpher
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (-[SCNNode morpher](self, "morpher") != morpher)
  {
    -[SCNNode _setComponent:withType:](self, "_setComponent:withType:", morpher, 4);
    v5 = -[SCNNode sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __22__SCNNode_setMorpher___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = morpher;
    v6[5] = self;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

- (void)setLight:(SCNLight *)light
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (-[SCNNode light](self, "light") != light)
  {
    -[SCNNode _setComponent:withType:](self, "_setComponent:withType:", light, 0);
    v5 = -[SCNNode sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __20__SCNNode_setLight___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = self;
    v6[5] = light;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

- (void)setIdentifier:(id)a3
{
  C3DEntitySetID((uint64_t)-[SCNNode __CFObject](self, "__CFObject"), a3);
}

- (void)setGizmo:(BOOL)a3
{
  C3DNodeSetIsGizmo((uint64_t)self->_node, a3);
}

- (void)setFocusBehavior:(SCNNodeFocusBehavior)focusBehavior
{
  unint64_t v3;
  char v4;

  v3 = *((unsigned __int8 *)self + 42);
  if (((v3 >> 3) & 3) != focusBehavior)
  {
    v4 = v3 & 0xE7 | (8 * (focusBehavior & 3));
    *((_BYTE *)self + 42) = v4;
    if ((focusBehavior & 3) != 0)
    {
      *((_BYTE *)self + 42) = v4 | 0x20;
      -[SCNNode _setHasFocusableChild](self->_parent, "_setHasFocusableChild");
    }
    else
    {
      -[SCNNode _updateFocusableCache](self, "_updateFocusableCache");
    }
  }
}

- (void)setConstraints:(NSArray *)constraints
{
  NSArray *v5;
  __C3DScene *v6;
  _QWORD v7[6];

  v5 = -[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 7);
  if (v5 != constraints)
  {
    if (v5)
      -[SCNNode _removeComponentWithType:](self, "_removeComponentWithType:", 7);
    if (constraints)
      -[SCNNode _assignComponent:toContainerWithType:](self, "_assignComponent:toContainerWithType:", (id)-[NSArray mutableCopy](constraints, "mutableCopy"), 7);
    v6 = -[SCNNode sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __26__SCNNode_setConstraints___block_invoke;
    v7[3] = &unk_1EA59F740;
    v7[4] = constraints;
    v7[5] = self;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

- (void)setCategoryBitMask:(NSUInteger)categoryBitMask
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNNode setCategoryBitMask:].cold.1();
  }
  else if (self->_categoryBitMask != categoryBitMask)
  {
    self->_categoryBitMask = categoryBitMask;
    v5 = -[SCNNode sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __30__SCNNode_setCategoryBitMask___block_invoke;
    v7[3] = &unk_1EA59E450;
    v7[4] = self;
    v7[5] = categoryBitMask;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
}

- (void)setCastsShadow:(BOOL)castsShadow
{
  char v5;
  __C3DScene *v6;
  NSObject *v7;
  _QWORD v8[5];
  BOOL v9;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNNode setCastsShadow:].cold.1();
  }
  else
  {
    v5 = *((_BYTE *)self + 42);
    if (((((v5 & 1) == 0) ^ castsShadow) & 1) == 0)
    {
      *((_BYTE *)self + 42) = v5 & 0xFE | castsShadow;
      v6 = -[SCNNode sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __26__SCNNode_setCastsShadow___block_invoke;
      v8[3] = &unk_1EA59E478;
      v8[4] = self;
      v9 = castsShadow;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v8);
    }
  }
}

- (void)setAuthoringEnvironmentNode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 42) = *((_BYTE *)self + 42) & 0xBF | v3;
  if (a3)
    -[SCNNode setCastsShadow:](self, "setCastsShadow:", 0);
}

- (NSInteger)renderingOrder
{
  __C3DScene *v4;
  uint64_t v5;
  const __CFDictionary *RenderingOrder;

  if ((*((_BYTE *)self + 40) & 1) == 0)
    return self->_renderingOrder;
  v4 = -[SCNNode sceneRef](self, "sceneRef");
  if (!v4)
    return (NSInteger)C3DNodeGetRenderingOrder((uint64_t)self->_node);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  RenderingOrder = C3DNodeGetRenderingOrder((uint64_t)self->_node);
  C3DSceneUnlock(v5);
  return (NSInteger)RenderingOrder;
}

- (id)rendererDelegate
{
  return self->_rendererDelegate;
}

- (NSArray)particleSystems
{
  return (NSArray *)(id)objc_msgSend(-[SCNNode _particleSystems](self, "_particleSystems"), "copy");
}

- (CGFloat)opacity
{
  float Opacity;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v4 = -[SCNNode sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      Opacity = C3DNodeGetOpacity((uint64_t)self->_node);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DNodeGetOpacity((uint64_t)self->_node);
    }
  }
  else
  {
    return self->_opacity;
  }
  return Opacity;
}

- (SCNMovabilityHint)movabilityHint
{
  SCNMovabilityHint Movability;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 40) & 1) == 0)
    return ((unint64_t)*((unsigned __int8 *)self + 41) >> 6) & 1;
  v4 = -[SCNNode sceneRef](self, "sceneRef");
  if (!v4)
    return (uint64_t)(int)C3DNodeGetMovability((uint64_t)self->_node);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  Movability = (int)C3DNodeGetMovability((uint64_t)self->_node);
  C3DSceneUnlock(v5);
  return Movability;
}

- (BOOL)isHidden
{
  int v3;
  __C3DScene *v4;
  uint64_t v5;
  char IsHidden;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v4 = -[SCNNode sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      IsHidden = C3DNodeIsHidden((uint64_t)self->_node);
      C3DSceneUnlock(v5);
      LOBYTE(v3) = IsHidden;
    }
    else
    {
      LOBYTE(v3) = C3DNodeIsHidden((uint64_t)self->_node);
    }
  }
  else
  {
    return *((unsigned __int8 *)self + 41) >> 7;
  }
  return v3;
}

- (BOOL)isGizmo
{
  return C3DNodeIsGizmo((uint64_t)self->_node);
}

- (id)identifier
{
  return (id)C3DEntityGetID((uint64_t)-[SCNNode __CFObject](self, "__CFObject"));
}

- (SCNNodeFocusBehavior)focusBehavior
{
  return ((unint64_t)*((unsigned __int8 *)self + 42) >> 3) & 3;
}

- (NSArray)constraints
{
  return (NSArray *)(id)objc_msgSend(-[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 7), "copy");
}

- (NSUInteger)categoryBitMask
{
  __C3DScene *v4;
  uint64_t v5;
  NSUInteger CategoryBitMask;

  if ((*((_BYTE *)self + 40) & 1) == 0)
    return self->_categoryBitMask;
  v4 = -[SCNNode sceneRef](self, "sceneRef");
  if (!v4)
    return C3DNodeGetCategoryBitMask((uint64_t)self->_node);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  CategoryBitMask = C3DNodeGetCategoryBitMask((uint64_t)self->_node);
  C3DSceneUnlock(v5);
  return CategoryBitMask;
}

- (BOOL)castsShadow
{
  __C3DScene *v4;
  uint64_t v5;
  char CastsShadow;

  if ((*((_BYTE *)self + 40) & 1) == 0)
    return *((_BYTE *)self + 42) & 1;
  v4 = -[SCNNode sceneRef](self, "sceneRef");
  if (!v4)
    return C3DNodeGetCastsShadow((uint64_t)self->_node);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  CastsShadow = C3DNodeGetCastsShadow((uint64_t)self->_node);
  C3DSceneUnlock(v5);
  return CastsShadow;
}

- (NSArray)actionKeys
{
  return (NSArray *)-[SCNOrderedDictionary allKeys](self->_actions, "allKeys");
}

- (id)_particleSystems
{
  return -[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 6);
}

- (id)_copyRecursively
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  *((_BYTE *)self + 42) |= 4u;
  v3 = -[SCNNode copy](self, "copy");
  *((_BYTE *)self + 42) &= ~4u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = -[SCNNode childNodes](self, "childNodes", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isGizmo") & 1) == 0)
        {
          v10 = (void *)objc_msgSend(v9, "_copyRecursively");
          objc_msgSend(v3, "addChildNode:", v10);

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)copy
{
  return -[SCNNode copyWithZone:](self, "copyWithZone:", 0);
}

- (void)_copyAnimationsFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_msgSend(a3, "animationKeys", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v11 = (void *)objc_msgSend((id)objc_msgSend(a3, "animationPlayerForKey:", v10), "copy");
        -[SCNNode addAnimationPlayer:forKey:](self, "addAnimationPlayer:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
}

- (NSArray)animationKeys
{
  os_unfair_lock_s *p_animationsLock;
  NSArray *v4;

  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  v4 = -[SCNOrderedDictionary allKeys](self->_animations, "allKeys");
  os_unfair_lock_unlock(p_animationsLock);
  if (-[NSArray count](v4, "count"))
    return v4;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)isPresentationInstance
{
  return *((_BYTE *)self + 40) & 1;
}

- (SCNVector3)convertVector:(SCNVector3)vector fromNode:(SCNNode *)node
{
  float y;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  SCNVector3 result;

  y = vector.y;
  -[SCNNode simdConvertVector:fromNode:](self, "simdConvertVector:fromNode:", node, *(double *)&vector.x);
  v7 = v6;
  v9 = v8;
  result.z = v9;
  result.y = v7;
  result.x = v5;
  return result;
}

- (simd_float3)simdConvertVector:(simd_float3)vector fromNode:(SCNNode *)node
{
  SCNNode *v6;
  simd_float4x4 v7;
  float32x4_t v8;
  simd_float4 v9;
  simd_float4 v10;
  simd_float4 v11;
  float32x4_t v12;
  simd_float4x4 v13;

  v6 = node;
  v12 = (float32x4_t)vector;
  if (!node)
  {
    v6 = (SCNNode *)objc_msgSend(-[SCNNode scene](self, "scene"), "rootNode");
    vector = (simd_float3)v12;
  }
  if (v6 != self)
  {
    -[SCNNode simdWorldTransform](self, "simdWorldTransform");
    v7 = __invert_f4(v13);
    v7.columns[3] = v7.columns[0];
    if (node)
    {
      v10 = v7.columns[2];
      v11 = v7.columns[0];
      v9 = v7.columns[1];
      -[SCNNode simdWorldTransform](node, "simdWorldTransform");
      v8 = vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)v7.columns[1], *(float32x2_t *)v12.f32, 1), (float32x4_t)v7.columns[0], v12.f32[0]), (float32x4_t)v7.columns[2], v12, 2);
      v7.columns[1] = v9;
      v7.columns[2] = v10;
      v7.columns[3] = v11;
    }
    else
    {
      v8 = v12;
    }
    return (simd_float3)vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)v7.columns[1], *(float32x2_t *)v8.f32, 1), (float32x4_t)v7.columns[3], v8.f32[0]), (float32x4_t)v7.columns[2], v8, 2);
  }
  return vector;
}

- (id)childNodesPassingTest:(id)a3 recursively:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = -[SCNNode childNodes](self, "childNodes", 0);
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v11)
        objc_enumerationMutation(v8);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "_childNodesPassingTest:recursively:output:", a3, v4, v7) & 1) != 0)break;
      if (v10 == ++v12)
      {
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v10)
          goto LABEL_3;
        return v7;
      }
    }
  }
  return v7;
}

- (NSArray)childNodesPassingTest:(void *)predicate
{
  return (NSArray *)-[SCNNode childNodesPassingTest:recursively:](self, "childNodesPassingTest:recursively:", predicate, 1);
}

+ (SCNNode)nodeWithMDLObject:(MDLObject *)mdlObject
{
  return (SCNNode *)objc_msgSend(a1, "nodeWithMDLObject:options:", mdlObject, 0);
}

uint64_t __46__SCNNode___insertObject_inChildNodesAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t ChildNodeAtIndex;
  uint64_t Parent;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  float32x4_t *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v2 = objc_msgSend(*(id *)(a1 + 32), "nodeRef");
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    ChildNodeAtIndex = v2;
    if (v2)
    {
      Parent = C3DNodeGetParent(v2);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (Parent == v6)
      {
        v9 = (float32x4_t *)objc_msgSend(*(id *)(a1 + 48), "nodeRef");
        v10 = Parent;
        goto LABEL_9;
      }
      v3 = *(_QWORD *)(a1 + 56);
    }
    else
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    }
    ChildNodeAtIndex = C3DNodeGetChildNodeAtIndex(v6, (int)v3 - 1);
    v12 = *(void **)(a1 + 48);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = (float32x4_t *)objc_msgSend(v12, "nodeRef");
    v10 = v13;
LABEL_9:
    v11 = ChildNodeAtIndex;
    return C3DNodeInsertChildNodeAfterChild(v10, v9, v11);
  }
  v7 = *(void **)(a1 + 48);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = (float32x4_t *)objc_msgSend(v7, "nodeRef");
  v10 = v8;
  v11 = 0;
  return C3DNodeInsertChildNodeAfterChild(v10, v9, v11);
}

- (__C3DNode)nodeRef
{
  uint64_t v0;

  return *(__C3DNode **)(v0 + 8);
}

- (void)setPosition:(SCNVector3)position
{
  float y;

  y = position.y;
  -[SCNNode setSimdPosition:](self, "setSimdPosition:", *(double *)&position.x);
}

void __21__SCNNode_setCamera___block_invoke(uint64_t a1)
{
  C3DNodeSetCamera(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (const __CFDictionary *)objc_msgSend(*(id *)(a1 + 40), "cameraRef"));
}

- (void)setSimdPosition:(simd_float3)simdPosition
{
  -[SCNNode _setPosition:](self, "_setPosition:", *(double *)simdPosition.i64);
  if ((*((_WORD *)self + 22) & 0x100) != 0)
    objc_msgSend(-[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 8), "resetTransform");
}

- (id)_associatedMDLObject
{
  return objc_getAssociatedObject(self, CFSTR("SCNSceneKitAssociatedObject"));
}

+ (SCNNode)nodeWithMDLAsset:(id)a3
{
  return (SCNNode *)objc_msgSend(a1, "nodeWithMDLAsset:options:", a3, 0);
}

+ (SCNNode)nodeWithMDLAsset:(id)a3 options:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init((Class)a1);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(a3);
        objc_msgSend(v6, "addChildNode:", +[SCNNode nodeWithMDLObject:options:](SCNNode, "nodeWithMDLObject:options:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), a4));
      }
      while (v8 != v10);
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  return (SCNNode *)v6;
}

+ (SCNNode)nodeWithMDLObject:(id)a3 masterObjects:(id)a4 sceneNodes:(id)a5 skinnedMeshes:(id)a6 skelNodesMap:(void *)a7 asset:(id)a8 options:(id)a9
{
  SCNNode *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  id v26;
  int v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  SCNLight *v38;
  void *v39;
  void *v40;
  void *v41;
  SCNNode *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  SCNNode *v48;
  id v50;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _OWORD v57[4];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v13 = (SCNNode *)objc_msgSend(a1, "node");
  if (objc_msgSend(a3, "transform"))
  {
    objc_msgSend((id)objc_msgSend(a3, "transform"), "matrix");
    v57[0] = v14;
    v57[1] = v15;
    v57[2] = v16;
    v57[3] = v17;
    -[SCNNode setTransform:](v13, "setTransform:", v57);
    objc_msgSend(a3, "transform");
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v19 = (void *)objc_msgSend(a3, "transform");
    if ((isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_16;
      v19 = (void *)objc_msgSend(a3, "transform");
    }
    v20 = (void *)objc_msgSend(v19, "transformAnimation");
    if (v20)
    {
      v21 = v20;
      objc_msgSend(v20, "duration");
      if (v22 != 0.0)
      {
        v23 = (void *)objc_msgSend(a9, "valueForKey:", CFSTR("kSceneSourceAnimationLoadingMode"));
        if (v23)
        {
          v25 = v23;
          v26 = a3;
          objc_msgSend(v21, "setUsesSceneTimeBase:", objc_msgSend(v23, "isEqualToString:", CFSTR("playUsingSceneTime")));
          objc_msgSend(v21, "setRemovedOnCompletion:", objc_msgSend(v25, "isEqualToString:", CFSTR("playUsingSceneTime")) ^ 1);
          v27 = objc_msgSend(v25, "isEqualToString:", CFSTR("playRepeatedly"));
          LODWORD(v24) = 2139095040;
          if (!v27)
            *(float *)&v24 = 0.0;
        }
        else
        {
          v26 = a3;
          LODWORD(v24) = 2139095040;
        }
        objc_msgSend(v21, "setRepeatCount:", v24);
        objc_msgSend(a8, "endTime");
        v29 = v28;
        objc_msgSend(a8, "startTime");
        v31 = v29 - v30;
        if (v29 - v30 > 0.0)
        {
          objc_msgSend(v21, "duration");
          v33 = v32;
          objc_msgSend(v21, "beginTime");
          if (v33 < v31 - v34)
          {
            objc_msgSend(v21, "beginTime");
            objc_msgSend(v21, "setDuration:", v31 - v35);
          }
        }
        -[SCNNode addAnimation:forKey:](v13, "addAnimation:forKey:", v21, CFSTR("transform"));
        a3 = v26;
      }
    }
  }
LABEL_16:
  -[SCNNode setName:](v13, "setName:", objc_msgSend(a3, "name"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = objc_msgSend(a3, "path");
    v37 = objc_msgSend(a4, "objectForKey:", v36);
    if (v37)
    {
      -[SCNNode setGeometry:](v13, "setGeometry:", v37);
    }
    else
    {
      -[SCNNode setGeometry:](v13, "setGeometry:", +[SCNGeometry geometryWithMDLMesh:options:](SCNGeometry, "geometryWithMDLMesh:options:", a3, a9));
      v39 = (void *)objc_msgSend(a3, "componentConformingToProtocol:", &unk_1F040D890);
      if (v39)
      {
        v40 = v39;
        -[SCNNode setMorpher:](v13, "setMorpher:", morpherFromMDLMorphDeformer(v39));
        addMorphAnimation(v40, v13, a9);
      }
      if (objc_msgSend(a3, "componentConformingToProtocol:", &unk_1F040DA48))
        objc_msgSend(a6, "addObject:", a3);
      if (objc_msgSend(a3, "subdivisionScheme"))
      {
        -[SCNGeometry setSubdivisionLevel:](-[SCNNode geometry](v13, "geometry"), "setSubdivisionLevel:", 1);
        -[SCNGeometry setWantsAdaptiveSubdivision:](-[SCNNode geometry](v13, "geometry"), "setWantsAdaptiveSubdivision:", 1);
        v41 = (void *)objc_opt_new();
        -[SCNGeometry setTessellator:](-[SCNNode geometry](v13, "geometry"), "setTessellator:", v41);

      }
      objc_msgSend(a4, "setObject:forKey:", -[SCNNode geometry](v13, "geometry"), v36);
    }
    goto LABEL_35;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = +[SCNLight lightWithMDLLight:](SCNLight, "lightWithMDLLight:", a3);
LABEL_23:
    -[SCNNode setLight:](v13, "setLight:", v38);
    goto LABEL_35;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = +[SCNLight lightWithMDLLightProbe:](SCNLight, "lightWithMDLLightProbe:", a3);
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SCNNode setCamera:](v13, "setCamera:", +[SCNCamera cameraWithMDLCamera:](SCNCamera, "cameraWithMDLCamera:", a3));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
  }
LABEL_35:
  if (objc_msgSend(a3, "instance"))
    -[SCNNode addChildNode:](v13, "addChildNode:", +[SCNNode nodeWithMDLObject:masterObjects:sceneNodes:skinnedMeshes:skelNodesMap:asset:options:](SCNNode, "nodeWithMDLObject:masterObjects:sceneNodes:skinnedMeshes:skelNodesMap:asset:options:", objc_msgSend(a3, "instance"), a4, a5, a6, a7, a8, a9));
  v42 = v13;
  objc_msgSend(a5, "setObject:forKey:", v13, objc_msgSend(a3, "path"));
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v50 = a3;
  v43 = (void *)objc_msgSend(a3, "children");
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v54 != v46)
          objc_enumerationMutation(v43);
        v48 = +[SCNNode nodeWithMDLObject:masterObjects:sceneNodes:skinnedMeshes:skelNodesMap:asset:options:](SCNNode, "nodeWithMDLObject:masterObjects:sceneNodes:skinnedMeshes:skelNodesMap:asset:options:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i), a4, a5, a6, a7, a8, a9);
        if (v48)
          -[SCNNode addChildNode:](v42, "addChildNode:", v48);
      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v45);
  }
  -[SCNNode setHidden:](v42, "setHidden:", objc_msgSend(v50, "hidden"));
  return v42;
}

- (void)_addSkinnerWithMDLMesh:(id)a3 sceneNodes:(id)a4
{
  uint64_t v7;
  void *v8;
  SCNGeometry *v9;
  id v10;
  id v11;
  MDLMesh *v12;
  SCNGeometrySource *v13;
  MDLMesh *v14;

  v7 = objc_msgSend(a3, "componentConformingToProtocol:", &unk_1F040DA48);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = -[SCNNode geometry](self, "geometry");
    v10 = jointNodesFromMDLSkinDeformer(v8, a4);
    v11 = boneInverseTransformsFromMDLSkinDeformer(v8);
  }
}

- (void)_bakeNodes:(id)a3 folderPath:(id)a4 inVertex:(BOOL)a5 bakeAO:(BOOL)a6 quality:(float)a7 attenuation:(float)a8 geomSetter:(id)a9 terminateSetter:(id)a10
{
  MDLAsset *v18;
  MDLAsset *v19;
  NSMutableArray *v20;
  NSMutableArray *v21;
  NSMutableArray *v22;
  uint64_t v23;
  NSObject *global_queue;
  _QWORD block[11];
  float v26;
  float v27;
  BOOL v28;
  BOOL v29;
  _QWORD v30[5];
  _QWORD v31[3];

  v31[1] = *MEMORY[0x1E0C80C00];
  v31[0] = self;
  v18 = (MDLAsset *)SCNNodesToMDLAsset((void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1));
  v19 = (MDLAsset *)SCNNodesToMDLAsset(a3);
  v20 = FlattenedMDLMeshesFromMDLAsset(v19);
  v21 = FlattenedMDLMeshesFromMDLAsset(v18);
  v22 = FlattenedMDLLightsFromMDLAsset(v18);
  v23 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __108__SCNNode_SCNModelIO___bakeNodes_folderPath_inVertex_bakeAO_quality_attenuation_geomSetter_terminateSetter___block_invoke;
  v30[3] = &unk_1EA59DEE0;
  v30[4] = a4;
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = v23;
  block[1] = 3221225472;
  block[2] = __108__SCNNode_SCNModelIO___bakeNodes_folderPath_inVertex_bakeAO_quality_attenuation_geomSetter_terminateSetter___block_invoke_2;
  block[3] = &unk_1EA59DF58;
  v28 = a6;
  v29 = a5;
  v26 = a7;
  v27 = a8;
  block[4] = v20;
  block[5] = v21;
  block[6] = v22;
  block[7] = v19;
  block[8] = v30;
  block[9] = a9;
  block[10] = a10;
  dispatch_async(global_queue, block);
}

uint64_t __108__SCNNode_SCNModelIO___bakeNodes_folderPath_inVertex_bakeAO_quality_attenuation_geomSetter_terminateSetter___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_msgSend(a2, "name");
  return objc_msgSend(v2, "stringByAppendingPathComponent:", objc_msgSend(v3, "stringWithFormat:", CFSTR("AO_%@_%@.png"), v4, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString")));
}

void __108__SCNNode_SCNModelIO___bakeNodes_folderPath_inVertex_bakeAO_quality_attenuation_geomSetter_terminateSetter___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD v16[6];
  __int128 v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  char v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[7];
  _QWORD v28[6];
  _QWORD v29[6];
  _QWORD v30[6];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3052000000;
  v30[3] = __Block_byref_object_copy_;
  v30[4] = __Block_byref_object_dispose_;
  v30[5] = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3052000000;
  v29[3] = __Block_byref_object_copy_;
  v29[4] = __Block_byref_object_dispose_;
  v29[5] = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3052000000;
  v28[3] = __Block_byref_object_copy_;
  v28[4] = __Block_byref_object_dispose_;
  v28[5] = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __108__SCNNode_SCNModelIO___bakeNodes_folderPath_inVertex_bakeAO_quality_attenuation_geomSetter_terminateSetter___block_invoke_200;
  v27[3] = &unk_1EA59DF08;
  v27[4] = v30;
  v27[5] = v29;
  v27[6] = v28;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v3)
  {
    v6 = *(_QWORD *)v24;
    v7 = *MEMORY[0x1E0CC7730];
    v8 = *MEMORY[0x1E0CC7718];
    v9 = *MEMORY[0x1E0CC7748];
    v10 = 1;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v2);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (*(_BYTE *)(a1 + 96))
        {
          LODWORD(v4) = *(_DWORD *)(a1 + 88);
          LODWORD(v5) = *(_DWORD *)(a1 + 92);
          v13 = *(_QWORD *)(a1 + 40);
          if (*(_BYTE *)(a1 + 97))
            v14 = objc_msgSend(v12, "generateAmbientOcclusionVertexColorsWithQuality:attenuationFactor:objectsToConsider:vertexAttributeNamed:", v13, v7, v4, v5);
          else
            v14 = objc_msgSend(v12, "generateAmbientOcclusionTextureWithQuality:attenuationFactor:objectsToConsider:vertexAttributeNamed:materialPropertyNamed:", v13, v8, CFSTR("aoTexture"), v4, v5);
        }
        else if (*(_BYTE *)(a1 + 97))
        {
          v14 = objc_msgSend(v12, "generateLightMapVertexColorsWithLightsToConsider:objectsToConsider:vertexAttributeNamed:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v7);
        }
        else
        {
          LODWORD(v4) = *(_DWORD *)(a1 + 88);
          v14 = objc_msgSend(v12, "generateLightMapTextureWithQuality:lightsToConsider:objectsToConsider:vertexAttributeNamed:materialPropertyNamed:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v9, CFSTR("lightmapTexture"), v4);
        }
        v10 &= v14;
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v3);
  }
  else
  {
    v10 = 1;
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __108__SCNNode_SCNModelIO___bakeNodes_folderPath_inVertex_bakeAO_quality_attenuation_geomSetter_terminateSetter___block_invoke_2_206;
  v16[3] = &unk_1EA59DF30;
  v21 = v10;
  v15 = *(_QWORD *)(a1 + 56);
  v22 = *(_BYTE *)(a1 + 96);
  v16[4] = v15;
  v16[5] = v27;
  v17 = *(_OWORD *)(a1 + 64);
  v19 = v29;
  v20 = v30;
  v18 = *(_QWORD *)(a1 + 80);
  dispatch_async(MEMORY[0x1E0C80D38], v16);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v30, 8);
}

_QWORD *__108__SCNNode_SCNModelIO___bakeNodes_folderPath_inVertex_bakeAO_quality_attenuation_geomSetter_terminateSetter___block_invoke_200(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 40) = a2;
    *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 40) = a3;
    *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 40) = a4;
  }
  return result;
}

uint64_t __108__SCNNode_SCNModelIO___bakeNodes_folderPath_inVertex_bakeAO_quality_attenuation_geomSetter_terminateSetter___block_invoke_2_206(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  const __CFString *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 88))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v2 = *(void **)(a1 + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v13;
      v6 = *MEMORY[0x1E0CC7718];
      v7 = *MEMORY[0x1E0CC7748];
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v13 != v5)
            objc_enumerationMutation(v2);
          if (*(_BYTE *)(a1 + 89))
          {
            v9 = v6;
            v10 = CFSTR("aoTexture");
          }
          else
          {
            v9 = v7;
            v10 = CFSTR("lightmapTexture");
          }
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "_updateAssociatedSCNNodeWithGeometrySetter:texturePathProvider:vertexAttributeNamed:materialPropertyNamed:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v9, v10);
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v4);
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (id)initPresentationNodeWithNodeRef:(__C3DNode *)a3
{
  SCNNode *v4;
  SCNNode *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNNode;
  v4 = -[SCNNode init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)v4 + 40) |= 1u;
    v4->_node = (__C3DNode *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
    v5->_valueForKeyLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (SCNNode)initWithNodeRef:(__C3DNode *)a3
{
  id v4;
  CFTypeRef v5;
  uint64_t v6;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCNNode;
  v4 = -[SCNNode init](&v9, sel_init);
  if (v4)
  {
    v5 = CFRetain(a3);
    *((_QWORD *)v4 + 1) = v5;
    if (v5)
      C3DEntitySetObjCWrapper((uint64_t)v5, v4);
    *((_DWORD *)v4 + 50) = 0;
    *((_DWORD *)v4 + 62) = 0;
    objc_msgSend(v4, "_syncObjCModel");
    objc_msgSend(v4, "_syncObjCAnimations");
    if (C3DNodeGetChildNodesCount(*((_QWORD *)v4 + 1)))
    {
      *((_QWORD *)v4 + 3) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *((_QWORD *)v4 + 1);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __27__SCNNode_initWithNodeRef___block_invoke;
      v8[3] = &unk_1EA5A2308;
      v8[4] = v4;
      C3DNodeApplyChildren(v6, (uint64_t)v8);
    }
  }
  return (SCNNode *)v4;
}

uint64_t __27__SCNNode_initWithNodeRef___block_invoke(uint64_t a1, uint64_t a2)
{
  SCNNode *v3;

  v3 = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", a2);
  -[SCNNode _setParent:](v3, "_setParent:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", v3);
}

- (void)_initChildNodesArray
{
  __C3DScene *v3;
  uint64_t v4;
  __C3DNode *node;
  _QWORD v6[5];

  v3 = -[SCNNode sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  node = self->_node;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__SCNNode__initChildNodesArray__block_invoke;
  v6[3] = &unk_1EA5A2308;
  v6[4] = self;
  C3DNodeApplyChildren((uint64_t)node, (uint64_t)v6);
  if (v4)
    C3DSceneUnlock(v4);
}

void __31__SCNNode__initChildNodesArray__block_invoke(uint64_t a1, uint64_t a2)
{
  SCNNode *v3;
  SCNNode *v4;

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) & 1) != 0)
    v3 = -[SCNNode initPresentationNodeWithNodeRef:]([SCNNode alloc], "initPresentationNodeWithNodeRef:", a2);
  else
    v3 = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", a2);
  v4 = v3;
  -[SCNNode _setParent:](v3, "_setParent:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", v4);

}

+ (SCNNode)nodeWithGeometry:(SCNGeometry *)geometry
{
  SCNNode *v4;

  v4 = (SCNNode *)objc_msgSend(a1, "node");
  -[SCNNode setGeometry:](v4, "setGeometry:", geometry);
  return v4;
}

- (void)dealloc
{
  NSMutableArray *childNodes;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __C3DScene *v8;
  uint64_t v9;
  __int16 v10;
  __C3DNode *node;
  objc_super v12;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)self + 40) & 1) == 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    childNodes = self->_childNodes;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](childNodes, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(childNodes);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "_setParent:", 0);
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](childNodes, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v5);
    }
    if (self->_rendererDelegate)
    {
      v8 = -[SCNNode sceneRef](self, "sceneRef");
      if (v8)
      {
        v9 = (uint64_t)v8;
        C3DSceneLock((uint64_t)v8);
        C3DNodeSetRendererDelegate((uint64_t)self->_node, 0);
        C3DSceneUnlock(v9);
      }
      else
      {
        C3DNodeSetRendererDelegate((uint64_t)self->_node, 0);
      }
    }
  }
  v10 = *((_WORD *)self + 22);
  if ((v10 & 0x200) != 0)
  {
    -[SCNPhysicsField _removeOwner](-[SCNNode physicsField](self, "physicsField"), "_removeOwner");
    v10 = *((_WORD *)self + 22);
  }
  if ((v10 & 0x100) != 0)
    -[SCNPhysicsBody _ownerWillDie](-[SCNNode physicsBody](self, "physicsBody"), "_ownerWillDie");

  self->_components = 0;
  node = self->_node;
  if (node)
  {
    if ((*((_BYTE *)self + 40) & 1) == 0)
    {
      C3DEntitySetObjCWrapper((uint64_t)node, 0);
      node = self->_node;
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __18__SCNNode_dealloc__block_invoke;
    v13[3] = &__block_descriptor_40_e8_v16__0d8l;
    v13[4] = node;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, 0, v13);
  }

  free(self->_fixedBoundingBoxExtrema);
  v12.receiver = self;
  v12.super_class = (Class)SCNNode;
  -[SCNNode dealloc](&v12, sel_dealloc);
}

void __18__SCNNode_dealloc__block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (void)setAttribute:(id)a3 forKey:(id)a4
{
  __C3DScene *v7;
  uint64_t v8;

  v7 = -[SCNNode sceneRef](self, "sceneRef");
  if (v7)
  {
    v8 = (uint64_t)v7;
    C3DSceneLock((uint64_t)v7);
    C3DEntitySetAttribute((CFTypeRef *)-[SCNNode __CFObject](self, "__CFObject"), a4, (const __CFDictionary *)a3);
    C3DSceneUnlock(v8);
  }
  else
  {
    C3DEntitySetAttribute((CFTypeRef *)-[SCNNode __CFObject](self, "__CFObject"), a4, (const __CFDictionary *)a3);
  }
}

- (id)attributeForKey:(id)a3
{
  __C3DScene *v5;
  uint64_t v6;
  const __CFDictionary *v7;

  v5 = -[SCNNode sceneRef](self, "sceneRef");
  v6 = (uint64_t)v5;
  if (v5)
    C3DSceneLock((uint64_t)v5);
  v7 = C3DEntityGetAttribute((uint64_t)-[SCNNode __CFObject](self, "__CFObject"), a3);
  if (v6)
    C3DSceneUnlock(v6);
  return v7;
}

- (SCNNode)presentationNode
{
  SCNNode *v2;

  v2 = self;
  if ((*((_BYTE *)self + 40) & 1) == 0)
  {
    self = self->_presentationInstance;
    if (!self)
    {
      self = -[SCNNode initPresentationNodeWithNodeRef:]([SCNNode alloc], "initPresentationNodeWithNodeRef:", v2->_node);
      v2->_presentationInstance = self;
    }
  }
  return self;
}

- (void)_dump:(id)a3
{
  const char *v5;
  NSString *v6;
  uint64_t v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (const char *)objc_msgSend(a3, "cStringUsingEncoding:", objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
  v6 = -[SCNNode description](self, "description");
  printf("%s%s {\n", v5, -[NSString cStringUsingEncoding:](v6, "cStringUsingEncoding:", objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding")));
  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t%@"), a3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = -[SCNNode childNodes](self, "childNodes");
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "_dump:", v7);
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }
  printf("%s}\n", (const char *)objc_msgSend(a3, "cStringUsingEncoding:", objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding")));
}

- (void)dump
{
  NSLog(CFSTR("dump node tree (%@)"), -[SCNNode name](self, "name"));
  -[SCNNode _dump:](self, "_dump:", &stru_1EA5A6480);
  NSLog(CFSTR("------------------------------------------------------"));
}

+ (id)_dumpNodeTree:(id)a3 tab:(id)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB3940];
  if (objc_msgSend(a3, "name"))
    v8 = objc_msgSend(a3, "name");
  else
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%p>"), a3);
  v9 = (void *)objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@\n"), a4, v8);
  v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t%@"), a4);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = (void *)objc_msgSend(a3, "childNodes");
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v9 = (void *)objc_msgSend(v9, "stringByAppendingString:", objc_msgSend(a1, "_dumpNodeTree:tab:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++), v10));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }
  return v9;
}

- (id)_dumpTree
{
  return (id)objc_msgSend((id)objc_opt_class(), "_dumpNodeTree:tab:", self, &stru_1EA5A6480);
}

- (void)_setAttributes:(id)a3
{
  os_unfair_lock_s *p_valueForKeyLock;

  p_valueForKeyLock = &self->_valueForKeyLock;
  os_unfair_lock_lock(&self->_valueForKeyLock);

  self->_valueForKey = (NSMutableDictionary *)a3;
  os_unfair_lock_unlock(p_valueForKeyLock);
}

uint64_t __24__SCNNode_copyWithZone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", a3, a2);
}

- (BOOL)_isAReference
{
  return 0;
}

+ (SCNNode)nodeWithNodeRef:(__C3DNode *)a3
{
  SCNNode *result;

  result = (SCNNode *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
    return (SCNNode *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithNodeRef:", a3);
  return result;
}

- (id)objectInChildNodesWithName:(id)a3
{
  return -[SCNNode childNodeWithName:recursively:](self, "childNodeWithName:recursively:", a3, 1);
}

- (BOOL)_enumerateChildNodesUsingBlock:(id)a3
{
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  (*((void (**)(id, SCNNode *, char *))a3 + 2))(a3, self, &v15);
  if (!v15)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = -[SCNNode childNodes](self, "childNodes", 0);
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          v15 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "_enumerateChildNodesUsingBlock:", a3);
          if ((v15 & 1) != 0)
            return 1;
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        if (v8)
          continue;
        break;
      }
    }
  }
  return v15 != 0;
}

- (void)enumerateChildNodesUsingBlock:(void *)block
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = -[SCNNode childNodes](self, "childNodes", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v7)
        objc_enumerationMutation(v4);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8), "_enumerateChildNodesUsingBlock:", block) & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v6)
          goto LABEL_3;
        return;
      }
    }
  }
}

- (void)enumerateHierarchyUsingBlock:(void *)block
{
  char v5;

  v5 = 0;
  (*((void (**)(void *, SCNNode *, char *))block + 2))(block, self, &v5);
  if (!v5)
    -[SCNNode enumerateChildNodesUsingBlock:](self, "enumerateChildNodesUsingBlock:", block);
}

- (void)_childNodesWithAttribute:(Class)a3 output:(id)a4 recursively:(BOOL)a5
{
  _BOOL4 v5;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v5 = a5;
  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = -[SCNNode childNodes](self, "childNodes", 0);
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((Class)objc_opt_class() == a3 && objc_msgSend(v13, "camera")
          || (Class)objc_opt_class() == a3 && objc_msgSend(v13, "light")
          || (Class)objc_opt_class() == a3 && objc_msgSend(v13, "geometry")
          || (Class)objc_opt_class() == a3 && objc_msgSend(v13, "morpher")
          || (Class)objc_opt_class() == a3 && objc_msgSend(v13, "skinner"))
        {
          objc_msgSend(a4, "addObject:", v13);
        }
        if (v5)
          objc_msgSend(v13, "_childNodesWithAttribute:output:recursively:", a3, a4, 1);
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }
}

- (id)childNodesWithAttribute:(Class)a3 recursively:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;

  v4 = a4;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  -[SCNNode _childNodesWithAttribute:output:recursively:](self, "_childNodesWithAttribute:output:recursively:", a3, v7, v4);
  return v7;
}

- (id)objectInChildNodesWithAttribute:(id)a3 firstOnly:(BOOL)a4
{
  void *v6;
  _QWORD v8[6];
  _QWORD v9[3];
  BOOL v10;

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = a4;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__SCNNode_objectInChildNodesWithAttribute_firstOnly___block_invoke;
  v8[3] = &unk_1EA5A2330;
  v8[4] = a3;
  v8[5] = v9;
  -[SCNNode _childNodesPassingTest:recursively:output:](self, "_childNodesPassingTest:recursively:output:", v8, 1, v6);
  _Block_object_dispose(v9, 8);
  return v6;
}

uint64_t __53__SCNNode_objectInChildNodesWithAttribute_firstOnly___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kMeshKey"))
    && objc_msgSend(a2, "geometry")
    || objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kCameraKey"))
    && objc_msgSend(a2, "camera")
    || (result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kLightKey")), (_DWORD)result)
    && (result = objc_msgSend(a2, "light")) != 0)
  {
    result = 1;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a3 = 1;
  }
  return result;
}

- (id)childNodeWithName:(id)a3
{
  return -[SCNNode childNodeWithName:recursively:](self, "childNodeWithName:recursively:", a3, 1);
}

- (id)jsChildNodesWithAttribute:(id)a3
{
  return -[SCNNode objectInChildNodesWithAttribute:firstOnly:](self, "objectInChildNodesWithAttribute:firstOnly:", a3, 0);
}

- (void)_removeComponentWithType:(int64_t)a3
{
  SCNNodeComponent *components;
  SCNNodeComponent *v6;
  SCNNodeComponent *v7;
  SCNNodeComponent *v8;
  SCNNodeComponent *v9;

  components = self->_components;
  if (components)
  {
    if (-[SCNNodeComponent type](self->_components, "type") == a3)
    {
      v6 = 0;
LABEL_7:
      v9 = -[SCNNodeComponent next](components, "next");
      if (v6)
      {
        -[SCNNodeComponent setNext:](v6, "setNext:", v9);
      }
      else
      {
        self->_components = v9;

      }
      *((_WORD *)self + 22) &= (unsigned __int16)~(1 << a3) | 0xE000;
    }
    else
    {
      v7 = components;
      while (1)
      {
        v8 = -[SCNNodeComponent next](v7, "next");
        if (!v8)
          break;
        components = v8;
        v6 = v7;
        v7 = v8;
        if (-[SCNNodeComponent type](v8, "type") == a3)
          goto LABEL_7;
      }
    }
  }
}

- (NSArray)hitTestWithSegmentFromPoint:(SCNVector3)pointA toPoint:(SCNVector3)pointB options:(NSDictionary *)options
{
  __C3DScene *v7;
  __n128 *v8;
  id v9;
  SCNNode *v10;
  __C3DNode *v11;
  id v12;
  NSArray *v13;
  __int128 v14;
  __n128 v15;
  const void *HitTestResultsWithSegment;
  float v18;
  float v19;
  float y;
  float x;
  __n128 v22;
  __int128 v23;
  float32x4_t v24[2];

  y = pointB.y;
  x = pointB.x;
  v18 = pointA.y;
  v19 = pointA.x;
  v7 = -[SCNNode sceneRef](self, "sceneRef");
  if (v7)
  {
    v8 = (__n128 *)v7;
    C3DSceneLock((uint64_t)v7);
    memset(v24, 0, sizeof(v24));
    if (options)
    {
      v9 = -[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("kHitTestRootNode"));
      v10 = self;
      if (v9)
        v10 = -[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("kHitTestRootNode"));
      v11 = -[SCNNode nodeRef](v10, "nodeRef");
      v12 = (id)-[NSDictionary mutableCopy](options, "mutableCopy");
    }
    else
    {
      v11 = -[SCNNode nodeRef](self, "nodeRef");
      v12 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    }
    objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("kHitTestRootNode"));
    -[SCNNode simdConvertPosition:toNode:](self, "simdConvertPosition:toNode:", 0, COERCE_DOUBLE(__PAIR64__(LODWORD(v18), LODWORD(v19))));
    v23 = v14;
    -[SCNNode simdConvertPosition:toNode:](self, "simdConvertPosition:toNode:", 0, COERCE_DOUBLE(__PAIR64__(LODWORD(y), LODWORD(x))));
    v22 = v15;
    C3DRay3Make(v24, &v23, &v22);
    HitTestResultsWithSegment = (const void *)C3DSceneCreateHitTestResultsWithSegment(v8, v24, (const __CFDictionary *)v12);
    v13 = +[SCNHitTestResult hitTestResultsFromHitTestResultRef:](SCNHitTestResult, "hitTestResultsFromHitTestResultRef:", HitTestResultsWithSegment);
    if (HitTestResultsWithSegment)
      CFRelease(HitTestResultsWithSegment);
    C3DSceneUnlock((uint64_t)v8);
  }
  else
  {
    v13 = 0;
  }
  if (-[NSArray count](v13, "count"))
    return v13;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)_updateTransform
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. cannot update matrix without affine", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (int64_t)rotationRepresentation
{
  return ((unint64_t)*((unsigned __int8 *)self + 41) >> 4) & 3;
}

- (SCNQuaternion)worldOrientation
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  SCNQuaternion result;

  -[SCNNode simdWorldOrientation](self, "simdWorldOrientation");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  result.w = v8;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

- (void)setWorldOrientation:(SCNQuaternion)worldOrientation
{
  float y;

  y = worldOrientation.y;
  -[SCNNode setSimdWorldOrientation:](self, "setSimdWorldOrientation:", *(double *)&worldOrientation.x);
}

- (SCNQuaternion)orientation
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  SCNQuaternion result;

  -[SCNNode simdOrientation](self, "simdOrientation");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  result.w = v8;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

- (void)setOrientation:(SCNQuaternion)orientation
{
  float y;

  y = orientation.y;
  -[SCNNode setSimdOrientation:](self, "setSimdOrientation:", *(double *)&orientation.x);
}

- (double)_euler
{
  char v2;
  float32x4_t v3;
  float32x4_t v4;
  int8x16_t v5;
  float v6;
  __int128 v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  int *v13;
  float v14;
  uint64_t v15;
  float v17;
  float v18;
  float v19;

  v2 = *(_BYTE *)(a1 + 41);
  if ((v2 & 1) == 0)
  {
    objc_msgSend((id)a1, "_updateAffine");
    v2 = *(_BYTE *)(a1 + 41);
  }
  if ((v2 & 0x30) != 0)
  {
    objc_msgSend((id)a1, "_quaternion");
    v4 = v3;
    v5 = (int8x16_t)vmulq_f32(v3, v3);
    v6 = vaddv_f32(vadd_f32(*(float32x2_t *)v5.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL)));
    *(_QWORD *)&v7 = 0;
    if (v6 != 0.0)
    {
      v8 = v4.f32[2];
      v9 = v4.f32[1];
      v10 = v4.f32[3];
      v11 = vmlas_n_f32(vmuls_lane_f32(-v4.f32[1], v4, 3), v4.f32[2], v4.f32[0]) / v6;
      if (v11 <= 0.499)
      {
        if (v11 >= -0.499)
        {
          v14 = *(float *)&v5.i32[1];
          v15 = v5.i64[1];
          v17 = v4.f32[0];
          v18 = *(float *)v5.i32;
          atan2f((float)((float)(v4.f32[2] * v4.f32[3]) + (float)(v4.f32[0] * v4.f32[1]))+ (float)((float)(v4.f32[2] * v4.f32[3]) + (float)(v4.f32[0] * v4.f32[1])), *(float *)&v5.i32[3] + (float)((float)(*(float *)v5.i32 - *(float *)&v5.i32[1]) - *(float *)&v5.i32[2]));
          v19 = atan2f((float)((float)(v17 * v10) + (float)(v9 * v8)) + (float)((float)(v17 * v10) + (float)(v9 * v8)), *((float *)&v15 + 1) + (float)(*(float *)&v15 + (float)((float)-v18 - v14)));
          *(_QWORD *)&v7 = __PAIR64__(COERCE_UNSIGNED_INT(asinf(v11 * -2.0)), LODWORD(v19));
          return *(double *)&v7;
        }
        *(float *)&v7 = atan2f(v4.f32[0], v4.f32[3]) * -2.0;
        v13 = &dword_1DD007D08;
      }
      else
      {
        v12 = atan2f(v4.f32[0], v4.f32[3]);
        *(float *)&v7 = v12 + v12;
        v13 = &dword_1DD007D0C;
      }
      DWORD1(v7) = *v13;
    }
  }
  else
  {
    v7 = *(_OWORD *)(a1 + 128);
  }
  return *(double *)&v7;
}

- (SCNVector3)eulerAngles
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  SCNVector3 result;

  -[SCNNode simdEulerAngles](self, "simdEulerAngles");
  v4 = v3;
  v6 = v5;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

- (void)setEulerAngles:(SCNVector3)eulerAngles
{
  float y;

  y = eulerAngles.y;
  -[SCNNode setSimdEulerAngles:](self, "setSimdEulerAngles:", *(double *)&eulerAngles.x);
}

- (SCNVector3)position
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  SCNVector3 result;

  -[SCNNode simdPosition](self, "simdPosition");
  v4 = v3;
  v6 = v5;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

- (void)setScale:(SCNVector3)scale
{
  float y;

  y = scale.y;
  -[SCNNode setSimdScale:](self, "setSimdScale:", *(double *)&scale.x);
}

- (SCNVector3)scale
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  SCNVector3 result;

  -[SCNNode simdScale](self, "simdScale");
  v4 = v3;
  v6 = v5;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

- (void)setRotation:(SCNVector4)rotation
{
  float y;

  y = rotation.y;
  -[SCNNode setSimdRotation:](self, "setSimdRotation:", *(double *)&rotation.x);
}

- (SCNVector4)rotation
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  SCNVector4 result;

  -[SCNNode simdRotation](self, "simdRotation");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  result.w = v8;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

+ (id)keyPathsForValuesAffectingPosition
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("transform"), 0);
}

+ (id)keyPathsForValuesAffectingTransform
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("position"), CFSTR("rotation"), CFSTR("eulerAngles"), CFSTR("orientation"), CFSTR("scale"), 0);
}

+ (id)keyPathsForValuesAffectingRotation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("eulerAngles"), CFSTR("orientation"), CFSTR("transform"), 0);
}

+ (id)keyPathsForValuesAffectingEulerAngles
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("rotation"), CFSTR("orientation"), CFSTR("transform"), 0);
}

+ (id)keyPathsForValuesAffectingOrientation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("rotation"), CFSTR("eulerAngles"), CFSTR("transform"), 0);
}

+ (id)keyPathsForValuesAffectingScale
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("transform"), 0);
}

- (SCNMatrix4)transform
{
  SCNMatrix4 *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  result = (SCNMatrix4 *)-[SCNNode simdTransform](self, "simdTransform");
  *(_OWORD *)&retstr->m11 = v5;
  *(_OWORD *)&retstr->m21 = v6;
  *(_OWORD *)&retstr->m31 = v7;
  *(_OWORD *)&retstr->m41 = v8;
  return result;
}

- (void)setWorldPosition:(SCNVector3)worldPosition
{
  float y;

  y = worldPosition.y;
  -[SCNNode setSimdWorldPosition:](self, "setSimdWorldPosition:", *(double *)&worldPosition.x);
}

- (SCNVector3)worldPosition
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  SCNVector3 result;

  -[SCNNode simdWorldPosition](self, "simdWorldPosition");
  v4 = v3;
  v6 = v5;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

- (void)setWorldTransform:(SCNMatrix4 *)worldTransform
{
  -[SCNNode setSimdWorldTransform:](self, "setSimdWorldTransform:", *(double *)&worldTransform->m11, *(double *)&worldTransform->m21, *(double *)&worldTransform->m31, *(double *)&worldTransform->m41);
}

- (SCNMatrix4)worldTransform
{
  SCNMatrix4 *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  result = (SCNMatrix4 *)-[SCNNode simdWorldTransform](self, "simdWorldTransform");
  *(_OWORD *)&retstr->m11 = v5;
  *(_OWORD *)&retstr->m21 = v6;
  *(_OWORD *)&retstr->m31 = v7;
  *(_OWORD *)&retstr->m41 = v8;
  return result;
}

- (void)setPivot:(SCNMatrix4 *)pivot
{
  -[SCNNode setSimdPivot:](self, "setSimdPivot:", *(double *)&pivot->m11, *(double *)&pivot->m21, *(double *)&pivot->m31, *(double *)&pivot->m41);
}

- (SCNMatrix4)pivot
{
  SCNMatrix4 *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  result = (SCNMatrix4 *)-[SCNNode simdPivot](self, "simdPivot");
  *(_OWORD *)&retstr->m11 = v5;
  *(_OWORD *)&retstr->m21 = v6;
  *(_OWORD *)&retstr->m31 = v7;
  *(_OWORD *)&retstr->m41 = v8;
  return result;
}

void __29__SCNNode_setMovabilityHint___block_invoke(uint64_t a1)
{
  C3DNodeSetMovability(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_DWORD *)(a1 + 40));
}

- (BOOL)isHittable
{
  return C3DNodeGetHittable((uint64_t)self->_node);
}

- (void)setHittable:(BOOL)a3
{
  C3DNodeSetHittable((uint64_t)self->_node, a3);
}

void __26__SCNNode_setCastsShadow___block_invoke(uint64_t a1)
{
  C3DNodeSetCastsShadow(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

void __31__SCNNode_setUsesDepthPrePass___block_invoke(uint64_t a1)
{
  C3DNodeSetUsesDepthPrePass(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

__C3DCullingSystem *__30__SCNNode_setCategoryBitMask___block_invoke(uint64_t a1)
{
  return C3DNodeSetCategoryBitMask(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40));
}

void __21__SCNNode_setHidden___block_invoke(uint64_t a1)
{
  C3DNodeSetHidden(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

void __29__SCNNode_setRenderingOrder___block_invoke(uint64_t a1)
{
  C3DNodeSetRenderingOrder(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (const __CFDictionary *)*(int *)(a1 + 40));
}

- (id)mutableChildNodes
{
  return self->_childNodes;
}

void __20__SCNNode_setLight___block_invoke(uint64_t a1)
{
  C3DNodeSetLight(*(float32x4_t **)(*(_QWORD *)(a1 + 32) + 8), (const __CFDictionary *)objc_msgSend(*(id *)(a1 + 40), "lightRef"));
}

- (BOOL)isJoint
{
  return (*((unsigned __int8 *)self + 41) >> 3) & 1;
}

- (void)setIsJoint:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 41) = *((_BYTE *)self + 41) & 0xF7 | v3;
}

void __22__SCNNode_setSkinner___block_invoke(uint64_t a1)
{
  C3DNodeSetSkinner(*(_QWORD **)(*(_QWORD *)(a1 + 32) + 8), (uint64_t *)objc_msgSend(*(id *)(a1 + 40), "skinnerRef"));
}

void __22__SCNNode_setMorpher___block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t *v3;

  v2 = (const void *)objc_msgSend(*(id *)(a1 + 32), "morphRef");
  if (v2)
    v3 = (uint64_t *)C3DMorpherCreateWith(v2);
  else
    v3 = 0;
  C3DNodeSetMorpher(*(CFTypeRef **)(*(_QWORD *)(a1 + 40) + 8), v3);
  if (v3)
    CFRelease(v3);
}

void __36__SCNNode_setPostMorphingDeformers___block_invoke(uint64_t a1)
{
  C3DNodeSetPostMorphingDeformers(*(_QWORD **)(*(_QWORD *)(a1 + 32) + 8), *(const __CFArray **)(a1 + 40));
}

void __36__SCNNode_setPostSkinningDeformers___block_invoke(uint64_t a1)
{
  C3DNodeSetPostSkinningDeformers(*(_QWORD **)(*(_QWORD *)(a1 + 32) + 8), *(const __CFArray **)(a1 + 40));
}

- (void)setFilters:(NSArray *)filters
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (-[SCNNode filters](self, "filters") != filters)
  {
    -[SCNNode _setComponent:withType:](self, "_setComponent:withType:", (id)-[NSArray copy](filters, "copy"), 5);
    v5 = -[SCNNode sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __22__SCNNode_setFilters___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = self;
    v6[5] = filters;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

void __22__SCNNode_setFilters___block_invoke(uint64_t a1)
{
  C3DNodeSetFilters(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(CFArrayRef *)(a1 + 40));
}

- (NSArray)filters
{
  __C3DScene *v4;
  uint64_t v5;
  NSArray *Filters;

  if ((*((_BYTE *)self + 40) & 1) == 0)
    return (NSArray *)-[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 5);
  v4 = -[SCNNode sceneRef](self, "sceneRef");
  if (!v4)
    return (NSArray *)C3DNodeGetFilters((uint64_t)self->_node);
  v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  Filters = (NSArray *)C3DNodeGetFilters((uint64_t)self->_node);
  C3DSceneUnlock(v5);
  return Filters;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  BOOL v14;
  float v15;
  float v16;
  float v17;
  NSUInteger v18;
  const __CFString *v19;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  v5 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), NSStringFromClass(v4), self);
  if (-[NSString length](-[SCNNode name](self, "name"), "length"))
    objc_msgSend(v5, "appendFormat:", CFSTR(" '%@'"), -[SCNNode name](self, "name"));
  -[SCNNode position](self, "position");
  if (v6 != 0.0 || v7 != 0.0 || v8 != 0.0)
    objc_msgSend(v5, "appendFormat:", CFSTR(" pos(%f %f %f)"), v6, v7, v8);
  -[SCNNode rotation](self, "rotation");
  v14 = v11 == 0.0 && v10 == 0.0 && v9 == 0.0;
  if (!v14 && v12 != 0.0)
    objc_msgSend(v5, "appendFormat:", CFSTR(" rot(%f %f %f %f)"), v9, v10, v11, v12);
  -[SCNNode scale](self, "scale");
  if (v15 != 1.0 || v16 != 1.0 || v17 != 1.0)
    objc_msgSend(v5, "appendFormat:", CFSTR(" scale(%f %f %f)"), v15, v16, v17);
  if (-[SCNNode light](self, "light") || -[SCNNode camera](self, "camera") || -[SCNNode geometry](self, "geometry"))
    objc_msgSend(v5, "appendString:", CFSTR(" |"));
  if (-[SCNNode light](self, "light"))
    objc_msgSend(v5, "appendFormat:", CFSTR(" light=%@"), -[SCNNode light](self, "light"));
  if (-[SCNNode camera](self, "camera"))
    objc_msgSend(v5, "appendFormat:", CFSTR(" camera=%@"), -[SCNNode camera](self, "camera"));
  if (-[SCNNode geometry](self, "geometry"))
    objc_msgSend(v5, "appendFormat:", CFSTR(" geometry=%@"), -[SCNNode geometry](self, "geometry"));
  v18 = -[NSArray count](-[SCNNode childNodes](self, "childNodes"), "count");
  if (v18 == 1)
  {
    v19 = CFSTR(" | 1 child");
  }
  else
  {
    if (v18)
    {
      objc_msgSend(v5, "appendFormat:", CFSTR(" | %d children"), v18);
      goto LABEL_36;
    }
    v19 = CFSTR(" | no child");
  }
  objc_msgSend(v5, "appendString:", v19);
LABEL_36:
  objc_msgSend(v5, "appendString:", CFSTR(">"));
  return (NSString *)v5;
}

void __31__SCNNode_setRendererDelegate___block_invoke(uint64_t a1)
{
  C3DNodeSetRendererDelegate(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(const __CFDictionary **)(a1 + 40));
}

- (void)renderInContext:(void *)a3
{
  SCNRenderer *v5;
  uint64_t v6;

  v5 = +[SCNRenderer rendererWithContext:options:](SCNRenderer, "rendererWithContext:options:", a3, 0);
  v6 = objc_msgSend(MEMORY[0x1E0CD0958], "currentContext");
  objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:", a3);
  C3DEngineContextRenderNodeTree((uint64_t)-[SCNRenderer _engineContext](v5, "_engineContext"), 0, -[SCNNode nodeRef](self, "nodeRef"));
  objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:", v6);
}

- (BOOL)parseSpecialKey:(id)a3 withPath:(id)a4 intoDestination:(id *)a5
{
  SCNNode *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;

  if (!objc_msgSend(a3, "hasPrefix:", CFSTR("/"), a4))
  {
    v9 = objc_msgSend(a3, "rangeOfString:", CFSTR("["));
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_12;
    v10 = v9;
    v11 = v9 + 1;
    if (v9 + 1 >= (unint64_t)objc_msgSend(a3, "length"))
      goto LABEL_12;
    v12 = (__CFString *)objc_msgSend(a3, "substringToIndex:", v10);
    v13 = (void *)objc_msgSend(a3, "substringFromIndex:", v11);
    v14 = objc_msgSend(v13, "rangeOfString:", CFSTR("]"));
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_12;
    v15 = objc_msgSend((id)objc_msgSend(v13, "substringToIndex:", v14), "intValue");
    if ((-[__CFString isEqualToString:](v12, "isEqualToString:", &stru_1EA5A6480) & 1) != 0
      || -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("nodes")))
    {
      v12 = CFSTR("childNodes");
    }
    v16 = (void *)-[SCNNode valueForKey:](self, "valueForKey:", v12);
    if (objc_msgSend(v16, "count") <= (unint64_t)v15)
    {
LABEL_12:
      LOBYTE(v8) = 0;
      return (char)v8;
    }
    v8 = (SCNNode *)objc_msgSend(v16, "objectAtIndex:", v15);
    goto LABEL_3;
  }
  v8 = -[SCNNode childNodeWithName:recursively:](self, "childNodeWithName:recursively:", objc_msgSend(a3, "substringWithRange:", 1, objc_msgSend(a3, "length") - 1), 1);
  if (v8)
  {
LABEL_3:
    *a5 = v8;
    LOBYTE(v8) = 1;
  }
  return (char)v8;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  id v14;

  if (!objc_msgSend(a3, "length"))
    return 0;
  v13 = 0;
  v14 = 0;
  v12 = 0;
  SCNKitSplitKVCPath(a3, &v13, &v12);
  if (-[SCNNode parseSpecialKey:withPath:intoDestination:](self, "parseSpecialKey:withPath:intoDestination:", v13, a3, &v14)&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v14, "copyAnimationChannelForKeyPath:animation:", v12, a4);
    if (v7)
    {
      v8 = v7;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count") + 1);
      objc_msgSend(v9, "addObject:", v13);
      objc_msgSend(v9, "addObjectsFromArray:", v8);

      return v9;
    }
    return 0;
  }
  v14 = (id)-[SCNNode valueForKey:](self, "valueForKey:", v13);
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
  v10 = (void *)objc_msgSend(v14, "copyAnimationChannelForKeyPath:animation:", v12, a4);
  if (!v10)
    return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count") + 1);
  objc_msgSend(v9, "addObject:", v13);
  objc_msgSend(v9, "addObjectsFromArray:", v10);

  return v9;
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  const __CFString *v7;
  const __CFString *v8;
  __C3DScene *v9;
  objc_super v10;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t v13;

  if (objc_msgSend(a4, "hasPrefix:", CFSTR("filters.")))
  {
    v12 = 0;
    v13 = 0;
    SCNKitSplitKVCPath(a4, &v13, &v12);
    if (v12)
    {
      v7 = C3DCFTypeCopyModelInfoAtPath((float32x4_t *)self->_node, (CFStringRef)a4, 0);
      if (v7)
      {
        v8 = v7;
        if (C3DModelTargetGetTargetAddress((uint64_t)v7))
        {
          v9 = -[SCNNode sceneRef](self, "sceneRef");
          v11[0] = MEMORY[0x1E0C809B0];
          v11[1] = 3221225472;
          v11[2] = __31__SCNNode_setValue_forKeyPath___block_invoke;
          v11[3] = &unk_1EA5A2358;
          v11[4] = a4;
          v11[5] = a3;
          v11[6] = v12;
          v11[7] = self;
          +[SCNTransaction postCommandWithContext:object:keyPath:applyBlock:](SCNTransaction, "postCommandWithContext:object:keyPath:applyBlock:", v9, self, a4, v11);
        }
        CFRelease(v8);
      }
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SCNNode;
    -[SCNNode setValue:forKeyPath:](&v10, sel_setValue_forKeyPath_, a3, a4);
  }
}

uint64_t __31__SCNNode_setValue_forKeyPath___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    if (*(_QWORD *)(result + 40))
    {
      v12 = 0;
      v13 = 0;
      SCNKitSplitKVCPath(*(void **)(result + 48), &v13, &v12);
      v8 = 0u;
      v9 = 0u;
      v10 = 0u;
      v11 = 0u;
      v2 = (void *)objc_msgSend(*(id *)(v1 + 56), "filters", 0);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v14, 16);
      if (result)
      {
        v3 = result;
        v4 = *(_QWORD *)v9;
        while (2)
        {
          v5 = 0;
          do
          {
            if (*(_QWORD *)v9 != v4)
              objc_enumerationMutation(v2);
            v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v5);
            v7 = (void *)objc_msgSend(v6, "name");
            if (objc_msgSend(v7, "isEqualToString:", v13))
              return objc_msgSend(v6, "setValue:forKey:", *(_QWORD *)(v1 + 40), v12);
            ++v5;
          }
          while (v3 != v5);
          result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v14, 16);
          v3 = result;
          if (result)
            continue;
          break;
        }
      }
    }
  }
  return result;
}

- (id)valueForKeyPath:(id)a3
{
  NSArray *v5;
  id result;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  if (objc_msgSend(a3, "hasPrefix:", CFSTR("filters.")))
  {
    v17 = 0;
    v18 = 0;
    SCNKitSplitKVCPath((void *)objc_msgSend(a3, "substringFromIndex:", objc_msgSend(CFSTR("filters."), "length")), &v18, &v17);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = -[SCNNode filters](self, "filters");
    result = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    if (result)
    {
      v7 = result;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
          v11 = (void *)objc_msgSend(v10, "name");
          if ((objc_msgSend(v11, "isEqualToString:", v18) & 1) != 0)
            return (id)objc_msgSend(v10, "valueForKey:", v17);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        result = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
        v7 = result;
        if (result)
          continue;
        break;
      }
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SCNNode;
    return -[SCNNode valueForKeyPath:](&v12, sel_valueForKeyPath_, a3);
  }
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  __C3DScene *v5;
  uint64_t v6;
  const __CFDictionary *ValueForKey;
  void *v8;
  float32x2_t *Bytes;
  int Type;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v17;

  if ((*((_BYTE *)self + 40) & 1) == 0)
    goto LABEL_9;
  v5 = -[SCNNode sceneRef](self, "sceneRef");
  v6 = (uint64_t)v5;
  if (v5)
    C3DSceneLock((uint64_t)v5);
  ValueForKey = C3DEntityGetValueForKey((uint64_t)self->_node, a3);
  v8 = ValueForKey;
  if (ValueForKey)
  {
    Bytes = (float32x2_t *)C3DValueGetBytes((uint64_t)ValueForKey);
    Type = C3DValueGetType((uint64_t)v8);
    v8 = (void *)SCNNSValueFromTypedBytes(Bytes, Type, v11, v12, v13, v14);
  }
  if (v6)
    C3DSceneUnlock(v6);
  if (!v8)
  {
LABEL_9:
    v17 = 0;
    if (-[SCNNode parseSpecialKey:withPath:intoDestination:](self, "parseSpecialKey:withPath:intoDestination:", a3, a3, &v17))
    {
      return v17;
    }
    else
    {
      os_unfair_lock_lock(&self->_valueForKeyLock);
      v15 = (id)-[NSMutableDictionary objectForKey:](self->_valueForKey, "objectForKey:", a3);
      os_unfair_lock_unlock(&self->_valueForKeyLock);
      if (v15)
        return v15;
      else
        return 0;
    }
  }
  return v8;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  __int16 *v7;
  NSMutableDictionary *valueForKey;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  __C3DNode *node;
  uint64_t v13;
  __C3DScene *v14;
  _QWORD v15[7];

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SCNNode setValue:forUndefinedKey:].cold.1();
  }
  else
  {
    v7 = (__int16 *)SCNCopyValueFromObjCProperty(self, a4);
    os_unfair_lock_lock(&self->_valueForKeyLock);
    valueForKey = self->_valueForKey;
    if (a3)
    {
      if (!valueForKey)
      {
        valueForKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        self->_valueForKey = valueForKey;
      }
      -[NSMutableDictionary setObject:forKey:](valueForKey, "setObject:forKey:", a3, a4);
    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](valueForKey, "removeObjectForKey:", a4);
    }
    os_unfair_lock_unlock(&self->_valueForKeyLock);
    v10 = SCNCopyValueFromObjCProperty(self, a4);
    v11 = (void *)v10;
    if (v7)
    {
      if (v10)
      {
        node = self->_node;
        C3DEntitySetValueForKey((uint64_t)node, a4, v7);
        v13 = objc_msgSend((id)objc_msgSend(CFSTR("customProperty"), "stringByAppendingString:", CFSTR(".")), "stringByAppendingString:", a4);
        v14 = -[SCNNode sceneRef](self, "sceneRef");
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __36__SCNNode_setValue_forUndefinedKey___block_invoke;
        v15[3] = &unk_1EA59E2B0;
        v15[5] = v11;
        v15[6] = node;
        v15[4] = a4;
        +[SCNTransaction postCommandWithContext:object:keyPath:applyBlock:](SCNTransaction, "postCommandWithContext:object:keyPath:applyBlock:", v14, self, v13, v15);
      }
    }

  }
}

void __36__SCNNode_setValue_forUndefinedKey___block_invoke(uint64_t a1)
{
  C3DEntitySetValueForKey(*(_QWORD *)(a1 + 48), *(void **)(a1 + 32), *(__int16 **)(a1 + 40));
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  return SCNObject_resolveInstanceMethod((objc_class *)a1, a3);
}

- (__C3DAnimationManager)animationManager
{
  __C3DAnimationManager *result;

  result = -[SCNNode sceneRef](self, "sceneRef");
  if (result)
    return (__C3DAnimationManager *)C3DSceneGetAnimationManager((uint64_t)result);
  return result;
}

- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4
{
  os_unfair_lock_s *p_animationsLock;
  BOOL v8;
  _QWORD *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!a4)
    return 0;
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  v8 = objc_msgSend(-[SCNOrderedDictionary objectForKey:](self->_animations, "objectForKey:", a4), "animation") == (_QWORD)a3;
  if (v8)
  {
    -[SCNOrderedDictionary removeObjectForKey:](self->_animations, "removeObjectForKey:", a4);
    v9 = -[SCNNode __CFObject](self, "__CFObject");
    if ((CFTypeIsC3DEntity(v9) & 1) == 0)
    {
      v10 = scn_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[SCNLight __removeAnimation:forKey:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    C3DEntityRemoveAnimationForKey(v9, a4, 1);
  }
  os_unfair_lock_unlock(p_animationsLock);
  return v8;
}

- (void)addAnimationPlayer:(id)a3 forKey:(id)a4
{
  id v5;
  SCNOrderedDictionary *animations;
  __C3DScene *v8;
  NSObject *v9;
  _QWORD v10[7];

  if (a3)
  {
    v5 = a4;
    if (!a4)
      v5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (!animations)
    {
      animations = objc_alloc_init(SCNOrderedDictionary);
      self->_animations = animations;
    }
    -[SCNOrderedDictionary setObject:forKey:](animations, "setObject:forKey:", a3, v5);
    os_unfair_lock_unlock(&self->_animationsLock);
    v8 = -[SCNNode sceneRef](self, "sceneRef");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __37__SCNNode_addAnimationPlayer_forKey___block_invoke;
    v10[3] = &unk_1EA59F718;
    v10[4] = a3;
    v10[5] = self;
    v10[6] = v5;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, self, v10);
  }
  else
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SCNMaterial addAnimationPlayer:forKey:].cold.1();
  }
}

void __37__SCNNode_addAnimationPlayer_forKey___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "prepareWithTarget:implicitDuration:", a1[5]);
  if ((SCNAddAnimation(a1[4], a1[5], a1[6]) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1[5] + 50);
    objc_msgSend(*((id *)a1[5] + 26), "removeObjectForKey:", a1[6]);
    os_unfair_lock_unlock((os_unfair_lock_t)a1[5] + 50);
  }
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  id v5;
  SCNAnimation *v6;
  SCNAnimationPlayer *v7;
  NSObject *v8;

  if (a3)
  {
    v5 = a4;
    v6 = (SCNAnimation *)a3;
    if (!a4)
      v5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = +[SCNAnimation animationWithCAAnimation:](SCNAnimation, "animationWithCAAnimation:", v6);
    v7 = +[SCNAnimationPlayer animationPlayerWithSCNAnimation:](SCNAnimationPlayer, "animationPlayerWithSCNAnimation:", v6);
    -[SCNNode addAnimationPlayer:forKey:](self, "addAnimationPlayer:forKey:", v7, v5);
    -[SCNAnimationPlayer play](v7, "play");
    if (-[SCNNode isPausedOrPausedByInheritance](self, "isPausedOrPausedByInheritance"))
      -[SCNNode _pauseAnimation:forKey:pausedByNode:](self, "_pauseAnimation:forKey:pausedByNode:", 1, v5, 1);
  }
  else
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNMaterial addAnimation:forKey:].cold.1();
  }
}

- (void)addAnimation:(id)a3
{
  -[SCNNode addAnimation:forKey:](self, "addAnimation:forKey:", a3, 0);
}

- (void)removeAllAnimations
{
  os_unfair_lock_s *p_animationsLock;
  __C3DScene *v4;
  _QWORD v5[5];

  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  -[SCNOrderedDictionary removeAllObjects](self->_animations, "removeAllObjects");
  os_unfair_lock_unlock(p_animationsLock);
  v4 = -[SCNNode sceneRef](self, "sceneRef");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__SCNNode_removeAllAnimations__block_invoke;
  v5[3] = &unk_1EA59E4A0;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v4, self, v5);
}

void __30__SCNNode_removeAllAnimations__block_invoke(uint64_t a1)
{
  SCNRemoveAllAnimations(*(void **)(a1 + 32));
}

- (void)removeAllAnimationsWithBlendOutDuration:(double)a3
{
  os_unfair_lock_s *p_animationsLock;
  __C3DScene *v6;
  _QWORD v7[6];

  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  -[SCNOrderedDictionary removeAllObjects](self->_animations, "removeAllObjects");
  os_unfair_lock_unlock(p_animationsLock);
  v6 = -[SCNNode sceneRef](self, "sceneRef");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__SCNNode_removeAllAnimationsWithBlendOutDuration___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
}

void __51__SCNNode_removeAllAnimationsWithBlendOutDuration___block_invoke(uint64_t a1)
{
  SCNFadeAndRemoveAllAnimations(*(void **)(a1 + 32), *(double *)(a1 + 40));
}

- (void)removeAnimationForKey:(id)a3
{
  os_unfair_lock_s *p_animationsLock;
  __C3DScene *v6;
  _QWORD v7[6];

  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    -[SCNOrderedDictionary removeObjectForKey:](self->_animations, "removeObjectForKey:", a3);
    os_unfair_lock_unlock(p_animationsLock);
    v6 = -[SCNNode sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__SCNNode_removeAnimationForKey___block_invoke;
    v7[3] = &unk_1EA59F740;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __33__SCNNode_removeAnimationForKey___block_invoke(uint64_t a1)
{
  SCNRemoveAnimation(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (void)removeAnimationForKey:(id)a3 blendOutDuration:(double)a4
{
  os_unfair_lock_s *p_animationsLock;
  __C3DScene *v8;
  _QWORD v9[7];

  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    -[SCNOrderedDictionary removeObjectForKey:](self->_animations, "removeObjectForKey:", a3);
    os_unfair_lock_unlock(p_animationsLock);
    v8 = -[SCNNode sceneRef](self, "sceneRef");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__SCNNode_removeAnimationForKey_blendOutDuration___block_invoke;
    v9[3] = &unk_1EA59E2B0;
    v9[4] = self;
    v9[5] = a3;
    *(double *)&v9[6] = a4;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, self, v9);
  }
}

void __50__SCNNode_removeAnimationForKey_blendOutDuration___block_invoke(uint64_t a1)
{
  SCNFadeAndRemoveAnimation(*(void **)(a1 + 32), *(void **)(a1 + 40), *(double *)(a1 + 48));
}

- (void)_syncObjCAnimations
{
  __C3DScene *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *Animations;
  const __CFDictionary *v16;

  v3 = -[SCNNode sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(SCNOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  v5 = -[SCNNode __CFObject](self, "__CFObject");
  if (v5)
  {
    v6 = (uint64_t)v5;
    if ((CFTypeIsC3DEntity(v5) & 1) == 0)
    {
      v7 = scn_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[SCNLight _syncObjCAnimations].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    Animations = C3DEntityGetAnimations(v6);
    if (Animations)
    {
      v16 = Animations;
      os_unfair_lock_lock(&self->_animationsLock);
      C3DOrderedDictionaryApplyFunction(v16, (const char *)SCNConvertC3DAnimationDictionaryFunc, (uint64_t)self->_animations);
      os_unfair_lock_unlock(&self->_animationsLock);
    }
  }
  if (v4)
    C3DSceneUnlock(v4);
}

- (id)animationForKey:(id)a3
{
  id v3;

  v3 = -[SCNNode _scnAnimationForKey:](self, "_scnAnimationForKey:", a3);
  return (id)objc_msgSend(MEMORY[0x1E0CD26F8], "animationWithSCNAnimation:", v3);
}

- (id)_scnAnimationForKey:(id)a3
{
  id v3;
  os_unfair_lock_s *p_animationsLock;
  SCNOrderedDictionary *animations;

  v3 = a3;
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations)
      v3 = (id)objc_msgSend(-[SCNOrderedDictionary objectForKey:](animations, "objectForKey:", v3), "animation");
    else
      v3 = 0;
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (id)animationPlayerForKey:(id)a3
{
  id v3;
  os_unfair_lock_s *p_animationsLock;
  SCNOrderedDictionary *animations;

  v3 = a3;
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations)
      v3 = -[SCNOrderedDictionary objectForKey:](animations, "objectForKey:", v3);
    else
      v3 = 0;
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v7;
  void *v9;
  void *v10;
  __C3DAnimationManager *v11;
  uint64_t v12;
  double v13;

  v5 = a5;
  v7 = a3;
  v9 = -[SCNNode __CFObject](self, "__CFObject");
  if (v9)
  {
    v10 = v9;
    v11 = -[SCNNode animationManager](self, "animationManager");
    if (v11)
    {
      v12 = (uint64_t)v11;
      v13 = CACurrentMediaTime();
      C3DAnimationManagerPauseAnimationForKey(v12, v10, a4, v7, v5, v13);
    }
  }
}

- (void)pauseAnimationForKey:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  v5 = -[SCNNode sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__SCNNode_pauseAnimationForKey___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __32__SCNNode_pauseAnimationForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pauseAnimation:forKey:pausedByNode:", 1, *(_QWORD *)(a1 + 40), 0);
}

- (void)resumeAnimationForKey:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  v5 = -[SCNNode sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__SCNNode_resumeAnimationForKey___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __33__SCNNode_resumeAnimationForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pauseAnimation:forKey:pausedByNode:", 0, *(_QWORD *)(a1 + 40), 0);
}

- (void)setSpeed:(double)a3 forAnimationKey:(id)a4
{
  uint64_t v7;
  __C3DScene *v8;
  _QWORD v9[7];

  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("animations.%@.speed"), a4);
  v8 = -[SCNNode sceneRef](self, "sceneRef");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__SCNNode_setSpeed_forAnimationKey___block_invoke;
  v9[3] = &unk_1EA59E2B0;
  v9[4] = self;
  v9[5] = a4;
  *(double *)&v9[6] = a3;
  +[SCNTransaction postCommandWithContext:object:keyPath:applyBlock:](SCNTransaction, "postCommandWithContext:object:keyPath:applyBlock:", v8, self, v7, v9);
}

float __36__SCNNode_setSpeed_forAnimationKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float result;
  void *v4;
  uint64_t v5;
  float v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  if (v2)
  {
    v4 = (void *)v2;
    v5 = objc_msgSend(*(id *)(a1 + 32), "animationManager");
    if (v5)
    {
      v6 = *(double *)(a1 + 48);
      C3DAnimationManagerChangeSpeedOfAnimationForKey(v5, v4, *(const void **)(a1 + 40), v6);
    }
  }
  return result;
}

- (BOOL)isAnimationForKeyPaused:(id)a3
{
  __C3DScene *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __C3DAnimationManager *v9;
  char IsPaused;

  v5 = -[SCNNode sceneRef](self, "sceneRef");
  v6 = (uint64_t)v5;
  if (v5)
    C3DSceneLock((uint64_t)v5);
  v7 = -[SCNNode __CFObject](self, "__CFObject");
  if (v7)
  {
    v8 = v7;
    v9 = -[SCNNode animationManager](self, "animationManager");
    if (v9)
    {
      IsPaused = C3DAnimationManagerGetAnimationForKeyIsPaused((uint64_t)v9, v8, a3);
      if (!v6)
        return IsPaused;
      goto LABEL_8;
    }
  }
  IsPaused = 0;
  if (v6)
LABEL_8:
    C3DSceneUnlock(v6);
  return IsPaused;
}

- (id)_scnBindings
{
  return self->_bindings;
}

- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  C3DBinding *v13;
  NSMutableDictionary *bindings;
  __C3DScene *v15;
  _QWORD v16[17];

  if (self != a4)
  {
    v16[15] = v6;
    v16[16] = v7;
    v13 = objc_alloc_init(C3DBinding);
    -[C3DBinding setSourceObject:](v13, "setSourceObject:", a4);
    -[C3DBinding setKeyPathDst:](v13, "setKeyPathDst:", a3);
    -[C3DBinding setKeyPathSrc:](v13, "setKeyPathSrc:", a5);
    -[C3DBinding setOptions:](v13, "setOptions:", a6);
    bindings = self->_bindings;
    if (!bindings)
    {
      bindings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_bindings = bindings;
    }
    -[NSMutableDictionary setValue:forKey:](bindings, "setValue:forKey:", v13, a3);

    v15 = -[SCNNode sceneRef](self, "sceneRef");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__SCNNode_bindAnimatablePath_toObject_withKeyPath_options___block_invoke;
    v16[3] = &unk_1EA59F768;
    v16[4] = self;
    v16[5] = a4;
    v16[6] = a3;
    v16[7] = a5;
    v16[8] = a6;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v15, self, v16);
  }
}

void __59__SCNNode_bindAnimatablePath_toObject_withKeyPath_options___block_invoke(uint64_t a1)
{
  float32x4_t *v2;
  C3DBinding *v3;

  v2 = (float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  v3 = objc_alloc_init(C3DBinding);
  -[C3DBinding setSourceObject:](v3, "setSourceObject:", objc_msgSend(*(id *)(a1 + 40), "__CFObject"));
  -[C3DBinding setKeyPathDst:](v3, "setKeyPathDst:", *(_QWORD *)(a1 + 48));
  -[C3DBinding setKeyPathSrc:](v3, "setKeyPathSrc:", *(_QWORD *)(a1 + 56));
  -[C3DBinding setOptions:](v3, "setOptions:", *(_QWORD *)(a1 + 64));
  C3DEntityAddBinding(v2, v3);

}

- (void)unbindAnimatablePath:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  -[NSMutableDictionary removeObjectForKey:](self->_bindings, "removeObjectForKey:");
  if (!-[NSMutableDictionary count](self->_bindings, "count"))
  {

    self->_bindings = 0;
  }
  v5 = -[SCNNode sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__SCNNode_unbindAnimatablePath___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __32__SCNNode_unbindAnimatablePath___block_invoke(uint64_t a1)
{
  C3DEntityRemoveBindingWithKeyPath((float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject"), *(const __CFString **)(a1 + 40));
}

- (void)removeAllBindings
{
  __C3DScene *v3;
  _QWORD v4[5];

  self->_bindings = 0;
  v3 = -[SCNNode sceneRef](self, "sceneRef");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__SCNNode_removeAllBindings__block_invoke;
  v4[3] = &unk_1EA59E4A0;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v3, self, v4);
}

void __28__SCNNode_removeAllBindings__block_invoke(uint64_t a1)
{
  C3DEntityRemoveAllBindings((CFTypeRef *)objc_msgSend(*(id *)(a1 + 32), "__CFObject"));
}

- (id)objectInChildNodesAtIndex:(unint64_t)a3
{
  void *v5;

  objc_sync_enter(self);
  v5 = (void *)-[NSMutableArray objectAtIndex:](self->_childNodes, "objectAtIndex:", a3);
  objc_sync_exit(self);
  return v5;
}

- (void)_syncObjCModelAfterC3DIOSceneLoadingWithNodeRef:(__C3DNode *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __C3DNode *node;
  NSMutableArray *childNodes;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  _QWORD v18[8];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[SCNNode _syncObjCModel](self, "_syncObjCModel");
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v5 = -[NSMutableArray count](self->_childNodes, "count");
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __59__SCNNode__syncObjCModelAfterC3DIOSceneLoadingWithNodeRef___block_invoke;
  v18[3] = &unk_1EA5A2380;
  v18[4] = self;
  v18[5] = &v23;
  v18[6] = &v19;
  v18[7] = v5;
  C3DNodeApplyChildrenInterruptible((uint64_t)a3, (uint64_t)v18);
  if (v5 != v20[3])
  {
    *((_BYTE *)v24 + 24) = 1;
    goto LABEL_5;
  }
  if (*((_BYTE *)v24 + 24))
  {
LABEL_5:
    v7 = (void *)-[NSMutableArray copy](self->_childNodes, "copy");
    -[NSMutableArray removeAllObjects](self->_childNodes, "removeAllObjects");
    node = self->_node;
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __59__SCNNode__syncObjCModelAfterC3DIOSceneLoadingWithNodeRef___block_invoke_2;
    v17[3] = &unk_1EA5A2308;
    v17[4] = self;
    C3DNodeApplyChildren((uint64_t)node, (uint64_t)v17);

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  childNodes = self->_childNodes;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](childNodes, "countByEnumeratingWithState:objects:count:", &v13, v27, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(childNodes);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "_syncObjCModelAfterC3DIOSceneLoadingWithNodeRef:", *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i) + 8));
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](childNodes, "countByEnumeratingWithState:objects:count:", &v13, v27, 16);
    }
    while (v10);
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
}

_QWORD *__59__SCNNode__syncObjCModelAfterC3DIOSceneLoadingWithNodeRef___block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  _QWORD *v5;

  v5 = result;
  if (result[7] > a3
    && (result = (_QWORD *)objc_msgSend(*(id *)(result[4] + 24), "objectAtIndexedSubscript:"), result[1] == a2))
  {
    *(_QWORD *)(*(_QWORD *)(v5[6] + 8) + 24) = a3 + 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(v5[5] + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __59__SCNNode__syncObjCModelAfterC3DIOSceneLoadingWithNodeRef___block_invoke_2(uint64_t a1, uint64_t a2)
{
  SCNNode *v3;

  v3 = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", a2);
  -[SCNNode _setParent:](v3, "_setParent:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", v3);
}

- (void)__removeObjectFromChildNodesAtIndex:(unint64_t)a3
{
  SCNNode *v5;
  void *v6;
  __C3DScene *v7;
  NSObject *v8;
  _QWORD v9[5];

  objc_sync_enter(self);
  v5 = self;
  if (-[NSMutableArray count](self->_childNodes, "count") <= a3)
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNNode __removeObjectFromChildNodesAtIndex:].cold.1();
  }
  else
  {
    v6 = (void *)-[NSMutableArray objectAtIndex:](self->_childNodes, "objectAtIndex:", a3);
    v7 = -[SCNNode sceneRef](self, "sceneRef");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__SCNNode___removeObjectFromChildNodesAtIndex___block_invoke;
    v9[3] = &unk_1EA59E4A0;
    v9[4] = v6;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v9);
    objc_msgSend(v6, "_setParent:", 0);
    -[NSMutableArray removeObjectAtIndex:](self->_childNodes, "removeObjectAtIndex:", a3);
  }
  objc_sync_exit(self);
}

void __47__SCNNode___removeObjectFromChildNodesAtIndex___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  NSObject *v2;

  v1 = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "nodeRef");
  if (v1)
  {
    C3DNodeRemoveFromParentNode(v1);
  }
  else
  {
    v2 = scn_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __47__SCNNode___removeObjectFromChildNodesAtIndex___block_invoke_cold_1();
  }
}

- (void)replaceObjectInChildNodesAtIndex:(unint64_t)a3 withObject:(id)a4
{
  void *v7;
  id v8;
  __C3DScene *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[7];

  objc_sync_enter(self);
  if (a4)
  {
    if (-[SCNNode canAddChildNode:](self, "canAddChildNode:", a4))
    {
      v7 = (void *)-[NSMutableArray objectAtIndex:](self->_childNodes, "objectAtIndex:", a3);
      if (v7)
      {
        v8 = a4;
        objc_msgSend(a4, "removeFromParentNode");
        objc_msgSend(v7, "_setParent:", 0);
        objc_msgSend(a4, "_setParent:", self);
        v9 = -[SCNNode sceneRef](self, "sceneRef");
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __55__SCNNode_replaceObjectInChildNodesAtIndex_withObject___block_invoke;
        v12[3] = &unk_1EA59F718;
        v12[4] = v7;
        v12[5] = a4;
        v12[6] = self;
        +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v9, self, v12);
        -[NSMutableArray replaceObjectAtIndex:withObject:](self->_childNodes, "replaceObjectAtIndex:withObject:", a3, a4);

      }
      else
      {
        v11 = scn_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[SCNNode replaceObjectInChildNodesAtIndex:withObject:].cold.1();
      }
    }
    else
    {
      v10 = scn_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SCNNode replaceObjectInChildNodesAtIndex:withObject:].cold.2();
    }
  }
  else
  {
    -[SCNNode removeObjectFromChildNodesAtIndex:](self, "removeObjectFromChildNodesAtIndex:", a3);
  }
  objc_sync_exit(self);
}

void __55__SCNNode_replaceObjectInChildNodesAtIndex_withObject___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  BOOL v4;
  NSObject *v5;
  float32x4_t *v6;
  int IndexOfChildNode;

  v2 = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "nodeRef");
  v3 = objc_msgSend(*(id *)(a1 + 40), "nodeRef");
  if (v3)
    v4 = v2 == 0;
  else
    v4 = 1;
  if (v4)
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __55__SCNNode_replaceObjectInChildNodesAtIndex_withObject___block_invoke_cold_1();
  }
  else
  {
    v6 = (float32x4_t *)v3;
    IndexOfChildNode = C3DNodeGetIndexOfChildNode(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), (uint64_t)v2);
    CFRetain(v6);
    C3DNodeRemoveFromParentNode(v2);
    C3DNodeRemoveFromParentNode(v6);
    C3DNodeInsertChildNodeAtIndex(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), v6, IndexOfChildNode);
    CFRelease(v6);
  }
}

- (unint64_t)indexOfChildNode:(id)a3
{
  NSMutableArray *childNodes;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  childNodes = self->_childNodes;
  v5 = -[NSMutableArray count](childNodes, "count");
  if (!v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = v5;
  v7 = 0;
  while ((id)-[NSMutableArray objectAtIndex:](childNodes, "objectAtIndex:", v7) != a3)
  {
    if (v6 == ++v7)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

- (void)removeAllChilds
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = -[SCNNode childNodes](self, "childNodes", 0);
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "removeFromParentNode");
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)replaceChildNode:(SCNNode *)oldChild with:(SCNNode *)newChild
{
  unint64_t v6;

  v6 = -[SCNNode indexOfChildNode:](self, "indexOfChildNode:", oldChild);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    -[SCNNode replaceObjectInChildNodesAtIndex:withObject:](self, "replaceObjectInChildNodesAtIndex:withObject:", v6, newChild);
}

- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4
{
  SCNVector3 *fixedBoundingBoxExtrema;
  uint64_t v8;
  SCNVector3 *v9;
  uint64_t v10;
  __C3DScene *v11;
  uint64_t v12;
  int v13;
  float v14;
  float v15;
  BOOL v16;
  SCNGeometry *v17;
  float32x4_t v18;
  float32x4_t v19;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  float32x4_t v25;
  uint64_t v26;
  void *v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  uint64_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float z;
  float v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43[4];
  SCNMatrix4 m;
  SCNMatrix4 b;
  SCNMatrix4 a;
  SCNMatrix4 v47;
  float32x4_t v48;
  float32x4_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  __int32 v55;
  uint64_t v56;
  __int32 v57;
  float32x4_t v58;
  float32x4_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (!self->_node || *((char *)self + 41) < 0)
    return 0;
  v59.i32[2] = 0;
  v59.i64[0] = 0;
  v58.i32[2] = 0;
  v58.i64[0] = 0;
  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v11 = -[SCNNode sceneRef](self, "sceneRef");
    if (v11)
    {
      v12 = (uint64_t)v11;
      C3DSceneLock((uint64_t)v11);
      v13 = C3DGetBoundingBox(self->_node, 1, (uint64_t)&v59, (uint64_t)&v58);
      C3DSceneUnlock(v12);
      if (v13)
      {
LABEL_11:
        if (a3)
        {
          v14 = v59.f32[2];
          *(_QWORD *)&a3->x = v59.i64[0];
          a3->z = v14;
        }
        if (a4)
        {
          v15 = v58.f32[2];
          *(_QWORD *)&a4->x = v58.i64[0];
          a4->z = v15;
        }
        return 1;
      }
    }
    else if ((C3DGetBoundingBox(self->_node, 1, (uint64_t)&v59, (uint64_t)&v58) & 1) != 0)
    {
      goto LABEL_11;
    }
    return 0;
  }
  v57 = 0;
  v56 = 0;
  v55 = 0;
  v54 = 0;
  fixedBoundingBoxExtrema = self->_fixedBoundingBoxExtrema;
  if (fixedBoundingBoxExtrema)
  {
    if (a3)
    {
      v8 = *(_QWORD *)&fixedBoundingBoxExtrema->x;
      a3->z = fixedBoundingBoxExtrema->z;
      *(_QWORD *)&a3->x = v8;
    }
    if (a4)
    {
      v9 = self->_fixedBoundingBoxExtrema;
      v10 = *(_QWORD *)&v9[1].x;
      a4->z = v9[1].z;
      *(_QWORD *)&a4->x = v10;
    }
    return 1;
  }
  v17 = -[SCNNode geometry](self, "geometry");
  v18.i64[0] = 0;
  v40 = v18;
  v39 = 0.0;
  if (v17 && -[SCNGeometry getBoundingBoxMin:max:](v17, "getBoundingBoxMin:max:", a3, a4))
  {
    v39 = 0.0;
    z = 0.0;
    v19.i64[0] = 0;
    if (a3)
    {
      v19.i64[0] = *(_QWORD *)&a3->x;
      v18 = v19;
      z = a3->z;
      v18.f32[2] = z;
      v59 = v18;
    }
    v36 = v19;
    if (a4)
    {
      v18.i64[0] = *(_QWORD *)&a4->x;
      v39 = a4->z;
      v40 = v18;
      v18.f32[2] = v39;
      v58 = v18;
    }
    else
    {
      v18.i64[0] = 0;
      v40 = v18;
    }
    v16 = 1;
  }
  else
  {
    v16 = 0;
    z = 0.0;
    v18.i64[0] = 0;
    v36 = v18;
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v21 = -[SCNNode childNodes](self, "childNodes", *(_OWORD *)&v36);
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (!v22)
  {
    v25.i64[0] = v40.i64[0];
    if (!v16)
      return v16;
    goto LABEL_47;
  }
  v23 = v22;
  v24 = *(_QWORD *)v51;
  v25 = v40;
  do
  {
    v26 = 0;
    do
    {
      v41 = v25;
      if (*(_QWORD *)v51 != v24)
        objc_enumerationMutation(v21);
      v27 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v26);
      if (objc_msgSend(v27, "getBoundingBoxMin:max:", &v56, &v54, *(_OWORD *)&v37))
      {
        v28.i64[0] = v56;
        v28.i32[2] = v57;
        v29.i64[0] = v54;
        v29.i32[2] = v55;
        v48 = v29;
        v49 = v28;
        memset(&v47, 0, sizeof(v47));
        if (v27)
        {
          objc_msgSend(v27, "transform");
          objc_msgSend(v27, "pivot");
        }
        else
        {
          memset(&a, 0, sizeof(a));
          memset(&m, 0, sizeof(m));
        }
        SCNMatrix4Invert(&b, &m);
        SCNMatrix4Mult(&v47, &a, &b);
        memset(v43, 0, sizeof(v43));
        C3DMatrix4x4FromSCNMatrix4(v43, (uint64_t)&v47);
        C3DTransformBoundingBox(&v49, &v48, &v49, &v48, v43);
        v30 = v49;
        if (v16)
        {
          v31 = v59;
          v30.i32[3] = 0;
          v31.i32[3] = 0;
          v32 = vminnmq_f32(v30, v31);
          v33 = v48;
          v34 = v58;
          v33.i32[3] = 0;
          v34.i32[3] = 0;
          v25 = vmaxnmq_f32(v33, v34);
          v30 = v32;
        }
        else
        {
          v25 = v48;
        }
        v58 = v25;
        v59 = v30;
        v37 = v30;
        z = v30.f32[2];
        v39 = v25.f32[2];
        v16 = 1;
      }
      else
      {
        v25 = v41;
      }
      ++v26;
    }
    while (v23 != v26);
    v42 = v25;
    v35 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    v25 = v42;
    v23 = v35;
  }
  while (v35);
  if (v16)
  {
LABEL_47:
    if (a3)
    {
      *(_QWORD *)&a3->x = v37.i64[0];
      a3->z = z;
    }
    if (a4)
    {
      *(_QWORD *)&a4->x = v25.i64[0];
      a4->z = v39;
    }
  }
  return v16;
}

- (void)setBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4
{
  SCNVector3 *fixedBoundingBoxExtrema;
  _BOOL4 v8;
  __int128 v9;
  SCNVector3 *v10;
  __C3DScene *v11;
  _QWORD *v12;
  uint64_t v13;
  SCNVector3 *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  __int128 v20;
  __int128 v21;
  SCNNode *v22;
  _QWORD v23[5];

  fixedBoundingBoxExtrema = self->_fixedBoundingBoxExtrema;
  if (a3 && a4)
  {
    if (fixedBoundingBoxExtrema)
    {
      v8 = SCNVector3EqualToVector3(*a3, *fixedBoundingBoxExtrema);
      v10 = self->_fixedBoundingBoxExtrema;
      if (v8)
      {
        if (SCNVector3EqualToVector3(*a4, v10[1]))
          return;
        v10 = self->_fixedBoundingBoxExtrema;
      }
    }
    else
    {
      v10 = (SCNVector3 *)malloc_type_malloc(0x18uLL, 0x10000403E1C8BA9uLL);
      self->_fixedBoundingBoxExtrema = v10;
    }
    v13 = *(_QWORD *)&a3->x;
    v10->z = a3->z;
    *(_QWORD *)&v10->x = v13;
    v14 = self->_fixedBoundingBoxExtrema;
    v15 = *(_QWORD *)&a4->x;
    v14[1].z = a4->z;
    *(_QWORD *)&v14[1].x = v15;
    *(_QWORD *)&v9 = *(_QWORD *)&a3->x;
    DWORD2(v9) = LODWORD(a3->z);
    v17 = v9;
    DWORD2(v9) = LODWORD(a4->z);
    v11 = -[SCNNode sceneRef](self, "sceneRef", *(_QWORD *)&a4->x, *((_QWORD *)&v9 + 1), v17);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __33__SCNNode_setBoundingBoxMin_max___block_invoke_2;
    v19[3] = &unk_1EA5A23A8;
    v20 = v18;
    v21 = v16;
    v22 = self;
    v12 = v19;
  }
  else
  {
    if (!fixedBoundingBoxExtrema)
      return;
    free(fixedBoundingBoxExtrema);
    self->_fixedBoundingBoxExtrema = 0;
    v11 = -[SCNNode sceneRef](self, "sceneRef");
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __33__SCNNode_setBoundingBoxMin_max___block_invoke;
    v23[3] = &unk_1EA59E4A0;
    v23[4] = self;
    v12 = v23;
  }
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v11, self, v12);
}

void __33__SCNNode_setBoundingBoxMin_max___block_invoke(uint64_t a1)
{
  C3DNodeSetBoundingBox(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 0, 0);
}

__n128 __33__SCNNode_setBoundingBoxMin_max___block_invoke_2(float32x4_t *a1)
{
  float32x4_t v1;
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  __n128 result;
  _OWORD v7[2];

  v1 = a1[2];
  v2 = a1[3];
  v3.i64[0] = 0x3F0000003F000000;
  v3.i64[1] = 0x3F0000003F000000;
  v4 = vmulq_f32(vaddq_f32(v1, v2), v3);
  v5 = vmulq_f32(vsubq_f32(v2, v1), v3);
  v4.i32[3] = 1.0;
  v5.i32[3] = 0;
  v7[0] = v4;
  v7[1] = v5;
  C3DNodeSetBoundingBox(*(_QWORD *)(a1[4].i64[0] + 8), v7, 1);
  return result;
}

- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4
{
  _BOOL4 v6;
  float v7;
  float v9;
  uint64_t v10;
  float v11;

  v11 = 0.0;
  v10 = 0;
  v9 = 0.0;
  v6 = -[SCNNode simdGetBoundingSphereCenter:radius:](self, "simdGetBoundingSphereCenter:radius:", &v10, &v9);
  if (v6)
  {
    if (a3)
    {
      v7 = v11;
      *(_QWORD *)&a3->x = v10;
      a3->z = v7;
    }
    if (a4)
      *a4 = v9;
  }
  return v6;
}

- (BOOL)getFrustum:(id *)a3 withViewport:
{
  __n128 v3;
  SCNCamera *v6;
  _OWORD *ProjectionInfosPtr;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char *Matrix;
  uint64_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float32x4_t v29;
  float v30;
  float v31;
  float v32;
  int32x4_t v33;
  float32x2_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float v39;
  float v40;
  float v41;
  int32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  int32x4_t v46;
  float32x4_t v47;
  int32x4_t v48;
  float32x2_t v49;
  float32x2_t v50;
  __n128 v52;
  _OWORD v53[14];
  __n128 v54;
  simd_float4x4 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  simd_float4x4 v60;
  simd_float4x4 v61;

  v52 = v3;
  v54 = v3;
  if (-[SCNNode isPresentationInstance](self, "isPresentationInstance"))
  {
    LOBYTE(v6) = C3DComputeFrustumPlanesFromNode((float32x4_t *)-[SCNNode nodeRef](self, "nodeRef"), (float32x4_t *)a3, v52);
  }
  else
  {
    v6 = -[SCNNode camera](self, "camera");
    if (v6)
    {
      ProjectionInfosPtr = (_OWORD *)C3DCameraGetProjectionInfosPtr((uint64_t)-[SCNCamera cameraRef](v6, "cameraRef"));
      v8 = ProjectionInfosPtr[1];
      v53[0] = *ProjectionInfosPtr;
      v53[1] = v8;
      v9 = ProjectionInfosPtr[5];
      v11 = ProjectionInfosPtr[2];
      v10 = ProjectionInfosPtr[3];
      v53[4] = ProjectionInfosPtr[4];
      v53[5] = v9;
      v53[2] = v11;
      v53[3] = v10;
      v12 = ProjectionInfosPtr[9];
      v14 = ProjectionInfosPtr[6];
      v13 = ProjectionInfosPtr[7];
      v53[8] = ProjectionInfosPtr[8];
      v53[9] = v12;
      v53[6] = v14;
      v53[7] = v13;
      v15 = ProjectionInfosPtr[13];
      v17 = ProjectionInfosPtr[10];
      v16 = ProjectionInfosPtr[11];
      v53[12] = ProjectionInfosPtr[12];
      v53[13] = v15;
      v53[10] = v17;
      v53[11] = v16;
      Matrix = C3DProjectionInfosGetMatrix((char *)v53, (uint64_t)&v54, 0);
      -[SCNNode simdWorldTransform](self, "simdWorldTransform");
      v61 = __invert_f4(v60);
      v19 = 0;
      v20 = *(float32x4_t *)Matrix;
      v21 = *((float32x4_t *)Matrix + 1);
      v22 = *((float32x4_t *)Matrix + 2);
      v23 = *((float32x4_t *)Matrix + 3);
      v55 = v61;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      do
      {
        *(__int128 *)((char *)&v56 + v19 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v20, COERCE_FLOAT(*(_OWORD *)&v55.columns[v19])), v21, *(float32x2_t *)v55.columns[v19].f32, 1), v22, (float32x4_t)v55.columns[v19], 2), v23, (float32x4_t)v55.columns[v19], 3);
        ++v19;
      }
      while (v19 != 4);
      v25 = *((float *)&v56 + 2);
      v24 = *((float *)&v57 + 2);
      v27 = *((float *)&v58 + 2);
      v26 = *((float *)&v59 + 2);
      v28 = *((float *)&v56 + 3);
      v29.f32[0] = *((float *)&v56 + 3) - *(float *)&v56;
      v30 = *((float *)&v57 + 3);
      v31 = *((float *)&v58 + 3);
      v32 = *((float *)&v59 + 3);
      v29.f32[1] = *((float *)&v57 + 3) - *(float *)&v57;
      v29.f32[2] = *((float *)&v58 + 3) - *(float *)&v58;
      v29.f32[3] = *((float *)&v59 + 3) - *(float *)&v59;
      v33 = (int32x4_t)vmulq_f32(v29, v29);
      v33.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v33, 2), vadd_f32(*(float32x2_t *)v33.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v33.i8, 1))).u32[0];
      v34 = vrsqrte_f32((float32x2_t)v33.u32[0]);
      *(float32x2_t *)v35.f32 = vmul_f32(v34, vrsqrts_f32((float32x2_t)v33.u32[0], vmul_f32(v34, v34)));
      v33.i32[0] = vmul_f32(*(float32x2_t *)v35.f32, vrsqrts_f32((float32x2_t)v33.u32[0], vmul_f32(*(float32x2_t *)v35.f32, *(float32x2_t *)v35.f32))).u32[0];
      v35.f32[0] = *((float *)&v56 + 3) + *(float *)&v56;
      v35.f32[1] = *((float *)&v57 + 3) + *(float *)&v57;
      v35.f32[2] = *((float *)&v58 + 3) + *(float *)&v58;
      v35.f32[3] = *((float *)&v59 + 3) + *(float *)&v59;
      v36 = vmulq_f32(v35, v35);
      v36.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)v36, 2), vadd_f32(*(float32x2_t *)v36.f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v36.f32, 1))).u32[0];
      v37 = vmulq_n_f32(v29, *(float *)v33.i32);
      *(float32x2_t *)v33.i8 = vrsqrte_f32((float32x2_t)v36.u32[0]);
      *(float32x2_t *)v33.i8 = vmul_f32(*(float32x2_t *)v33.i8, vrsqrts_f32((float32x2_t)v36.u32[0], vmul_f32(*(float32x2_t *)v33.i8, *(float32x2_t *)v33.i8)));
      v38 = vmulq_n_f32(v35, vmul_f32(*(float32x2_t *)v33.i8, vrsqrts_f32((float32x2_t)v36.u32[0], vmul_f32(*(float32x2_t *)v33.i8, *(float32x2_t *)v33.i8))).f32[0]);
      v35.i32[0] = DWORD1(v56);
      v36.f32[0] = *((float *)&v56 + 3) + *((float *)&v56 + 1);
      v39 = *((float *)&v57 + 1);
      v40 = *((float *)&v58 + 1);
      v36.f32[1] = *((float *)&v57 + 3) + *((float *)&v57 + 1);
      v41 = *((float *)&v59 + 1);
      v36.f32[2] = *((float *)&v58 + 3) + *((float *)&v58 + 1);
      v36.f32[3] = *((float *)&v59 + 3) + *((float *)&v59 + 1);
      a3->var0[0] = ($9BBE2667FA0C53BBDA0194B766E02F4A)v37;
      a3->var0[1] = ($9BBE2667FA0C53BBDA0194B766E02F4A)v38;
      v42 = (int32x4_t)vmulq_f32(v36, v36);
      v42.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v42, 2), vadd_f32(*(float32x2_t *)v42.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v42.i8, 1))).u32[0];
      *(float32x2_t *)v38.f32 = vrsqrte_f32((float32x2_t)v42.u32[0]);
      *(float32x2_t *)v38.f32 = vmul_f32(*(float32x2_t *)v38.f32, vrsqrts_f32((float32x2_t)v42.u32[0], vmul_f32(*(float32x2_t *)v38.f32, *(float32x2_t *)v38.f32)));
      v42.i32[0] = vmul_f32(*(float32x2_t *)v38.f32, vrsqrts_f32((float32x2_t)v42.u32[0], vmul_f32(*(float32x2_t *)v38.f32, *(float32x2_t *)v38.f32))).u32[0];
      v38.f32[0] = v28 - v35.f32[0];
      v38.f32[1] = v30 - v39;
      v38.f32[2] = v31 - v40;
      v38.f32[3] = v32 - v41;
      v43 = vmulq_f32(v38, v38);
      v43.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)v43, 2), vadd_f32(*(float32x2_t *)v43.f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v43.f32, 1))).u32[0];
      v44 = vmulq_n_f32(v36, *(float *)v42.i32);
      *(float32x2_t *)v36.f32 = vrsqrte_f32((float32x2_t)v43.u32[0]);
      *(float32x2_t *)v36.f32 = vmul_f32(*(float32x2_t *)v36.f32, vrsqrts_f32((float32x2_t)v43.u32[0], vmul_f32(*(float32x2_t *)v36.f32, *(float32x2_t *)v36.f32)));
      v45 = vmulq_n_f32(v38, vmul_f32(*(float32x2_t *)v36.f32, vrsqrts_f32((float32x2_t)v43.u32[0], vmul_f32(*(float32x2_t *)v36.f32, *(float32x2_t *)v36.f32))).f32[0]);
      v43.f32[0] = v28 - v25;
      v43.f32[1] = v30 - v24;
      v43.f32[2] = v31 - v27;
      v43.f32[3] = v32 - v26;
      a3->var0[2] = ($9BBE2667FA0C53BBDA0194B766E02F4A)v44;
      a3->var0[3] = ($9BBE2667FA0C53BBDA0194B766E02F4A)v45;
      v46 = (int32x4_t)vmulq_f32(v43, v43);
      v46.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v46, 2), vadd_f32(*(float32x2_t *)v46.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v46.i8, 1))).u32[0];
      *(float32x2_t *)v45.f32 = vrsqrte_f32((float32x2_t)v46.u32[0]);
      *(float32x2_t *)v45.f32 = vmul_f32(*(float32x2_t *)v45.f32, vrsqrts_f32((float32x2_t)v46.u32[0], vmul_f32(*(float32x2_t *)v45.f32, *(float32x2_t *)v45.f32)));
      v47.f32[0] = v28 + v25;
      v47.f32[1] = v30 + v24;
      v47.f32[2] = v31 + v27;
      v47.f32[3] = v32 + v26;
      v48 = (int32x4_t)vmulq_f32(v47, v47);
      v48.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v48, 2), vadd_f32(*(float32x2_t *)v48.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v48.i8, 1))).u32[0];
      v49 = vrsqrte_f32((float32x2_t)v48.u32[0]);
      v50 = vmul_f32(v49, vrsqrts_f32((float32x2_t)v48.u32[0], vmul_f32(v49, v49)));
      a3->var0[4] = ($9BBE2667FA0C53BBDA0194B766E02F4A)vmulq_n_f32(v43, vmul_f32(*(float32x2_t *)v45.f32, vrsqrts_f32((float32x2_t)v46.u32[0], vmul_f32(*(float32x2_t *)v45.f32, *(float32x2_t *)v45.f32))).f32[0]);
      a3->var0[5] = ($9BBE2667FA0C53BBDA0194B766E02F4A)vmulq_n_f32(v47, vmul_f32(v50, vrsqrts_f32((float32x2_t)v48.u32[0], vmul_f32(v50, v50))).f32[0]);
      LOBYTE(v6) = 1;
    }
  }
  return (char)v6;
}

- (id)getBoundingSphere
{
  _BOOL4 v2;
  id result;
  SCNBoundingSphere *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  int v10;

  v10 = 0;
  v8 = 0.0;
  v9 = 0;
  v2 = -[SCNNode getBoundingSphereCenter:radius:](self, "getBoundingSphereCenter:radius:", &v9, &v8);
  result = 0;
  if (v2)
  {
    v4 = objc_alloc_init(SCNBoundingSphere);
    LODWORD(v6) = HIDWORD(v9);
    LODWORD(v5) = v9;
    LODWORD(v7) = v10;
    -[SCNBoundingSphere setCenter:](v4, "setCenter:", v5, v6, v7);
    -[SCNBoundingSphere setRadius:](v4, "setRadius:", v8);
    return v4;
  }
  return result;
}

- (id)getBoundingBox
{
  _BOOL4 v2;
  id result;
  SCNBoundingBox *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;

  v14 = 0;
  v13 = 0;
  v12 = 0;
  v11 = 0;
  v2 = -[SCNNode getBoundingBoxMin:max:](self, "getBoundingBoxMin:max:", &v13, &v11);
  result = 0;
  if (v2)
  {
    v4 = objc_alloc_init(SCNBoundingBox);
    LODWORD(v6) = HIDWORD(v13);
    LODWORD(v5) = v13;
    LODWORD(v7) = v14;
    -[SCNBoundingBox setMin:](v4, "setMin:", v5, v6, v7);
    LODWORD(v9) = HIDWORD(v11);
    LODWORD(v8) = v11;
    LODWORD(v10) = v12;
    -[SCNBoundingBox setMax:](v4, "setMax:", v8, v9, v10);
    return v4;
  }
  return result;
}

- (SCNNode)flattenedClone
{
  id v3;
  __C3DNode *node;
  __C3DScene *v5;
  _QWORD v7[6];

  v3 = -[SCNNode copy](self, "copy");
  objc_msgSend(v3, "setGeometry:", objc_alloc_init(SCNGeometry));
  node = self->_node;
  v5 = -[SCNNode sceneRef](self, "sceneRef");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __25__SCNNode_flattenedClone__block_invoke;
  v7[3] = &unk_1EA59F740;
  v7[4] = node;
  v7[5] = v3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, v3, v7);
  return (SCNNode *)v3;
}

void __25__SCNNode_flattenedClone__block_invoke(uint64_t a1)
{
  __C3DGeometry *v2;
  __C3DGeometry *v3;

  v2 = (__C3DGeometry *)_C3DCreateFlattenedGeometryFromNodeHierarchy(*(float32x4_t **)(a1 + 32), 0, 0, 0);
  if (v2)
  {
    v3 = v2;
    C3DNodeSetGeometry(objc_msgSend(*(id *)(a1 + 40), "nodeRef"), v2);
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "geometry"), "setGeometryRef:", v3);
    CFRelease(v3);
  }
}

- (id)flattenedCopy
{
  return -[SCNNode flattenedClone](self, "flattenedClone");
}

- (id)_subdividedCopyWithSubdivisionLevel:(int64_t)a3
{
  unsigned __int16 v3;
  __C3DScene *v5;
  uint64_t v6;
  CFTypeRef *SubdividedCopy;
  SCNNode *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v5 = -[SCNNode sceneRef](self, "sceneRef");
  v6 = (uint64_t)v5;
  if (v5)
    C3DSceneLock((uint64_t)v5);
  SubdividedCopy = C3DNodeCreateSubdividedCopy((uint64_t)self->_node, v3);
  v8 = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", SubdividedCopy);
  if (SubdividedCopy)
    CFRelease(SubdividedCopy);
  if (-[SCNNode skinner](v8, "skinner"))
    -[SCNSkinner setSkeleton:](-[SCNNode skinner](v8, "skinner"), "setSkeleton:", -[SCNSkinner skeleton](-[SCNNode skinner](self, "skinner"), "skeleton"));
  -[SCNNode _copyAnimationsFrom:](v8, "_copyAnimationsFrom:", self);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = -[SCNNode actionKeys](self, "actionKeys", 0);
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        -[SCNNode runAction:forKey:](v8, "runAction:forKey:", -[SCNNode actionForKey:](self, "actionForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13)), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13));
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }
  if (v6)
    C3DSceneUnlock(v6);
  return v8;
}

- (void)_setPausedOrPausedByInheritance:(BOOL)a3
{
  unsigned int v3;
  _BOOL8 v4;
  char v6;
  __C3DScene *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  BOOL v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = *((unsigned __int8 *)self + 40);
  if (a3 != v3 >> 7)
  {
    v4 = a3;
    v6 = a3 ? 0x80 : 0;
    *((_BYTE *)self + 40) = v6 & 0x80 | v3 & 0x7F;
    v7 = -[SCNNode sceneRef](self, "sceneRef");
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __43__SCNNode__setPausedOrPausedByInheritance___block_invoke;
    v18[3] = &unk_1EA59E478;
    v18[4] = self;
    v19 = v4;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v18);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = -[SCNNode childNodes](self, "childNodes", 0);
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_msgSend(v13, "isPaused") & 1) == 0)
            objc_msgSend(v13, "_setPausedOrPausedByInheritance:", v4);
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v10);
    }
  }
}

uint64_t __43__SCNNode__setPausedOrPausedByInheritance___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "animationKeys");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "_pauseAnimation:forKey:pausedByNode:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), 1);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v4);
  }
  C3DTransactionGetAtomicTime();
  v8 = v7;
  v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "allValues");
  v10 = v9;
  if (*(_BYTE *)(a1 + 40))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    result = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (result)
    {
      v12 = result;
      v13 = *(_QWORD *)v25;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v14);
          if ((objc_msgSend(v15, "finished") & 1) == 0)
            SCNActionWasPausedAtTime(v15, *(SCNNode **)(a1 + 32), v8);
          ++v14;
        }
        while (v12 != v14);
        result = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        v12 = result;
      }
      while (result);
    }
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    result = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    if (result)
    {
      v16 = result;
      v17 = *(_QWORD *)v21;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v10);
          v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v18);
          if ((objc_msgSend(v19, "finished") & 1) == 0)
            SCNActionWillResumeAtTime(v19, *(SCNNode **)(a1 + 32), v8);
          ++v18;
        }
        while (v16 != v18);
        result = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
        v16 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)setPaused:(BOOL)paused
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 40);
  if (((((v3 & 0x40) == 0) ^ paused) & 1) == 0)
  {
    if (paused)
      v4 = 64;
    else
      v4 = 0;
    *((_BYTE *)self + 40) = v3 & 0xBF | v4;
    -[SCNNode _setPausedOrPausedByInheritance:](self, "_setPausedOrPausedByInheritance:", -[SCNNode isPausedOrPausedByInheritance](-[SCNNode parentNode](self, "parentNode"), "isPausedOrPausedByInheritance") | paused);
  }
}

- (BOOL)isPausedOrPausedByInheritance
{
  return *((unsigned __int8 *)self + 40) >> 7;
}

- (BOOL)isPaused
{
  return (*((unsigned __int8 *)self + 40) >> 6) & 1;
}

- (CGRect)_focusFrameInView:(id)a3
{
  int32x4_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  int32x4_t v9;
  int32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  uint64_t i;
  float32x2_t *v16;
  float32x4_t v17;
  __int32 v18;
  __int32 v19;
  float64x2_t v20;
  uint64_t v21;
  double v22;
  float64x2_t v23;
  float64x2_t v24;
  double v25;
  double v26;
  double v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  _QWORD v32[2];
  int32x2_t v33[2];
  float32x2_t v34;
  __int128 v35;
  __int32 v36;
  __int128 v37;
  __int32 v38;
  int32x2_t v39;
  int v40;
  int v41;
  __int128 v42;
  int32x4_t v43;
  uint64_t v44;
  CGRect result;

  v44 = *MEMORY[0x1E0C80C00];
  v33[1].i32[0] = 0;
  v33[0] = 0;
  memset(v32, 0, 12);
  if (-[SCNNode getBoundingBoxMin:max:](self, "getBoundingBoxMin:max:", v33, v32))
  {
    *(_QWORD *)&v6 = __PAIR64__(v32[0], v33[1].u32[0]);
    v34 = (float32x2_t)v33[0];
    v38 = v33[1].i32[0];
    v5.i64[0] = *(_QWORD *)((char *)v32 + 4);
    *(_QWORD *)&v7 = __PAIR64__(v33[1].u32[0], HIDWORD(v32[0]));
    *((int32x2_t *)&v6 + 1) = *(int32x2_t *)((char *)v33 + 4);
    v35 = v6;
    v36 = v33[0].i32[0];
    *((_QWORD *)&v7 + 1) = v32[0];
    v37 = v7;
    v39 = v33[0];
    v40 = v32[1];
    v41 = v32[0];
    *(int32x2_t *)&v8 = vzip2_s32(v33[0], *(int32x2_t *)((char *)v32 + 4));
    *((int32x2_t *)&v8 + 1) = vzip1_s32(v33[0], *(int32x2_t *)((char *)v32 + 4));
    v9 = vuzp2q_s32(v5, vzip1q_s32(v5, v5));
    v10 = v9;
    v10.i32[1] = v32[0];
    v10.i32[3] = v9.i32[0];
    v42 = v8;
    v43 = v10;
    -[SCNNode simdWorldTransform](self, "simdWorldTransform");
    v30 = v13;
    v31 = v12;
    v28 = v14;
    v29 = v11;
    for (i = 0; i != 24; i += 3)
    {
      v16 = (float32x2_t *)((char *)&v34 + i * 4);
      v17 = vaddq_f32(v28, vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v31, v34.f32[i]), v30, v34.f32[i + 1]), v29, *(float *)((char *)&v34 + i * 4 + 8)));
      v11.i32[0] = v17.i32[2];
      objc_msgSend(a3, "projectPoint:", *(double *)v17.i64, COERCE_DOUBLE(__PAIR64__(v28.u32[1], v17.u32[1])), *(double *)v11.i64, *(_OWORD *)&v28, *(_OWORD *)&v29, *(_OWORD *)&v30, *(_OWORD *)&v31);
      v16->i32[0] = v18;
      v16->i32[1] = v19;
      v16[1].i32[0] = v11.i32[0];
    }
    v20 = vcvtq_f64_f32(v34);
    v21 = 12;
    v22 = v20.f64[0];
    v23 = v20;
    do
    {
      v24 = vcvtq_f64_f32(*(float32x2_t *)((char *)&v34 + v21));
      v23 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v24, v23), (int8x16_t)v23, (int8x16_t)v24);
      if (v22 < v24.f64[0])
        v22 = v24.f64[0];
      v21 += 12;
    }
    while (v21 != 96);
    v25 = v22 - v23.f64[0];
    v26 = v23.f64[1];
    v27 = vsubq_f64(v20, v23).f64[1];
  }
  else
  {
    v23.f64[0] = 0.0;
    v26 = 0.0;
    v25 = 0.0;
    v27 = 0.0;
  }
  result.origin.x = v23.f64[0];
  result.size.height = v27;
  result.size.width = v25;
  result.origin.y = v26;
  return result;
}

- (void)_appendFocusableNodesInRect:(CGRect)a3 ofView:(id)a4 toFocusItems:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  NSMutableArray *childNodes;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGRect v23;
  CGRect v24;

  v22 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)self + 42) & 0x20) != 0)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    if (-[SCNNode isFocusInteractionEnabled](self, "isFocusInteractionEnabled"))
    {
      if (!-[SCNNode _isEffectivelyHidden](self, "_isEffectivelyHidden"))
      {
        -[SCNNode _focusFrameInView:](self, "_focusFrameInView:", a4);
        v24.origin.x = x;
        v24.origin.y = y;
        v24.size.width = width;
        v24.size.height = height;
        if (CGRectIntersectsRect(v23, v24))
          objc_msgSend(a5, "addObject:", self);
      }
    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    childNodes = self->_childNodes;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](childNodes, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(childNodes);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "_appendFocusableNodesInRect:ofView:toFocusItems:", a4, a5, x, y, width, height);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](childNodes, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }
  }
}

- (void)_setHasFocusableChild
{
  if ((*((_BYTE *)self + 42) & 0x20) == 0)
  {
    *((_BYTE *)self + 42) |= 0x20u;
    -[SCNNode _setHasFocusableChild](self->_parent, "_setHasFocusableChild");
  }
}

- (void)_updateFocusableCache
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. _updateFocusableCache - invoked on a non focusable node (waste of time)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (BOOL)canBecomeFocused
{
  return (*((_BYTE *)self + 42) & 0x18) == 16;
}

- (BOOL)isFocusInteractionEnabled
{
  return (*((_BYTE *)self + 42) & 0x18) != 0;
}

- (BOOL)_isEffectivelyHidden
{
  double v4;

  if (-[SCNNode _isEffectivelyHidden](-[SCNNode parentNode](self, "parentNode"), "_isEffectivelyHidden")
    || -[SCNNode isHidden](self, "isHidden"))
  {
    return 1;
  }
  -[SCNNode opacity](self, "opacity");
  return v4 <= 0.00000011920929;
}

- (NSArray)preferredFocusEnvironments
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  if (-[SCNNode parentNode](self, "parentNode"))
    return (UIFocusEnvironment *)-[SCNNode parentNode](self, "parentNode");
  else
    return (UIFocusEnvironment *)+[SCNView _currentSCNViewFocusEnvironment](SCNView, "_currentSCNViewFocusEnvironment");
}

- (void)setNeedsFocusUpdate
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA5E0], "focusSystemForEnvironment:", self), "requestFocusUpdateToEnvironment:", self);
}

- (void)updateFocusIfNeeded
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA5E0], "focusSystemForEnvironment:", self), "updateFocusIfNeeded");
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (BOOL)_isEligibleForFocusInteraction
{
  if ((*((_BYTE *)self + 42) & 0x20) != 0)
    return !-[SCNNode _isEffectivelyHidden](self, "_isEffectivelyHidden");
  else
    return 0;
}

- (CGRect)frame
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v3 = +[SCNView _currentSCNViewFocusEnvironment](SCNView, "_currentSCNViewFocusEnvironment");
  v4 = -[UIFocusItemContainer coordinateSpace](-[SCNNode focusItemContainer](self, "focusItemContainer"), "coordinateSpace");
  if (v4 != objc_msgSend(v3, "coordinateSpace"))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[SCNNode frame].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  -[SCNNode _focusFrameInView:](self, "_focusFrameInView:", v3);
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (UICoordinateSpace)coordinateSpace
{
  return (UICoordinateSpace *)objc_msgSend((id)objc_msgSend(+[SCNView _currentSCNViewFocusEnvironment](SCNView, "_currentSCNViewFocusEnvironment"), "focusItemContainer"), "coordinateSpace");
}

- (id)focusItemsInRect:(CGRect)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)runAction:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  SCNOrderedDictionary *actions;
  __C3DScene *v11;
  _QWORD v12[7];

  if (a4)
  {
    v8 = a4;
    -[SCNNode removeActionForKey:](self, "removeActionForKey:", a4);
    if (!a3)
    {
LABEL_10:
      if (a5)
        (*((void (**)(id))a5 + 2))(a5);
      return;
    }
  }
  else
  {
    if (!a3)
      goto LABEL_10;
    v8 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
  }
  v9 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v9, "setCompletionBlock:", a5);
  objc_msgSend(v9, "setKey:", v8);
  objc_sync_enter(self);
  actions = self->_actions;
  if (!actions)
  {
    actions = objc_alloc_init(SCNOrderedDictionary);
    self->_actions = actions;
  }
  -[SCNOrderedDictionary setValue:forKey:](actions, "setValue:forKey:", v9, v8);
  objc_sync_exit(self);
  v11 = -[SCNNode sceneRef](self, "sceneRef");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__SCNNode_runAction_forKey_completionHandler___block_invoke;
  v12[3] = &unk_1EA59F718;
  v12[4] = self;
  v12[5] = v9;
  v12[6] = v8;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v11, self, v12);

}

uint64_t __46__SCNNode_runAction_forKey_completionHandler___block_invoke(uint64_t a1)
{
  SCNNode *v2;
  void *v3;
  uint64_t v4;

  C3DEntityAddAction((_QWORD *)objc_msgSend(*(id *)(a1 + 32), "nodeRef"), *(const void **)(a1 + 40), *(void **)(a1 + 48));
  v4 = a1 + 32;
  v2 = *(SCNNode **)(a1 + 32);
  v3 = *(void **)(v4 + 8);
  C3DTransactionGetAtomicTime();
  return SCNActionWasAddedToTargetAtTime(v3, v2);
}

- (void)runAction:(id)a3
{
  -[SCNNode runAction:forKey:completionHandler:](self, "runAction:forKey:completionHandler:", a3, 0, 0);
}

- (void)runAction:(id)a3 completionHandler:(id)a4
{
  -[SCNNode runAction:forKey:completionHandler:](self, "runAction:forKey:completionHandler:", a3, 0, a4);
}

- (void)runAction:(id)a3 forKey:(id)a4
{
  -[SCNNode runAction:forKey:completionHandler:](self, "runAction:forKey:completionHandler:", a3, a4, 0);
}

- (id)actions
{
  return -[SCNOrderedDictionary allValues](self->_actions, "allValues");
}

- (BOOL)hasActions
{
  return -[SCNOrderedDictionary count](self->_actions, "count") != 0;
}

- (id)actionForKey:(id)a3
{
  id v5;

  objc_sync_enter(self);
  v5 = -[SCNOrderedDictionary objectForKey:](self->_actions, "objectForKey:", a3);
  objc_sync_exit(self);
  return v5;
}

- (void)_removeAction:(id)a3 forKey:(id)a4
{
  __C3DScene *v7;
  _QWORD v8[7];

  objc_sync_enter(self);
  if (-[SCNOrderedDictionary objectForKey:](self->_actions, "objectForKey:", a4) == a3)
  {
    -[SCNOrderedDictionary removeObjectForKey:](self->_actions, "removeObjectForKey:", a4);
    objc_sync_exit(self);
    if (a3)
    {
      v7 = -[SCNNode sceneRef](self, "sceneRef");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __32__SCNNode__removeAction_forKey___block_invoke;
      v8[3] = &unk_1EA59F718;
      v8[4] = self;
      v8[5] = a3;
      v8[6] = a4;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v8);
    }
  }
  else
  {
    objc_sync_exit(self);
  }
}

void __32__SCNNode__removeAction_forKey___block_invoke(uint64_t a1)
{
  _C3DEntityCleanupActionForKey((CFTypeRef *)objc_msgSend(*(id *)(a1 + 32), "nodeRef"), *(const void **)(a1 + 40), *(const char **)(a1 + 48));
}

- (void)removeActionForKey:(id)a3
{
  id v5;
  id v6;
  id v7;
  __C3DScene *v8;
  _QWORD v9[7];

  objc_sync_enter(self);
  v5 = -[SCNOrderedDictionary objectForKey:](self->_actions, "objectForKey:", a3);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    -[SCNOrderedDictionary removeObjectForKey:](self->_actions, "removeObjectForKey:", a3);
    objc_sync_exit(self);
    v8 = -[SCNNode sceneRef](self, "sceneRef");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __30__SCNNode_removeActionForKey___block_invoke;
    v9[3] = &unk_1EA59F718;
    v9[4] = self;
    v9[5] = a3;
    v9[6] = v6;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, self, v9);
  }
  else
  {
    objc_sync_exit(self);
  }
}

void __30__SCNNode_removeActionForKey___block_invoke(id *a1)
{
  id v2;
  id *v3;
  double v4;

  C3DEntityRemoveActionForKey((_QWORD *)objc_msgSend(a1[4], "nodeRef"), a1[5]);
  v2 = a1[6];
  v3 = (id *)a1[4];
  C3DTransactionGetAtomicTime();
  SCNActionWasRemovedFromTargetAtTime(v2, v3, v4);

}

- (void)removeAllActions
{
  uint64_t v3;
  __C3DScene *v4;
  _QWORD v5[6];

  objc_sync_enter(self);
  v3 = objc_msgSend(-[SCNOrderedDictionary dictionary](self->_actions, "dictionary"), "copy");
  -[SCNOrderedDictionary removeAllObjects](self->_actions, "removeAllObjects");
  objc_sync_exit(self);
  v4 = -[SCNNode sceneRef](self, "sceneRef");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__SCNNode_removeAllActions__block_invoke;
  v5[3] = &unk_1EA59F740;
  v5[4] = self;
  v5[5] = v3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v4, self, v5);
}

void __27__SCNNode_removeAllActions__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  C3DEntityRemoveAllActions((_QWORD *)objc_msgSend(*(id *)(a1 + 32), "nodeRef"));
  C3DTransactionGetAtomicTime();
  v3 = v2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "allValues", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        SCNActionWasRemovedFromTargetAtTime(*(void **)(*((_QWORD *)&v9 + 1) + 8 * v8++), *(id **)(a1 + 32), v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void __26__SCNNode_setConstraints___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = *(void **)(a1 + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "constraintRef"));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
    C3DNodeSetConstraints(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), (const __CFDictionary *)v3);
  }
  else
  {
    C3DNodeSetConstraints(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), 0);
  }
}

uint64_t __27__SCNNode_setPhysicsField___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_removeOwner");
  return objc_msgSend(*(id *)(a1 + 40), "_setOwner:", *(_QWORD *)(a1 + 48));
}

- (GKEntity)entity
{
  return (GKEntity *)-[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 10);
}

- (void)setEntity:(GKEntity *)entity
{
  if (-[SCNNode entity](self, "entity") != entity)
  {
    -[SCNNode _removeComponentWithType:](self, "_removeComponentWithType:", 10);
    if (entity)
      -[SCNNode _assignComponent:toContainerWithType:](self, "_assignComponent:toContainerWithType:", entity, 10);
  }
}

- (void)_removeDeadParticleSystem:(__C3DParticleSystem *)a3
{
  objc_msgSend(-[SCNNode _particleSystems](self, "_particleSystems"), "removeObject:", +[SCNParticleSystem particleSystemWithParticleSystemRef:](SCNParticleSystem, "particleSystemWithParticleSystemRef:"));
  C3DNodeRemoveParticleSystem((uint64_t)-[SCNNode nodeRef](self, "nodeRef"), a3, 0);
}

- (void)addParticleSystem:(SCNParticleSystem *)system
{
  __C3DScene *v5;
  uint64_t v6;
  id v7;
  __C3DScene *v8;
  NSObject *v9;
  _QWORD v10[6];

  if (system)
  {
    v5 = -[SCNNode sceneRef](self, "sceneRef");
    v6 = (uint64_t)v5;
    if (v5)
      C3DSceneLock((uint64_t)v5);
    v7 = -[SCNNode _particleSystems](self, "_particleSystems");
    if (!v7)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[SCNNode _assignComponent:toContainerWithType:](self, "_assignComponent:toContainerWithType:", v7, 6);

    }
    objc_msgSend(v7, "addObject:", system);
    if (v6)
      C3DSceneUnlock(v6);
    v8 = -[SCNNode sceneRef](self, "sceneRef");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __29__SCNNode_addParticleSystem___block_invoke;
    v10[3] = &unk_1EA59F740;
    v10[4] = self;
    v10[5] = system;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, self, v10);
  }
  else
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SCNNode addParticleSystem:].cold.1();
  }
}

void __29__SCNNode_addParticleSystem___block_invoke(uint64_t a1)
{
  C3DNodeAddParticleSystem(objc_msgSend(*(id *)(a1 + 32), "nodeRef"), (void *)objc_msgSend(*(id *)(a1 + 40), "__CFObject"));
}

- (void)removeAllParticleSystems
{
  __C3DScene *v3;
  uint64_t v4;
  __C3DScene *v5;
  _QWORD v6[5];

  v3 = -[SCNNode sceneRef](self, "sceneRef");
  if (v3)
  {
    v4 = (uint64_t)v3;
    C3DSceneLock((uint64_t)v3);
    -[SCNNode _removeComponentWithType:](self, "_removeComponentWithType:", 6);
    C3DSceneUnlock(v4);
  }
  else
  {
    -[SCNNode _removeComponentWithType:](self, "_removeComponentWithType:", 6);
  }
  v5 = -[SCNNode sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__SCNNode_removeAllParticleSystems__block_invoke;
  v6[3] = &unk_1EA59E4A0;
  v6[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __35__SCNNode_removeAllParticleSystems__block_invoke(uint64_t a1)
{
  C3DNodeRemoveAllParticleSystems(objc_msgSend(*(id *)(a1 + 32), "nodeRef"));
}

- (void)removeParticleSystem:(SCNParticleSystem *)system
{
  __C3DScene *v5;
  uint64_t v6;
  __C3DScene *v7;
  _QWORD v8[6];

  v5 = -[SCNNode sceneRef](self, "sceneRef");
  if (v5)
  {
    v6 = (uint64_t)v5;
    C3DSceneLock((uint64_t)v5);
    objc_msgSend(-[SCNNode _particleSystems](self, "_particleSystems"), "removeObject:", system);
    C3DSceneUnlock(v6);
  }
  else
  {
    objc_msgSend(-[SCNNode _particleSystems](self, "_particleSystems"), "removeObject:", system);
  }
  v7 = -[SCNNode sceneRef](self, "sceneRef");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__SCNNode_removeParticleSystem___block_invoke;
  v8[3] = &unk_1EA59F740;
  v8[4] = self;
  v8[5] = system;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v8);
}

void __32__SCNNode_removeParticleSystem___block_invoke(uint64_t a1)
{
  C3DNodeRemoveParticleSystem(objc_msgSend(*(id *)(a1 + 32), "nodeRef"), (const void *)objc_msgSend(*(id *)(a1 + 40), "__CFObject"), 1);
}

- (unint64_t)countOfParticleSystems
{
  return objc_msgSend(-[SCNNode _particleSystems](self, "_particleSystems"), "count");
}

- (id)objectInParticleSystemsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend(-[SCNNode _particleSystems](self, "_particleSystems"), "objectAtIndex:", a3);
}

- (void)insertObject:(id)a3 inParticleSystemsAtIndex:(unint64_t)a4
{
  __C3DScene *v7;
  uint64_t v8;
  id v9;
  __C3DScene *v10;
  _QWORD v11[7];

  v7 = -[SCNNode sceneRef](self, "sceneRef");
  v8 = (uint64_t)v7;
  if (v7)
    C3DSceneLock((uint64_t)v7);
  v9 = -[SCNNode _particleSystems](self, "_particleSystems");
  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[SCNNode _assignComponent:toContainerWithType:](self, "_assignComponent:toContainerWithType:", v9, 6);

  }
  objc_msgSend(v9, "insertObject:atIndex:", a3, a4);
  if (v8)
    C3DSceneUnlock(v8);
  v10 = -[SCNNode sceneRef](self, "sceneRef");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__SCNNode_insertObject_inParticleSystemsAtIndex___block_invoke;
  v11[3] = &unk_1EA59E2B0;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = a4;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v10, self, v11);
}

void __49__SCNNode_insertObject_inParticleSystemsAtIndex___block_invoke(uint64_t a1)
{
  C3DNodeInsertParticleSystemAtIndex(objc_msgSend(*(id *)(a1 + 32), "nodeRef"), (void *)objc_msgSend(*(id *)(a1 + 40), "__CFObject"), *(_QWORD *)(a1 + 48));
}

- (void)removeObjectFromParticleSystemsAtIndex:(unint64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __C3DScene *v13;
  uint64_t v14;
  __C3DScene *v15;
  _QWORD v16[6];

  if (objc_msgSend(-[SCNNode _particleSystems](self, "_particleSystems"), "count") <= a3)
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[SCNNode removeObjectFromParticleSystemsAtIndex:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = -[SCNNode sceneRef](self, "sceneRef");
  if (v13)
  {
    v14 = (uint64_t)v13;
    C3DSceneLock((uint64_t)v13);
    objc_msgSend(-[SCNNode _particleSystems](self, "_particleSystems"), "removeObjectAtIndex:", a3);
    C3DSceneUnlock(v14);
  }
  else
  {
    objc_msgSend(-[SCNNode _particleSystems](self, "_particleSystems"), "removeObjectAtIndex:", a3);
  }
  v15 = -[SCNNode sceneRef](self, "sceneRef");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__SCNNode_removeObjectFromParticleSystemsAtIndex___block_invoke;
  v16[3] = &unk_1EA59E450;
  v16[4] = self;
  v16[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v15, self, v16);
}

void __50__SCNNode_removeObjectFromParticleSystemsAtIndex___block_invoke(uint64_t a1)
{
  C3DNodeRemoveParticleSystemAtIndex(objc_msgSend(*(id *)(a1 + 32), "nodeRef"), *(_QWORD *)(a1 + 40), 1);
}

- (void)replaceObjectInParticleSystemsAtIndex:(unint64_t)a3 withObject:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __C3DScene *v15;
  __C3DScene *v16;
  uint64_t v17;
  _QWORD v18[7];

  if (!a4)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[SCNNode replaceObjectInParticleSystemsAtIndex:withObject:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v15 = -[SCNNode sceneRef](self, "sceneRef");
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__SCNNode_replaceObjectInParticleSystemsAtIndex_withObject___block_invoke;
  v18[3] = &unk_1EA59E2B0;
  v18[4] = self;
  v18[5] = a4;
  v18[6] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v15, self, v18);
  v16 = -[SCNNode sceneRef](self, "sceneRef");
  if (v16)
  {
    v17 = (uint64_t)v16;
    C3DSceneLock((uint64_t)v16);
    objc_msgSend(-[SCNNode _particleSystems](self, "_particleSystems"), "replaceObjectAtIndex:withObject:", a3, a4);
    C3DSceneUnlock(v17);
  }
  else
  {
    objc_msgSend(-[SCNNode _particleSystems](self, "_particleSystems"), "replaceObjectAtIndex:withObject:", a3, a4);
  }
}

void __60__SCNNode_replaceObjectInParticleSystemsAtIndex_withObject___block_invoke(uint64_t a1)
{
  C3DNodeReplaceParticleSystemAtIndex(objc_msgSend(*(id *)(a1 + 32), "nodeRef"), (void *)objc_msgSend(*(id *)(a1 + 40), "__CFObject"), *(_QWORD *)(a1 + 48));
}

- (id)_audioPlayers
{
  __C3DScene *v3;
  uint64_t v4;
  __C3DNode *v5;
  id v6;

  v3 = -[SCNNode sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  v5 = -[SCNNode nodeRef](self, "nodeRef");
  if (!v5)
  {
    v6 = 0;
    if (!v4)
      return v6;
    goto LABEL_5;
  }
  v6 = (id)-[__CFDictionary copy](C3DNodeGetAudioPlayers((uint64_t)v5), "copy");
  if (v4)
LABEL_5:
    C3DSceneUnlock(v4);
  return v6;
}

- (void)addAudioPlayer:(SCNAudioPlayer *)player
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if (player)
  {
    v5 = -[SCNNode sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __26__SCNNode_addAudioPlayer___block_invoke;
    v7[3] = &unk_1EA59F740;
    v7[4] = player;
    v7[5] = self;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
  }
  else
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNNode addAudioPlayer:].cold.1();
  }
}

uint64_t __26__SCNNode_addAudioPlayer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "nodeRef");
  if (v2)
    C3DNodeRemoveAudioPlayer(v2, *(const void **)(a1 + 32), 1);
  v3 = objc_msgSend(*(id *)(a1 + 40), "nodeRef");
  objc_msgSend(*(id *)(a1 + 32), "setNodeRef:", v3);
  return C3DNodeAddAudioPlayer(v3, *(void **)(a1 + 32));
}

- (void)removeAllAudioPlayers
{
  __C3DScene *v3;
  _QWORD v4[5];

  v3 = -[SCNNode sceneRef](self, "sceneRef");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__SCNNode_removeAllAudioPlayers__block_invoke;
  v4[3] = &unk_1EA59E4A0;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v3, self, v4);
}

void __32__SCNNode_removeAllAudioPlayers__block_invoke(uint64_t a1)
{
  C3DNodeRemoveAllAudioPlayers(objc_msgSend(*(id *)(a1 + 32), "nodeRef"));
}

- (void)removeAudioPlayer:(SCNAudioPlayer *)player
{
  __C3DScene *v5;
  _QWORD v6[6];

  v5 = -[SCNNode sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__SCNNode_removeAudioPlayer___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = player;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __29__SCNNode_removeAudioPlayer___block_invoke(uint64_t a1)
{
  C3DNodeRemoveAudioPlayer(objc_msgSend(*(id *)(a1 + 32), "nodeRef"), *(const void **)(a1 + 40), 1);
  return objc_msgSend(*(id *)(a1 + 40), "recycle");
}

- (unint64_t)countOfAudioPlayers
{
  return -[NSArray count](-[SCNNode audioPlayers](self, "audioPlayers"), "count");
}

- (id)objectInAudioPlayersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](-[SCNNode audioPlayers](self, "audioPlayers"), "objectAtIndex:", a3);
}

- (void)insertObject:(id)a3 inAudioPlayersAtIndex:(unint64_t)a4
{
  __C3DScene *v7;
  _QWORD v8[7];

  v7 = -[SCNNode sceneRef](self, "sceneRef");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__SCNNode_insertObject_inAudioPlayersAtIndex___block_invoke;
  v8[3] = &unk_1EA59E2B0;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v8);
}

uint64_t __46__SCNNode_insertObject_inAudioPlayersAtIndex___block_invoke(uint64_t a1)
{
  return C3DNodeInsertAudioPlayerAtIndex(objc_msgSend(*(id *)(a1 + 32), "nodeRef"), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)removeObjectFromAudioPlayersAtIndex:(unint64_t)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  v5 = -[SCNNode sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__SCNNode_removeObjectFromAudioPlayersAtIndex___block_invoke;
  v6[3] = &unk_1EA59E450;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __47__SCNNode_removeObjectFromAudioPlayersAtIndex___block_invoke(uint64_t a1)
{
  C3DNodeRemoveAudioPlayerAtIndex(objc_msgSend(*(id *)(a1 + 32), "nodeRef"), *(_QWORD *)(a1 + 40), 1);
}

- (void)replaceObjectInAudioPlayerAtIndex:(unint64_t)a3 withObject:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __C3DScene *v15;
  _QWORD v16[7];

  if (!a4)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[SCNNode replaceObjectInParticleSystemsAtIndex:withObject:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v15 = -[SCNNode sceneRef](self, "sceneRef");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__SCNNode_replaceObjectInAudioPlayerAtIndex_withObject___block_invoke;
  v16[3] = &unk_1EA59E2B0;
  v16[4] = self;
  v16[5] = a4;
  v16[6] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v15, self, v16);
}

void __56__SCNNode_replaceObjectInAudioPlayerAtIndex_withObject___block_invoke(uint64_t a1)
{
  C3DNodeReplaceAudioPlayerAtIndex((float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "nodeRef"), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (SCNVector3)convertPosition:(SCNVector3)position toNode:(SCNNode *)node
{
  float y;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  SCNVector3 result;

  y = position.y;
  -[SCNNode simdConvertPosition:toNode:](self, "simdConvertPosition:toNode:", node, *(double *)&position.x);
  v7 = v6;
  v9 = v8;
  result.z = v9;
  result.y = v7;
  result.x = v5;
  return result;
}

- (SCNVector3)convertPosition:(SCNVector3)position fromNode:(SCNNode *)node
{
  float y;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  SCNVector3 result;

  y = position.y;
  -[SCNNode simdConvertPosition:fromNode:](self, "simdConvertPosition:fromNode:", node, *(double *)&position.x);
  v7 = v6;
  v9 = v8;
  result.z = v9;
  result.y = v7;
  result.x = v5;
  return result;
}

- (SCNVector3)convertVector:(SCNVector3)vector toNode:(SCNNode *)node
{
  float y;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  SCNVector3 result;

  y = vector.y;
  -[SCNNode simdConvertVector:toNode:](self, "simdConvertVector:toNode:", node, *(double *)&vector.x);
  v7 = v6;
  v9 = v8;
  result.z = v9;
  result.y = v7;
  result.x = v5;
  return result;
}

- (SCNMatrix4)convertTransform:(SEL)a3 toNode:(SCNMatrix4 *)transform
{
  SCNMatrix4 *result;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  result = (SCNMatrix4 *)-[SCNNode simdConvertTransform:toNode:](self, "simdConvertTransform:toNode:", node, *(double *)&transform->m11, *(double *)&transform->m21, *(double *)&transform->m31, *(double *)&transform->m41);
  *(_OWORD *)&retstr->m11 = v7;
  *(_OWORD *)&retstr->m21 = v8;
  *(_OWORD *)&retstr->m31 = v9;
  *(_OWORD *)&retstr->m41 = v10;
  return result;
}

- (SCNMatrix4)convertTransform:(SEL)a3 fromNode:(SCNMatrix4 *)transform
{
  SCNMatrix4 *result;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  result = (SCNMatrix4 *)-[SCNNode simdConvertTransform:fromNode:](self, "simdConvertTransform:fromNode:", node, *(double *)&transform->m11, *(double *)&transform->m21, *(double *)&transform->m31, *(double *)&transform->m41);
  *(_OWORD *)&retstr->m11 = v7;
  *(_OWORD *)&retstr->m21 = v8;
  *(_OWORD *)&retstr->m31 = v9;
  *(_OWORD *)&retstr->m41 = v10;
  return result;
}

- (void)_customEncodingOfSCNNode:(id)a3 usePresentationInstance:(BOOL)a4
{
  _BOOL4 v4;
  SCNLight *v7;
  uint64_t v8;
  SCNGeometry *v9;
  uint64_t v10;
  SCNCamera *v11;
  uint64_t v12;
  char isKindOfClass;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  SCNVector3 *fixedBoundingBoxExtrema;
  SCNVector3 *v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  SCNNode *v25;
  void *v26;
  SCNOrderedDictionary *actions;
  uint64_t ID;
  void *v29;
  int v30;
  _OWORD v31[4];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;

  v4 = a4;
  if ((*((_BYTE *)self + 41) & 1) == 0)
    -[SCNNode _updateAffine](self, "_updateAffine");
  if (-[SCNNode light](self, "light"))
  {
    v7 = -[SCNNode light](self, "light");
    v8 = (uint64_t)v7;
    if (v4)
      v8 = -[SCNLight presentationLight](v7, "presentationLight");
    objc_msgSend(a3, "encodeObject:forKey:", v8, CFSTR("light"));
  }
  if (-[SCNNode geometry](self, "geometry"))
  {
    v9 = -[SCNNode geometry](self, "geometry");
    v10 = (uint64_t)v9;
    if (v4)
      v10 = -[SCNGeometry presentationGeometry](v9, "presentationGeometry");
    objc_msgSend(a3, "encodeObject:forKey:", v10, CFSTR("geometry"));
  }
  if (-[SCNNode camera](self, "camera"))
  {
    v11 = -[SCNNode camera](self, "camera");
    v12 = (uint64_t)v11;
    if (v4)
      v12 = -[SCNCamera presentationCamera](v11, "presentationCamera");
    objc_msgSend(a3, "encodeObject:forKey:", v12, CFSTR("camera"));
  }
  if (-[SCNNode skinner](self, "skinner"))
    objc_msgSend(a3, "encodeObject:forKey:", -[SCNNode skinner](self, "skinner"), CFSTR("skinner"));
  if (-[SCNNode morpher](self, "morpher"))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (a3
      && (isKindOfClass & 1) != 0
      && objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", CFSTR("SCNSceneExportCompressMorphTargets")), "BOOLValue")&& SCNEncodeMorpherUsingAnimCodec(a3, self))
    {
      objc_msgSend(a3, "setSkipMorphTargets:", 1);
      objc_msgSend(a3, "encodeObject:forKey:", -[SCNNode morpher](self, "morpher"), CFSTR("morpher"));
      objc_msgSend(a3, "setSkipMorphTargets:", 0);
    }
    else
    {
      objc_msgSend(a3, "encodeObject:forKey:", -[SCNNode morpher](self, "morpher"), CFSTR("morpher"));
    }
  }
  v14 = -[SCNNode postMorphingDeformers](self, "postMorphingDeformers");
  if (v14)
    objc_msgSend(a3, "encodeObject:forKey:", v14, CFSTR("postMorphingDeformers"));
  v15 = -[SCNNode postSkinningDeformers](self, "postSkinningDeformers");
  if (v15)
    objc_msgSend(a3, "encodeObject:forKey:", v15, CFSTR("postSkinningDeformers"));
  if (-[SCNNode filters](self, "filters"))
    objc_msgSend(a3, "encodeObject:forKey:", -[SCNNode filters](self, "filters"), CFSTR("filters"));
  if (-[SCNNode constraints](self, "constraints"))
    objc_msgSend(a3, "encodeObject:forKey:", -[SCNNode constraints](self, "constraints"), CFSTR("constraints"));
  if (-[SCNNode physicsBody](self, "physicsBody"))
    objc_msgSend(a3, "encodeObject:forKey:", -[SCNNode physicsBody](self, "physicsBody"), CFSTR("physicsBody"));
  if (-[SCNNode physicsField](self, "physicsField"))
    objc_msgSend(a3, "encodeObject:forKey:", -[SCNNode physicsField](self, "physicsField"), CFSTR("physicsField"));
  if (-[SCNNode particleSystems](self, "particleSystems"))
    objc_msgSend(a3, "encodeObject:forKey:", -[SCNNode particleSystems](self, "particleSystems"), CFSTR("particleSystem"));
  fixedBoundingBoxExtrema = self->_fixedBoundingBoxExtrema;
  if (fixedBoundingBoxExtrema)
  {
    *(float *)&v16 = fixedBoundingBoxExtrema->x;
    *(float *)&v17 = fixedBoundingBoxExtrema->y;
    *(float *)&v18 = fixedBoundingBoxExtrema->z;
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSCNVector3:", v16, v17, v18), CFSTR("fixedBoundingBoxExtrema[0]"));
    v20 = self->_fixedBoundingBoxExtrema;
    *(float *)&v21 = v20[1].x;
    *(float *)&v22 = v20[1].y;
    *(float *)&v23 = v20[1].z;
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSCNVector3:", v21, v22, v23), CFSTR("fixedBoundingBoxExtrema[1]"));
  }
  objc_msgSend(a3, "encodeBool:forKey:", (*((unsigned __int8 *)self + 40) >> 6) & 1, CFSTR("paused"));
  v24 = (*((unsigned __int8 *)self + 42) >> 3) & 3;
  if ((_DWORD)v24)
    objc_msgSend(a3, "encodeInt:forKey:", v24, CFSTR("focusBehavior"));
  if ((*((_BYTE *)self + 41) & 4) != 0)
  {
    v25 = self;
    if (v4)
      v25 = -[SCNNode presentationNode](self, "presentationNode");
    v26 = (void *)-[SCNNode valueForKey:](v25, "valueForKey:", CFSTR("kPivotKey"));
    if (v26)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(v26, "SCNMatrix4Value");
      v31[0] = v32;
      v31[1] = v33;
      v31[2] = v34;
      v31[3] = v35;
      SCNEncodeSCNMatrix4(a3, CFSTR("pivot"), (uint64_t)v31);
    }
  }
  actions = self->_actions;
  if (actions && !v4)
  {
    objc_msgSend(a3, "encodeObject:forKey:", -[SCNOrderedDictionary allKeys](actions, "allKeys"), CFSTR("action-keys"));
    objc_msgSend(a3, "encodeObject:forKey:", -[SCNOrderedDictionary dictionary](self->_actions, "dictionary"), CFSTR("actions"));
  }
  ID = C3DNodeGetID((uint64_t)self->_node);
  if (ID)
    objc_msgSend(a3, "encodeObject:forKey:", ID, CFSTR("nodeID"));
  os_unfair_lock_lock(&self->_valueForKeyLock);
  if (-[NSMutableDictionary count](self->_valueForKey, "count"))
  {
    v29 = (void *)-[NSMutableDictionary mutableCopy](self->_valueForKey, "mutableCopy");
    objc_msgSend(v29, "removeObjectForKey:", CFSTR("kPivotKey"));
    if (objc_msgSend(v29, "count"))
      objc_msgSend(a3, "encodeObject:forKey:", v29, CFSTR("clientAttributes"));

  }
  os_unfair_lock_unlock(&self->_valueForKeyLock);
  if (-[SCNNode _isAReference](self, "_isAReference") && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v30 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", CFSTR("SCNSceneExportEmbedReferences")), "BOOLValue");
  else
    v30 = 0;
  if (-[SCNNode childNodes](self, "childNodes"))
  {
    if ((!-[SCNNode _isAReference](self, "_isAReference") | v30) == 1)
      objc_msgSend(a3, "encodeObject:forKey:", -[SCNNode childNodes](self, "childNodes"), CFSTR("childNodes"));
  }
}

- (void)_customDecodingOfSCNNode:(id)a3
{
  const void *v5;
  char v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _OWORD v39[4];
  _OWORD v40[4];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _DWORD v52[3];
  _DWORD v53[3];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = (const void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nodeID"));
  if (v5)
    C3DNodeSetID((uint64_t)self->_node, v5);
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("paused")))
  {
    if (objc_msgSend(a3, "decodeBoolForKey:", CFSTR("paused")))
      v6 = 64;
    else
      v6 = 0;
    *((_BYTE *)self + 40) = *((_BYTE *)self + 40) & 0xBF | v6;
  }
  -[SCNNode setFocusBehavior:](self, "setFocusBehavior:", (int)objc_msgSend(a3, "decodeIntForKey:", CFSTR("focusBehavior")));
  v7 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
  v8 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
  v9 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
  *(_OWORD *)&self->_anon_30[2] = *MEMORY[0x1E0C83FF0];
  *(_OWORD *)&self->_anon_30[18] = v7;
  *(_OWORD *)&self->_anon_30[34] = v8;
  *(_OWORD *)&self->_anon_30[50] = v9;
  *((_BYTE *)self + 41) |= 2u;
  *((_BYTE *)self + 40) |= 0x3Eu;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("fixedBoundingBoxExtrema[0]")))
  {
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fixedBoundingBoxExtrema[0]")), "SCNVector3Value");
    v52[0] = v10;
    v52[1] = v11;
    v52[2] = v12;
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fixedBoundingBoxExtrema[1]")), "SCNVector3Value");
    v53[0] = v13;
    v53[1] = v14;
    v53[2] = v15;
    -[SCNNode setBoundingBoxMin:max:](self, "setBoundingBoxMin:max:", v52, v53);
  }
  v16 = (void *)objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("particleSystem"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v46 != v19)
          objc_enumerationMutation(v16);
        -[SCNNode addParticleSystem:](self, "addParticleSystem:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v18);
  }
  v21 = objc_opt_class();
  v22 = objc_msgSend(a3, "scn_decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v21, objc_opt_class(), CFSTR("actions"));
  if (v22)
  {
    v23 = (void *)v22;
    v24 = (void *)objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("action-keys"));
    if (!v24)
      v24 = (void *)objc_msgSend(v23, "allKeys");
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v42 != v27)
            objc_enumerationMutation(v24);
          -[SCNNode runAction:forKey:](self, "runAction:forKey:", objc_msgSend(v23, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j)), *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j));
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      }
      while (v26);
    }
  }
  v29 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", SCNUserInfoClasses(), CFSTR("clientAttributes"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SCNNode _setAttributes:](self, "_setAttributes:", (id)objc_msgSend(v29, "mutableCopy"));
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("pivot")))
  {
    SCNDecodeSCNMatrix4(a3, (uint64_t)CFSTR("pivot"), v40);
    v39[0] = v40[0];
    v39[1] = v40[1];
    v39[2] = v40[2];
    v39[3] = v40[3];
    -[SCNNode setPivot:](self, "setPivot:", v39);
  }
  -[SCNNode setLight:](self, "setLight:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("light")));
  -[SCNNode setGeometry:](self, "setGeometry:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("geometry")));
  -[SCNNode setCamera:](self, "setCamera:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("camera")));
  -[SCNNode setSkinner:](self, "setSkinner:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("skinner")));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "setAllTargetsFromAnimCodec:", SCNDecodeMorpherUsingAnimCodec(a3, self));
    -[SCNNode setMorpher:](self, "setMorpher:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("morpher")));
    objc_msgSend(a3, "setAllTargetsFromAnimCodec:", 0);
  }
  else
  {
    -[SCNNode setMorpher:](self, "setMorpher:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("morpher")));
  }
  -[SCNNode setPostMorphingDeformers:](self, "setPostMorphingDeformers:", objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("postMorphingDeformers")));
  -[SCNNode setPostSkinningDeformers:](self, "setPostSkinningDeformers:", objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("postSkinningDeformers")));
  -[SCNNode setFilters:](self, "setFilters:", objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("filters")));
  -[SCNNode setConstraints:](self, "setConstraints:", objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("constraints")));
  -[SCNNode setPhysicsField:](self, "setPhysicsField:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("physicsField")));
  v30 = (void *)objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("childNodes"));
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v36 != v33)
          objc_enumerationMutation(v30);
        -[SCNNode addChildNode:](self, "addChildNode:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * k));
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
    }
    while (v32);
  }
  -[SCNNode setPhysicsBody:](self, "setPhysicsBody:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("physicsBody")));
}

- (void)_encodeNodePropertiesWithCoder:(id)a3
{
  int v5;
  float v6;
  float v7;
  float v8;
  float v9;
  const __CFString *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  double v15;
  NSString *name;

  SCNEncodeVector3(a3, (uint64_t)CFSTR("position"), *(float *)&self->_position[2], *(float *)&self->_position[6], *(float *)&self->_position[10]);
  v5 = (*((unsigned __int8 *)self + 41) >> 4) & 3;
  switch(v5)
  {
    case 2:
      v6 = *(float *)&self->_anon_80[2];
      v7 = *(float *)&self->_anon_80[6];
      v8 = *(float *)&self->_anon_80[10];
      v9 = *(float *)&self->_anon_80[14];
      v10 = CFSTR("orientation");
LABEL_7:
      SCNEncodeVector4(a3, (uint64_t)v10, v6, v7, v8, v9);
      break;
    case 1:
      v6 = *(float *)&self->_anon_80[2];
      v7 = *(float *)&self->_anon_80[6];
      v8 = *(float *)&self->_anon_80[10];
      v9 = *(float *)&self->_anon_80[14];
      v10 = CFSTR("rotation");
      goto LABEL_7;
    case 0:
      SCNEncodeVector3(a3, (uint64_t)CFSTR("eulerAngles"), *(float *)&self->_anon_80[2], *(float *)&self->_anon_80[6], *(float *)&self->_anon_80[10]);
      break;
  }
  if ((*((_BYTE *)self + 41) & 0x30) != 0x10)
  {
    -[SCNNode rotation](self, "rotation");
    SCNEncodeVector4(a3, (uint64_t)CFSTR("rotation"), v11, v12, v13, v14);
  }
  SCNEncodeVector3(a3, (uint64_t)CFSTR("scale"), *(float *)&self->_scale[2], *(float *)&self->_scale[6], *(float *)&self->_scale[10]);
  *(float *)&v15 = self->_opacity;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("opacity"), v15);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_categoryBitMask, CFSTR("categoryBitMask"));
  objc_msgSend(a3, "encodeInteger:forKey:", ((unint64_t)*((unsigned __int8 *)self + 41) >> 6) & 1, CFSTR("movabilityHint"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_renderingOrder, CFSTR("renderingOrder"));
  name = self->_name;
  if (name)
    objc_msgSend(a3, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(a3, "encodeBool:forKey:", *((unsigned __int8 *)self + 41) >> 7, CFSTR("hidden"));
  objc_msgSend(a3, "encodeBool:forKey:", *((_BYTE *)self + 42) & 1, CFSTR("castsShadow"));
  objc_msgSend(a3, "encodeBool:forKey:", (*((unsigned __int8 *)self + 42) >> 1) & 1, CFSTR("depthPrePass"));
}

- (void)encodeWithCoder:(id)a3
{
  SCNNode *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", CFSTR("SCNSceneExportPresentationTree")), "BOOLValue"))
  {
    v5 = -[SCNNode presentationNode](self, "presentationNode");
    -[SCNNode _syncObjCModel](v5, "_syncObjCModel");
    -[SCNNode _updateAffine](v5, "_updateAffine");
    -[SCNNode _customEncodingOfSCNNode:usePresentationInstance:](self, "_customEncodingOfSCNNode:usePresentationInstance:", a3, 1);
    -[SCNNode _encodeNodePropertiesWithCoder:](v5, "_encodeNodePropertiesWithCoder:", a3);
    SCNEncodeEntity(a3, self);
  }
  else
  {
    -[SCNNode _customEncodingOfSCNNode:usePresentationInstance:](self, "_customEncodingOfSCNNode:usePresentationInstance:", a3, 0);
    -[SCNNode _encodeNodePropertiesWithCoder:](self, "_encodeNodePropertiesWithCoder:", a3);
    SCNEncodeEntity(a3, self);
    SCNEncodeAnimations(a3, self);
  }
}

- (SCNNode)initWithCoder:(id)a3
{
  SCNNode *v4;
  _BOOL8 v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SCNNode;
  v4 = -[SCNNode init](&v14, sel_init);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    v6 = C3DNodeCreate();
    v4->_node = (__C3DNode *)v6;
    if (v6)
      C3DEntitySetObjCWrapper(v6, v4);
    v4->_valueForKeyLock._os_unfair_lock_opaque = 0;
    -[SCNNode _syncObjCModel](v4, "_syncObjCModel");
    -[SCNNode setName:](v4, "setName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name")));
    -[SCNNode _customDecodingOfSCNNode:](v4, "_customDecodingOfSCNNode:", a3);
    *(float *)&v7 = SCNDecodeVector3(a3, (uint64_t)CFSTR("position"));
    -[SCNNode setPosition:](v4, "setPosition:", v7);
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("orientation")))
    {
      *(float *)&v8 = SCNDecodeVector4(a3, (uint64_t)CFSTR("orientation"));
      -[SCNNode setOrientation:](v4, "setOrientation:", v8);
    }
    else if (objc_msgSend(a3, "containsValueForKey:", CFSTR("eulerAngles")))
    {
      *(float *)&v9 = SCNDecodeVector3(a3, (uint64_t)CFSTR("eulerAngles"));
      -[SCNNode setEulerAngles:](v4, "setEulerAngles:", v9);
    }
    else
    {
      *(float *)&v10 = SCNDecodeVector4(a3, (uint64_t)CFSTR("rotation"));
      -[SCNNode setRotation:](v4, "setRotation:", v10);
    }
    *(float *)&v11 = SCNDecodeVector3(a3, (uint64_t)CFSTR("scale"));
    -[SCNNode setScale:](v4, "setScale:", v11);
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("opacity"));
    -[SCNNode setOpacity:](v4, "setOpacity:", v12);
    -[SCNNode setCategoryBitMask:](v4, "setCategoryBitMask:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("categoryBitMask")));
    -[SCNNode setMovabilityHint:](v4, "setMovabilityHint:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("movabilityHint")));
    -[SCNNode setRenderingOrder:](v4, "setRenderingOrder:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("renderingOrder")));
    -[SCNNode setHidden:](v4, "setHidden:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("hidden")));
    -[SCNNode setCastsShadow:](v4, "setCastsShadow:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("castsShadow")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("depthPrePass")))
      -[SCNNode setUsesDepthPrePass:](v4, "setUsesDepthPrePass:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("depthPrePass")));
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    SCNDecodeEntity(a3, v4);
    SCNDecodeAnimations(a3, v4);
    -[SCNNode _didDecodeSCNNode:](v4, "_didDecodeSCNNode:", a3);
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)authoringEnvironmentCompanionNode
{
  return objc_getAssociatedObject(self, &SCNAuthoringEnvironmentCompanionNodeKey);
}

- (void)setAuthoringEnvironmentCompanionNode:(id)a3
{
  objc_setAssociatedObject(self, &SCNAuthoringEnvironmentCompanionNodeKey, a3, 0);
}

- (id)authoringEnvironmentPresentationNode
{
  return objc_getAssociatedObject(self, &SCNAuthoringEnvironmentPresentationNodeKey);
}

- (void)setAuthoringEnvironmentPresentationNode:(id)a3
{
  objc_setAssociatedObject(self, &SCNAuthoringEnvironmentPresentationNodeKey, a3, (void *)1);
}

+ (SCNVector3)localUp
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  SCNVector3 result;

  objc_msgSend((id)objc_opt_class(), "simdLocalUp");
  v4 = v3;
  v6 = v5;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

+ (SCNVector3)localRight
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  SCNVector3 result;

  objc_msgSend((id)objc_opt_class(), "simdLocalRight");
  v4 = v3;
  v6 = v5;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

+ (SCNVector3)localFront
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  SCNVector3 result;

  objc_msgSend((id)objc_opt_class(), "simdLocalFront");
  v4 = v3;
  v6 = v5;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

- (SCNVector3)worldUp
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  SCNVector3 result;

  -[SCNNode simdWorldUp](self, "simdWorldUp");
  v4 = v3;
  v6 = v5;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

- (SCNVector3)worldRight
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  SCNVector3 result;

  -[SCNNode simdWorldRight](self, "simdWorldRight");
  v4 = v3;
  v6 = v5;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

- (SCNVector3)worldFront
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  SCNVector3 result;

  -[SCNNode simdWorldFront](self, "simdWorldFront");
  v4 = v3;
  v6 = v5;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

- (void)lookAt:(SCNVector3)worldTarget
{
  float y;

  y = worldTarget.y;
  -[SCNNode simdLookAt:](self, "simdLookAt:", *(double *)&worldTarget.x);
}

- (void)lookAt:(SCNVector3)worldTarget up:(SCNVector3)worldUp localFront:(SCNVector3)localFront
{
  float y;
  float v6;

  y = worldTarget.y;
  v6 = worldUp.y;
  -[SCNNode simdLookAt:up:localFront:](self, "simdLookAt:up:localFront:", *(double *)&worldTarget.x, *(double *)&worldUp.x, *(double *)&localFront.x);
}

- (void)localTranslateBy:(SCNVector3)translation
{
  float y;

  y = translation.y;
  -[SCNNode simdLocalTranslateBy:](self, "simdLocalTranslateBy:", *(double *)&translation.x);
}

- (void)localRotateBy:(SCNQuaternion)rotation
{
  float y;

  y = rotation.y;
  -[SCNNode simdLocalRotateBy:](self, "simdLocalRotateBy:", *(double *)&rotation.x);
}

- (void)rotateBy:(SCNQuaternion)worldRotation aroundTarget:(SCNVector3)worldTarget
{
  float y;
  float v5;

  y = worldRotation.y;
  v5 = worldTarget.y;
  -[SCNNode simdRotateBy:aroundTarget:](self, "simdRotateBy:aroundTarget:", *(double *)&worldRotation.x, *(double *)&worldTarget.x);
}

- (BOOL)simdGetBoundingSphereCenter:(SCNNode *)self radius:(SEL)a2
{
  float32x4_t *v2;
  _DWORD *v3;
  _DWORD *v4;
  float32x4_t *v5;
  SCNGeometry *v7;
  _BOOL4 v8;
  char v9;
  float32x4_t v10;
  float32_t v11;
  __C3DScene *v12;
  uint64_t v13;
  NSArray *v14;
  uint64_t v15;
  int32x4_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  int v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  uint64_t v27;
  float32x4_t v28;
  int8x16_t v29;
  float32x4_t v30;
  BOOL v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float v35;
  float32x4_t v36;
  float v37;
  float v38;
  float32x4_t v39;
  int32x4_t v40;
  _DWORD *v42;
  int32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  int8x16_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int32 v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  simd_float4x4 v60;
  float32x4_t v61;
  float32x4_t v62;
  int8x16_t v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;
  simd_float4x4 v67;
  simd_float4x4 v68;

  v66 = *MEMORY[0x1E0C80C00];
  if (self->_node)
  {
    v4 = v3;
    v5 = v2;
    v59 = 0uLL;
    if ((*((_BYTE *)self + 40) & 1) != 0)
    {
      v12 = -[SCNNode sceneRef](self, "sceneRef");
      v13 = (uint64_t)v12;
      if (v12)
        C3DSceneLock((uint64_t)v12);
      v9 = C3DGetBoundingSphere(self->_node, 1, (uint64_t)&v59);
      if (v5)
        *v5 = v59;
      if (v4)
        *v4 = v59.i32[3];
      if (v13)
        C3DSceneUnlock(v13);
    }
    else
    {
      v42 = v3;
      v58 = 0uLL;
      v7 = -[SCNNode geometry](self, "geometry");
      v57.i32[2] = 0;
      v57.i64[0] = 0;
      v56 = 0;
      if (v7)
      {
        v61.i32[2] = 0;
        v61.i64[0] = 0;
        v60.columns[0].i64[0] = 0;
        v8 = -[SCNGeometry getBoundingSphereCenter:radius:](v7, "getBoundingSphereCenter:radius:", &v61, &v60);
        v9 = v8;
        if (v8)
        {
          v10.i64[0] = v61.i64[0];
          v10.i32[2] = v61.i32[2];
          v11 = *(double *)v60.columns[0].i64;
          v10.f32[3] = v11;
          v59 = v10;
        }
      }
      else
      {
        v9 = 0;
      }
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v14 = -[SCNNode childNodes](self, "childNodes");
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
      if (v15)
      {
        v17 = v15;
        v18 = *(_QWORD *)v53;
        v16.i32[0] = -1;
        v43 = v16;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v53 != v18)
              objc_enumerationMutation(v14);
            v20 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
            v21 = objc_msgSend(v20, "simdGetBoundingSphereCenter:radius:", &v57, &v56);
            v22 = v57;
            v22.i32[3] = v56;
            v58 = v22;
            if (v21)
            {
              v50 = 0u;
              v51 = 0u;
              v48 = 0u;
              v49 = 0u;
              objc_msgSend(v20, "simdTransform");
              v46 = v24;
              v47 = v23;
              v44 = v26;
              v45 = v25;
              objc_msgSend(v20, "simdPivot");
              v68 = __invert_f4(v67);
              v27 = 0;
              v60 = v68;
              v61 = 0u;
              v62 = 0u;
              v63 = 0u;
              v64 = 0u;
              do
              {
                *(float32x4_t *)((char *)&v61 + v27 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v47, COERCE_FLOAT(*(_OWORD *)&v60.columns[v27])), v46, *(float32x2_t *)v60.columns[v27].f32, 1), v45, (float32x4_t)v60.columns[v27], 2), v44, (float32x4_t)v60.columns[v27], 3);
                ++v27;
              }
              while (v27 != 4);
              v28 = (float32x4_t)v63;
              v48 = v61;
              v49 = v62;
              v29 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v28, (int32x4_t)v28), v63, 0xCuLL), vnegq_f32(v62)), (float32x4_t)v63, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v49, (int32x4_t)v49), (int8x16_t)v62, 0xCuLL));
              v30 = vmulq_f32(v61, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v29, (int32x4_t)v29), v29, 0xCuLL));
              v31 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v30, 2), vaddq_f32(v30, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v30.f32, 1))).f32[0] < 0.0;
              v32 = vmulq_f32(v48, v48);
              v33 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v32, 2), vaddq_f32(v32, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v32.f32, 1)));
              v34 = vmulq_f32(v49, v49);
              LODWORD(v35) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v34, 2), vaddq_f32(v34, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v34.f32, 1))).u32[0];
              v36 = vmulq_f32(v28, v28);
              LODWORD(v37) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v36, 2), vaddq_f32(v36, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 1))).u32[0];
              if (v31)
                v38 = -1.0;
              else
                v38 = 1.0;
              v33.f32[0] = sqrtf(v33.f32[0]);
              v33.i32[1] = sqrtf(v35);
              v33.i32[2] = sqrtf(v37);
              v39 = vmulq_n_f32(v33, v38);
              v40 = (int32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v39), (int8x16_t)vcgezq_f32(v39)));
              v40.i32[3] = v40.i32[2];
              v50 = v63;
              v51 = v64;
              v40.i32[0] = vmaxvq_u32((uint32x4_t)v40);
              C3DTransformBoundingSphere(&v58, &v48, (__n128 *)&v58, (__n128)vandq_s8((int8x16_t)v39, (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v40, v43), 0)));
              if ((v9 & 1) != 0)
                C3DSphereMakeByMergingSpheres(&v59, &v58, &v59);
              else
                v59 = v58;
              v9 = 1;
            }
          }
          v17 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
        }
        while (v17);
      }
      if ((v9 & 1) != 0)
      {
        if (v5)
          *v5 = v59;
        if (v42)
          *v42 = v59.i32[3];
      }
    }
  }
  else
  {
    v9 = 0;
  }
  return v9 & 1;
}

- (simd_float4x4)simdPivot
{
  void *v3;
  simd_float4 v4;
  simd_float4 v5;
  simd_float4 v6;
  simd_float4 v7;
  __C3DScene *v8;
  uint64_t v9;
  uint64_t PivotMatrix;
  simd_float4 *v11;
  simd_float4 v12;
  simd_float4 v13;
  simd_float4 v14;
  simd_float4 v15;
  simd_float4x4 result;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v8 = -[SCNNode sceneRef](self, "sceneRef");
    v9 = (uint64_t)v8;
    if (v8)
      C3DSceneLock((uint64_t)v8);
    PivotMatrix = C3DNodeGetPivotMatrix((uint64_t)self->_node);
    v11 = (simd_float4 *)MEMORY[0x1E0C83FF0];
    if (PivotMatrix)
      v11 = (simd_float4 *)PivotMatrix;
    v6 = v11[2];
    v7 = v11[3];
    v4 = *v11;
    v5 = v11[1];
    if (v9)
    {
      v15 = *v11;
      v13 = v11[2];
      v14 = v11[1];
      v12 = v11[3];
      C3DSceneUnlock(v9);
      v7 = v12;
      v6 = v13;
      v5 = v14;
      v4 = v15;
    }
  }
  else if ((*((_BYTE *)self + 41) & 4) != 0
         && (v3 = (void *)-[SCNNode valueForKey:](self, "valueForKey:", CFSTR("kPivotKey"))) != 0)
  {
    objc_msgSend(v3, "SCN_simdMatrix4Value");
  }
  else
  {
    v4 = *(simd_float4 *)MEMORY[0x1E0C83FF0];
    v5 = *(simd_float4 *)(MEMORY[0x1E0C83FF0] + 16);
    v6 = *(simd_float4 *)(MEMORY[0x1E0C83FF0] + 32);
    v7 = *(simd_float4 *)(MEMORY[0x1E0C83FF0] + 48);
  }
  result.columns[3] = v7;
  result.columns[2] = v6;
  result.columns[1] = v5;
  result.columns[0] = v4;
  return result;
}

- (void)setSimdPivot:(simd_float4x4)simdPivot
{
  void *v4;
  float32x4_t *v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  NSObject *v10;
  float32x4_t v11;
  int v12;
  uint64_t v13;
  __C3DScene *v14;
  _QWORD v16[6];
  _QWORD v17[4];
  simd_float4x4 v18;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SCNNode(SIMD) setSimdPivot:].cold.1();
  }
  else
  {
    v4 = (void *)-[SCNNode valueForKey:](self, "valueForKey:", CFSTR("kPivotKey"));
    v5 = (float32x4_t *)MEMORY[0x1E0C83FF0];
    if (v4)
    {
      objc_msgSend(v4, "SCN_simdMatrix4Value");
    }
    else
    {
      v6 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
      v7 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 16);
      v8 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 32);
      v9 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
    }
    if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v6, (float32x4_t)simdPivot.columns[0]), (int8x16_t)vceqq_f32(v7, (float32x4_t)simdPivot.columns[1])), vandq_s8((int8x16_t)vceqq_f32(v8, (float32x4_t)simdPivot.columns[2]), (int8x16_t)vceqq_f32(v9, (float32x4_t)simdPivot.columns[3])))) & 0x80000000) == 0)
    {
      -[SCNNode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("pivot"));
      v11 = (float32x4_t)vdupq_n_s32(0x3727C5ACu);
      v12 = vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v11, vabdq_f32((float32x4_t)simdPivot.columns[1], v5[1])), (int8x16_t)vcgeq_f32(v11, vabdq_f32((float32x4_t)simdPivot.columns[0], *v5))), vandq_s8((int8x16_t)vcgeq_f32(v11, vabdq_f32((float32x4_t)simdPivot.columns[2], v5[2])), (int8x16_t)vcgeq_f32(v11, vabdq_f32((float32x4_t)simdPivot.columns[3], v5[3])))));
      *((_BYTE *)self + 41) = (*((_BYTE *)self + 41) & 0xFB | (4 * (v12 < 0))) ^ 4;
      if (v12 < 0)
        v13 = 0;
      else
        v13 = objc_msgSend(MEMORY[0x1E0CB3B18], "SCN_valueWithSimdMatrix4:");
      -[SCNNode setValue:forKey:](self, "setValue:forKey:", v13, CFSTR("kPivotKey"));
      v17[0] = 0;
      v17[1] = v17;
      v17[2] = 0x6010000000;
      v17[3] = &unk_1DD0EA3D6;
      v18 = simdPivot;
      v14 = -[SCNNode sceneRef](self, "sceneRef");
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __30__SCNNode_SIMD__setSimdPivot___block_invoke;
      v16[3] = &unk_1EA5A1598;
      v16[4] = self;
      v16[5] = v17;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v14, self, CFSTR("pivot"), v16);
      if ((*((_WORD *)self + 22) & 0x100) != 0)
        objc_msgSend(-[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 8), "resetTransform");
      -[SCNNode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("pivot"));
      _Block_object_dispose(v17, 8);
    }
  }
}

void __30__SCNNode_SIMD__setSimdPivot___block_invoke(uint64_t a1)
{
  C3DNodeSetPivotMatrix(*(float32x4_t **)(*(_QWORD *)(a1 + 32) + 8), (__int128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
}

void __34__SCNNode_SIMD__setSimdTransform___block_invoke(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  _OWORD v3[4];

  v1 = *(_OWORD *)(a1 + 48);
  v3[0] = *(_OWORD *)(a1 + 32);
  v3[1] = v1;
  v2 = *(_OWORD *)(a1 + 80);
  v3[2] = *(_OWORD *)(a1 + 64);
  v3[3] = v2;
  C3DNodeSetMatrix(*(float32x4_t **)(*(_QWORD *)(a1 + 96) + 8), (uint64_t)v3);
}

- (simd_float3)simdPosition
{
  simd_float3 result;
  __C3DScene *v4;
  uint64_t v5;
  simd_float3 v6;
  simd_float3 v7;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v4 = -[SCNNode sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      *(double *)v6.i64 = C3DNodeGetPosition((__n128 *)self->_node);
      v7 = v6;
      C3DSceneUnlock(v5);
      return v7;
    }
    else
    {
      *(double *)result.i64 = C3DNodeGetPosition((__n128 *)self->_node);
    }
  }
  else
  {
    if ((*((_BYTE *)self + 41) & 1) == 0)
      -[SCNNode _updateAffine](self, "_updateAffine");
    return *(simd_float3 *)&self->_position[2];
  }
  return result;
}

- (simd_float4)simdRotation
{
  unsigned int v3;
  int v4;
  __C3DScene *v6;
  uint64_t v7;
  simd_float4 v8;
  simd_float4 result;
  float v11;
  float v12;
  simd_float4 v18;
  float32x4_t v19;
  simd_float4 v20;
  float32x4_t v21;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v6 = -[SCNNode sceneRef](self, "sceneRef");
    if (v6)
    {
      v7 = (uint64_t)v6;
      C3DSceneLock((uint64_t)v6);
      C3DNodeGetAxisAngle((float32x4_t *)self->_node);
      v18 = v8;
      C3DSceneUnlock(v7);
      return v18;
    }
    else
    {
      C3DNodeGetAxisAngle((float32x4_t *)self->_node);
    }
  }
  else
  {
    v3 = *((unsigned __int8 *)self + 41);
    if ((v3 & 1) == 0)
    {
      -[SCNNode _updateAffine](self, "_updateAffine");
      v3 = *((unsigned __int8 *)self + 41);
    }
    v4 = (v3 >> 4) & 3;
    if (v4)
    {
      if (v4 == 2)
      {
        v19 = *(float32x4_t *)&self->_anon_80[2];
        _S8 = v19.i32[3];
        v11 = acosf(v19.f32[3]);
        _Q3 = (simd_float4)v19;
        v12 = v11 + v11;
        __asm { FMLS            S1, S8, V3.S[3] }
        *(float *)_D1.i32 = sqrtf(*(float *)_D1.i32);
        if (*(float *)_D1.i32 > 0.000001)
          _Q3 = (simd_float4)vdivq_f32(v19, (float32x4_t)vdupq_lane_s32(_D1, 0));
        _Q3.f32[3] = v12;
      }
      else
      {
        _Q3 = 0uLL;
        if (v4 == 1)
          return *(simd_float4 *)&self->_anon_80[2];
      }
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
      C3DQuaternionMakeEuler(&v21, *(float *)&self->_anon_80[2], *(float *)&self->_anon_80[6], *(float *)&self->_anon_80[10]);
      C3DQuaternionGetAxisAngle(&v21, (float32x4_t *)&v20);
      return v20;
    }
    return _Q3;
  }
  return result;
}

- (void)setSimdRotation:(simd_float4)simdRotation
{
  char v4;
  char v5;
  uint32x4_t v6;
  int32x4_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x4_t v10;
  NSObject *v11;
  __C3DScene *v12;
  simd_float4 v13;
  float32x4_t v14;
  __int128 v15;
  _QWORD v16[4];
  __int128 v17;
  SCNNode *v18;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v11 = scn_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SCNNode(SIMD) setSimdRotation:].cold.1();
  }
  else
  {
    v4 = *((_BYTE *)self + 41);
    v13 = simdRotation;
    if ((v4 & 1) == 0)
    {
      -[SCNNode _updateAffine](self, "_updateAffine");
      simdRotation = v13;
      v4 = *((_BYTE *)self + 41);
    }
    if ((v4 & 0x30) != 0x10
      || (vminvq_u32((uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_anon_80[2], (float32x4_t)simdRotation)) & 0x80000000) == 0)
    {
      -[SCNNode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("rotation"), *(_OWORD *)&v13);
      v5 = *((_BYTE *)self + 41);
      *(float32x4_t *)&self->_anon_80[2] = v14;
      *((_BYTE *)self + 41) = v5 & 0xCD | 0x10;
      v6 = (uint32x4_t)vceqzq_f32(v14);
      v6.i32[3] = v6.i32[2];
      if ((vminvq_u32(v6) & 0x80000000) != 0)
      {
        v10 = v14;
      }
      else
      {
        v7 = (int32x4_t)vmulq_f32(v14, v14);
        v7.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v7, 2), vadd_f32(*(float32x2_t *)v7.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v7.i8, 1))).u32[0];
        v8 = vrsqrte_f32((float32x2_t)v7.u32[0]);
        v9 = vmul_f32(v8, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(v8, v8)));
        v10 = vmulq_n_f32(v14, vmul_f32(v9, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(v9, v9))).f32[0]);
      }
      v10.i32[3] = v14.i32[3];
      v12 = -[SCNNode sceneRef](self, "sceneRef", *(_OWORD *)&v10);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __33__SCNNode_SIMD__setSimdRotation___block_invoke;
      v16[3] = &unk_1EA5A1FD8;
      v18 = self;
      v17 = v15;
      +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v12, self, CFSTR("rotation"), v16);
      if ((*((_WORD *)self + 22) & 0x100) != 0)
        objc_msgSend(-[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 8), "resetTransform");
      -[SCNNode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("rotation"));
    }
  }
}

void __33__SCNNode_SIMD__setSimdRotation___block_invoke(__n128 *a1)
{
  C3DNodeSetAxisAngle(*(float32x4_t **)(a1[3].n128_u64[0] + 8), a1[2]);
}

- (simd_quatf)simdOrientation
{
  simd_quatf v3;
  __C3DScene *v4;
  uint64_t v5;
  simd_quatf v6;
  simd_quatf v7;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v4 = -[SCNNode sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      C3DNodeGetQuaternion((uint64_t)self->_node);
      v7 = v6;
      C3DSceneUnlock(v5);
      return v7;
    }
    else
    {
      C3DNodeGetQuaternion((uint64_t)self->_node);
    }
  }
  else
  {
    -[SCNNode _quaternion](self, "_quaternion");
  }
  return v3;
}

- (void)setSimdOrientation:(simd_quatf)simdOrientation
{
  -[SCNNode _setQuaternion:](self, "_setQuaternion:", *(double *)simdOrientation.vector.i64);
  if ((*((_WORD *)self + 22) & 0x100) != 0)
    objc_msgSend(-[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 8), "resetTransform");
}

- (simd_float3)simdEulerAngles
{
  simd_float3 result;
  __C3DScene *v4;
  uint64_t v5;
  simd_float3 v6;
  simd_float3 v7;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v4 = -[SCNNode sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      *(double *)v6.i64 = C3DNodeGetEuler((float32x4_t *)self->_node);
      v7 = v6;
      C3DSceneUnlock(v5);
      return v7;
    }
    else
    {
      *(double *)result.i64 = C3DNodeGetEuler((float32x4_t *)self->_node);
    }
  }
  else
  {
    -[SCNNode _euler](self, "_euler");
  }
  return result;
}

- (void)setSimdEulerAngles:(simd_float3)simdEulerAngles
{
  float32x4_t v4;
  uint32x4_t v5;
  char v6;
  __C3DScene *v7;
  float32x4_t v9;
  _QWORD v10[4];
  float32x4_t v11;
  SCNNode *v12;

  if ((*((_BYTE *)self + 41) & 1) == 0)
    -[SCNNode _updateAffine](self, "_updateAffine");
  -[SCNNode _euler](self, "_euler", *(_OWORD *)&simdEulerAngles);
  v5 = (uint32x4_t)vceqq_f32(v4, v9);
  v5.i32[3] = v5.i32[2];
  if ((vminvq_u32(v5) & 0x80000000) == 0)
  {
    -[SCNNode willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("eulerAngles"));
    v6 = *((_BYTE *)self + 41);
    *(float32x4_t *)&self->_anon_80[2] = v9;
    *((_BYTE *)self + 41) = v6 & 0xCD;
    v7 = -[SCNNode sceneRef](self, "sceneRef");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __36__SCNNode_SIMD__setSimdEulerAngles___block_invoke;
    v10[3] = &unk_1EA5A1FD8;
    v12 = self;
    v11 = v9;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v7, self, CFSTR("eulerAngles"), v10);
    if ((*((_WORD *)self + 22) & 0x100) != 0)
      objc_msgSend(-[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 8), "resetTransform");
    -[SCNNode didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("eulerAngles"));
  }
}

void __36__SCNNode_SIMD__setSimdEulerAngles___block_invoke(__n128 *a1)
{
  C3DNodeSetEuler(*(float32x4_t **)(a1[3].n128_u64[0] + 8), a1[2]);
}

- (simd_float3)simdScale
{
  simd_float3 result;
  __C3DScene *v4;
  uint64_t v5;
  simd_float3 v6;
  simd_float3 v7;

  if ((*((_BYTE *)self + 40) & 1) != 0)
  {
    v4 = -[SCNNode sceneRef](self, "sceneRef");
    if (v4)
    {
      v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      *(double *)v6.i64 = C3DNodeGetScale((__n128 *)self->_node);
      v7 = v6;
      C3DSceneUnlock(v5);
      return v7;
    }
    else
    {
      *(double *)result.i64 = C3DNodeGetScale((__n128 *)self->_node);
    }
  }
  else
  {
    if ((*((_BYTE *)self + 41) & 1) == 0)
      -[SCNNode _updateAffine](self, "_updateAffine");
    return *(simd_float3 *)&self->_scale[2];
  }
  return result;
}

- (void)setSimdScale:(simd_float3)simdScale
{
  -[SCNNode _setScale:](self, "_setScale:", *(double *)simdScale.i64);
  if ((*((_WORD *)self + 22) & 0x100) != 0)
    objc_msgSend(-[SCNNode _findComponentWithType:](self, "_findComponentWithType:", 8), "resetTransform");
}

- (simd_float3)simdWorldPosition
{
  simd_float3 v2;

  -[SCNNode simdWorldTransform](self, "simdWorldTransform");
  return v2;
}

- (void)setSimdWorldPosition:(simd_float3)simdWorldPosition
{
  uint64_t v4;
  simd_float4x4 v6;
  simd_float4x4 v7;

  if (-[SCNNode parentNode](self, "parentNode"))
  {
    -[SCNNode simdWorldTransform](-[SCNNode parentNode](self, "parentNode"), "simdWorldTransform");
    v7 = __invert_f4(v6);
    v4 = vaddq_f32((float32x4_t)v7.columns[3], vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)v7.columns[1], *(float32x2_t *)simdWorldPosition.f32, 1), (float32x4_t)v7.columns[0], simdWorldPosition.f32[0]), (float32x4_t)v7.columns[2], (float32x4_t)simdWorldPosition, 2)).u64[0];
  }
  else
  {
    v4 = simdWorldPosition.i64[0];
  }
  -[SCNNode setSimdPosition:](self, "setSimdPosition:", *(double *)&v4);
}

- (simd_quatf)simdWorldOrientation
{
  float32x4_t v2;
  int32x4_t v3;
  float32x2_t v4;
  float32x2_t v5;
  float32x4_t v6;
  float32x4_t v7;
  int32x4_t v8;
  float32x2_t v9;
  float32x2_t v10;
  float32x4_t v11;
  float32x4_t v12;
  int32x4_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x4_t v16;
  float v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v22;
  float32x4_t v23;
  int32x4_t v24;
  float32_t v25;
  float32x4_t v26;
  float32x4_t v27;

  -[SCNNode simdWorldTransform](self, "simdWorldTransform");
  v3 = (int32x4_t)vmulq_f32(v2, v2);
  v3.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v3, 2), vadd_f32(*(float32x2_t *)v3.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v3.i8, 1))).u32[0];
  v4 = vrsqrte_f32((float32x2_t)v3.u32[0]);
  v5 = vmul_f32(v4, vrsqrts_f32((float32x2_t)v3.u32[0], vmul_f32(v4, v4)));
  v6 = vmulq_n_f32(v2, vmul_f32(v5, vrsqrts_f32((float32x2_t)v3.u32[0], vmul_f32(v5, v5))).f32[0]);
  v8 = (int32x4_t)vmulq_f32(v7, v7);
  v8.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v8, 2), vadd_f32(*(float32x2_t *)v8.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v8.i8, 1))).u32[0];
  v9 = vrsqrte_f32((float32x2_t)v8.u32[0]);
  v10 = vmul_f32(v9, vrsqrts_f32((float32x2_t)v8.u32[0], vmul_f32(v9, v9)));
  v11 = vmulq_n_f32(v7, vmul_f32(v10, vrsqrts_f32((float32x2_t)v8.u32[0], vmul_f32(v10, v10))).f32[0]);
  v13 = (int32x4_t)vmulq_f32(v12, v12);
  v13.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v13, 2), vadd_f32(*(float32x2_t *)v13.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v13.i8, 1))).u32[0];
  v14 = vrsqrte_f32((float32x2_t)v13.u32[0]);
  v15 = vmul_f32(v14, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v14, v14)));
  v16 = vmulq_n_f32(v12, vmul_f32(v15, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v15, v15))).f32[0]);
  v17 = (float)(v6.f32[0] + v11.f32[1]) + v16.f32[2];
  if (v17 <= 0.0)
  {
    if (v6.f32[0] <= v11.f32[1] || v6.f32[0] <= v16.f32[2])
    {
      if (v11.f32[1] <= v16.f32[2])
      {
        v27.i64[0] = v16.i64[0];
        v27.f32[2] = (float)(v16.f32[2] + 1.0) - v6.f32[0];
        v27.i32[3] = v6.i32[1];
        v20 = (float32x4_t)vrev64q_s32((int32x4_t)vextq_s8((int8x16_t)vtrn1q_s32((int32x4_t)v11, (int32x4_t)v6), (int8x16_t)v11, 8uLL));
        v19.i64[0] = vaddq_f32(v16, v20).u64[0];
        v19.i64[1] = vsubq_f32(v27, v20).i64[1];
        v20.i32[0] = v19.i32[2];
      }
      else
      {
        v22 = v11;
        v22.f32[1] = (float)(v11.f32[1] + 1.0) - v6.f32[0];
        v22.i32[3] = v16.i32[0];
        v23 = (float32x4_t)vzip2q_s32(vzip1q_s32((int32x4_t)v6, (int32x4_t)v16), vtrn1q_s32((int32x4_t)v16, (int32x4_t)v6));
        v24 = (int32x4_t)vaddq_f32(v11, v23);
        v20 = vsubq_f32(v22, v23);
        v19 = (float32x4_t)vtrn2q_s32(vrev64q_s32(v24), (int32x4_t)v20);
        v20.i32[0] = v20.i32[1];
      }
    }
    else
    {
      v25 = (float)(v6.f32[0] + 1.0) - v11.f32[1];
      v26 = (float32x4_t)vextq_s8((int8x16_t)v11, (int8x16_t)vtrn1q_s32((int32x4_t)v11, (int32x4_t)v16), 0xCuLL);
      v19 = vaddq_f32(v26, v6);
      v26.f32[0] = v25;
      v6.i32[0] = v16.i32[2];
      v6.i32[3] = v16.i32[1];
      v20 = vsubq_f32(v26, v6);
      v19.i32[0] = v20.i32[0];
      v19.i32[3] = v20.i32[3];
    }
  }
  else
  {
    v18 = (float32x4_t)vzip2q_s32((int32x4_t)v11, vuzp1q_s32((int32x4_t)v11, (int32x4_t)v16));
    v18.i32[2] = v6.i32[1];
    v20 = (float32x4_t)vtrn2q_s32((int32x4_t)v16, vzip2q_s32((int32x4_t)v16, (int32x4_t)v6));
    v20.i32[2] = v11.i32[0];
    v19 = vsubq_f32(v18, v20);
    v20.i32[3] = 1.0;
    v18.f32[3] = v17;
    v19.i32[3] = vaddq_f32(v18, v20).i32[3];
    v20.i32[0] = v19.i32[3];
  }
  return *(simd_quatf *)&vmulq_n_f32(v19, 0.5 / sqrtf(v20.f32[0]));
}

- (void)setSimdWorldOrientation:(simd_quatf)simdWorldOrientation
{
  float32x2_t v4;
  float32x2_t v5;
  float32x4_t v6;
  float32x2_t v7;
  float32x2_t v8;
  float32x4_t v9;
  int32x4_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float32x4_t v13;
  float v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  uint64_t v18;
  simd_quatf v20;
  float32x4_t v21;
  float32x4_t v22;
  int32x4_t v23;
  float32_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  simd_float4x4 v32;
  simd_float4x4 v33;

  if (-[SCNNode parentNode](self, "parentNode"))
  {
    -[SCNNode simdWorldTransform](-[SCNNode parentNode](self, "parentNode"), "simdWorldTransform");
    v33 = __invert_f4(v32);
    v33.columns[3] = (simd_float4)vmulq_f32((float32x4_t)v33.columns[0], (float32x4_t)v33.columns[0]);
    v33.columns[3].i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)v33.columns[3], 2), vadd_f32(*(float32x2_t *)v33.columns[3].f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v33.columns[3].f32, 1))).u32[0];
    v4 = vrsqrte_f32((float32x2_t)v33.columns[3].u32[0]);
    v5 = vmul_f32(v4, vrsqrts_f32((float32x2_t)v33.columns[3].u32[0], vmul_f32(v4, v4)));
    v6 = vmulq_n_f32((float32x4_t)v33.columns[0], vmul_f32(v5, vrsqrts_f32((float32x2_t)v33.columns[3].u32[0], vmul_f32(v5, v5))).f32[0]);
    v33.columns[3] = (simd_float4)vmulq_f32((float32x4_t)v33.columns[1], (float32x4_t)v33.columns[1]);
    v33.columns[3].i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)v33.columns[3], 2), vadd_f32(*(float32x2_t *)v33.columns[3].f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v33.columns[3].f32, 1))).u32[0];
    v7 = vrsqrte_f32((float32x2_t)v33.columns[3].u32[0]);
    v8 = vmul_f32(v7, vrsqrts_f32((float32x2_t)v33.columns[3].u32[0], vmul_f32(v7, v7)));
    v9 = vmulq_n_f32((float32x4_t)v33.columns[1], vmul_f32(v8, vrsqrts_f32((float32x2_t)v33.columns[3].u32[0], vmul_f32(v8, v8))).f32[0]);
    v10 = (int32x4_t)vmulq_f32((float32x4_t)v33.columns[2], (float32x4_t)v33.columns[2]);
    v10.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v10, 2), vadd_f32(*(float32x2_t *)v10.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v10.i8, 1))).u32[0];
    v11 = vrsqrte_f32((float32x2_t)v10.u32[0]);
    v12 = vmul_f32(v11, vrsqrts_f32((float32x2_t)v10.u32[0], vmul_f32(v11, v11)));
    v13 = vmulq_n_f32((float32x4_t)v33.columns[2], vmul_f32(v12, vrsqrts_f32((float32x2_t)v10.u32[0], vmul_f32(v12, v12))).f32[0]);
    v14 = (float)(v6.f32[0] + v9.f32[1]) + v13.f32[2];
    if (v14 <= 0.0)
    {
      if (v6.f32[0] <= v9.f32[1] || v6.f32[0] <= v13.f32[2])
      {
        v20 = simdWorldOrientation;
        if (v9.f32[1] <= v13.f32[2])
        {
          v30.i64[0] = v13.i64[0];
          v30.f32[2] = (float)(v13.f32[2] + 1.0) - v6.f32[0];
          v30.i32[3] = v6.i32[1];
          v17 = (float32x4_t)vrev64q_s32((int32x4_t)vextq_s8((int8x16_t)vtrn1q_s32((int32x4_t)v9, (int32x4_t)v6), (int8x16_t)v9, 8uLL));
          v16.i64[0] = vaddq_f32(v13, v17).u64[0];
          v16.i64[1] = vsubq_f32(v30, v17).i64[1];
          v17.i32[0] = v16.i32[2];
        }
        else
        {
          v21 = v9;
          v21.f32[1] = (float)(v9.f32[1] + 1.0) - v6.f32[0];
          v21.i32[3] = v13.i32[0];
          v22 = (float32x4_t)vzip2q_s32(vzip1q_s32((int32x4_t)v6, (int32x4_t)v13), vtrn1q_s32((int32x4_t)v13, (int32x4_t)v6));
          v23 = (int32x4_t)vaddq_f32(v9, v22);
          v17 = vsubq_f32(v21, v22);
          v16 = (float32x4_t)vtrn2q_s32(vrev64q_s32(v23), (int32x4_t)v17);
          v17.i32[0] = v17.i32[1];
        }
        goto LABEL_13;
      }
      v24 = (float)(v6.f32[0] + 1.0) - v9.f32[1];
      v25 = (float32x4_t)vextq_s8((int8x16_t)v9, (int8x16_t)vtrn1q_s32((int32x4_t)v9, (int32x4_t)v13), 0xCuLL);
      v16 = vaddq_f32(v25, v6);
      v25.f32[0] = v24;
      v6.i32[0] = v13.i32[2];
      v6.i32[3] = v13.i32[1];
      v17 = vsubq_f32(v25, v6);
      v16.i32[0] = v17.i32[0];
      v16.i32[3] = v17.i32[3];
    }
    else
    {
      v15 = (float32x4_t)vzip2q_s32((int32x4_t)v9, vuzp1q_s32((int32x4_t)v9, (int32x4_t)v13));
      v15.i32[2] = v6.i32[1];
      v17 = (float32x4_t)vtrn2q_s32((int32x4_t)v13, vzip2q_s32((int32x4_t)v13, (int32x4_t)v6));
      v17.i32[2] = v9.i32[0];
      v16 = vsubq_f32(v15, v17);
      v17.i32[3] = 1.0;
      v15.f32[3] = v14;
      v16.i32[3] = vaddq_f32(v15, v17).i32[3];
      v17.i32[0] = v16.i32[3];
    }
    v20 = simdWorldOrientation;
LABEL_13:
    v26 = vmulq_n_f32(v16, 0.5 / sqrtf(v17.f32[0]));
    v27 = v26;
    v27.i32[3] = v26.i32[0];
    v28 = (float32x4_t)vzip1q_s32((int32x4_t)v20, (int32x4_t)v20);
    v28.i32[0] = v20.vector.i32[2];
    v29 = (float32x4_t)vuzp1q_s32((int32x4_t)v20, (int32x4_t)v20);
    v29.i32[0] = v20.vector.i32[1];
    v18 = vmlsq_f32(vmlaq_f32(vmlaq_laneq_f32(vmulq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v20, 3), (int8x16_t)v20, 4uLL), v27), (float32x4_t)xmmword_1DD007D20), (float32x4_t)v20, v26, 3), (float32x4_t)xmmword_1DD007D20, vmulq_f32(v28, (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v26, (int8x16_t)v26, 0xCuLL), (int8x16_t)v26, 8uLL))), v29, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v26, (int32x4_t)v26), (int8x16_t)v26, 0xCuLL)).u64[0];
    goto LABEL_14;
  }
  v18 = simdWorldOrientation.vector.i64[0];
LABEL_14:
  -[SCNNode setSimdOrientation:](self, "setSimdOrientation:", *(double *)&v18);
}

- (void)setSimdWorldTransform:(simd_float4x4)simdWorldTransform
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v11 = *(double *)simdWorldTransform.columns[3].i64;
  v9 = *(double *)simdWorldTransform.columns[1].i64;
  v10 = *(double *)simdWorldTransform.columns[2].i64;
  v8 = *(double *)simdWorldTransform.columns[0].i64;
  if (-[SCNNode parentNode](self, "parentNode"))
  {
    -[SCNNode simdConvertTransform:fromNode:](-[SCNNode parentNode](self, "parentNode"), "simdConvertTransform:fromNode:", 0, v8, v9, v10, v11);
  }
  else
  {
    v7 = v11;
    v5 = v9;
    v6 = v10;
    v4 = v8;
  }
  -[SCNNode setSimdTransform:](self, "setSimdTransform:", v4, v5, v6, v7);
}

- (simd_float3)simdConvertPosition:(simd_float3)position toNode:(SCNNode *)node
{
  SCNNode *v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  simd_float3 v12;
  simd_float4x4 v13;
  simd_float4x4 v14;

  v6 = node;
  v11 = (float32x4_t)position;
  if (!node)
  {
    v6 = (SCNNode *)objc_msgSend(-[SCNNode scene](self, "scene"), "rootNode");
    position = (simd_float3)v11;
  }
  if (v6 != self)
  {
    -[SCNNode simdWorldTransform](self, "simdWorldTransform");
    position = (simd_float3)vaddq_f32(v10, vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32(v7, *(float32x2_t *)v11.f32, 1), v8, v11.f32[0]), v9, v11, 2));
    if (node)
    {
      v12 = position;
      -[SCNNode simdWorldTransform](node, "simdWorldTransform");
      v14 = __invert_f4(v13);
      return (simd_float3)vaddq_f32((float32x4_t)v14.columns[3], vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)v14.columns[1], *(float32x2_t *)v12.f32, 1), (float32x4_t)v14.columns[0], v12.f32[0]), (float32x4_t)v14.columns[2], (float32x4_t)v12, 2));
    }
  }
  return position;
}

- (simd_float3)simdConvertPosition:(simd_float3)position fromNode:(SCNNode *)node
{
  SCNNode *v6;
  float32x4_t v7;
  float32x4_t v8;
  simd_float4 v9;
  simd_float4 v10;
  simd_float4 v11;
  simd_float4 v12;
  float32x4_t v13;
  simd_float4x4 v14;
  simd_float4x4 v15;

  v6 = node;
  v13 = (float32x4_t)position;
  if (!node)
  {
    v6 = (SCNNode *)objc_msgSend(-[SCNNode scene](self, "scene"), "rootNode");
    position = (simd_float3)v13;
  }
  if (v6 != self)
  {
    -[SCNNode simdWorldTransform](self, "simdWorldTransform");
    v15 = __invert_f4(v14);
    v7 = (float32x4_t)v15.columns[1];
    v8 = (float32x4_t)v15.columns[3];
    if (node)
    {
      v11 = v15.columns[2];
      v12 = v15.columns[0];
      v9 = v15.columns[1];
      v10 = v15.columns[3];
      -[SCNNode simdWorldTransform](node, "simdWorldTransform");
      v15.columns[1] = (simd_float4)vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)v15.columns[1], *(float32x2_t *)v13.f32, 1), (float32x4_t)v15.columns[0], v13.f32[0]), (float32x4_t)v15.columns[2], v13, 2);
      v7 = (float32x4_t)v9;
      v8 = (float32x4_t)v10;
      v15.columns[2] = v11;
      v15.columns[0] = v12;
      v15.columns[1] = (simd_float4)vaddq_f32((float32x4_t)v15.columns[3], (float32x4_t)v15.columns[1]);
    }
    else
    {
      v15.columns[1] = (simd_float4)v13;
    }
    return (simd_float3)vaddq_f32(v8, vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32(v7, *(float32x2_t *)v15.columns[1].f32, 1), (float32x4_t)v15.columns[0], v15.columns[1].f32[0]), (float32x4_t)v15.columns[2], (float32x4_t)v15.columns[1], 2));
  }
  return position;
}

- (simd_float3)simdConvertVector:(simd_float3)vector toNode:(SCNNode *)node
{
  float32x4_t v5;
  SCNNode *v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v13;
  simd_float4x4 v14;
  simd_float4x4 v15;

  v5 = (float32x4_t)vector;
  v7 = node;
  if (!node)
  {
    v7 = (SCNNode *)objc_msgSend(-[SCNNode scene](self, "scene"), "rootNode");
    v5 = (float32x4_t)vector;
  }
  if (v7 != self)
  {
    -[SCNNode simdWorldTransform](self, "simdWorldTransform");
    v5 = vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32(v8, *(float32x2_t *)vector.f32, 1), v9, vector.f32[0]), v10, (float32x4_t)vector, 2);
    if (node)
    {
      v13 = v5;
      -[SCNNode simdWorldTransform](node, "simdWorldTransform");
      v15 = __invert_f4(v14);
      return (simd_float3)vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)v15.columns[1], *(float32x2_t *)v13.f32, 1), (float32x4_t)v15.columns[0], v13.f32[0]), (float32x4_t)v15.columns[2], v13, 2);
    }
  }
  return (simd_float3)v5;
}

- (simd_float4x4)simdConvertTransform:(simd_float4x4)transform toNode:(SCNNode *)node
{
  simd_float4 v6;
  simd_float4 v7;
  simd_float4 v8;
  simd_float4 v9;
  uint64_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  uint64_t v15;
  simd_float4 v16;
  simd_float4 v17;
  simd_float4 v18;
  simd_float4 v19;
  simd_float4x4 v20;
  simd_float4x4 v21;
  simd_float4x4 v22;
  simd_float4x4 v23;
  simd_float4x4 v24;

  if (node)
  {
    if (node == self)
      return transform;
    v20 = transform;
    -[SCNNode simdWorldTransform](self, "simdWorldTransform");
    v18 = v7;
    v19 = v6;
    v16 = v9;
    v17 = v8;
    -[SCNNode simdWorldTransform](node, "simdWorldTransform");
    v24 = __invert_f4(v23);
    v10 = 0;
    v21.columns[0] = v19;
    v21.columns[1] = v18;
    v21.columns[2] = v17;
    v21.columns[3] = v16;
    memset(&v22, 0, sizeof(v22));
    do
    {
      v22.columns[v10] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v24.columns[0], COERCE_FLOAT(*(_OWORD *)&v21.columns[v10])), (float32x4_t)v24.columns[1], *(float32x2_t *)v21.columns[v10].f32, 1), (float32x4_t)v24.columns[2], (float32x4_t)v21.columns[v10], 2), (float32x4_t)v24.columns[3], (float32x4_t)v21.columns[v10], 3);
      ++v10;
    }
    while (v10 != 4);
    v11 = (float32x4_t)v22.columns[0];
    v12 = (float32x4_t)v22.columns[1];
    v13 = (float32x4_t)v22.columns[2];
    v14 = (float32x4_t)v22.columns[3];
  }
  else
  {
    v20 = transform;
    if ((SCNNode *)objc_msgSend(-[SCNNode scene](self, "scene"), "rootNode") == self)
      return v20;
    -[SCNNode simdWorldTransform](self, "simdWorldTransform");
  }
  v15 = 0;
  v21 = v20;
  memset(&v22, 0, sizeof(v22));
  do
  {
    v22.columns[v15] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v11, COERCE_FLOAT(*(_OWORD *)&v21.columns[v15])), v12, *(float32x2_t *)v21.columns[v15].f32, 1), v13, (float32x4_t)v21.columns[v15], 2), v14, (float32x4_t)v21.columns[v15], 3);
    ++v15;
  }
  while (v15 != 4);
  return v22;
}

- (simd_float4x4)simdConvertTransform:(simd_float4x4)transform fromNode:(SCNNode *)node
{
  SCNNode *v6;
  float32x4_t v7;
  uint64_t v8;
  simd_float4 v9;
  simd_float4 v10;
  simd_float4 v11;
  simd_float4 v12;
  uint64_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  simd_float4x4 v18;
  simd_float4x4 v19;
  simd_float4x4 v20;
  simd_float4x4 v21;
  simd_float4x4 v22;

  v6 = node;
  v18 = transform;
  if (!node)
  {
    v6 = (SCNNode *)objc_msgSend(-[SCNNode scene](self, "scene"), "rootNode");
    transform = v18;
  }
  if (v6 != self)
  {
    -[SCNNode simdWorldTransform](self, "simdWorldTransform");
    v22 = __invert_f4(v21);
    v7 = (float32x4_t)v22.columns[2];
    if (node)
    {
      v16 = (float32x4_t)v22.columns[1];
      v17 = (float32x4_t)v22.columns[0];
      v14 = (float32x4_t)v22.columns[3];
      v15 = (float32x4_t)v22.columns[2];
      -[SCNNode simdWorldTransform](node, "simdWorldTransform");
      v8 = 0;
      v19.columns[0] = v9;
      v19.columns[1] = v10;
      v19.columns[2] = v11;
      v19.columns[3] = v12;
      memset(&v20, 0, sizeof(v20));
      do
      {
        v20.columns[v8] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, COERCE_FLOAT(*(_OWORD *)&v19.columns[v8])), v16, *(float32x2_t *)v19.columns[v8].f32, 1), v15, (float32x4_t)v19.columns[v8], 2), v14, (float32x4_t)v19.columns[v8], 3);
        ++v8;
      }
      while (v8 != 4);
      v22.columns[0] = v20.columns[0];
      v22.columns[1] = v20.columns[1];
      v7 = (float32x4_t)v20.columns[2];
      v22.columns[3] = v20.columns[3];
    }
    v13 = 0;
    v19 = v18;
    memset(&v20, 0, sizeof(v20));
    do
    {
      v20.columns[v13] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v22.columns[0], COERCE_FLOAT(*(_OWORD *)&v19.columns[v13])), (float32x4_t)v22.columns[1], *(float32x2_t *)v19.columns[v13].f32, 1), v7, (float32x4_t)v19.columns[v13], 2), (float32x4_t)v22.columns[3], (float32x4_t)v19.columns[v13], 3);
      ++v13;
    }
    while (v13 != 4);
    return v20;
  }
  return transform;
}

+ (simd_float3)simdLocalUp
{
  return (simd_float3)xmmword_1DD007920;
}

+ (simd_float3)simdLocalRight
{
  return (simd_float3)xmmword_1DD007970;
}

+ (simd_float3)simdLocalFront
{
  return (simd_float3)xmmword_1DD007960;
}

- (simd_float3)simdWorldUp
{
  float32x4_t v2;
  float32x4_t v3;
  int32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  int8x16_t v7;
  float32x4_t v8;
  int8x16_t v9;
  float32x4_t v11;

  -[SCNNode simdWorldOrientation](self, "simdWorldOrientation");
  v11 = v2;
  objc_msgSend((id)objc_opt_class(), "simdLocalUp");
  v3 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v11, (int32x4_t)v11), (int8x16_t)v11, 0xCuLL);
  v5 = vnegq_f32(v11);
  v6 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v4, v4), (int8x16_t)v4, 0xCuLL), v5), (float32x4_t)v4, v3);
  v7 = (int8x16_t)vaddq_f32(v6, v6);
  v8 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v7, (int32x4_t)v7), v7, 0xCuLL);
  v9 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v8, (int32x4_t)v8), (int8x16_t)v8, 0xCuLL), v5), v8, v3);
  return (simd_float3)vaddq_f32(vmlaq_laneq_f32((float32x4_t)v4, v8, v11, 3), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v9, (int32x4_t)v9), v9, 0xCuLL));
}

- (simd_float3)simdWorldRight
{
  float32x4_t v2;
  float32x4_t v3;
  int32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  int8x16_t v7;
  float32x4_t v8;
  int8x16_t v9;
  float32x4_t v11;

  -[SCNNode simdWorldOrientation](self, "simdWorldOrientation");
  v11 = v2;
  objc_msgSend((id)objc_opt_class(), "simdLocalRight");
  v3 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v11, (int32x4_t)v11), (int8x16_t)v11, 0xCuLL);
  v5 = vnegq_f32(v11);
  v6 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v4, v4), (int8x16_t)v4, 0xCuLL), v5), (float32x4_t)v4, v3);
  v7 = (int8x16_t)vaddq_f32(v6, v6);
  v8 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v7, (int32x4_t)v7), v7, 0xCuLL);
  v9 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v8, (int32x4_t)v8), (int8x16_t)v8, 0xCuLL), v5), v8, v3);
  return (simd_float3)vaddq_f32(vmlaq_laneq_f32((float32x4_t)v4, v8, v11, 3), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v9, (int32x4_t)v9), v9, 0xCuLL));
}

- (simd_float3)simdWorldFront
{
  float32x4_t v2;
  float32x4_t v3;
  int32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  int8x16_t v7;
  float32x4_t v8;
  int8x16_t v9;
  float32x4_t v11;

  -[SCNNode simdWorldOrientation](self, "simdWorldOrientation");
  v11 = v2;
  objc_msgSend((id)objc_opt_class(), "simdLocalFront");
  v3 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v11, (int32x4_t)v11), (int8x16_t)v11, 0xCuLL);
  v5 = vnegq_f32(v11);
  v6 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v4, v4), (int8x16_t)v4, 0xCuLL), v5), (float32x4_t)v4, v3);
  v7 = (int8x16_t)vaddq_f32(v6, v6);
  v8 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v7, (int32x4_t)v7), v7, 0xCuLL);
  v9 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v8, (int32x4_t)v8), (int8x16_t)v8, 0xCuLL), v5), v8, v3);
  return (simd_float3)vaddq_f32(vmlaq_laneq_f32((float32x4_t)v4, v8, v11, 3), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v9, (int32x4_t)v9), v9, 0xCuLL));
}

- (void)simdLookAt:(simd_float3)worldTarget
{
  double v4;
  double v5;
  double v6;
  double v7;

  v7 = *(double *)worldTarget.i64;
  -[SCNNode simdWorldUp](self, "simdWorldUp");
  v6 = v4;
  +[SCNNode simdLocalFront](SCNNode, "simdLocalFront");
  -[SCNNode simdLookAt:up:localFront:](self, "simdLookAt:up:localFront:", v7, v6, v5);
}

- (void)simdLookAt:(simd_float3)worldTarget up:(simd_float3)worldUp localFront:(simd_float3)localFront
{
  float32x4_t v6;
  uint32x4_t v7;
  float32x4_t v8;
  int32x4_t v9;
  float32x2_t v10;
  float32x2_t v11;
  float32x4_t v12;
  simd_float3 v13;
  int8x16_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float v19;
  int8x16_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  int8x16_t v24;
  int8x16_t v25;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  int32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  int32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  int8x16_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float v62;
  float v63;
  __float2 v64;
  float32x2_t v65;
  float32x2_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float v70;
  float v71;
  float32x4_t v73;
  float32x4_t v75;
  float32x4_t v77;

  -[SCNNode simdWorldPosition](self, "simdWorldPosition");
  v7 = (uint32x4_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3727C5ACu), vabdq_f32((float32x4_t)worldTarget, v6));
  v7.i32[3] = v7.i32[2];
  if ((vminvq_u32(v7) & 0x80000000) == 0)
  {
    v8 = vsubq_f32((float32x4_t)worldTarget, v6);
    v9 = (int32x4_t)vmulq_f32(v8, v8);
    v9.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v9, 2), vadd_f32(*(float32x2_t *)v9.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v9.i8, 1))).u32[0];
    v10 = vrsqrte_f32((float32x2_t)v9.u32[0]);
    v11 = vmul_f32(v10, vrsqrts_f32((float32x2_t)v9.u32[0], vmul_f32(v10, v10)));
    v12 = vmulq_n_f32(v8, vmul_f32(v11, vrsqrts_f32((float32x2_t)v9.u32[0], vmul_f32(v11, v11))).f32[0]);
    v13 = localFront;
    v14 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v12, (int32x4_t)v12), (int8x16_t)v12, 0xCuLL), vnegq_f32((float32x4_t)localFront)), v12, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v13, (int32x4_t)v13), (int8x16_t)localFront, 0xCuLL));
    v15 = vmulq_f32(v12, (float32x4_t)localFront);
    v16 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v14, (int32x4_t)v14), v14, 0xCuLL);
    v8.f32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2), vaddq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 1))).f32[0];
    v17 = vmulq_f32((float32x4_t)v13, (float32x4_t)v13);
    v18 = vmulq_f32(v12, v12);
    v19 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2), vaddq_f32(v18, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v18.f32, 1))).f32[0];
    v16.f32[3] = v8.f32[0]
               + sqrtf(vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).f32[0], v19));
    v20 = (int8x16_t)vmulq_f32(v16, v16);
    *(float32x2_t *)v20.i8 = vadd_f32(*(float32x2_t *)v20.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v20, v20, 8uLL));
    v21 = (float32x4_t)vdupq_lane_s32((int32x2_t)vadd_f32(*(float32x2_t *)v20.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v20.i8, 1)), 0);
    v22 = vrsqrteq_f32(v21);
    v23 = vmulq_f32(v22, vrsqrtsq_f32(v21, vmulq_f32(v22, v22)));
    v24 = (int8x16_t)vmulq_f32(v23, vrsqrtsq_f32(v21, vmulq_f32(v23, v23)));
    v25 = (int8x16_t)vceqzq_f32(v21);
    __asm { FMOV            V0.4S, #1.0 }
    v31 = vmulq_f32(v16, (float32x4_t)vbslq_s8(v25, _Q0, v24));
    v32 = (float32x4_t)vuzp1q_s32((int32x4_t)v31, (int32x4_t)v31);
    if (v19 <= 0.000000001)
    {
      v67 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
    }
    else
    {
      v33 = (float32x4_t)vextq_s8((int8x16_t)v32, (int8x16_t)v31, 0xCuLL);
      v34 = vnegq_f32(v31);
      v35 = (float32x4_t)vuzp1q_s32((int32x4_t)v34, (int32x4_t)v34);
      v35.i32[0] = v34.i32[1];
      v71 = v19;
      v36 = (float32x4_t)vzip1q_s32((int32x4_t)v34, (int32x4_t)v34);
      v36.i32[0] = v34.i32[2];
      v75 = v32;
      v34.i32[3] = v31.i32[3];
      v37 = vmlaq_f32(vmlaq_f32(vmlaq_f32(vmulq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v34, 3), (int8x16_t)v34, 4uLL), (float32x4_t)xmmword_1DD007920), (float32x4_t)xmmword_1DD007D20), (float32x4_t)0, v34), (float32x4_t)xmmword_1DD007D20, vmulq_f32(v36, (float32x4_t)xmmword_1DD007880)), (float32x4_t)xmmword_1DD02A890, v35);
      v38 = (float32x4_t)vuzp1q_s32((int32x4_t)v37, (int32x4_t)v37);
      v38.i32[0] = v37.i32[1];
      v39 = (float32x4_t)vzip1q_s32((int32x4_t)v37, (int32x4_t)v37);
      v39.i32[0] = v37.i32[2];
      v40 = vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v31, (int8x16_t)v31, 0xCuLL), (int8x16_t)v31, 8uLL), v39);
      v41 = v31;
      v41.i32[3] = v31.i32[0];
      v42 = vmlsq_f32(vmlaq_f32(vmlaq_laneq_f32(vmulq_f32(vmulq_f32(v41, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v37, 3), (int8x16_t)v37, 4uLL)), (float32x4_t)xmmword_1DD007D20), v37, v31, 3), (float32x4_t)xmmword_1DD007D20, v40), v38, v33);
      v43 = vmulq_f32(v12, v42);
      v44 = vmlsq_lane_f32(v42, v12, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v43, 2), vaddq_f32(v43, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v43.f32, 1))), 0);
      v45 = vmulq_f32(v44, v44);
      v45.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v45, 2), vaddq_f32(v45, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v45.f32, 1))).u64[0];
      v46 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v45.f32[0] != 0.0)), 0x1FuLL));
      v46.i32[3] = 0;
      v47 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v45.f32, 0);
      v48 = vrsqrteq_f32(v47);
      v49 = vmulq_f32(v48, vrsqrtsq_f32(v47, vmulq_f32(v48, v48)));
      v50 = vmulq_f32(v44, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v46), (int8x16_t)vmulq_f32(v49, vrsqrtsq_f32(v47, vmulq_f32(v49, v49))), _Q0));
      v51 = vmulq_f32(v12, (float32x4_t)worldUp);
      v52 = vmlsq_lane_f32((float32x4_t)worldUp, v12, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v51, 2), vaddq_f32(v51, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v51.f32, 1))), 0);
      v53 = vmulq_f32(v52, v52);
      v53.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v53, 2), vaddq_f32(v53, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v53.f32, 1))).u64[0];
      v54 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v53.f32[0] != 0.0)), 0x1FuLL));
      v54.i32[3] = 0;
      v55 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v53.f32, 0);
      v56 = vrsqrteq_f32(v55);
      v57 = vmulq_f32(v56, vrsqrtsq_f32(v55, vmulq_f32(v56, v56)));
      v58 = vmulq_f32(v52, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v54), (int8x16_t)vmulq_f32(v57, vrsqrtsq_f32(v55, vmulq_f32(v57, v57))), _Q0));
      v59 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v58, (int32x4_t)v58), (int8x16_t)v58, 0xCuLL), vnegq_f32(v50)), v58, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v50, (int32x4_t)v50), (int8x16_t)v50, 0xCuLL));
      v60 = vmulq_f32(v12, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v59, (int32x4_t)v59), v59, 0xCuLL));
      LODWORD(v70) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v60, 2), vaddq_f32(v60, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v60.f32, 1))).u32[0];
      v61 = vmulq_f32(v50, v58);
      v62 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v61, 2), vaddq_f32(v61, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v61.f32, 1))).f32[0];
      if (v62 >= 1.0)
        v62 = 1.0;
      if (v62 <= -1.0)
        v62 = -1.0;
      v73 = v12;
      v77 = v31;
      v63 = acosf(v62);
      if (v70 <= 0.0)
        v63 = -v63;
      v64 = __sincosf_stret(v63 * 0.5);
      v31 = v77;
      v65 = vrsqrte_f32((float32x2_t)LODWORD(v71));
      v66 = vmul_f32(v65, vrsqrts_f32((float32x2_t)LODWORD(v71), vmul_f32(v65, v65)));
      v32 = v75;
      v67 = vmulq_n_f32(vmulq_n_f32(v73, vmul_f32(v66, vrsqrts_f32((float32x2_t)LODWORD(v71), vmul_f32(v66, v66))).f32[0]), v64.__sinval);
      v67.i32[3] = LODWORD(v64.__cosval);
    }
    v68 = v67;
    v68.i32[3] = v67.i32[0];
    v69 = (float32x4_t)vzip1q_s32((int32x4_t)v31, (int32x4_t)v31);
    v69.i32[0] = v31.i32[2];
    v32.i32[0] = v31.i32[1];
    -[SCNNode setSimdWorldOrientation:](self, "setSimdWorldOrientation:", *(double *)vmlsq_f32(vmlaq_f32(vmlaq_laneq_f32(vmulq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v31, 3), (int8x16_t)v31, 4uLL), v68), (float32x4_t)xmmword_1DD007D20), v31, v67, 3), (float32x4_t)xmmword_1DD007D20, vmulq_f32(v69, (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v67, (int8x16_t)v67, 0xCuLL), (int8x16_t)v67, 8uLL))), v32, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v67, (int32x4_t)v67), (int8x16_t)v67, 0xCuLL)).i64);
  }
}

- (void)simdLocalTranslateBy:(simd_float3)translation
{
  int32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  int8x16_t v8;
  float32x4_t v9;
  float32x4_t v10;
  int8x16_t v11;
  float32x4_t v12;
  float32x4_t v14;

  -[SCNNode simdOrientation](self, "simdOrientation");
  v5 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v4, v4), (int8x16_t)v4, 0xCuLL);
  v6 = vnegq_f32((float32x4_t)v4);
  v7 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)translation, (int32x4_t)translation), (int8x16_t)translation, 0xCuLL), v6), (float32x4_t)translation, v5);
  v8 = (int8x16_t)vaddq_f32(v7, v7);
  v9 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v8, (int32x4_t)v8), v8, 0xCuLL);
  v10 = vmlaq_laneq_f32((float32x4_t)translation, v9, (float32x4_t)v4, 3);
  v11 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v9, (int32x4_t)v9), (int8x16_t)v9, 0xCuLL), v6), v9, v5);
  v14 = vaddq_f32(v10, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v11, (int32x4_t)v11), v11, 0xCuLL));
  -[SCNNode simdPosition](self, "simdPosition");
  -[SCNNode setSimdPosition:](self, "setSimdPosition:", *(double *)vaddq_f32(v12, v14).i64);
}

- (void)simdLocalRotateBy:(simd_quatf)rotation
{
  float32x4_t v4;
  float32x4_t v5;
  simd_quatf v6;
  float32x4_t v7;
  float32x4_t v8;

  -[SCNNode simdOrientation](self, "simdOrientation");
  v5 = v4;
  v5.i32[3] = v4.i32[0];
  v6 = rotation;
  v7 = (float32x4_t)vzip1q_s32((int32x4_t)v6, (int32x4_t)v6);
  v7.i32[0] = rotation.vector.i32[2];
  v8 = (float32x4_t)vuzp1q_s32((int32x4_t)v6, (int32x4_t)v6);
  v8.i32[0] = rotation.vector.i32[1];
  -[SCNNode setSimdOrientation:](self, "setSimdOrientation:", *(double *)vmlsq_f32(vmlaq_f32(vmlaq_laneq_f32(vmulq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)rotation, 3), (int8x16_t)rotation, 4uLL), v5), (float32x4_t)xmmword_1DD007D20), (float32x4_t)rotation, v4, 3), (float32x4_t)xmmword_1DD007D20, vmulq_f32(v7,
                     (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v4, (int8x16_t)v4, 0xCuLL), (int8x16_t)v4, 8uLL))),
                 v8,
                 (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v4, (int32x4_t)v4), (int8x16_t)v4, 0xCuLL)).i64);
}

- (void)simdRotateBy:(simd_quatf)worldRotation aroundTarget:(simd_float3)worldTarget
{
  unint64_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x2_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x2_t v17;
  float32x4_t v18;
  float32x4_t v19;
  unint64_t v20;
  unint64_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;

  v5 = 0;
  v6 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
  v7 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 16);
  v8 = vmulq_f32((float32x4_t)worldRotation, (float32x4_t)worldRotation);
  v9 = vaddq_f32(v8, v8);
  v10 = vmulq_laneq_f32((float32x4_t)worldRotation, (float32x4_t)worldRotation, 3);
  v11 = vmulq_lane_f32((float32x4_t)worldRotation, *(float32x2_t *)worldRotation.vector.f32, 1).f32[0];
  v15.i32[3] = HIDWORD(*MEMORY[0x1E0C83FF0]);
  v15.f32[0] = (float)(1.0 - v9.f32[1]) - v9.f32[2];
  v15.f32[1] = (float)(v11 + v10.f32[2]) + (float)(v11 + v10.f32[2]);
  v12 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 32);
  v13 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
  v16.i32[3] = v7.i32[3];
  v16.f32[0] = (float)(v11 - v10.f32[2]) + (float)(v11 - v10.f32[2]);
  v9.f32[0] = 1.0 - v9.f32[0];
  v16.f32[1] = v9.f32[0] - v9.f32[2];
  v14 = vmul_laneq_f32(*(float32x2_t *)worldRotation.vector.f32, (float32x4_t)worldRotation, 2);
  v15.f32[2] = (float)(v14.f32[0] - v10.f32[1]) + (float)(v14.f32[0] - v10.f32[1]);
  v16.f32[2] = (float)(v14.f32[1] + v10.f32[0]) + (float)(v14.f32[1] + v10.f32[0]);
  *(int32x2_t *)v10.f32 = vrev64_s32(*(int32x2_t *)v10.f32);
  v17.i32[0] = vadd_f32(v14, *(float32x2_t *)v10.f32).u32[0];
  v17.i32[1] = vsub_f32(v14, *(float32x2_t *)&v10).i32[1];
  *(float32x2_t *)v18.f32 = vadd_f32(v17, v17);
  v18.i32[3] = vextq_s8(*(int8x16_t *)&v12, *(int8x16_t *)&v12, 8uLL).i32[1];
  v18.f32[2] = v9.f32[0] - v9.f32[1];
  v19 = vnegq_f32((float32x4_t)worldTarget);
  v19.i32[3] = v13.i32[3];
  v30 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
  v31 = v7;
  v32 = v12;
  v33 = v19;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v34 + v5) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v15, COERCE_FLOAT(*(_OWORD *)((char *)&v30 + v5))), v16, *(float32x2_t *)&v30.f32[v5 / 4], 1), v18, *(float32x4_t *)((char *)&v30 + v5), 2), v13, *(float32x4_t *)((char *)&v30 + v5), 3);
    v5 += 16;
  }
  while (v5 != 64);
  v20 = 0;
  worldTarget.i32[3] = v13.i32[3];
  v30 = v34;
  v31 = v35;
  v32 = v36;
  v33 = v37;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v34 + v20) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v6, COERCE_FLOAT(*(_OWORD *)((char *)&v30 + v20))), v7, *(float32x2_t *)&v30.f32[v20 / 4], 1), v12, *(float32x4_t *)((char *)&v30 + v20), 2), (float32x4_t)worldTarget, *(float32x4_t *)((char *)&v30 + v20), 3);
    v20 += 16;
  }
  while (v20 != 64);
  v28 = v35;
  v29 = v34;
  v26 = v37;
  v27 = v36;
  -[SCNNode simdWorldTransform](self, "simdWorldTransform");
  v21 = 0;
  v30 = v22;
  v31 = v23;
  v32 = v24;
  v33 = v25;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v34 + v21) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(*(_OWORD *)((char *)&v30 + v21))), v28, *(float32x2_t *)&v30.f32[v21 / 4], 1), v27, *(float32x4_t *)((char *)&v30 + v21), 2), v26, *(float32x4_t *)((char *)&v30 + v21), 3);
    v21 += 16;
  }
  while (v21 != 64);
  -[SCNNode setSimdWorldTransform:](self, "setSimdWorldTransform:", *(double *)v34.i64, *(double *)v35.i64, *(double *)v36.i64, *(double *)v37.i64);
}

- (int64_t)authoringCameraType
{
  return objc_msgSend(objc_getAssociatedObject(self, sel_authoringCameraType), "integerValue");
}

- (void)setAuthoringCameraType:(int64_t)a3
{
  objc_setAssociatedObject(self, sel_authoringCameraType, (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), (void *)0x301);
}

- (id)debugQuickLookObject
{
  SCNNode *v2;
  SCNScene *v3;

  v2 = -[SCNNode clone](self, "clone");
  -[SCNNode setHidden:](v2, "setHidden:", 0);
  v3 = +[SCNScene scene](SCNScene, "scene");
  -[SCNNode addChildNode:](-[SCNScene rootNode](v3, "rootNode"), "addChildNode:", v2);
  return -[SCNScene debugQuickLookObject](v3, "debugQuickLookObject");
}

- (id)debugQuickLookData
{
  return UIImagePNGRepresentation((UIImage *)-[SCNNode debugQuickLookObject](self, "debugQuickLookObject"));
}

- (void)setName:.cold.1()
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

- (void)_setQuaternion:.cold.1()
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

- (void)_setPosition:.cold.1()
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

- (void)_setScale:.cold.1()
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

- (void)setMovabilityHint:.cold.1()
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

- (void)setCastsShadow:.cold.1()
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

- (void)setUsesDepthPrePass:.cold.1()
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

- (void)setCategoryBitMask:.cold.1()
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

- (void)setHidden:.cold.1()
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

- (void)setOpacity:.cold.1()
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

- (void)setRenderingOrder:.cold.1()
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

- (void)setValue:forUndefinedKey:.cold.1()
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

- (void)__insertObject:inChildNodesAtIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: attempt to add a parent node as a child node", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)__removeObjectFromChildNodesAtIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: removeChildNodeAtIndex - index out of bounds", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __47__SCNNode___removeObjectFromChildNodesAtIndex___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: error in removeObjectFromChildNodesAtIndex -> try to remove inconsitent node", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)replaceObjectInChildNodesAtIndex:withObject:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: error in replaceObjectInChildNodesAtIndex -> index out of bounds", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)replaceObjectInChildNodesAtIndex:withObject:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_5();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1DCCB8000, v1, OS_LOG_TYPE_ERROR, "Unreachable code: circular reference found when trying to add %@ as a child node of %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __55__SCNNode_replaceObjectInChildNodesAtIndex_withObject___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: error in replaceObjectInChildNodesAtIndex", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)frame
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Coordinate space inconsistency", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setPhysicsBody:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "_owner");
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11_0(&dword_1DCCB8000, v1, v2, "Error: Physics body %@ already has a owner: %@ that is not %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_11();
}

- (void)setPhysicsBody:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "_owner");
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11_0(&dword_1DCCB8000, v1, v2, "Error: Physics body %@ 's owner (%@) should be %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_11();
}

- (void)addParticleSystem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: attempt to add a null particle system on %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)removeObjectFromParticleSystemsAtIndex:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. removeObjectFromMaterialsAtIndex: index out of bounds", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)replaceObjectInParticleSystemsAtIndex:(uint64_t)a3 withObject:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)addAudioPlayer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: attempt to add a null audio player on %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
