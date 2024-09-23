@implementation SCNSkinner

- (SCNSkinner)initWithSkinnerRef:(__C3DSkinner *)a3
{
  SCNSkinner *v4;
  __C3DSkinner *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNSkinner;
  v4 = -[SCNSkinner init](&v7, sel_init);
  if (v4)
  {
    v5 = (__C3DSkinner *)CFRetain(a3);
    v4->_skinner = v5;
    if (v5)
      C3DEntitySetObjCWrapper((uint64_t)v5, v4);
    -[SCNSkinner _syncObjCModel](v4, "_syncObjCModel");
  }
  return v4;
}

+ (SCNSkinner)skinnerWithSkinnerRef:(__C3DSkinner *)a3
{
  SCNSkinner *result;

  result = (SCNSkinner *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
    return (SCNSkinner *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithSkinnerRef:", a3);
  return result;
}

- (void)dealloc
{
  __C3DSkinner *skinner;
  __C3DSkinner *v4;
  objc_super v5;
  _QWORD v6[5];

  skinner = self->_skinner;
  if (skinner)
  {
    C3DEntitySetObjCWrapper((uint64_t)skinner, 0);
    v4 = self->_skinner;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __21__SCNSkinner_dealloc__block_invoke;
    v6[3] = &__block_descriptor_40_e8_v16__0d8l;
    v6[4] = v4;
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, 0, v6);
  }
  objc_storeWeak((id *)&self->_skeleton, 0);

  v5.receiver = self;
  v5.super_class = (Class)SCNSkinner;
  -[SCNSkinner dealloc](&v5, sel_dealloc);
}

void __21__SCNSkinner_dealloc__block_invoke(uint64_t a1)
{
  C3DSkinnerSetJoints(*(_QWORD *)(a1 + 32), 0);
  C3DSkinnerSetSkeleton(*(_QWORD *)(a1 + 32), 0);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (id)copyWithZone:(_NSZone *)a3
{
  const void *Copy;
  SCNSkinner *v5;

  Copy = (const void *)C3DSkinnerCreateCopy((uint64_t)self->_skinner);
  v5 = -[SCNSkinner initWithSkinnerRef:]([SCNSkinner alloc], "initWithSkinnerRef:", Copy);
  CFRelease(Copy);
  -[SCNSkinner _setSkeleton:](v5, "_setSkeleton:", -[SCNSkinner skeleton](self, "skeleton"));
  -[SCNSkinner _setBaseGeometry:](v5, "_setBaseGeometry:", self->_baseGeometry);
  -[SCNSkinner set_bonesAndIndicesCompression:](v5, "set_bonesAndIndicesCompression:", self->_bonesAndIndicesCompression);
  return v5;
}

- (id)copy
{
  return -[SCNSkinner copyWithZone:](self, "copyWithZone:", 0);
}

- (__C3DSkinner)skinnerRef
{
  return self->_skinner;
}

- (SCNNode)skeleton
{
  return (SCNNode *)objc_loadWeak((id *)&self->_skeleton);
}

- (BOOL)_setSkeleton:(id)a3
{
  SCNNode **p_skeleton;
  id Weak;

  p_skeleton = &self->_skeleton;
  Weak = objc_loadWeak((id *)&self->_skeleton);
  if (Weak != a3)
    objc_storeWeak((id *)p_skeleton, a3);
  return Weak != a3;
}

- (void)_syncObjCModel
{
  uint64_t MTLVertexFormat;
  SCNNode *v4;

  MTLVertexFormat = C3DMeshSourceGetMTLVertexFormat((uint64_t)self->_skinner);
  if (MTLVertexFormat)
  {
    v4 = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", MTLVertexFormat);
  }
  else
  {
    v4 = (SCNNode *)_commonAncessor_0(-[SCNSkinner bones](self, "bones"));
    if (!v4)
      return;
  }
  -[SCNSkinner _setSkeleton:](self, "_setSkeleton:", v4);
}

- (void)setSkeleton:(SCNNode *)skeleton
{
  SCNNode *v5;
  __C3DScene *v6;
  _QWORD v7[7];

  v5 = -[SCNSkinner skeleton](self, "skeleton");
  if (-[SCNSkinner _setSkeleton:](self, "_setSkeleton:", skeleton))
  {
    if (self->_skinner)
    {
      v6 = -[SCNSkinner sceneRef](self, "sceneRef");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __26__SCNSkinner_setSkeleton___block_invoke;
      v7[3] = &unk_1EA59F718;
      v7[4] = self;
      v7[5] = skeleton;
      v7[6] = v5;
      +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", v6, self, v7);
    }
  }
}

double __26__SCNSkinner_setSkeleton___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;
  double result;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "skinnerRef");
  v3 = *(void **)(a1 + 40);
  if (!v3)
  {
LABEL_11:
    *(_QWORD *)&result = C3DSkinnerSetSkeleton(v2, 0).n128_u64[0];
    return result;
  }
  v4 = C3DSkinnerSkeletonNeedsRetargeting(v2, objc_msgSend(v3, "nodeRef"));
  v5 = *(void **)(a1 + 40);
  if ((v4 & 1) == 0)
  {
    if (v5)
    {
      *(_QWORD *)&result = C3DSkinnerSetSkeleton(v2, (_QWORD *)objc_msgSend(v5, "nodeRef")).n128_u64[0];
      return result;
    }
    C3DSkinnerSetJoints(v2, 0);
    goto LABEL_11;
  }
  if (!C3DSkinnerTransposeSkeleton(v2, (_QWORD *)objc_msgSend(v5, "nodeRef"))
    && !C3DSkinnerTransposeSkeletonUsingNodeNames(v2, (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "nodeRef")))
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_1DCCB8000, v7, OS_LOG_TYPE_DEFAULT, "Warning: Failed to transpose skeleton\nold skeleton: %@\nnew skeleton: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  return result;
}

- (BOOL)_bonesAndIndicesCompression
{
  return self->_bonesAndIndicesCompression;
}

- (void)set_bonesAndIndicesCompression:(BOOL)a3
{
  self->_bonesAndIndicesCompression = a3;
}

- (SCNGeometry)baseGeometry
{
  return self->_baseGeometry;
}

- (void)setBaseGeometry:(SCNGeometry *)baseGeometry
{
  NSObject *v3;

  v3 = scn_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[SCNSkinner setBaseGeometry:].cold.1();
}

- (void)_setBaseGeometry:(id)a3
{
  SCNGeometry *baseGeometry;

  if (a3)
  {
    baseGeometry = self->_baseGeometry;
    if (baseGeometry != a3)
    {

      self->_baseGeometry = (SCNGeometry *)a3;
    }
  }
}

+ (__C3DSkinner)_createSkinnerWithBones:(id)a3 boneWeights:(id)a4 boneIndices:(id)a5 baseGeometry:(id)a6
{
  uint64_t v9;
  __int16 v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  NSObject *v18;
  size_t *v19;
  __C3DSkinner *v20;
  NSObject *v21;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  __int16 v38;
  NSObject *v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint8_t buf[4];
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a3, "count");
  v10 = v9;
  if (v9 < 2)
  {
    v19 = (size_t *)C3DSkinCreateWith(0, (__int16)v9, 0, (const void *)objc_msgSend(a6, "__CFObject"));
    C3DSkinSetMaxInfluencesPerVertex((uint64_t)v19, 1);
  }
  else
  {
    v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a6, "geometrySourcesForSemantic:", CFSTR("kGeometrySourceSemanticVertex")), "firstObject"), "vectorCount");
    v12 = objc_msgSend((id)objc_msgSend(a4, "data"), "length");
    v13 = objc_msgSend(a4, "bytesPerComponent");
    v14 = objc_msgSend((id)objc_msgSend(a5, "data"), "length");
    v15 = objc_msgSend(a5, "bytesPerComponent");
    v16 = objc_msgSend(a5, "vectorCount");
    if (v16 != objc_msgSend(a4, "vectorCount") || (v17 = v12 / v11 / v13, v14 / v11 / v15 != v17))
    {
      v21 = scn_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        +[SCNSkinner _createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:].cold.5();
      return 0;
    }
    if (!objc_msgSend(a4, "floatComponents") || objc_msgSend(a4, "bytesPerComponent") != 4)
    {
      v23 = scn_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        +[SCNSkinner _createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:].cold.4();
      return 0;
    }
    if (objc_msgSend(a5, "bytesPerComponent") >= 3)
    {
      v18 = scn_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        +[SCNSkinner _createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:].cold.1();
      return 0;
    }
    v24 = objc_msgSend(a5, "dataStride");
    v25 = objc_msgSend(a5, "componentsPerVector");
    if (v24 != objc_msgSend(a5, "bytesPerComponent") * v25)
    {
      v41 = scn_default_log();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        +[SCNSkinner _createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:].cold.3();
      return 0;
    }
    v26 = objc_msgSend(a4, "dataStride");
    v27 = objc_msgSend(a4, "componentsPerVector");
    if (v26 != objc_msgSend(a4, "bytesPerComponent") * v27)
    {
      v42 = scn_default_log();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        +[SCNSkinner _createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:].cold.2();
      return 0;
    }
    v28 = v17 * v11;
    v19 = (size_t *)C3DSkinCreateWith(v11, v10, v17 * v11, (const void *)objc_msgSend(a6, "__CFObject"));
    C3DSkinSetMaxInfluencesPerVertex((uint64_t)v19, v17);
    v44 = 0;
    v45 = 0;
    v43 = 0;
    C3DSkinGetVertexWeightsPointers(v19, &v45, &v44, &v43);
    v29 = v45;
    if (v45 && (v11 & 0x8000000000000000) == 0)
    {
      v30 = 0;
      v31 = v11 + 1;
      do
      {
        *v29++ = v30 * v17;
        ++v30;
        --v31;
      }
      while (v31);
    }
    v32 = objc_msgSend((id)objc_msgSend(a5, "data"), "bytes");
    v33 = objc_msgSend((id)objc_msgSend(a5, "data"), "bytes");
    v34 = objc_msgSend((id)objc_msgSend(a4, "data"), "bytes");
    v35 = objc_msgSend(a5, "bytesPerComponent");
    if (v28 >= 1)
    {
      v36 = v35;
      for (i = 0; i != v28; ++i)
      {
        if (v36 == 1)
          v38 = *(unsigned __int8 *)(v32 + i);
        else
          v38 = *(_WORD *)(v33 + 2 * i);
        *(_WORD *)(v44 + 2 * i) = v38;
        if (v43)
          *(_DWORD *)(v43 + 4 * i) = *(_DWORD *)(v34 + 4 * i);
        if (v38 < 0)
        {
          v39 = scn_default_log();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            v40 = *(__int16 *)(v44 + 2 * i);
            *(_DWORD *)buf = 67109120;
            v47 = v40;
            _os_log_error_impl(&dword_1DCCB8000, v39, OS_LOG_TYPE_ERROR, "Error: skinner: invalid index (%d)", buf, 8u);
          }
          *(_WORD *)(v44 + 2 * i) = -1;
        }
      }
    }
    C3DSkinPackWeightAndIndices(v19);
  }
  v20 = (__C3DSkinner *)C3DSkinnerCreateWithSkin(v19);
  CFRelease(v19);
  return v20;
}

+ (__C3DSkinner)_createSkinnerWithCompressedData:(id)a3 bonesCount:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unsigned __int8 *v13;
  unint64_t v14;
  unint64_t v15;
  unsigned int v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  NSObject *v31;
  __C3DSkinner *v32;
  unsigned __int8 *v33;
  uint64_t *v34;
  unint64_t v35;
  unsigned int v36;
  unsigned __int8 *v37;
  unint64_t v38;
  unsigned __int8 *v39;
  _WORD *v40;
  float *v41;
  __int16 v42;
  unsigned int v43;
  _WORD *v44;
  float *v45;
  __int16 v46;
  unsigned __int16 *v47;
  _WORD *v48;
  float *v49;
  __int16 v50;
  unsigned int v51;
  NSObject *v52;
  _WORD *v53;
  float *v54;
  __int16 v55;
  float *v57;
  _WORD *v58;
  uint64_t *v59;

  if (objc_msgSend(a3, "count") != 3)
  {
    if (objc_msgSend(a3, "count") != 1)
    {
      v18 = scn_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        +[SCNSkinner _createSkinnerWithCompressedData:bonesCount:vertexCount:].cold.3(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    v11 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
    v12 = objc_msgSend(v11, "length");
    v8 = 0;
    v10 = 0;
    v17 = 1;
    goto LABEL_14;
  }
  v8 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  if (objc_msgSend(v8, "length") == a5)
  {
    LOWORD(v9) = 1;
    v10 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 2);
    v12 = objc_msgSend(v11, "length");
    if (!v8)
    {
      v17 = 1;
      goto LABEL_15;
    }
    v13 = (unsigned __int8 *)objc_msgSend(v8, "bytes");
    if (a5)
    {
      v9 = 1;
      v14 = a5;
      do
      {
        v16 = *v13++;
        v15 = v16;
        if (v9 <= v16)
          v9 = v15;
        --v14;
      }
      while (v14);
      v17 = 0;
LABEL_15:
      v26 = (_QWORD *)C3DSkinCreateWith(a5, (__int16)a4, v12, 0);
      C3DSkinSetMaxInfluencesPerVertex((uint64_t)v26, v9);
      if (a4 < 2)
      {
LABEL_56:
        v32 = (__C3DSkinner *)C3DSkinnerCreateWithSkin(v26);
        CFRelease(v26);
        return v32;
      }
      v58 = 0;
      v59 = 0;
      v57 = 0;
      C3DSkinGetVertexWeightsPointers(v26, &v59, &v58, &v57);
      if (v17)
      {
        if (a5)
        {
          v27 = 0;
          v28 = v59;
          v29 = a5;
          do
          {
            if (v27 >= v12)
              v30 = v12 - 1;
            else
              v30 = v27;
            if (v27 < v12)
              ++v27;
            *v28++ = v30;
            --v29;
          }
          while (v29);
          goto LABEL_34;
        }
      }
      else
      {
        v33 = (unsigned __int8 *)objc_msgSend(v8, "bytes");
        if (a5)
        {
          v27 = 0;
          v34 = v59;
          v35 = a5;
          do
          {
            *v34++ = v27;
            v36 = *v33++;
            v27 += v36;
            --v35;
          }
          while (v35);
          goto LABEL_34;
        }
      }
      v27 = 0;
LABEL_34:
      v59[a5] = v27;
      v37 = (unsigned __int8 *)objc_msgSend(v11, "bytes");
      if (v10)
      {
        v38 = objc_msgSend(v10, "length") / (unint64_t)v12;
        if (v38 == 2)
        {
          v47 = (unsigned __int16 *)objc_msgSend(v10, "bytes");
          if (v12 >= 1)
          {
            v49 = v57;
            v48 = v58;
            do
            {
              v50 = *v37++;
              *v48++ = v50;
              v51 = *v47++;
              *v49++ = (float)v51 / 65535.0;
              --v12;
            }
            while (v12);
          }
        }
        else if (v38 == 1)
        {
          v39 = (unsigned __int8 *)objc_msgSend(v10, "bytes");
          if (v12 >= 1)
          {
            v41 = v57;
            v40 = v58;
            do
            {
              v42 = *v37++;
              *v40++ = v42;
              v43 = *v39++;
              *v41++ = (float)v43 / 255.0;
              --v12;
            }
            while (v12);
          }
        }
        else
        {
          v52 = scn_default_log();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            +[SCNSkinner _createSkinnerWithCompressedData:bonesCount:vertexCount:].cold.1();
          if (v12 >= 1)
          {
            v54 = v57;
            v53 = v58;
            do
            {
              v55 = *v37++;
              *v53++ = v55;
              *v54++ = 1.0;
              --v12;
            }
            while (v12);
          }
        }
      }
      else if (v12 >= 1)
      {
        v45 = v57;
        v44 = v58;
        do
        {
          v46 = *v37++;
          *v44++ = v46;
          *v45++ = 1.0;
          --v12;
        }
        while (v12);
      }
      C3DSkinPackWeightAndIndices(v26);
      goto LABEL_56;
    }
    v17 = 0;
LABEL_14:
    LOWORD(v9) = 1;
    goto LABEL_15;
  }
  v31 = scn_default_log();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    +[SCNSkinner _createSkinnerWithCompressedData:bonesCount:vertexCount:].cold.2();
  return 0;
}

+ (SCNSkinner)skinnerWithBaseGeometry:(SCNGeometry *)baseGeometry bones:(NSArray *)bones boneInverseBindTransforms:(NSArray *)boneInverseBindTransforms boneWeights:(SCNGeometrySource *)boneWeights boneIndices:(SCNGeometrySource *)boneIndices
{
  NSUInteger v13;
  uint64_t v14;
  const void *v15;
  void *v16;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;

  if (bones && -[NSArray count](bones, "count"))
  {
    if (baseGeometry)
    {
      v13 = -[NSArray count](bones, "count");
      if (v13 == -[NSArray count](boneInverseBindTransforms, "count"))
      {
        v14 = objc_msgSend(a1, "_createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:", bones, boneWeights, boneIndices, baseGeometry);
        if (v14)
        {
          v15 = (const void *)v14;
          v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSkinnerRef:", v14);
          CFRelease(v15);
          objc_msgSend(v16, "setBones:", bones);
          objc_msgSend(v16, "setBoneInverseBindTransforms:", boneInverseBindTransforms);
          objc_msgSend(v16, "_setBaseGeometry:", baseGeometry);
          objc_msgSend(v16, "_setSkeleton:", _commonAncessor_0(bones));
          return (SCNSkinner *)v16;
        }
      }
      else
      {
        v20 = scn_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          +[SCNSkinner skinnerWithBaseGeometry:bones:boneInverseBindTransforms:boneWeights:boneIndices:].cold.3();
      }
    }
    else
    {
      v19 = scn_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        +[SCNSkinner skinnerWithBaseGeometry:bones:boneInverseBindTransforms:boneWeights:boneIndices:].cold.2();
    }
  }
  else
  {
    v18 = scn_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[SCNSkinner skinnerWithBaseGeometry:bones:boneInverseBindTransforms:boneWeights:boneIndices:].cold.1();
  }
  return 0;
}

+ (id)_skinnerWithBaseGeometry:(id)a3 skinnableGeometry:(id)a4 bones:(id)a5 boneInverseBindTransforms:(id)a6 bindMatrix:(SCNMatrix4 *)a7
{
  uint64_t Mesh;
  id result;
  id v14;
  const void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  _OWORD v19[4];

  Mesh = C3DGeometryGetMesh(objc_msgSend(a4, "geometryRef"));
  result = (id)C3DSkinCreateWithSkinnableMesh(Mesh, (__int16)objc_msgSend(a5, "count"));
  if (result)
  {
    v14 = result;
    v15 = (const void *)C3DSkinnerCreateWithSkin(result);
    CFRelease(v14);
    v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSkinnerRef:", v15);
    CFRelease(v15);
    objc_msgSend(v16, "setBones:", a5);
    objc_msgSend(v16, "setBoneInverseBindTransforms:", a6);
    v17 = *(_OWORD *)&a7->m21;
    v19[0] = *(_OWORD *)&a7->m11;
    v19[1] = v17;
    v18 = *(_OWORD *)&a7->m41;
    v19[2] = *(_OWORD *)&a7->m31;
    v19[3] = v18;
    objc_msgSend(v16, "setBaseGeometryBindTransform:", v19);
    objc_msgSend(v16, "_setBaseGeometry:", a3);
    objc_msgSend(v16, "_setSkeleton:", _commonAncessor_0(a5));
    return v16;
  }
  return result;
}

- (SCNMatrix4)baseGeometryBindTransform
{
  __C3DScene *v5;
  uint64_t v6;
  SCNMatrix4 *result;
  uint64_t DefaultShapeMatrix;

  *retstr = SCNMatrix4Identity;
  v5 = -[SCNSkinner sceneRef](self, "sceneRef");
  v6 = (uint64_t)v5;
  if (v5)
    C3DSceneLock((uint64_t)v5);
  result = (SCNMatrix4 *)C3DGeometryGetOverrideMaterial((uint64_t)self->_skinner);
  if (result)
  {
    DefaultShapeMatrix = C3DSkinGetDefaultShapeMatrix((uint64_t)result);
    C3DMatrix4x4ToSCNMatrix4(DefaultShapeMatrix, retstr);
  }
  if (v6)
    return (SCNMatrix4 *)C3DSceneUnlock(v6);
  return result;
}

- (void)setBaseGeometryBindTransform:(SCNMatrix4 *)baseGeometryBindTransform
{
  __C3DScene *v5;
  uint64_t v6;
  uint64_t OverrideMaterial;
  uint64_t v8;
  __int128 v9[4];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v5 = -[SCNSkinner sceneRef](self, "sceneRef");
  v6 = (uint64_t)v5;
  if (v5)
    C3DSceneLock((uint64_t)v5);
  OverrideMaterial = C3DGeometryGetOverrideMaterial((uint64_t)self->_skinner);
  if (OverrideMaterial)
  {
    v8 = OverrideMaterial;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    C3DMatrix4x4FromSCNMatrix4(&v10, (uint64_t)baseGeometryBindTransform);
    v9[0] = v10;
    v9[1] = v11;
    v9[2] = v12;
    v9[3] = v13;
    C3DSkinSetDefaultShapeMatrix(v8, v9);
  }
  if (v6)
    C3DSceneUnlock(v6);
}

- (SCNGeometrySource)boneWeights
{
  __C3DScene *v3;
  uint64_t v4;
  SCNGeometrySource *v5;
  _QWORD *OverrideMaterial;
  uint64_t MTLVertexFormat;
  uint64_t MaxInfluencesPerVertex;
  float *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float *v18;
  float v19;
  uint64_t v20;
  float v21;
  float *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;

  v3 = -[SCNSkinner sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  if (C3DSkinnerHasOnlyOneJoint((uint64_t)self->_skinner))
  {
    v5 = 0;
    if (!v4)
      return v5;
    goto LABEL_27;
  }
  v26 = v4;
  OverrideMaterial = (_QWORD *)C3DGeometryGetOverrideMaterial((uint64_t)self->_skinner);
  MTLVertexFormat = C3DMeshSourceGetMTLVertexFormat((uint64_t)OverrideMaterial);
  MaxInfluencesPerVertex = (int)C3DSkinGetMaxInfluencesPerVertex((uint64_t)OverrideMaterial);
  v28 = 0;
  v29 = 0;
  C3DSkinGetVertexWeightsPointers(OverrideMaterial, &v28, 0, &v29);
  v9 = (float *)malloc_type_malloc(4 * MTLVertexFormat * MaxInfluencesPerVertex, 0xBF73991AuLL);
  if (MTLVertexFormat >= 1)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = v28;
    v27 = v29;
    v14 = *v28;
    do
    {
      v15 = v14;
      v14 = v13[++v12];
      v16 = v14 - v15;
      if (v14 - v15 >= MaxInfluencesPerVertex)
        v17 = MaxInfluencesPerVertex;
      else
        v17 = v14 - v15;
      if (v17 < 1)
      {
        v17 = 0;
        v19 = 0.0;
      }
      else
      {
        v18 = (float *)(v27 + 4 * v10);
        v19 = 0.0;
        v20 = v17;
        do
        {
          v21 = *v18++;
          v19 = v19 + v21;
          v9[v11++] = v21;
          --v20;
        }
        while (v20);
        v10 += v17;
      }
      if (MaxInfluencesPerVertex > v17)
      {
        bzero(&v9[v11], 4 * (MaxInfluencesPerVertex - v17));
        v11 = v11 + MaxInfluencesPerVertex - v17;
      }
      if (v16 > MaxInfluencesPerVertex && v19 > 0.0 && (int)MaxInfluencesPerVertex >= 1)
      {
        v23 = &v9[v11 - MaxInfluencesPerVertex];
        v24 = MaxInfluencesPerVertex;
        do
        {
          *v23 = *v23 / v19;
          ++v23;
          --v24;
        }
        while (v24);
      }
    }
    while (v12 != MTLVertexFormat);
  }
  v5 = +[SCNGeometrySource geometrySourceWithData:semantic:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:](SCNGeometrySource, "geometrySourceWithData:semantic:vectorCount:floatComponents:componentsPerVector:bytesPerComponent:dataOffset:dataStride:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v9, 4 * MTLVertexFormat * MaxInfluencesPerVertex, 1), CFSTR("kGeometrySourceSemanticBoneWeights"), MTLVertexFormat, 1, MaxInfluencesPerVertex, 4, 0, 0);
  v4 = v26;
  if (v26)
LABEL_27:
    C3DSceneUnlock(v4);
  return v5;
}

- (SCNGeometrySource)boneIndices
{
  __C3DScene *v3;
  uint64_t v4;
  SCNGeometrySource *v5;
  _QWORD *OverrideMaterial;
  uint64_t MaxInfluencesPerVertex;
  uint64_t MTLVertexFormat;
  _WORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int16 *v19;
  uint64_t v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;

  v3 = -[SCNSkinner sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  if (C3DSkinnerHasOnlyOneJoint((uint64_t)self->_skinner))
  {
    v5 = 0;
    if (!v4)
      return v5;
    goto LABEL_28;
  }
  v40 = v4;
  OverrideMaterial = (_QWORD *)C3DGeometryGetOverrideMaterial((uint64_t)self->_skinner);
  MaxInfluencesPerVertex = (int)C3DSkinGetMaxInfluencesPerVertex((uint64_t)OverrideMaterial);
  MTLVertexFormat = C3DMeshSourceGetMTLVertexFormat((uint64_t)OverrideMaterial);
  v41 = 0;
  v42 = 0;
  v39 = (uint64_t)OverrideMaterial;
  C3DSkinGetVertexWeightsPointers(OverrideMaterial, &v41, &v42, 0);
  v9 = malloc_type_malloc(2 * MaxInfluencesPerVertex * MTLVertexFormat, 0x31752252uLL);
  if (MTLVertexFormat < 1)
  {
    v11 = 0;
    v10 = 0;
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = v41;
    v14 = v42;
    v15 = *v41;
    do
    {
      v16 = v15;
      v15 = v13[++v12];
      v17 = v15 - v16;
      if (v17 >= MaxInfluencesPerVertex)
        v18 = MaxInfluencesPerVertex;
      else
        v18 = v17;
      if (v18 < 1)
      {
        v18 = 0;
      }
      else
      {
        v19 = (__int16 *)(v14 + 2 * v10);
        v20 = v18;
        do
        {
          v21 = *v19++;
          v9[v11++] = v21;
          --v20;
        }
        while (v20);
        v10 += v18;
      }
      if (MaxInfluencesPerVertex > v18)
      {
        bzero(&v9[v11], 2 * (MaxInfluencesPerVertex - v18));
        v11 = v11 + MaxInfluencesPerVertex - v18;
      }
    }
    while (v12 != MTLVertexFormat);
  }
  if (v10 > C3DSkinGetWeightsCount(v39))
  {
    v22 = scn_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[SCNSkinner boneIndices].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);
  }
  if (v11 != MTLVertexFormat * MaxInfluencesPerVertex)
  {
    v30 = scn_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      -[SCNSkinner boneIndices].cold.1(v30, v31, v32, v33, v34, v35, v36, v37);
  }
  v5 = +[SCNGeometrySource _geometrySourceWithData:semantic:vectorCount:componentType:componentCount:dataOffset:dataStride:](SCNGeometrySource, "_geometrySourceWithData:semantic:vectorCount:componentType:componentCount:dataOffset:dataStride:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v9, 2 * MTLVertexFormat * MaxInfluencesPerVertex, 1), CFSTR("kGeometrySourceSemanticBoneIndices"), MTLVertexFormat, 14, MaxInfluencesPerVertex, 0, 0);
  v4 = v40;
  if (v40)
LABEL_28:
    C3DSceneUnlock(v4);
  return v5;
}

- (NSArray)boneInverseBindTransforms
{
  __C3DScene *v3;
  uint64_t v4;
  uint64_t OverrideMaterial;
  NSArray *v6;
  uint64_t v7;
  uint64_t InverseBindMatricesPtr;
  _OWORD v10[4];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v3 = -[SCNSkinner sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  OverrideMaterial = C3DGeometryGetOverrideMaterial((uint64_t)self->_skinner);
  v6 = (NSArray *)OverrideMaterial;
  if (OverrideMaterial)
  {
    LODWORD(v7) = C3DSkinGetJointsCount(OverrideMaterial);
    InverseBindMatricesPtr = C3DSkinGetInverseBindMatricesPtr((uint64_t)v6);
    v6 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (int)v7);
    if ((int)v7 >= 1)
    {
      v7 = (unsigned __int16)v7;
      do
      {
        v13 = 0u;
        v14 = 0u;
        v11 = 0u;
        v12 = 0u;
        C3DMatrix4x4ToSCNMatrix4(InverseBindMatricesPtr, &v11);
        v10[0] = v11;
        v10[1] = v12;
        v10[2] = v13;
        v10[3] = v14;
        -[NSArray addObject:](v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSCNMatrix4:", v10));
        InverseBindMatricesPtr += 64;
        --v7;
      }
      while (v7);
    }
  }
  if (v4)
    C3DSceneUnlock(v4);
  return v6;
}

- (void)setBoneInverseBindTransforms:(id)a3
{
  __C3DScene *v5;
  uint64_t v6;
  uint64_t OverrideMaterial;
  uint64_t JointsCount;
  uint64_t InverseBindMatricesPtr;
  _OWORD *v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  _OWORD v14[4];

  v5 = -[SCNSkinner sceneRef](self, "sceneRef");
  v6 = (uint64_t)v5;
  if (v5)
  {
    C3DSceneLock((uint64_t)v5);
    OverrideMaterial = C3DGeometryGetOverrideMaterial((uint64_t)self->_skinner);
    if (!OverrideMaterial)
    {
LABEL_13:
      C3DSceneUnlock(v6);
      return;
    }
  }
  else
  {
    OverrideMaterial = C3DGeometryGetOverrideMaterial((uint64_t)self->_skinner);
    if (!OverrideMaterial)
      return;
  }
  JointsCount = (int)C3DSkinGetJointsCount(OverrideMaterial);
  if (objc_msgSend(a3, "count") == JointsCount)
  {
    InverseBindMatricesPtr = C3DSkinGetInverseBindMatricesPtr(OverrideMaterial);
    if ((_DWORD)JointsCount)
    {
      v10 = (_OWORD *)InverseBindMatricesPtr;
      for (i = 0; i != JointsCount; ++i)
      {
        v12 = (void *)objc_msgSend(a3, "objectAtIndex:", i, 0, 0, 0, 0, 0, 0, 0, 0);
        if (v12)
          objc_msgSend(v12, "SCNMatrix4Value");
        else
          memset(v14, 0, sizeof(v14));
        C3DMatrix4x4FromSCNMatrix4(v10, (uint64_t)v14);
        v10 += 4;
      }
    }
    C3DSkinInverseBindMatricesHaveChanged(OverrideMaterial);
    if (v6)
      goto LABEL_13;
  }
  else
  {
    v13 = scn_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SCNSkinner setBoneInverseBindTransforms:].cold.1(JointsCount, a3, v13);
  }
}

- (NSArray)bones
{
  __C3DScene *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSArray *v7;
  uint64_t i;

  v3 = -[SCNSkinner sceneRef](self, "sceneRef");
  v4 = (uint64_t)v3;
  if (v3)
    C3DSceneLock((uint64_t)v3);
  v5 = (void *)objc_msgSend((id)C3DSkinnerGetJoints((uint64_t)self->_skinner), "copy");
  v6 = objc_msgSend(v5, "count");
  v7 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
  if (v6)
  {
    for (i = 0; i != v6; ++i)
      -[NSArray addObject:](v7, "addObject:", +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", objc_msgSend(v5, "objectAtIndex:", i)));
  }

  if (v4)
    C3DSceneUnlock(v4);
  return v7;
}

- (void)setBones:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __C3DScene *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v5, "addObject:", objc_msgSend(v10, "nodeRef"));
        objc_msgSend(v10, "setIsJoint:", 1);
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  v11 = -[SCNSkinner sceneRef](self, "sceneRef");
  if (v11)
  {
    v12 = (uint64_t)v11;
    C3DSceneLock((uint64_t)v11);
    C3DSkinnerSetJoints((uint64_t)self->_skinner, v5);
    C3DSceneUnlock(v12);
  }
  else
  {
    C3DSkinnerSetJoints((uint64_t)self->_skinner, v5);
  }
}

- (void)__CFObject
{
  return self->_skinner;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *v5;
  _QWORD *OverrideMaterial;
  uint64_t MTLVertexFormat;
  uint64_t WeightsCount;
  int MaxInfluencesPerVertex;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  _WORD *v22;
  float *v23;
  float v24;
  int v25;
  uint64_t v26;
  SCNGeometrySource *v27;
  const __CFString *v28;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  const char *v33;
  id v34;
  _OWORD v35[4];
  uint64_t v36;
  uint64_t v37;
  float *v38;
  _OWORD v39[4];
  uint8_t buf[4];
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "encodeObject:forKey:", -[SCNSkinner skeleton](self, "skeleton"), CFSTR("skeleton"));
  objc_msgSend(a3, "encodeObject:forKey:", -[SCNSkinner baseGeometry](self, "baseGeometry"), CFSTR("baseGeometry"));
  if (self)
    -[SCNSkinner baseGeometryBindTransform](self, "baseGeometryBindTransform");
  else
    memset(v39, 0, sizeof(v39));
  SCNEncodeSCNMatrix4(a3, CFSTR("baseGeometryBindTransform"), (uint64_t)v39);
  v5 = -[SCNSkinner bones](self, "bones");
  objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("bones"));
  if (-[NSArray count](v5, "count") >= 2)
  {
    if (self->_bonesAndIndicesCompression)
    {
      OverrideMaterial = (_QWORD *)C3DGeometryGetOverrideMaterial((uint64_t)self->_skinner);
      MTLVertexFormat = C3DMeshSourceGetMTLVertexFormat((uint64_t)OverrideMaterial);
      WeightsCount = C3DSkinGetWeightsCount((uint64_t)OverrideMaterial);
      MaxInfluencesPerVertex = C3DSkinGetMaxInfluencesPerVertex((uint64_t)OverrideMaterial);
      v37 = 0;
      v38 = 0;
      v36 = 0;
      C3DSkinGetVertexWeightsPointers(OverrideMaterial, &v37, &v36, &v38);
      v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", WeightsCount);
      v11 = objc_msgSend(v10, "bytes");
      if (WeightsCount >= 1)
      {
        v12 = v11;
        for (i = 0; i != WeightsCount; ++i)
        {
          v14 = v36;
          if (*(unsigned __int16 *)(v36 + 2 * i) >= 0x100u)
          {
            v15 = scn_default_log();
            v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
            v14 = v36;
            if (v16)
            {
              v17 = *(__int16 *)(v36 + 2 * i);
              *(_DWORD *)buf = 67109120;
              v41 = v17;
              _os_log_error_impl(&dword_1DCCB8000, v15, OS_LOG_TYPE_ERROR, "Error: Bones index too large for compressed representation : %d", buf, 8u);
              v14 = v36;
            }
          }
          *(_BYTE *)(v12 + i) = *(_WORD *)(v14 + 2 * i);
        }
      }
      if (MaxInfluencesPerVertex <= 1)
      {
        v26 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v10);
      }
      else
      {
        v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", MTLVertexFormat);
        v19 = objc_msgSend(v18, "bytes");
        if (MTLVertexFormat >= 1)
        {
          for (j = 0; j != MTLVertexFormat; ++j)
            *(_BYTE *)(v19 + j) = *(_DWORD *)(v37 + 8 * j + 8) - *(_QWORD *)(v37 + 8 * j);
        }
        v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 2 * WeightsCount);
        v22 = (_WORD *)objc_msgSend(v21, "bytes");
        if (WeightsCount >= 1)
        {
          v23 = v38;
          do
          {
            v24 = *v23++;
            v25 = (int)rintf(v24 * 65535.0);
            if (v25 >= 0xFFFF)
              v25 = 0xFFFF;
            *v22++ = v25 & ~(unsigned __int16)(v25 >> 31);
            --WeightsCount;
          }
          while (WeightsCount);
        }
        v26 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v18, v21, v10, 0);
      }
      v27 = (SCNGeometrySource *)v26;
      v28 = CFSTR("compressedSkinData");
    }
    else
    {
      objc_msgSend(a3, "encodeObject:forKey:", -[SCNSkinner boneWeights](self, "boneWeights"), CFSTR("boneWeights"));
      v27 = -[SCNSkinner boneIndices](self, "boneIndices");
      v28 = CFSTR("boneIndices");
    }
    objc_msgSend(a3, "encodeObject:forKey:", v27, v28);
  }
  v29 = -[SCNSkinner boneInverseBindTransforms](self, "boneInverseBindTransforms");
  v30 = -[NSArray count](v29, "count");
  if (v30)
  {
    v31 = v30;
    for (k = 0; k != v31; ++k)
    {
      v33 = (const char *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("baseGeometryBindTransform-%d"), k);
      v34 = -[NSArray objectAtIndex:](v29, "objectAtIndex:", k);
      if (v34)
        objc_msgSend(v34, "SCNMatrix4Value");
      else
        memset(v35, 0, sizeof(v35));
      SCNEncodeSCNMatrix4(a3, v33, (uint64_t)v35);
    }
  }
}

- (SCNSkinner)initWithCoder:(id)a3
{
  SCNSkinner *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  _OWORD v19[4];
  _OWORD v20[4];
  _OWORD v21[4];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)SCNSkinner;
  v4 = -[SCNSkinner init](&v26, sel_init);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("skeleton"));
    v7 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseGeometry"));
    v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "geometrySourcesForSemantic:", CFSTR("kGeometrySourceSemanticVertex")), "firstObject"), "vectorCount");
    v9 = (void *)objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("bones"));
    v10 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("compressedSkinData"));
    if (v10)
    {
      v4->_bonesAndIndicesCompression = 1;
      v11 = objc_msgSend((id)objc_opt_class(), "_createSkinnerWithCompressedData:bonesCount:vertexCount:", v10, objc_msgSend(v9, "count"), v8);
    }
    else
    {
      v12 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("boneWeights"));
      v13 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("boneIndices"));
      v11 = objc_msgSend((id)objc_opt_class(), "_createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:", v9, v12, v13, v7);
    }
    v4->_skinner = (__C3DSkinner *)v11;
    if (v11)
    {
      v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = objc_msgSend(v9, "count");
      if (v15)
      {
        v16 = v15;
        for (i = 0; i != v16; ++i)
        {
          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          SCNDecodeSCNMatrix4(a3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("baseGeometryBindTransform-%d"), i), &v22);
          v21[0] = v22;
          v21[1] = v23;
          v21[2] = v24;
          v21[3] = v25;
          objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSCNMatrix4:", v21));
        }
      }
      -[SCNSkinner _setBaseGeometry:](v4, "_setBaseGeometry:", v7);
      -[SCNSkinner setBones:](v4, "setBones:", v9);
      SCNDecodeSCNMatrix4(a3, (uint64_t)CFSTR("baseGeometryBindTransform"), v20);
      v19[0] = v20[0];
      v19[1] = v20[1];
      v19[2] = v20[2];
      v19[3] = v20[3];
      -[SCNSkinner setBaseGeometryBindTransform:](v4, "setBaseGeometryBindTransform:", v19);
      -[SCNSkinner setBoneInverseBindTransforms:](v4, "setBoneInverseBindTransforms:", v14);
      -[SCNSkinner setSkeleton:](v4, "setSkeleton:", v6);
      +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (__C3DScene)sceneRef
{
  return (__C3DScene *)C3DGetScene((_QWORD *)-[SCNSkinner __CFObject](self, "__CFObject"));
}

- (id)scene
{
  id result;

  result = -[SCNSkinner sceneRef](self, "sceneRef");
  if (result)
    return C3DEntityGetObjCWrapper((id *)result);
  return result;
}

- (void)setBaseGeometry:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: SCNSkinner setBaseGeometry is deprecated on iOS10 and OS X 10.12 and has no effect", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)_createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: SCNSkinner: bone indices must be uint8 or uint16 (maximum of 2 bytes)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)_createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: SCNSkinner: bone weights stride must be equal to componentsPerVector * bytesPerComponent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)_createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: SCNSkinner: bone indices stride must be equal to componentsPerVector * bytesPerComponent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)_createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
}

+ (void)_createSkinnerWithBones:boneWeights:boneIndices:baseGeometry:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: SCNSkinner: there must be the same number of bone weights and bone indices", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)_createSkinnerWithCompressedData:bonesCount:vertexCount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Unreachable code: Unsupported bytes per weight", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)_createSkinnerWithCompressedData:bonesCount:vertexCount:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: mismatch between the vertex count and the number of bones per vertex", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)_createSkinnerWithCompressedData:(uint64_t)a3 bonesCount:(uint64_t)a4 vertexCount:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. skinner: invalid compressed data", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)skinnerWithBaseGeometry:bones:boneInverseBindTransforms:boneWeights:boneIndices:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: can't create a skinner with no bones", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)skinnerWithBaseGeometry:bones:boneInverseBindTransforms:boneWeights:boneIndices:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: can't create a skinner with no base geometry", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)skinnerWithBaseGeometry:bones:boneInverseBindTransforms:boneWeights:boneIndices:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: bones count and bind transform count don't match", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)boneIndices
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. boneIndices - failed to deindex", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setBoneInverseBindTransforms:(NSObject *)a3 .cold.1(__int16 a1, void *a2, NSObject *a3)
{
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4[0] = 67109376;
  v4[1] = a1;
  v5 = 1024;
  v6 = objc_msgSend(a2, "count");
  _os_log_error_impl(&dword_1DCCB8000, a3, OS_LOG_TYPE_ERROR, "Error: number of transforms (%d) doesn't match the number of joints (%d)", (uint8_t *)v4, 0xEu);
}

@end
