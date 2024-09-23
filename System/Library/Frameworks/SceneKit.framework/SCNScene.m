@implementation SCNScene

double __24__SCNScene_setFogColor___block_invoke(uint64_t a1)
{
  unint64_t v2;
  double result;
  __n128 v4;

  v4.n128_u64[0] = C3DColor4FromRGBCFColor(*(const void **)(a1 + 32), 0);
  v4.n128_u64[1] = v2;
  *(_QWORD *)&result = C3DSceneSetFogColor((__n128 *)*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), &v4).n128_u64[0];
  return result;
}

- (void)__CFObject
{
  return self->_scene;
}

- (SCNNode)rootNode
{
  __C3DScene *v3;
  uint64_t v4;
  __C3DScene *scene;

  if (!self->_rootNode)
  {
    v3 = -[SCNScene sceneRef](self, "sceneRef");
    v4 = (uint64_t)v3;
    if (v3)
      C3DSceneLock((uint64_t)v3);
    if (!self->_rootNode)
    {
      scene = self->_scene;
      if (scene)
      {
        C3DSceneLock((uint64_t)scene);
        if (C3DSceneGetRootNode((uint64_t)self->_scene))
          self->_rootNode = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:");
        else
          -[SCNScene _setRootNode:](self, "_setRootNode:", +[SCNNode node](SCNNode, "node"));
        C3DSceneUnlock((uint64_t)self->_scene);
      }
    }
    if (v4)
      C3DSceneUnlock(v4);
  }
  return self->_rootNode;
}

- (id)attributeForKey:(NSString *)key
{
  void *v5;
  void *v7;

  if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("kSceneStartTimeAttributeKey")))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[SCNScene startTime](self, "startTime");
    return (id)objc_msgSend(v5, "numberWithDouble:");
  }
  if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("kSceneEndTimeAttributeKey")))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[SCNScene endTime](self, "endTime");
    return (id)objc_msgSend(v5, "numberWithDouble:");
  }
  if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("kSceneFrameRateAttributeKey")))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[SCNScene frameRate](self, "frameRate");
    return (id)objc_msgSend(v5, "numberWithDouble:");
  }
  if (!-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("kSceneUpAxisAttributeKey")))
    return (id)-[NSMutableDictionary objectForKey:](self->_userAttributes, "objectForKey:", key);
  v7 = (void *)MEMORY[0x1E0CB3B18];
  -[SCNScene upAxis](self, "upAxis");
  return (id)objc_msgSend(v7, "valueWithSCNVector3:");
}

- (SCNVector3)upAxis
{
  __C3DScene *scene;
  float v3;
  float v4;
  float v5;
  __n128 v6;
  SCNVector3 result;

  scene = self->_scene;
  if (scene)
  {
    v6.n128_u32[2] = 0;
    v6.n128_u64[0] = 0;
    C3DSceneGetUpAxis((__n128 *)scene, &v6);
    v4 = v6.n128_f32[1];
    v3 = v6.n128_f32[0];
    v5 = v6.n128_f32[2];
  }
  else
  {
    v4 = 1.0;
    v5 = 0.0;
    v3 = 0.0;
  }
  result.z = v5;
  result.y = v4;
  result.x = v3;
  return result;
}

+ (SCNScene)scene
{
  return (SCNScene *)objc_alloc_init((Class)a1);
}

- (SCNScene)init
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNScene;
  v2 = -[SCNScene init](&v8, sel_init);
  if (v2)
  {
    v3 = C3DSceneCreate();
    *((_QWORD *)v2 + 1) = v3;
    if (v3)
      C3DEntitySetObjCWrapper(v3, v2);
    objc_msgSend(v2, "_syncObjCModel");
    if (!*((_QWORD *)v2 + 4))
    {
      v4 = objc_msgSend(v2, "sceneRef");
      v5 = v4;
      if (v4)
        C3DSceneLock(v4);
      if (!*((_QWORD *)v2 + 4))
      {
        v6 = *((_QWORD *)v2 + 1);
        if (v6)
        {
          C3DSceneLock(v6);
          if (C3DSceneGetRootNode(*((_QWORD *)v2 + 1)))
            *((_QWORD *)v2 + 4) = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:");
          else
            objc_msgSend(v2, "_setRootNode:", +[SCNNode node](SCNNode, "node"));
          C3DSceneUnlock(*((_QWORD *)v2 + 1));
        }
      }
      if (v5)
        C3DSceneUnlock(v5);
    }
  }
  return (SCNScene *)v2;
}

- (void)_syncObjCModel
{
  uint64_t FogColor;

  self->_fogStartDistance = C3DSceneGetFogStartDistance((uint64_t)self->_scene);
  self->_fogEndDistance = C3DSceneGetFogEndDistance((uint64_t)self->_scene);
  self->_fogDensityExponent = C3DSceneGetFogDensityExponent((uint64_t)self->_scene);
  self->_wantsScreenSpaceReflection = C3DSceneGetWantsSSR((uint64_t)self->_scene);
  self->_screenSpaceReflectionSampleCount = C3DSceneGetSSRSampleCount((uint64_t)self->_scene);
  self->_screenSpaceReflectionMaxRayDistance = C3DSceneGetSSRMaxRayDistance((uint64_t)self->_scene);
  self->_screenSpaceReflectionStride = C3DSceneGetSSRStride((uint64_t)self->_scene);
  FogColor = C3DSceneGetFogColor((uint64_t)self->_scene);

  self->_fogColor = (id)objc_msgSend(MEMORY[0x1E0CEA478], "scn_colorWithC3DColor:", FogColor);
}

- (void)_setRootNode:(id)a3
{
  SCNNode *rootNode;
  __C3DScene *v6;
  uint64_t v7;

  rootNode = self->_rootNode;
  if (rootNode != a3)
  {

    self->_rootNode = (SCNNode *)a3;
    self->_layerRootNode[0] = (SCNNode *)a3;
    v6 = -[SCNScene sceneRef](self, "sceneRef");
    if (v6)
    {
      v7 = (uint64_t)v6;
      C3DSceneLock((uint64_t)v6);
      C3DSceneSetRootNode((uint64_t)self->_scene, (uint64_t *)objc_msgSend(a3, "nodeRef"));
      C3DSceneUnlock(v7);
    }
    else
    {
      C3DSceneSetRootNode((uint64_t)self->_scene, (uint64_t *)objc_msgSend(a3, "nodeRef"));
    }
  }
}

- (__C3DScene)sceneRef
{
  return self->_scene;
}

- (SCNMaterialProperty)background
{
  SCNMaterialProperty *result;

  result = self->_background;
  if (!result)
  {
    result = -[SCNMaterialProperty initWithParent:propertyType:]([SCNMaterialProperty alloc], "initWithParent:propertyType:", self, 24);
    self->_background = result;
  }
  return result;
}

- (SCNMaterialProperty)lightingEnvironment
{
  SCNMaterialProperty *result;

  result = self->_environment;
  if (!result)
  {
    result = -[SCNMaterialProperty initWithParent:propertyType:]([SCNMaterialProperty alloc], "initWithParent:propertyType:", self, 25);
    self->_environment = result;
  }
  return result;
}

- (void)setFogColor:(id)fogColor
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_fogColor != fogColor && (objc_msgSend(fogColor, "isEqual:") & 1) == 0)
  {

    self->_fogColor = fogColor;
    v5 = -[SCNScene sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __24__SCNScene_setFogColor___block_invoke;
    v6[3] = &unk_1EA59F740;
    v6[4] = fogColor;
    v6[5] = self;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("fogColor"), v6);
  }
}

+ (SCNScene)sceneWithMDLAsset:(MDLAsset *)mdlAsset
{
  return (SCNScene *)objc_msgSend(a1, "sceneWithMDLAsset:options:", mdlAsset, 0);
}

+ (SCNScene)sceneWithMDLAsset:(id)a3 options:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  double v9;
  double v10;
  int v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  float v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  uint64_t v52;
  double v53;
  double v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  char *v77;
  int v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  char *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t k;
  uint64_t *v104;
  void *v105;
  uint64_t *v106;
  uint64_t *v107;
  BOOL v108;
  SCNScene *v109;
  void *v111;
  id v112;
  id v113;
  uint64_t v114;
  void *v116;
  id obj;
  id v118;
  uint64_t v119;
  uint64_t v120;
  int v121;
  uint64_t v122;
  void *v123;
  int v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  uint64_t *v141;
  _QWORD *v142[2];
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  void *v147;
  void *v148;
  void *memptr;
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  uint64_t v154;

  v154 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = objc_opt_new();
  obj = (id)objc_opt_new();
  v8 = objc_alloc_init((Class)a1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "upAxis");
    LODWORD(v10) = HIDWORD(v9);
    LODWORD(v12) = v11;
    objc_msgSend(v8, "setAttribute:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSCNVector3:", v9, v10, v12), CFSTR("kSceneUpAxisAttributeKey"));
  }
  v116 = (void *)v7;
  v142[0] = 0;
  v142[1] = 0;
  v141 = (uint64_t *)v142;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v137, v152, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v138;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v138 != v14)
          objc_enumerationMutation(a3);
        objc_msgSend((id)objc_msgSend(v8, "rootNode"), "addChildNode:", +[SCNNode nodeWithMDLObject:masterObjects:sceneNodes:skinnedMeshes:skelNodesMap:asset:options:](SCNNode, "nodeWithMDLObject:masterObjects:sceneNodes:skinnedMeshes:skelNodesMap:asset:options:", *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * i), v6, v7, obj, &v141, a3, a4));
      }
      v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v137, v152, 16);
    }
    while (v13);
  }

  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  v16 = (void *)v7;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v151, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v134;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v134 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * j);
        v21 = (void *)objc_msgSend(v116, "objectForKeyedSubscript:", objc_msgSend(v20, "path"));
        if (v21)
          objc_msgSend(v21, "_addSkinnerWithMDLMesh:sceneNodes:", v20, v116);
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v151, 16);
    }
    while (v17);
  }
  if (objc_msgSend((id)objc_msgSend(a3, "animations"), "count"))
  {
    v22 = (void *)objc_opt_new();
    v23 = 0;
    v113 = a3;
    v111 = v22;
    v122 = *MEMORY[0x1E0CD2B58];
    v112 = v8;
    while (v23 < objc_msgSend((id)objc_msgSend(a3, "animations"), "count"))
    {
      v24 = (void *)objc_msgSend((id)objc_msgSend(a3, "animations"), "objectAtIndexedSubscript:", v23);
      if (v24)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v128 = v24;
          v121 = objc_msgSend((id)objc_msgSend(v24, "jointPaths"), "count");
          if (v121)
          {
            v25 = (void *)objc_msgSend(a4, "valueForKey:", CFSTR("kSceneSourceAnimationLoadingMode"));
            v26 = v25;
            if (v25)
            {
              v27 = 0.0;
              if ((objc_msgSend(v25, "isEqualToString:", CFSTR("playOnce")) & 1) != 0)
              {
                v124 = 0;
                v114 = 1;
              }
              else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("playUsingSceneTime")) & 1) != 0)
              {
                v114 = 0;
                v124 = 1;
              }
              else
              {
                HIDWORD(v114) = objc_msgSend(v26, "isEqualToString:", CFSTR("keepSeparate"));
                LODWORD(v114) = 0;
                v124 = 0;
                if (HIDWORD(v114))
                  v27 = 0.0;
                else
                  v27 = INFINITY;
              }
            }
            else
            {
              v114 = 0;
              v124 = 0;
              v27 = INFINITY;
            }
            memptr = 0;
            v147 = 0;
            v148 = 0;
            v125 = (void *)objc_msgSend((id)objc_msgSend(v128, "translations"), "keyTimes");
            v127 = (void *)objc_msgSend((id)objc_msgSend(v128, "rotations"), "keyTimes");
            v126 = (void *)objc_msgSend((id)objc_msgSend(v128, "scales"), "keyTimes");
            v28 = v127 != 0;
            if (v125)
              ++v28;
            if (v126)
              v29 = v28 + 1;
            else
              v29 = v28;
            v30 = objc_msgSend(v125, "count");
            v31 = objc_msgSend(v127, "count");
            v32 = objc_msgSend(v126, "count");
            v33 = v30 * v121;
            if (v125)
              malloc_type_posix_memalign(&memptr, 0x10uLL, 16 * v33, 0x1000040451B5BE8uLL);
            v34 = v31 * v121;
            if (v127)
              malloc_type_posix_memalign(&v148, 0x10uLL, 16 * v34, 0x1000040451B5BE8uLL);
            v35 = v32 * v121;
            if (v126)
              malloc_type_posix_memalign(&v147, 0x10uLL, 16 * v35, 0x1000040451B5BE8uLL);
            if (memptr)
            {
              v36 = (void *)objc_msgSend(v128, "translations");
              objc_msgSend(v36, "getFloat3Array:maxCount:", memptr, v33);
            }
            if (v148)
            {
              v37 = (void *)objc_msgSend(v128, "rotations");
              objc_msgSend(v37, "getFloatQuaternionArray:maxCount:", v148, v34);
            }
            if (v147)
            {
              v38 = (void *)objc_msgSend(v128, "scales");
              objc_msgSend(v38, "getFloat3Array:maxCount:", v147, v35);
            }
            objc_msgSend((id)objc_msgSend(v128, "translations"), "maximumTime");
            v40 = v39;
            objc_msgSend((id)objc_msgSend(v128, "translations"), "minimumTime");
            v42 = v41;
            objc_msgSend((id)objc_msgSend(v128, "rotations"), "maximumTime");
            v44 = v43;
            objc_msgSend((id)objc_msgSend(v128, "rotations"), "minimumTime");
            v46 = v45;
            objc_msgSend((id)objc_msgSend(v128, "scales"), "maximumTime");
            v48 = v47;
            objc_msgSend((id)objc_msgSend(v128, "scales"), "minimumTime");
            v50 = v49;
            v123 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(v128, "jointPaths"), "count") * v29);
            v145 = 0u;
            v146 = 0u;
            v143 = 0u;
            v144 = 0u;
            v51 = (void *)objc_msgSend(v128, "jointPaths");
            v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v143, v153, 16);
            v53 = v40 - v42;
            v54 = v44 - v46;
            if (v52)
            {
              v55 = 0;
              v118 = v51;
              v119 = *(_QWORD *)v144;
              do
              {
                v56 = 0;
                v57 = (16 * v55) | 8;
                v120 = v52;
                do
                {
                  if (*(_QWORD *)v144 != v119)
                    objc_enumerationMutation(v118);
                  v58 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * v56);
                  if (v125)
                  {
                    v59 = (void *)MEMORY[0x1E0CB3940];
                    v60 = objc_msgSend(*(id *)(*((_QWORD *)&v143 + 1) + 8 * v56), "rangeOfString:options:", CFSTR("/"), 4);
                    v61 = (uint64_t)v58;
                    if (v60 != 0x7FFFFFFFFFFFFFFFLL)
                      v61 = objc_msgSend(v58, "substringFromIndex:", v60 + 1);
                    v62 = objc_msgSend(v59, "stringWithFormat:", CFSTR("/%@.position"), v61);
                    v63 = (void *)objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", v62);
                    objc_msgSend(v63, "setDuration:", v53);
                    objc_msgSend((id)objc_msgSend(v128, "translations"), "minimumTime");
                    v65 = v64;
                    v66 = 0.0;
                    if ((v124 & 1) == 0)
                      objc_msgSend((id)objc_msgSend(v128, "translations", 0.0), "minimumTime");
                    objc_msgSend(v63, "setBeginTime:", v65 - v66);
                    objc_msgSend((id)objc_msgSend(v128, "translations"), "minimumTime");
                    objc_msgSend(v63, "setFillMode:", v122);
                    objc_msgSend(v63, "setRemovedOnCompletion:", 0);
                    objc_msgSend(v123, "addObject:", v63);
                  }
                  if (v127)
                  {
                    v68 = (void *)MEMORY[0x1E0CD2798];
                    v69 = (void *)MEMORY[0x1E0CB3940];
                    v70 = objc_msgSend(v58, "rangeOfString:options:", CFSTR("/"), 4);
                    v71 = (uint64_t)v58;
                    if (v70 != 0x7FFFFFFFFFFFFFFFLL)
                      v71 = objc_msgSend(v58, "substringFromIndex:", v70 + 1);
                    v72 = (void *)objc_msgSend(v68, "animationWithKeyPath:", objc_msgSend(v69, "stringWithFormat:", CFSTR("/%@.orientation"), v71));
                    objc_msgSend(v72, "setDuration:", v54);
                    objc_msgSend((id)objc_msgSend(v128, "rotations"), "minimumTime");
                    v74 = v73;
                    v75 = 0.0;
                    if ((v124 & 1) == 0)
                      objc_msgSend((id)objc_msgSend(v128, "rotations", 0.0), "minimumTime");
                    objc_msgSend(v72, "setBeginTime:", v74 - v75);
                    objc_msgSend((id)objc_msgSend(v128, "rotations"), "minimumTime");
                    v77 = (char *)v148;
                    v78 = objc_msgSend(v127, "count");
                    v79 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v78);
                    if (v78 >= 1)
                    {
                      v84 = &v77[v57];
                      do
                      {
                        LODWORD(v80) = *((_DWORD *)v84 - 2);
                        LODWORD(v81) = *((_DWORD *)v84 - 1);
                        LODWORD(v82) = *(_DWORD *)v84;
                        LODWORD(v83) = *((_DWORD *)v84 + 1);
                        objc_msgSend(v79, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSCNVector4:", v80, v81, v82, v83));
                        v84 += 16 * v121;
                        --v78;
                      }
                      while (v78);
                    }
                    objc_msgSend(v72, "setValues:", v79);
                    objc_msgSend(v72, "setFillMode:", v122);
                    objc_msgSend(v72, "setRemovedOnCompletion:", 0);
                    objc_msgSend(v123, "addObject:", v72);
                  }
                  if (v126)
                  {
                    v85 = (void *)MEMORY[0x1E0CD2798];
                    v86 = (void *)MEMORY[0x1E0CB3940];
                    v87 = objc_msgSend(v58, "rangeOfString:options:", CFSTR("/"), 4);
                    if (v87 != 0x7FFFFFFFFFFFFFFFLL)
                      v58 = (void *)objc_msgSend(v58, "substringFromIndex:", v87 + 1);
                    v88 = (void *)objc_msgSend(v85, "animationWithKeyPath:", objc_msgSend(v86, "stringWithFormat:", CFSTR("/%@.scale"), v58));
                    objc_msgSend(v88, "setDuration:", v48 - v50);
                    objc_msgSend((id)objc_msgSend(v128, "scales"), "minimumTime");
                    v90 = v89;
                    v91 = 0.0;
                    if ((v124 & 1) == 0)
                      objc_msgSend((id)objc_msgSend(v128, "scales", 0.0), "minimumTime");
                    objc_msgSend(v88, "setBeginTime:", v90 - v91);
                    objc_msgSend((id)objc_msgSend(v128, "scales"), "minimumTime");
                    objc_msgSend(v88, "setFillMode:", v122);
                    objc_msgSend(v88, "setRemovedOnCompletion:", 0);
                    objc_msgSend(v123, "addObject:", v88);
                  }
                  ++v55;
                  ++v56;
                  v57 += 16;
                }
                while (v56 != v120);
                v52 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v143, v153, 16);
              }
              while (v52);
            }
            free(memptr);
            free(v148);
            free(v147);
            v8 = v112;
            a3 = v113;
            v16 = v116;
            v22 = v111;
            v93 = (void *)objc_msgSend(MEMORY[0x1E0CD2700], "animation");
            objc_msgSend(v93, "setAnimations:", v123);
            objc_msgSend(v93, "setFillMode:", v122);
            *(float *)&v94 = v27;
            objc_msgSend(v93, "setRepeatCount:", v94);
            objc_msgSend(v93, "setRemovedOnCompletion:", v114);
            objc_msgSend(v93, "setUsesSceneTimeBase:", v124 | HIDWORD(v114));
            if (v124)
            {
              objc_msgSend((id)objc_msgSend(v128, "translations"), "maximumTime");
              v96 = v95;
              objc_msgSend((id)objc_msgSend(v128, "rotations"), "maximumTime");
              v98 = v97;
              objc_msgSend((id)objc_msgSend(v128, "scales"), "maximumTime");
              if (v96 >= v98)
                v100 = v96;
              else
                v100 = v98;
              if (v100 >= v99)
                v99 = v100;
            }
            else
            {
              if (v53 >= v54)
                v99 = v53;
              else
                v99 = v54;
              if (v99 < v48 - v50)
                v99 = v48 - v50;
            }
            objc_msgSend(v93, "setDuration:", v99);
            if (v93)
              objc_msgSend(v111, "setObject:forKeyedSubscript:", +[SCNAnimation animationWithCAAnimation:](SCNAnimation, "animationWithCAAnimation:", v93), objc_msgSend(v128, "name"));
          }
        }
      }
      ++v23;
    }
  }
  else
  {
    v22 = 0;
  }
  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  v101 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v129, v150, 16);
  if (v101)
  {
    v102 = *(_QWORD *)v130;
    do
    {
      for (k = 0; k != v101; ++k)
      {
        if (*(_QWORD *)v130 != v102)
          objc_enumerationMutation(a3);
      }
      v101 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v129, v150, 16);
    }
    while (v101);
  }
  v104 = v141;
  if (v141 != (uint64_t *)v142)
  {
    do
    {
      v105 = (void *)v104[5];
      if (v105)

      v106 = (uint64_t *)v104[1];
      if (v106)
      {
        do
        {
          v107 = v106;
          v106 = (uint64_t *)*v106;
        }
        while (v106);
      }
      else
      {
        do
        {
          v107 = (uint64_t *)v104[2];
          v108 = *v107 == (_QWORD)v104;
          v104 = v107;
        }
        while (!v108);
      }
      v104 = v107;
    }
    while (v107 != (uint64_t *)v142);
  }
  if (v22)

  objc_msgSend(v8, "_resetSceneTimeRange");
  objc_msgSend(a3, "startTime");
  objc_msgSend(v8, "setStartTime:");
  objc_msgSend(a3, "endTime");
  objc_msgSend(v8, "setEndTime:");
  v109 = (SCNScene *)v8;
  return v109;
}

- (SCNScene)initWithSceneRef:(__C3DScene *)a3
{
  id v4;
  CFTypeRef v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNScene;
  v4 = -[SCNScene init](&v8, sel_init);
  if (v4)
  {
    v5 = CFRetain(a3);
    *((_QWORD *)v4 + 1) = v5;
    if (v5)
      C3DEntitySetObjCWrapper((uint64_t)v5, v4);
    objc_msgSend(v4, "_syncObjCModel");
    if (!*((_QWORD *)v4 + 4))
    {
      v6 = *((_QWORD *)v4 + 1);
      if (v6)
      {
        C3DSceneLock(v6);
        if (C3DSceneGetRootNode(*((_QWORD *)v4 + 1)))
          *((_QWORD *)v4 + 4) = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:");
        else
          objc_msgSend(v4, "_setRootNode:", +[SCNNode node](SCNNode, "node"));
        C3DSceneUnlock(*((_QWORD *)v4 + 1));
      }
    }
  }
  return (SCNScene *)v4;
}

+ (SCNScene)sceneNamed:(NSString *)name
{
  return (SCNScene *)objc_msgSend(a1, "sceneNamed:inDirectory:options:", name, 0, 0);
}

+ (SCNScene)sceneNamed:(NSString *)name inDirectory:(NSString *)directory options:(NSDictionary *)options
{
  __CFString *v9;
  SCNScene *result;

  v9 = -[NSString pathExtension](name, "pathExtension");
  if (!-[__CFString length](v9, "length"))
    v9 = CFSTR("dae");
  result = (SCNScene *)objc_msgSend((id)SCNGetResourceBundle(), "URLForResource:withExtension:subdirectory:", -[NSString stringByDeletingPathExtension](name, "stringByDeletingPathExtension"), v9, directory);
  if (result)
    return (SCNScene *)objc_msgSend(a1, "sceneWithURL:options:error:", result, options, 0);
  return result;
}

+ (id)sceneNamed:(id)a3 options:(id)a4
{
  return (id)objc_msgSend(a1, "sceneNamed:inDirectory:options:", a3, 0, a4);
}

+ (SCNScene)sceneWithURL:(id)a3 options:(id)a4
{
  return (SCNScene *)objc_msgSend(a1, "sceneWithURL:options:error:", a3, a4, 0);
}

+ (SCNScene)sceneWithURL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)error
{
  SCNSceneSource *v8;

  if (url
    && (v8 = +[SCNSceneSource sceneSourceWithURL:options:](SCNSceneSource, "sceneSourceWithURL:options:", -[NSURL URLByResolvingSymlinksInPath](url, "URLByResolvingSymlinksInPath"), options)) != 0)
  {
    return (SCNScene *)-[SCNSceneSource sceneWithClass:options:error:](v8, "sceneWithClass:options:error:", a1, options, error);
  }
  else
  {
    return 0;
  }
}

+ (SCNScene)sceneWithURL:(id)a3 atIndex:(int64_t)a4 options:(id)a5
{
  void *v8;

  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a5);
  objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4), CFSTR("kSceneSourceSceneIndexKey"));
  return (SCNScene *)objc_msgSend(a1, "sceneWithURL:options:error:", a3, v8, 0);
}

+ (SCNScene)sceneWithData:(id)a3 atIndex:(int64_t)a4 options:(id)a5
{
  void *v8;

  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a5);
  objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4), CFSTR("kSceneSourceSceneIndexKey"));
  return (SCNScene *)objc_msgSend(a1, "sceneWithData:options:", a3, v8);
}

+ (SCNScene)sceneWithData:(id)a3 options:(id)a4
{
  SCNScene *result;

  result = +[SCNSceneSource sceneSourceWithData:options:](SCNSceneSource, "sceneSourceWithData:options:", a3);
  if (result)
    return -[SCNScene sceneWithClass:options:error:](result, "sceneWithClass:options:error:", a1, a4, 0);
  return result;
}

+ (SCNScene)sceneWithSceneRef:(__C3DScene *)a3
{
  SCNScene *result;

  result = (SCNScene *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
    return (SCNScene *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithSceneRef:", a3);
  return result;
}

- (void)_clearSceneRef
{
  __C3DScene *scene;
  __C3DScene *v4;

  scene = self->_scene;
  if (scene)
  {
    C3DEntitySetObjCWrapper((uint64_t)scene, 0);
    v4 = self->_scene;
    if (v4)
      CFRelease(v4);
    self->_scene = 0;
  }
}

- (void)setUpAxis:(SCNVector3)a3
{
  __C3DScene *scene;
  float y;
  __n128 v5;

  scene = self->_scene;
  if (scene)
  {
    y = a3.y;
    v5.n128_u32[2] = LODWORD(a3.z);
    v5.n128_u64[0] = *(_QWORD *)&a3.x;
    C3DSceneSetUpAxis((__n128 *)scene, &v5);
  }
}

- (void)dealloc
{
  __C3DScene *scene;
  __C3DScene *v4;
  uint64_t i;
  objc_super v6;
  _QWORD v7[5];

  -[SCNPhysicsWorld sceneWillDie](self->_physicsWorld, "sceneWillDie");
  scene = self->_scene;
  if (scene)
  {
    C3DEntitySetObjCWrapper((uint64_t)scene, 0);
    v4 = self->_scene;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __19__SCNScene_dealloc__block_invoke;
    v7[3] = &__block_descriptor_40_e8_v16__0d8l;
    v7[4] = v4;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, 0, v7);
  }

  -[SCNMaterialProperty parentWillDie:](self->_background, "parentWillDie:", self);
  -[SCNMaterialProperty parentWillDie:](self->_environment, "parentWillDie:", self);

  for (i = 40; i != 72; i += 8)
  v6.receiver = self;
  v6.super_class = (Class)SCNScene;
  -[SCNScene dealloc](&v6, sel_dealloc);
}

void __19__SCNScene_dealloc__block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (void)_setSourceURL:(id)a3
{
  NSURL *sourceURL;

  sourceURL = self->_sourceURL;
  if (sourceURL != a3)
  {

    self->_sourceURL = (NSURL *)a3;
  }
}

- (id)_scenes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", self);
}

- (void)setSceneSource:(id)a3
{
  SCNSceneSource *sceneSource;

  sceneSource = self->_sceneSource;
  if (sceneSource != a3)
  {

    self->_sceneSource = (SCNSceneSource *)a3;
  }
}

- (id)sceneSource
{
  return self->_sceneSource;
}

- (id)root
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((root_done & 1) == 0)
  {
    root_done = 1;
    v3 = scn_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[SCNScene root].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  return -[SCNScene rootNode](self, "rootNode");
}

- (void)setRootNode:(id)a3 forLayer:(int)a4
{
  SCNNode **layerRootNode;
  SCNNode *v5;
  __C3DScene *v9;
  uint64_t v10;

  layerRootNode = self->_layerRootNode;
  v5 = self->_layerRootNode[a4];
  if (v5 != a3)
  {
    if (a4)
    {

      layerRootNode[a4] = (SCNNode *)a3;
      v9 = -[SCNScene sceneRef](self, "sceneRef");
      if (v9)
      {
        v10 = (uint64_t)v9;
        C3DSceneLock((uint64_t)v9);
        C3DSceneSetLayerRootNode((uint64_t)self->_scene, a4, (void *)objc_msgSend(a3, "nodeRef"));
        C3DSceneUnlock(v10);
      }
      else
      {
        C3DSceneSetLayerRootNode((uint64_t)self->_scene, a4, (void *)objc_msgSend(a3, "nodeRef"));
      }
    }
    else
    {
      -[SCNScene _setRootNode:](self, "_setRootNode:", a3);
    }
  }
}

- (id)rootNodeForLayer:(int)a3
{
  return self->_layerRootNode[a3];
}

- (void)_scaleSceneBy:(double)a3
{
  __C3DScene *v5;
  _QWORD v6[6];

  v5 = -[SCNScene sceneRef](self, "sceneRef");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__SCNScene__scaleSceneBy___block_invoke;
  v6[3] = &unk_1EA59E450;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, 0, v6);
}

float __26__SCNScene__scaleSceneBy___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "sceneRef");
  v3 = *(double *)(a1 + 40);
  C3DApplyScaleFactorOnScene(v2, v3);
  return result;
}

+ (BOOL)canImportFileUTI:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("org.khronos.collada.digital-asset-exchange")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a3, "hasPrefix:", CFSTR("com.apple.scenekit"));
}

+ (BOOL)canImportFileExtension:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "lowercaseString");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("dae")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("c3d")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("scn")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("scnz")) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(MEMORY[0x1E0CC7780], "canImportFileExtension:", v3);
  }
}

+ (id)supportedFileUTIsForImport
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v2, "addObjectsFromArray:", &unk_1EA5FF6C0);
  return v2;
}

+ (id)supportedFileUTIsForExport
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v2, "addObjectsFromArray:", &unk_1EA5FF6D8);
  return v2;
}

- (SCNPhysicsWorld)physicsWorld
{
  return (SCNPhysicsWorld *)-[SCNScene _physicsWorldCreateIfNeeded:](self, "_physicsWorldCreateIfNeeded:", 1);
}

- (id)_physicsWorldCreateIfNeeded:(BOOL)a3
{
  id result;
  BOOL v5;

  result = self->_physicsWorld;
  if (result)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    result = -[SCNPhysicsWorld initWithScene:]([SCNPhysicsWorld alloc], "initWithScene:", self);
    self->_physicsWorld = (SCNPhysicsWorld *)result;
  }
  return result;
}

- (void)_resetSceneTimeRange
{
  SCNNode *v3;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v3 = -[SCNScene rootNode](self, "rootNode");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__SCNScene__resetSceneTimeRange__block_invoke;
  v4[3] = &unk_1EA5A2418;
  v4[4] = &v9;
  v4[5] = &v5;
  -[SCNNode enumerateHierarchyUsingBlock:](v3, "enumerateHierarchyUsingBlock:", v4);
  -[SCNScene setStartTime:](self, "setStartTime:", v10[3]);
  -[SCNScene setEndTime:](self, "setEndTime:", v6[3]);
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
}

uint64_t __32__SCNScene__resetSceneTimeRange__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (void *)objc_msgSend(a2, "animationKeys", 0);
  result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_msgSend(a2, "animationPlayerForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8));
        if (objc_msgSend((id)objc_msgSend(v9, "animation"), "usesSceneTimeBase"))
        {
          objc_msgSend((id)objc_msgSend(v9, "animation"), "startDelay");
          v11 = v10;
          objc_msgSend((id)objc_msgSend(v9, "animation"), "duration");
          v13 = v11 + v12;
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v15 = *(double *)(v14 + 24);
          if (v11 < v15)
            v15 = v11;
          *(double *)(v14 + 24) = v15;
          v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          if (v13 < *(double *)(v16 + 24))
            v13 = *(double *)(v16 + 24);
          *(double *)(v16 + 24) = v13;
        }
        ++v8;
      }
      while (v6 != v8);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v6 = result;
    }
    while (result);
  }
  return result;
}

- (double)startTime
{
  __C3DScene *v3;
  uint64_t v4;
  double StartTime;

  v3 = -[SCNScene sceneRef](self, "sceneRef");
  if (!v3)
    return C3DSceneGetStartTime((uint64_t)self->_scene);
  v4 = (uint64_t)v3;
  C3DSceneLock((uint64_t)v3);
  StartTime = C3DSceneGetStartTime((uint64_t)self->_scene);
  C3DSceneUnlock(v4);
  return StartTime;
}

- (void)setStartTime:(double)a3
{
  __C3DScene *v5;
  uint64_t v6;

  v5 = -[SCNScene sceneRef](self, "sceneRef");
  if (v5)
  {
    v6 = (uint64_t)v5;
    C3DSceneLock((uint64_t)v5);
    C3DSceneSetStartTime((uint64_t)self->_scene, a3);
    C3DSceneUnlock(v6);
  }
  else
  {
    C3DSceneSetStartTime((uint64_t)self->_scene, a3);
  }
}

- (double)endTime
{
  __C3DScene *v3;
  uint64_t v4;
  double EndTime;

  v3 = -[SCNScene sceneRef](self, "sceneRef");
  if (!v3)
    return C3DSceneGetEndTime((uint64_t)self->_scene);
  v4 = (uint64_t)v3;
  C3DSceneLock((uint64_t)v3);
  EndTime = C3DSceneGetEndTime((uint64_t)self->_scene);
  C3DSceneUnlock(v4);
  return EndTime;
}

- (void)setEndTime:(double)a3
{
  __C3DScene *v5;
  uint64_t v6;

  v5 = -[SCNScene sceneRef](self, "sceneRef");
  if (v5)
  {
    v6 = (uint64_t)v5;
    C3DSceneLock((uint64_t)v5);
    C3DSceneSetEndTime((uint64_t)self->_scene, a3);
    C3DSceneUnlock(v6);
  }
  else
  {
    C3DSceneSetEndTime((uint64_t)self->_scene, a3);
  }
}

- (double)frameRate
{
  __C3DScene *v3;
  uint64_t v4;
  float FrameRate;

  v3 = -[SCNScene sceneRef](self, "sceneRef");
  if (v3)
  {
    v4 = (uint64_t)v3;
    C3DSceneLock((uint64_t)v3);
    FrameRate = C3DSceneGetFrameRate((uint64_t)self->_scene);
    C3DSceneUnlock(v4);
  }
  else
  {
    return C3DSceneGetFrameRate((uint64_t)self->_scene);
  }
  return FrameRate;
}

- (void)setFrameRate:(double)a3
{
  __C3DScene *v5;
  uint64_t v6;
  float v7;
  float v8;

  v5 = -[SCNScene sceneRef](self, "sceneRef");
  if (v5)
  {
    v6 = (uint64_t)v5;
    C3DSceneLock((uint64_t)v5);
    v7 = a3;
    C3DSceneSetFrameRate((uint64_t)self->_scene, v7);
    C3DSceneUnlock(v6);
  }
  else
  {
    v8 = a3;
    C3DSceneSetFrameRate((uint64_t)self->_scene, v8);
  }
}

- (float)playbackSpeed
{
  __C3DScene *v3;
  uint64_t v4;
  float PlaybackSpeed;

  v3 = -[SCNScene sceneRef](self, "sceneRef");
  if (!v3)
    return C3DSceneGetPlaybackSpeed((uint64_t)self->_scene);
  v4 = (uint64_t)v3;
  C3DSceneLock((uint64_t)v3);
  PlaybackSpeed = C3DSceneGetPlaybackSpeed((uint64_t)self->_scene);
  C3DSceneUnlock(v4);
  return PlaybackSpeed;
}

- (void)setPlaybackSpeed:(float)a3
{
  __C3DScene *v5;
  uint64_t v6;

  v5 = -[SCNScene sceneRef](self, "sceneRef");
  if (v5)
  {
    v6 = (uint64_t)v5;
    C3DSceneLock((uint64_t)v5);
    C3DSceneSetPlaybackSpeed((uint64_t)self->_scene, a3);
    C3DSceneUnlock(v6);
  }
  else
  {
    C3DSceneSetPlaybackSpeed((uint64_t)self->_scene, a3);
  }
}

- (void)setAttribute:(id)attribute forKey:(NSString *)key
{
  double v7;
  float v8;
  float v9;
  double v10;
  double v11;
  double v12;
  NSMutableDictionary *userAttributes;

  if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("kSceneStartTimeAttributeKey")))
  {
    objc_msgSend(attribute, "doubleValue");
    -[SCNScene setStartTime:](self, "setStartTime:");
  }
  else if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("kSceneEndTimeAttributeKey")))
  {
    objc_msgSend(attribute, "doubleValue");
    -[SCNScene setEndTime:](self, "setEndTime:");
  }
  else if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("kSceneFrameRateAttributeKey")))
  {
    -[SCNScene frameRate](self, "frameRate");
    v8 = v7;
    objc_msgSend(attribute, "doubleValue");
    -[SCNScene setFrameRate:](self, "setFrameRate:");
    if (v8 != 0.0)
    {
      -[SCNScene playbackSpeed](self, "playbackSpeed");
      v10 = v9;
      objc_msgSend(attribute, "doubleValue");
      v12 = v11 * v10 / v8;
      *(float *)&v12 = v12;
      -[SCNScene setPlaybackSpeed:](self, "setPlaybackSpeed:", v12);
    }
  }
  else if (-[NSString isEqualToString:](key, "isEqualToString:", CFSTR("kSceneUpAxisAttributeKey")))
  {
    objc_msgSend(attribute, "SCNVector3Value");
    -[SCNScene setUpAxis:](self, "setUpAxis:");
  }
  else
  {
    userAttributes = self->_userAttributes;
    if (attribute && !userAttributes)
    {
      userAttributes = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      self->_userAttributes = userAttributes;
    }
    -[NSMutableDictionary setValue:forKey:](userAttributes, "setValue:forKey:", attribute, key);
    if (!-[NSMutableDictionary count](self->_userAttributes, "count"))
    {

      self->_userAttributes = 0;
    }
  }
}

- (BOOL)_allowsDefaultLightingEnvironmentFallback
{
  return self->_allowsDefaultLightingEnvironmentFallback;
}

- (void)set_allowsDefaultLightingEnvironmentFallback:(BOOL)a3
{
  __C3DScene *v5;
  _QWORD v6[5];
  BOOL v7;

  if (self->_allowsDefaultLightingEnvironmentFallback != a3)
  {
    self->_allowsDefaultLightingEnvironmentFallback = a3;
    v5 = -[SCNScene sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__SCNScene_set_allowsDefaultLightingEnvironmentFallback___block_invoke;
    v6[3] = &unk_1EA59E478;
    v6[4] = self;
    v7 = a3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, 0, v6);
  }
}

void __57__SCNScene_set_allowsDefaultLightingEnvironmentFallback___block_invoke(uint64_t a1)
{
  C3DSceneSetAllowsDefaultLightingEnvironmentFallback(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_BYTE *)(a1 + 40));
}

- (id)fogColor
{
  return self->_fogColor;
}

- (CGFloat)fogEndDistance
{
  return self->_fogEndDistance;
}

- (void)setFogEndDistance:(CGFloat)fogEndDistance
{
  CGFloat v3;
  __C3DScene *v5;
  _QWORD v6[6];

  if (fogEndDistance >= 1.0e-35)
    v3 = fogEndDistance;
  else
    v3 = 0.0;
  if (v3 != self->_fogEndDistance)
  {
    self->_fogEndDistance = v3;
    v5 = -[SCNScene sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __30__SCNScene_setFogEndDistance___block_invoke;
    v6[3] = &unk_1EA59E450;
    v6[4] = self;
    *(CGFloat *)&v6[5] = v3;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("fogEndDistance"), v6);
  }
}

float __30__SCNScene_setFogEndDistance___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DSceneSetFogEndDistance(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)fogDensityExponent
{
  return self->_fogDensityExponent;
}

- (void)setFogDensityExponent:(CGFloat)fogDensityExponent
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_fogDensityExponent != fogDensityExponent)
  {
    self->_fogDensityExponent = fogDensityExponent;
    v5 = -[SCNScene sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__SCNScene_setFogDensityExponent___block_invoke;
    v6[3] = &unk_1EA59E450;
    v6[4] = self;
    *(CGFloat *)&v6[5] = fogDensityExponent;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("fogDensityExponent"), v6);
  }
}

float __34__SCNScene_setFogDensityExponent___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DSceneSetFogDensityExponent(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)fogStartDistance
{
  return self->_fogStartDistance;
}

- (void)setFogStartDistance:(CGFloat)fogStartDistance
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_fogStartDistance != fogStartDistance)
  {
    self->_fogStartDistance = fogStartDistance;
    v5 = -[SCNScene sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __32__SCNScene_setFogStartDistance___block_invoke;
    v6[3] = &unk_1EA59E450;
    v6[4] = self;
    *(CGFloat *)&v6[5] = fogStartDistance;
    +[SCNTransaction postCommandWithContext:object:key:applyBlock:](SCNTransaction, "postCommandWithContext:object:key:applyBlock:", v5, self, CFSTR("fogStartDistance"), v6);
  }
}

float __32__SCNScene_setFogStartDistance___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DSceneSetFogStartDistance(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (BOOL)wantsScreenSpaceReflection
{
  return self->_wantsScreenSpaceReflection;
}

- (void)setWantsScreenSpaceReflection:(BOOL)wantsScreenSpaceReflection
{
  __C3DScene *v5;
  _QWORD v6[5];
  BOOL v7;

  if (self->_wantsScreenSpaceReflection != wantsScreenSpaceReflection)
  {
    self->_wantsScreenSpaceReflection = wantsScreenSpaceReflection;
    v5 = -[SCNScene sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__SCNScene_setWantsScreenSpaceReflection___block_invoke;
    v6[3] = &unk_1EA59E478;
    v6[4] = self;
    v7 = wantsScreenSpaceReflection;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

void __42__SCNScene_setWantsScreenSpaceReflection___block_invoke(uint64_t a1)
{
  C3DSceneSetWantsSSR(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_BYTE *)(a1 + 40));
}

- (NSInteger)screenSpaceReflectionSampleCount
{
  return self->_screenSpaceReflectionSampleCount;
}

- (void)setScreenSpaceReflectionSampleCount:(NSInteger)screenSpaceReflectionSampleCount
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_screenSpaceReflectionSampleCount != screenSpaceReflectionSampleCount)
  {
    self->_screenSpaceReflectionSampleCount = screenSpaceReflectionSampleCount;
    v5 = -[SCNScene sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__SCNScene_setScreenSpaceReflectionSampleCount___block_invoke;
    v6[3] = &unk_1EA59E450;
    v6[4] = self;
    v6[5] = screenSpaceReflectionSampleCount;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

void __48__SCNScene_setScreenSpaceReflectionSampleCount___block_invoke(uint64_t a1)
{
  C3DSceneSetSSRSampleCount(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_WORD *)(a1 + 40));
}

- (double)screenSpaceReflectionDepthThreshold
{
  return 0.0;
}

- (CGFloat)screenSpaceReflectionMaximumDistance
{
  return self->_screenSpaceReflectionMaxRayDistance;
}

- (void)setScreenSpaceReflectionMaximumDistance:(CGFloat)screenSpaceReflectionMaximumDistance
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_screenSpaceReflectionMaxRayDistance != screenSpaceReflectionMaximumDistance)
  {
    self->_screenSpaceReflectionMaxRayDistance = screenSpaceReflectionMaximumDistance;
    v5 = -[SCNScene sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__SCNScene_setScreenSpaceReflectionMaximumDistance___block_invoke;
    v6[3] = &unk_1EA59E450;
    v6[4] = self;
    *(CGFloat *)&v6[5] = screenSpaceReflectionMaximumDistance;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

float __52__SCNScene_setScreenSpaceReflectionMaximumDistance___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DSceneSetSSRMaxRayDistance(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)screenSpaceReflectionStride
{
  return self->_screenSpaceReflectionStride;
}

- (void)setScreenSpaceReflectionStride:(CGFloat)screenSpaceReflectionStride
{
  __C3DScene *v5;
  _QWORD v6[6];

  if (self->_screenSpaceReflectionStride != screenSpaceReflectionStride)
  {
    self->_screenSpaceReflectionStride = screenSpaceReflectionStride;
    v5 = -[SCNScene sceneRef](self, "sceneRef");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__SCNScene_setScreenSpaceReflectionStride___block_invoke;
    v6[3] = &unk_1EA59E450;
    v6[4] = self;
    *(CGFloat *)&v6[5] = screenSpaceReflectionStride;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v6);
  }
}

float __43__SCNScene_setScreenSpaceReflectionStride___block_invoke(uint64_t a1)
{
  float v1;
  float result;

  v1 = *(double *)(a1 + 40);
  C3DSceneSetSSRStride(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v1);
  return result;
}

- (BOOL)writeToURL:(NSURL *)url options:(NSDictionary *)options delegate:(id)delegate progressHandler:(SCNSceneExportProgressHandler)progressHandler
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  NSString *v15;
  __CFString **v16;
  int v17;
  __C3DScene *v18;
  uint64_t v19;
  void *v20;
  __C3DScene *v21;
  uint64_t v22;
  BOOL v23;
  __n128 v24;
  id v25;
  char v26;
  char v27;
  __n128 v28;
  uint64_t v30;
  NSString *v31;
  _QWORD *v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[6];
  uint64_t v36;
  char v37;

  if (options)
    v10 = (id)-[NSDictionary mutableCopy](options, "mutableCopy");
  else
    v10 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = v10;
  v12 = objc_msgSend(v10, "valueForKey:", CFSTR("kSceneSourceFormat"));
  if (v12)
  {
    v13 = (void *)v12;
LABEL_6:
    v14 = 0;
    goto LABEL_16;
  }
  v15 = -[NSString lowercaseString](-[NSURL pathExtension](url, "pathExtension"), "lowercaseString");
  if (-[NSString isEqualToString:](v15, "isEqualToString:", CFSTR("dae")))
  {
    v14 = 0;
    v16 = SCNSceneSourceFormatCOLLADA;
    goto LABEL_14;
  }
  if (-[NSString isEqualToString:](v15, "isEqualToString:", CFSTR("scn")))
  {
    v14 = 0;
LABEL_11:
    v16 = SCNSceneSourceFormatSCN;
    goto LABEL_14;
  }
  if (!-[NSString isEqualToString:](v15, "isEqualToString:", CFSTR("c3d")))
  {
    if (!-[NSString isEqualToString:](v15, "isEqualToString:", CFSTR("scnz")))
    {
      v13 = 0;
      goto LABEL_6;
    }
    v14 = 1;
    goto LABEL_11;
  }
  v14 = 0;
  v16 = SCNSceneSourceFormatC3D;
LABEL_14:
  v13 = *v16;
  if (*v16)
    objc_msgSend(v11, "setValue:forKey:", *v16, CFSTR("kSceneSourceFormat"));
LABEL_16:
  v37 = 0;
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("scn")))
  {
    v17 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SCNSceneExportPresentationTree")), "BOOLValue");
    if (v17)
    {
      +[SCNTransaction lock](SCNTransaction, "lock");
      v18 = -[SCNScene sceneRef](self, "sceneRef");
      v19 = (uint64_t)v18;
      if (v18)
        C3DSceneLock((uint64_t)v18);
    }
    else
    {
      v19 = 0;
    }
    v25 = +[SCNKeyedArchiver archivedDataWithRootObject:options:](SCNKeyedArchiver, "archivedDataWithRootObject:options:", self, v11);
    v26 = v17 ^ 1;
    if (!v19)
      v26 = 1;
    if ((v26 & 1) == 0)
    {
      C3DSceneUnlock(v19);
      +[SCNTransaction unlock](SCNTransaction, "unlock");
    }
    if (v14)
      v25 = (id)objc_msgSend(v25, "scn_compressedDataUsingCompressionAlgorithm:", 517);
    v36 = 0;
    v27 = objc_msgSend(v25, "writeToURL:options:error:", url, 1, &v36);
    goto LABEL_38;
  }
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("c3d")) & 1) == 0
    && !objc_msgSend(v13, "isEqualToString:", CFSTR("dae")))
  {
    v30 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __56__SCNScene_writeToURL_options_delegate_progressHandler___block_invoke;
    v35[3] = &unk_1EA5A2440;
    v35[4] = v13;
    v35[5] = url;
    if (v13)
    {
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("usd")) & 1) == 0
        && (objc_msgSend(v13, "isEqualToString:", CFSTR("usda")) & 1) == 0
        && (objc_msgSend(v13, "isEqualToString:", CFSTR("usdc")) & 1) == 0
        && (objc_msgSend(v13, "isEqualToString:", CFSTR("usdz")) & 1) == 0)
      {
LABEL_56:
        if (C3DWasLinkedBeforeMajorOSYear2015() && !NSClassFromString(CFSTR("MDLAsset")))
          return 0;
        v36 = 0;
        v33[0] = v30;
        v33[1] = 3221225472;
        v33[2] = __56__SCNScene_writeToURL_options_delegate_progressHandler___block_invoke_3;
        v33[3] = &unk_1EA5A2468;
        v33[4] = self;
        v32 = v33;
        goto LABEL_54;
      }
    }
    else
    {
      v31 = -[NSString lowercaseString](-[NSURL pathExtension](url, "pathExtension"), "lowercaseString");
      if (!-[NSString isEqualToString:](v31, "isEqualToString:", CFSTR("usd"))
        && !-[NSString isEqualToString:](v31, "isEqualToString:", CFSTR("usda"))
        && !-[NSString isEqualToString:](v31, "isEqualToString:", CFSTR("usdc"))
        && !-[NSString isEqualToString:](v31, "isEqualToString:", CFSTR("usdz")))
      {
        goto LABEL_56;
      }
    }
    v36 = 0;
    v34[0] = v30;
    v34[1] = 3221225472;
    v34[2] = __56__SCNScene_writeToURL_options_delegate_progressHandler___block_invoke_2;
    v34[3] = &unk_1EA5A2468;
    v34[4] = self;
    v32 = v34;
LABEL_54:
    v27 = __56__SCNScene_writeToURL_options_delegate_progressHandler___block_invoke((uint64_t)v35, (uint64_t)&v36, (uint64_t)v32);
LABEL_38:
    v23 = v27;
    if (progressHandler)
    {
      v28.n128_u32[0] = 1.0;
      (*((void (**)(SCNSceneExportProgressHandler, uint64_t, char *, __n128))progressHandler + 2))(progressHandler, v36, &v37, v28);
    }
    return v23;
  }
  +[SCNTransaction flush](SCNTransaction, "flush");
  v20 = (void *)objc_msgSend(v11, "valueForKey:", CFSTR("SCNSceneSourceInputSource"));
  if (v20)
  {
    objc_msgSend(v11, "setValue:forKey:", objc_msgSend(v20, "library"), CFSTR("kSceneSourceInputLibrary"));
    objc_msgSend(v11, "removeObjectForKey:", CFSTR("SCNSceneSourceInputSource"));
  }
  v21 = -[SCNScene sceneRef](self, "sceneRef");
  v22 = (uint64_t)v21;
  if (v21)
    C3DSceneLock((uint64_t)v21);
  v23 = C3DIOWriteSceneToURL((const __CFURL *)url, -[SCNScene sceneRef](self, "sceneRef"), (const __CFDictionary *)v11, delegate, (uint64_t)progressHandler);
  if (v22)
    C3DSceneUnlock(v22);
  if (progressHandler)
  {
    v24.n128_u32[0] = 1.0;
    (*((void (**)(SCNSceneExportProgressHandler, _QWORD, char *, __n128))progressHandler + 2))(progressHandler, 0, &v37, v24);
  }
  return v23;
}

uint64_t __56__SCNScene_writeToURL_options_delegate_progressHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v7;
  uint64_t v8;

  if (!*(_QWORD *)(a1 + 32)
    || objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "pathExtension"), "lowercaseString")))
  {
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(a3 + 16))(a3, *(_QWORD *)(a1 + 40), a2);
  }
  v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, *(_QWORD *)(a1 + 40), 1, a2);
  if (v7
    && (v8 = objc_msgSend(v7, "URLByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "lastPathComponent"), "stringByAppendingPathExtension:", *(_QWORD *)(a1 + 32))), (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, v8, a2)))
  {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "moveItemAtURL:toURL:error:", v8, *(_QWORD *)(a1 + 40), a2);
  }
  else
  {
    return 0;
  }
}

uint64_t __56__SCNScene_writeToURL_options_delegate_progressHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeToURLWithUSDKit:", a2);
}

uint64_t __56__SCNScene_writeToURL_options_delegate_progressHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CC7780], "assetWithSCNScene:", objc_msgSend(*(id *)(a1 + 32), "scene")), "exportAssetToURL:error:", a2, a3);
}

- (void)_dumpToDisk
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "temporaryDirectory"), "path");
  v4 = 0;
  do
  {
    v5 = objc_msgSend(v3, "stringByAppendingPathComponent:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sceneDump%d.scn"), v4));
    v4 = (v4 + 1);
  }
  while ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v5) & 1) != 0);
  NSLog(CFSTR("dumping scene to %@"), v5);
  -[SCNScene writeToURL:options:delegate:progressHandler:](self, "writeToURL:options:delegate:progressHandler:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5), 0, 0, 0);
}

- (void)lock
{
  __C3DScene *v2;

  v2 = -[SCNScene sceneRef](self, "sceneRef");
  if (v2)
    C3DSceneLock((uint64_t)v2);
}

- (void)unlock
{
  __C3DScene *v2;

  v2 = -[SCNScene sceneRef](self, "sceneRef");
  if (v2)
    C3DSceneUnlock((uint64_t)v2);
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  __C3DScene *v7;
  uint64_t v8;
  __C3DScene *scene;
  int v10;
  SCNNode *rootNode;
  __C3DScene *v12;
  uint64_t v13;
  __C3DScene *v14;
  id result;
  id v16;
  void *v17;
  id v18;

  v17 = 0;
  v18 = 0;
  SCNKitSplitKVCPath(a3, &v18, (uint64_t *)&v17);
  if (objc_msgSend(v18, "isEqual:", CFSTR("root")))
  {
    if (!self->_rootNode)
    {
      v7 = -[SCNScene sceneRef](self, "sceneRef");
      v8 = (uint64_t)v7;
      if (v7)
        C3DSceneLock((uint64_t)v7);
      if (!self->_rootNode)
      {
        scene = self->_scene;
        if (scene)
        {
          C3DSceneLock((uint64_t)scene);
          if (C3DSceneGetRootNode((uint64_t)self->_scene))
            self->_rootNode = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:");
          else
            -[SCNScene _setRootNode:](self, "_setRootNode:", +[SCNNode node](SCNNode, "node"));
          C3DSceneUnlock((uint64_t)self->_scene);
        }
      }
      if (v8)
        C3DSceneUnlock(v8);
    }
    result = self->_rootNode;
    goto LABEL_27;
  }
  if (objc_msgSend(a3, "hasPrefix:", CFSTR("/")))
  {
    if (!self->_rootNode)
      goto LABEL_14;
    goto LABEL_32;
  }
  v10 = objc_msgSend(a3, "hasPrefix:", CFSTR("children["));
  rootNode = self->_rootNode;
  if (v10)
  {
    if (!rootNode)
    {
LABEL_14:
      v12 = -[SCNScene sceneRef](self, "sceneRef");
      v13 = (uint64_t)v12;
      if (v12)
        C3DSceneLock((uint64_t)v12);
      if (!self->_rootNode)
      {
        v14 = self->_scene;
        if (v14)
        {
          C3DSceneLock((uint64_t)v14);
          if (C3DSceneGetRootNode((uint64_t)self->_scene))
            self->_rootNode = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:");
          else
            -[SCNScene _setRootNode:](self, "_setRootNode:", +[SCNNode node](SCNNode, "node"));
          C3DSceneUnlock((uint64_t)self->_scene);
        }
      }
      if (v13)
        C3DSceneUnlock(v13);
    }
LABEL_32:
    result = self->_rootNode;
    v16 = a3;
    return (id)objc_msgSend(result, "copyAnimationChannelForKeyPath:animation:", v16, a4);
  }
  result = -[SCNNode childNodeWithName:recursively:](rootNode, "childNodeWithName:recursively:", v18, 1);
  if (result)
  {
LABEL_27:
    v16 = v17;
    return (id)objc_msgSend(result, "copyAnimationChannelForKeyPath:animation:", v16, a4);
  }
  return result;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 property:(id)a4
{
  __CFString **v5;

  if (self->_background == a4)
  {
    v5 = kC3DModelPathBackgroundMap;
  }
  else
  {
    if (self->_environment != a4)
      return 0;
    v5 = kC3DModelPathLightingEnvironmentMap;
  }
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), *v5, a3));
}

- (id)valueForUndefinedKey:(id)a3
{
  __C3DScene *v5;
  uint64_t v6;
  __C3DScene *scene;
  id result;

  if (objc_msgSend(a3, "hasPrefix:", CFSTR("/")))
  {
    if (!self->_rootNode)
    {
      v5 = -[SCNScene sceneRef](self, "sceneRef");
      v6 = (uint64_t)v5;
      if (v5)
        C3DSceneLock((uint64_t)v5);
      if (!self->_rootNode)
      {
        scene = self->_scene;
        if (scene)
        {
          C3DSceneLock((uint64_t)scene);
          if (C3DSceneGetRootNode((uint64_t)self->_scene))
            self->_rootNode = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:");
          else
            -[SCNScene _setRootNode:](self, "_setRootNode:", +[SCNNode node](SCNNode, "node"));
          C3DSceneUnlock((uint64_t)self->_scene);
        }
      }
      if (v6)
        C3DSceneUnlock(v6);
    }
    return (id)-[SCNNode valueForKey:](self->_rootNode, "valueForKey:", a3);
  }
  else
  {
    result = -[SCNScene attributeForKey:](self, "attributeForKey:", a3);
    if (!result)
      return -[SCNNode childNodeWithName:recursively:](self->_rootNode, "childNodeWithName:recursively:", a3, 1);
  }
  return result;
}

- (void)addSceneAnimation:(id)a3 forKey:(id)a4 target:(id)a5
{
  id v7;

  v7 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(v7, "setUsesSceneTimeBase:", 1);
  objc_msgSend(a5, "addAnimation:forKey:", v7, a4);
}

- (void)addParticleSystem:(SCNParticleSystem *)system withTransform:(SCNMatrix4 *)transform
{
  __C3DScene *v7;
  __int128 v8;
  __int128 v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  if (system)
  {
    v7 = -[SCNScene sceneRef](self, "sceneRef");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __44__SCNScene_addParticleSystem_withTransform___block_invoke;
    v17[3] = &unk_1EA5A2490;
    v8 = *(_OWORD *)&transform->m21;
    v18 = *(_OWORD *)&transform->m11;
    v19 = v8;
    v9 = *(_OWORD *)&transform->m41;
    v20 = *(_OWORD *)&transform->m31;
    v21 = v9;
    v17[4] = self;
    v17[5] = system;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v7, self, v17);
  }
  else
  {
    v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SCNScene addParticleSystem:withTransform:].cold.1((uint64_t)self, v10, v11, v12, v13, v14, v15, v16);
  }
}

double __44__SCNScene_addParticleSystem_withTransform___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double result;
  _QWORD *ParticleManager;
  const void *v5;
  __int128 v6[4];

  v2 = objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  if (v2)
  {
    ParticleManager = C3DSceneGetParticleManager(v2, 1);
    memset(v6, 0, sizeof(v6));
    v5 = (const void *)objc_msgSend(*(id *)(a1 + 40), "__CFObject", C3DMatrix4x4FromSCNMatrix4(v6, a1 + 48).n128_f64[0]);
    return C3DParticleManagerAddSystem((uint64_t)ParticleManager, 0, v5, v6);
  }
  return result;
}

- (void)removeParticleSystem:(SCNParticleSystem *)system
{
  __C3DScene *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[6];

  if (system)
  {
    v5 = -[SCNScene sceneRef](self, "sceneRef");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __33__SCNScene_removeParticleSystem___block_invoke;
    v13[3] = &unk_1EA59F740;
    v13[4] = self;
    v13[5] = system;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, self, v13);
  }
  else
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SCNScene addParticleSystem:withTransform:].cold.1((uint64_t)self, v6, v7, v8, v9, v10, v11, v12);
  }
}

void __33__SCNScene_removeParticleSystem___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *ParticleManager;

  v2 = objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  if (v2)
  {
    ParticleManager = C3DSceneGetParticleManager(v2, 0);
    if (ParticleManager)
      C3DParticleManagerRemoveAllInstanceOfSystem((uint64_t)ParticleManager, objc_msgSend(*(id *)(a1 + 40), "__CFObject"));
  }
}

- (void)removeAllParticleSystems
{
  __C3DScene *v3;
  _QWORD v4[5];

  v3 = -[SCNScene sceneRef](self, "sceneRef");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__SCNScene_removeAllParticleSystems__block_invoke;
  v4[3] = &unk_1EA59E4A0;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v3, self, v4);
}

void __36__SCNScene_removeAllParticleSystems__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *ParticleManager;

  v1 = objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  if (v1)
  {
    ParticleManager = C3DSceneGetParticleManager(v1, 0);
    if (ParticleManager)
      C3DParticleManagerRemoveAllSystems((uint64_t)ParticleManager);
  }
}

- (NSArray)particleSystems
{
  __C3DScene *v3;
  uint64_t v4;
  void *v5;
  _QWORD *ParticleManager;
  __CFArray *ParticleSystemsForNode;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = -[SCNScene sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  v5 = -[SCNScene __CFObject](self, "__CFObject");
  if (v5 && (ParticleManager = C3DSceneGetParticleManager((uint64_t)v5, 0)) != 0)
  {
    ParticleSystemsForNode = C3DParticleManagerGetParticleSystemsForNode((uint64_t)ParticleManager, 0);
    v8 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[__CFArray count](ParticleSystemsForNode, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = -[__CFArray countByEnumeratingWithState:objects:count:](ParticleSystemsForNode, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(ParticleSystemsForNode);
          -[NSArray addObject:](v8, "addObject:", +[SCNParticleSystem particleSystemWithParticleSystemRef:](SCNParticleSystem, "particleSystemWithParticleSystemRef:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i)));
        }
        v10 = -[__CFArray countByEnumeratingWithState:objects:count:](ParticleSystemsForNode, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }
  }
  else
  {
    v8 = 0;
  }
  if (v4)
    C3DSceneUnlock(v4);
  return v8;
}

- (void)setPaused:(BOOL)paused
{
  _BOOL8 v3;
  __C3DScene *v5;
  uint64_t v6;
  _QWORD v7[5];
  BOOL v8;
  _QWORD v9[5];
  BOOL v10;

  if (self->_paused != paused)
  {
    v3 = paused;
    self->_paused = paused;
    v5 = -[SCNScene sceneRef](self, "sceneRef");
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __22__SCNScene_setPaused___block_invoke;
    v9[3] = &unk_1EA59E478;
    v9[4] = self;
    v10 = v3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v5, 0, v9);
    -[SCNNode setPaused:](-[SCNScene rootNode](self, "rootNode"), "setPaused:", v3);
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __22__SCNScene_setPaused___block_invoke_2;
    v7[3] = &__block_descriptor_41_e8_v16__0d8l;
    v7[4] = -[SCNScene __CFObject](self, "__CFObject");
    v8 = v3;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, 0, v7);
    +[SCNTransaction flush](SCNTransaction, "flush");
  }
}

uint64_t __22__SCNScene_setPaused___block_invoke(uint64_t a1)
{
  return C3DSceneSetPaused(objc_msgSend(*(id *)(a1 + 32), "sceneRef"), *(_BYTE *)(a1 + 40));
}

uint64_t __22__SCNScene_setPaused___block_invoke_2(uint64_t a1)
{
  return C3DSceneSetPaused(*(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)isPausedOrPausedByInheritance
{
  return self->_paused;
}

- (void)setPausedForEditing:(BOOL)a3
{
  if (self->_pausedForEditing != a3)
  {
    self->_pausedForEditing = a3;
    C3DSceneSetPausedForEditing((uint64_t)self->_scene);
  }
}

- (BOOL)isPausedForEditing
{
  return self->_pausedForEditing;
}

- (id)_nodeWithIndexPath:(id)a3
{
  SCNNode *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = -[SCNScene rootNode](self, "rootNode");
  v5 = objc_msgSend(a3, "length");
  if (v5 >= 1)
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      v8 = objc_msgSend(a3, "indexAtPosition:", v7);
      if (-[NSArray count](-[SCNNode childNodes](v4, "childNodes"), "count") <= v8)
        break;
      ++v7;
      v4 = -[NSArray objectAtIndexedSubscript:](-[SCNNode childNodes](v4, "childNodes"), "objectAtIndexedSubscript:", v8);
      if (v6 == v7)
        return v4;
    }
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SCNScene _nodeWithIndexPath:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    return 0;
  }
  return v4;
}

+ (id)_indexPathForNode:(id)a3
{
  id v3;
  uint64_t v4;
  size_t v5;
  id v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (!a3)
    return 0;
  v3 = a3;
  v4 = -1;
  v5 = -8;
  v6 = a3;
  do
  {
    v6 = (id)objc_msgSend(v6, "parentNode");
    ++v4;
    v5 += 8;
  }
  while (v6);
  if (v4)
  {
    v7 = malloc_type_malloc(v5, 0x100004000313F17uLL);
    v8 = (void *)objc_msgSend(v3, "parentNode");
    if (!v8)
      goto LABEL_9;
    v9 = v4 + 1;
    do
    {
      v10 = v8;
      v7[v9 - 2] = objc_msgSend(v8, "indexOfChildNode:", v3);
      v8 = (void *)objc_msgSend(v10, "parentNode");
      --v9;
      v3 = v10;
    }
    while (v8);
    if (v9 != 1)
    {
LABEL_9:
      v11 = scn_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        +[SCNScene _indexPathForNode:].cold.2(v11);
    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B0]), "initWithIndexes:length:", v7, v4);
    free(v7);
    return v12;
  }
  else
  {
    v14 = scn_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[SCNScene _indexPathForNode:].cold.1((uint64_t)v3, v14, v15, v16, v17, v18, v19, v20);
    return 0;
  }
}

- (id)_subnodeFromIndexPath:(id)a3
{
  if (a3)
    return (id)objc_msgSend(self, "_nodeWithIndexPath:");
  return self;
}

- (id)initForJavascript:(id)a3
{
  SCNScene *v4;
  id v5;
  SCNSceneSource *v6;
  uint64_t v7;
  uint64_t *p_scene;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)SCNScene;
  v4 = -[SCNScene init](&v11, sel_init);
  if (!v4)
    return v4;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a3);
      if (!objc_msgSend(v5, "scheme"))
        v5 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
    }
    else
    {
      v5 = a3;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[SCNSceneSource initWithURL:options:]([SCNSceneSource alloc], "initWithURL:options:", v5, 0);
      v7 = -[SCNSceneSource _createSceneRefWithOptions:statusHandler:](v6, "_createSceneRefWithOptions:statusHandler:", 0, 0);

      if (v7)
      {
        v4->_scene = (__C3DScene *)v7;
        p_scene = (uint64_t *)&v4->_scene;
LABEL_13:
        C3DEntitySetObjCWrapper(v7, v4);
        goto LABEL_14;
      }
      v9 = scn_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v5;
        _os_log_impl(&dword_1DCCB8000, v9, OS_LOG_TYPE_DEFAULT, "Warning: failed to load scene at %@", buf, 0xCu);
      }
    }
  }
  v7 = C3DSceneCreate();
  v4->_scene = (__C3DScene *)v7;
  p_scene = (uint64_t *)&v4->_scene;
  if (v7)
    goto LABEL_13;
LABEL_14:
  if (!v4->_rootNode && *p_scene)
  {
    C3DSceneLock(*p_scene);
    if (C3DSceneGetRootNode(*p_scene))
      v4->_rootNode = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:");
    else
      -[SCNScene _setRootNode:](v4, "_setRootNode:", +[SCNNode node](SCNNode, "node"));
    C3DSceneUnlock(*p_scene);
  }
  return v4;
}

+ (SEL)jsConstructor
{
  return sel_initForJavascript_;
}

- (void)_customEncodingOfSCNScene:(id)a3
{
  float v5;
  float v6;
  float v7;

  -[SCNScene endTime](self, "endTime");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("endTime"));
  -[SCNScene startTime](self, "startTime");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("startTime"));
  -[SCNScene frameRate](self, "frameRate");
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("frameRate"));
  -[SCNScene upAxis](self, "upAxis");
  SCNEncodeVector3(a3, (uint64_t)CFSTR("upAxis"), v5, v6, v7);
}

- (void)_customDecodingOfSCNScene:(id)a3
{
  __n128 v5;
  unsigned __int32 v6;
  unsigned __int32 v7;
  __n128 v8;

  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("endTime"));
  -[SCNScene setEndTime:](self, "setEndTime:");
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("startTime"));
  -[SCNScene setStartTime:](self, "setStartTime:");
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("frameRate"));
  -[SCNScene setFrameRate:](self, "setFrameRate:");
  v5.n128_f32[0] = SCNDecodeVector3(a3, (uint64_t)CFSTR("upAxis"));
  v5.n128_u32[1] = v6;
  v5.n128_u32[2] = v7;
  v8 = v5;
  C3DSceneSetUpAxis((__n128 *)self->_scene, &v8);
}

- (void)_didDecodeSCNScene:(id)a3
{
  uint64_t RootNode;

  if ((C3DMetalIsSupported() & 1) == 0)
  {
    RootNode = C3DSceneGetRootNode((uint64_t)-[SCNScene sceneRef](self, "sceneRef"));
    C3DSplitMeshesIfNeededInNodeTree(RootNode, 0xFFFFLL);
  }
}

- (void)_prettifyForPreview
{
  void *v3;
  SCNNode *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[9];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _QWORD v24[3];
  char v25;
  _QWORD v26[3];
  char v27;
  _QWORD v28[3];
  char v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v4 = -[SCNScene rootNode](self, "rootNode");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __31__SCNScene__prettifyForPreview__block_invoke;
  v19[3] = &unk_1EA5A24D8;
  v19[4] = v3;
  v19[5] = &v20;
  v19[6] = v28;
  v19[7] = v26;
  v19[8] = v24;
  -[SCNNode enumerateHierarchyUsingBlock:](v4, "enumerateHierarchyUsingBlock:", v19);
  if (!*((_BYTE *)v21 + 24))
    -[SCNNode enumerateHierarchyUsingBlock:](-[SCNScene rootNode](self, "rootNode"), "enumerateHierarchyUsingBlock:", &__block_literal_global_72);
  if (!-[SCNMaterialProperty contents](-[SCNScene lightingEnvironment](self, "lightingEnvironment"), "contents"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v30, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v16 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "light"), "type"), "isEqualToString:", CFSTR("omni")))
          {
            objc_msgSend((id)objc_msgSend(v8, "light"), "intensity");
            v10 = v9;
            v11 = (void *)objc_msgSend(v8, "light");
            v12 = v10 * 0.05;
          }
          else
          {
            objc_msgSend((id)objc_msgSend(v8, "light"), "intensity");
            v14 = v13;
            v11 = (void *)objc_msgSend(v8, "light");
            v12 = v14 * 0.5;
          }
          objc_msgSend(v11, "setIntensity:", v12);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v30, 16);
      }
      while (v5);
    }
    -[SCNScene set_allowsDefaultLightingEnvironmentFallback:](self, "set_allowsDefaultLightingEnvironmentFallback:", 1);
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
}

uint64_t __31__SCNScene__prettifyForPreview__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = (void *)objc_msgSend((id)objc_msgSend(a2, "geometry", 0), "materials");
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "lightingModelName"), "isEqualToString:", CFSTR("SCNLightingModelPhysicallyBased")))*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) && objc_msgSend(a2, "camera"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  result = objc_msgSend(a2, "light");
  if (result)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "light"), "type"), "isEqualToString:", CFSTR("omni"));
    if ((_DWORD)result)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __31__SCNScene__prettifyForPreview__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char isKindOfClass;
  float v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_msgSend((id)objc_msgSend(a2, "geometry", 0), "materials");
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        if (objc_msgSend((id)objc_msgSend(v7, "reflective"), "contents"))
        {
          objc_msgSend((id)objc_msgSend(v7, "reflective"), "contents");
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
        }
        else
        {
          isKindOfClass = 1;
        }
        if ((objc_msgSend((id)objc_msgSend(v7, "lightingModelName"), "isEqualToString:", CFSTR("SCNLightingModelPhysicallyBased")) & 1) == 0&& (isKindOfClass & 1) != 0)
        {
          objc_msgSend(v7, "setLightingModelName:", CFSTR("SCNLightingModelPhysicallyBased"));
          objc_msgSend((id)objc_msgSend(v7, "metalness"), "setContents:", &unk_1EA5FF730);
          objc_msgSend((id)objc_msgSend(v7, "specular"), "contents");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = COERCE_FLOAT(objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "specular"), "contents"), "scn_C3DColorIgnoringColorSpace:success:", 1, 0));
            objc_msgSend((id)objc_msgSend(v7, "roughness"), "setContents:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (float)(1.0 - v9) * 0.2 + 0.2));
          }
        }
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  SCNPhysicsWorld *physicsWorld;
  SCNNode *rootNode;
  SCNMaterialProperty *background;
  SCNMaterialProperty *environment;
  NSMutableDictionary *userAttributes;
  id fogColor;
  double screenSpaceReflectionMaxRayDistance;
  double screenSpaceReflectionStride;
  NSURL *sourceURL;

  -[SCNScene _customEncodingOfSCNScene:](self, "_customEncodingOfSCNScene:");
  physicsWorld = self->_physicsWorld;
  if (physicsWorld && !-[SCNPhysicsWorld _isDefault](physicsWorld, "_isDefault"))
    objc_msgSend(a3, "encodeObject:forKey:", self->_physicsWorld, CFSTR("physicsWorld"));
  rootNode = self->_rootNode;
  if (rootNode)
    objc_msgSend(a3, "encodeObject:forKey:", rootNode, CFSTR("rootNode"));
  background = self->_background;
  if (background)
    objc_msgSend(a3, "encodeObject:forKey:", background, CFSTR("background"));
  environment = self->_environment;
  if (environment)
    objc_msgSend(a3, "encodeObject:forKey:", environment, CFSTR("environment"));
  userAttributes = self->_userAttributes;
  if (userAttributes)
    objc_msgSend(a3, "encodeObject:forKey:", userAttributes, CFSTR("userAttributes"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("fogStartDistance"), self->_fogStartDistance);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("fogEndDistance"), self->_fogEndDistance);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("fogDensityExponent"), self->_fogDensityExponent);
  fogColor = self->_fogColor;
  if (fogColor)
    SCNEncodeUnsafeObjectForKey(a3, (uint64_t)fogColor, (uint64_t)CFSTR("fogColor"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_wantsScreenSpaceReflection, CFSTR("wantsScreenSpaceReflection"));
  objc_msgSend(a3, "encodeInt:forKey:", LODWORD(self->_screenSpaceReflectionSampleCount), CFSTR("screenSpaceReflectionSampleCount"));
  screenSpaceReflectionMaxRayDistance = self->_screenSpaceReflectionMaxRayDistance;
  *(float *)&screenSpaceReflectionMaxRayDistance = screenSpaceReflectionMaxRayDistance;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("screenSpaceReflectionMaximumDistance"), screenSpaceReflectionMaxRayDistance);
  screenSpaceReflectionStride = self->_screenSpaceReflectionStride;
  *(float *)&screenSpaceReflectionStride = screenSpaceReflectionStride;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("screenSpaceReflectionStride"), screenSpaceReflectionStride);
  objc_msgSend(a3, "encodeBool:forKey:", self->_paused, CFSTR("paused"));
  objc_msgSend(a3, "encodeInteger:forKey:", 1, CFSTR("version"));
  sourceURL = self->_sourceURL;
  if (sourceURL)
    objc_msgSend(a3, "encodeObject:forKey:", sourceURL, CFSTR("sourceURL"));
  -[SCNScene _didEncodeSCNScene:](self, "_didEncodeSCNScene:", a3);
}

- (SCNScene)initWithCoder:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  float v21;
  float v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SCNScene;
  v4 = -[SCNScene init](&v25, sel_init);
  if (v4)
  {
    if (C3DSceneSourceGetSceneCount())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a3, "_allowDecodingCyclesInSecureMode");
    }
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceURL"));
    if (v6)
    {
      v7 = (void *)v6;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!objc_msgSend(a3, "documentURL"))
          objc_msgSend(a3, "setDocumentURL:", v7);
      }
      else
      {
        objc_setAssociatedObject(a3, CFSTR("SCNSourceURLForCurrentlyUnarchivedScene"), v7, (void *)0x301);
      }
    }
    v8 = C3DSceneCreate();
    *((_QWORD *)v4 + 1) = v8;
    if (v8)
      C3DEntitySetObjCWrapper(v8, v4);
    objc_msgSend(v4, "_syncObjCModel");
    objc_msgSend(v4, "_customDecodingOfSCNScene:", a3);
    v9 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("version"));
    *((_QWORD *)v4 + 3) = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("physicsWorld"));
    v10 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rootNode"));
    if (v10)
    {
      objc_msgSend(v4, "setRootNode:", v10);
    }
    else
    {
      v11 = scn_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[SCNScene initWithCoder:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
      if (!*((_QWORD *)v4 + 4))
      {
        v19 = *((_QWORD *)v4 + 1);
        if (v19)
        {
          C3DSceneLock(v19);
          if (C3DSceneGetRootNode(*((_QWORD *)v4 + 1)))
            *((_QWORD *)v4 + 4) = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:");
          else
            objc_msgSend(v4, "_setRootNode:", +[SCNNode node](SCNNode, "node"));
          C3DSceneUnlock(*((_QWORD *)v4 + 1));
        }
      }
    }
    v20 = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("background"));
    *((_QWORD *)v4 + 9) = v20;
    if (!v9)
    {
      objc_msgSend(v20, "contents");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(*((id *)v4 + 9), "setContents:", 0);
    }
    *((_QWORD *)v4 + 10) = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", SCNUserInfoClasses(), CFSTR("environment"));
    *((_QWORD *)v4 + 11) = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", SCNUserInfoClasses(), CFSTR("userAttributes"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("fogStartDistance"));
    objc_msgSend(v4, "setFogStartDistance:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("fogEndDistance"));
    objc_msgSend(v4, "setFogEndDistance:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("fogDensityExponent"));
    objc_msgSend(v4, "setFogDensityExponent:");
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("wantsScreenSpaceReflection")))
      objc_msgSend(v4, "setWantsScreenSpaceReflection:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("wantsScreenSpaceReflection")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("screenSpaceReflectionSampleCount")))
      objc_msgSend(v4, "setScreenSpaceReflectionSampleCount:", (int)objc_msgSend(a3, "decodeIntForKey:", CFSTR("screenSpaceReflectionSampleCount")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("screenSpaceReflectionMaximumDistance")))
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("screenSpaceReflectionMaximumDistance"));
      objc_msgSend(v4, "setScreenSpaceReflectionMaximumDistance:", v21);
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("screenSpaceReflectionStride")))
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("screenSpaceReflectionStride"));
      objc_msgSend(v4, "setScreenSpaceReflectionStride:", v22);
    }
    v23 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    objc_msgSend(v4, "setFogColor:", SCNDecodeUnsafeObjectForKey(a3, (uint64_t)CFSTR("fogColor"), v23));
    objc_msgSend(v4, "setPaused:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("paused")));
    objc_msgSend(v4, "_didDecodeSCNScene:", a3);
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return (SCNScene *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)writeToURLWithUSDKit:(id)a3
{
  void *v5;
  void *v6;
  NSURL *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *USKScene;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[512];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "lowercaseString");
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("usd")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("usda")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("usdc")) & 1) == 0
    && !objc_msgSend(v5, "isEqualToString:", CFSTR("usdz")))
  {
    goto LABEL_16;
  }
  if (SCNLoadUsdKitIfNeeded(void)::onceToken != -1)
    dispatch_once(&SCNLoadUsdKitIfNeeded(void)::onceToken, &__block_literal_global_100);
  if (SCNLoadUsdKitIfNeeded(void)::loaded == 1)
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, a3, 1, 0);
    v7 = (NSURL *)objc_msgSend(v6, "URLByAppendingPathComponent:", objc_msgSend(a3, "lastPathComponent"));
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("usdz")))
      v7 = -[NSURL URLByAppendingPathExtension:](-[NSURL URLByDeletingPathExtension](v7, "URLByDeletingPathExtension"), "URLByAppendingPathExtension:", CFSTR("usdc"));
    +[SCNTransaction flush](SCNTransaction, "flush");
    v8 = (__CFString *)objc_msgSend((id)objc_msgSend(a3, "URLByDeletingPathExtension"), "lastPathComponent");
    if (!v8 || (v9 = v8, -[__CFString isEqualToString:](v8, "isEqualToString:", &stru_1EA5A6480)))
      v9 = CFSTR("root_node");
    USDKitConverter::USDKitConverter((USDKitConverter *)v27, self, &v9->isa, v7, (NSString *)objc_msgSend(v6, "path"));
    USKScene = (void *)USDKitConverter::makeUSKScene((USDKitConverter *)v27, v7);
    v10 = objc_msgSend(a3, "URLByDeletingLastPathComponent");
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);
    if (v12)
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("usdz")))
      {
        objc_msgSend(USKScene, "saveAndCreateUSDZPackageWithURL:", a3);
      }
      else
      {
        objc_msgSend(USKScene, "save");
        if (objc_msgSend(v11, "fileExistsAtPath:", objc_msgSend(a3, "path")))
          objc_msgSend(v11, "removeItemAtURL:error:", a3, 0);
        v13 = (void *)objc_msgSend((id)objc_msgSend(a3, "URLByDeletingLastPathComponent"), "path");
        v14 = (void *)objc_msgSend(v11, "enumeratorAtPath:", objc_msgSend(v6, "path"));
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v24 != v16)
                objc_enumerationMutation(v14);
              v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
              v19 = objc_msgSend((id)objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", v18);
              v20 = objc_msgSend(v13, "stringByAppendingPathComponent:", v18);
              if (objc_msgSend(v11, "fileExistsAtPath:", v20))
                objc_msgSend(v11, "removeItemAtPath:error:", v20, 0);
              objc_msgSend(v11, "moveItemAtPath:toPath:error:", v19, v20, 0);
            }
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          }
          while (v15);
        }
      }
    }

    objc_msgSend(v11, "removeItemAtURL:error:", v6, 0);
    USDKitConverter::~USDKitConverter((USDKitConverter *)v27);
  }
  else
  {
LABEL_16:
    LOBYTE(v12) = 0;
  }
  return v12;
}

- (BOOL)writeToURL:(id)a3 options:(id)a4
{
  return 0;
}

- (id)_exportAsMovieOperationWithDestinationURL:(id)a3 size:(CGSize)a4 attributes:(id)a5 delegate:(id)a6 didEndSelector:(SEL)a7 userInfo:(void *)a8
{
  double height;
  double width;
  SCNRenderer *v16;
  SCNMovieExportOperation *v17;

  height = a4.height;
  width = a4.width;
  v16 = +[SCNRenderer rendererWithDevice:options:](SCNRenderer, "rendererWithDevice:options:", 0, 0);
  -[SCNRenderer setScene:](v16, "setScene:", self);
  v17 = -[SCNMovieExportOperation initWithRenderer:size:attributes:outputURL:]([SCNMovieExportOperation alloc], "initWithRenderer:size:attributes:outputURL:", v16, a5, a3, width, height);
  -[_SCNExportOperation setDelegate:](v17, "setDelegate:", a6);
  -[_SCNExportOperation setUserInfo:](v17, "setUserInfo:", a8);
  -[_SCNExportOperation setDidEndSelector:](v17, "setDidEndSelector:", a7);
  return v17;
}

- (id)debugQuickLookObject
{
  return -[SCNScene debugQuickLookObjectWithPointOfView:](self, "debugQuickLookObjectWithPointOfView:", 0);
}

- (id)debugQuickLookObjectWithPointOfView:(id)a3
{
  SCNOffscreenRenderer *v5;
  SCNOffscreenRenderer *v6;

  if (C3DMetalIsSupported())
    v5 = +[SCNOffscreenRenderer offscreenRendererWithDevice:size:](SCNOffscreenRenderer, "offscreenRendererWithDevice:size:", 0, 512.0, 512.0);
  else
    v5 = +[SCNOffscreenRenderer offscreenRendererWithContext:size:](SCNOffscreenRenderer, "offscreenRendererWithContext:size:", 0, 512.0, 512.0);
  v6 = v5;
  -[SCNRenderer setScene:](v5, "setScene:", self);
  -[SCNRenderer setJitteringEnabled:](v6, "setJitteringEnabled:", 0);
  -[SCNRenderer setAutoenablesDefaultLighting:](v6, "setAutoenablesDefaultLighting:", 1);
  -[SCNRenderer setAutoAdjustCamera:](v6, "setAutoAdjustCamera:", 1);
  if (a3)
    -[SCNRenderer setPointOfView:](v6, "setPointOfView:", a3);
  +[SCNTransaction flush](SCNTransaction, "flush");
  return -[SCNOffscreenRenderer snapshot](v6, "snapshot");
}

- (void)root
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: [SCNScene root] is deprecated, use rootNode instead", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)addParticleSystem:(uint64_t)a3 withTransform:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: attempt to add a null particle system on %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_nodeWithIndexPath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: _subnodeFromIndexPath - invalid keypath", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

+ (void)_indexPathForNode:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: %@ is not in a scene yet", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)_indexPathForNode:(os_log_t)log .cold.2(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "wr == 0";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. _subnodeIndexPath - unexpected count (hierachy was mutated?)", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, a1, a3, "Error: failed to unarchive SCNScene - (secureCoding compliance issue?)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end
