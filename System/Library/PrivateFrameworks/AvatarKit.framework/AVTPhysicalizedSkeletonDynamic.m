@implementation AVTPhysicalizedSkeletonDynamic

- (NSString)description
{
  void *v3;
  SCNNode *rootJoint;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  rootJoint = self->_rootJoint;
  -[SCNNode name](self->_drivingNode, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<AVTPhysicalizedMorpherDynamic: %p> Skeleton %p driven by \"%@\"), self, rootJoint, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (void)enumerateDynamicsInHierarchy:(void *)a3 forAvatar:(void *)a4 usingBlock:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v5 = a4;
  v6 = a3;
  objc_opt_self();
  objc_msgSend(v6, "avatarNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "childNodeWithName:recursively:", CFSTR("head_JNT"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "specializationSettings");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("dynamics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dynamic nodes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__AVTPhysicalizedSkeletonDynamic_enumerateDynamicsInHierarchy_forAvatar_usingBlock___block_invoke;
  v15[3] = &unk_1EA61DA78;
  v16 = v7;
  v17 = v8;
  v18 = v5;
  v11 = v5;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);

}

void __84__AVTPhysicalizedSkeletonDynamic_enumerateDynamicsInHierarchy_forAvatar_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  float v18;
  float v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  __int128 v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  int v38;
  void *v39;
  __int128 v40;
  int v41;
  void *v42;
  uint64_t v43;
  void *v44;
  int v45;
  void *v46;
  __int128 v47;
  int v48;
  void *v49;
  int v50;
  uint64_t v51;
  void *v52;
  int v53;
  int v54;
  int v55;
  int v56;
  __int128 v57;
  uint64_t v58;
  id v59;
  id v60;
  id obj;
  void *v62;
  void *v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[5];
  uint8_t buf[4];
  uint64_t v71;
  uint8_t v72[128];
  __int128 v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v64 = a2;
  v60 = a3;
  objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("physicalized skeleton"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v62;
  if (v62)
  {
    objc_msgSend(*(id *)(a1 + 32), "childNodeWithName:recursively:", v64, 1);
    obj = (id)objc_claimAutoreleasedReturnValue();
    if (!obj)
    {
      avt_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v73) = 138412290;
        *(_QWORD *)((char *)&v73 + 4) = v64;
        _os_log_impl(&dword_1DD1FA000, v20, OS_LOG_TYPE_DEFAULT, "Failed to find physicalized skeleton driving node named '%@'", (uint8_t *)&v73, 0xCu);
      }
      goto LABEL_44;
    }
    objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("chain root"));
    v58 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "childNodeWithName:recursively:", v58, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v6;
    if (!v6)
    {
      avt_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v73) = 138412290;
        *(_QWORD *)((char *)&v73 + 4) = v58;
        _os_log_impl(&dword_1DD1FA000, v21, OS_LOG_TYPE_DEFAULT, "Failed to find joint hierarchy for physicalized skeleton root joint named '%@'", (uint8_t *)&v73, 0xCu);
      }

      goto LABEL_43;
    }
    *(_QWORD *)&v73 = 0;
    *((_QWORD *)&v73 + 1) = &v73;
    v74 = 0x3032000000;
    v75 = __Block_byref_object_copy__0;
    v76 = __Block_byref_object_dispose__0;
    v77 = 0;
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __84__AVTPhysicalizedSkeletonDynamic_enumerateDynamicsInHierarchy_forAvatar_usingBlock___block_invoke_92;
    v69[3] = &unk_1EA61DA50;
    v69[4] = &v73;
    objc_msgSend(v6, "enumerateHierarchyUsingBlock:", v69);
    objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("targets"));
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v66 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(a1 + 32), "childNodeWithName:recursively:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i), 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = *(void **)(*((_QWORD *)&v73 + 1) + 40);
            if (!v12)
            {
              v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v14 = *(void **)(*((_QWORD *)&v73 + 1) + 40);
              *(_QWORD *)(*((_QWORD *)&v73 + 1) + 40) = v13;

              v12 = *(void **)(*((_QWORD *)&v73 + 1) + 40);
            }
            objc_msgSend(v12, "addObject:", v11);
          }
          else
          {
            avt_default_log();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v71 = (uint64_t)v64;
              _os_log_impl(&dword_1DD1FA000, v15, OS_LOG_TYPE_DEFAULT, "Failed to find physicalized skeleton target named '%@'", buf, 0xCu);
            }

          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
      }
      while (v8);
    }

    if (!objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 40), "count"))
    {
      avt_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v71 = v58;
        _os_log_impl(&dword_1DD1FA000, v17, OS_LOG_TYPE_DEFAULT, "Failed to find any target node for physicalized skeleton root joint named '%@'", buf, 0xCu);
      }
      goto LABEL_42;
    }
    objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("simulation factor"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      -[NSObject floatValue](v16, "floatValue");
      v19 = v18;
    }
    else
    {
      v19 = 0.5;
    }
    v22 = objc_opt_new();
    *(float *)(v22 + 8) = v19;
    objc_storeStrong((id *)(v22 + 16), *(id *)(a1 + 40));
    objc_storeStrong((id *)(v22 + 24), obj);
    objc_storeStrong((id *)(v22 + 32), v59);
    v23 = objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 40), "copy");
    v24 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v23;

    *(_OWORD *)(v22 + 48) = 0u;
    *(_OWORD *)(v22 + 64) = 0u;
    *(_OWORD *)(v22 + 80) = 0u;
    objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("rotation up down"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("rotation left right"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("rotation forward back"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v25;
    if (v25)
    {
      objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "floatValue");
      *(_QWORD *)&v57 = v29;
      objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "floatValue");
      v54 = v31;
      objc_msgSend(v25, "objectAtIndexedSubscript:", 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "floatValue");
      v33 = v57;
      DWORD1(v33) = v54;
      DWORD2(v33) = v34;
      *(_OWORD *)(v22 + 48) = v33;

    }
    if (v63)
    {
      objc_msgSend(v63, "objectAtIndexedSubscript:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "floatValue");
      *(_QWORD *)&v57 = v36;
      objc_msgSend(v63, "objectAtIndexedSubscript:", 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "floatValue");
      v55 = v38;
      objc_msgSend(v63, "objectAtIndexedSubscript:", 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "floatValue");
      v40 = v57;
      DWORD1(v40) = v55;
      DWORD2(v40) = v41;
      *(_OWORD *)(v22 + 64) = v40;

    }
    if (v26)
    {
      objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "floatValue");
      *(_QWORD *)&v57 = v43;
      objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "floatValue");
      v56 = v45;
      objc_msgSend(v26, "objectAtIndexedSubscript:", 2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "floatValue");
      v47 = v57;
      DWORD1(v47) = v56;
      DWORD2(v47) = v48;
      *(_OWORD *)(v22 + 80) = v47;

    }
    objc_msgSend(obj, "name");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "hasPrefix:", CFSTR("L_"));

    if (v50)
    {
      v51 = 1;
    }
    else
    {
      objc_msgSend(obj, "name");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "hasPrefix:", CFSTR("R_"));

      if (!v53)
      {
        *(_QWORD *)(v22 + 96) = 0;
        goto LABEL_41;
      }
      v51 = 2;
    }
    *(_QWORD *)(v22 + 96) = v51;
LABEL_41:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_42:
    _Block_object_dispose(&v73, 8);

LABEL_43:
    v20 = v58;
LABEL_44:

    v5 = v62;
  }

}

void __84__AVTPhysicalizedSkeletonDynamic_enumerateDynamicsInHierarchy_forAvatar_usingBlock___block_invoke_92(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", CFSTR("_DDV"));

  if (v4)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v5, "addObject:", v9);
  }

}

- (void)evaluateAtTime:(double)a3 physicsController:(id)a4
{
  float32x4_t v5;
  unint64_t side;
  NSArray *v7;
  uint64_t v8;
  int64x2_t v9;
  int64x2_t v10;
  uint64_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  uint64_t v20;
  uint64_t v21;
  float32x4_t v22;
  float simulationFactor;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  simulationFactor = self->_simulationFactor;
  objc_msgSend(a4, "offsetFromRestingPositionForNode:inCoordinateSpaceOfNode:", self->_drivingNode, self->_referenceNode);
  v22 = v5;
  side = self->_side;
  v25 = *(float32x4_t *)self->_leftRightRotation;
  v26 = *(float32x4_t *)self->_forwardBackRotation;
  v24 = *(float32x4_t *)self->_upDownRotation;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = self->_targetNodes;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v11 = v8;
    v9.i64[0] = side;
    v10.i64[0] = 2;
    v12 = (int8x16_t)vdupq_lane_s64(vceqq_s64(v9, v10).i64[0], 0);
    v13 = (int8x16_t)vmulq_n_f32(v22, simulationFactor);
    *(float *)v14.i32 = -*(float *)v13.i32;
    v14.i32[1] = v13.i32[1];
    v14.i64[1] = __PAIR64__(v22.u32[3], v13.u32[2]);
    v15 = (float32x4_t)vbslq_s8(v12, v14, v13);
    v16 = vnegq_f32(v15);
    v15.i32[3] = 0;
    v17 = vmaxnmq_f32(v15, (float32x4_t)0);
    v17.i32[3] = 0;
    v16.i32[3] = 0;
    v18 = vmaxnmq_f32(v16, (float32x4_t)0);
    v18.i32[3] = 0;
    v19 = vsubq_f32(vminnmq_f32(v17, (float32x4_t)xmmword_1DD269FE0), vminnmq_f32(v18, (float32x4_t)xmmword_1DD269FE0));
    *(_QWORD *)&v27 = vaddq_f32(vmulq_lane_f32(v24, *(float32x2_t *)v19.f32, 1), vaddq_f32(vmulq_n_f32(v25, v19.f32[0]), vmulq_laneq_f32(v26, v19, 2))).u64[0];
    v20 = *(_QWORD *)v29;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v21++), "setSimdEulerAngles:", v27, *(_OWORD *)&v22);
      }
      while (v11 != v21);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v11);
  }

}

- (void)resetTarget
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
  v2 = self->_targetNodes;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setSimdEulerAngles:", 0.0, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)affectsNode:(id)a3
{
  return self->_rootJoint == a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetNodes, 0);
  objc_storeStrong((id *)&self->_rootJoint, 0);
  objc_storeStrong((id *)&self->_drivingNode, 0);
  objc_storeStrong((id *)&self->_referenceNode, 0);
}

@end
