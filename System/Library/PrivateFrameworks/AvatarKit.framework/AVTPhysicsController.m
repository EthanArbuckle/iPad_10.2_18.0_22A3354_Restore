@implementation AVTPhysicsController

- (void)applyForcesWithMultiplier:(double)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id WeakRetained;
  double v14;
  double v15;
  NSArray *v16;
  uint64_t v17;
  int32x2_t v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  double v43;
  float32x4_t v44;
  float v45;
  uint64_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (!self->_hasPhysicsStateOverride)
  {
    if (!self->_setupDone)
    {
      avt_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[AVTPhysicsController applyForcesWithMultiplier:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_physicsWorld);
    objc_msgSend(WeakRetained, "scale");
    v15 = v14;

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v16 = self->_physicsRigs;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    if (v17)
    {
      v19 = v17;
      *(float *)v18.i32 = v15;
      v20 = *(_QWORD *)v54;
      v21 = *(float *)v18.i32 * a3;
      v49 = (float32x4_t)vdupq_lane_s32(v18, 0);
      __asm { FMOV            V0.4S, #5.0 }
      v51 = _Q0;
      v52 = v21;
      v47 = (float32x4_t)vdupq_n_s32(0x42440000u);
      v48 = (float32x4_t)xmmword_1DD26A010;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v54 != v20)
            objc_enumerationMutation(v16);
          v28 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v27);
          if (v28)
            v29 = *(void **)(v28 + 16);
          else
            v29 = 0;
          objc_msgSend(v29, "presentationNode", *(_OWORD *)&v47, *(_OWORD *)&v48, *(_OWORD *)&v49);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
            v31 = *(void **)(v28 + 24);
          else
            v31 = 0;
          objc_msgSend(v31, "presentationNode");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
            v33 = *(void **)(v28 + 32);
          else
            v33 = 0;
          v34 = v33;
          objc_msgSend(v30, "simdConvertPosition:toNode:", v32, 0.0);
          if (v28)
            v36 = *(float32x4_t *)(v28 + 64);
          else
            v36 = 0uLL;
          v37 = vmulq_f32(vsubq_f32(v36, v35), v51);
          v38 = vmulq_f32(v37, v37);
          v39 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v38, 2), vaddq_f32(v38, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 1))).f32[0]);
          if (v39 > 20.0)
            v37.i64[0] = vmulq_n_f32(v37, 20.0 / v39).u64[0];
          objc_msgSend(v32, "simdConvertVector:toNode:", 0, *(double *)v37.i64);
          v42 = vmulq_n_f32(v41, v52);
          if (v28)
          {
            v43 = *(double *)(v28 + 48);
            if (v43 < 0.0)
              goto LABEL_27;
            v50 = v42;
            v42 = *(float32x4_t *)(v28 + 80);
          }
          else
          {
            v50 = v42;
            v42.i64[0] = 0;
          }
          objc_msgSend(v32, "simdConvertVector:toNode:", 0, *(double *)v42.i64);
          if (v28)
            v43 = *(double *)(v28 + 48);
          else
            v43 = 0.0;
          v40 = vmulq_f32(vmlsq_f32(v48, v49, v44), v47);
          v45 = v43;
          v42 = vmlaq_n_f32(v50, v40, v45);
LABEL_27:
          LODWORD(v43) = v42.i32[1];
          v40.i32[0] = v42.i32[2];
          objc_msgSend(v34, "applyForce:impulse:", 0, *(double *)v42.i64, v43, *(double *)v40.i64);

          ++v27;
        }
        while (v19 != v27);
        v46 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
        v19 = v46;
      }
      while (v46);
    }

  }
}

- (void)updateAtTime:(double)a3 forceMultiplier:(double)a4
{
  if (!self->_hasPhysicsStateOverride)
  {
    if (self->_physicsBehaviorsAreInstalledInPhysicsWorld)
    {
      -[AVTPhysicsController applyForcesWithMultiplier:](self, "applyForcesWithMultiplier:", a4);
    }
    else
    {
      self->_physicsBehaviorsAreInstalledInPhysicsWorld = 1;
      -[AVTPhysicsController installPhysics](self, "installPhysics", a3, a4);
    }
  }
}

- (__n128)offsetFromRestingPositionForNode:(void *)a3 inCoordinateSpaceOfNode:(void *)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  __int128 v17;
  float32x4_t v18;
  float32x4_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  __int128 v25;
  float32x4_t v26;
  void *v27;
  float32x4_t v28;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v31 = 0u;
  v8 = *(id *)(a1 + 16);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v12);
        if (v13)
          v14 = *(id *)(v13 + 16);
        else
          v14 = 0;
        if (v14 == v6)
        {
          if (*(_BYTE *)(a1 + 33))
          {
            if (v13)
            {
              v16 = *(id *)(v13 + 24);
              v17 = *(_OWORD *)(v13 + 64);
            }
            else
            {
              v16 = 0;
              *(_QWORD *)&v17 = 0;
            }
            objc_msgSend(v16, "simdConvertPosition:toNode:", v7, *(double *)&v17);
            v32 = v18;

            objc_msgSend(v6, "simdConvertPosition:toNode:", v7, 0.0);
            v31 = vsubq_f32(v19, v32);
          }
          else
          {
            objc_msgSend(v7, "presentationNode");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
              v21 = *(void **)(v13 + 24);
            else
              v21 = 0;
            v22 = v21;
            objc_msgSend(v22, "presentationNode");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23;
            if (v13)
              v25 = *(_OWORD *)(v13 + 64);
            else
              *(_QWORD *)&v25 = 0;
            objc_msgSend(v23, "simdConvertPosition:toNode:", v20, *(double *)&v25);
            v33 = v26;

            objc_msgSend(v6, "presentationNode");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "simdConvertPosition:toNode:", v20, 0.0);
            v30 = v28;

            v31 = vsubq_f32(v30, v33);
          }
          goto LABEL_23;
        }
        ++v12;
      }
      while (v10 != v12);
      v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      v10 = v15;
      if (v15)
        continue;
      break;
    }
  }
LABEL_23:

  return (__n128)v31;
}

- (void)installPhysics
{
  id WeakRetained;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[AVTPhysicsController setupPhysicsIfNeeded](self, "setupPhysicsIfNeeded");
  WeakRetained = objc_loadWeakRetained((id *)&self->_physicsWorld);
  v4 = (void *)MEMORY[0x1E0CD5A38];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__AVTPhysicsController_installPhysics__block_invoke;
  v6[3] = &unk_1EA61DAA0;
  v6[4] = self;
  v7 = WeakRetained;
  v5 = WeakRetained;
  objc_msgSend(v4, "enqueueCommandForObject:immediateTransactionBlock:", v5, v6);

}

uint64_t __38__AVTPhysicsController_installPhysics__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6);
        if (!v7 || !*(_QWORD *)(v7 + 40))
        {
          avt_default_log();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            __38__AVTPhysicsController_installPhysics__block_invoke_cold_1(buf, &v18, v8);

        }
        if (v7)
          v9 = *(_QWORD *)(v7 + 40);
        else
          v9 = 0;
        objc_msgSend(*(id *)(a1 + 40), "addBehavior:", v9, (_QWORD)v13);
        ++v6;
      }
      while (v4 != v6);
      v10 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      v4 = v10;
    }
    while (v10);
  }

  objc_msgSend(*(id *)(a1 + 40), "setSpeed:", 8.0);
  v11 = 60;
  do
  {
    objc_msgSend(*(id *)(a1 + 32), "applyForcesWithMultiplier:", 1.0, (_QWORD)v13);
    objc_msgSend(*(id *)(a1 + 40), "_step:", 0.0166666667);
    --v11;
  }
  while (v11);
  return objc_msgSend(*(id *)(a1 + 40), "setSpeed:", 4.0);
}

- (void)setupPhysicsIfNeeded
{
  AVTPhysicsController *obj;

  if (!self->_setupDone)
  {
    obj = self;
    objc_sync_enter(obj);
    if (!self->_setupDone)
    {
      -[AVTPhysicsController setupPhysics](obj, "setupPhysics");
      self->_setupDone = 1;
    }
    objc_sync_exit(obj);

  }
}

- (void)setupPhysics
{
  OUTLINED_FUNCTION_1_0();
}

void __36__AVTPhysicsController_setupPhysics__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSuffix:", CFSTR("_DYN"));

  if (v4)
  {
    objc_msgSend(v8, "parentNode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasSuffix:", CFSTR("_DYN"));

    if ((v7 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_setupPhysicsChain:physicsRigs:", v8, *(_QWORD *)(a1 + 40));
  }

}

- (void)_setupCollisionNode:(id)a3
{
  objc_msgSend(a3, "enumerateHierarchyUsingBlock:", &__block_literal_global);
}

void __44__AVTPhysicsController__setupCollisionNode___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "geometry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CD59D8], "kinematicBody");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPhysicsBody:", v3);

    objc_msgSend(v7, "physicsBody");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRestitution:", 0.0);

    objc_msgSend(v7, "physicsBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFriction:", 1.0);

    objc_msgSend(v7, "physicsBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCategoryBitMask:", 8);

    objc_msgSend(v7, "setOpacity:", 0.0);
  }

}

- (void)_setupPhysicsChain:(id)a3 physicsRigs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  AVTPhysicsController *v16;
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CD5A28], "sphereWithRadius:", 1.5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSegmentCount:", 12);
    objc_msgSend(v6, "setGeometry:", v8);
    objc_msgSend(v6, "setOpacity:", 0.0);
    objc_msgSend(MEMORY[0x1E0CD59D8], "kinematicBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAffectedByGravity:", 0);
    objc_msgSend(v9, "setDamping:", 0.8);
    objc_msgSend(v9, "setAngularDamping:", 0.8);
    objc_msgSend(v6, "setPhysicsBody:", v9);
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = __Block_byref_object_copy__1;
    v20[4] = __Block_byref_object_dispose__1;
    v10 = v6;
    v21 = v10;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__AVTPhysicsController__setupPhysicsChain_physicsRigs___block_invoke;
    v13[3] = &unk_1EA61DB30;
    v11 = v8;
    v14 = v11;
    v19 = v20;
    v15 = v10;
    v16 = self;
    v12 = v9;
    v17 = v12;
    v18 = v7;
    objc_msgSend(v15, "enumerateChildNodesUsingBlock:", v13);

    _Block_object_dispose(v20, 8);
  }

}

void __55__AVTPhysicsController__setupPhysicsChain_physicsRigs___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v3;
  id v5;
  AVTPhysicsRig *v6;
  void *v7;
  __int128 v8;
  float32x4_t v9;
  __int128 v10;
  void *v11;
  uint64_t v12;
  double v13;
  float32x4_t v14;
  float v15;
  float v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  int32x4_t v22;
  float32x2_t v23;
  float32x2_t v24;
  float32x4_t v25;
  int32x4_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  double v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  float32x4_t v46;
  _OWORD v47[4];
  _OWORD v48[4];

  v5 = a2;
  objc_msgSend(v5, "setGeometry:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setOpacity:", 0.0);
  v6 = objc_alloc_init(AVTPhysicsRig);
  -[AVTPhysicsRig setRig:]((uint64_t)v6, v5);
  -[AVTPhysicsRig setChainRoot:]((uint64_t)v6, *(void **)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CD59D8], "dynamicBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCategoryBitMask:", 3);
  objc_msgSend(v7, "setCollisionBitMask:", 8);
  objc_msgSend(v7, "setAffectedByGravity:", 0);
  objc_msgSend(v7, "setDamping:", 0.8);
  objc_msgSend(v7, "setAngularDamping:", 0.8);
  objc_msgSend(v5, "setPhysicsBody:", v7);
  -[AVTPhysicsRig setPhysicsBody:]((uint64_t)v6, v7);
  objc_msgSend(v5, "simdConvertPosition:toNode:", *(_QWORD *)(a1 + 40), 0.0);
  v45 = v8;
  objc_msgSend(v5, "simdConvertPosition:toNode:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), 0.0);
  v46 = v9;
  if (v6)
  {
    *(_OWORD *)v6->_restPosition_chainRoot = v45;
    objc_msgSend(*(id *)(a1 + 40), "simdConvertVector:fromNode:", 0, -0.0078125);
    *(_OWORD *)v6->_restGravityVector_chainRoot = v10;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "simdConvertVector:fromNode:", 0, -0.0078125);
  }
  objc_msgSend(v5, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 40));
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "physicsController:downforceForNodeNamed:", v12, v3);
    if (!v6)
      goto LABEL_6;
    goto LABEL_5;
  }
  v13 = -1.0;
  if (v6)
LABEL_5:
    v6->_downForceFactor = v13;
LABEL_6:
  if (v11)
  {

  }
  v14 = vmulq_f32(v46, v46);
  LODWORD(v15) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2), vaddq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 1))).u32[0];
  if (v6)
  {
    v6->_coneConstraintLength = sqrtf(v15);
    v6->_coneConstraintSinusAngularLimit = 0.30902;
  }
  v16 = v15;
  v17 = vrsqrte_f32((float32x2_t)LODWORD(v15));
  v18 = vmul_f32(v17, vrsqrts_f32((float32x2_t)LODWORD(v16), vmul_f32(v17, v17)));
  v19 = vmulq_n_f32(v46, vmul_f32(v18, vrsqrts_f32((float32x2_t)LODWORD(v16), vmul_f32(v18, v18))).f32[0]);
  v20 = vabsq_f32(v19);
  if (v20.f32[0] >= v20.f32[1])
  {
    if (v20.f32[1] < v20.f32[2])
    {
      v21.i32[1] = 0;
      v21.f32[0] = -v19.f32[2];
      v21.i64[1] = v19.u32[0];
      goto LABEL_16;
    }
  }
  else if (v20.f32[0] < v20.f32[2])
  {
    v21.i32[0] = 0;
    v21.f32[1] = -v19.f32[2];
    v21.i64[1] = v19.u32[1];
    goto LABEL_16;
  }
  v21.i64[1] = 0;
  v21.f32[0] = -v19.f32[1];
  v21.i32[1] = v19.i32[0];
LABEL_16:
  if (v6)
  {
    v22 = (int32x4_t)vmulq_f32(v21, v21);
    v22.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v22, 2), vadd_f32(*(float32x2_t *)v22.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v22.i8, 1))).u32[0];
    v23 = vrsqrte_f32((float32x2_t)v22.u32[0]);
    v24 = vmul_f32(v23, vrsqrts_f32((float32x2_t)v22.u32[0], vmul_f32(v23, v23)));
    v25 = vmulq_n_f32(v21, vmul_f32(v24, vrsqrts_f32((float32x2_t)v22.u32[0], vmul_f32(v24, v24))).f32[0]);
    v26 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v25, (int32x4_t)v25), (int8x16_t)v25, 0xCuLL), vnegq_f32(v19)), v25, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v19, (int32x4_t)v19), (int8x16_t)v19, 0xCuLL));
    *(float32x4_t *)v6->_anon_60 = v19;
    *(float32x4_t *)&v6->_anon_60[16] = v25;
    *(int8x16_t *)&v6->_anon_60[32] = vextq_s8((int8x16_t)vuzp1q_s32(v26, v26), (int8x16_t)v26, 0xCuLL);
  }
  objc_msgSend(v5, "simdConvertTransform:fromNode:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *MEMORY[0x1E0C83FF0], *(double *)(MEMORY[0x1E0C83FF0] + 16), *(double *)(MEMORY[0x1E0C83FF0] + 32), *(double *)(MEMORY[0x1E0C83FF0] + 48));
  if (v6)
  {
    *(_OWORD *)&v6[1].super.isa = v27;
    *(_OWORD *)&v6[1]._rig = v28;
    *(_OWORD *)&v6[1]._physicsBody = v29;
    *(_OWORD *)&v6[1]._downForceFactor = v30;
  }
  v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v32 = *(_QWORD *)(a1 + 40);
  v33 = (void *)MEMORY[0x1E0CD59E0];
  if (v31 == v32)
  {
    v34 = *(void **)(a1 + 56);
    if (v6)
      goto LABEL_22;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "physicsBody");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_22:
      v36 = *(_OWORD *)&v6[1].super.isa;
      v35 = *(_OWORD *)&v6[1]._rig;
      v37 = *(_OWORD *)&v6[1]._physicsBody;
      v38 = *(_OWORD *)&v6[1]._downForceFactor;
      goto LABEL_23;
    }
  }
  v37 = 0uLL;
  v35 = 0uLL;
  v36 = 0uLL;
  v38 = 0uLL;
LABEL_23:
  v48[0] = v36;
  v48[1] = v35;
  v48[2] = v37;
  v48[3] = v38;
  v39 = *(_OWORD *)(MEMORY[0x1E0CD5B28] + 16);
  v47[0] = *MEMORY[0x1E0CD5B28];
  v47[1] = v39;
  v40 = *(_OWORD *)(MEMORY[0x1E0CD5B28] + 48);
  v47[2] = *(_OWORD *)(MEMORY[0x1E0CD5B28] + 32);
  v47[3] = v40;
  objc_msgSend(v33, "jointWithBodyA:frameA:bodyB:frameB:", v34, v47, v7, v48);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31 == v32)
  {
    v42 = 0.0;
  }
  else
  {

    v42 = 0.314159265;
  }
  objc_msgSend(v41, "setMaximumAngularLimit1:", 0.314159265);
  objc_msgSend(v41, "setMaximumAngularLimit2:", 0.314159265);
  objc_msgSend(v41, "setMaximumTwistAngle:", v42);
  -[AVTPhysicsRig setPhysicsBehavior:]((uint64_t)v6, v41);
  objc_msgSend(*(id *)(a1 + 64), "addObject:", v6);
  v43 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v44 = *(void **)(v43 + 40);
  *(_QWORD *)(v43 + 40) = v5;

}

- (void)downforcesDidChange
{
  OUTLINED_FUNCTION_1_0();
}

- (id)physicsState
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  AVTAvatarPhysicsState *v30;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  const __CFString *v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!self->_physicsRigs)
  {
    avt_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[AVTPhysicsController physicsState].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  _AVTPoseRoundingBehaviour();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSArray count](self->_physicsRigs, "count"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v11 = self->_physicsRigs;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v15);
        if (v16)
        {
          v17 = *(id *)(v16 + 16);
          v18 = *(void **)(v16 + 24);
        }
        else
        {
          v17 = 0;
          v18 = 0;
        }
        v19 = v18;
        if (self->_physicsBehaviorsAreInstalledInPhysicsWorld)
        {
          objc_msgSend(v17, "presentationNode");
          v20 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "presentationNode");
          v21 = objc_claimAutoreleasedReturnValue();

          v19 = (id)v21;
          v17 = (id)v20;
        }
        objc_msgSend(v17, "name", v32);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "simdConvertPosition:fromNode:", v17, 0.0);
        if (v16)
          v24 = *(float32x4_t *)(v16 + 64);
        else
          v24 = 0uLL;
        v25 = vabdq_f32(v23, v24);
        v26 = vmulq_f32(v25, v25);
        if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v26, 2), vaddq_f32(v26, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v26.f32, 1))).f32[0] >= 0.1)
        {
          v38 = CFSTR("offset");
          objc_msgSend(MEMORY[0x1E0C99D20], "avt_arrayWithFloat3:roundingBehavior:", v33, *(double *)vsubq_f32(v23, v24).i64);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v27;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v28, v22);

        }
        ++v15;
      }
      while (v13 != v15);
      v29 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      v13 = v29;
    }
    while (v29);
  }

  v30 = -[AVTAvatarPhysicsState initWithDictionaryRepresentation:]([AVTAvatarPhysicsState alloc], "initWithDictionaryRepresentation:", v32);
  return v30;
}

- (void)resetToPhysicsState:(id)a3 assumeRestStateIfNil:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  float32x4_t v28;
  float32x4_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSArray *v33;
  float32x4_t v34;
  NSArray *obj;
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
  uint64_t v46;

  v4 = a4;
  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[AVTPhysicsController setupPhysicsIfNeeded](self, "setupPhysicsIfNeeded");
  if (v6 || v4)
  {
    self->_hasPhysicsStateOverride = 1;
    objc_msgSend(v6, "dictionaryRepresentation", v6);
    obj = (NSArray *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v33 = self->_physicsRigs;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v41;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v41 != v17)
            objc_enumerationMutation(v33);
          v19 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v18);
          if (v19)
          {
            v20 = *(id *)(v19 + 16);
            v21 = *(void **)(v19 + 24);
          }
          else
          {
            v20 = 0;
            v21 = 0;
          }
          v22 = v21;
          objc_msgSend(v20, "parentNode");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray objectForKeyedSubscript:](obj, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (v25)
          {
            objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("offset"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "avt_float3");
            v34 = v28;

            if (v19)
              v29 = *(float32x4_t *)(v19 + 64);
            else
              v29 = 0uLL;
            v29.i64[0] = vaddq_f32(v34, v29).u64[0];
          }
          else if (v19)
          {
            v29 = *(float32x4_t *)(v19 + 64);
          }
          else
          {
            v29.i64[0] = 0;
          }
          objc_msgSend(v22, "simdConvertPosition:toNode:", v23, *(double *)v29.i64);
          objc_msgSend(v20, "setSimdPosition:");
          objc_msgSend(v20, "physicsBody");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setResting:", 1);

          ++v18;
        }
        while (v16 != v18);
        v31 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        v16 = v31;
      }
      while (v31);
    }

    v6 = v32;
  }
  else
  {
    self->_hasPhysicsStateOverride = 0;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = self->_physicsRigs;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v37;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v37 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v10);
          if (v11)
            v12 = *(void **)(v11 + 16);
          else
            v12 = 0;
          objc_msgSend(v12, "physicsBody");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setResting:", 0);

          ++v10;
        }
        while (v8 != v10);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        v8 = v14;
      }
      while (v14);
    }
  }

}

- (void)addToPhysicsWorld:(id)a3
{
  id v4;
  SCNPhysicsWorld **p_physicsWorld;
  id WeakRetained;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  p_physicsWorld = &self->_physicsWorld;
  WeakRetained = objc_loadWeakRetained((id *)p_physicsWorld);

  if (WeakRetained)
  {
    avt_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AVTPhysicsController addToPhysicsWorld:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  objc_storeWeak((id *)p_physicsWorld, v4);

}

- (void)removeFromPhysicsWorld:(id)a3
{
  id v4;
  SCNPhysicsWorld **p_physicsWorld;
  id WeakRetained;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_physicsWorld = &self->_physicsWorld;
  WeakRetained = objc_loadWeakRetained((id *)&self->_physicsWorld);

  if (WeakRetained != v4)
  {
    avt_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AVTPhysicsController removeFromPhysicsWorld:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  if (self->_physicsBehaviorsAreInstalledInPhysicsWorld)
  {
    self->_physicsBehaviorsAreInstalledInPhysicsWorld = 0;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v15 = self->_physicsRigs;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19);
          if (v20)
          {
            objc_msgSend(v4, "removeBehavior:", *(_QWORD *)(v20 + 40));
            v21 = *(void **)(v20 + 16);
          }
          else
          {
            objc_msgSend(v4, "removeBehavior:", 0, (_QWORD)v23);
            v21 = 0;
          }
          objc_msgSend(v21, "setPhysicsBody:", 0, (_QWORD)v23);
          ++v19;
        }
        while (v17 != v19);
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        v17 = v22;
      }
      while (v22);
    }

  }
  objc_storeWeak((id *)p_physicsWorld, 0);

}

- (AVTPhysicsControllerDelegate)delegate
{
  return (AVTPhysicsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_physicsRigs, 0);
  objc_destroyWeak((id *)&self->_physicsWorld);
}

- (void)applyForcesWithMultiplier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Internal consistency error, at this point we should have a initialized the physcis controller", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __38__AVTPhysicsController_installPhysics__block_invoke_cold_1(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "physicsRig.physicsBehavior";
}

- (void)physicsState
{
  OUTLINED_FUNCTION_1_0();
}

- (void)addToPhysicsWorld:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. An avatar should not be shared across renderers", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)removeFromPhysicsWorld:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. An avatar should not be shared across renderers", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
