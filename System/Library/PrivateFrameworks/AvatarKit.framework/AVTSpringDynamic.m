@implementation AVTSpringDynamic

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SCNNode name](self->_dynamicNode, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<AVTSpringDynamic: %p> Spring \"%@\"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
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
  v15[2] = __70__AVTSpringDynamic_enumerateDynamicsInHierarchy_forAvatar_usingBlock___block_invoke;
  v15[3] = &unk_1EA61DA78;
  v16 = v7;
  v17 = v8;
  v18 = v5;
  v11 = v5;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);

}

void __70__AVTSpringDynamic_enumerateDynamicsInHierarchy_forAvatar_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  float v14;
  double v15;
  float v16;
  float v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _DWORD *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  int v37;
  int v38;
  __int128 v39;
  void *v40;
  __int128 v41;
  void *v42;
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("spring"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "childNodeWithName:recursively:", v5, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      avt_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v5;
        _os_log_impl(&dword_1DD1FA000, v18, OS_LOG_TYPE_DEFAULT, "Failed to find spring node named '%@'", buf, 0xCu);
      }

      goto LABEL_14;
    }
    objc_msgSend(v7, "parentNode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "simdPosition");
    objc_msgSend(v9, "simdConvertPosition:toNode:", *(_QWORD *)(a1 + 40));
    v41 = v10;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("duration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bounce"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11)
    {
      objc_msgSend(v11, "floatValue");
      v15 = v14;
      if (v13)
      {
LABEL_5:
        objc_msgSend(v13, "floatValue");
        v17 = v16;
LABEL_11:
        v19 = objc_opt_new();
        objc_storeStrong((id *)(v19 + 8), v8);
        objc_msgSend(v8, "presentationNode");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(void **)(v19 + 16);
        *(_QWORD *)(v19 + 16) = v20;

        objc_msgSend(v9, "presentationNode");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = *(void **)(v19 + 24);
        *(_QWORD *)(v19 + 24) = v22;

        objc_msgSend(*(id *)(a1 + 40), "presentationNode");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(v19 + 32);
        *(_QWORD *)(v19 + 32) = v24;

        *(_OWORD *)(v19 + 48) = v41;
        *(_BYTE *)(v19 + 192) = 1;
        v26 = -[AVTMassSpringDamperSystem initWithPerceptualDuration:bounce:]([AVTMassSpringDamperSystem alloc], v15, v17);
        v27 = *(void **)(v19 + 96);
        *(_QWORD *)(v19 + 96) = v26;

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("XYZ max offsets"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "count") == 3)
        {
          *(_BYTE *)(v19 + 64) = 1;
          objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "floatValue");
          *(_QWORD *)&v39 = v29;
          objc_msgSend(v28, "objectAtIndexedSubscript:", 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "floatValue");
          v38 = v31;
          objc_msgSend(v28, "objectAtIndexedSubscript:", 2);
          v42 = v13;
          v32 = v5;
          v33 = v11;
          v34 = v9;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "floatValue");
          v36 = v39;
          DWORD1(v36) = v38;
          DWORD2(v36) = v37;
          *(_OWORD *)(v19 + 80) = v36;

          v9 = v34;
          v11 = v33;
          v5 = v32;
          v13 = v42;

        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_14:
        goto LABEL_15;
      }
    }
    else
    {
      v15 = 0.5;
      if (v12)
        goto LABEL_5;
    }
    v17 = 0.5;
    goto LABEL_11;
  }
LABEL_15:

}

- (void)evaluateAtTime:(double)a3 physicsController:(id)a4
{
  float32x4_t v6;
  float32x4_t v7;
  uint32x4_t v8;
  double lastEvaluationTime;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;

  -[SCNNode simdConvertPosition:toNode:](self->_referencePresentationNode, "simdConvertPosition:toNode:", 0, *(double *)self->_restPosition);
  if (self->_shouldReset)
  {
    self->_shouldReset = 0;
    self->_beginTime = a3;
    *(_OWORD *)self->_beginVelocity = 0u;
    *(float32x4_t *)self->_beginWorldPosition = v6;
    *(float32x4_t *)self->_endWorldPosition = v6;
  }
  else
  {
    v7 = *(float32x4_t *)self->_endWorldPosition;
    v8 = (uint32x4_t)vcgtq_f32(vabdq_f32(v7, v6), (float32x4_t)vdupq_n_s32(0x3A83126Fu));
    v8.i32[3] = v8.i32[2];
    if ((vmaxvq_u32(v8) & 0x80000000) != 0)
    {
      v23 = v6;
      -[AVTMassSpringDamperSystem float3VelocityAtTime:initialValue:initialVelocity:targetValue:]((uint64_t)self->_system, self->_lastEvaluationTime - self->_beginTime, *(float32x4_t *)self->_beginWorldPosition, *(double *)self->_beginVelocity, v7);
      v11 = v12;
      v10 = *(float32x4_t *)self->_lastWorldPosition;
      if (self->_hasMaxOffsets)
      {
        v21 = *(float32x4_t *)self->_lastWorldPosition;
        v22 = v12;
        -[SCNNode simdConvertVector:fromNode:](self->_dynamicPresentationNode, "simdConvertVector:fromNode:", 0, *(double *)vsubq_f32(v10, v23).i64);
        v13 = *(float32x4_t *)self->_maxOffsets;
        v15 = vdivq_f32(v14, v13);
        v16 = vmulq_f32(v15, v15);
        v17 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v16, 2), vaddq_f32(v16, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 1))).f32[0];
        v10 = v21;
        v11 = v22;
        v7 = v23;
        if (v17 > 1.0)
        {
          v18 = vrsqrte_f32((float32x2_t)LODWORD(v17));
          v19 = vmul_f32(v18, vrsqrts_f32((float32x2_t)LODWORD(v17), vmul_f32(v18, v18)));
          -[SCNNode simdConvertVector:toNode:](self->_dynamicPresentationNode, "simdConvertVector:toNode:", 0, *(double *)vmulq_f32(v13, vmulq_n_f32(v15, vmul_f32(v19, vrsqrts_f32((float32x2_t)LODWORD(v17), vmul_f32(v19, v19))).f32[0])).i64, *(double *)v21.i64);
          v11 = v22;
          v7 = v23;
          v10 = vaddq_f32(v23, v20);
        }
      }
      else
      {
        v7 = v23;
      }
      lastEvaluationTime = self->_lastEvaluationTime;
      self->_beginTime = lastEvaluationTime;
      *(float32x4_t *)self->_beginVelocity = v11;
      *(float32x4_t *)self->_beginWorldPosition = v10;
      *(float32x4_t *)self->_endWorldPosition = v7;
    }
    else
    {
      lastEvaluationTime = self->_beginTime;
      v11 = *(float32x4_t *)self->_beginVelocity;
      v10 = *(float32x4_t *)self->_beginWorldPosition;
    }
    *(double *)v6.i64 = -[AVTMassSpringDamperSystem float3ValueAtTime:initialValue:initialVelocity:targetValue:]((uint64_t)self->_system, a3 - lastEvaluationTime, v10, v11, v7);
  }
  *(float32x4_t *)self->_lastWorldPosition = v6;
  -[SCNNode simdConvertPosition:fromNode:](self->_dynamicParentPresentationNode, "simdConvertPosition:fromNode:", 0);
  -[SCNNode setSimdPosition:](self->_dynamicNode, "setSimdPosition:");
  self->_lastEvaluationTime = a3;
}

- (void)resetTarget
{
  -[SCNNode simdConvertPosition:fromNode:](self->_dynamicParentPresentationNode, "simdConvertPosition:fromNode:", self->_referencePresentationNode, *(double *)self->_restPosition);
  -[SCNNode setSimdPosition:](self->_dynamicNode, "setSimdPosition:");
}

- (BOOL)affectsNode:(id)a3
{
  return self->_dynamicNode == a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_system, 0);
  objc_storeStrong((id *)&self->_referencePresentationNode, 0);
  objc_storeStrong((id *)&self->_dynamicParentPresentationNode, 0);
  objc_storeStrong((id *)&self->_dynamicPresentationNode, 0);
  objc_storeStrong((id *)&self->_dynamicNode, 0);
}

@end
