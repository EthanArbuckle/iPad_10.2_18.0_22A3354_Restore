@implementation AVTAvatarBodyPose

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

+ (id)neutralPose
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__AVTAvatarBodyPose_neutralPose__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (neutralPose_onceToken != -1)
    dispatch_once(&neutralPose_onceToken, block);
  return (id)neutralPose_neutralPose;
}

void __32__AVTAvatarBodyPose_neutralPose__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  if (kAVTBodyPosePackMemojiEditor_block_invoke_onceToken != -1)
    dispatch_once(&kAVTBodyPosePackMemojiEditor_block_invoke_onceToken, &__block_literal_global_14);
  v2 = objc_alloc(*(Class *)(a1 + 32));
  v3 = objc_msgSend(v2, "initWithDictionaryRepresentation:", kAVTBodyPosePackMemojiEditor_block_invoke_kAVTPrecompiledNeutralBodyPoseRepresentation);
  v4 = (void *)neutralPose_neutralPose;
  neutralPose_neutralPose = v3;

}

void __32__AVTAvatarBodyPose_neutralPose__block_invoke_2()
{
  void *v0;

  v0 = (void *)kAVTBodyPosePackMemojiEditor_block_invoke_kAVTPrecompiledNeutralBodyPoseRepresentation;
  kAVTBodyPosePackMemojiEditor_block_invoke_kAVTPrecompiledNeutralBodyPoseRepresentation = (uint64_t)&unk_1EA6BFD10;

}

+ (id)posesInPosePack:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("memojiEditor")))
  {
    if (posesInPosePack__onceToken != -1)
      dispatch_once(&posesInPosePack__onceToken, &__block_literal_global_1130);
    v4 = (id)posesInPosePack__poses;
  }
  else
  {
    avt_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[AVTAvatarBodyPose posesInPosePack:].cold.1((uint64_t)v3, v5);

    v4 = (id)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

void __37__AVTAvatarBodyPose_posesInPosePack___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1 = (void *)posesInPosePack__poses;
  posesInPosePack__poses = (uint64_t)v0;

  +[AVTStickerConfiguration stickerConfigurationsForMemojiInStickerPack:](AVTStickerConfiguration, "stickerConfigurationsForMemojiInStickerPack:", CFSTR("memojiEditorCarousel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "loadIfNeeded");
        v8 = (void *)posesInPosePack__poses;
        objc_msgSend(v7, "bodyPose");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v9);

        objc_msgSend(v7, "unload");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (AVTAvatarBodyPose)initWithRootJoints:(id)a3
{
  id v4;
  AVTAvatarBodyPose *v5;
  void *v6;
  id v7;
  NSDictionary *v8;
  id v9;
  NSDictionary *dictionaryRepresentation;
  NSDictionary *v11;
  _QWORD v13[4];
  id v14;
  NSDictionary *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AVTAvatarBodyPose;
  v5 = -[AVTAvatarBodyPose init](&v16, sel_init);
  if (v5)
  {
    _AVTPoseRoundingBehaviour();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __40__AVTAvatarBodyPose_initWithRootJoints___block_invoke;
    v13[3] = &unk_1EA61EEF8;
    v14 = v6;
    v8 = (NSDictionary *)v7;
    v15 = v8;
    v9 = v6;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v13);
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = v8;
    v11 = v8;

  }
  return v5;
}

void __40__AVTAvatarBodyPose_initWithRootJoints___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a2;
  v8 = objc_alloc_init(v6);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__AVTAvatarBodyPose_initWithRootJoints___block_invoke_2;
  v11[3] = &unk_1EA61EED0;
  v12 = v5;
  v13 = v8;
  v14 = *(id *)(a1 + 32);
  v9 = v8;
  v10 = v5;
  objc_msgSend(v10, "enumerateChildNodesUsingBlock:", v11);
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v7);

}

void __40__AVTAvatarBodyPose_initWithRootJoints___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  void *v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  int32x4_t v19;
  float32x4_t v20;
  float v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  int32x4_t v30;
  float v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32_t v37;
  float32x4_t v38;
  int32x4_t v39;
  int32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32_t v43;
  float32x4_t v44;
  int8x16_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float v53;
  float32x2_t v54;
  float32x2_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  uint32x4_t v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  uint32x4_t v84;
  unsigned int v85;
  double v86;
  double v87;
  double v88;
  uint64_t v89;
  double v90;
  void *v91;
  void *v92;
  void *v93;
  double v94;
  double v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  float32x4_t v107;
  void *v108;
  float32x4_t v109;
  float32x4_t v110;
  float32x4_t v111;
  float32x4_t v112;
  float32x4_t v113;
  float32x4_t v114;
  float32x4_t v115;
  _QWORD v116[10];
  _QWORD v117[7];
  _QWORD v118[18];

  v118[16] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("L_eye_JNT")) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("R_eye_JNT")) & 1) == 0)
  {
    objc_msgSend(v3, "simdTransform");
    v10 = v6;
    v11 = v7;
    v12 = v8;
    v13 = v9;
    v14 = *(void **)(a1 + 32);
    if (v5 != v14)
    {
      objc_msgSend(v14, "simdConvertTransform:fromNode:", v5, *(double *)v6.i64, *(double *)v7.i64, *(double *)v8.i64, *(double *)v9.i64);
      v10 = v15;
      v11 = v16;
      v12 = v17;
      v13 = v18;
    }
    v19 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v12, (int32x4_t)v12), (int8x16_t)v12, 0xCuLL), vnegq_f32(v11)), v12, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v11, (int32x4_t)v11), (int8x16_t)v11, 0xCuLL));
    v20 = vmulq_f32(v10, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v19, v19), (int8x16_t)v19, 0xCuLL));
    _NF = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).f32[0] < 0.0;
    v22 = -1.0;
    if (!_NF)
      v22 = 1.0;
    v23 = vmulq_f32(v10, v10);
    v24 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v23, 2), vaddq_f32(v23, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 1)));
    v24.f32[0] = sqrtf(v24.f32[0]);
    v25 = vmulq_f32(v11, v11);
    v26 = vmulq_f32(v12, v12);
    v24.i32[1] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v25, 2), vaddq_f32(v25, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v25.f32, 1))).f32[0]);
    v24.i32[2] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v26, 2), vaddq_f32(v26, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v26.f32, 1))).f32[0]);
    v27 = vmulq_n_f32(v24, v22);
    v28 = vdivq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 0));
    v29 = vdivq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 1));
    v30 = (int32x4_t)vdivq_f32(v12, (float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2));
    v31 = *(float *)&v30.i32[2] + (float)(v28.f32[0] + v29.f32[1]);
    if (v31 <= 0.0)
    {
      if (v28.f32[0] <= v29.f32[1] || v28.f32[0] <= *(float *)&v30.i32[2])
      {
        if (v29.f32[1] <= *(float *)&v30.i32[2])
        {
          v43 = (float)(*(float *)&v30.i32[2] + 1.0) - v28.f32[0];
          v44 = (float32x4_t)vzip2q_s32((int32x4_t)v28, vzip1q_s32(v30, (int32x4_t)v28));
          v45 = (int8x16_t)vrev64q_s32((int32x4_t)v29);
          v46 = (float32x4_t)vextq_s8(v45, v45, 8uLL);
          v46.i32[0] = v30.i32[0];
          v34.i64[0] = vaddq_f32(v44, v46).u64[0];
          v44.f32[2] = v43;
          v34.i64[1] = vsubq_f32(v44, v46).i64[1];
          v35.i32[0] = v34.i32[2];
        }
        else
        {
          v37 = (float)(v29.f32[1] + 1.0) - v28.f32[0];
          v38 = v29;
          v38.i32[0] = v28.i32[1];
          v29.i32[1] = v30.i32[2];
          v29.i32[2] = v30.i32[1];
          v39 = (int32x4_t)vaddq_f32(v38, v29);
          v38.f32[1] = v37;
          v38.i32[3] = v30.i32[0];
          v29.i32[3] = v28.i32[2];
          v40 = (int32x4_t)vsubq_f32(v38, v29);
          v34 = (float32x4_t)vtrn2q_s32(vrev64q_s32(v39), v40);
          v35.i32[0] = v40.i32[1];
        }
      }
      else
      {
        v41 = v28;
        v41.f32[0] = (float)(v28.f32[0] + 1.0) - v29.f32[1];
        v41.i32[3] = v29.i32[2];
        v42 = (float32x4_t)vextq_s8((int8x16_t)v30, (int8x16_t)v30, 8uLL);
        v35 = vsubq_f32(v41, v42);
        v42.i32[1] = v29.i32[0];
        v34 = vaddq_f32(v28, v42);
        v34.i32[0] = v35.i32[0];
        v34.i32[3] = v35.i32[3];
      }
    }
    else
    {
      v32 = (float32x4_t)vzip2q_s32((int32x4_t)v29, vuzp1q_s32((int32x4_t)v29, v30));
      v32.i32[2] = v28.i32[1];
      v33 = (float32x4_t)vtrn2q_s32(v30, vzip2q_s32(v30, (int32x4_t)v28));
      v33.i32[2] = v29.i32[0];
      v34 = vsubq_f32(v32, v33);
      v33.i32[3] = 1.0;
      v32.f32[3] = v31;
      v34.i32[3] = vaddq_f32(v32, v33).i32[3];
      v35.i32[0] = v34.i32[3];
    }
    v47 = vmulq_n_f32(v34, 0.5 / sqrtf(v35.f32[0]));
    v48 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
    v49 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 16);
    v50 = vmulq_f32(v47, v47);
    v51 = vaddq_f32(v50, v50);
    v52 = vmulq_laneq_f32(v47, v47, 3);
    v53 = vmulq_lane_f32(v47, *(float32x2_t *)v47.f32, 1).f32[0];
    v48.f32[0] = (float)(1.0 - v51.f32[1]) - v51.f32[2];
    v48.f32[1] = (float)(v53 + v52.f32[2]) + (float)(v53 + v52.f32[2]);
    v49.f32[0] = (float)(v53 - v52.f32[2]) + (float)(v53 - v52.f32[2]);
    v51.f32[0] = 1.0 - v51.f32[0];
    v49.f32[1] = v51.f32[0] - v51.f32[2];
    v54 = vmul_laneq_f32(*(float32x2_t *)v47.f32, v47, 2);
    v48.f32[2] = (float)(v54.f32[0] - v52.f32[1]) + (float)(v54.f32[0] - v52.f32[1]);
    v49.f32[2] = (float)(v54.f32[1] + v52.f32[0]) + (float)(v54.f32[1] + v52.f32[0]);
    *(int32x2_t *)v52.f32 = vrev64_s32(*(int32x2_t *)v52.f32);
    v55.i32[0] = vadd_f32(v54, *(float32x2_t *)v52.f32).u32[0];
    v55.i32[1] = vsub_f32(v54, *(float32x2_t *)&v52).i32[1];
    *(float32x2_t *)v56.f32 = vadd_f32(v55, v55);
    v56.i32[3] = HIDWORD(*(_QWORD *)(MEMORY[0x1E0C83FF0] + 40));
    v56.f32[2] = v51.f32[0] - v51.f32[1];
    v57 = vmulq_laneq_f32(v56, v27, 2);
    v58 = vaddq_f32(v13, *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48));
    v58.i32[3] = HIDWORD(*(_OWORD *)(MEMORY[0x1E0C83FF0] + 48));
    v59 = (float32x4_t)vdupq_n_s32(0x358637BDu);
    v60 = (uint32x4_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v59, vabdq_f32(v11, vmulq_lane_f32(v49, *(float32x2_t *)v27.f32, 1))), (int8x16_t)vcgeq_f32(v59, vabdq_f32(v13, v58))), (int8x16_t)vcgeq_f32(v59, vabdq_f32(v12, v57))), (int8x16_t)vcgeq_f32(v59, vabdq_f32(v10, vmulq_n_f32(v48, v27.f32[0]))));
    if ((vminvq_u32(v60) & 0x80000000) != 0)
    {
      if (v5 == *(void **)(a1 + 32))
      {
        objc_msgSend(v3, "simdPosition");
        v114 = v77;
        objc_msgSend(v3, "simdOrientation");
        v112 = v78;
        objc_msgSend(v3, "simdScale");
        v13 = v114;
        v27 = v79;
      }
      else
      {
        v112 = v47;
      }
      v115 = v13;
      v110 = v27;
      __asm { FMOV            V0.4S, #-1.0 }
      v84 = (uint32x4_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x358637BDu), vabsq_f32(vaddq_f32(v27, _Q0)));
      v84.i32[3] = v84.i32[2];
      v85 = vminvq_u32(v84);
      v84.i32[0] = v13.i32[0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), *(double *)v84.i64);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v86) = v115.i32[1];
      if ((v85 & 0x80000000) != 0)
      {
        v117[0] = v106;
        objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), v86);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v117[1] = v105;
        LODWORD(v94) = v115.i32[2];
        objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), v94);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v117[2] = v76;
        objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), *(double *)v112.i64);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v117[3] = v74;
        LODWORD(v95) = v112.i32[1];
        objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), v95);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v117[4] = v73;
        objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v112.u32[1], v112.u32[2])));
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v117[5] = v108;
        objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v112.u32[1], v112.u32[3])));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v117[6] = v75;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 7);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v72, v4);
      }
      else
      {
        v116[0] = v106;
        objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), v86);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v116[1] = v105;
        LODWORD(v87) = v115.i32[2];
        objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), v87);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v116[2] = v76;
        objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), *(double *)v112.i64);
        v104 = objc_claimAutoreleasedReturnValue();
        v116[3] = v104;
        LODWORD(v88) = v112.i32[1];
        objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), v88);
        v102 = objc_claimAutoreleasedReturnValue();
        v116[4] = v102;
        objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v112.u32[1], v112.u32[2])));
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v116[5] = v108;
        objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v112.u32[1], v112.u32[3])));
        v89 = objc_claimAutoreleasedReturnValue();
        v116[6] = v89;
        objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), *(double *)v110.i64);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v116[7] = v72;
        HIDWORD(v90) = v110.i32[1];
        LODWORD(v90) = v110.i32[1];
        objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v116[8] = v91;
        objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v110.u32[1], v110.u32[2])));
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v116[9] = v92;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 10);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v93, v4);

        v73 = (void *)v102;
        v75 = (void *)v89;

        v74 = (void *)v104;
      }
    }
    else
    {
      v100 = v5;
      v60.i32[0] = v10.i32[0];
      v111 = v12;
      v113 = v13;
      v107 = v10;
      v109 = v11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), *(double *)v60.i64);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v118[0] = v106;
      HIDWORD(v61) = v107.i32[1];
      LODWORD(v61) = v107.i32[1];
      objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), v61);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v118[1] = v105;
      objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v107.u32[1], v107.u32[2])));
      v99 = objc_claimAutoreleasedReturnValue();
      v118[2] = v99;
      objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v107.u32[1], v107.u32[3])));
      v103 = objc_claimAutoreleasedReturnValue();
      v118[3] = v103;
      objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), *(double *)v109.i64);
      v101 = objc_claimAutoreleasedReturnValue();
      v118[4] = v101;
      HIDWORD(v62) = v109.i32[1];
      LODWORD(v62) = v109.i32[1];
      objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), v62);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v118[5] = v108;
      objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v109.u32[1], v109.u32[2])));
      v98 = objc_claimAutoreleasedReturnValue();
      v118[6] = v98;
      objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v109.u32[1], v109.u32[3])));
      v96 = objc_claimAutoreleasedReturnValue();
      v118[7] = v96;
      objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), *(double *)v111.i64);
      v109.i64[0] = objc_claimAutoreleasedReturnValue();
      v118[8] = v109.i64[0];
      HIDWORD(v63) = v111.i32[1];
      LODWORD(v63) = v111.i32[1];
      objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), v63);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v118[9] = v97;
      objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v111.u32[1], v111.u32[2])));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v118[10] = v64;
      objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v111.u32[1], v111.u32[3])));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v118[11] = v65;
      objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), *(double *)v113.i64);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v118[12] = v66;
      HIDWORD(v67) = v113.i32[1];
      LODWORD(v67) = v113.i32[1];
      objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v118[13] = v68;
      objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v113.u32[1], v113.u32[2])));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v118[14] = v69;
      objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", *(_QWORD *)(a1 + 48), COERCE_DOUBLE(__PAIR64__(v113.u32[1], v113.u32[3])));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v118[15] = v70;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 16);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v71, v4);

      v72 = (void *)v96;
      v5 = v100;

      v73 = (void *)v101;
      v74 = (void *)v103;

      v75 = (void *)v98;
      v76 = (void *)v99;

    }
  }

}

- (AVTAvatarBodyPose)initWithHierarchy:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  AVTAvatarBodyPose *v19;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "childNodesPassingTest:recursively:", &__block_literal_global_1141, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("bodyRoot_JNT"));

        if (v12)
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("none"));
        }
        else
        {
          objc_msgSend(v10, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "rangeOfString:", CFSTR("_variant_"));
          v16 = v15;

          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v10, "name");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "substringFromIndex:", v14 + v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v18);
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  v19 = -[AVTAvatarBodyPose initWithRootJoints:](self, "initWithRootJoints:", v4);
  return v19;
}

uint64_t __39__AVTAvatarBodyPose_initWithHierarchy___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("bodyRoot_JNT"));

  return v3;
}

- (AVTAvatarBodyPose)initWithSceneAtURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  AVTAvatarBodyPose *v9;
  id v11;

  v4 = a3;
  v11 = 0;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CD5A10], "avt_newSceneWithURL:options:error:", v4, 0, &v11);
  v6 = v11;
  objc_msgSend(v5, "avt_fixQuirksOfNewUSDSchemaWithOptions:handler:", 0, 0);
  if (v6)
  {
    avt_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AVTAnimoji _load].cold.2(v4, v6, v7);

  }
  objc_msgSend(v5, "rootNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AVTAvatarBodyPose initWithHierarchy:](self, "initWithHierarchy:", v8);

  return v9;
}

- (AVTAvatarBodyPose)initWithDictionaryRepresentation:(id)a3
{
  id v5;
  AVTAvatarBodyPose *v6;
  AVTAvatarBodyPose *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarBodyPose;
  v6 = -[AVTAvatarBodyPose init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dictionaryRepresentation, a3);

  return v7;
}

- (void)applyToBodySkeletonWithRootJoint:(id)a3 ageBodyPoseVariantIntensity:(float)a4 shoulderWidthBodyPoseVariantIntensity:(float)a5
{
  AVTAvatarBodyPose *v8;
  void *v9;
  void *v10;
  AVTAvatarBodyPose *v11;
  void *v12;
  void *v13;
  double v14;
  NSDictionary *dictionaryRepresentation;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id v20;

  v20 = a3;
  +[AVTAvatarBodyPose neutralPose](AVTAvatarBodyPose, "neutralPose");
  v8 = (AVTAvatarBodyPose *)objc_claimAutoreleasedReturnValue();

  if (v8 != self)
  {
    if (a5 == 0.0)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepresentation, "objectForKeyedSubscript:", CFSTR("none"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepresentation, "objectForKeyedSubscript:", CFSTR("age_child"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = self;
      v12 = v9;
      v13 = v10;
      *(float *)&v14 = a4;
    }
    else
    {
      -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepresentation, "objectForKeyedSubscript:", CFSTR("none"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      dictionaryRepresentation = self->_dictionaryRepresentation;
      if (a4 != 0.0)
      {
        -[NSDictionary objectForKeyedSubscript:](dictionaryRepresentation, "objectForKeyedSubscript:", CFSTR("age_child"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepresentation, "objectForKeyedSubscript:", CFSTR("wide_shoulders_adult"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepresentation, "objectForKeyedSubscript:", CFSTR("wide_shoulders_child"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v18 = a4;
        *(float *)&v19 = a5;
        -[AVTAvatarBodyPose _applyBodyPoseWithDictionaryRepresentationA:dictionaryRepresentationB:dictionaryRepresentationC:dictionaryRepresentationD:variantIntensityX:variantIntensityY:skeletonRootJoint:](self, "_applyBodyPoseWithDictionaryRepresentationA:dictionaryRepresentationB:dictionaryRepresentationC:dictionaryRepresentationD:variantIntensityX:variantIntensityY:skeletonRootJoint:", v9, v10, v16, v17, v20, v18, v19);

        goto LABEL_8;
      }
      -[NSDictionary objectForKeyedSubscript:](dictionaryRepresentation, "objectForKeyedSubscript:", CFSTR("wide_shoulders_adult"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = self;
      v12 = v9;
      v13 = v10;
      *(float *)&v14 = a5;
    }
    -[AVTAvatarBodyPose _applyBodyPoseWithDictionaryRepresentationA:dictionaryRepresentationB:variantIntensity:skeletonRootJoint:](v11, "_applyBodyPoseWithDictionaryRepresentationA:dictionaryRepresentationB:variantIntensity:skeletonRootJoint:", v12, v13, v20, v14);
LABEL_8:

    goto LABEL_9;
  }
  -[NSDictionary objectForKeyedSubscript:](self->_dictionaryRepresentation, "objectForKeyedSubscript:", CFSTR("none"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarBodyPose _applyBodyPoseWithDictionaryRepresentation:skeletonRootJoint:](self, "_applyBodyPoseWithDictionaryRepresentation:skeletonRootJoint:", v9, v20);
LABEL_9:

}

- (void)_applyBodyPoseWithDictionaryRepresentation:(id)a3 skeletonRootJoint:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__AVTAvatarBodyPose__applyBodyPoseWithDictionaryRepresentation_skeletonRootJoint___block_invoke;
  v9[3] = &unk_1EA61DAC8;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  objc_msgSend(v7, "enumerateHierarchyUsingBlock:", v9);

}

void __82__AVTAvatarBodyPose__applyBodyPoseWithDictionaryRepresentation_skeletonRootJoint___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int32 v20;
  void *v21;
  float32x4_t v22;
  __int32 v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  float v28;
  void *v29;
  float v30;
  void *v31;
  float32x4_t v32;
  __int32 v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  __int32 v38;
  void *v39;
  float32x4_t v40;
  __int32 v41;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  __int32 v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  double v59;
  unint64_t v60;
  double v61;
  float v62;
  unint64_t v63;
  double v64;
  __int32 v65;
  float v66;
  unint64_t v67;
  float32x4_t v68;
  unint64_t v69;
  float32x4_t v70;
  unint64_t v71;
  id v72;

  v72 = a2;
  objc_msgSend(v72, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      if (objc_msgSend(v4, "count") == 16)
      {
        v69 = AVTAvatarPoseRepresentationGetTransform(v5).n128_u64[0];
        v61 = v7;
        v64 = v6;
        v59 = v8;
        objc_msgSend(v72, "parentNode");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = *(_QWORD *)(a1 + 40);
        v12 = *(double *)&v69;
        v14 = v61;
        v13 = v64;
        v15 = v59;
      }
      else
      {
        v16 = v5;
        objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "floatValue");
        v68.i64[0] = v18;
        objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "floatValue");
        v65 = v20;
        objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "floatValue");
        v22 = v68;
        v22.i32[1] = v65;
        v22.i32[2] = v23;
        v70 = v22;

        v24 = v16;
        objc_msgSend(v24, "objectAtIndexedSubscript:", 3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "floatValue");
        v58.i64[0] = v26;
        objc_msgSend(v24, "objectAtIndexedSubscript:", 4);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "floatValue");
        v66 = v28;
        objc_msgSend(v24, "objectAtIndexedSubscript:", 5);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "floatValue");
        v62 = v30;
        objc_msgSend(v24, "objectAtIndexedSubscript:", 6);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v31, "floatValue");
        v32 = v58;
        v32.f32[1] = v66;
        v32.f32[2] = v62;
        v55 = v32;
        v32.i32[3] = v33;
        v54 = v32;

        v34 = v24;
        if (objc_msgSend(v34, "count") == 10)
        {
          objc_msgSend(v34, "objectAtIndexedSubscript:", 7);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "floatValue");
          v56.i64[0] = v36;
          objc_msgSend(v34, "objectAtIndexedSubscript:", 8);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "floatValue");
          v53 = v38;
          objc_msgSend(v34, "objectAtIndexedSubscript:", 9);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "floatValue");
          v40 = v56;
          v40.i32[1] = v53;
          v40.i32[2] = v41;
          v57 = v40;

        }
        else
        {
          __asm { FMOV            V0.4S, #1.0 }
          v57 = _Q0;
        }

        v47 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
        v48 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 16);
        v49 = vmulq_f32(v54, v54);
        v50 = vaddq_f32(v49, v49);
        v51 = vmulq_laneq_f32(v55, v54, 3);
        v47.f32[0] = (float)(1.0 - v50.f32[1]) - v50.f32[2];
        v47.f32[1] = (float)((float)(v58.f32[0] * v66) + v51.f32[2]) + (float)((float)(v58.f32[0] * v66) + v51.f32[2]);
        v47.f32[2] = (float)((float)(v58.f32[0] * v62) - v51.f32[1]) + (float)((float)(v58.f32[0] * v62) - v51.f32[1]);
        v48.f32[0] = (float)((float)(v58.f32[0] * v66) - v51.f32[2]) + (float)((float)(v58.f32[0] * v66) - v51.f32[2]);
        v50.f32[0] = 1.0 - v50.f32[0];
        v48.f32[1] = v50.f32[0] - v50.f32[2];
        v48.f32[2] = (float)((float)(v66 * v62) + v51.f32[0]) + (float)((float)(v66 * v62) + v51.f32[0]);
        v52 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 32);
        v52.f32[0] = (float)((float)(v58.f32[0] * v62) + v51.f32[1]) + (float)((float)(v58.f32[0] * v62) + v51.f32[1]);
        v52.f32[1] = (float)((float)(v66 * v62) - v51.f32[0]) + (float)((float)(v66 * v62) - v51.f32[0]);
        v52.f32[2] = v50.f32[0] - v50.f32[1];
        v63 = vmulq_lane_f32(v48, *(float32x2_t *)v57.f32, 1).u64[0];
        v67 = vmulq_n_f32(v47, v57.f32[0]).u64[0];
        v60 = vmulq_laneq_f32(v52, v57, 2).u64[0];
        v71 = vaddq_f32(v70, *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48)).u64[0];
        objc_msgSend(v72, "parentNode");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = *(_QWORD *)(a1 + 40);
        v13 = *(double *)&v63;
        v12 = *(double *)&v67;
        v14 = *(double *)&v60;
        v15 = *(double *)&v71;
      }
      objc_msgSend(v9, "simdConvertTransform:fromNode:", v11, v12, v13, v14, v15);
      objc_msgSend(v72, "setSimdTransform:");

    }
  }

}

- (void)_applyBodyPoseWithDictionaryRepresentationA:(id)a3 dictionaryRepresentationB:(id)a4 variantIntensity:(float)a5 skeletonRootJoint:(id)a6
{
  id v10;
  id v11;
  AVTAvatarBodyPose *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  float v19;

  v14 = a3;
  v10 = a4;
  v11 = a6;
  if (a5 == 0.0)
  {
    v12 = self;
    v13 = v14;
  }
  else
  {
    if (a5 != 1.0)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __126__AVTAvatarBodyPose__applyBodyPoseWithDictionaryRepresentationA_dictionaryRepresentationB_variantIntensity_skeletonRootJoint___block_invoke;
      v15[3] = &unk_1EA61EF60;
      v16 = v14;
      v17 = v10;
      v19 = a5;
      v18 = v11;
      objc_msgSend(v18, "enumerateHierarchyUsingBlock:", v15);

      goto LABEL_6;
    }
    v12 = self;
    v13 = v10;
  }
  -[AVTAvatarBodyPose _applyBodyPoseWithDictionaryRepresentation:skeletonRootJoint:](v12, "_applyBodyPoseWithDictionaryRepresentation:skeletonRootJoint:", v13, v11);
LABEL_6:

}

void __126__AVTAvatarBodyPose__applyBodyPoseWithDictionaryRepresentationA_dictionaryRepresentationB_variantIntensity_skeletonRootJoint___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  float32x4_t v8;
  simd_quatf v9;
  float32x4_t v10;
  __n128 v11;
  float v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int32 v26;
  void *v27;
  __int32 v28;
  float32x4_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __int32 v34;
  void *v35;
  __int32 v36;
  void *v37;
  __int32 v38;
  simd_quatf v39;
  id v40;
  uint64_t v41;
  void *v46;
  uint64_t v47;
  void *v48;
  __int32 v49;
  void *v50;
  float32x4_t v51;
  __int32 v52;
  float32x4_t v53;
  simd_quatf v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  __int32 v59;
  void *v60;
  float32x4_t v61;
  __int32 v62;
  id v63;
  void *v64;
  unsigned int v65;
  void *v66;
  unsigned int v67;
  void *v68;
  unsigned int v69;
  void *v70;
  float32x4_t v71;
  unsigned int v72;
  id v73;
  void *v74;
  uint64_t v75;
  void *v76;
  __int32 v77;
  void *v78;
  float32x4_t v79;
  __int32 v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  float32x4_t v88;
  float32x4_t v89;
  float v90;
  float32x2_t v91;
  unsigned int v92;
  __int32 v93;
  unsigned int v94;
  __int32 v95;
  float v96;
  __int32 v97;
  float32x4_t v98;
  __int32 v99;
  float32x4_t v100;
  __n128 Transform;
  __int32 v102;
  __int32 v103;
  unsigned int v104;
  float32x4_t v105;
  unint64_t v106;
  float32x4_t v107;
  float32x4_t v108;
  float32x4_t v109;
  unint64_t v110;
  simd_quatf v111;
  simd_quatf v112;
  simd_quatf v113;
  simd_quatf v114;
  unint64_t v115;
  float32x4_t v116;
  float32x4_t v117;
  unint64_t v118;
  float32x4_t v119;
  float32x4_t v120;
  float32x4_t v121;
  id v122;

  v122 = a2;
  objc_msgSend(v122, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v4)
      _ZF = v5 == 0;
    else
      _ZF = 1;
    if (!_ZF)
    {
      if (objc_msgSend(v4, "count") == 16 || objc_msgSend(v6, "count") == 16)
      {
        Transform = AVTAvatarPoseRepresentationGetTransform(v4);
        v108 = v8;
        v112 = v9;
        v117 = v10;
        v11 = AVTAvatarPoseRepresentationGetTransform(v6);
        v12 = *(float *)(a1 + 56);
        Transform.n128_u64[0] = vmlaq_n_f32(vmulq_n_f32((float32x4_t)v11, v12), (float32x4_t)Transform, 1.0 - v12).u64[0];
        v108.i64[0] = vmlaq_n_f32(vmulq_n_f32(v13, v12), v108, 1.0 - v12).u64[0];
        v112.vector.i64[0] = vmlaq_n_f32(vmulq_n_f32(v14, v12), (float32x4_t)v112, 1.0 - v12).u64[0];
        v118 = vmlaq_n_f32(vmulq_n_f32(v15, v12), v117, 1.0 - v12).u64[0];
        objc_msgSend(v122, "parentNode");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        v18 = *(_QWORD *)(a1 + 48);
        v19 = Transform.n128_f64[0];
        v20 = *(double *)v108.i64;
        v21 = *(double *)v112.vector.i64;
      }
      else
      {
        v22 = v4;
        objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "floatValue");
        v116.i64[0] = v24;
        objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "floatValue");
        v111.vector.i32[0] = v26;
        objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "floatValue");
        v107.i32[0] = v28;
        v29 = v116;
        v29.i32[1] = v111.vector.i32[0];
        v119 = v29;

        v30 = v22;
        objc_msgSend(v30, "objectAtIndexedSubscript:", 3);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "floatValue");
        v111.vector.i64[0] = v32;
        objc_msgSend(v30, "objectAtIndexedSubscript:", 4);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "floatValue");
        v99 = v34;
        objc_msgSend(v30, "objectAtIndexedSubscript:", 5);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "floatValue");
        v97 = v36;
        objc_msgSend(v30, "objectAtIndexedSubscript:", 6);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v37, "floatValue");
        v102 = v38;
        v39 = v111;
        v39.vector.i32[1] = v99;
        v39.vector.i32[2] = v97;
        v113 = v39;

        v40 = v30;
        v41 = objc_msgSend(v40, "count");
        __asm { FMOV            V0.4S, #1.0 }
        v98 = _Q0;
        v100 = _Q0;
        if (v41 == 10)
        {
          objc_msgSend(v40, "objectAtIndexedSubscript:", 7);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "floatValue");
          v100.i64[0] = v47;
          objc_msgSend(v40, "objectAtIndexedSubscript:", 8);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "floatValue");
          v93 = v49;
          objc_msgSend(v40, "objectAtIndexedSubscript:", 9);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "floatValue");
          v51 = v100;
          v51.i32[1] = v93;
          v51.i32[2] = v52;
          v100 = v51;

        }
        v53 = v119;
        v53.i32[2] = v107.i32[0];
        v120 = v53;
        v54 = v113;
        v54.vector.i32[3] = v102;
        v114 = v54;

        v55 = v6;
        objc_msgSend(v55, "objectAtIndexedSubscript:", 0);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "floatValue");
        v107.i64[0] = v57;
        objc_msgSend(v55, "objectAtIndexedSubscript:", 1);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "floatValue");
        v103 = v59;
        objc_msgSend(v55, "objectAtIndexedSubscript:", 2);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v60, "floatValue");
        v61 = v107;
        v61.i32[1] = v103;
        v61.i32[2] = v62;
        v109 = v61;

        v63 = v55;
        objc_msgSend(v63, "objectAtIndexedSubscript:", 3);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "floatValue");
        v104 = v65;
        objc_msgSend(v63, "objectAtIndexedSubscript:", 4);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "floatValue");
        v94 = v67;
        objc_msgSend(v63, "objectAtIndexedSubscript:", 5);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "floatValue");
        v92 = v69;
        objc_msgSend(v63, "objectAtIndexedSubscript:", 6);
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v70, "floatValue");
        v71.i64[0] = __PAIR64__(v94, v104);
        v71.i64[1] = __PAIR64__(v72, v92);
        v105 = v71;

        v73 = v63;
        if (objc_msgSend(v73, "count") == 10)
        {
          objc_msgSend(v73, "objectAtIndexedSubscript:", 7);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "floatValue");
          v98.i64[0] = v75;
          objc_msgSend(v73, "objectAtIndexedSubscript:", 8);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "floatValue");
          v95 = v77;
          objc_msgSend(v73, "objectAtIndexedSubscript:", 9);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "floatValue");
          v79 = v98;
          v79.i32[1] = v95;
          v79.i32[2] = v80;
          v98 = v79;

        }
        v96 = *(float *)(a1 + 56);
        v121 = vmlaq_n_f32(v120, vsubq_f32(v109, v120), v96);
        v81 = vmulq_f32((float32x4_t)v114, v105);
        v82 = (float32x4_t)vextq_s8((int8x16_t)v81, (int8x16_t)v81, 8uLL);
        *(float32x2_t *)v82.f32 = vadd_f32(*(float32x2_t *)v81.f32, *(float32x2_t *)v82.f32);
        v81.f32[0] = vaddv_f32(*(float32x2_t *)v82.f32);
        v82.i32[0] = 0;
        _simd_slerp_internal((float32x4_t)v114, (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v81, v82)), 0), (int8x16_t)vnegq_f32(v105), (int8x16_t)v105), v96);
        v83 = vmlaq_n_f32(v100, vsubq_f32(v98, v100), v96);
        v84 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
        v85 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 16);
        v87 = vmulq_f32(v86, v86);
        v88 = vaddq_f32(v87, v87);
        v89 = vmulq_laneq_f32(v86, v86, 3);
        v90 = vmulq_lane_f32(v86, *(float32x2_t *)v86.f32, 1).f32[0];
        v84.f32[0] = (float)(1.0 - v88.f32[1]) - v88.f32[2];
        v84.f32[1] = (float)(v90 + v89.f32[2]) + (float)(v90 + v89.f32[2]);
        v85.f32[0] = (float)(v90 - v89.f32[2]) + (float)(v90 - v89.f32[2]);
        v88.f32[0] = 1.0 - v88.f32[0];
        v85.f32[1] = v88.f32[0] - v88.f32[2];
        *(float32x2_t *)v86.f32 = vmul_laneq_f32(*(float32x2_t *)v86.f32, v86, 2);
        v84.f32[2] = (float)(v86.f32[0] - v89.f32[1]) + (float)(v86.f32[0] - v89.f32[1]);
        v85.f32[2] = (float)(v86.f32[1] + v89.f32[0]) + (float)(v86.f32[1] + v89.f32[0]);
        *(int32x2_t *)v89.f32 = vrev64_s32(*(int32x2_t *)v89.f32);
        v91.i32[0] = vadd_f32(*(float32x2_t *)v86.f32, *(float32x2_t *)v89.f32).u32[0];
        v91.i32[1] = vsub_f32(*(float32x2_t *)&v86, *(float32x2_t *)&v89).i32[1];
        *(float32x2_t *)v86.f32 = vadd_f32(v91, v91);
        v86.i32[3] = HIDWORD(*(_QWORD *)(MEMORY[0x1E0C83FF0] + 40));
        v86.f32[2] = v88.f32[0] - v88.f32[1];
        v110 = vmulq_lane_f32(v85, *(float32x2_t *)v83.f32, 1).u64[0];
        v115 = vmulq_n_f32(v84, v83.f32[0]).u64[0];
        v106 = vmulq_laneq_f32(v86, v83, 2).u64[0];
        v118 = vaddq_f32(v121, *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48)).u64[0];
        objc_msgSend(v122, "parentNode");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        v18 = *(_QWORD *)(a1 + 48);
        v20 = *(double *)&v110;
        v19 = *(double *)&v115;
        v21 = *(double *)&v106;
      }
      objc_msgSend(v16, "simdConvertTransform:fromNode:", v18, v19, v20, v21, *(double *)&v118);
      objc_msgSend(v122, "setSimdTransform:");

    }
  }

}

- (void)_applyBodyPoseWithDictionaryRepresentationA:(id)a3 dictionaryRepresentationB:(id)a4 dictionaryRepresentationC:(id)a5 dictionaryRepresentationD:(id)a6 variantIntensityX:(float)a7 variantIntensityY:(float)a8 skeletonRootJoint:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  double v20;
  AVTAvatarBodyPose *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  float v30;
  float v31;

  v24 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  if (a7 == 0.0)
  {
    v21 = self;
    v22 = v24;
    v23 = v17;
LABEL_5:
    *(float *)&v20 = a8;
    goto LABEL_6;
  }
  if (a7 == 1.0)
  {
    v21 = self;
    v22 = v16;
    v23 = v18;
    goto LABEL_5;
  }
  if (a8 == 0.0)
  {
    v21 = self;
    v22 = v24;
    v23 = v16;
  }
  else
  {
    if (a8 != 1.0)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __197__AVTAvatarBodyPose__applyBodyPoseWithDictionaryRepresentationA_dictionaryRepresentationB_dictionaryRepresentationC_dictionaryRepresentationD_variantIntensityX_variantIntensityY_skeletonRootJoint___block_invoke;
      v25[3] = &unk_1EA61EF88;
      v26 = v24;
      v27 = v16;
      v28 = v17;
      v29 = v18;
      v30 = a7;
      v31 = a8;
      objc_msgSend(v19, "enumerateHierarchyUsingBlock:", v25);

      goto LABEL_7;
    }
    v21 = self;
    v22 = v17;
    v23 = v18;
  }
  *(float *)&v20 = a7;
LABEL_6:
  -[AVTAvatarBodyPose _applyBodyPoseWithDictionaryRepresentationA:dictionaryRepresentationB:variantIntensity:skeletonRootJoint:](v21, "_applyBodyPoseWithDictionaryRepresentationA:dictionaryRepresentationB:variantIntensity:skeletonRootJoint:", v22, v23, v19, v20, v24);
LABEL_7:

}

void __197__AVTAvatarBodyPose__applyBodyPoseWithDictionaryRepresentationA_dictionaryRepresentationB_dictionaryRepresentationC_dictionaryRepresentationD_variantIntensityX_variantIntensityY_skeletonRootJoint___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __n128 Transform;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  __n128 v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  __n128 v20;
  float v21;
  float v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v35;
  __int32 v36;
  id v37;
  uint64_t v38;
  void *v39;
  int v40;
  void *v41;
  int v42;
  void *v43;
  __int32 v44;
  id v45;
  uint64_t v46;
  void *v52;
  uint64_t v53;
  void *v54;
  __int32 v55;
  void *v56;
  float32x4_t v57;
  __int32 v58;
  float32x4_t v59;
  id v60;
  void *v61;
  uint64_t v62;
  void *v63;
  int v64;
  void *v65;
  __int32 v66;
  id v67;
  uint64_t v68;
  void *v69;
  int v70;
  void *v71;
  int v72;
  void *v73;
  __int32 v74;
  float32x4_t v75;
  id v76;
  void *v77;
  uint64_t v78;
  void *v79;
  __int32 v80;
  void *v81;
  float32x4_t v82;
  __int32 v83;
  float32x4_t v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  id v88;
  void *v89;
  uint64_t v90;
  void *v91;
  int v92;
  void *v93;
  __int32 v94;
  float32x4_t v95;
  id v96;
  uint64_t v97;
  void *v98;
  int v99;
  void *v100;
  int v101;
  void *v102;
  __int32 v103;
  float32x4_t v104;
  id v105;
  void *v106;
  uint64_t v107;
  void *v108;
  __int32 v109;
  void *v110;
  float32x4_t v111;
  __int32 v112;
  float32x4_t v113;
  float32x4_t v114;
  float32x4_t v115;
  float32x4_t v116;
  float32x4_t v117;
  float32x4_t v118;
  id v119;
  void *v120;
  uint64_t v121;
  void *v122;
  __int32 v123;
  void *v124;
  float32x4_t v125;
  __int32 v126;
  id v127;
  unsigned int v128;
  void *v129;
  unsigned int v130;
  void *v131;
  unsigned int v132;
  void *v133;
  float32x4_t v134;
  unsigned int v135;
  id v136;
  void *v137;
  uint64_t v138;
  void *v139;
  __int32 v140;
  void *v141;
  float32x4_t v142;
  __int32 v143;
  float v144;
  int8x16_t v145;
  int32x2_t v146;
  float v147;
  int8x16_t v148;
  float32x2_t v149;
  int8x16_t v150;
  unsigned int v151;
  float32x4_t v152;
  int8x16_t v153;
  unsigned int v154;
  float32x4_t v155;
  float32x4_t v156;
  float32x4_t v157;
  float32x4_t v158;
  float32x4_t v159;
  float32x4_t v160;
  float32x4_t v161;
  float32x4_t v162;
  float32x4_t v163;
  float32x4_t v164;
  float v165;
  float32x2_t v166;
  int v167;
  int v168;
  __int32 v169;
  int v170;
  __int32 v171;
  __int32 v172;
  int v173;
  __int32 v174;
  unsigned int v175;
  __int32 v176;
  unsigned int v177;
  __int32 v178;
  void *v179;
  __int32 v180;
  float v181;
  float32x4_t v182;
  void *v183;
  float32x4_t v184;
  float32x4_t v185;
  float32x4_t v186;
  float32x4_t v187;
  float32x4_t v188;
  __int32 v189;
  __int32 v190;
  unsigned int v191;
  float32x4_t v192;
  float32x4_t v193;
  float32x4_t v194;
  float32x4_t v195;
  int v196;
  void *v197;
  float32x4_t v198;
  float32x4_t v199;
  float32x4_t v200;
  float32x4_t v201;
  float32x4_t v202;
  float32x4_t v203;
  void *v204;
  __int32 v205;
  float32x4_t v206;
  float32x4_t v207;
  __int8 v208;
  float32x4_t v209;
  __n128 v210;
  float32x4_t v211;
  float32x4_t v212;
  float32x4_t v213;
  float32x4_t v214;
  float32x4_t v215;
  float32x4_t v216;
  float32x4_t v217;
  float32x4_t v218;
  float32x4_t v219;
  float32x4_t v220;
  float32x4_t v221;
  float32x4_t v222;
  float v223;
  float32x4_t v224;
  float32x4_t v225;
  float32x4_t v226;
  float32x4_t v227;
  float32x4_t v228;
  float32x4_t v229;
  float32x4_t v230;
  float32x4_t v231;
  float32x4_t v232;
  float32x4_t v233;
  float32x4_t v234;
  id v235;

  v235 = a2;
  objc_msgSend(v235, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v4 && v5 && v6 && v7)
    {
      if (objc_msgSend(v4, "count") == 16 || objc_msgSend(v5, "count") == 16 || objc_msgSend(v6, "count") == 16)
      {
        Transform = AVTAvatarPoseRepresentationGetTransform(v4);
        v225 = v10;
        v231 = (float32x4_t)Transform;
        v214 = v12;
        v219 = v11;
        v210 = AVTAvatarPoseRepresentationGetTransform(v5);
        v199 = v14;
        v203 = v13;
        v195 = v15;
        v16 = AVTAvatarPoseRepresentationGetTransform(v6);
        v188 = v17;
        v193 = (float32x4_t)v16;
        v182 = v19;
        v186 = v18;
        v20 = AVTAvatarPoseRepresentationGetTransform(v8);
        v21 = *(float *)(a1 + 64);
        v22 = *(float *)(a1 + 68);
        v26 = vmlaq_n_f32(vmulq_n_f32(vmlaq_n_f32(vmulq_n_f32((float32x4_t)v20, v21), v193, 1.0 - v21), v22), vmlaq_n_f32(vmulq_n_f32((float32x4_t)v210, v21), v231, 1.0 - v21), 1.0 - v22).u64[0];
        v27 = vmlaq_n_f32(vmulq_n_f32(vmlaq_n_f32(vmulq_n_f32(v23, v21), v188, 1.0 - v21), v22), vmlaq_n_f32(vmulq_n_f32(v203, v21), v225, 1.0 - v21), 1.0 - v22).u64[0];
        v28 = vmlaq_n_f32(vmulq_n_f32(vmlaq_n_f32(vmulq_n_f32(v24, v21), v186, 1.0 - v21), v22), vmlaq_n_f32(vmulq_n_f32(v199, v21), v219, 1.0 - v21), 1.0 - v22).u64[0];
        v29 = vmlaq_n_f32(vmulq_n_f32(vmlaq_n_f32(vmulq_n_f32(v25, v21), v182, 1.0 - v21), v22), vmlaq_n_f32(vmulq_n_f32(v195, v21), v214, 1.0 - v21), 1.0 - v22).u64[0];
      }
      else
      {
        v30 = v4;
        objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "floatValue");
        v230.i64[0] = v32;
        objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "floatValue");
        v213.i32[0] = v34;
        objc_msgSend(v30, "objectAtIndexedSubscript:", 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v35, "floatValue");
        v189 = v36;

        v37 = v30;
        objc_msgSend(v37, "objectAtIndexedSubscript:", 3);
        v204 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v204, "floatValue");
        v224.i64[0] = v38;
        objc_msgSend(v37, "objectAtIndexedSubscript:", 4);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "floatValue");
        v218.i32[0] = v40;
        objc_msgSend(v37, "objectAtIndexedSubscript:", 5);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "floatValue");
        v209.i32[0] = v42;
        objc_msgSend(v37, "objectAtIndexedSubscript:", 6);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v43, "floatValue");
        v185.i32[0] = v44;

        v45 = v37;
        v46 = objc_msgSend(v45, "count");
        __asm { FMOV            V0.4S, #1.0 }
        v194 = _Q0;
        v200 = _Q0;
        if (v46 == 10)
        {
          objc_msgSend(v45, "objectAtIndexedSubscript:", 7);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "floatValue");
          v200.i64[0] = v53;
          objc_msgSend(v45, "objectAtIndexedSubscript:", 8);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "floatValue");
          v205 = v55;
          objc_msgSend(v45, "objectAtIndexedSubscript:", 9);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "floatValue");
          v57 = v200;
          v57.i32[1] = v205;
          v57.i32[2] = v58;
          v200 = v57;

        }
        v59 = v224;
        v59.i32[1] = v218.i32[0];
        v226 = v59;

        v60 = v5;
        objc_msgSend(v60, "objectAtIndexedSubscript:", 0);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "floatValue");
        v202.i64[0] = v62;
        objc_msgSend(v60, "objectAtIndexedSubscript:", 1);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "floatValue");
        v196 = v64;
        objc_msgSend(v60, "objectAtIndexedSubscript:", 2);
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v65, "floatValue");
        v178 = v66;

        v67 = v60;
        objc_msgSend(v67, "objectAtIndexedSubscript:", 3);
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v183, "floatValue");
        v218.i64[0] = v68;
        objc_msgSend(v67, "objectAtIndexedSubscript:", 4);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "floatValue");
        v170 = v70;
        objc_msgSend(v67, "objectAtIndexedSubscript:", 5);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "floatValue");
        v173 = v72;
        objc_msgSend(v67, "objectAtIndexedSubscript:", 6);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v73, "floatValue");
        v176 = v74;
        v75 = v218;
        v75.i32[1] = v170;
        v220 = v75;

        v76 = v67;
        v184 = v194;
        if (objc_msgSend(v76, "count") == 10)
        {
          objc_msgSend(v76, "objectAtIndexedSubscript:", 7);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "floatValue");
          v184.i64[0] = v78;
          objc_msgSend(v76, "objectAtIndexedSubscript:", 8);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "floatValue");
          v171 = v80;
          objc_msgSend(v76, "objectAtIndexedSubscript:", 9);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "floatValue");
          v82 = v184;
          v82.i32[1] = v171;
          v82.i32[2] = v83;
          v184 = v82;

        }
        v84 = v230;
        v84.i32[1] = v213.i32[0];
        v232 = v84;
        v85 = v226;
        v85.i32[2] = v209.i32[0];
        v227 = v85;
        v86 = v202;
        v86.i32[1] = v196;
        v206 = v86;
        v87 = v220;
        v87.i32[2] = v173;
        v221 = v87;

        v88 = v6;
        objc_msgSend(v88, "objectAtIndexedSubscript:", 0);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "floatValue");
        v213.i64[0] = v90;
        objc_msgSend(v88, "objectAtIndexedSubscript:", 1);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "floatValue");
        v209.i32[0] = v92;
        objc_msgSend(v88, "objectAtIndexedSubscript:", 2);
        v93 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v93, "floatValue");
        v174 = v94;
        v95 = v213;
        v95.i32[1] = v209.i32[0];
        v215 = v95;

        v96 = v88;
        objc_msgSend(v96, "objectAtIndexedSubscript:", 3);
        v197 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v197, "floatValue");
        v209.i64[0] = v97;
        objc_msgSend(v96, "objectAtIndexedSubscript:", 4);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "floatValue");
        v168 = v99;
        objc_msgSend(v96, "objectAtIndexedSubscript:", 5);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "floatValue");
        v167 = v101;
        objc_msgSend(v96, "objectAtIndexedSubscript:", 6);
        v102 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v102, "floatValue");
        v172 = v103;
        v104 = v209;
        v104.i32[1] = v168;
        v104.i32[2] = v167;
        v211 = v104;

        v105 = v96;
        v198 = v194;
        if (objc_msgSend(v105, "count") == 10)
        {
          objc_msgSend(v105, "objectAtIndexedSubscript:", 7);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "floatValue");
          v198.i64[0] = v107;
          objc_msgSend(v105, "objectAtIndexedSubscript:", 8);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "floatValue");
          v169 = v109;
          objc_msgSend(v105, "objectAtIndexedSubscript:", 9);
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "floatValue");
          v111 = v198;
          v111.i32[1] = v169;
          v111.i32[2] = v112;
          v198 = v111;

        }
        v113 = v232;
        v113.i32[2] = v189;
        v233 = v113;
        v114 = v227;
        v114.i32[3] = v185.i32[0];
        v228 = v114;
        v115 = v206;
        v115.i32[2] = v178;
        v207 = v115;
        v116 = v221;
        v116.i32[3] = v176;
        v222 = v116;
        v117 = v215;
        v117.i32[2] = v174;
        v216 = v117;
        v118 = v211;
        v118.i32[3] = v172;
        v212 = v118;

        v119 = v8;
        objc_msgSend(v119, "objectAtIndexedSubscript:", 0);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "floatValue");
        v185.i64[0] = v121;
        objc_msgSend(v119, "objectAtIndexedSubscript:", 1);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "floatValue");
        v190 = v123;
        objc_msgSend(v119, "objectAtIndexedSubscript:", 2);
        v124 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v124, "floatValue");
        v125 = v185;
        v125.i32[1] = v190;
        v125.i32[2] = v126;
        v187 = v125;

        v127 = v119;
        objc_msgSend(v127, "objectAtIndexedSubscript:", 3);
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v179, "floatValue");
        v191 = v128;
        objc_msgSend(v127, "objectAtIndexedSubscript:", 4);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "floatValue");
        v177 = v130;
        objc_msgSend(v127, "objectAtIndexedSubscript:", 5);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v131, "floatValue");
        v175 = v132;
        objc_msgSend(v127, "objectAtIndexedSubscript:", 6);
        v133 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v133, "floatValue");
        v134.i64[0] = __PAIR64__(v177, v191);
        v134.i64[1] = __PAIR64__(v135, v175);
        v192 = v134;

        v136 = v127;
        if (objc_msgSend(v136, "count") == 10)
        {
          objc_msgSend(v136, "objectAtIndexedSubscript:", 7);
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v137, "floatValue");
          v194.i64[0] = v138;
          objc_msgSend(v136, "objectAtIndexedSubscript:", 8);
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v139, "floatValue");
          v180 = v140;
          objc_msgSend(v136, "objectAtIndexedSubscript:", 9);
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "floatValue");
          v142 = v194;
          v142.i32[1] = v180;
          v142.i32[2] = v143;
          v194 = v142;

        }
        v144 = *(float *)(a1 + 64);
        v234 = vmlaq_n_f32(v233, vsubq_f32(v207, v233), v144);
        v145 = (int8x16_t)vmulq_f32(v228, v222);
        v146 = (int32x2_t)vadd_f32(*(float32x2_t *)v145.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v145, v145, 8uLL));
        v147 = v144;
        v201 = vmlaq_n_f32(v200, vsubq_f32(v184, v200), v144);
        v148 = (int8x16_t)vmulq_f32(v212, v192);
        *(float32x2_t *)v148.i8 = vadd_f32(*(float32x2_t *)v148.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v148, v148, 8uLL));
        *(int32x2_t *)v145.i8 = vzip1_s32(*(int32x2_t *)v148.i8, v146);
        v149 = (float32x2_t)vzip2_s32(*(int32x2_t *)v148.i8, v146);
        v150 = (int8x16_t)vnegq_f32(v222);
        *(int8x8_t *)v145.i8 = vmvn_s8((int8x8_t)vcgez_f32(vadd_f32(*(float32x2_t *)v145.i8, v149)));
        v208 = v145.i8[0];
        v181 = v147;
        v217 = vmlaq_n_f32(v216, vsubq_f32(v187, v216), v147);
        if ((v145.i8[4] & 1) != 0)
          v151 = -1;
        else
          v151 = 0;
        _simd_slerp_internal(v228, (float32x4_t)vbslq_s8((int8x16_t)vdupq_n_s32(v151), v150, (int8x16_t)v222), v147);
        v229 = v152;
        v153 = (int8x16_t)vnegq_f32(v192);
        if ((v208 & 1) != 0)
          v154 = -1;
        else
          v154 = 0;
        _simd_slerp_internal(v212, (float32x4_t)vbslq_s8((int8x16_t)vdupq_n_s32(v154), v153, (int8x16_t)v192), v181);
        v223 = *(float *)(a1 + 68);
        v156 = vmulq_f32(v229, v155);
        v157 = (float32x4_t)vextq_s8((int8x16_t)v156, (int8x16_t)v156, 8uLL);
        *(float32x2_t *)v156.f32 = vadd_f32(*(float32x2_t *)v156.f32, *(float32x2_t *)v157.f32);
        v156.f32[0] = vaddv_f32(*(float32x2_t *)v156.f32);
        v157.i32[0] = 0;
        _simd_slerp_internal(v229, (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v156, v157)), 0), (int8x16_t)vnegq_f32(v155), (int8x16_t)v155), v223);
        v158 = vmlaq_n_f32(v201, vsubq_f32(vmlaq_n_f32(v198, vsubq_f32(v194, v198), v181), v201), v223);
        v159 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
        v160 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 16);
        v162 = vmulq_f32(v161, v161);
        v163 = vaddq_f32(v162, v162);
        v164 = vmulq_laneq_f32(v161, v161, 3);
        v165 = vmulq_lane_f32(v161, *(float32x2_t *)v161.f32, 1).f32[0];
        v159.f32[0] = (float)(1.0 - v163.f32[1]) - v163.f32[2];
        v159.f32[1] = (float)(v165 + v164.f32[2]) + (float)(v165 + v164.f32[2]);
        v160.f32[0] = (float)(v165 - v164.f32[2]) + (float)(v165 - v164.f32[2]);
        v163.f32[0] = 1.0 - v163.f32[0];
        v160.f32[1] = v163.f32[0] - v163.f32[2];
        *(float32x2_t *)v161.f32 = vmul_laneq_f32(*(float32x2_t *)v161.f32, v161, 2);
        v159.f32[2] = (float)(v161.f32[0] - v164.f32[1]) + (float)(v161.f32[0] - v164.f32[1]);
        v160.f32[2] = (float)(v161.f32[1] + v164.f32[0]) + (float)(v161.f32[1] + v164.f32[0]);
        *(int32x2_t *)v164.f32 = vrev64_s32(*(int32x2_t *)v164.f32);
        v166.i32[0] = vadd_f32(*(float32x2_t *)v161.f32, *(float32x2_t *)v164.f32).u32[0];
        v166.i32[1] = vsub_f32(*(float32x2_t *)&v161, *(float32x2_t *)&v164).i32[1];
        *(float32x2_t *)v164.f32 = vadd_f32(v166, v166);
        v161.i64[0] = *(_QWORD *)(MEMORY[0x1E0C83FF0] + 40);
        v161.f32[0] = v163.f32[0] - v163.f32[1];
        v164.i64[1] = v161.i64[0];
        v26 = vmulq_n_f32(v159, v158.f32[0]).u64[0];
        v27 = vmulq_lane_f32(v160, *(float32x2_t *)v158.f32, 1).u64[0];
        v28 = vmulq_laneq_f32(v164, v158, 2).u64[0];
        v29 = vaddq_f32(vmlaq_n_f32(v234, vsubq_f32(v217, v234), v223), *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48)).u64[0];
      }
      objc_msgSend(v235, "setSimdWorldTransform:", *(double *)&v26, *(double *)&v27, *(double *)&v28, *(double *)&v29);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
}

+ (void)posesInPosePack:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DD1FA000, a2, OS_LOG_TYPE_ERROR, "Error: Failed to find pose pack named \"%@\", (uint8_t *)&v2, 0xCu);
}

@end
