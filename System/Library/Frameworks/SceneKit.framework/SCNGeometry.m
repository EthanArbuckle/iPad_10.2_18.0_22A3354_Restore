@implementation SCNGeometry

- (__C3DScene)sceneRef
{
  return (__C3DScene *)C3DGetScene((_QWORD *)-[SCNGeometry __CFObject](self, "__CFObject"));
}

- (void)__CFObject
{
  return self->_geometry;
}

CFStringRef __23__SCNGeometry_setName___block_invoke(uint64_t a1)
{
  return C3DEntitySetName(objc_msgSend(*(id *)(a1 + 32), "__CFObject"), *(CFStringRef *)(a1 + 40));
}

- (SCNMaterial)firstMaterial
{
  SCNMaterial *result;

  result = -[SCNGeometry _firstMaterial](self, "_firstMaterial");
  if ((*((_BYTE *)self + 16) & 1) != 0)
    return (SCNMaterial *)-[SCNMaterial presentationMaterial](result, "presentationMaterial");
  return result;
}

- (id)_firstMaterial
{
  id v2;
  void *v3;

  v2 = -[SCNGeometry mutableMaterials](self, "mutableMaterials");
  if (v2 && (v3 = v2, objc_msgSend(v2, "count")))
    return (id)objc_msgSend(v3, "objectAtIndex:", 0);
  else
    return 0;
}

- (id)mutableMaterials
{
  id result;

  result = self->_materials;
  if (!result)
  {
    -[SCNGeometry _expand](self, "_expand");
    return self->_materials;
  }
  return result;
}

+ (SCNGeometry)geometryWithMDLMesh:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  MDLMesh *v8;
  NSDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  SCNGeometryElement *v14;
  SCNMaterial *v15;
  _anonymous_namespace_ *v16;
  unsigned int v17;
  uint64_t v18;
  SCNGeometry *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  unsigned int v28;
  _anonymous_namespace_ *v30;
  id v31;
  NSMutableArray *obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  SCNGeometryElement *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t *v43;
  _QWORD *v44;
  uint64_t v45;
  SCNGeometryElement v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = (_anonymous_namespace_ *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  obj = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v46._meshElement = 0;
  v46._elementData = 0;
  v45 = 0;
  v46.super.isa = (Class)&v46._meshElement;
  v43 = (uint64_t *)&v44;
  v44 = 0;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v7 = (void *)objc_msgSend(a3, "submeshes");
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        if (objc_msgSend(v13, "indexCount"))
        {
          v14 = +[SCNGeometryElement geometryElementWithMDLSubmesh:](SCNGeometryElement, "geometryElementWithMDLSubmesh:", v13);
          if (v14)
            objc_msgSend(v6, "addObject:", v14);
          v15 = (SCNMaterial *)objc_msgSend(v13, "material", v14);
          if (v15)
          {
            v15 = +[SCNMaterial materialWithMDLMaterial:options:](SCNMaterial, "materialWithMDLMaterial:options:", v15, a4);
            if (v15)
              objc_msgSend(v31, "addObject:", v15);
          }
          objc_msgSend(v13, "topology", v15);
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v10);
  }
  v16 = v30;
  v37 = 0;
  v38 = 0;
  if (objc_msgSend((id)objc_msgSend(a3, "submeshes"), "count"))
  {
    v17 = 0;
    v18 = *MEMORY[0x1E0CC7760];
    while (1)
    {
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "vertexDescriptor"), "attributes"), "count") <= (unint64_t)v17)
      {
        v28 = 0;
        goto LABEL_25;
      }
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "vertexDescriptor"), "attributes"), "objectAtIndexedSubscript:", v17), "name"), "containsString:", v18) & 1) != 0)break;
      ++v17;
    }
    v28 = v17;
LABEL_25:
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, &v46._primitiveType, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v34 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
          v25 = objc_msgSend(v24, "unsignedLongValue");
          if (v25 >= objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "submeshes"), "objectAtIndexedSubscript:", 0), "faceIndexing"), "count"))v26 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28);
          else
            v26 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "submeshes"), "objectAtIndexedSubscript:", 0), "faceIndexing"), "objectAtIndexedSubscript:", objc_msgSend(v24, "integerValue"));
          objc_msgSend(v20, "addObject:", v26);
        }
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, &v46._primitiveType, 16);
      }
      while (v21);
    }
    v16 = v30;
    if (v45)
      objc_msgSend(v20, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28));
    v19 = (SCNGeometry *)objc_msgSend(a1, "geometryWithSources:elements:sourceChannels:", v30, v6, v20);

  }
  else
  {
    v19 = (SCNGeometry *)objc_msgSend(a1, "geometryWithSources:elements:", v30, v6);
  }
  -[SCNGeometry setName:](v19, "setName:", objc_msgSend(a3, "name"));
  -[SCNGeometry setSubdivisionLevel:](v19, "setSubdivisionLevel:", 0);
  -[SCNGeometry setEdgeCreasesElement:](v19, "setEdgeCreasesElement:", v37);
  -[SCNGeometry setEdgeCreasesSource:](v19, "setEdgeCreasesSource:", v38);
  -[SCNGeometry setMaterials:](v19, "setMaterials:", v31);

  std::__tree<char>::destroy((uint64_t)&v43, v44);
  std::__tree<char>::destroy((uint64_t)&v46, &v46._meshElement->var0.var0.var0);
  return v19;
}

- (void)setMaterials:(NSArray *)materials
{
  NSUInteger v5;
  NSUInteger v6;
  uint64_t i;

  -[SCNGeometry removeAllMaterials](self, "removeAllMaterials");
  v5 = -[NSArray count](materials, "count");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[SCNGeometry insertMaterial:atIndex:](self, "insertMaterial:atIndex:", -[NSArray objectAtIndex:](materials, "objectAtIndex:", i), i);
  }
}

- (void)removeAllMaterials
{
  __C3DScene *v3;
  _QWORD v4[5];

  -[NSMutableArray removeAllObjects](self->_materials, "removeAllObjects");
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__SCNGeometry_removeAllMaterials__block_invoke;
  v4[3] = &unk_1EA59E4A0;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v3, self, v4);
  if (!self->_materials)
    self->_materials = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
}

void __33__SCNGeometry_removeAllMaterials__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  if (v1)
    C3DGeometryRemoveAllMaterials(v1);
}

- (__C3DGeometry)geometryRef
{
  return self->_geometry;
}

- (void)insertObject:(id)a3 inMaterialsAtIndex:(unint64_t)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *materials;
  __C3DScene *v16;
  _QWORD v17[7];

  if (!a3)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[SCNGeometry insertObject:inMaterialsAtIndex:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  materials = self->_materials;
  if (!materials)
  {
    -[SCNGeometry _expand](self, "_expand");
    materials = self->_materials;
  }
  -[NSMutableArray insertObject:atIndex:](materials, "insertObject:atIndex:", a3, a4);
  v16 = -[SCNGeometry sceneRef](self, "sceneRef");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __47__SCNGeometry_insertObject_inMaterialsAtIndex___block_invoke;
  v17[3] = &unk_1EA59E2B0;
  v17[4] = self;
  v17[5] = a3;
  v17[6] = a4;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v16, self, v17);
}

void __47__SCNGeometry_insertObject_inMaterialsAtIndex___block_invoke(uint64_t a1)
{
  C3DGeometryInsertMaterialAtIndex(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (void *)objc_msgSend(*(id *)(a1 + 40), "materialRef"), *(_QWORD *)(a1 + 48));
}

- (void)setSubdivisionLevel:(NSUInteger)subdivisionLevel
{
  uint64_t v3;
  uint64_t v4;
  SCNGeometryTessellator *tessellator;
  __C3DScene *v8;
  _QWORD v9[12];

  if (subdivisionLevel <= 0x7FFFFFFFFFFFFFFELL)
  {
    v9[10] = v3;
    v9[11] = v4;
    if (self->_subdivisionLevel != subdivisionLevel)
    {
      self->_subdivisionLevel = subdivisionLevel;
      tessellator = self->_tessellator;
      if (tessellator)
        -[SCNGeometryTessellator tessellatorValueDidChangeForClient:](tessellator, "tessellatorValueDidChangeForClient:", self);
      v8 = -[SCNGeometry sceneRef](self, "sceneRef");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __35__SCNGeometry_setSubdivisionLevel___block_invoke;
      v9[3] = &unk_1EA59E450;
      v9[4] = self;
      v9[5] = subdivisionLevel;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, self, v9);
    }
  }
}

- (void)setName:(NSString *)name
{
  __C3DScene *v5;
  NSObject *v6;
  _QWORD v7[6];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNGeometry setName:].cold.1();
  }
  else if ((unint64_t)name | (unint64_t)self->_name)
  {
    if ((-[NSString isEqual:](name, "isEqual:") & 1) == 0)
    {

      self->_name = (NSString *)-[NSString copy](name, "copy");
      v5 = -[SCNGeometry sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __23__SCNGeometry_setName___block_invoke;
      v7[3] = &unk_1EA59F740;
      v7[4] = self;
      v7[5] = name;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v7);
    }
  }
}

- (void)setEdgeCreasesSource:(SCNGeometrySource *)edgeCreasesSource
{
  SCNGeometrySource *v3;
  __C3DScene *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];

  v3 = self->_edgeCreasesSource;
  if (v3 != edgeCreasesSource)
  {
    if (!edgeCreasesSource)
    {
LABEL_5:

      self->_edgeCreasesSource = edgeCreasesSource;
      v6 = -[SCNGeometry sceneRef](self, "sceneRef");
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __36__SCNGeometry_setEdgeCreasesSource___block_invoke;
      v15[3] = &unk_1EA59E4A0;
      v15[4] = self;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v15);
      return;
    }
    if (-[NSString isEqualToString:](-[SCNGeometrySource semantic](edgeCreasesSource, "semantic"), "isEqualToString:", CFSTR("kGeometrySourceSemanticEdgeCrease")))
    {
      v3 = self->_edgeCreasesSource;
      goto LABEL_5;
    }
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNGeometry setEdgeCreasesSource:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (void)setEdgeCreasesElement:(SCNGeometryElement *)edgeCreasesElement
{
  SCNGeometryElement *v3;
  __C3DScene *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];

  v3 = self->_edgeCreasesElement;
  if (v3 != edgeCreasesElement)
  {
    if (!edgeCreasesElement)
    {
LABEL_5:

      self->_edgeCreasesElement = edgeCreasesElement;
      v6 = -[SCNGeometry sceneRef](self, "sceneRef");
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __37__SCNGeometry_setEdgeCreasesElement___block_invoke;
      v15[3] = &unk_1EA59E4A0;
      v15[4] = self;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v15);
      return;
    }
    if (-[SCNGeometryElement primitiveType](edgeCreasesElement, "primitiveType") == SCNGeometryPrimitiveTypeLine)
    {
      v3 = self->_edgeCreasesElement;
      goto LABEL_5;
    }
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNGeometry setEdgeCreasesElement:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
}

+ (SCNGeometry)geometryWithSources:(id)a3 elements:(id)a4 sourceChannels:(id)a5
{
  const void *v7;
  void *Default;
  const __CFAllocator *v9;
  CFIndex v10;
  const CFArrayCallBacks *v11;
  __CFArray *Mutable;
  __CFArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  size_t v23;
  char *v24;
  void *v25;
  uint64_t *v26;
  _QWORD *v27;
  Class v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v29 = (Class)a1;
  v30 = a5;
  v41 = *MEMORY[0x1E0C80C00];
  v7 = (const void *)C3DGeometryCreate();
  Default = (void *)C3DMaterialCreateDefault();
  C3DGeometryAppendMaterial((uint64_t)v7, Default);
  CFRelease(Default);
  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v10 = objc_msgSend(a3, "count");
  v11 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
  Mutable = CFArrayCreateMutable(v9, v10, MEMORY[0x1E0C9B378]);
  v13 = CFArrayCreateMutable(v9, objc_msgSend(a4, "count"), v11);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(a3);
        v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v18, "_clearC3DCache", v29);
        CFArrayAppendValue(Mutable, (const void *)objc_msgSend(v18, "meshSource"));
      }
      v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v15);
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v19 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v31, v39, 16, v29);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(a4);
        CFArrayAppendValue(v13, (const void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "meshElement"));
      }
      v20 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v20);
  }
  v23 = objc_msgSend(a3, "count");
  v24 = (char *)&v29 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = v30;
  __buildSourceChannels(v30, v23, a4, v24);
  v26 = (uint64_t *)C3DMeshCreateWithMeshSourcesAndMeshElements(Mutable, v13, (uint64_t)v24);
  C3DGeometrySetMesh((uint64_t)v7, v26);
  CFRelease(Mutable);
  CFRelease(v13);
  CFRelease(v26);
  v27 = (_QWORD *)objc_msgSend([v29 alloc], "initWithGeometryRef:", v7);
  v27[5] = objc_msgSend(v25, "copy");
  if (v7)
    CFRelease(v7);
  return (SCNGeometry *)v27;
}

- (SCNGeometry)initWithGeometryRef:(__C3DGeometry *)a3
{
  SCNGeometry *v4;
  __C3DGeometry *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNGeometry;
  v4 = -[SCNGeometry init](&v7, sel_init);
  if (v4)
  {
    v5 = (__C3DGeometry *)CFRetain(a3);
    v4->_geometry = v5;
    if (v5)
      C3DEntitySetObjCWrapper((uint64_t)v5, v4);
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    v4->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
    -[SCNGeometry _syncObjCModel](v4, "_syncObjCModel");
    -[SCNGeometry _syncObjCAnimations](v4, "_syncObjCAnimations");
  }
  return v4;
}

- (void)_syncObjCModel
{
  id *EdgeCreasesSource;
  id *v4;
  id *ObjCWrapper;
  SCNGeometrySource *v6;
  id *EdgeCreasesElement;
  id *v8;
  id *v9;
  SCNGeometryElement *v10;

  -[SCNGeometry _syncEntityObjCModel](self, "_syncEntityObjCModel");
  self->_subdivisionIsAdaptive = C3DGeometryOsdGetWantsAdaptiveSubdivision((uint64_t)self->_geometry);
  self->_subdivisionSettings = ($FB11F3FFE165EAA867AAC892096804C2)C3DGeometryOsdGetSubdivisionSettings((uint64_t)self->_geometry);

  self->_edgeCreasesSource = 0;
  EdgeCreasesSource = (id *)C3DGeometryOsdGetEdgeCreasesSource((uint64_t)self->_geometry);
  if (EdgeCreasesSource)
  {
    v4 = EdgeCreasesSource;
    ObjCWrapper = C3DEntityGetObjCWrapper(EdgeCreasesSource);
    if (ObjCWrapper)
      v6 = ObjCWrapper;
    else
      v6 = -[SCNGeometrySource initWithMeshSource:]([SCNGeometrySource alloc], "initWithMeshSource:", v4);
    self->_edgeCreasesSource = v6;
  }

  self->_edgeCreasesElement = 0;
  EdgeCreasesElement = (id *)C3DGeometryOsdGetEdgeCreasesElement((uint64_t)self->_geometry);
  if (EdgeCreasesElement)
  {
    v8 = EdgeCreasesElement;
    v9 = C3DEntityGetObjCWrapper(EdgeCreasesElement);
    if (v9)
      v10 = v9;
    else
      v10 = -[SCNGeometryElement initWithMeshElement:]([SCNGeometryElement alloc], "initWithMeshElement:", v8);
    self->_edgeCreasesElement = v10;
  }
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

  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(SCNOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  v5 = -[SCNGeometry __CFObject](self, "__CFObject");
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

- (void)_syncEntityObjCModel
{
  void *v3;

  v3 = -[SCNGeometry __CFObject](self, "__CFObject");

  self->_name = (NSString *)(id)C3DEntityGetName((uint64_t)v3);
}

- (id)copy
{
  return -[SCNGeometry copyWithZone:](self, "copyWithZone:", 0);
}

- (void)_setupObjCModelFrom:(id)a3
{
  void *v5;
  _QWORD v6[5];

  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  -[SCNGeometry setLevelsOfDetail:](self, "setLevelsOfDetail:", objc_msgSend(a3, "levelsOfDetail"));
  -[SCNGeometry setMaterials:](self, "setMaterials:", objc_msgSend(a3, "materials"));
  -[SCNGeometry setSubdivisionLevel:](self, "setSubdivisionLevel:", objc_msgSend(a3, "subdivisionLevel"));
  -[SCNGeometry setWantsAdaptiveSubdivision:](self, "setWantsAdaptiveSubdivision:", objc_msgSend(a3, "wantsAdaptiveSubdivision"));
  -[SCNGeometry set_subdivisionSettings:](self, "set_subdivisionSettings:", objc_msgSend(a3, "_subdivisionSettings"));
  -[SCNGeometry _copyAnimationsFrom:](self, "_copyAnimationsFrom:", a3);
  os_unfair_lock_lock((os_unfair_lock_t)a3 + 38);
  v5 = (void *)*((_QWORD *)a3 + 18);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__SCNGeometry__setupObjCModelFrom___block_invoke;
  v6[3] = &unk_1EA59F6F0;
  v6[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);
  os_unfair_lock_unlock((os_unfair_lock_t)a3 + 38);
  -[SCNGeometry setTessellator:](self, "setTessellator:", objc_msgSend(a3, "tessellator"));
  +[SCNTransaction commitImmediate](SCNTransaction, "commitImmediate");
}

- (BOOL)wantsAdaptiveSubdivision
{
  return self->_subdivisionIsAdaptive;
}

- (SCNGeometryTessellator)tessellator
{
  return self->_tessellator;
}

- (NSUInteger)subdivisionLevel
{
  return self->_subdivisionLevel;
}

- (void)set_subdivisionSettings:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[5];
  $DCA043AFB23218D33360BC4455B4EE77 v7;
  $DCA043AFB23218D33360BC4455B4EE77 v8;

  v8 = a3;
  if (a3 != *(_DWORD *)&self->_subdivisionSettings)
  {
    self->_subdivisionSettings = ($FB11F3FFE165EAA867AAC892096804C2)a3;
    v5 = -[SCNGeometry sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__SCNGeometry_set_subdivisionSettings___block_invoke;
    v6[3] = &unk_1EA5A2D30;
    v6[4] = self;
    v7 = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

- (void)setWantsAdaptiveSubdivision:(BOOL)wantsAdaptiveSubdivision
{
  __C3DScene *v5;
  _QWORD v6[5];
  BOOL v7;

  if (self->_subdivisionIsAdaptive != wantsAdaptiveSubdivision)
  {
    self->_subdivisionIsAdaptive = wantsAdaptiveSubdivision;
    v5 = -[SCNGeometry sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__SCNGeometry_setWantsAdaptiveSubdivision___block_invoke;
    v6[3] = &unk_1EA59E478;
    v6[4] = self;
    v7 = wantsAdaptiveSubdivision;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

- (void)setTessellator:(SCNGeometryTessellator *)tessellator
{
  SCNGeometryTessellator *v4;
  SCNGeometryTessellator *v6;

  v4 = self->_tessellator;
  if (v4 != tessellator)
  {
    -[SCNGeometryTessellator removeClient:](v4, "removeClient:", self);

    v6 = tessellator;
    self->_tessellator = v6;
    -[SCNGeometryTessellator addClient:](v6, "addClient:", self);
  }
}

- (void)setLevelsOfDetail:(NSArray *)levelsOfDetail
{
  NSArray *v3;
  NSArray *v6;
  __C3DScene *v7;
  _QWORD v8[6];

  v3 = self->_levelsOfDetail;
  if (v3 != levelsOfDetail)
  {

    self->_levelsOfDetail = (NSArray *)-[NSArray copy](levelsOfDetail, "copy");
    v6 = -[NSArray sortedArrayUsingComparator:](levelsOfDetail, "sortedArrayUsingComparator:", &__block_literal_global_82);
    v7 = -[SCNGeometry sceneRef](self, "sceneRef");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __33__SCNGeometry_setLevelsOfDetail___block_invoke_2;
    v8[3] = &unk_1EA59F740;
    v8[4] = v6;
    v8[5] = self;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v8);
  }
}

- (NSArray)materials
{
  NSMutableArray *materials;
  NSArray *v4;
  uint64_t v5;
  uint64_t i;

  if (!self->_materials)
    -[SCNGeometry _expand](self, "_expand");
  materials = self->_materials;
  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v5 = -[NSMutableArray count](materials, "count");
    v4 = (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
    if (v5 >= 1)
    {
      for (i = 0; i != v5; ++i)
        -[NSArray addObject:](v4, "addObject:", objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_materials, "objectAtIndex:", i), "presentationMaterial"));
    }
  }
  else
  {
    v4 = (NSArray *)(id)-[NSMutableArray copy](materials, "copy");
  }
  if (-[NSArray count](v4, "count"))
    return v4;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)levelsOfDetail
{
  return self->_levelsOfDetail;
}

- ($DCA043AFB23218D33360BC4455B4EE77)_subdivisionSettings
{
  return ($DCA043AFB23218D33360BC4455B4EE77)self->_subdivisionSettings;
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
        -[SCNGeometry addAnimationPlayer:forKey:](self, "addAnimationPlayer:forKey:", v11, v10);

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

- (id)copyWithZone:(_NSZone *)a3
{
  const void *Copy;
  void *v5;

  Copy = (const void *)C3DGeometryCreateCopy(-[SCNGeometry geometryRef](self, "geometryRef", a3));
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGeometryRef:", Copy);
  if (Copy)
    CFRelease(Copy);
  objc_msgSend(v5, "_setupObjCModelFrom:", self);
  -[SCNGeometry _copyAttributesTo:](self, "_copyAttributesTo:", v5);
  return v5;
}

- (void)_copyAttributesTo:(id)a3
{
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  id v6;

  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v6 = (id)-[NSMutableDictionary mutableCopy](self->_valuesForUndefinedKeys, "mutableCopy");
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  objc_msgSend(a3, "_setAttributes:", v6);
  objc_msgSend(a3, "copyShaderModifiersAndLanguageVersionFrom:", self);

}

- (void)_setAttributes:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__SCNGeometry__setAttributes___block_invoke;
  v3[3] = &unk_1EA59F6F0;
  v3[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

- (void)copyShaderModifiersAndLanguageVersionFrom:(id)a3
{
  void *v5;
  NSObject *v6;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNGeometry copyShaderModifiersAndLanguageVersionFrom:].cold.1();
  }
  else
  {
    if (objc_msgSend(a3, "shaderModifiers"))
      -[SCNGeometry _setupShadableHelperIfNeeded](self, "_setupShadableHelperIfNeeded");
    v5 = (void *)objc_msgSend(a3, "__shadableHelper");
    -[SCNShadableHelper copyModifiersFrom:](self->_shadableHelper, "copyModifiersFrom:", v5);
    -[SCNShadableHelper setMinimumLanguageVersion:](self->_shadableHelper, "setMinimumLanguageVersion:", objc_msgSend(v5, "minimumLanguageVersion"));
  }
}

- (NSDictionary)shaderModifiers
{
  return -[SCNShadableHelper shaderModifiers](self->_shadableHelper, "shaderModifiers");
}

- (id)__shadableHelper
{
  return self->_shadableHelper;
}

+ (SCNGeometry)geometryWithMDLMesh:(id)a3 submesh:(id)a4 options:(id)a5
{
  SCNGeometry *v5;
  id v10;
  id v11;
  _anonymous_namespace_ *v12;
  NSMutableArray *v13;
  SCNGeometryElement *v14;
  uint64_t v15;
  SCNMaterial *v16;
  MDLMesh *v17;
  NSDictionary *v18;
  SCNGeometryElement *v20;
  uint64_t v21;
  uint64_t *v22;
  _QWORD *v23[2];
  SCNGeometryElement v24;

  v5 = 0;
  if (a3 && a4)
  {
    if (objc_msgSend(a4, "indexCount"))
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v12 = (_anonymous_namespace_ *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v14 = +[SCNGeometryElement geometryElementWithMDLSubmesh:](SCNGeometryElement, "geometryElementWithMDLSubmesh:", a4);
      if (v14)
        objc_msgSend(v10, "addObject:", v14);
      v15 = objc_msgSend(a4, "material");
      if (v15)
      {
        v16 = +[SCNMaterial materialWithMDLMaterial:option:](SCNMaterial, "materialWithMDLMaterial:option:", v15, a5);
        if (v16)
          objc_msgSend(v11, "addObject:", v16);
      }
      v24._meshElement = 0;
      v24._elementData = 0;
      v23[1] = 0;
      v24.super.isa = (Class)&v24._meshElement;
      v22 = (uint64_t *)v23;
      v23[0] = 0;
      v20 = 0;
      v21 = 0;
      v5 = (SCNGeometry *)objc_msgSend(a1, "geometryWithSources:elements:", v12, v10);
      -[SCNGeometry setName:](v5, "setName:", objc_msgSend(a3, "name"));
      -[SCNGeometry setSubdivisionLevel:](v5, "setSubdivisionLevel:", 0);
      -[SCNGeometry setEdgeCreasesElement:](v5, "setEdgeCreasesElement:", v20);
      -[SCNGeometry setEdgeCreasesSource:](v5, "setEdgeCreasesSource:", v21);
      -[SCNGeometry setMaterials:](v5, "setMaterials:", v11);

      std::__tree<char>::destroy((uint64_t)&v22, v23[0]);
      std::__tree<char>::destroy((uint64_t)&v24, &v24._meshElement->var0.var0.var0);
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

+ (SCNGeometry)geometryWithMDLMesh:(MDLMesh *)mdlMesh
{
  return (SCNGeometry *)objc_msgSend(a1, "geometryWithMDLMesh:options:", mdlMesh, 0);
}

+ (id)morpherWithMDLMesh:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  uint64_t v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  SCNMorpher *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  _QWORD v48[2];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "vertexDescriptor");
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v7 = (void *)objc_msgSend(v4, "attributes");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v44;
    v11 = *MEMORY[0x1E0CC7760];
    v12 = *MEMORY[0x1E0CC7750];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v44 != v10)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        if (objc_msgSend(v14, "format"))
        {
          if (objc_msgSend((id)objc_msgSend(v14, "name"), "containsString:", v11))
            objc_msgSend(v5, "addObject:", v14);
          if (objc_msgSend((id)objc_msgSend(v14, "name"), "containsString:", v12))
            objc_msgSend(v6, "addObject:", v14);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v9);
  }
  if (objc_msgSend(v5, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v16 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v40 != v18)
            objc_enumerationMutation(v5);
          objc_msgSend(v15, "addObject:", +[SCNGeometrySource geometrySourceWithMDLVertexAttribute:mesh:](SCNGeometrySource, "geometrySourceWithMDLVertexAttribute:mesh:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j), a3));
        }
        v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
      }
      while (v17);
    }
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v36;
      do
      {
        for (k = 0; k != v22; ++k)
        {
          if (*(_QWORD *)v36 != v23)
            objc_enumerationMutation(v6);
          objc_msgSend(v20, "addObject:", +[SCNGeometrySource geometrySourceWithMDLVertexAttribute:mesh:](SCNGeometrySource, "geometrySourceWithMDLVertexAttribute:mesh:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * k), a3));
        }
        v22 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
      }
      while (v22);
    }
    v25 = objc_msgSend(a1, "geometryWithMDLMesh:", a3);
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v26, "addObject:", v25);
    }
    else
    {
      v28 = objc_msgSend(v15, "count");
      v29 = objc_msgSend(v20, "count");
      v30 = objc_msgSend(v15, "count");
      if (v28 == v29)
      {
        if (v30)
        {
          v31 = 0;
          do
          {
            v48[0] = objc_msgSend(v15, "objectAtIndexedSubscript:", v31);
            v48[1] = objc_msgSend(v20, "objectAtIndexedSubscript:", v31);
            objc_msgSend(v26, "addObject:", +[SCNGeometry geometryWithSources:elements:](SCNGeometry, "geometryWithSources:elements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2), 0));
            ++v31;
          }
          while (v31 < objc_msgSend(v15, "count"));
        }
      }
      else if (v30)
      {
        v32 = 0;
        do
        {
          v47 = objc_msgSend(v15, "objectAtIndexedSubscript:", v32);
          objc_msgSend(v26, "addObject:", +[SCNGeometry geometryWithSources:elements:](SCNGeometry, "geometryWithSources:elements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1), 0));
          ++v32;
        }
        while (v32 < objc_msgSend(v15, "count"));
      }
    }

    v33 = objc_alloc_init(SCNMorpher);
    -[SCNMorpher setTargets:](v33, "setTargets:", v26);

    return v33;
  }
  else
  {

    return 0;
  }
}

- (void)setValueForKey:(id)a3 optionKey:(id)a4 options:(id)a5
{
  uint64_t v7;

  v7 = objc_msgSend(a5, "objectForKey:", a4);
  if (v7)
    -[SCNGeometry setValue:forKey:](self, "setValue:forKey:", v7, a3);
}

+ (id)planeWithWidth:(double)a3 height:(double)a4 options:(id)a5
{
  SCNPlane *v6;

  v6 = +[SCNPlane planeWithWidth:height:](SCNPlane, "planeWithWidth:height:", a3, a4);
  -[SCNGeometry setValueForKey:optionKey:options:](v6, "setValueForKey:optionKey:options:", CFSTR("widthSegmentCount"), CFSTR("kPrimitiveWidthSegments"), a5);
  -[SCNGeometry setValueForKey:optionKey:options:](v6, "setValueForKey:optionKey:options:", CFSTR("heightSegmentCount"), CFSTR("kPrimitiveHeightSegments"), a5);
  return v6;
}

+ (id)boxWithWidth:(double)a3 height:(double)a4 length:(double)a5 cornerRadius:(double)a6 options:(id)a7
{
  SCNBox *v8;

  v8 = +[SCNBox boxWithWidth:height:length:chamferRadius:](SCNBox, "boxWithWidth:height:length:chamferRadius:", a3, a4, a5, a6);
  -[SCNGeometry setValueForKey:optionKey:options:](v8, "setValueForKey:optionKey:options:", CFSTR("widthSegmentCount"), CFSTR("kPrimitiveWidthSegments"), a7);
  -[SCNGeometry setValueForKey:optionKey:options:](v8, "setValueForKey:optionKey:options:", CFSTR("heightSegmentCount"), CFSTR("kPrimitiveHeightSegments"), a7);
  -[SCNGeometry setValueForKey:optionKey:options:](v8, "setValueForKey:optionKey:options:", CFSTR("lengthSegmentCount"), CFSTR("kPrimitiveLengthSegments"), a7);
  -[SCNGeometry setValueForKey:optionKey:options:](v8, "setValueForKey:optionKey:options:", CFSTR("chamferSegmentCount"), CFSTR("kPrimitiveChamferSegments"), a7);
  return v8;
}

+ (id)pyramidWithWidth:(double)a3 height:(double)a4 length:(double)a5 options:(id)a6
{
  SCNPyramid *v7;

  v7 = +[SCNPyramid pyramidWithWidth:height:length:](SCNPyramid, "pyramidWithWidth:height:length:", a3, a4, a5);
  -[SCNGeometry setValueForKey:optionKey:options:](v7, "setValueForKey:optionKey:options:", CFSTR("widthSegmentCount"), CFSTR("kPrimitiveWidthSegments"), a6);
  -[SCNGeometry setValueForKey:optionKey:options:](v7, "setValueForKey:optionKey:options:", CFSTR("heightSegmentCount"), CFSTR("kPrimitiveHeightSegments"), a6);
  -[SCNGeometry setValueForKey:optionKey:options:](v7, "setValueForKey:optionKey:options:", CFSTR("lengthSegmentCount"), CFSTR("kPrimitiveLengthSegments"), a6);
  return v7;
}

+ (id)sphereWithRadius:(double)a3 options:(id)a4
{
  SCNSphere *v5;
  void *v6;

  v5 = +[SCNSphere sphereWithRadius:](SCNSphere, "sphereWithRadius:", a3);
  -[SCNGeometry setValueForKey:optionKey:options:](v5, "setValueForKey:optionKey:options:", CFSTR("segmentCount"), CFSTR("kPrimitiveRotationSegments"), a4);
  v6 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kPrimitiveSphereType"));
  if (v6)
    -[SCNSphere setGeodesic:](v5, "setGeodesic:", objc_msgSend(v6, "isEqualToString:", CFSTR("kPrimitiveTypeGeosphere")));
  return v5;
}

+ (id)cylinderWithRadius:(double)a3 height:(double)a4 options:(id)a5
{
  SCNCylinder *v6;

  v6 = +[SCNCylinder cylinderWithRadius:height:](SCNCylinder, "cylinderWithRadius:height:", a3, a4);
  -[SCNGeometry setValueForKey:optionKey:options:](v6, "setValueForKey:optionKey:options:", CFSTR("radialSegmentCount"), CFSTR("kPrimitiveRotationSegments"), a5);
  -[SCNGeometry setValueForKey:optionKey:options:](v6, "setValueForKey:optionKey:options:", CFSTR("heightSegmentCount"), CFSTR("kPrimitiveHeightSegments"), a5);
  return v6;
}

+ (id)coneWithHeight:(double)a3 topRadius:(double)a4 bottomRadius:(double)a5 options:(id)a6
{
  SCNCone *v7;

  v7 = +[SCNCone coneWithTopRadius:bottomRadius:height:](SCNCone, "coneWithTopRadius:bottomRadius:height:", a4, a5, a3);
  -[SCNGeometry setValueForKey:optionKey:options:](v7, "setValueForKey:optionKey:options:", CFSTR("radialSegmentCount"), CFSTR("kPrimitiveRotationSegments"), a6);
  -[SCNGeometry setValueForKey:optionKey:options:](v7, "setValueForKey:optionKey:options:", CFSTR("heightSegmentCount"), CFSTR("kPrimitiveHeightSegments"), a6);
  return v7;
}

+ (id)tubeWithInnerRadius:(double)a3 outerRadius:(double)a4 height:(double)a5 options:(id)a6
{
  SCNTube *v7;

  v7 = +[SCNTube tubeWithInnerRadius:outerRadius:height:](SCNTube, "tubeWithInnerRadius:outerRadius:height:", a3, a4, a5);
  -[SCNGeometry setValueForKey:optionKey:options:](v7, "setValueForKey:optionKey:options:", CFSTR("radialSegmentCount"), CFSTR("kPrimitiveRotationSegments"), a6);
  -[SCNGeometry setValueForKey:optionKey:options:](v7, "setValueForKey:optionKey:options:", CFSTR("heightSegmentCount"), CFSTR("kPrimitiveHeightSegments"), a6);
  return v7;
}

+ (id)capsuleWithRadius:(double)a3 height:(double)a4 options:(id)a5
{
  SCNCapsule *v6;

  v6 = +[SCNCapsule capsuleWithCapRadius:height:](SCNCapsule, "capsuleWithCapRadius:height:", a3, a4);
  -[SCNGeometry setValueForKey:optionKey:options:](v6, "setValueForKey:optionKey:options:", CFSTR("radialSegmentCount"), CFSTR("kPrimitiveRotationSegments"), a5);
  -[SCNGeometry setValueForKey:optionKey:options:](v6, "setValueForKey:optionKey:options:", CFSTR("heightSegmentCount"), CFSTR("kPrimitiveHeightSegments"), a5);
  return v6;
}

+ (id)torusWithRingRadius:(double)a3 pipeRadius:(double)a4 options:(id)a5
{
  SCNTorus *v6;

  v6 = +[SCNTorus torusWithRingRadius:pipeRadius:](SCNTorus, "torusWithRingRadius:pipeRadius:", a3, a4);
  -[SCNGeometry setValueForKey:optionKey:options:](v6, "setValueForKey:optionKey:options:", CFSTR("ringSegmentCount"), CFSTR("kPrimitiveRotationSegments"), a5);
  -[SCNGeometry setValueForKey:optionKey:options:](v6, "setValueForKey:optionKey:options:", CFSTR("pipeSegmentCount"), CFSTR("kPrimitivePipeSegments"), a5);
  return v6;
}

+ (id)floorWithOptions:(id)a3
{
  return +[SCNFloor floor](SCNFloor, "floor", a3);
}

- (SCNGeometry)init
{
  SCNGeometry *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNGeometry;
  v2 = -[SCNGeometry init](&v5, sel_init);
  if (v2)
  {
    v3 = C3DGeometryCreate();
    v2->_geometry = (__C3DGeometry *)v3;
    if (v3)
      C3DEntitySetObjCWrapper(v3, v2);
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    v2->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
    -[SCNGeometry _syncObjCModel](v2, "_syncObjCModel");
  }
  return v2;
}

- (id)initPresentationGeometryWithGeometryRef:(__C3DGeometry *)a3
{
  SCNGeometry *v4;
  SCNGeometry *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNGeometry;
  v4 = -[SCNGeometry init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)v4 + 16) |= 1u;
    v4->_geometry = (__C3DGeometry *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
    v5->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (SCNGeometry)geometryWithGeometryRef:(__C3DGeometry *)a3
{
  SCNGeometry *result;

  result = (SCNGeometry *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
    return (SCNGeometry *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithGeometryRef:", a3);
  return result;
}

+ (SCNGeometry)geometry
{
  return (SCNGeometry *)objc_alloc_init((Class)a1);
}

- (void)dealloc
{
  __C3DGeometry *geometry;
  objc_super v4;
  _QWORD v5[5];

  geometry = self->_geometry;
  if (geometry)
  {
    if ((*((_BYTE *)self + 16) & 1) == 0)
    {
      C3DEntitySetObjCWrapper((uint64_t)geometry, 0);
      geometry = self->_geometry;
    }
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __22__SCNGeometry_dealloc__block_invoke;
    v5[3] = &__block_descriptor_40_e8_v16__0d8l;
    v5[4] = geometry;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, 0, v5);
  }
  -[SCNGeometryTessellator clientWillDie:](self->_tessellator, "clientWillDie:", self);

  -[SCNShadableHelper ownerWillDie](self->_shadableHelper, "ownerWillDie");
  free(self->_fixedBoundingBoxExtrema);
  v4.receiver = self;
  v4.super_class = (Class)SCNGeometry;
  -[SCNGeometry dealloc](&v4, sel_dealloc);
}

void __22__SCNGeometry_dealloc__block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (BOOL)isPresentationInstance
{
  return *((_BYTE *)self + 16) & 1;
}

- (NSString)name
{
  NSString *Name;
  __C3DScene *v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_name;
  v4 = -[SCNGeometry sceneRef](self, "sceneRef");
  v5 = (uint64_t)v4;
  if (v4)
    C3DSceneLock((uint64_t)v4);
  Name = (NSString *)C3DEntityGetName((uint64_t)-[SCNGeometry __CFObject](self, "__CFObject"));
  if (v5)
    C3DSceneUnlock(v5);
  return Name;
}

- (void)setIdentifier:(id)a3
{
  C3DEntitySetID((uint64_t)-[SCNGeometry __CFObject](self, "__CFObject"), a3);
}

- (id)identifier
{
  return (id)C3DEntityGetID((uint64_t)-[SCNGeometry __CFObject](self, "__CFObject"));
}

- (id)geometryDescription
{
  void *v3;
  NSUInteger v4;
  objc_class *v5;
  NSString *v6;
  uint64_t v8;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = -[NSString length](-[SCNGeometry name](self, "name"), "length");
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  if (v4)
    objc_msgSend(v3, "appendFormat:", CFSTR("%@: %p '%@'"), v6, self, -[SCNGeometry name](self, "name"));
  else
    objc_msgSend(v3, "appendFormat:", CFSTR("%@: %p"), v6, self, v8);
  if (-[SCNGeometry geometryElementCount](self, "geometryElementCount") >= 2)
    objc_msgSend(v3, "appendFormat:", CFSTR(" | %d elements"), -[SCNGeometry geometryElementCount](self, "geometryElementCount"));
  return v3;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@>"), -[SCNGeometry geometryDescription](self, "geometryDescription"));
}

- (void)_setGeometryRef:(__C3DGeometry *)a3
{
  __C3DGeometry *v3;
  __C3DGeometry *geometry;
  __C3DGeometry *v6;

  v3 = a3;
  geometry = self->_geometry;
  if (geometry)
  {
    C3DEntitySetObjCWrapper((uint64_t)geometry, 0);
    v6 = self->_geometry;
    if (v6 == v3)
      goto LABEL_10;
    if (v6)
    {
      CFRelease(v6);
      self->_geometry = 0;
    }
    if (!v3)
      goto LABEL_9;
  }
  else if (!a3)
  {
    goto LABEL_10;
  }
  v3 = (__C3DGeometry *)CFRetain(v3);
LABEL_9:
  self->_geometry = v3;
LABEL_10:
  if (v3)
    C3DEntitySetObjCWrapper((uint64_t)v3, self);
}

- (void)setGeometryRef:(__C3DGeometry *)a3
{
  if (self->_geometry != a3)
  {
    -[SCNGeometry _setGeometryRef:](self, "_setGeometryRef:");
    -[SCNGeometry willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("materials"));

    self->_materials = 0;
    -[SCNGeometry didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("materials"));
  }
}

- (id)presentationGeometry
{
  if ((*((_BYTE *)self + 16) & 1) == 0)
    return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initPresentationGeometryWithGeometryRef:", *((_QWORD *)self + 1));
  return self;
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (void)_releaseCachedSourcesAndElements
{

  self->_sources = 0;
  self->_elements = 0;
}

+ (SCNGeometry)geometryWithSources:(NSArray *)sources elements:(NSArray *)elements
{
  return (SCNGeometry *)objc_msgSend(a1, "geometryWithSources:elements:sourceChannels:", sources, elements, 0);
}

- (void)_setupGeometrySources
{
  __C3DScene *v3;
  uint64_t v4;
  NSMutableArray *v5;
  uint64_t Mesh;
  uint64_t v7;
  char v8;
  char v9;
  id v10;
  CFArrayRef v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;

  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  v5 = self->_sources;
  self->_sources = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  Mesh = C3DGeometryGetMesh((uint64_t)self->_geometry);
  if (Mesh)
  {
    v7 = Mesh;
    v15 = -1;
    v8 = C3DMeshUsesSameChannelForAllSources(Mesh, &v15);
    if (v15)
      v9 = 0;
    else
      v9 = v8;
    if ((v9 & 1) != 0)
      v10 = 0;
    else
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = C3DMeshCopyAllSources(v7, 0);
    v12 = -[__CFArray count](v11, "count");
    if (v12)
    {
      v13 = v12;
      for (i = 0; i != v13; ++i)
      {
        -[NSMutableArray addObject:](self->_sources, "addObject:", +[SCNGeometrySource geometrySourceWithMeshSourceRef:](SCNGeometrySource, "geometrySourceWithMeshSourceRef:", -[__CFArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", i)));
        if ((v9 & 1) == 0)
          objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", C3DMeshGetChannelForSourceAtIndex(v7, i)));
      }
    }

  }
  else
  {
    v10 = 0;
  }

  self->_sourceChannels = (NSArray *)objc_msgSend(v10, "copy");
  if (v4)
    C3DSceneUnlock(v4);
}

- (void)_setupGeometryElements
{
  __C3DScene *v3;
  uint64_t v4;
  uint64_t Mesh;
  uint64_t v6;
  NSMutableArray *v7;
  const __CFArray *ElementsCount;
  const __CFArray *v9;
  CFIndex i;

  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  Mesh = C3DGeometryGetMesh((uint64_t)self->_geometry);
  if (Mesh)
  {
    v6 = Mesh;
    v7 = self->_elements;
    self->_elements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    ElementsCount = C3DMeshGetElementsCount(v6);
    if ((uint64_t)ElementsCount >= 1)
    {
      v9 = ElementsCount;
      for (i = 0; (const __CFArray *)i != v9; ++i)
        -[NSMutableArray addObject:](self->_elements, "addObject:", +[SCNGeometryElement geometryElementWithMeshElementRef:](SCNGeometryElement, "geometryElementWithMeshElementRef:", C3DMeshGetElementAtIndex(v6, i, 0)));
    }
  }
  if (v4)
    C3DSceneUnlock(v4);
}

- (NSArray)geometrySources
{
  NSArray *result;

  result = &self->_sources->super;
  if (!result)
  {
    -[SCNGeometry _setupGeometrySources](self, "_setupGeometrySources");
    return &self->_sources->super;
  }
  return result;
}

- (NSArray)geometrySourceChannels
{
  return self->_sourceChannels;
}

- (NSArray)geometrySourcesForSemantic:(SCNGeometrySourceSemantic)semantic
{
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = -[SCNGeometry geometrySources](self, "geometrySources");
  v5 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v10, "semantic"), "isEqualToString:", semantic))
          -[NSArray addObject:](v5, "addObject:", v10);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  if (!-[NSArray count](v5, "count"))
  {
    if (C3DWasLinkedBeforeMajorOSYear2015())
      return 0;
    else
      return (NSArray *)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

- (id)geometrySourceForSemantic:(id)a3
{
  NSArray *v5;
  id result;

  NSLog(CFSTR("geometrySourceForSemantic is deprecated - use geometrySourcesForSemantic instead"), a2);
  v5 = -[SCNGeometry geometrySourcesForSemantic:](self, "geometrySourcesForSemantic:", a3);
  result = -[NSArray count](v5, "count");
  if (result)
    return -[NSArray objectAtIndex:](v5, "objectAtIndex:", 0);
  return result;
}

- (NSArray)geometryElements
{
  NSArray *result;

  result = &self->_elements->super;
  if (!result)
  {
    -[SCNGeometry _setupGeometryElements](self, "_setupGeometryElements");
    return &self->_elements->super;
  }
  return result;
}

- (NSInteger)geometryElementCount
{
  return -[NSArray count](-[SCNGeometry geometryElements](self, "geometryElements"), "count");
}

- (SCNGeometryElement)geometryElementAtIndex:(NSInteger)elementIndex
{
  NSArray *v4;

  v4 = -[SCNGeometry geometryElements](self, "geometryElements");
  if (-[NSArray count](v4, "count") <= elementIndex)
    return 0;
  else
    return (SCNGeometryElement *)-[NSArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", elementIndex);
}

- (BOOL)_hasFixedBoundingBoxExtrema
{
  return self->_fixedBoundingBoxExtrema != 0;
}

- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4
{
  SCNVector3 *fixedBoundingBoxExtrema;
  uint64_t v8;
  SCNVector3 *v9;
  uint64_t v10;
  char v11;
  __C3DScene *v12;
  uint64_t v13;
  float v14;
  float v15;
  uint64_t v17;
  float v18;
  uint64_t v19;
  float v20;

  fixedBoundingBoxExtrema = self->_fixedBoundingBoxExtrema;
  if (fixedBoundingBoxExtrema && (*((_BYTE *)self + 16) & 1) == 0)
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
  v12 = -[SCNGeometry sceneRef](self, "sceneRef");
  v13 = (uint64_t)v12;
  if (v12)
    C3DSceneLock((uint64_t)v12);
  if (!-[SCNGeometry geometryRef](self, "geometryRef"))
  {
    v11 = 0;
    if (!v13)
      return v11;
    goto LABEL_16;
  }
  v20 = 0.0;
  v19 = 0;
  v18 = 0.0;
  v17 = 0;
  v11 = C3DGetBoundingBox(-[SCNGeometry geometryRef](self, "geometryRef"), 1, (uint64_t)&v19, (uint64_t)&v17);
  if (a3)
  {
    v14 = v20;
    *(_QWORD *)&a3->x = v19;
    a3->z = v14;
  }
  if (a4)
  {
    v15 = v18;
    *(_QWORD *)&a4->x = v17;
    a4->z = v15;
  }
  if (v13)
LABEL_16:
    C3DSceneUnlock(v13);
  return v11;
}

- (void)setBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4
{
  SCNVector3 *fixedBoundingBoxExtrema;
  _BOOL4 v8;
  __int128 v9;
  SCNVector3 *v10;
  NSObject *v11;
  __C3DScene *v12;
  _QWORD *v13;
  uint64_t v14;
  SCNVector3 *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  __int128 v21;
  __int128 v22;
  SCNGeometry *v23;
  _QWORD v24[5];

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v11 = scn_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SCNGeometry setBoundingBoxMin:max:].cold.1();
  }
  else
  {
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
      v14 = *(_QWORD *)&a3->x;
      v10->z = a3->z;
      *(_QWORD *)&v10->x = v14;
      v15 = self->_fixedBoundingBoxExtrema;
      v16 = *(_QWORD *)&a4->x;
      v15[1].z = a4->z;
      *(_QWORD *)&v15[1].x = v16;
      *(_QWORD *)&v9 = *(_QWORD *)&a3->x;
      DWORD2(v9) = LODWORD(a3->z);
      v18 = v9;
      DWORD2(v9) = LODWORD(a4->z);
      v12 = -[SCNGeometry sceneRef](self, "sceneRef", *(_QWORD *)&a4->x, *((_QWORD *)&v9 + 1), v18);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __37__SCNGeometry_setBoundingBoxMin_max___block_invoke_2;
      v20[3] = &unk_1EA5A23A8;
      v21 = v19;
      v22 = v17;
      v23 = self;
      v13 = v20;
    }
    else
    {
      if (!fixedBoundingBoxExtrema)
        return;
      free(fixedBoundingBoxExtrema);
      self->_fixedBoundingBoxExtrema = 0;
      v12 = -[SCNGeometry sceneRef](self, "sceneRef");
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __37__SCNGeometry_setBoundingBoxMin_max___block_invoke;
      v24[3] = &unk_1EA59E4A0;
      v24[4] = self;
      v13 = v24;
    }
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v12, self, v13);
  }
}

void __37__SCNGeometry_setBoundingBoxMin_max___block_invoke(uint64_t a1)
{
  C3DGeometrySetBoundingBox(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 0);
}

__n128 __37__SCNGeometry_setBoundingBoxMin_max___block_invoke_2(float32x4_t *a1)
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
  C3DGeometrySetBoundingBox(*(_QWORD *)(a1[4].i64[0] + 8), v7);
  return result;
}

- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4
{
  __C3DScene *v7;
  uint64_t v8;
  __C3DGeometry *v9;
  float v10;
  BOOL v11;
  uint64_t v13;
  uint64_t v14;

  v7 = -[SCNGeometry sceneRef](self, "sceneRef");
  v8 = (uint64_t)v7;
  if (v7)
    C3DSceneLock((uint64_t)v7);
  v9 = -[SCNGeometry geometryRef](self, "geometryRef");
  v13 = 0;
  v14 = 0;
  if (!v9 || !C3DGetBoundingSphere(v9, 1, (uint64_t)&v13))
  {
    v11 = 0;
    if (!v8)
      return v11;
LABEL_12:
    C3DSceneUnlock(v8);
    return v11;
  }
  if (a3)
  {
    v10 = *(float *)&v14;
    *(_QWORD *)&a3->x = v13;
    a3->z = v10;
  }
  if (a4)
    *a4 = *((float *)&v14 + 1);
  v11 = 1;
  if (v8)
    goto LABEL_12;
  return v11;
}

- (BOOL)simdGetBoundingSphereCenter:(SCNGeometry *)self radius:(SEL)a2
{
  _OWORD *v2;
  _DWORD *v3;
  _DWORD *v4;
  _OWORD *v5;
  __C3DScene *v7;
  uint64_t v8;
  __C3DGeometry *v9;
  BOOL v10;
  __int128 v12;

  v4 = v3;
  v5 = v2;
  v7 = -[SCNGeometry sceneRef](self, "sceneRef");
  v8 = (uint64_t)v7;
  if (v7)
    C3DSceneLock((uint64_t)v7);
  v9 = -[SCNGeometry geometryRef](self, "geometryRef");
  v12 = 0uLL;
  if (!v9 || !C3DGetBoundingSphere(v9, 1, (uint64_t)&v12))
  {
    v10 = 0;
    if (!v8)
      return v10;
LABEL_12:
    C3DSceneUnlock(v8);
    return v10;
  }
  if (v5)
    *v5 = v12;
  if (v4)
    *v4 = HIDWORD(v12);
  v10 = 1;
  if (v8)
    goto LABEL_12;
  return v10;
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
  v2 = -[SCNGeometry getBoundingSphereCenter:radius:](self, "getBoundingSphereCenter:radius:", &v9, &v8);
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
  v2 = -[SCNGeometry getBoundingBoxMin:max:](self, "getBoundingBoxMin:max:", &v13, &v11);
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

uint64_t __30__SCNGeometry__setAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", a3, a2);
}

uint64_t __35__SCNGeometry__setupObjCModelFrom___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forUndefinedKey:", a3, a2);
}

- (id)mutableCopy
{
  const void *MutableCopy;
  void *v4;
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  void *v6;

  MutableCopy = (const void *)C3DGeometryCreateMutableCopy(-[SCNGeometry geometryRef](self, "geometryRef"));
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGeometryRef:", MutableCopy);
  objc_msgSend(v4, "_setupObjCModelFrom:", self);
  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v6 = (void *)-[NSMutableDictionary mutableCopy](self->_valuesForUndefinedKeys, "mutableCopy");
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  objc_msgSend(v4, "_setAttributes:", v6);

  if (MutableCopy)
    CFRelease(MutableCopy);
  return v4;
}

- (id)interleavedCopy
{
  const void *InterleavedCopy;
  void *v4;
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  void *v6;

  InterleavedCopy = (const void *)C3DGeometryCreateInterleavedCopy(-[SCNGeometry geometryRef](self, "geometryRef"));
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGeometryRef:", InterleavedCopy);
  objc_msgSend(v4, "_setupObjCModelFrom:", self);
  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v6 = (void *)-[NSMutableDictionary mutableCopy](self->_valuesForUndefinedKeys, "mutableCopy");
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  objc_msgSend(v4, "_setAttributes:", v6);

  if (InterleavedCopy)
    CFRelease(InterleavedCopy);
  return v4;
}

- (id)_renderableCopy
{
  const void *RenderableCopy;
  void *v4;
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  void *v6;

  RenderableCopy = (const void *)C3DGeometryCreateRenderableCopy(-[SCNGeometry geometryRef](self, "geometryRef"));
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGeometryRef:", RenderableCopy);
  objc_msgSend(v4, "_setupObjCModelFrom:", self);
  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v6 = (void *)-[NSMutableDictionary mutableCopy](self->_valuesForUndefinedKeys, "mutableCopy");
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  objc_msgSend(v4, "_setAttributes:", v6);

  if (RenderableCopy)
    CFRelease(RenderableCopy);
  return v4;
}

- (id)scene
{
  id result;

  result = -[SCNGeometry sceneRef](self, "sceneRef");
  if (result)
    return C3DEntityGetObjCWrapper((id *)result);
  return result;
}

- (id)keyForNodeAttributes
{
  return CFSTR("kMeshKey");
}

- (void)_expand
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: leaking materials array", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (id)_materialWithName:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[SCNGeometry materials](self, "materials", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "name"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (SCNMaterial)materialWithName:(NSString *)name
{
  SCNMaterial *result;

  result = -[SCNGeometry _materialWithName:](self, "_materialWithName:", name);
  if ((*((_BYTE *)self + 16) & 1) != 0)
    return (SCNMaterial *)-[SCNMaterial presentationMaterial](result, "presentationMaterial");
  return result;
}

- (unint64_t)countOfMaterials
{
  NSMutableArray *materials;

  materials = self->_materials;
  if (!materials)
  {
    -[SCNGeometry _expand](self, "_expand");
    materials = self->_materials;
  }
  return -[NSMutableArray count](materials, "count");
}

- (id)objectInMaterialsAtIndex:(unint64_t)a3
{
  NSMutableArray *materials;

  materials = self->_materials;
  if (!materials)
  {
    -[SCNGeometry _expand](self, "_expand");
    materials = self->_materials;
  }
  return (id)-[NSMutableArray objectAtIndex:](materials, "objectAtIndex:", a3);
}

- (void)removeObjectFromMaterialsAtIndex:(unint64_t)a3
{
  NSMutableArray *materials;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __C3DScene *v14;
  _QWORD v15[6];

  materials = self->_materials;
  if (!materials)
  {
    -[SCNGeometry _expand](self, "_expand");
    materials = self->_materials;
  }
  if (-[NSMutableArray count](materials, "count") <= a3)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[SCNGeometry removeObjectFromMaterialsAtIndex:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  -[NSMutableArray removeObjectAtIndex:](self->_materials, "removeObjectAtIndex:", a3);
  v14 = -[SCNGeometry sceneRef](self, "sceneRef");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__SCNGeometry_removeObjectFromMaterialsAtIndex___block_invoke;
  v15[3] = &unk_1EA59E450;
  v15[4] = self;
  v15[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v14, self, v15);
}

void __48__SCNGeometry_removeObjectFromMaterialsAtIndex___block_invoke(uint64_t a1)
{
  C3DGeometryRemoveMaterialAtIndex(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40));
}

- (void)replaceObjectInMaterialsAtIndex:(unint64_t)a3 withObject:(id)a4
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
      -[SCNGeometry insertObject:inMaterialsAtIndex:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  if (!self->_materials)
    -[SCNGeometry _expand](self, "_expand");
  v15 = -[SCNGeometry sceneRef](self, "sceneRef");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__SCNGeometry_replaceObjectInMaterialsAtIndex_withObject___block_invoke;
  v16[3] = &unk_1EA59E2B0;
  v16[4] = self;
  v16[5] = a4;
  v16[6] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v15, self, v16);
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_materials, "replaceObjectAtIndex:withObject:", a3, a4);
}

void __58__SCNGeometry_replaceObjectInMaterialsAtIndex_withObject___block_invoke(uint64_t a1)
{
  C3DGeometryReplaceMaterialAtIndex(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (void *)objc_msgSend(*(id *)(a1 + 40), "materialRef"), *(_QWORD *)(a1 + 48));
}

- (void)setFirstMaterial:(SCNMaterial *)firstMaterial
{
  if (firstMaterial)
  {
    if (objc_msgSend(-[SCNGeometry mutableMaterials](self, "mutableMaterials"), "count"))
      -[SCNGeometry replaceObjectInMaterialsAtIndex:withObject:](self, "replaceObjectInMaterialsAtIndex:withObject:", 0, firstMaterial);
    else
      -[SCNGeometry insertMaterial:atIndex:](self, "insertMaterial:atIndex:", firstMaterial, 0);
  }
  else
  {
    -[SCNGeometry removeMaterialAtIndex:](self, "removeMaterialAtIndex:");
  }
}

- (void)removeMaterial:(id)a3
{
  NSUInteger v4;

  v4 = -[NSArray indexOfObject:](-[SCNGeometry materials](self, "materials"), "indexOfObject:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[SCNGeometry removeObjectFromMaterialsAtIndex:](self, "removeObjectFromMaterialsAtIndex:", v4);
}

- (void)replaceMaterial:(id)a3 with:(id)a4
{
  NSUInteger v6;

  v6 = -[NSArray indexOfObject:](-[SCNGeometry materials](self, "materials"), "indexOfObject:", a3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    -[SCNGeometry replaceObjectInMaterialsAtIndex:withObject:](self, "replaceObjectInMaterialsAtIndex:withObject:", v6, a4);
}

- (int64_t)primitiveType
{
  __C3DScene *v3;
  uint64_t v4;
  uint64_t Mesh;
  int64_t Type;
  const void *ElementAtIndex;

  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  Mesh = C3DGeometryGetMesh((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  Type = Mesh;
  if (Mesh)
  {
    if ((uint64_t)C3DMeshGetElementsCount(Mesh) < 1)
    {
      Type = 0;
      if (!v4)
        return Type;
      goto LABEL_7;
    }
    ElementAtIndex = C3DMeshGetElementAtIndex(Type, 0, 0);
    Type = (int)C3DMeshElementGetType((uint64_t)ElementAtIndex);
  }
  if (v4)
LABEL_7:
    C3DSceneUnlock(v4);
  return Type;
}

- (void)setPrimitiveType:(int64_t)a3
{
  char v3;
  __C3DScene *v5;
  uint64_t v6;
  uint64_t Mesh;
  uint64_t v8;
  const __CFArray *ElementsCount;
  const __CFArray *v10;
  CFIndex i;
  const void *ElementAtIndex;

  v3 = a3;
  v5 = -[SCNGeometry sceneRef](self, "sceneRef");
  v6 = (uint64_t)v5;
  if (v5)
    C3DSceneLock((uint64_t)v5);
  Mesh = C3DGeometryGetMesh((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
  if (Mesh)
  {
    v8 = Mesh;
    if ((uint64_t)C3DMeshGetElementsCount(Mesh) >= 1)
    {
      ElementsCount = C3DMeshGetElementsCount(v8);
      if ((uint64_t)ElementsCount >= 1)
      {
        v10 = ElementsCount;
        for (i = 0; (const __CFArray *)i != v10; ++i)
        {
          ElementAtIndex = C3DMeshGetElementAtIndex(v8, i, 0);
          C3DMeshElementSetType((uint64_t)ElementAtIndex, v3);
        }
      }
    }
  }
  if (v6)
    C3DSceneUnlock(v6);
}

- (BOOL)parseSpecialKey:(id)a3 withPath:(id)a4 intoDestination:(id *)a5 remainingPath:(id *)a6
{
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  NSArray *v16;
  id v17;
  unint64_t v18;
  void *v19;

  v10 = objc_msgSend(a3, "hasPrefix:", CFSTR("materials["));
  if (v10)
  {
    v11 = (void *)objc_msgSend(a4, "substringWithRange:", 10, objc_msgSend(a4, "length") - 10);
    v12 = objc_msgSend(v11, "rangeOfString:", CFSTR("]"));
    if (v13 == 1
      && (v14 = v12,
          v15 = objc_msgSend((id)objc_msgSend(v11, "substringWithRange:", 0, v12), "intValue"),
          v16 = -[SCNGeometry materials](self, "materials"),
          -[NSArray count](v16, "count") > v15))
    {
      v17 = -[NSArray objectAtIndex:](v16, "objectAtIndex:", v15);
      if (a6)
      {
        v18 = v14 + 12;
        if (v18 >= objc_msgSend(a4, "length"))
          v19 = 0;
        else
          v19 = (void *)objc_msgSend(a4, "substringWithRange:", v18, objc_msgSend(a4, "length") - v18);
        *a6 = v19;
      }
      *a5 = v17;
      LOBYTE(v10) = 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int TargetedBaseType;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  __C3DScene *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "length"))
    return 0;
  v23 = 0;
  v24 = 0;
  SCNKitSplitKVCPath(a3, &v24, &v23);
  v21 = 0;
  v22 = 0;
  if (-[SCNGeometry parseSpecialKey:withPath:intoDestination:remainingPath:](self, "parseSpecialKey:withPath:intoDestination:remainingPath:", v24, a3, &v21, &v22))
  {
    v7 = (void *)objc_msgSend(v21, "copyAnimationChannelForKeyPath:animation:", v22, a4);
    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count") + 1);
      objc_msgSend(v8, "addObject:", v24);
      objc_msgSend(v8, "addObjectsFromArray:", v7);

      return v8;
    }
    return 0;
  }
  v21 = (id)-[SCNGeometry valueForKey:](self, "valueForKey:", v24);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (v9 = (void *)objc_msgSend(v21, "copyAnimationChannelForKeyPath:animation:", v23, a4)) != 0)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count") + 1);
    objc_msgSend(v8, "addObject:", v24);
    objc_msgSend(v8, "addObjectsFromArray:", v9);

  }
  else
  {
    if (self->_shadableHelper)
    {
      os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
      v10 = -[NSMutableDictionary objectForKey:](self->_valuesForUndefinedKeys, "objectForKey:", a3);
      os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
      if (!v10)
      {
        TargetedBaseType = SCNAnimationGetTargetedBaseType(a4);
        if (TargetedBaseType)
        {
          v17 = SCNDefaultValueWithBaseType(TargetedBaseType, v13, v14, v15, v16);
          v18 = -[SCNGeometry sceneRef](self, "sceneRef");
          v19 = (uint64_t)v18;
          if (v18)
          {
            C3DSceneLock((uint64_t)v18);
            +[SCNTransaction begin](SCNTransaction, "begin");
            +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
            -[SCNGeometry setValue:forUndefinedKey:](self, "setValue:forUndefinedKey:", v17, a3);
            +[SCNTransaction commitImmediate](SCNTransaction, "commitImmediate");
            C3DSceneUnlock(v19);
          }
          else
          {
            +[SCNTransaction begin](SCNTransaction, "begin");
            +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
            -[SCNGeometry setValue:forUndefinedKey:](self, "setValue:forUndefinedKey:", v17, a3);
            +[SCNTransaction commitImmediate](SCNTransaction, "commitImmediate");
          }
        }
        else
        {
          v20 = scn_default_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v26 = a3;
            _os_log_impl(&dword_1DCCB8000, v20, OS_LOG_TYPE_DEFAULT, "Warning: can't prepare shadable animation with path %@", buf, 0xCu);
          }
        }
      }
    }
    return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
  }
  return v8;
}

uint64_t __33__SCNGeometry_setLevelsOfDetail___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;

  v5 = objc_msgSend(a2, "thresholdMode");
  objc_msgSend((id)objc_msgSend(a2, "thresholdValue"), "doubleValue");
  v7 = v6;
  objc_msgSend((id)objc_msgSend(a3, "thresholdValue"), "doubleValue");
  v9 = v7 > v8;
  if (!v5)
    v9 = v7 < v8;
  if (v9)
    return -1;
  else
    return 1;
}

void __33__SCNGeometry_setLevelsOfDetail___block_invoke_2(uint64_t a1)
{
  const __CFArray *v2;
  void *v3;
  _QWORD v4[5];

  v2 = (const __CFArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__SCNGeometry_setLevelsOfDetail___block_invoke_3;
  v4[3] = &unk_1EA59E670;
  v4[4] = v2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);
  C3DGeometrySetLOD(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), v2);
}

uint64_t __33__SCNGeometry_setLevelsOfDetail___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(a2, "__CFObject"));
}

void __39__SCNGeometry_set_subdivisionSettings___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  if (v2)
    C3DGeometryOsdSetSubdivisionSettings(v2, *(_DWORD *)(a1 + 40));
}

void __35__SCNGeometry_setSubdivisionLevel___block_invoke(uint64_t a1)
{
  __C3DGeometry *v2;

  v2 = (__C3DGeometry *)objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  if (v2)
    C3DGeometryOsdSetSubdivisionLevel(v2, *(unsigned __int8 *)(a1 + 40));
}

void __43__SCNGeometry_setWantsAdaptiveSubdivision___block_invoke(uint64_t a1)
{
  __C3DGeometry *v2;

  v2 = (__C3DGeometry *)objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  if (v2)
    C3DGeometryOsdSetWantsAdaptiveSubdivision(v2, *(unsigned __int8 *)(a1 + 40));
}

- (SCNGeometryElement)edgeCreasesElement
{
  return self->_edgeCreasesElement;
}

void __37__SCNGeometry_setEdgeCreasesElement___block_invoke(uint64_t a1)
{
  __C3DGeometry *v2;

  v2 = (__C3DGeometry *)objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  if (v2)
    C3DGeometryOsdSetEdgeCreasesElement(v2, (__C3DMeshElement *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "meshElement"));
}

- (SCNGeometrySource)edgeCreasesSource
{
  return self->_edgeCreasesSource;
}

void __36__SCNGeometry_setEdgeCreasesSource___block_invoke(uint64_t a1)
{
  __C3DGeometry *v2;

  v2 = (__C3DGeometry *)objc_msgSend(*(id *)(a1 + 32), "geometryRef");
  if (v2)
    C3DGeometryOsdSetEdgeCreasesSource(v2, (__C3DMeshSource *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "meshSource"));
}

- (__C3DMaterial)materialRefCreateIfNeeded
{
  __C3DGeometry *v2;
  __C3DMaterial *OverrideMaterial;
  const __CFArray *MaterialAtIndex;
  __C3DMaterial *Copy;

  v2 = -[SCNGeometry geometryRef](self, "geometryRef");
  OverrideMaterial = (__C3DMaterial *)C3DGeometryGetOverrideMaterial((uint64_t)v2);
  if (!OverrideMaterial)
  {
    if ((uint64_t)C3DGeometryGetMaterialsCount((uint64_t)v2) >= 1
      && (MaterialAtIndex = C3DGeometryGetMaterialAtIndex((uint64_t)v2, 0)) != 0)
    {
      Copy = (__C3DMaterial *)C3DMaterialCreateCopy((uint64_t)MaterialAtIndex);
    }
    else
    {
      Copy = (__C3DMaterial *)C3DMaterialCreate();
    }
    OverrideMaterial = Copy;
    C3DGeometrySetOverrideMaterial(v2, Copy);
  }
  return OverrideMaterial;
}

- (__C3DMaterial)materialRef
{
  return (__C3DMaterial *)C3DGeometryGetOverrideMaterial((uint64_t)-[SCNGeometry geometryRef](self, "geometryRef"));
}

- (void)_unifyNormals
{
  __C3DGeometry *v2;
  uint64_t Mesh;

  v2 = -[SCNGeometry geometryRef](self, "geometryRef");
  if (v2)
  {
    Mesh = C3DGeometryGetMesh((uint64_t)v2);
    C3DMeshUnifyNormals(Mesh, Mesh, 1, 0);
  }
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  uint64_t v7;

  if (objc_msgSend(a4, "hasPrefix:", CFSTR("materials[")))
  {
    v7 = 0;
    if (-[SCNGeometry parseSpecialKey:withPath:intoDestination:remainingPath:](self, "parseSpecialKey:withPath:intoDestination:remainingPath:", a4, a4, &v7, 0)&& v7)
    {
      if (a3)
        -[SCNGeometry replaceMaterial:with:](self, "replaceMaterial:with:");
      else
        -[SCNGeometry removeMaterial:](self, "removeMaterial:");
    }
  }
  else
  {
    -[SCNGeometry _shadableSetValue:forUndefinedKey:](self, "_shadableSetValue:forUndefinedKey:", a3, a4);
  }
}

- (id)valueForUndefinedKey:(id)a3
{
  void *v5;
  __C3DScene *v6;
  uint64_t v7;
  const __CFDictionary *ValueForKey;
  float32x2_t *Bytes;
  int Type;
  double v11;
  double v12;
  double v13;
  double v14;
  const __CFString *v15;
  const __CFString *v16;
  float32x2_t *TargetAddress;
  int BaseType;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7 = (uint64_t)v6;
    if (v6)
      C3DSceneLock((uint64_t)v6);
    ValueForKey = C3DEntityGetValueForKey((uint64_t)self->_geometry, a3);
    v5 = ValueForKey;
    if (ValueForKey)
    {
      Bytes = (float32x2_t *)C3DValueGetBytes((uint64_t)ValueForKey);
      Type = C3DValueGetType((uint64_t)v5);
      v5 = (void *)SCNNSValueFromTypedBytes(Bytes, Type, v11, v12, v13, v14);
    }
    if (v7)
      C3DSceneUnlock(v7);
    if (v5)
      return v5;
    v15 = C3DCFTypeCopyModelInfoAtPath((float32x4_t *)self->_geometry, (CFStringRef)a3, 0);
    if (v15)
    {
      v16 = v15;
      if (C3DModelTargetGetTargetAddress((uint64_t)v15))
      {
        TargetAddress = (float32x2_t *)C3DModelTargetGetTargetAddress((uint64_t)v16);
        BaseType = C3DModelTargetGetBaseType((uint64_t)v16);
        v23 = (void *)SCNNSValueFromTypedBytes(TargetAddress, BaseType, v19, v20, v21, v22);
        CFRelease(v16);
        return v23;
      }
      CFRelease(v16);
    }
  }
  v27 = 0;
  v28 = 0;
  v26 = 0;
  SCNKitSplitKVCPath(a3, &v27, &v26);
  if (-[SCNGeometry parseSpecialKey:withPath:intoDestination:remainingPath:](self, "parseSpecialKey:withPath:intoDestination:remainingPath:", v27, a3, &v28, 0))
  {
    return v28;
  }
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v25 = (id)-[NSMutableDictionary objectForKey:](self->_valuesForUndefinedKeys, "objectForKey:", a3);
  os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
  return v25;
}

- (void)_shadableSetValue:(id)a3 forUndefinedKey:(id)a4
{
  id v5;
  id v7;
  char isKindOfClass;
  NSMutableDictionary *valuesForUndefinedKeys;
  NSObject *v10;
  void *v11;
  id v12;
  char v13;
  _UNKNOWN **v14;
  uint64_t v15;
  const void *v16;
  uint64_t v17;
  int Type;
  void *v19;
  uint64_t v20;
  _QWORD v21[8];
  _QWORD v22[7];
  _QWORD v23[2];

  if ((*((_BYTE *)self + 16) & 1) == 0)
  {
    v5 = a4;
    if (objc_msgSend(a4, "hasPrefix:", CFSTR("shaderModifiers.")))
      v5 = (id)objc_msgSend(v5, "substringFromIndex:", 16);
    os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
    v7 = (id)-[NSMutableDictionary objectForKey:](self->_valuesForUndefinedKeys, "objectForKey:", v5);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
    {
      os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
      -[SCNGeometry willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("customMaterialProperties"));
      -[SCNGeometry willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("customMaterialAttributes"));
      os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
    }
    valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
    if (a3)
    {
      if (!valuesForUndefinedKeys)
      {
        valuesForUndefinedKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        self->_valuesForUndefinedKeys = valuesForUndefinedKeys;
      }
      -[NSMutableDictionary setObject:forKey:](valuesForUndefinedKeys, "setObject:forKey:", a3, v5);
    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](valuesForUndefinedKeys, "removeObjectForKey:", v5);
    }
    os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
    if ((isKindOfClass & 1) == 0)
    {
      -[SCNGeometry didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("customMaterialProperties"));
      -[SCNGeometry didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("customMaterialAttributes"));
    }
    v11 = -[SCNGeometry __CFObject](self, "__CFObject");
    objc_opt_class();
    v12 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "unlinkCustomPropertyWithParent:", self);
      v12 = 0;
    }

    objc_opt_class();
    v13 = objc_opt_isKindOfClass();
    v14 = &off_1EA593000;
    v15 = MEMORY[0x1E0C809B0];
    if ((v13 & 1) != 0)
    {
      objc_msgSend(a3, "linkCustomPropertyWithParent:andCustomName:", self, v5);
      v16 = (const void *)objc_msgSend(a3, "effectSlot");
      if (v16)
        v17 = (uint64_t)CFRetain(v16);
      else
        v17 = 0;
      v12 = 0;
      goto LABEL_25;
    }
    v17 = SCNCopyValueFromObjCProperty(self, v5);
    if (v17)
    {
LABEL_21:
      if (!v7)
      {
        Type = C3DValueGetType(v17);
        v22[0] = v15;
        v22[1] = 3221225472;
        v22[2] = __49__SCNGeometry__shadableSetValue_forUndefinedKey___block_invoke;
        v22[3] = &unk_1EA5A15E8;
        v22[4] = v5;
        v22[5] = v11;
        v22[6] = C3DValueCreateDefault(Type);
        v14 = &off_1EA593000;
        +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", -[SCNGeometry sceneRef](self, "sceneRef"), self, v22);
      }
      goto LABEL_25;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (uint64_t)SCNCopyValueFromObjCValue(a3);
      if (v17)
        goto LABEL_21;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23[0] = C3DColor4FromRGBCFColor(a3, 0);
        v23[1] = v20;
        v17 = C3DValueCreate(10, 1);
        C3DValueInitFrom(v17, v23);
        if (v17)
          goto LABEL_21;
      }
      else
      {
        v17 = 0;
      }
    }
LABEL_25:
    v19 = v14[323];
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __49__SCNGeometry__shadableSetValue_forUndefinedKey___block_invoke_2;
    v21[3] = &unk_1EA5A2180;
    v21[6] = v17;
    v21[7] = v11;
    v21[4] = v5;
    v21[5] = a3;
    objc_msgSend(v19, "postCommandWithContext:object:keyPath:applyBlock:", -[SCNGeometry sceneRef](self, "sceneRef"), self, v12, v21);
    return;
  }
  v10 = scn_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[SCNGeometry _shadableSetValue:forUndefinedKey:].cold.1();
}

void __49__SCNGeometry__shadableSetValue_forUndefinedKey___block_invoke(uint64_t a1)
{
  const void *v2;

  C3DEntitySetValueForKey(*(_QWORD *)(a1 + 40), *(void **)(a1 + 32), *(__int16 **)(a1 + 48));
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
}

void __49__SCNGeometry__shadableSetValue_forUndefinedKey___block_invoke_2(uint64_t a1)
{
  __int16 *v2;
  uint64_t v3;
  void *v4;
  __int16 *v5;

  v2 = *(__int16 **)(a1 + 48);
  if (v2)
  {
    C3DEntitySetValueForKey(*(_QWORD *)(a1 + 56), *(void **)(a1 + 32), v2);
    CFRelease(*(CFTypeRef *)(a1 + 48));
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 56);
    v4 = *(void **)(a1 + 32);
    v5 = *(__int16 **)(a1 + 40);
    if (v5)
      C3DEntitySetValueForKey(v3, v4, v5);
    else
      C3DEntityResetValueForKey(v3, v4);
  }
}

- (id)customMaterialPropertyNames
{
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  void *v4;
  NSMutableDictionary *valuesForUndefinedKeys;
  _QWORD v7[5];

  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_valuesForUndefinedKeys, "count"));
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__SCNGeometry_customMaterialPropertyNames__block_invoke;
  v7[3] = &unk_1EA59F6F0;
  v7[4] = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](valuesForUndefinedKeys, "enumerateKeysAndObjectsUsingBlock:", v7);
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v4;
}

uint64_t __42__SCNGeometry_customMaterialPropertyNames__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return result;
}

- (id)customMaterialProperties
{
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  void *v4;
  NSMutableDictionary *valuesForUndefinedKeys;
  _QWORD v7[5];

  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_valuesForUndefinedKeys, "count"));
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__SCNGeometry_customMaterialProperties__block_invoke;
  v7[3] = &unk_1EA59F6F0;
  v7[4] = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](valuesForUndefinedKeys, "enumerateKeysAndObjectsUsingBlock:", v7);
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v4;
}

uint64_t __39__SCNGeometry_customMaterialProperties__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a3);
  return result;
}

- (id)customMaterialAttributeNames
{
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  void *v4;
  NSMutableDictionary *valuesForUndefinedKeys;
  _QWORD v7[5];

  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_valuesForUndefinedKeys, "count"));
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__SCNGeometry_customMaterialAttributeNames__block_invoke;
  v7[3] = &unk_1EA59F6F0;
  v7[4] = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](valuesForUndefinedKeys, "enumerateKeysAndObjectsUsingBlock:", v7);
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v4;
}

uint64_t __43__SCNGeometry_customMaterialAttributeNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = _isValidCustomPropertyType(a3);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return result;
}

- (id)customMaterialAttributes
{
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  void *v4;
  NSMutableDictionary *valuesForUndefinedKeys;
  _QWORD v7[5];

  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_valuesForUndefinedKeys, "count"));
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__SCNGeometry_customMaterialAttributes__block_invoke;
  v7[3] = &unk_1EA59F6F0;
  v7[4] = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](valuesForUndefinedKeys, "enumerateKeysAndObjectsUsingBlock:", v7);
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v4;
}

uint64_t __39__SCNGeometry_customMaterialAttributes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = _isValidCustomPropertyType(a3);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a3);
  return result;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  return SCNObject_resolveInstanceMethod((objc_class *)a1, a3);
}

- (void)_setupShadableHelperIfNeeded
{
  if (!self->_shadableHelper)
    self->_shadableHelper = -[SCNShadableHelper initWithOwner:]([SCNShadableHelper alloc], "initWithOwner:", self);
}

- (SCNProgram)program
{
  return -[SCNShadableHelper program](self->_shadableHelper, "program");
}

- (void)setShaderModifiers:(id)a3
{
  NSObject *v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNGeometry setShaderModifiers:].cold.1();
  }
  else
  {
    if (a3)
      -[SCNGeometry _setupShadableHelperIfNeeded](self, "_setupShadableHelperIfNeeded");
    -[SCNShadableHelper setShaderModifiers:](self->_shadableHelper, "setShaderModifiers:", a3);
  }
}

- (void)setMinimumLanguageVersion:(id)a3
{
  NSObject *v5;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SCNGeometry setMinimumLanguageVersion:].cold.1();
  }
  else
  {
    if (a3)
      -[SCNGeometry _setupShadableHelperIfNeeded](self, "_setupShadableHelperIfNeeded");
    -[SCNShadableHelper setMinimumLanguageVersion:](self->_shadableHelper, "setMinimumLanguageVersion:", a3);
  }
}

- (NSNumber)minimumLanguageVersion
{
  return -[SCNShadableHelper minimumLanguageVersion](self->_shadableHelper, "minimumLanguageVersion");
}

- (id)shaderModifiersArgumentsNames
{
  return -[SCNShadableHelper shaderModifiersArgumentsNames](self->_shadableHelper, "shaderModifiersArgumentsNames");
}

- (void)handleBindingOfSymbol:(id)a3 usingBlock:(id)a4
{
  -[SCNGeometry _setupShadableHelperIfNeeded](self, "_setupShadableHelperIfNeeded");
  -[SCNShadableHelper handleBindingOfSymbol:usingBlock:](self->_shadableHelper, "handleBindingOfSymbol:usingBlock:", a3, a4);
}

- (void)handleUnbindingOfSymbol:(id)a3 usingBlock:(id)a4
{
  -[SCNGeometry _setupShadableHelperIfNeeded](self, "_setupShadableHelperIfNeeded");
  -[SCNShadableHelper handleUnbindingOfSymbol:usingBlock:](self->_shadableHelper, "handleUnbindingOfSymbol:usingBlock:", a3, a4);
}

- (void)setProgram:(id)a3
{
  SCNShadableHelper *shadableHelper;
  id v6;
  NSObject *v7;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SCNGeometry setProgram:].cold.1();
  }
  else
  {
    if (a3)
    {
      -[SCNGeometry _setupShadableHelperIfNeeded](self, "_setupShadableHelperIfNeeded");
      shadableHelper = self->_shadableHelper;
      v6 = a3;
    }
    else
    {
      shadableHelper = self->_shadableHelper;
      v6 = 0;
    }
    -[SCNShadableHelper setProgram:](shadableHelper, "setProgram:", v6);
  }
}

- (__C3DAnimationManager)animationManager
{
  __C3DAnimationManager *result;

  result = -[SCNGeometry sceneRef](self, "sceneRef");
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
    v9 = -[SCNGeometry __CFObject](self, "__CFObject");
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[7];

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
    v8 = -[SCNGeometry sceneRef](self, "sceneRef");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __41__SCNGeometry_addAnimationPlayer_forKey___block_invoke;
    v16[3] = &unk_1EA59F718;
    v16[4] = a3;
    v16[5] = self;
    v16[6] = v5;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, self, v16);
  }
  else
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SCNTechnique addAnimationPlayer:forKey:].cold.1((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);
  }
}

void __41__SCNGeometry_addAnimationPlayer_forKey___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "prepareWithTarget:implicitDuration:", a1[5]);
  if ((SCNAddAnimation(a1[4], a1[5], a1[6]) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1[5] + 14);
    objc_msgSend(*((id *)a1[5] + 8), "removeObjectForKey:", a1[6]);
    os_unfair_lock_unlock((os_unfair_lock_t)a1[5] + 14);
  }
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  id v5;
  SCNAnimation *v6;
  SCNAnimationPlayer *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

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
    -[SCNGeometry addAnimationPlayer:forKey:](self, "addAnimationPlayer:forKey:", v7, v5);
    -[SCNAnimationPlayer play](v7, "play");
  }
  else
  {
    v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCNTechnique addAnimation:forKey:].cold.1((uint64_t)self, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (void)addAnimation:(id)a3
{
  -[SCNGeometry addAnimation:forKey:](self, "addAnimation:forKey:", a3, 0);
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
  v4 = -[SCNGeometry sceneRef](self, "sceneRef");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SCNGeometry_removeAllAnimations__block_invoke;
  v5[3] = &unk_1EA59E4A0;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v4, self, v5);
}

void __34__SCNGeometry_removeAllAnimations__block_invoke(uint64_t a1)
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
  v6 = -[SCNGeometry sceneRef](self, "sceneRef");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SCNGeometry_removeAllAnimationsWithBlendOutDuration___block_invoke;
  v7[3] = &unk_1EA59E450;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
}

void __55__SCNGeometry_removeAllAnimationsWithBlendOutDuration___block_invoke(uint64_t a1)
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
    v6 = -[SCNGeometry sceneRef](self, "sceneRef");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__SCNGeometry_removeAnimationForKey___block_invoke;
    v7[3] = &unk_1EA59F740;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
  }
}

void __37__SCNGeometry_removeAnimationForKey___block_invoke(uint64_t a1)
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
    v8 = -[SCNGeometry sceneRef](self, "sceneRef");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__SCNGeometry_removeAnimationForKey_blendOutDuration___block_invoke;
    v9[3] = &unk_1EA59E2B0;
    v9[4] = self;
    v9[5] = a3;
    *(double *)&v9[6] = a4;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v8, self, v9);
  }
}

void __54__SCNGeometry_removeAnimationForKey_blendOutDuration___block_invoke(uint64_t a1)
{
  SCNFadeAndRemoveAnimation(*(void **)(a1 + 32), *(void **)(a1 + 40), *(double *)(a1 + 48));
}

- (id)animationForKey:(id)a3
{
  id v3;

  v3 = -[SCNGeometry _scnAnimationForKey:](self, "_scnAnimationForKey:", a3);
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
  v9 = -[SCNGeometry __CFObject](self, "__CFObject");
  if (v9)
  {
    v10 = v9;
    v11 = -[SCNGeometry animationManager](self, "animationManager");
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

  v5 = -[SCNGeometry sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__SCNGeometry_pauseAnimationForKey___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __36__SCNGeometry_pauseAnimationForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pauseAnimation:forKey:pausedByNode:", 1, *(_QWORD *)(a1 + 40), 0);
}

- (void)resumeAnimationForKey:(id)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  v5 = -[SCNGeometry sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__SCNGeometry_resumeAnimationForKey___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

uint64_t __37__SCNGeometry_resumeAnimationForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pauseAnimation:forKey:pausedByNode:", 0, *(_QWORD *)(a1 + 40), 0);
}

- (void)setSpeed:(double)a3 forAnimationKey:(id)a4
{
  uint64_t v7;
  __C3DScene *v8;
  _QWORD v9[7];

  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("animations.%@.speed"), a4);
  v8 = -[SCNGeometry sceneRef](self, "sceneRef");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__SCNGeometry_setSpeed_forAnimationKey___block_invoke;
  v9[3] = &unk_1EA59E2B0;
  v9[4] = self;
  v9[5] = a4;
  *(double *)&v9[6] = a3;
  +[SCNTransaction postCommandWithContext:object:keyPath:applyBlock:](SCNTransaction, "postCommandWithContext:object:keyPath:applyBlock:", v8, self, v7, v9);
}

float __40__SCNGeometry_setSpeed_forAnimationKey___block_invoke(uint64_t a1)
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

  v5 = -[SCNGeometry sceneRef](self, "sceneRef");
  v6 = (uint64_t)v5;
  if (v5)
    C3DSceneLock((uint64_t)v5);
  v7 = -[SCNGeometry __CFObject](self, "__CFObject");
  if (v7)
  {
    v8 = v7;
    v9 = -[SCNGeometry animationManager](self, "animationManager");
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

    v15 = -[SCNGeometry sceneRef](self, "sceneRef");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __63__SCNGeometry_bindAnimatablePath_toObject_withKeyPath_options___block_invoke;
    v16[3] = &unk_1EA59F768;
    v16[4] = self;
    v16[5] = a4;
    v16[6] = a3;
    v16[7] = a5;
    v16[8] = a6;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v15, self, v16);
  }
}

void __63__SCNGeometry_bindAnimatablePath_toObject_withKeyPath_options___block_invoke(uint64_t a1)
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
  v5 = -[SCNGeometry sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__SCNGeometry_unbindAnimatablePath___block_invoke;
  v6[3] = &unk_1EA59F740;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
}

void __36__SCNGeometry_unbindAnimatablePath___block_invoke(uint64_t a1)
{
  C3DEntityRemoveBindingWithKeyPath((float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject"), *(const __CFString **)(a1 + 40));
}

- (void)removeAllBindings
{
  __C3DScene *v3;
  _QWORD v4[5];

  self->_bindings = 0;
  v3 = -[SCNGeometry sceneRef](self, "sceneRef");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__SCNGeometry_removeAllBindings__block_invoke;
  v4[3] = &unk_1EA59E4A0;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v3, self, v4);
}

void __32__SCNGeometry_removeAllBindings__block_invoke(uint64_t a1)
{
  C3DEntityRemoveAllBindings((CFTypeRef *)objc_msgSend(*(id *)(a1 + 32), "__CFObject"));
}

- (void)_customEncodingOfSCNGeometry:(id)a3
{
  double v3;
  double v4;
  double v5;
  SCNVector3 *fixedBoundingBoxExtrema;
  SCNVector3 *v9;
  double v10;
  double v11;
  double v12;
  uint64_t TypeID;
  NSArray *v14;
  NSArray *v15;
  NSArray *v16;
  NSArray *v17;
  NSArray *v18;
  NSArray *v19;
  NSArray *sourceChannels;
  NSMutableDictionary *valuesForUndefinedKeys;

  if (!self->_materials)
    -[SCNGeometry _expand](self, "_expand");
  fixedBoundingBoxExtrema = self->_fixedBoundingBoxExtrema;
  if (fixedBoundingBoxExtrema)
  {
    *(float *)&v3 = fixedBoundingBoxExtrema->x;
    *(float *)&v4 = fixedBoundingBoxExtrema->y;
    *(float *)&v5 = fixedBoundingBoxExtrema->z;
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSCNVector3:", v3, v4, v5), CFSTR("fixedBoundingBoxExtrema[0]"));
    v9 = self->_fixedBoundingBoxExtrema;
    *(float *)&v10 = v9[1].x;
    *(float *)&v11 = v9[1].y;
    *(float *)&v12 = v9[1].z;
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSCNVector3:", v10, v11, v12), CFSTR("fixedBoundingBoxExtrema[1]"));
  }
  TypeID = C3DGeometryGetTypeID();
  if (TypeID == CFGetTypeID(self->_geometry))
  {
    v14 = -[SCNGeometry geometrySourcesForSemantic:](self, "geometrySourcesForSemantic:", CFSTR("kGeometrySourceSemanticVertex"));
    if (v14)
      objc_msgSend(a3, "encodeObject:forKey:", v14, CFSTR("kGeometrySourceSemanticVertex"));
    v15 = -[SCNGeometry geometrySourcesForSemantic:](self, "geometrySourcesForSemantic:", CFSTR("kGeometrySourceSemanticNormal"));
    if (v15)
      objc_msgSend(a3, "encodeObject:forKey:", v15, CFSTR("kGeometrySourceSemanticNormal"));
    v16 = -[SCNGeometry geometrySourcesForSemantic:](self, "geometrySourcesForSemantic:", CFSTR("kGeometrySourceSemanticColor"));
    if (v16)
      objc_msgSend(a3, "encodeObject:forKey:", v16, CFSTR("kGeometrySourceSemanticColor"));
    v17 = -[SCNGeometry geometrySourcesForSemantic:](self, "geometrySourcesForSemantic:", CFSTR("kGeometrySourceSemanticTexcoord"));
    if (v17)
      objc_msgSend(a3, "encodeObject:forKey:", v17, CFSTR("kGeometrySourceSemanticTexcoord"));
    v18 = -[SCNGeometry geometrySourcesForSemantic:](self, "geometrySourcesForSemantic:", CFSTR("kGeometrySourceSemanticTangent"));
    if (v18)
      objc_msgSend(a3, "encodeObject:forKey:", v18, CFSTR("kGeometrySourceSemanticTangent"));
    v19 = -[SCNGeometry geometryElements](self, "geometryElements");
    if (-[NSArray count](v19, "count"))
      objc_msgSend(a3, "encodeObject:forKey:", v19, CFSTR("elements"));
    sourceChannels = self->_sourceChannels;
    if (sourceChannels)
      objc_msgSend(a3, "encodeObject:forKey:", sourceChannels, CFSTR("sourceChannels"));
  }
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  if (valuesForUndefinedKeys)
    objc_msgSend(a3, "encodeObject:forKey:", valuesForUndefinedKeys, CFSTR("valuesForUndefinedKeys"));
  os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
}

- (void)_customDecodingOfSCNGeometry:(id)a3
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t TypeID;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFAllocator *v20;
  CFIndex v21;
  const CFArrayCallBacks *v22;
  __CFArray *Mutable;
  __CFArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  size_t v33;
  char *v34;
  uint64_t *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _DWORD v47[3];
  _DWORD v48[3];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("fixedBoundingBoxExtrema[0]")))
  {
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fixedBoundingBoxExtrema[0]")), "SCNVector3Value");
    v47[0] = v5;
    v47[1] = v6;
    v47[2] = v7;
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fixedBoundingBoxExtrema[1]")), "SCNVector3Value");
    v48[0] = v8;
    v48[1] = v9;
    v48[2] = v10;
    -[SCNGeometry setBoundingBoxMin:max:](self, "setBoundingBoxMin:max:", v47, v48);
  }
  TypeID = C3DGeometryGetTypeID();
  if (TypeID == CFGetTypeID(self->_geometry))
  {
    v12 = (void *)objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("elements"));
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_opt_class();
    v15 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", v14, CFSTR("kGeometrySourceSemanticVertex"));
    if (v15)
      objc_msgSend(v13, "addObjectsFromArray:", v15);
    v16 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", v14, CFSTR("kGeometrySourceSemanticNormal"));
    if (v16)
      objc_msgSend(v13, "addObjectsFromArray:", v16);
    v17 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", v14, CFSTR("kGeometrySourceSemanticColor"));
    if (v17)
      objc_msgSend(v13, "addObjectsFromArray:", v17);
    v18 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", v14, CFSTR("kGeometrySourceSemanticTexcoord"));
    if (v18)
      objc_msgSend(v13, "addObjectsFromArray:", v18);
    v19 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", v14, CFSTR("kGeometrySourceSemanticTangent"));
    if (v19)
      objc_msgSend(v13, "addObjectsFromArray:", v19);
    v20 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v21 = objc_msgSend(v13, "count");
    v22 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
    Mutable = CFArrayCreateMutable(v20, v21, MEMORY[0x1E0C9B378]);
    v24 = CFArrayCreateMutable(v20, objc_msgSend(v12, "count"), v22);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v25 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v42;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v42 != v27)
            objc_enumerationMutation(v13);
          CFArrayAppendValue(Mutable, (const void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v28++), "meshSource"));
        }
        while (v26 != v28);
        v26 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v26);
    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v29 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v38;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v38 != v31)
            objc_enumerationMutation(v12);
          CFArrayAppendValue(v24, (const void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v32++), "meshElement"));
        }
        while (v30 != v32);
        v30 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v30);
    }
    self->_sourceChannels = (NSArray *)(id)objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("sourceChannels"));
    v33 = objc_msgSend(v13, "count");
    v34 = (char *)&v37 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
    __buildSourceChannels(self->_sourceChannels, v33, v12, v34);
    v35 = (uint64_t *)C3DMeshCreateWithMeshSourcesAndMeshElements(Mutable, v24, (uint64_t)v34);
    C3DGeometrySetMesh((uint64_t)self->_geometry, v35);
    CFRelease(Mutable);
    CFRelease(v24);
    CFRelease(v35);
  }
  v36 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", SCNUserInfoClasses(), CFSTR("valuesForUndefinedKeys"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SCNGeometry _setAttributes:](self, "_setAttributes:", (id)objc_msgSend(v36, "mutableCopy"));
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *materials;
  NSArray *levelsOfDetail;
  SCNGeometrySource *edgeCreasesSource;
  SCNGeometryElement *edgeCreasesElement;
  SCNShadableHelper *shadableHelper;
  NSString *name;

  if ((*((_BYTE *)self + 16) & 1) != 0)
    -[SCNGeometry _syncObjCModel](self, "_syncObjCModel");
  -[SCNGeometry _customEncodingOfSCNGeometry:](self, "_customEncodingOfSCNGeometry:", a3);
  materials = self->_materials;
  if (materials)
    objc_msgSend(a3, "encodeObject:forKey:", materials, CFSTR("materials"));
  levelsOfDetail = self->_levelsOfDetail;
  if (levelsOfDetail)
    objc_msgSend(a3, "encodeObject:forKey:", levelsOfDetail, CFSTR("levelsOfDetail"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_subdivisionLevel, CFSTR("subdivisionLevel"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_subdivisionIsAdaptive, CFSTR("wantsAdaptiveSubdivision"));
  edgeCreasesSource = self->_edgeCreasesSource;
  if (edgeCreasesSource)
    objc_msgSend(a3, "encodeObject:forKey:", edgeCreasesSource, CFSTR("edgeCreasesSource"));
  edgeCreasesElement = self->_edgeCreasesElement;
  if (edgeCreasesElement)
    objc_msgSend(a3, "encodeObject:forKey:", edgeCreasesElement, CFSTR("edgeCreasesElement"));
  shadableHelper = self->_shadableHelper;
  if (shadableHelper)
    objc_msgSend(a3, "encodeObject:forKey:", shadableHelper, CFSTR("shadableHelper"));
  objc_msgSend(a3, "encodeBytes:length:forKey:", &self->_subdivisionSettings, 4, CFSTR("subdivisionSettings"));
  name = self->_name;
  if (name)
    objc_msgSend(a3, "encodeObject:forKey:", name, CFSTR("name"));
  SCNEncodeEntity(a3, self);
  SCNEncodeAnimations(a3, self);
  objc_msgSend(a3, "encodeObject:forKey:", self->_tessellator, CFSTR("tessellator"));
}

- (SCNGeometry)initWithCoder:(id)a3
{
  char *v4;
  _BOOL8 v5;
  uint64_t v6;
  id v7;
  _DWORD *v8;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SCNGeometry;
  v4 = -[SCNGeometry init](&v11, sel_init);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    v6 = objc_msgSend(v4, "__createCFObject");
    *((_QWORD *)v4 + 1) = v6;
    if (v6)
      C3DEntitySetObjCWrapper(v6, v4);
    objc_msgSend(v4, "_syncObjCModel");
    *((_DWORD *)v4 + 38) = 0;
    objc_msgSend(v4, "_customDecodingOfSCNGeometry:", a3);
    objc_msgSend(v4, "setMaterials:", objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:containingNestedContainersForKey:", objc_opt_class(), CFSTR("materials")));
    objc_msgSend(v4, "setLevelsOfDetail:", objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("levelsOfDetail")));
    objc_msgSend(v4, "setSubdivisionLevel:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("subdivisionLevel")));
    objc_msgSend(v4, "setWantsAdaptiveSubdivision:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("wantsAdaptiveSubdivision")));
    objc_msgSend(v4, "setEdgeCreasesSource:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("edgeCreasesSource")));
    objc_msgSend(v4, "setEdgeCreasesElement:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("edgeCreasesElement")));
    v7 = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shadableHelper"));
    *((_QWORD *)v4 + 15) = v7;
    if ((char *)objc_msgSend(v7, "owner") != v4)
    {

      *((_QWORD *)v4 + 15) = 0;
    }
    v10 = 0;
    v8 = (_DWORD *)objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("subdivisionSettings"), &v10);
    if (v10 == 4)
      *(_DWORD *)(v4 + 97) = *v8;
    objc_msgSend(v4, "setName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name")));
    *((_DWORD *)v4 + 14) = 0;
    SCNDecodeEntity(a3, v4);
    SCNDecodeAnimations(a3, v4);
    objc_msgSend(v4, "setTessellator:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tessellator")));
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return (SCNGeometry *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_geometryByUnifyingNormalsWithCreaseThreshold:(double)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  SCNGeometry *v12;
  void *v13;
  double v14;
  SCNGeometry *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t Mesh;
  uint64_t *Copy;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = -[SCNGeometry geometryElements](self, "geometryElements");
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v9), "primitiveType") == 4)
        {
          v15 = (SCNGeometry *)-[SCNGeometry copy](self, "copy");
          v16 = -[SCNGeometry geometryRef](v15, "geometryRef");
          if (v16)
          {
            v17 = v16;
            Mesh = C3DGeometryGetMesh(v16);
            Copy = (uint64_t *)C3DMeshCreateCopy(Mesh);
            C3DMeshUnifyNormals((uint64_t)Copy, (uint64_t)Copy, 1, 1);
            C3DGeometrySetMesh(v17, Copy);
            if (Copy)
              CFRelease(Copy);
          }
          return v15;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = -[SCNGeometry geometrySources](self, "geometrySources");
  v11 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v10, "count") - 1);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __71__SCNGeometry_SCNUtils___geometryByUnifyingNormalsWithCreaseThreshold___block_invoke;
  v21[3] = &unk_1EA59E670;
  v21[4] = v11;
  -[NSArray enumerateObjectsUsingBlock:](v10, "enumerateObjectsUsingBlock:", v21);
  v12 = +[SCNGeometry geometryWithSources:elements:](SCNGeometry, "geometryWithSources:elements:", v11, -[SCNGeometry geometryElements](self, "geometryElements"));
  v13 = (void *)objc_msgSend(MEMORY[0x1E0CC77B0], "meshWithSCNGeometry:", v12);
  *(float *)&v14 = a3;
  objc_msgSend(v13, "addNormalsWithAttributeNamed:creaseThreshold:", CFSTR("normals"), v14);
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  v15 = +[SCNGeometry geometryWithMDLMesh:](SCNGeometry, "geometryWithMDLMesh:", v13);
  -[SCNGeometry _setupObjCModelFrom:](v15, "_setupObjCModelFrom:", self);
  -[SCNGeometry setName:](v15, "setName:", -[SCNGeometry name](self, "name"));
  +[SCNTransaction commitImmediate](SCNTransaction, "commitImmediate");
  return v15;
}

uint64_t __71__SCNGeometry_SCNUtils___geometryByUnifyingNormalsWithCreaseThreshold___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a2, "semantic"), "isEqualToString:", CFSTR("kGeometrySourceSemanticNormal"));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return result;
}

- (id)_geometryByAddingSourcesOfSkinner:(id)a3
{
  uint64_t v4;
  __C3DGeometry *v6;
  uint64_t Mesh;
  uint64_t *v8;
  uint64_t Copy;
  SCNGeometry *v10;

  v4 = objc_msgSend(a3, "skinnerRef");
  if (C3DSkinnerHasOnlyOneJoint(v4))
    return -[SCNGeometry copy](self, "copy");
  v6 = -[SCNGeometry geometryRef](self, "geometryRef");
  Mesh = C3DGeometryGetMesh((uint64_t)v6);
  v8 = (uint64_t *)C3DMeshCreate();
  __C3DSkinnerPrepareSkinnedMesh(v4, Mesh, (uint64_t)v8, v6);
  Copy = C3DGeometryCreateCopy(v6);
  C3DGeometrySetMesh(Copy, v8);
  CFRelease(v8);
  v10 = +[SCNGeometry geometryWithGeometryRef:](SCNGeometry, "geometryWithGeometryRef:", Copy);
  -[SCNGeometry setName:](v10, "setName:", -[SCNGeometry name](self, "name"));
  -[SCNGeometry setMaterials:](v10, "setMaterials:", -[SCNGeometry materials](self, "materials"));
  return v10;
}

- (id)_geometryByRemovingSkinnerSources
{
  __C3DGeometry *v3;
  uint64_t Mesh;
  uint64_t *Copy;
  uint64_t v6;
  SCNGeometry *v7;

  v3 = -[SCNGeometry geometryRef](self, "geometryRef");
  Mesh = C3DGeometryGetMesh((uint64_t)v3);
  Copy = (uint64_t *)C3DMeshCreateCopy(Mesh);
  C3DMeshRemoveSourcesWithSemantic((uint64_t)Copy, 5);
  C3DMeshRemoveSourcesWithSemantic((uint64_t)Copy, 6);
  v6 = C3DGeometryCreateCopy(v3);
  C3DGeometrySetMesh(v6, Copy);
  v7 = +[SCNGeometry geometryWithGeometryRef:](SCNGeometry, "geometryWithGeometryRef:", v6);
  -[SCNGeometry setName:](v7, "setName:", -[SCNGeometry name](self, "name"));
  -[SCNGeometry setMaterials:](v7, "setMaterials:", -[SCNGeometry materials](self, "materials"));
  return v7;
}

- (void)_discardOriginalTopology
{
  __C3DMesh *RenderingMesh;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  RenderingMesh = C3DGeometryGetRenderingMesh(-[SCNGeometry geometryRef](self, "geometryRef"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = -[SCNGeometry geometrySources](self, "geometrySources");
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v8), "meshSource");
        if (v9)
          C3DEntitySetObjCWrapper(v9, 0);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = -[SCNGeometry geometryElements](self, "geometryElements", 0);
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "meshElement");
        if (v15)
          C3DEntitySetObjCWrapper(v15, 0);
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }
  C3DMeshBuildRenderableData((uint64_t)RenderingMesh, 0);
  -[SCNGeometry _releaseCachedSourcesAndElements](self, "_releaseCachedSourcesAndElements");
}

- (id)_geometryByWeldingVerticesWithThreshold:(double)a3 normalThreshold:(double)a4
{
  SCNGeometry *v6;
  id v7;
  id v8;
  size_t v9;
  char *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t i;
  float32x4_t v14;
  uint64_t v15;
  double v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float32x4_t v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  uint64_t v38;
  NSArray *v39;
  NSArray *v40;
  unint64_t j;
  unint64_t v42;
  unint64_t v43;
  uint64_t k;
  void *v45;
  uint64_t v46;
  size_t v47;
  size_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  id v54;
  unint64_t v55;
  uint64_t v56;
  size_t v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  unint64_t v63;
  uint64_t m;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  NSObject *v73;
  uint64_t v74;
  NSObject *v75;
  uint64_t v76;
  NSObject *v77;
  SCNGeometry *v79;
  char *v80;
  NSArray *obj;
  NSArray *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  float32x4_t v86;
  void *v87;
  uint64_t v88;
  float32x4_t v89;
  uint64_t v90;
  size_t v91;
  uint64_t v92;
  char *v93;
  float __dst;
  char *__dsta;
  size_t __dstb;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint8_t v108[4];
  uint64_t v109;
  uint8_t v110[4];
  uint64_t v111;
  uint8_t v112[4];
  uint64_t v113;
  _BYTE v114[128];
  uint8_t v115[4];
  uint64_t v116;
  uint8_t v117[4];
  uint64_t v118;
  uint8_t v119[4];
  uint64_t v120;
  uint8_t v121[4];
  uint64_t v122;
  _BYTE v123[128];
  uint64_t v124;

  v6 = self;
  v124 = *MEMORY[0x1E0C80C00];
  v7 = -[NSArray firstObject](-[SCNGeometry geometrySourcesForSemantic:](self, "geometrySourcesForSemantic:"), "firstObject");
  v8 = -[NSArray firstObject](-[SCNGeometry geometrySourcesForSemantic:](v6, "geometrySourcesForSemantic:", CFSTR("kGeometrySourceSemanticNormal")), "firstObject");
  -[SCNGeometry geometrySourcesForSemantic:](v6, "geometrySourcesForSemantic:", CFSTR("kGeometrySourceSemanticTexcoord"));
  v9 = objc_msgSend(v7, "vectorCount");
  v10 = (char *)malloc_type_malloc(8 * v9, 0x100004000313F17uLL);
  v11 = malloc_type_malloc(8 * v9, 0x100004000313F17uLL);
  v12 = v11;
  if (v9)
  {
    for (i = 0; i != v9; ++i)
    {
      *(_QWORD *)&v10[8 * i] = i;
      v11[i] = i;
    }
  }
  v105 = objc_msgSend((id)objc_msgSend(v7, "data"), "bytes");
  v106 = objc_msgSend(v7, "dataOffset");
  v107 = objc_msgSend(v7, "dataStride");
  qsort_r(v10, v9, 8uLL, &v105, (int (__cdecl *)(void *, const void *, const void *))vertexSort);
  if (v9)
  {
    v79 = v6;
    v80 = v10;
    v15 = 0;
    v92 = 0;
    v16 = a4 + a4;
    v17 = v10 + 8;
    while (1)
    {
      v18 = *(_QWORD *)&v10[8 * v15];
      if (v12[v18] == v18)
      {
        v19 = v105 + v106 + v107 * v18;
        v14.i64[0] = *(_QWORD *)v19;
        LODWORD(__dst) = *(_QWORD *)v19;
        v14.i32[2] = *(_DWORD *)(v19 + 8);
        v89 = v14;
        v20 = objc_msgSend((id)objc_msgSend(v8, "data"), "bytes");
        v21 = objc_msgSend(v8, "dataOffset");
        v22 = objc_msgSend(v8, "dataStride");
        v23.i64[0] = *(_QWORD *)(v20 + v22 * v18 + v21);
        v23.i32[2] = *(_DWORD *)(v20 + v21 + 8 + v22 * v18);
        v86 = v23;
        v24 = objc_msgSend(v8, "vectorCount");
        v25 = v15 + 1;
        if (v15 + 1 < v24)
        {
          v26 = 0;
          v27 = v105;
          v28 = ~v15 + v24;
          v29 = &v17[8 * v15];
          v30 = v92;
          do
          {
            v32 = *(_QWORD *)v29;
            v29 += 8;
            v31 = v32;
            if (v12[v32] == v32)
            {
              v33 = v106 + v107 * v31;
              v14.i32[0] = *(_DWORD *)(v27 + v33);
              if (vabds_f32(__dst, v14.f32[0]) > a3)
                break;
              v34 = v33 + v27;
              v14.i32[1] = *(_DWORD *)(v34 + 4);
              v14.i32[2] = *(_DWORD *)(v34 + 8);
              v35 = vsubq_f32(v89, v14);
              v36 = vmulq_f32(v35, v35);
              v14 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v36, 2), vaddq_f32(v36, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 1)));
              if (sqrtf(v14.f32[0]) <= a3)
              {
                v14.i64[0] = *(_QWORD *)(v20 + v31 * v22 + v21);
                v14.i32[2] = *(_DWORD *)(v20 + v21 + 8 + v31 * v22);
                v37 = vmulq_f32(v86, v14);
                v14 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v37, 2), vaddq_f32(v37, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v37.f32, 1)));
                if (v16 >= (float)(1.0 - v14.f32[0]))
                {
                  v12[v31] = v18;
                  ++v26;
                }
              }
            }
            --v28;
          }
          while (v28);
          v10 = v80;
          goto LABEL_19;
        }
        v26 = 0;
        v10 = v80;
      }
      else
      {
        v26 = 0;
        v25 = v15 + 1;
      }
      v30 = v92;
LABEL_19:
      v92 = v30 + v26;
      v15 = v25;
      if (v25 == v9)
      {
        v38 = v30 + v26;
        if (v92)
        {
          v39 = -[SCNGeometry geometrySources](v79, "geometrySources");
          v40 = -[SCNGeometry geometryElements](v79, "geometryElements");
          obj = v39;
          v87 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v39, "count"));
          v82 = v40;
          v85 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v40, "count"));
          for (j = 0; j != v9; ++j)
          {
            v42 = v12[j];
            do
            {
              v43 = v42;
              v42 = v12[v42];
            }
            while (v43 > v42);
            v12[j] = v43;
            if (v43 > j && v12[v43] == v43)
            {
              v12[v43] = j;
              v12[j] = j;
            }
          }
          v103 = 0u;
          v104 = 0u;
          v101 = 0u;
          v102 = 0u;
          v90 = -[NSArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v101, v123, 16);
          if (v90)
          {
            v83 = *(_QWORD *)v102;
            do
            {
              for (k = 0; k != v90; ++k)
              {
                if (*(_QWORD *)v102 != v83)
                  objc_enumerationMutation(obj);
                v45 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * k);
                v46 = objc_msgSend(v45, "bytesPerComponent");
                v47 = objc_msgSend(v45, "componentsPerVector") * v46;
                v48 = (objc_msgSend(v45, "vectorCount") - v38) * v47;
                __dsta = (char *)malloc_type_malloc(v48, 0x75D27222uLL);
                v49 = objc_msgSend((id)objc_msgSend(v45, "data"), "bytes");
                objc_msgSend(v45, "vectorCount");
                v50 = objc_msgSend(v45, "dataStride");
                v51 = 0;
                v52 = (char *)(v49 + objc_msgSend(v45, "dataOffset"));
                v53 = __dsta;
                do
                {
                  if (v51 == v12[v51])
                  {
                    memcpy(v53, v52, v47);
                    v53 += v47;
                  }
                  v52 += v50;
                  ++v51;
                }
                while (v9 != v51);
                v38 = v92;
                v54 = +[SCNGeometrySource _geometrySourceWithData:semantic:vectorCount:componentType:componentCount:dataOffset:dataStride:](SCNGeometrySource, "_geometrySourceWithData:semantic:vectorCount:componentType:componentCount:dataOffset:dataStride:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", __dsta, v48, 1), objc_msgSend(v45, "semantic"), objc_msgSend(v45, "vectorCount") - v92, objc_msgSend(v45, "_componentType"), objc_msgSend(v45, "componentsPerVector"), 0, 0);
                objc_msgSend((id)objc_msgSend(v45, "semantic"), "isEqualToString:", CFSTR("kGeometrySourceSemanticVertex"));
                objc_msgSend(v87, "addObject:", v54);
              }
              v90 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v101, v123, 16);
            }
            while (v90);
          }
          v55 = 0;
          v56 = 0;
          v57 = v9 - v38;
          do
          {
            if (v12[v55] > v55)
            {
              v58 = scn_default_log();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
                -[SCNGeometry(SCNUtils) _geometryByWeldingVerticesWithThreshold:normalThreshold:].cold.8(v121, &v122, v58);
            }
            if (v55 != v12[v55])
            {
              ++v56;
              if (!v55)
              {
                v59 = scn_default_log();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
                  -[SCNGeometry(SCNUtils) _geometryByWeldingVerticesWithThreshold:normalThreshold:].cold.7(v119, &v120, v59);
              }
            }
            if (v12[v55] > v55)
            {
              v60 = scn_default_log();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
                -[SCNGeometry(SCNUtils) _geometryByWeldingVerticesWithThreshold:normalThreshold:].cold.6(v117, &v118, v60);
            }
            *(_QWORD *)&v80[8 * v55] = v55 - v56;
            v12[v55] = *(_QWORD *)&v80[8 * v12[v55]];
            if (*(_QWORD *)&v80[8 * v55] >= v57)
            {
              v61 = scn_default_log();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
                -[SCNGeometry(SCNUtils) _geometryByWeldingVerticesWithThreshold:normalThreshold:].cold.5(v115, &v116, v61);
            }
            ++v55;
          }
          while (v9 != v55);
          if (v56 != v92)
          {
            v62 = scn_default_log();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
              -[SCNGeometry(SCNUtils) _geometryByWeldingVerticesWithThreshold:normalThreshold:].cold.4(v62);
          }
          v99 = 0u;
          v100 = 0u;
          v97 = 0u;
          v98 = 0u;
          v88 = -[NSArray countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
          if (v88)
          {
            v84 = *(_QWORD *)v98;
            v63 = v9 - v92;
            do
            {
              for (m = 0; m != v88; ++m)
              {
                if (*(_QWORD *)v98 != v84)
                  objc_enumerationMutation(v82);
                v65 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * m);
                v66 = objc_msgSend(v65, "bytesPerIndex");
                v67 = objc_msgSend((id)objc_msgSend(v65, "data"), "bytes");
                v68 = objc_msgSend(v65, "indexCount");
                if (objc_msgSend(v65, "primitiveType") == 4)
                  v69 = objc_msgSend(v65, "primitiveCount") * v66;
                else
                  v69 = 0;
                __dstb = v69;
                v91 = v69 + v68 * v66;
                v93 = (char *)malloc_type_malloc(v91, 0x72ECF872uLL);
                if (v68)
                {
                  v70 = 0;
                  v71 = &v93[__dstb];
                  do
                  {
                    switch(v66)
                    {
                      case 4:
                        v76 = v12[*(unsigned int *)(v67 + 4 * v70)];
                        *(_DWORD *)&v71[4 * v70] = v76;
                        if (v63 <= v76)
                        {
                          v77 = scn_default_log();
                          if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
                            -[SCNGeometry(SCNUtils) _geometryByWeldingVerticesWithThreshold:normalThreshold:].cold.3(v108, &v109, v77);
                        }
                        break;
                      case 2:
                        v74 = v12[*(unsigned __int16 *)(v67 + 2 * v70)];
                        *(_WORD *)&v71[2 * v70] = v74;
                        if (v63 <= (unsigned __int16)v74)
                        {
                          v75 = scn_default_log();
                          if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
                            -[SCNGeometry(SCNUtils) _geometryByWeldingVerticesWithThreshold:normalThreshold:].cold.2(v110, &v111, v75);
                        }
                        break;
                      case 1:
                        v72 = v12[*(unsigned __int8 *)(v67 + v70)];
                        v71[v70] = v72;
                        if (v63 <= v72)
                        {
                          v73 = scn_default_log();
                          if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
                            -[SCNGeometry(SCNUtils) _geometryByWeldingVerticesWithThreshold:normalThreshold:].cold.1(v112, &v113, v73);
                        }
                        break;
                    }
                    ++v70;
                  }
                  while (v68 != v70);
                }
                if (__dstb)
                  memcpy(v93, (const void *)objc_msgSend((id)objc_msgSend(v65, "data"), "bytes"), __dstb);
                objc_msgSend(v85, "addObject:", +[SCNGeometryElement geometryElementWithData:primitiveType:primitiveCount:bytesPerIndex:](SCNGeometryElement, "geometryElementWithData:primitiveType:primitiveCount:bytesPerIndex:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v93, v91, 1), objc_msgSend(v65, "primitiveType"), objc_msgSend(v65, "primitiveCount"), v66));
              }
              v88 = -[NSArray countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
            }
            while (v88);
          }
          v6 = +[SCNGeometry geometryWithSources:elements:](SCNGeometry, "geometryWithSources:elements:", v87, v85);
          -[SCNGeometry setName:](v6, "setName:", -[SCNGeometry name](v79, "name"));
          -[SCNGeometry setMaterials:](v6, "setMaterials:", -[SCNGeometry materials](v79, "materials"));
          v10 = v80;
        }
        else
        {
          v6 = v79;
        }
        break;
      }
    }
  }
  free(v10);
  free(v12);
  return v6;
}

- (id)debugQuickLookObject
{
  return -[SCNNode debugQuickLookObject](+[SCNNode nodeWithGeometry:](SCNNode, "nodeWithGeometry:", self), "debugQuickLookObject");
}

- (id)debugQuickLookData
{
  return UIImagePNGRepresentation((UIImage *)-[SCNGeometry debugQuickLookObject](self, "debugQuickLookObject"));
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

- (void)setBoundingBoxMin:max:.cold.1()
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

- (void)insertObject:(uint64_t)a3 inMaterialsAtIndex:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)removeObjectFromMaterialsAtIndex:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. removeObjectFromMaterialsAtIndex: index out of bounds", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setEdgeCreasesElement:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: Cannot set edge creases element because its primitive type is not SCNGeometryPrimitiveTypeLine", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)setEdgeCreasesSource:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: Cannot set edge creases source because its semantic is not SCNGeometrySourceSemanticEdgeCrease", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)_shadableSetValue:forUndefinedKey:.cold.1()
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

- (void)setShaderModifiers:.cold.1()
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

- (void)copyShaderModifiersAndLanguageVersionFrom:.cold.1()
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

- (void)setMinimumLanguageVersion:.cold.1()
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

- (void)setProgram:.cold.1()
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

- (void)_customEncodingOfSCNGeometry:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: Failed to archive geometry's custom attributes. %@ %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
