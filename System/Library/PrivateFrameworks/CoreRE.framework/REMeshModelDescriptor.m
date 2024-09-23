@implementation REMeshModelDescriptor

- (REMeshModelDescriptor)initWithMeshAssetModel:(const void *)a3 inverseBindPoseAttributes:(id)a4 deformerBuilders:(void *)a5 payloadBuilder:(void *)a6 deformationModelData:(void *)a7
{
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  __int128 *v14;
  unint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  REMeshPartDescriptor *v23;
  uint64_t v24;
  void *v25;
  REMeshSkinningModelDescriptor *v26;
  REMeshBlendShapeModelDescriptor *v27;
  NSObject *v28;
  REMeshModelDescriptor *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  REMeshLevelOfDetailDescriptor *v33;
  void *v34;
  const char *v36;
  void *v38;
  id v39;
  id v41;
  id v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  unint64_t v48;
  __int16 v49;
  unint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v39 = a4;
  v41 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v38 = a7;
  v42 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = *((_QWORD *)a3 + 26);
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    v13 = 80;
    v14 = (__int128 *)MEMORY[0x24BDAEE00];
    while (1)
    {
      v15 = *((_QWORD *)a3 + 26);
      if (v15 <= v12)
      {
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v51 = 0u;
        os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136315906;
        v44 = "operator[]";
        v45 = 1024;
        v46 = 797;
        v47 = 2048;
        v48 = v12;
        v49 = 2048;
        v50 = v15;
        _os_log_send_and_compose_impl();
        _os_crash_msg();
        __break(1u);
      }
      v16 = *((_QWORD *)a3 + 28);
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      if (v12 >= *((_QWORD *)a3 + 21))
      {
        v21 = v14[1];
        v51 = *v14;
        v52 = v21;
        v22 = v14[3];
        v53 = v14[2];
        v54 = v22;
      }
      else
      {
        v17 = (_OWORD *)(*((_QWORD *)a3 + 23) + v11);
        v18 = v17[6];
        v19 = v17[7];
        v20 = v17[8];
        v51 = v17[5];
        v52 = v18;
        v53 = v19;
        v54 = v20;
      }
      v23 = -[REMeshPartDescriptor initWithMeshAssetPart:partTransform:payloadBuilder:]([REMeshPartDescriptor alloc], "initWithMeshAssetPart:partTransform:payloadBuilder:", v16 + v13 - 80, &v51, a6);
      if (!v23)
        break;
      v24 = objc_msgSend(*(id *)a6, "count");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObject:", v25);

      objc_msgSend(*(id *)a6, "addObject:", v23);
      ++v12;
      v13 += 256;
      v11 += 144;
      if (v10 == v12)
        goto LABEL_9;
    }
    v28 = (id)*re::assetTypesLogObjects(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v36 = *(const char **)(v16 + v13);
      *(_DWORD *)buf = 136315138;
      v44 = v36;
      _os_log_error_impl(&dword_224FE9000, v28, OS_LOG_TYPE_ERROR, "Failed to create REMeshPartDescriptor for part %s", buf, 0xCu);
    }

    v29 = 0;
  }
  else
  {
LABEL_9:
    if (objc_msgSend(v39, "count") && *((_QWORD *)a3 + 21))
      v26 = -[REMeshSkinningModelDescriptor initWithMeshSkinningData:meshParts:inverseBindPoseAttributes:deformerBuilders:payloadBuilder:]([REMeshSkinningModelDescriptor alloc], "initWithMeshSkinningData:meshParts:inverseBindPoseAttributes:deformerBuilders:payloadBuilder:", (char *)a3 + 152, *((_QWORD *)a3 + 28), *((_QWORD *)a3 + 26), v39, a5, a6);
    else
      v26 = 0;
    if (*((_QWORD *)a3 + 16))
      v27 = -[REMeshBlendShapeModelDescriptor initWithMeshBlendShapeData:meshPartCount:payloadBuilder:deformationModelData:]([REMeshBlendShapeModelDescriptor alloc], "initWithMeshBlendShapeData:meshPartCount:payloadBuilder:deformationModelData:", (char *)a3 + 112, *((_QWORD *)a3 + 26), a6, v38);
    else
      v27 = 0;
    v30 = *((_QWORD *)a3 + 36);
    if (v30)
    {
      v31 = *((_QWORD *)a3 + 38);
      v32 = 12 * v30;
      do
      {
        v33 = -[REMeshLevelOfDetailDescriptor initWithLodLevelInfo:]([REMeshLevelOfDetailDescriptor alloc], "initWithLodLevelInfo:", v31);
        objc_msgSend(v42, "addObject:", v33);

        v31 += 12;
        v32 -= 12;
      }
      while (v32);
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *((_QWORD *)a3 + 1));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[REMeshModelDescriptor initWithName:partIndices:skeletonCount:skinningModel:blendShapeModel:lods:boundingBoxMin:boundingBoxMax:](self, "initWithName:partIndices:skeletonCount:skinningModel:blendShapeModel:lods:boundingBoxMin:boundingBoxMax:", v34, v41, objc_msgSend(v39, "count"), v26, v27, v42, *((double *)a3 + 2), *((double *)a3 + 4));

    v29 = self;
  }

  return v29;
}

- (REMeshModelDescriptor)initWithResourceDefinitionModel:(const void *)a3 inverseBindPoseAttributes:(id)a4 deformerBuilders:(void *)a5 payloadBuilder:(void *)a6 levels:(DynamicArray<re:(void *)a8 :MeshResourceDefinition::Level> *)a7 deformationModelData:
{
  id v11;
  int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int *v16;
  uint64_t v17;
  void *v18;
  unint64_t var2;
  REMeshLevelOfDetailDescriptor *v20;
  uint64_t v21;
  REMeshSkinningModelDescriptor *v22;
  REMeshBlendShapeModelDescriptor *v23;
  char *v24;
  void *v25;
  REMeshModelDescriptor *v26;
  void *v30;
  id v32;
  id v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  int v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  unint64_t v42;
  __int16 v43;
  unint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v32 = a4;
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v30 = a6;
  v33 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (*((_QWORD *)a3 + 2))
  {
    v12 = 0;
    v13 = 0;
    do
    {
      v14 = *((_QWORD *)a3 + 4) + 40 * v13;
      v15 = *(_QWORD *)(v14 + 16);
      if (v15)
      {
        v16 = *(unsigned int **)(v14 + 32);
        v17 = 4 * v15;
        do
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18);

          ++v16;
          v17 -= 4;
        }
        while (v17);
        v15 = *(_QWORD *)(v14 + 16);
      }
      v35 = 0;
      v34 = 0;
      var2 = a7->var2;
      if (var2 <= v13)
      {
        v36 = 0;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v45 = 0u;
        os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        v37 = 136315906;
        v38 = "operator[]";
        v39 = 1024;
        v40 = 789;
        v41 = 2048;
        v42 = v13;
        v43 = 2048;
        v44 = var2;
        _os_log_send_and_compose_impl();
        _os_crash_msg();
        __break(1u);
      }
      v12 += v15;
      v34 = *((_QWORD *)a7->var4 + v13);
      v35 = v12;
      v20 = -[REMeshLevelOfDetailDescriptor initWithLodLevelInfo:]([REMeshLevelOfDetailDescriptor alloc], "initWithLodLevelInfo:", &v34);
      objc_msgSend(v33, "addObject:", v20);

      ++v13;
    }
    while (v13 < *((_QWORD *)a3 + 2));
  }
  v21 = *((_QWORD *)a3 + 16);
  v22 = 0;
  if (objc_msgSend(v32, "count") && v21)
    v22 = -[REMeshSkinningModelDescriptor initWithSkinningData:inverseBindPoseAttributes:deformerBuilders:payloadBuilder:]([REMeshSkinningModelDescriptor alloc], "initWithSkinningData:inverseBindPoseAttributes:deformerBuilders:payloadBuilder:", (char *)a3 + 112, v32, a5, v30);
  if (*((_QWORD *)a3 + 21))
    v23 = -[REMeshBlendShapeModelDescriptor initWithBlendShapeData:meshPartCount:payloadBuilder:deformationModelData:]([REMeshBlendShapeModelDescriptor alloc], "initWithBlendShapeData:meshPartCount:payloadBuilder:deformationModelData:", (char *)a3 + 152, objc_msgSend(v11, "count"), v30, a8);
  else
    v23 = 0;
  if ((*((_QWORD *)a3 + 6) & 1) != 0)
    v24 = (char *)*((_QWORD *)a3 + 7);
  else
    v24 = (char *)a3 + 49;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[REMeshModelDescriptor initWithName:partIndices:skeletonCount:skinningModel:blendShapeModel:lods:boundingBoxMin:boundingBoxMax:](self, "initWithName:partIndices:skeletonCount:skinningModel:blendShapeModel:lods:boundingBoxMin:boundingBoxMax:", v25, v11, objc_msgSend(v32, "count"), v22, v23, v33, *((double *)a3 + 10), *((double *)a3 + 12));

  return v26;
}

- (MeshModel)meshModelWithMeshModelContext:(SEL)a3 inverseBindPoseBuffers:(void *)a4 allocator:(const void *)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  unsigned __int8 *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  char *v25;
  uint64_t i;
  DeformationModelData *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  BOOL v36;
  REMeshModelDescriptor *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  int v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t m;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _anonymous_namespace_ *v60;
  id v61;
  _anonymous_namespace_ *v62;
  __int128 v63;
  uint64_t v64;
  __int128 v65;
  Allocator *v66;
  void *v67;
  uint64_t n;
  BOOL v69;
  int v74;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  char *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  Allocator *v100;
  uint64_t v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _OWORD v104[2];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[2];
  int v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  int v113;
  DeformationModelData v114;
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[18];
  __int16 v118;
  unint64_t v119;
  __int16 v120;
  unint64_t v121;
  uint64_t v122;

  v122 = *MEMORY[0x24BDAC8D0];
  -[REMeshModelDescriptor partIndices](self, "partIndices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = 0uLL;
  v100 = 0;
  re::FixedArray<re::MeshPart>::init<>((uint64_t)&v99, (uint64_t)a6, objc_msgSend(v6, "count"));

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  -[REMeshModelDescriptor partIndices](self, "partIndices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v95, v116, 16);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)v96;
    v11 = &v114.var0[12].var0.var1.var0.var0.var0[16];
    do
    {
      v12 = 0;
      v74 = v9;
      v13 = v9;
      v14 = 560 * v9;
      do
      {
        if (*(_QWORD *)v96 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)a4, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * v12), "unsignedIntegerValue"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
          objc_msgSend(v15, "meshPartWithPayloadBuffer:partIndexInModel:", (char *)a4 + 8, v13 + v12);
        else
          bzero(&v114, 0x230uLL);
        v17 = *((_QWORD *)&v99 + 1);
        if (*((_QWORD *)&v99 + 1) <= v13 + v12)
        {
          *(_QWORD *)&v93 = 0;
          v106 = 0u;
          v107 = 0u;
          v105 = 0u;
          memset(v104, 0, sizeof(v104));
          os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          *(_DWORD *)v117 = 136315906;
          *(_QWORD *)&v117[4] = "operator[]";
          *(_WORD *)&v117[12] = 1024;
          *(_DWORD *)&v117[14] = 468;
          v118 = 2048;
          v119 = v12 + v74;
          v120 = 2048;
          v121 = v17;
          _os_log_send_and_compose_impl();
          _os_crash_msg();
          __break(1u);
LABEL_61:
          *(_QWORD *)v117 = 0;
          memset(&v114, 0, 80);
          os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          LODWORD(v104[0]) = 136315906;
          *(_QWORD *)(v11 + 4) = "operator[]";
          WORD6(v104[0]) = 1024;
          *(_DWORD *)(v11 + 14) = 468;
          WORD1(v104[1]) = 2048;
          *(_QWORD *)(v11 + 20) = v13 + (int)v12;
          WORD6(v104[1]) = 2048;
          *(_QWORD *)(v11 + 30) = v16;
          _os_log_send_and_compose_impl();
          _os_crash_msg();
          __break(1u);
LABEL_62:
          v101 = 0;
          v106 = 0u;
          v107 = 0u;
          v105 = 0u;
          memset(v104, 0, sizeof(v104));
          os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          *(_DWORD *)v117 = 136315906;
          *(_QWORD *)&v117[4] = "operator[]";
          *(_WORD *)&v117[12] = 1024;
          *(_DWORD *)&v117[14] = 468;
          v118 = 2048;
          v119 = v12;
          v120 = 2048;
          v121 = v10;
          _os_log_send_and_compose_impl();
          _os_crash_msg();
          __break(1u);
        }
        re::MeshPart::operator=((uint64_t *)((char *)v100 + v14), (uint64_t *)&v114);
        re::StringID::destroyString((re::StringID *)&v114.var0[12].var0.var1.var0.var0.var0[16]);
        re::FixedArray<re::StringID>::deinit(&v114.var0[8].var0.var1.var0.var0.var0[8]);
        re::AttributeTable::~AttributeTable((re::AttributeTable *)&v114);

        ++v12;
        v14 += 560;
      }
      while (v8 != v12);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v95, v116, 16);
      v9 = v13 + v12;
    }
    while (v8);
  }

  -[REMeshModelDescriptor lods](self, "lods");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0uLL;
  v94 = 0;
  re::FixedArray<re::MeshLodLevelInfo>::init<>((uint64_t *)&v93, (uint64_t)a6, objc_msgSend(v18, "count"));

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  -[REMeshModelDescriptor lods](self, "lods");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v89, v115, 16);
  v11 = (unsigned __int8 *)v104;
  if (v20)
  {
    v12 = 0;
    v21 = *(_QWORD *)v90;
    do
    {
      v13 = 0;
      v10 = (int)v12;
      v22 = 12 * (int)v12;
      do
      {
        if (*(_QWORD *)v90 != v21)
          objc_enumerationMutation(v19);
        v23 = objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * v13), "lodLevelInfo");
        v16 = (void *)*((_QWORD *)&v93 + 1);
        if (*((_QWORD *)&v93 + 1) <= (unint64_t)((int)v12 + v13))
          goto LABEL_61;
        v25 = &v94[v22];
        *(_QWORD *)v25 = v23;
        *((_DWORD *)v25 + 2) = v24;
        ++v13;
        v22 += 12;
      }
      while (v20 != v13);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v89, v115, 16);
      v12 = (int)v12 + v13;
    }
    while (v20);
  }

  for (i = 0; i != 720; i += 40)
  {
    v27 = (DeformationModelData *)((char *)&v114 + i);
    v27->var0[0].var0.var0 = 0;
    v27->var0[0].var0.var1.var0.var1 = 0;
  }
  -[REMeshModelDescriptor skinningModel](self, "skinningModel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28 == 0;

  if (!v29)
  {
    DWORD2(v105) = 1;
    *(_QWORD *)&v107 = 0;
    v106 = 0uLL;
    DWORD2(v107) = 0;
    v108[1] = 0;
    v108[0] = 0;
    v109 = 1;
    v112 = 0;
    v110 = 0;
    v111 = 0;
    v113 = 0;
    *(_QWORD *)&v105 = 0;
    *(_QWORD *)&v104[0] = a6;
    *((_QWORD *)&v104[1] + 1) = 0;
    *(_OWORD *)((char *)v104 + 8) = *(_OWORD *)a5;
    re::BucketArray<re::SkinningModelBuilder::RawSkinnedMeshPartData,4ul>::init((uint64_t)&v104[1] + 8, (uint64_t)a6, 1uLL);
    re::BucketArray<re::SkinningModelBuilder::PreparedSkinnedMeshPartData,4ul>::init((uint64_t)v108, (uint64_t)a6, 1uLL);
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    -[REMeshModelDescriptor skinningModel](self, "skinningModel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "skinningParts");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v85, v103, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v86;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v86 != v33)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * j), "addToSkinningModelBuilder:payloadBuffers:", v104, (char *)a4 + 8);
        }
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v85, v103, 16);
      }
      while (v32);
    }

    *(_QWORD *)v117 = 0;
    re::SkinningModelBuilder::buildDeformationModel((re::SkinningModelBuilder *)v104, (id *)v117, &v114);

    re::BucketArray<re::SkinningModelBuilder::PreparedSkinnedMeshPartData,4ul>::~BucketArray((uint64_t)v108);
    re::BucketArray<re::SkinningModelBuilder::RawSkinnedMeshPartData,4ul>::~BucketArray((uint64_t)&v104[1] + 8);
  }
  -[REMeshModelDescriptor blendShapeModel](self, "blendShapeModel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35 == 0;

  v37 = self;
  if (!v36)
  {
    v82 = 0;
    v83 = 0;
    v84 = 0;
    -[REMeshModelDescriptor blendShapeModel](self, "blendShapeModel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "perMeshPartBlendShapeBufferIndex");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    re::FixedArray<int>::init<>(&v82, (uint64_t)a6, objc_msgSend(v39, "count"));

    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    -[REMeshModelDescriptor blendShapeModel](self, "blendShapeModel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "perMeshPartBlendShapeBufferIndex");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v78, v102, 16);
    if (v42)
    {
      v12 = 0;
      v43 = *(_QWORD *)v79;
      do
      {
        for (k = 0; k != v42; ++k)
        {
          if (*(_QWORD *)v79 != v43)
            objc_enumerationMutation(v41);
          v45 = objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * k), "unsignedIntValue");
          v10 = v83;
          if (v83 <= v12)
            goto LABEL_62;
          *(_DWORD *)(v84 + 4 * v12++) = v45;
        }
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v78, v102, 16);
      }
      while (v42);
    }

    -[REMeshModelDescriptor blendShapeModel](self, "blendShapeModel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "blendShapeIndexType") != 0;

    *(_QWORD *)v117 = 0;
    -[REMeshModelDescriptor blendShapeModel](self, "blendShapeModel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "blendShapeBuffers");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    re::BlendShapeModelBuilder::BlendShapeModelBuilder(v104, (uint64_t)a6, (id *)v117, objc_msgSend(v49, "count"), v47, (uint64_t)&v82, (uint64_t *)&v114);

    -[REMeshModelDescriptor blendShapeModel](self, "blendShapeModel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "blendShapeBuffers");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "count");

    if (v52)
    {
      for (m = 0; m != v52; ++m)
      {
        -[REMeshModelDescriptor blendShapeModel](self, "blendShapeModel");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "blendShapeBuffers");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "objectAtIndexedSubscript:", m);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        -[REMeshModelDescriptor blendShapeModel](self, "blendShapeModel");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "blendShapeGroupNames");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectAtIndexedSubscript:", m);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        if (v59)
        {
          v60 = (_anonymous_namespace_ *)objc_msgSend(objc_retainAutorelease(v59), "UTF8String");
          *(_QWORD *)v117 = 0;
          *(_QWORD *)&v117[8] = &str_110;
        }
        else
        {
          re::StringID::invalid((re::StringID *)v117);
        }
        objc_msgSend(v56, "addToBlendShapeModelBuilder:blendShapeIndex:blendShapeGroupName:payloadBuffers:", v104, m, v117, (char *)a4 + 8);
        re::StringID::destroyString((re::StringID *)v117);

      }
    }

    if (v82 && v83)
      (*(void (**)(void))(*(_QWORD *)v82 + 40))();
    v37 = self;
  }
  -[REMeshModelDescriptor name](v37, "name");
  v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v62 = (_anonymous_namespace_ *)objc_msgSend(v61, "UTF8String");
  *(_QWORD *)&retstr->var0.var0 = 0;
  retstr->var0.var1 = (char *)&str_110;
  -[REMeshModelDescriptor boundingBoxMin](self, "boundingBoxMin");
  v77 = v63;
  -[REMeshModelDescriptor boundingBoxMax](self, "boundingBoxMax");
  v64 = 0;
  *(_OWORD *)&retstr->var1.var0.var0.var0.var0 = v77;
  *(_OWORD *)&retstr->var1.var1.var0.var1[1] = v65;
  *(_OWORD *)&retstr->var2.var1 = v99;
  v66 = v100;
  v100 = 0;
  v99 = 0uLL;
  retstr->var3.var0 = v66;
  *(_OWORD *)&retstr->var3.var1 = v93;
  v67 = v94;
  *((_QWORD *)&v93 + 1) = 0;
  v94 = 0;
  retstr->var4.var0[0].var0.var0 = v67;
  *(_QWORD *)&v93 = 0;
  do
  {
    std::unique_ptr<void,std::function<void ()(void *)>>::unique_ptr[abi:nn180100](retstr->var4.var0[v64].var0.var1.var0.var0.var0, (uint64_t *)((char *)&v114 + v64 * 40));
    ++v64;
  }
  while (v64 != 18);

  for (n = 680; n != -40; n -= 40)
    std::unique_ptr<re::RigHierarchy,std::function<void ()(re::RigHierarchy*)>>::~unique_ptr[abi:nn180100]((uint64_t *)((char *)&v114 + n));
  if ((_QWORD)v93)
    v69 = *((_QWORD *)&v93 + 1) == 0;
  else
    v69 = 1;
  if (!v69)
    (*(void (**)(void))(*(_QWORD *)v93 + 40))();
  return (MeshModel *)re::FixedArray<re::MeshPart>::deinit(&v99);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMeshModelDescriptor)initWithName:(REMeshModelDescriptor *)self partIndices:(SEL)a2 skeletonCount:(id)a3 skinningModel:(id)a4 blendShapeModel:(unsigned int)a5 lods:(id)a6 boundingBoxMin:(id)a7 boundingBoxMax:(id)a8
{
  __int128 v8;
  __int128 v9;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  REMeshModelDescriptor *v21;
  uint64_t v22;
  NSString *name;
  uint64_t v24;
  NSArray *partIndices;
  uint64_t v26;
  NSArray *lods;
  __int128 v29;
  __int128 v30;
  objc_super v31;

  v29 = v8;
  v30 = v9;
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v31.receiver = self;
  v31.super_class = (Class)REMeshModelDescriptor;
  v21 = -[REMeshModelDescriptor init](&v31, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v16, "copy");
    name = v21->_name;
    v21->_name = (NSString *)v22;

    v24 = objc_msgSend(v17, "copy");
    partIndices = v21->_partIndices;
    v21->_partIndices = (NSArray *)v24;

    v21->_skeletonCount = a5;
    objc_storeStrong((id *)&v21->_skinningModel, a6);
    objc_storeStrong((id *)&v21->_blendShapeModel, a7);
    v26 = objc_msgSend(v20, "copy");
    lods = v21->_lods;
    v21->_lods = (NSArray *)v26;

    *(_OWORD *)v21->_boundingBoxMin = v29;
    *(_OWORD *)v21->_boundingBoxMax = v30;
  }

  return v21;
}

- (REMeshModelDescriptor)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *name;
  NSString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  NSArray *partIndices;
  unint64_t v13;
  char v14;
  REMeshSkinningModelDescriptor *v15;
  REMeshSkinningModelDescriptor *skinningModel;
  REMeshBlendShapeModelDescriptor *v17;
  REMeshBlendShapeModelDescriptor *blendShapeModel;
  void *v19;
  uint64_t v20;
  void *v21;
  NSArray *v22;
  NSArray *lods;
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  NSString *v33;
  int v34;
  void *v35;
  REMeshModelDescriptor *v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v5;

  v7 = self->_name;
  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("partIndices"));
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  partIndices = self->_partIndices;
  self->_partIndices = v11;

  v13 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("skeletonCount"));
  v14 = HIDWORD(v13) != 0;
  self->_skeletonCount = v13;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("skinningModel"));
  v15 = (REMeshSkinningModelDescriptor *)objc_claimAutoreleasedReturnValue();
  skinningModel = self->_skinningModel;
  self->_skinningModel = v15;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("blendShapeModel"));
  v17 = (REMeshBlendShapeModelDescriptor *)objc_claimAutoreleasedReturnValue();
  blendShapeModel = self->_blendShapeModel;
  self->_blendShapeModel = v17;

  v19 = (void *)MEMORY[0x24BDBCF20];
  v20 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("lods"));
  v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
  lods = self->_lods;
  self->_lods = v22;

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v24 = self->_partIndices;
  v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v40 != v26)
          objc_enumerationMutation(v24);
        v14 |= (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "unsignedIntegerValue") >> 32 != 0;
      }
      v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v25);
  }

  *(_QWORD *)self->_boundingBoxMin = 0;
  *(_QWORD *)&self->_boundingBoxMin[8] = 0;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("boundingBoxMin.x"));
  *(_DWORD *)self->_boundingBoxMin = v28;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("boundingBoxMin.y"));
  *(_DWORD *)&self->_boundingBoxMin[4] = v29;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("boundingBoxMin.z"));
  *(_QWORD *)self->_boundingBoxMax = 0;
  *(_DWORD *)&self->_boundingBoxMin[8] = v30;
  *(_QWORD *)&self->_boundingBoxMax[8] = 0;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("boundingBoxMax.x"));
  *(_DWORD *)self->_boundingBoxMax = v31;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("boundingBoxMax.y"));
  *(_DWORD *)&self->_boundingBoxMax[4] = v32;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("boundingBoxMax.z"));
  *(_DWORD *)&self->_boundingBoxMax[8] = v34;
  if ((v14 & 1) != 0)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v35);

LABEL_13:
    v36 = 0;
    goto LABEL_14;
  }
  if (!v7)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v37);

    goto LABEL_13;
  }
  v36 = self;
LABEL_14:

  return v36;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_partIndices, CFSTR("partIndices"));
  objc_msgSend(v10, "encodeInt:forKey:", self->_skeletonCount, CFSTR("skeletonCount"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_skinningModel, CFSTR("skinningModel"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_blendShapeModel, CFSTR("blendShapeModel"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_lods, CFSTR("lods"));
  LODWORD(v4) = *(_DWORD *)self->_boundingBoxMin;
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("boundingBoxMin.x"), v4);
  LODWORD(v5) = *(_DWORD *)&self->_boundingBoxMin[4];
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("boundingBoxMin.y"), v5);
  LODWORD(v6) = *(_DWORD *)&self->_boundingBoxMin[8];
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("boundingBoxMin.z"), v6);
  LODWORD(v7) = *(_DWORD *)self->_boundingBoxMax;
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("boundingBoxMax.x"), v7);
  LODWORD(v8) = *(_DWORD *)&self->_boundingBoxMax[4];
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("boundingBoxMax.y"), v8);
  LODWORD(v9) = *(_DWORD *)&self->_boundingBoxMax[8];
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("boundingBoxMax.z"), v9);

}

- (BOOL)validateWithParts:(id)a3 payloadSize:(FixedInlineArray<unsigned)long error:(8UL> *)a4
{
  _anonymous_namespace_ *v8;
  unint64_t v9;
  unint64_t v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  uint64_t i;
  unint64_t v16;
  unint64_t v17;
  REMeshSkinningModelDescriptor *skinningModel;
  REMeshBlendShapeModelDescriptor *blendShapeModel;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  _anonymous_namespace_ *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[2];
  int v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = (_anonymous_namespace_ *)a3;
  v27 = v8;
  v9 = -[_anonymous_namespace_ count](v8, "count");
  v37 = 1;
  v38 = 0;
  v39 = 0;
  v36[1] = 0;
  re::DynamicOverflowArray<unsigned long long,3ul>::setCapacity(v36, 0);
  v37 += 2;
  if ((v9 & 0x3F) != 0)
    v10 = (v9 >> 6) + 1;
  else
    v10 = v9 >> 6;
  v40 = v9;
  v41 = 0;
  re::DynamicOverflowArray<unsigned long long,3ul>::resize((_anonymous_namespace_ *)v36, v10, &v41);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = self->_partIndices;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v33;
    v14 = CFSTR("REMeshModelDescriptor: mesh part index overflow");
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v11);
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "unsignedIntegerValue");
        v17 = v16;
        if (HIDWORD(v16))
          goto LABEL_29;
        if (v16 >= v9)
        {
          v14 = CFSTR("REMeshModelDescriptor: mesh part index out of range");
LABEL_29:
          goto LABEL_34;
        }
        if ((re::DynamicBitset<unsigned long long,256ul>::getBit((uint64_t)v36, v16) & 1) != 0)
        {
          goto LABEL_34;
        }
        re::DynamicBitset<unsigned long long,256ul>::setBit((uint64_t)v36, v17);
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
      if (v12)
        continue;
      break;
    }
  }

  skinningModel = self->_skinningModel;
  if (skinningModel
    && !-[REMeshSkinningModelDescriptor validateWithPayloadSize:parts:partIndices:skeletonCount:error:](skinningModel, "validateWithPayloadSize:parts:partIndices:skeletonCount:error:", a4, v27, self->_partIndices, self->_skeletonCount, a5)|| (blendShapeModel = self->_blendShapeModel) != 0&& !-[REMeshBlendShapeModelDescriptor validateWithPayloadSize:partCount:error:](blendShapeModel, "validateWithPayloadSize:partCount:error:", a4, v9, a5))
  {
    v25 = 0;
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = self->_lods;
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
    if (v20)
    {
      v21 = 0;
      v22 = *(_QWORD *)v29;
LABEL_20:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v11);
        v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v23);
        if ((objc_msgSend(v24, "validateWithPartCount:error:", v9, a5) & 1) == 0)
          break;
        if (v21 >= objc_msgSend(v24, "meshPartEndIndex"))
        {
          break;
        }
        v21 = objc_msgSend(v24, "meshPartEndIndex");
        if (v20 == ++v23)
        {
          v20 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
          v25 = 1;
          if (v20)
            goto LABEL_20;
          goto LABEL_35;
        }
      }
LABEL_34:
      v25 = 0;
    }
    else
    {
      v25 = 1;
    }
LABEL_35:

  }
  if (v36[0] && (v37 & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)v36[0] + 40))();

  return v25;
}

- (unint64_t)estimateContainerSize
{
  objc_class *v3;
  size_t InstanceSize;
  objc_class *v5;
  size_t v6;
  NSString *name;
  uint64_t v8;
  objc_class *v9;
  size_t v10;
  NSArray *partIndices;
  uint64_t v12;
  objc_class *v13;
  size_t v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  size_t v20;
  unint64_t v21;
  unint64_t v22;
  objc_class *v23;
  size_t v24;
  NSArray *lods;
  uint64_t v26;
  NSArray *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  InstanceSize = class_getInstanceSize(v3);
  if (self->_name
    && (v5 = (objc_class *)objc_opt_class(), v6 = class_getInstanceSize(v5),
                                             name = self->_name,
                                             InstanceSize += v6,
                                             name))
  {
    v8 = -[NSString lengthOfBytesUsingEncoding:](name, "lengthOfBytesUsingEncoding:", 4) + 1;
  }
  else
  {
    v8 = 0;
  }
  if (self->_partIndices)
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = class_getInstanceSize(v9);
    partIndices = self->_partIndices;
  }
  else
  {
    partIndices = 0;
    v10 = 0;
  }
  v12 = -[NSArray count](partIndices, "count");
  v13 = (objc_class *)objc_opt_class();
  v14 = class_getInstanceSize(v13);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v15 = self->_partIndices;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  v17 = v8 + InstanceSize + v10 + 8 * v12;
  if (v16)
  {
    v18 = *(_QWORD *)v38;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v38 != v18)
          objc_enumerationMutation(v15);
        if (*(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v19))
          v20 = v14;
        else
          v20 = 0;
        v17 += v20;
        ++v19;
      }
      while (v16 != v19);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v16);
  }

  v21 = -[REMeshSkinningModelDescriptor estimateContainerSize](self->_skinningModel, "estimateContainerSize");
  v22 = -[REMeshBlendShapeModelDescriptor estimateContainerSize](self->_blendShapeModel, "estimateContainerSize");
  if (self->_lods)
  {
    v23 = (objc_class *)objc_opt_class();
    v24 = class_getInstanceSize(v23);
    lods = self->_lods;
  }
  else
  {
    lods = 0;
    v24 = 0;
  }
  v26 = -[NSArray count](lods, "count");
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v27 = self->_lods;
  v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  v29 = v21 + v17 + v22 + v24 + 8 * v26;
  if (v28)
  {
    v30 = *(_QWORD *)v34;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v34 != v30)
          objc_enumerationMutation(v27);
        v29 += objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v31++), "estimateContainerSize", (_QWORD)v33);
      }
      while (v28 != v31);
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v28);
  }

  return v29;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)partIndices
{
  return self->_partIndices;
}

- (unsigned)skeletonCount
{
  return self->_skeletonCount;
}

- (REMeshSkinningModelDescriptor)skinningModel
{
  return self->_skinningModel;
}

- (REMeshBlendShapeModelDescriptor)blendShapeModel
{
  return self->_blendShapeModel;
}

- (NSArray)lods
{
  return self->_lods;
}

- (__n128)boundingBoxMin
{
  return a1[4];
}

- (__n128)boundingBoxMax
{
  return a1[5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lods, 0);
  objc_storeStrong((id *)&self->_blendShapeModel, 0);
  objc_storeStrong((id *)&self->_skinningModel, 0);
  objc_storeStrong((id *)&self->_partIndices, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
