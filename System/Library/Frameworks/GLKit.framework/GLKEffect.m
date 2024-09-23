@implementation GLKEffect

+ (void)initialize
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  BOOL v5;
  __int128 v6;
  __int128 v7;

  +[GLKEffect initializeStaticMasks](GLKEffect, "initializeStaticMasks");
  __vshRootNode = objc_alloc_init(GLKShaderBlockNode);
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.GLKit")), "pathForResource:ofType:", CFSTR("vsh"), CFSTR("xml"));
  if (+[GLKEffect parseXMLFile:rootNode:](GLKEffect, "parseXMLFile:rootNode:", v2, __vshRootNode))
  {
    __fshRootNode = objc_alloc_init(GLKShaderBlockNode);
    v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.GLKit")), "pathForResource:ofType:", CFSTR("fsh"), CFSTR("xml"));
    if (+[GLKEffect parseXMLFile:rootNode:](GLKEffect, "parseXMLFile:rootNode:", v3, __fshRootNode))
    {
      __sharegroupDict = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, 0);
      __sharegroupQueue = (uint64_t)dispatch_queue_create("com.apple.GLKEffectsSharegroup", 0);
      v7 = xmmword_20DC81360;
      +[GLKShaderBlockNode setMasksWithRoot:treeRoot:mask:](GLKShaderBlockNode, "setMasksWithRoot:treeRoot:mask:", __vshRootNode, __vshRootNode, &v7, 1, 0);
      +[GLKShaderBlockNode setMasksWithRoot:treeRoot:mask:](GLKShaderBlockNode, "setMasksWithRoot:treeRoot:mask:", __fshRootNode, __fshRootNode, &v6);
      +[GLKEffect setStaticMasksWithVshRoot:fshRoot:](GLKEffect, "setStaticMasksWithVshRoot:fshRoot:", __vshRootNode, __fshRootNode);
      +[GLKEffectPropertyConstantColor setStaticMasksWithVshRoot:fshRoot:](GLKEffectPropertyConstantColor, "setStaticMasksWithVshRoot:fshRoot:", __vshRootNode, __fshRootNode);
      +[GLKEffectPropertyFog setStaticMasksWithVshRoot:fshRoot:](GLKEffectPropertyFog, "setStaticMasksWithVshRoot:fshRoot:", __vshRootNode, __fshRootNode);
      +[GLKEffectPropertyLight setStaticMasksWithVshRoot:fshRoot:](GLKEffectPropertyLight, "setStaticMasksWithVshRoot:fshRoot:", __vshRootNode, __fshRootNode);
      +[GLKEffectPropertyMaterial setStaticMasksWithVshRoot:fshRoot:](GLKEffectPropertyMaterial, "setStaticMasksWithVshRoot:fshRoot:", __vshRootNode, __fshRootNode);
      +[GLKEffectPropertyTexture setStaticMasksWithVshRoot:fshRoot:](GLKEffectPropertyTexture, "setStaticMasksWithVshRoot:fshRoot:", __vshRootNode, __fshRootNode);
      +[GLKEffectPropertyTransform setStaticMasksWithVshRoot:fshRoot:](GLKEffectPropertyTransform, "setStaticMasksWithVshRoot:fshRoot:", __vshRootNode, __fshRootNode);
      v4 = getenv("__GLK_PURGE_SHADING_HASH");
      v5 = v4 && !strcmp(v4, "1");
      __purgeShadingHash = v5;
    }
    else
    {

    }
  }
  else
  {

  }
}

- (GLKEffect)init
{
  GLKEffect *v2;
  GLKEffect *v3;
  id *v4;
  uint64_t v5;
  GLKBigInt_s *v6;
  GLKBigInt_s *vshMask;
  GLKBigInt_s v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GLKEffect;
  v2 = -[GLKEffect init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[GLKEffect dirtyAllUniforms](v2, "dirtyAllUniforms");
    v3->_properties = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3->_numLights = 0;
    v3->_numTextures = 0;
    v3->_aColorLoc = -1;
    v4 = (id *)malloc_type_malloc(0xB0uLL, 0x80040B8603338uLL);
    v5 = 0;
    v3->_effectShaderArray = v4;
    do
      v3->_effectShaderArray[v5++] = 0;
    while (v5 != 22);
    *v3->_effectShaderArray = v3;
    v3->_vshStrings = (char **)malloc_type_malloc(0x800uLL, 0x10040436913F5uLL);
    v3->_fshStrings = (char **)malloc_type_malloc(0x800uLL, 0x10040436913F5uLL);
    v3->_vshMask = (GLKBigInt_s *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
    v6 = (GLKBigInt_s *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
    v3->_fshMask = v6;
    vshMask = v3->_vshMask;
    vshMask->n0 = 0;
    vshMask->n1 = 0;
    v6->n0 = 0;
    v6->n1 = 0;
    v8.n0 = -1;
    v8.n1 = -1;
    v3->_prevFshMask = v8;
    v3->_prevVshMask = v8;
    v3->_programHash = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v3->_vshRootNode = (GLKShaderBlockNode *)+[GLKShaderBlockNode copyTreeWithRoot:parent:](GLKShaderBlockNode, "copyTreeWithRoot:parent:", __vshRootNode, 0);
    v3->_fshRootNode = (GLKShaderBlockNode *)+[GLKShaderBlockNode copyTreeWithRoot:parent:](GLKShaderBlockNode, "copyTreeWithRoot:parent:", __fshRootNode, 0);
    v3->_masksInitialized = 0;
    -[GLKEffect setColorMaterialEnabled:](v3, "setColorMaterialEnabled:", 0);
    -[GLKEffect setLightModelTwoSided:](v3, "setLightModelTwoSided:", 0);
    -[GLKEffect setPerPixelLightingEnabled:](v3, "setPerPixelLightingEnabled:", 0);
    -[GLKEffect setPerVertexLightingEnabled:](v3, "setPerVertexLightingEnabled:", 0);
    -[GLKEffect setTexturingEnabled:](v3, "setTexturingEnabled:", 0);
    v3->_lightModelAmbientColorLoc = -1;
    v3->_textureOrder = 0;
    v3->_textureOrderStale = 0;
    v3->_lightModelAmbientColor = (_GLKVector4)xmmword_20DC81340;
  }
  return v3;
}

+ (void)initializeStaticMasks
{
  xmmword_2549DE560 = 0u;
  xmmword_2549DE570 = 0u;
  xmmword_2549DE540 = 0u;
  xmmword_2549DE550 = 0u;
  xmmword_2549DE520 = 0u;
  xmmword_2549DE530 = 0u;
  xmmword_2549DE500 = 0u;
  xmmword_2549DE510 = 0u;
  __vshMasks = 0u;
  *(_OWORD *)&qword_2549DE4F0 = 0u;
  __fshMasks = 0u;
  *(_OWORD *)&qword_2549DE590 = 0u;
  xmmword_2549DE5A0 = 0u;
  xmmword_2549DE5B0 = 0u;
  xmmword_2549DE5C0 = 0u;
  *(_OWORD *)&qword_2549DE5D0 = 0u;
  xmmword_2549DE5E0 = 0u;
  xmmword_2549DE5F0 = 0u;
  xmmword_2549DE600 = 0u;
  xmmword_2549DE610 = 0u;
  xmmword_2549DE620 = 0u;
}

+ (BOOL)parseXMLFile:(id)a3 rootNode:(id)a4
{
  uint64_t v6;
  void *v7;
  int v8;

  v6 = objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a3);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1978]), "initWithContentsOfURL:", v6);
  objc_msgSend(v7, "setDelegate:", a4);
  objc_msgSend(v7, "setShouldResolveExternalEntities:", 1);
  v8 = objc_msgSend(v7, "parse");

  if (v8)
    objc_msgSend(a1, "unrollLoopNodesForStaticTreeWithRoot:", a4);
  return v8;
}

+ (void)unrollLoopNodesForStaticTreeWithRoot:(id)a3
{
  id v4;
  unint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = 0x24C847000uLL;
  +[GLKShaderBlockNode buildUnrollNodeArray:array:](GLKShaderBlockNode, "buildUnrollNodeArray:array:", a3, v4);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v28 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v34;
    v6 = CFSTR("%@%d");
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v34 != v27)
          objc_enumerationMutation(v4);
        v29 = v7;
        v8 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v7);
        v9 = objc_msgSend(v8, "label");
        v31 = v8;
        v10 = objc_msgSend(v8, "unrollCt");
        if (v10 >= 2)
        {
          v11 = 1;
          v12 = v8;
          v30 = v10;
          do
          {
            v32 = v12;
            v12 = (void *)objc_msgSend(*(id *)(v5 + 2464), "copyTreeWithRootButNotSiblings:parent:", v31, objc_msgSend(v31, "parent"));
            objc_msgSend(v12, "setIndex:", v11);
            objc_msgSend(v12, "setPropertyClass:", objc_msgSend(v31, "propertyClass") + v11);
            objc_msgSend(v12, "setLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v6, v9, v11));
            objc_msgSend(v12, "setType:", 1);
            v13 = *(void **)(v5 + 2464);
            v14 = v9;
            v15 = v6;
            v16 = objc_msgSend(v12, "children");
            v17 = v5;
            v18 = objc_msgSend(v31, "loopVar");
            v19 = objc_msgSend(v31, "propertyClass");
            v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v11);
            v21 = v16;
            v6 = v15;
            v9 = v14;
            v22 = v18;
            v5 = v17;
            objc_msgSend(v13, "setIndicesForRoot:andReplaceLoopVar:baseLabel:basePropertyClass:usingIndex:indexString:", v21, v22, v14, v19, v11, v20);
            objc_msgSend(*(id *)(v17 + 2464), "insertNode:afterSibling:", v12, v32);
            v11 = (v11 + 1);
          }
          while (v30 != (_DWORD)v11);
        }
        v23 = *(void **)(v5 + 2464);
        v24 = objc_msgSend(v31, "children");
        v25 = objc_msgSend(v31, "loopVar");
        v26 = objc_msgSend(v31, "propertyClass");
        objc_msgSend(v23, "setIndicesForRoot:andReplaceLoopVar:baseLabel:basePropertyClass:usingIndex:indexString:", v24, v25, v9, v26, 0, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 0));
        objc_msgSend(v31, "setLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v6, objc_msgSend(v31, "label"), 0));
        objc_msgSend(v31, "setType:", 1);
        v7 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v28);
  }
}

- (GLKEffect)initWithPropertyArray:(id)a3
{
  GLKEffect *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t Error;
  uint64_t v13;
  NSMutableArray *lightProperties;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
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
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = -[GLKEffect init](self, "init");
  if (!v4)
    return v4;
  v4->_lightProperties = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  *(_QWORD *)&v4->_vshName = 0;
  v4->_programName = 0;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v29;
    v23 = 1;
    while (2)
    {
      v10 = 0;
      v21 = v7 + v6;
      v22 = v7;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v10);
        if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GLKEffect effectWithAttribs: bad argument type for argument %d: %p"), (v22 + 1) + v10, v11);
          goto LABEL_30;
        }
        -[NSMutableArray addObject:](v4->_properties, "addObject:", v11);
        objc_msgSend(v11, "setEffect:", v4);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "setEffectDirtyUniforms:", &v4->_dirtyUniforms);
          v4->_effectShaderArray[v4->_numLights + 2] = v11;
          objc_msgSend(v11, "setLightIndex:", v4->_numLights++);
          -[NSMutableArray addObject:](v4->_lightProperties, "addObject:", v11);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v4->_texturingEnabled = 1;
            v4->_textureOrderStale = 1;
            ++v4->_numTextures;
          }
          else if (v23 == 1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v23 = 0;
            *((_QWORD *)v4->_effectShaderArray + 1) = v11;
            v8 = (uint64_t)v11;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              *((_QWORD *)v4->_effectShaderArray + 10) = v11;
              objc_msgSend(v11, "setEffectDirtyUniforms:", &v4->_dirtyUniforms);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                *((_QWORD *)v4->_effectShaderArray + 19) = v11;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  *((_QWORD *)v4->_effectShaderArray + 20) = v11;
              }
            }
          }
        }
        ++v10;
      }
      while (v6 != v10);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      v7 = v21;
      if (v6)
        continue;
      break;
    }
    Error = glGetError();
    if (!(_DWORD)Error)
    {
      if (v23)
        goto LABEL_32;
      goto LABEL_33;
    }
  }
  else
  {
    Error = glGetError();
    if (!(_DWORD)Error)
    {
LABEL_32:
      -[GLKEffect addTransformProperty](v4, "addTransformProperty");
      v8 = -[NSMutableArray objectAtIndex:](v4->_properties, "objectAtIndex:", 0);
LABEL_33:
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      lightProperties = v4->_lightProperties;
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lightProperties, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v25 != v18)
              objc_enumerationMutation(lightProperties);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "setTransform:", v8);
          }
          v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lightProperties, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v17);
      }
      _lightStateChanged((uint64_t)v4);
      return v4;
    }
  }
  v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GL ERROR: 0x%04x"), Error, v20);
LABEL_30:
  NSLog(CFSTR("%@"), v13);
  return 0;
}

- (void)dirtyAllUniforms
{
  -[GLKEffect setDirtyUniforms:](self, "setDirtyUniforms:", 83886594);
}

- (void)setTextureOrder:(id)a3
{
  unint64_t v5;
  NSArray *textureOrder;
  BOOL v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;

  if (!a3)
  {

    self->_textureOrder = 0;
    goto LABEL_13;
  }
  v5 = objc_msgSend(a3, "count");
  textureOrder = self->_textureOrder;
  if (!textureOrder || (v5 == -[NSArray count](textureOrder, "count") ? (v7 = v5 == 0) : (v7 = 1), v7))
  {
    LODWORD(v8) = 0;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    while (1)
    {
      v10 = (void *)objc_msgSend(a3, "objectAtIndex:", v8);
      if (v10 != -[NSArray objectAtIndex:](self->_textureOrder, "objectAtIndex:", v8))
        break;
      v8 = ++v9;
      if (v5 <= v9)
        goto LABEL_9;
    }
    LODWORD(v8) = v9;
  }
LABEL_9:
  if (!v5 || v5 != v8)
  {

    self->_textureOrder = (NSArray *)a3;
LABEL_13:
    self->_textureOrderStale = 1;
  }
}

- (void)addTransformProperty
{
  -[NSMutableArray insertObject:atIndex:](self->_properties, "insertObject:atIndex:", objc_alloc_init(GLKEffectPropertyTransform), 0);
}

- (void)setTextureIndices
{
  NSArray *textureOrder;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  NSMutableArray *properties;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  GLint params;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  params = 0;
  +[GLKEffectPropertyTexture clearAllTexturingMasks:fshMask:](GLKEffectPropertyTexture, "clearAllTexturingMasks:fshMask:", self->_vshMask, self->_fshMask);
  textureOrder = self->_textureOrder;
  if (textureOrder)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](textureOrder, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v23;
      do
      {
        v8 = 0;
        v9 = v6;
        do
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(textureOrder);
          v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
          objc_msgSend(v10, "setTextureIndex:", (v6 + v8));
          self->_effectShaderArray[v9++ + 11] = v10;
          ++v8;
        }
        while (v5 != v8);
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](textureOrder, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
        v6 = v9;
      }
      while (v5);
    }
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    glGetIntegerv(0x8872u, &params);
    v12 = 0;
    v13 = 0;
    v14 = 3553;
    do
    {
      v21 = v12;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      properties = self->_properties;
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](properties, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v27 != v18)
              objc_enumerationMutation(properties);
            v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v20, "target") == v14)
            {
              objc_msgSend(v20, "setTextureIndex:", v13);
              self->_effectShaderArray[(int)v13 + 11] = v20;
              objc_msgSend(v11, "addObject:", v20);
              v13 = (v13 + 1);
            }
          }
          v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](properties, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        }
        while (v17);
      }
      v12 = v21 + 1;
      v14 = dword_20DC81380[v21 + 1];
    }
    while (v21 != 1);
    -[GLKEffect setTextureOrder:](self, "setTextureOrder:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v11));

  }
}

- (BOOL)useTexCoordAttrib
{
  NSArray *textureOrder;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  textureOrder = self->_textureOrder;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](textureOrder, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(textureOrder);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "useTexCoordAttribMask"))
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](textureOrder, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return v3;
}

- (BOOL)useColorAttrib
{
  return self->_colorMaterialEnabled || self->_perVertexLightingEnabled == 0;
}

+ (id)programInfoLogForName:(unsigned int)a3 effectLabel:(id)a4 msg:(const char *)a5
{
  GLchar *v8;
  void *v9;
  GLint params;

  params = 0;
  glGetProgramiv(a3, 0x8B84u, &params);
  if (!params)
    return 0;
  v8 = (GLchar *)malloc_type_malloc(params, 0xCAFA061BuLL);
  glGetProgramInfoLog(a3, params, &params, v8);
  v9 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GLKEffect programInfoLogForName - %s\nEffect: %@\nInformation log:\n%s"), a5, a4, v8);
  free(v8);
  return v9;
}

+ (id)shaderInfoLogForName:(unsigned int)a3 effectLabel:(id)a4 msg:(const char *)a5
{
  GLchar *v8;
  void *v9;
  GLint params;

  params = 0;
  glGetShaderiv(a3, 0x8B84u, &params);
  if (!params)
    return 0;
  v8 = (GLchar *)malloc_type_malloc(params, 0xC1A003E4uLL);
  glGetShaderInfoLog(a3, params, &params, v8);
  v9 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GLKEffect shaderInfoLogForName - %s\nEffect: %@\nInformation log:\n%s"), a5, a4, v8);
  free(v8);
  return v9;
}

- (void)setLightModelAmbientColor:(_GLKVector4)a3
{
  float v3;
  float v4;
  float v5;
  float v6;

  self->_lightModelAmbientColor.x = v3;
  self->_lightModelAmbientColor.y = v4;
  self->_lightModelAmbientColor.z = v5;
  self->_lightModelAmbientColor.w = v6;
  -[GLKEffect setDirtyUniforms:](self, "setDirtyUniforms:", -[GLKEffect dirtyUniforms](self, "dirtyUniforms", *(_QWORD *)&a3.x, *(_QWORD *)&a3.v[2]) | 2);
}

- (void)setColorMaterialEnabled:(unsigned __int8)a3
{
  uint64_t *v3;
  uint64_t *v4;
  GLKBigInt_s *vshMask;
  GLKBigInt_s *fshMask;
  unint64_t n1;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t *v16;

  if (self->_colorMaterialEnabled != a3 || !self->_masksInitialized)
  {
    self->_colorMaterialEnabled = a3;
    v3 = (uint64_t *)&__vshMasks;
    if (a3)
      v4 = (uint64_t *)&__vshMasks;
    else
      v4 = &qword_2549DE4F0;
    fshMask = self->_fshMask;
    vshMask = self->_vshMask;
    n1 = vshMask->n1;
    vshMask->n0 |= *v4;
    if (a3)
      v8 = (uint64_t *)&__vshMasks + 1;
    else
      v8 = &qword_2549DE4F8;
    vshMask->n1 = n1 | *v8;
    if (a3)
      v9 = (uint64_t *)&__fshMasks;
    else
      v9 = &qword_2549DE590;
    v10 = fshMask->n1;
    fshMask->n0 |= *v9;
    if (a3)
      v11 = (uint64_t *)&__fshMasks + 1;
    else
      v11 = &qword_2549DE598;
    fshMask->n1 = v10 | *v11;
    if (a3)
      v3 = &qword_2549DE4F0;
    v12 = vshMask->n1;
    vshMask->n0 &= ~*v3;
    if (a3)
      v13 = &qword_2549DE4F8;
    else
      v13 = (uint64_t *)&__vshMasks + 1;
    vshMask->n1 = v12 & ~*v13;
    if (a3)
      v14 = &qword_2549DE590;
    else
      v14 = (uint64_t *)&__fshMasks;
    v15 = fshMask->n1;
    fshMask->n0 &= ~*v14;
    if (a3)
      v16 = &qword_2549DE598;
    else
      v16 = (uint64_t *)&__fshMasks + 1;
    fshMask->n1 = v15 & ~*v16;
  }
}

- (void)setLightModelTwoSided:(unsigned __int8)a3
{
  if (self->_lightModelTwoSided != a3 || !self->_masksInitialized)
  {
    self->_lightModelTwoSided = a3;
    _lightModelTwoSidedMask((uint64_t)self);
  }
}

- (void)setPerVertexLightingEnabled:(unsigned __int8)a3
{
  if (self->_perVertexLightingEnabled != a3 || !self->_masksInitialized)
    _lightStateChanged((uint64_t)self);
}

- (void)setPerPixelLightingEnabled:(unsigned __int8)a3
{
  if (self->_perPixelLightingEnabled != a3 || !self->_masksInitialized)
    _lightStateChanged((uint64_t)self);
}

- (void)setShaderBindings
{
  self->_aColorLoc = glGetAttribLocation(self->_programName, "a_color");
  self->_lightModelAmbientColorLoc = glGetUniformLocation(self->_programName, "lightModelAmbientColor");
  self->_baseLightingColorLoc = glGetUniformLocation(self->_programName, "baseLightingColor");
  -[GLKEffect dirtyAllUniforms](self, "dirtyAllUniforms");
}

- (void)updateVshStringsWithRoot:(id)a3 enabled:(GLKBigInt_s)a4
{
  unint64_t n1;
  unint64_t n0;
  id *effectShaderArray;
  uint64_t v9;
  char **vshStrings;
  uint64_t numVshStrings;

  n1 = a4.n1;
  n0 = a4.n0;
  if (objc_msgSend(a3, "propertyClass") == 21
    || objc_msgSend(a3, "type") == 2
    || (effectShaderArray = self->_effectShaderArray, effectShaderArray[objc_msgSend(a3, "propertyClass")])
    && objc_msgSend(self->_effectShaderArray[objc_msgSend(a3, "propertyClass")], "includeVshShaderTextForRootNode:", a3))
  {
    if (objc_msgSend(a3, "blockText"))
    {
      v9 = objc_msgSend((id)objc_msgSend(a3, "blockText"), "UTF8String");
      vshStrings = self->_vshStrings;
      numVshStrings = self->_numVshStrings;
      self->_numVshStrings = numVshStrings + 1;
      vshStrings[numVshStrings] = (char *)v9;
    }
    if (objc_msgSend(a3, "children"))
      -[GLKEffect updateVshStringsWithRoot:enabled:](self, "updateVshStringsWithRoot:enabled:", objc_msgSend(a3, "children"), n0, n1);
  }
  if (objc_msgSend(a3, "next"))
    -[GLKEffect updateVshStringsWithRoot:enabled:](self, "updateVshStringsWithRoot:enabled:", objc_msgSend(a3, "next"), n0, n1);
}

- (void)updateFshStringsWithRoot:(id)a3 enabled:(GLKBigInt_s)a4
{
  unint64_t n1;
  unint64_t n0;
  id *effectShaderArray;
  uint64_t v9;
  char **fshStrings;
  uint64_t numFshStrings;

  n1 = a4.n1;
  n0 = a4.n0;
  if (objc_msgSend(a3, "propertyClass") == 21
    || objc_msgSend(a3, "type") == 2
    || (effectShaderArray = self->_effectShaderArray, effectShaderArray[objc_msgSend(a3, "propertyClass")])
    && objc_msgSend(self->_effectShaderArray[objc_msgSend(a3, "propertyClass")], "includeFshShaderTextForRootNode:", a3))
  {
    if (objc_msgSend(a3, "blockText"))
    {
      v9 = objc_msgSend((id)objc_msgSend(a3, "blockText"), "UTF8String");
      fshStrings = self->_fshStrings;
      numFshStrings = self->_numFshStrings;
      self->_numFshStrings = numFshStrings + 1;
      fshStrings[numFshStrings] = (char *)v9;
    }
    if (objc_msgSend(a3, "children"))
      -[GLKEffect updateFshStringsWithRoot:enabled:](self, "updateFshStringsWithRoot:enabled:", objc_msgSend(a3, "children"), n0, n1);
  }
  if (objc_msgSend(a3, "next"))
    -[GLKEffect updateFshStringsWithRoot:enabled:](self, "updateFshStringsWithRoot:enabled:", objc_msgSend(a3, "next"), n0, n1);
}

- (void)createAndUseProgramWithShadingHash:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  GLuint v8;
  GLKHashableBigInt *v9;
  void *v10;
  NSString *label;
  GLKHashableBigInt *v12;
  void *v13;
  unsigned int fshName;
  NSString *v15;
  GLKHashableBigInt *v16;
  void *v17;
  unsigned int v18;
  NSMutableArray *properties;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  GLuint Program;
  GLuint programName;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  GLint UniformLocation;
  GLint v32;
  GLint v33;
  GLint v34;
  GLint v35;
  GLint v36;
  GLuint vshName;
  uint64_t Error;
  NSArray *textureOrder;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSMutableArray *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  GLint params;
  GLint v66[2];
  unint64_t v67;
  uint64_t v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  if (!self->_masksInitialized)
    -[GLKEffect initializeMasks](self, "initializeMasks");
  v67 = 0;
  v68 = 0;
  *(_QWORD *)v66 = 0;
  if (__purgeShadingHash == 1 && __hashedShaders >= 0x101)
  {
    params = 0;
    glGetIntegerv(0x8B8Du, &params);
    v5 = (void *)-[NSMutableDictionary keyEnumerator](self->_programHash, "keyEnumerator");
    v6 = objc_msgSend(v5, "nextObject");
    if (v6)
    {
      v7 = v6;
      do
      {
        v8 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_programHash, "objectForKey:", v7), "intValue");
        if (v8 != params)
          glDeleteProgram(v8);
        v7 = objc_msgSend(v5, "nextObject");
      }
      while (v7);
    }
    -[NSMutableDictionary removeAllObjects](self->_programHash, "removeAllObjects", v7);
    objc_msgSend(a3, "purgeAllShaders");
    __hashedShaders = 0;
  }
  v9 = -[GLKHashableBigInt initWithBigInt:]([GLKHashableBigInt alloc], "initWithBigInt:", self->_vshMask);
  v10 = (void *)objc_msgSend(a3, "compiledVshForKey:", v9);
  if (v10)
  {
    self->_vshName = objc_msgSend(v10, "intValue");
  }
  else
  {
    self->_vshName = glCreateShader(0x8B31u);
    self->_numVshStrings = 0;
    -[GLKEffect updateVshStringsWithRoot:enabled:](self, "updateVshStringsWithRoot:enabled:", self->_vshRootNode, self->_vshMask->n0, self->_vshMask->n1);
    glShaderSource(self->_vshName, self->_numVshStrings, (const GLchar *const *)self->_vshStrings, 0);
    glCompileShader(self->_vshName);
    label = self->_label;
    if (label && (__purgeShadingHash & 1) == 0)
      glLabelObjectEXT(0x8B48u, self->_vshName, 0, -[NSString cStringUsingEncoding:](label, "cStringUsingEncoding:", 1));
    glGetShaderiv(self->_vshName, 0x8B81u, &v66[1]);
    if (!v66[1])
    {
      vshName = self->_vshName;
LABEL_57:
      glDeleteShader(vshName);
      return;
    }
    objc_msgSend(a3, "setCompiledVsh:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", self->_vshName), v9);
    ++__hashedShaders;
  }
  v12 = -[GLKHashableBigInt initWithBigInt:]([GLKHashableBigInt alloc], "initWithBigInt:", self->_fshMask);
  v13 = (void *)objc_msgSend(a3, "compiledFshForKey:", v12);
  if (v13)
  {
    fshName = objc_msgSend(v13, "intValue");
    self->_fshName = fshName;
    goto LABEL_25;
  }
  self->_fshName = glCreateShader(0x8B30u);
  self->_numFshStrings = 0;
  -[GLKEffect updateFshStringsWithRoot:enabled:](self, "updateFshStringsWithRoot:enabled:", self->_fshRootNode, self->_fshMask->n0, self->_fshMask->n1);
  glShaderSource(self->_fshName, self->_numFshStrings, (const GLchar *const *)self->_fshStrings, 0);
  glCompileShader(self->_fshName);
  v15 = self->_label;
  if (v15 && (__purgeShadingHash & 1) == 0)
    glLabelObjectEXT(0x8B48u, self->_fshName, 0, -[NSString cStringUsingEncoding:](v15, "cStringUsingEncoding:", 1));
  glGetShaderiv(self->_fshName, 0x8B81u, &v66[1]);
  if (!v66[1])
  {
    vshName = self->_fshName;
    goto LABEL_57;
  }
  objc_msgSend(a3, "setCompiledFsh:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", self->_fshName), v12);
  ++__hashedShaders;
  fshName = self->_fshName;
LABEL_25:
  v67 = fshName | ((unint64_t)self->_vshName << 32);
  v68 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDE2818], "currentContext"), "sharegroup");
  v16 = -[GLKHashableBigInt initWithBigInt:]([GLKHashableBigInt alloc], "initWithBigInt:", &v67);
  v17 = (void *)-[NSMutableDictionary objectForKey:](self->_programHash, "objectForKey:", v16);
  if (v17)
  {
    v18 = objc_msgSend(v17, "intValue");
    self->_programName = v18;
    glUseProgram(v18);
    -[GLKEffect setShaderBindings](self, "setShaderBindings");
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    properties = self->_properties;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](properties, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v62 != v22)
            objc_enumerationMutation(properties);
          objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "setShaderBindings");
        }
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](properties, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
      }
      while (v21);
    }
    return;
  }
  Program = glCreateProgram();
  self->_programName = Program;
  if (self->_label && (__purgeShadingHash & 1) == 0)
  {
    glLabelObjectEXT(0x8B40u, self->_programName, 0, -[NSString cStringUsingEncoding:](self->_label, "cStringUsingEncoding:", 1));
    Program = self->_programName;
  }
  glAttachShader(Program, self->_vshName);
  glAttachShader(self->_programName, self->_fshName);
  glBindAttribLocation(self->_programName, 0, "a_position");
  if (self->_perPixelLightingEnabled || self->_perVertexLightingEnabled)
    goto LABEL_39;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  textureOrder = self->_textureOrder;
  v40 = -[NSArray countByEnumeratingWithState:objects:count:](textureOrder, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v58;
LABEL_63:
    v43 = 0;
    while (1)
    {
      if (*(_QWORD *)v58 != v42)
        objc_enumerationMutation(textureOrder);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * v43), "normalizedNormalsMask"))
        break;
      if (v41 == ++v43)
      {
        v41 = -[NSArray countByEnumeratingWithState:objects:count:](textureOrder, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
        if (v41)
          goto LABEL_63;
        goto LABEL_40;
      }
    }
LABEL_39:
    glBindAttribLocation(self->_programName, 1u, "a_normal");
  }
LABEL_40:
  if (-[GLKEffect useTexCoordAttrib](self, "useTexCoordAttrib"))
  {
    glBindAttribLocation(self->_programName, 3u, "a_texCoord0");
    glBindAttribLocation(self->_programName, 4u, "a_texCoord1");
  }
  if (-[GLKEffect useColorAttrib](self, "useColorAttrib"))
    glBindAttribLocation(self->_programName, 2u, "a_color");
  glLinkProgram(self->_programName);
  glGetProgramiv(self->_programName, 0x8B82u, v66);
  programName = self->_programName;
  if (!v66[0])
    goto LABEL_54;
  glUseProgram(programName);
  -[GLKEffect setShaderBindings](self, "setShaderBindings");
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v26 = self->_properties;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v54 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * j), "setShaderBindings");
      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
    }
    while (v28);
  }
  params = 0;
  UniformLocation = glGetUniformLocation(self->_programName, "unit2d[0]");
  v32 = glGetUniformLocation(self->_programName, "unit2d[1]");
  v33 = glGetUniformLocation(self->_programName, "unit2d[2]");
  v34 = glGetUniformLocation(self->_programName, "unitCube[0]");
  v35 = glGetUniformLocation(self->_programName, "unitCube[1]");
  v36 = glGetUniformLocation(self->_programName, "unitCube[2]");
  glGetIntegerv(0x8872u, &params);
  glUniform1i(UniformLocation, params - 1);
  glUniform1i(v32, params - 2);
  glUniform1i(v33, params - 3);
  glUniform1i(v34, params - 4);
  glUniform1i(v35, params - 5);
  glUniform1i(v36, params - 6);
  glValidateProgram(self->_programName);
  if (+[GLKEffect programInfoLogForName:effectLabel:msg:](GLKEffect, "programInfoLogForName:effectLabel:msg:", self->_programName, -[GLKEffect label](self, "label"), "program validate failed"))
  {
    programName = self->_programName;
LABEL_54:
    glDeleteProgram(programName);
    return;
  }
  Error = glGetError();
  if ((_DWORD)Error)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GL ERROR: 0x%04x"), Error);
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](self->_programHash, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", self->_programName), v16);
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v44 = self->_properties;
    v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v50;
      do
      {
        for (k = 0; k != v46; ++k)
        {
          if (*(_QWORD *)v50 != v47)
            objc_enumerationMutation(v44);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * k), "dirtyAllUniforms");
        }
        v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
      }
      while (v46);
    }
  }
}

- (void)bind
{
  GLKBigInt_s *vshMask;
  GLKBigInt_s *v4;
  GLuint programName;
  void *v6;
  uint64_t v7;
  GLKBigInt_s *fshMask;
  NSArray *textureOrder;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int32 v14;
  float32x4_t v15;
  unsigned int v16;
  unsigned int v17;
  __int32 v18;
  float32x4_t v19;
  unsigned int v20;
  unsigned int v21;
  void *v22;
  NSMutableArray *properties;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  NSMutableArray *lightProperties;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  float32x4_t v43;
  __int32 v44;
  float32x4_t v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD block[7];
  GLint params[4];
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  uint64_t v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  if (self->_textureOrderStale)
    -[GLKEffect setTextureIndices](self, "setTextureIndices");
  vshMask = self->_vshMask;
  if (vshMask->n0 == self->_prevVshMask.n0
    && vshMask->n1 == self->_prevVshMask.n1
    && (v4 = self->_fshMask, v4->n0 == self->_prevFshMask.n0)
    && v4->n1 == self->_prevFshMask.n1)
  {
    params[0] = 0;
    glGetIntegerv(0x8B8Du, params);
    programName = self->_programName;
    if (programName != params[0])
      glUseProgram(programName);
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BDE2818], "currentContext");
    if (!v6)
    {
      if (self->_label)
        NSLog(CFSTR("No OpenGL context was made current when binding effect: %@"), self->_label);
      else
        NSLog(CFSTR("No OpenGL context was made current when binding effect"));
      return;
    }
    v7 = objc_msgSend(v6, "sharegroup");
    *(_QWORD *)params = 0;
    *(_QWORD *)&params[2] = params;
    v66 = 0x3052000000;
    v67 = __Block_byref_object_copy_;
    v68 = __Block_byref_object_dispose_;
    v69 = 0;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __17__GLKEffect_bind__block_invoke;
    block[3] = &unk_24C8480D8;
    block[5] = self;
    block[6] = params;
    block[4] = v7;
    dispatch_sync((dispatch_queue_t)__sharegroupQueue, block);
    self->_textureOrderStale = 0;
    fshMask = self->_fshMask;
    self->_prevVshMask = *self->_vshMask;
    self->_prevFshMask = *fshMask;
    _Block_object_dispose(params, 8);
  }
  if (self->_textureOrderStale)
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    textureOrder = self->_textureOrder;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](textureOrder, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v61 != v12)
            objc_enumerationMutation(textureOrder);
          objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "setShaderBindings");
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](textureOrder, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
      }
      while (v11);
    }
    self->_textureOrderStale = 0;
  }
  if (-[GLKEffect dirtyUniforms](self, "dirtyUniforms"))
  {
    if ((-[GLKEffect dirtyUniforms](self, "dirtyUniforms") & 2) != 0)
      glUniform4fv(self->_lightModelAmbientColorLoc, 1, &self->_lightModelAmbientColor.x);
    if (!self->_colorMaterialEnabled)
    {
      if ((self->_perVertexLightingEnabled || self->_perPixelLightingEnabled)
        && ((-[GLKEffect dirtyUniforms](self, "dirtyUniforms") & 0x1000000) != 0
         || (-[GLKEffect dirtyUniforms](self, "dirtyUniforms") & 0x4000000) != 0
         || (-[GLKEffect dirtyUniforms](self, "dirtyUniforms") & 2) != 0))
      {
        objc_msgSend(self->_effectShaderArray[10], "ambientColor");
        v15.i32[1] = v14;
        v15.i64[1] = __PAIR64__(v17, v16);
        self->_baseLightingColor = (_GLKVector4)vmulq_f32((float32x4_t)self->_lightModelAmbientColor, v15);
        objc_msgSend(self->_effectShaderArray[10], "emissiveColor");
        v19.i32[1] = v18;
        v19.i64[1] = __PAIR64__(v21, v20);
        self->_baseLightingColor = (_GLKVector4)vaddq_f32((float32x4_t)self->_baseLightingColor, v19);
        glUniform4fv(self->_baseLightingColorLoc, 1, &self->_baseLightingColor.x);
      }
      if (!self->_colorMaterialEnabled
        && *((_QWORD *)self->_effectShaderArray + 10)
        && ((-[GLKEffect dirtyUniforms](self, "dirtyUniforms") & 0x1000000) != 0
         || (-[GLKEffect dirtyUniforms](self, "dirtyUniforms") & 0x40000000) != 0))
      {
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        lightProperties = self->_lightProperties;
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lightProperties, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v57;
          do
          {
            for (j = 0; j != v35; ++j)
            {
              if (*(_QWORD *)v57 != v36)
                objc_enumerationMutation(lightProperties);
              v38 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
              memset(params, 0, sizeof(params));
              objc_msgSend(self->_effectShaderArray[10], "ambientColor");
              v49 = v39;
              v48 = v40;
              v50 = v41;
              v51 = v42;
              objc_msgSend(v38, "ambientColor");
              v43.i64[0] = __PAIR64__(v48, v49);
              v43.i64[1] = __PAIR64__(v51, v50);
              v45.i32[1] = v44;
              v45.i64[1] = __PAIR64__(v47, v46);
              *(float32x4_t *)params = vmulq_f32(v43, v45);
              glUniform4fv(objc_msgSend(v38, "ambientTermLoc"), 1, (const GLfloat *)params);
            }
            v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lightProperties, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
          }
          while (v35);
        }
      }
    }
    -[GLKEffect setDirtyUniforms:](self, "setDirtyUniforms:", 0);
  }
  v22 = (void *)*((_QWORD *)self->_effectShaderArray + 20);
  if (v22 && !objc_msgSend(v22, "enabled"))
  {
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)params = _Q0;
    glVertexAttrib4fv(self->_aColorLoc, (const GLfloat *)params);
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  properties = self->_properties;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](properties, "countByEnumeratingWithState:objects:count:", &v52, v70, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v53;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v53 != v31)
          objc_enumerationMutation(properties);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * k), "bind");
      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](properties, "countByEnumeratingWithState:objects:count:", &v52, v70, 16);
    }
    while (v30);
  }
}

uint64_t __17__GLKEffect_bind__block_invoke(uint64_t a1)
{
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = CFDictionaryGetValue((CFDictionaryRef)__sharegroupDict, *(const void **)(a1 + 32));
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_alloc_init(GLKShadingHash);
    CFDictionaryAddValue((CFMutableDictionaryRef)__sharegroupDict, *(const void **)(a1 + 32), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  return objc_msgSend(*(id *)(a1 + 40), "createAndUseProgramWithShadingHash:", v2);
}

- (void)initializeMasks
{
  uint64_t *v3;
  BOOL v4;
  uint64_t *v5;
  GLKBigInt_s *vshMask;
  GLKBigInt_s *fshMask;
  unint64_t n1;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t *v17;
  uint64_t i;
  id v19;

  self->_perPixelLightingEnabled = -[GLKEffect perPixelLightingEnabled](self, "perPixelLightingEnabled");
  self->_perVertexLightingEnabled = -[GLKEffect perVertexLightingEnabled](self, "perVertexLightingEnabled");
  v3 = (uint64_t *)&__vshMasks;
  v4 = self->_colorMaterialEnabled == 0;
  if (self->_colorMaterialEnabled)
    v5 = (uint64_t *)&__vshMasks;
  else
    v5 = &qword_2549DE4F0;
  fshMask = self->_fshMask;
  vshMask = self->_vshMask;
  n1 = vshMask->n1;
  vshMask->n0 |= *v5;
  v9 = &qword_2549DE4F8;
  if (v4)
    v10 = &qword_2549DE4F8;
  else
    v10 = (uint64_t *)&__vshMasks + 1;
  vshMask->n1 = n1 | *v10;
  if (v4)
    v11 = &qword_2549DE590;
  else
    v11 = (uint64_t *)&__fshMasks;
  v12 = fshMask->n1;
  fshMask->n0 |= *v11;
  if (v4)
    v13 = &qword_2549DE598;
  else
    v13 = (uint64_t *)&__fshMasks + 1;
  fshMask->n1 = v12 | *v13;
  if (!v4)
    v3 = &qword_2549DE4F0;
  v14 = vshMask->n1;
  vshMask->n0 &= ~*v3;
  if (v4)
    v9 = (uint64_t *)&__vshMasks + 1;
  vshMask->n1 = v14 & ~*v9;
  if (v4)
    v15 = (uint64_t *)&__fshMasks;
  else
    v15 = &qword_2549DE590;
  v16 = fshMask->n1;
  fshMask->n0 &= ~*v15;
  if (v4)
    v17 = (uint64_t *)&__fshMasks + 1;
  else
    v17 = &qword_2549DE598;
  fshMask->n1 = v16 & ~*v17;
  _lightModelTwoSidedMask((uint64_t)self);
  _vNormalEyeMask((uint64_t)self);
  _vPositionEyeMask((uint64_t)self);
  _useTexCoordAttribMask((uint64_t)self);
  _normalizedNormalsMask((uint64_t)self);
  _texturingEnabledMask((uint64_t)self);
  for (i = 1; i != 22; ++i)
  {
    v19 = self->_effectShaderArray[i];
    if (v19)
      objc_msgSend(v19, "initializeMasks");
  }
  -[GLKEffect setMasksInitialized:](self, "setMasksInitialized:", 1);
}

- (BOOL)includeShaderTextForRootNode:(id)a3
{
  int perVertexLightingEnabled;
  uint64_t v6;
  int colorMaterialEnabled;
  NSArray *textureOrder;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *lightProperties;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  float v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", CFSTR("per-pixel lighting enabled")))goto LABEL_2;
  if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", CFSTR("per-vertex lighting enabled")))
  {
LABEL_4:
    perVertexLightingEnabled = self->_perVertexLightingEnabled;
    goto LABEL_5;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", CFSTR("per-vertex lighting disabled")))goto LABEL_8;
  if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", CFSTR("texturing enabled")))
  {
    perVertexLightingEnabled = self->_texturingEnabled;
    goto LABEL_5;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", CFSTR("color material enabled")))
  {
    perVertexLightingEnabled = self->_colorMaterialEnabled;
    goto LABEL_5;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", CFSTR("color material disabled")))
  {
    colorMaterialEnabled = self->_colorMaterialEnabled;
    goto LABEL_9;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", CFSTR("light model two-sided per-vertex enabled")))
  {
    if (self->_lightModelTwoSided)
      goto LABEL_4;
    goto LABEL_24;
  }
  if (!objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", CFSTR("light model two-sided per-vertex disabled")))
  {
    if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", CFSTR("light model two-sided per-pixel enabled")))
    {
      if (self->_lightModelTwoSided)
      {
LABEL_2:
        perVertexLightingEnabled = self->_perPixelLightingEnabled;
LABEL_5:
        LOBYTE(v6) = perVertexLightingEnabled != 0;
        return v6;
      }
      goto LABEL_24;
    }
    if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", CFSTR("light model two-sided per-pixel disabled")))
    {
      if (self->_lightModelTwoSided)
      {
        colorMaterialEnabled = self->_perPixelLightingEnabled;
        goto LABEL_9;
      }
LABEL_86:
      LOBYTE(v6) = 1;
      return v6;
    }
    if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", CFSTR("use tex coord attrib")))
    {
      LOBYTE(v6) = -[GLKEffect useTexCoordAttrib](self, "useTexCoordAttrib");
      return v6;
    }
    if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", CFSTR("normalized normals")))
    {
      if (!self->_perVertexLightingEnabled && !self->_perPixelLightingEnabled)
      {
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        textureOrder = self->_textureOrder;
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](textureOrder, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
        if (!v6)
          return v6;
        v9 = v6;
        v10 = *(_QWORD *)v41;
LABEL_35:
        v11 = 0;
        while (1)
        {
          if (*(_QWORD *)v41 != v10)
            objc_enumerationMutation(textureOrder);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v11), "normalizedNormalsMask"))
            break;
          if (v9 == ++v11)
          {
            v9 = -[NSArray countByEnumeratingWithState:objects:count:](textureOrder, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
            LOBYTE(v6) = 0;
            if (v9)
              goto LABEL_35;
            return v6;
          }
        }
      }
      goto LABEL_86;
    }
    if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", CFSTR("v_positionEye")))
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v12 = self->_textureOrder;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v37;
LABEL_45:
        v16 = 0;
        while (1)
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(v12);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v16), "vPositionEyeMask"))
            goto LABEL_86;
          if (v14 == ++v16)
          {
            v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
            if (v14)
              goto LABEL_45;
            break;
          }
        }
      }
      if (self->_perPixelLightingEnabled)
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        lightProperties = self->_lightProperties;
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lightProperties, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
        if (!v6)
          return v6;
        v18 = v6;
        v19 = *(_QWORD *)v33;
LABEL_54:
        v20 = 0;
        while (1)
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(lightProperties);
          v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v20);
          if (objc_msgSend(v21, "enabled"))
          {
            objc_msgSend(v21, "position");
            if (v22 != 0.0)
              goto LABEL_86;
          }
          if (v18 == ++v20)
          {
            v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lightProperties, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
            LOBYTE(v6) = 0;
            if (v18)
              goto LABEL_54;
            return v6;
          }
        }
      }
      goto LABEL_24;
    }
    if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", CFSTR("v_normalEye")))
    {
      if (!self->_perPixelLightingEnabled)
      {
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v23 = self->_textureOrder;
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
        if (!v6)
          return v6;
        v24 = v6;
        v25 = *(_QWORD *)v29;
LABEL_66:
        v26 = 0;
        while (1)
        {
          if (*(_QWORD *)v29 != v25)
            objc_enumerationMutation(v23);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v26), "vNormalEyeMask"))
            break;
          if (v24 == ++v26)
          {
            v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
            LOBYTE(v6) = 0;
            if (v24)
              goto LABEL_66;
            return v6;
          }
        }
      }
      goto LABEL_86;
    }
    if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", CFSTR("light model two-sided per-vertex enabled")))
    {
      if (!self->_perVertexLightingEnabled)
        goto LABEL_24;
      goto LABEL_75;
    }
    if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", CFSTR("light model two-sided per-vertex disabled")))
    {
      if (!self->_perVertexLightingEnabled)
        goto LABEL_86;
    }
    else
    {
      if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", CFSTR("light model two-sided per-pixel enabled")))
      {
        if (!self->_perPixelLightingEnabled)
          goto LABEL_24;
LABEL_75:
        if (self->_lightModelTwoSided)
          goto LABEL_86;
LABEL_24:
        LOBYTE(v6) = 0;
        return v6;
      }
      if (!objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", CFSTR("light model two-sided per-pixel disabled"))|| !self->_perPixelLightingEnabled)
      {
        goto LABEL_86;
      }
    }
    if (!self->_lightModelTwoSided)
      goto LABEL_86;
    goto LABEL_24;
  }
  if (!self->_lightModelTwoSided)
    goto LABEL_86;
LABEL_8:
  colorMaterialEnabled = self->_perVertexLightingEnabled;
LABEL_9:
  LOBYTE(v6) = colorMaterialEnabled == 0;
  return v6;
}

- (BOOL)includeFshShaderTextForRootNode:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  GLKBigInt_s *fshMask;
  BOOL result;

  v3 = *((_QWORD *)a3 + 1);
  result = ((unint64_t)__fshMasks & v3) == 0
        && (v4 = *((_QWORD *)a3 + 2), (*((_QWORD *)&__fshMasks + 1) & v4) == 0)
        && (qword_2549DE590 & v3) == 0
        && (qword_2549DE598 & v4) == 0
        && ((unint64_t)xmmword_2549DE5A0 & v3) == 0
        && (*((_QWORD *)&xmmword_2549DE5A0 + 1) & v4) == 0
        && ((unint64_t)xmmword_2549DE5B0 & v3) == 0
        && (*((_QWORD *)&xmmword_2549DE5B0 + 1) & v4) == 0
        && ((unint64_t)xmmword_2549DE5C0 & v3) == 0
        && (*((_QWORD *)&xmmword_2549DE5C0 + 1) & v4) == 0
        && (qword_2549DE5D0 & v3) == 0
        && (qword_2549DE5D8 & v4) == 0
        && ((unint64_t)xmmword_2549DE5E0 & v3) == 0
        && (*((_QWORD *)&xmmword_2549DE5E0 + 1) & v4) == 0
        && ((unint64_t)xmmword_2549DE5F0 & v3) == 0
        && (*((_QWORD *)&xmmword_2549DE5F0 + 1) & v4) == 0
        && ((unint64_t)xmmword_2549DE600 & v3) == 0
        && (*((_QWORD *)&xmmword_2549DE600 + 1) & v4) == 0
        && ((unint64_t)xmmword_2549DE610 & v3) == 0
        && (*((_QWORD *)&xmmword_2549DE610 + 1) & v4) == 0
        && ((unint64_t)xmmword_2549DE620 & v3) == 0
        && (*((_QWORD *)&xmmword_2549DE620 + 1) & v4) == 0
        || (fshMask = self->_fshMask, (fshMask->n0 & v3) != 0)
        || (*((_QWORD *)a3 + 2) & fshMask->n1) != 0;
  return result;
}

- (BOOL)includeVshShaderTextForRootNode:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  GLKBigInt_s *vshMask;
  BOOL result;

  v3 = *((_QWORD *)a3 + 1);
  result = ((unint64_t)__vshMasks & v3) == 0
        && (v4 = *((_QWORD *)a3 + 2), (*((_QWORD *)&__vshMasks + 1) & v4) == 0)
        && (qword_2549DE4F0 & v3) == 0
        && (qword_2549DE4F8 & v4) == 0
        && ((unint64_t)xmmword_2549DE500 & v3) == 0
        && (*((_QWORD *)&xmmword_2549DE500 + 1) & v4) == 0
        && ((unint64_t)xmmword_2549DE510 & v3) == 0
        && (*((_QWORD *)&xmmword_2549DE510 + 1) & v4) == 0
        && ((unint64_t)xmmword_2549DE520 & v3) == 0
        && (*((_QWORD *)&xmmword_2549DE520 + 1) & v4) == 0
        && ((unint64_t)xmmword_2549DE530 & v3) == 0
        && (*((_QWORD *)&xmmword_2549DE530 + 1) & v4) == 0
        && ((unint64_t)xmmword_2549DE540 & v3) == 0
        && (*((_QWORD *)&xmmword_2549DE540 + 1) & v4) == 0
        && ((unint64_t)xmmword_2549DE550 & v3) == 0
        && (*((_QWORD *)&xmmword_2549DE550 + 1) & v4) == 0
        && ((unint64_t)xmmword_2549DE560 & v3) == 0
        && (*((_QWORD *)&xmmword_2549DE560 + 1) & v4) == 0
        && ((unint64_t)xmmword_2549DE570 & v3) == 0
        && (*((_QWORD *)&xmmword_2549DE570 + 1) & v4) == 0
        || (vshMask = self->_vshMask, (vshMask->n0 & v3) != 0)
        || (*((_QWORD *)a3 + 2) & vshMask->n1) != 0;
  return result;
}

+ (void)setStaticMasksWithVshRoot:(id)a3 fshRoot:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  *(_QWORD *)&__vshMasks = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("color material enabled"), a3, objc_msgSend(a3, "index"));
  *((_QWORD *)&__vshMasks + 1) = v6;
  qword_2549DE4F0 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("color material disabled"), a3, objc_msgSend(a3, "index"));
  qword_2549DE4F8 = v7;
  *(_QWORD *)&__fshMasks = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("color material enabled"), a4, objc_msgSend(a4, "index"));
  *((_QWORD *)&__fshMasks + 1) = v8;
  qword_2549DE590 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("color material disabled"), a4, objc_msgSend(a4, "index"));
  qword_2549DE598 = v9;
  *(_QWORD *)&xmmword_2549DE500 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("light model two-sided per-vertex enabled"), a3, objc_msgSend(a3, "index"));
  *((_QWORD *)&xmmword_2549DE500 + 1) = v10;
  *(_QWORD *)&xmmword_2549DE5A0 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("light model two-sided per-vertex enabled"), a4, objc_msgSend(a4, "index"));
  *((_QWORD *)&xmmword_2549DE5A0 + 1) = v11;
  *(_QWORD *)&xmmword_2549DE5B0 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("light model two-sided per-vertex disabled"), a4, objc_msgSend(a4, "index"));
  *((_QWORD *)&xmmword_2549DE5B0 + 1) = v12;
  *(_QWORD *)&xmmword_2549DE5C0 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("light model two-sided per-pixel enabled"), a4, objc_msgSend(a4, "index"));
  *((_QWORD *)&xmmword_2549DE5C0 + 1) = v13;
  qword_2549DE5D0 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("light model two-sided per-pixel disabled"), a4, objc_msgSend(a4, "index"));
  qword_2549DE5D8 = v14;
  *(_QWORD *)&xmmword_2549DE5E0 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("per-pixel lighting enabled"), a4, objc_msgSend(a4, "index"));
  *((_QWORD *)&xmmword_2549DE5E0 + 1) = v15;
  *(_QWORD *)&xmmword_2549DE510 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("per-vertex lighting enabled"), a3, objc_msgSend(a3, "index"));
  *((_QWORD *)&xmmword_2549DE510 + 1) = v16;
  *(_QWORD *)&xmmword_2549DE520 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("use tex coord attrib"), a3, objc_msgSend(a3, "index"));
  *((_QWORD *)&xmmword_2549DE520 + 1) = v17;
  *(_QWORD *)&xmmword_2549DE5F0 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("use tex coord attrib"), a4, objc_msgSend(a4, "index"));
  *((_QWORD *)&xmmword_2549DE5F0 + 1) = v18;
  *(_QWORD *)&xmmword_2549DE530 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("texturing enabled"), a3, objc_msgSend(a3, "index"));
  *((_QWORD *)&xmmword_2549DE530 + 1) = v19;
  *(_QWORD *)&xmmword_2549DE600 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("texturing enabled"), a4, objc_msgSend(a4, "index"));
  *((_QWORD *)&xmmword_2549DE600 + 1) = v20;
  *(_QWORD *)&xmmword_2549DE540 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("normalized normals"), a3, objc_msgSend(a3, "index"));
  *((_QWORD *)&xmmword_2549DE540 + 1) = v21;
  *(_QWORD *)&xmmword_2549DE550 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("v_positionEye"), a3, objc_msgSend(a3, "index"));
  *((_QWORD *)&xmmword_2549DE550 + 1) = v22;
  *(_QWORD *)&xmmword_2549DE610 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("v_positionEye"), a4, objc_msgSend(a4, "index"));
  *((_QWORD *)&xmmword_2549DE610 + 1) = v23;
  *(_QWORD *)&xmmword_2549DE560 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("v_normalEye"), a3, objc_msgSend(a3, "index"));
  *((_QWORD *)&xmmword_2549DE560 + 1) = v24;
  *(_QWORD *)&xmmword_2549DE620 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("v_normalEye"), a4, objc_msgSend(a4, "index"));
  *((_QWORD *)&xmmword_2549DE620 + 1) = v25;
  *(_QWORD *)&xmmword_2549DE570 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", CFSTR("modelview matrix"), a3, objc_msgSend(a3, "index"));
  *((_QWORD *)&xmmword_2549DE570 + 1) = v26;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GLKEffect %p: %@"), self, self->_label);
}

- (GLKBigInt_s)vshMasks
{
  return (GLKBigInt_s *)&__vshMasks;
}

- (GLKBigInt_s)fshMasks
{
  return (GLKBigInt_s *)&__fshMasks;
}

- (unsigned)vshMaskCt
{
  return 10;
}

- (unsigned)fshMaskCt
{
  return 11;
}

- (char)vshMaskStr
{
  return &__vshMaskStr;
}

- (char)fshMaskStr
{
  return &__fshMaskStr;
}

- (void)dealloc
{
  void *v3;
  void *i;
  void *v5;
  objc_super v6;

  free(self->_vshMask);
  free(self->_fshMask);
  free(self->_vshStrings);
  free(self->_fshStrings);
  free(self->_effectShaderArray);

  v3 = (void *)-[NSMutableDictionary objectEnumerator](self->_programHash, "objectEnumerator");
  for (i = v3; ; v3 = i)
  {
    v5 = (void *)objc_msgSend(v3, "nextObject");
    if (!v5)
      break;
    glDeleteProgram(objc_msgSend(v5, "intValue"));
  }

  v6.receiver = self;
  v6.super_class = (Class)GLKEffect;
  -[GLKEffect dealloc](&v6, sel_dealloc);
}

- (NSMutableArray)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSMutableDictionary)programHash
{
  return self->_programHash;
}

- (unsigned)perVertexLightingEnabled
{
  return self->_perVertexLightingEnabled;
}

- (unsigned)perPixelLightingEnabled
{
  return self->_perPixelLightingEnabled;
}

- (unsigned)numLights
{
  return self->_numLights;
}

- (void)setNumLights:(unsigned int)a3
{
  self->_numLights = a3;
}

- (unsigned)numTextures
{
  return self->_numTextures;
}

- (void)setNumTextures:(unsigned int)a3
{
  self->_numTextures = a3;
}

- (unsigned)colorMaterialEnabled
{
  return self->_colorMaterialEnabled;
}

- (unsigned)lightModelTwoSided
{
  return self->_lightModelTwoSided;
}

- (_GLKVector4)lightModelAmbientColor
{
  _GLKVector4 result;

  *(_QWORD *)&result.v[2] = a2;
  *(_QWORD *)&result.x = self;
  return result;
}

- (unsigned)texturingEnabled
{
  return self->_texturingEnabled;
}

- (void)setTexturingEnabled:(unsigned __int8)a3
{
  self->_texturingEnabled = a3;
}

- (float)materialAmbientColor
{
  return self->_materialAmbientColor;
}

- (float)materialDiffuseColor
{
  return self->_materialDiffuseColor;
}

- (_GLKVector4)baseLightingColor
{
  _GLKVector4 result;

  *(_QWORD *)&result.v[2] = a2;
  *(_QWORD *)&result.x = self;
  return result;
}

- (void)setBaseLightingColor:(_GLKVector4)a3
{
  float v3;
  float v4;
  float v5;
  float v6;

  self->_baseLightingColor.x = v3;
  self->_baseLightingColor.y = v4;
  self->_baseLightingColor.z = v5;
  self->_baseLightingColor.w = v6;
}

- (unsigned)masksInitialized
{
  return self->_masksInitialized;
}

- (void)setMasksInitialized:(unsigned __int8)a3
{
  self->_masksInitialized = a3;
}

- (int)aColorLoc
{
  return self->_aColorLoc;
}

- (void)setAColorLoc:(int)a3
{
  self->_aColorLoc = a3;
}

- (id)effectShaderArray
{
  return self->_effectShaderArray;
}

- (void)setEffectShaderArray:(id *)a3
{
  self->_effectShaderArray = a3;
}

- (NSMutableArray)lightProperties
{
  return self->_lightProperties;
}

- (void)setLightProperties:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (NSArray)textureOrder
{
  return self->_textureOrder;
}

- (GLKShaderBlockNode)vshRootNode
{
  return self->_vshRootNode;
}

- (GLKShaderBlockNode)fshRootNode
{
  return self->_fshRootNode;
}

- (unsigned)vshName
{
  return self->_vshName;
}

- (void)setVshName:(unsigned int)a3
{
  self->_vshName = a3;
}

- (unsigned)fshName
{
  return self->_fshName;
}

- (void)setFshName:(unsigned int)a3
{
  self->_fshName = a3;
}

- (unsigned)programName
{
  return self->_programName;
}

- (void)setProgramName:(unsigned int)a3
{
  self->_programName = a3;
}

- (char)vshStrings
{
  return self->_vshStrings;
}

- (void)setVshStrings:(char *)a3
{
  self->_vshStrings = a3;
}

- (char)fshStrings
{
  return self->_fshStrings;
}

- (void)setFshStrings:(char *)a3
{
  self->_fshStrings = a3;
}

- (unsigned)numVshStrings
{
  return self->_numVshStrings;
}

- (void)setNumVshStrings:(unsigned int)a3
{
  self->_numVshStrings = a3;
}

- (unsigned)numFshStrings
{
  return self->_numFshStrings;
}

- (void)setNumFshStrings:(unsigned int)a3
{
  self->_numFshStrings = a3;
}

- (unint64_t)dirtyUniforms
{
  return self->_dirtyUniforms;
}

- (void)setDirtyUniforms:(unint64_t)a3
{
  self->_dirtyUniforms = a3;
}

- (BOOL)textureOrderStale
{
  return self->_textureOrderStale;
}

- (void)setTextureOrderStale:(BOOL)a3
{
  self->_textureOrderStale = a3;
}

- (int)lightModelAmbientColorLoc
{
  return self->_lightModelAmbientColorLoc;
}

- (void)setLightModelAmbientColorLoc:(int)a3
{
  self->_lightModelAmbientColorLoc = a3;
}

- (int)baseLightingColorLoc
{
  return self->_baseLightingColorLoc;
}

- (void)setBaseLightingColorLoc:(int)a3
{
  self->_baseLightingColorLoc = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (GLKBigInt_s)fshMask
{
  return self->_fshMask;
}

- (void)setFshMask:(GLKBigInt_s *)a3
{
  self->_fshMask = a3;
}

- (GLKBigInt_s)vshMask
{
  return self->_vshMask;
}

- (void)setVshMask:(GLKBigInt_s *)a3
{
  self->_vshMask = a3;
}

- (GLKBigInt_s)prevFshMask
{
  unint64_t n1;
  unint64_t n0;
  GLKBigInt_s result;

  n1 = self->_prevFshMask.n1;
  n0 = self->_prevFshMask.n0;
  result.n1 = n1;
  result.n0 = n0;
  return result;
}

- (void)setPrevFshMask:(GLKBigInt_s)a3
{
  self->_prevFshMask = a3;
}

- (GLKBigInt_s)prevVshMask
{
  unint64_t n1;
  unint64_t n0;
  GLKBigInt_s result;

  n1 = self->_prevVshMask.n1;
  n0 = self->_prevVshMask.n0;
  result.n1 = n1;
  result.n0 = n0;
  return result;
}

- (void)setPrevVshMask:(GLKBigInt_s)a3
{
  self->_prevVshMask = a3;
}

@end
