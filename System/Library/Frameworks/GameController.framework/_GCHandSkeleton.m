@implementation _GCHandSkeleton

- (_GCHandSkeleton)initWithBoneData:(const void *)a3 profile:(void *)a4 handedness:(int64_t)a5
{
  id v8;
  _GCHandSkeleton *v9;
  _GCHandSkeleton *v10;
  uint64_t v11;
  const $8EF4127CF77ECA3DDB612FCF233DC3A8 **v12;
  _GCHandSkeleton *v13;
  uint64_t i;
  float32x4_t *v15;
  float32x4_t v16;
  objc_super v18;

  v8 = a4;
  v18.receiver = a1;
  v18.super_class = (Class)_GCHandSkeleton;
  v9 = -[_GCHandSkeleton init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_physicalInput, v8);
    memcpy(&v10->_boneData, a3, 0x3E0uLL);
    v11 = 0;
    v10->_handedness = a5;
    v12 = (const $8EF4127CF77ECA3DDB612FCF233DC3A8 **)&kRightSkeletons;
    if (a5 == 1)
      v12 = (const $8EF4127CF77ECA3DDB612FCF233DC3A8 **)&kLeftSkeletons;
    v10->referenceSkeletons = v12;
    v10->_interpolationMethod = 1;
    v13 = v10;
    do
    {
      for (i = 0; i != 992; i += 32)
      {
        v15 = (float32x4_t *)((char *)v13 + i);
        v15[65] = dqMakeDualQuaternion(*(float32x4_t *)((char *)v10->referenceSkeletons[v11] + i + 16));
        v15[66] = v16;
      }
      ++v11;
      v13 = (_GCHandSkeleton *)((char *)v13 + 992);
    }
    while (v11 != 4);
  }

  return v10;
}

- (BOOL)rightHand
{
  return self->_handedness == 2;
}

- (void)boneDataWithTransformSpace:(uint64_t)a3@<X3> motionRange:(void *)a4@<X8>
{
  void *v5;
  int v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  int v18;
  void *result;
  uint64_t v20;
  id WeakRetained;
  _BYTE __src[992];
  _DWORD v26[7];

  v20 = a1 + 32;
  memcpy(a4, (const void *)(a1 + 32), 0x3E0uLL);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  objc_msgSend(WeakRetained, "objectForKeyedSubscript:", CFSTR("XRPropertyButtonFingerThumb"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v26[0] = v6;
  v7 = objc_loadWeakRetained((id *)(a1 + 8));
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("XRPropertyButtonFingerIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v26[1] = v9;
  v10 = objc_loadWeakRetained((id *)(a1 + 8));
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("XRPropertyButtonFingerMiddle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "value");
  v26[2] = v12;
  v13 = objc_loadWeakRetained((id *)(a1 + 8));
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("XRPropertyButtonFingerRing"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "value");
  v26[3] = v15;
  v16 = objc_loadWeakRetained((id *)(a1 + 8));
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("XRPropertyButtonFingerLittle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "value");
  v26[4] = v18;

  result = (void *)objc_msgSend((id)a1, "fingerPositionsChangedForCurlAmts:", v26);
  if ((_DWORD)result)
  {
    if (*(_QWORD *)(a1 + 5008))
      objc_msgSend((id)a1, "_boneDataWithMotionRangeDq:curlAmts:", a3, v26);
    else
      objc_msgSend((id)a1, "_boneDataWithMotionRange:curlAmts:", a3, v26);
    result = memcpy(a4, __src, 0x3E0uLL);
  }
  if (!a2)
  {
    objc_msgSend((id)a1, "_convertToModelSpaceUsingDQs:", v20);
    return memcpy(a4, __src, 0x3E0uLL);
  }
  return result;
}

- (BOOL)fingerPositionsChangedForCurlAmts:(id *)a3
{
  if (a3->var0 == self->_lastFingerPositions[0]
    && a3->var1 == self->_lastFingerPositions[1]
    && a3->var2 == self->_lastFingerPositions[2]
    && a3->var3 == self->_lastFingerPositions[3]
    && a3->var4 == self->_lastFingerPositions[4])
  {
    return 0;
  }
  *($599F175E452E455E49EC8439362DB023 *)self->_lastFingerPositions = *a3;
  return 1;
}

- (float)getFingerCurlAmt:(id *)a3 boneType:(int64_t)a4
{
  float result;

  switch(a4)
  {
    case 1:
      goto LABEL_7;
    case 2:
      a3 = (const $599F175E452E455E49EC8439362DB023 *)((char *)a3 + 4);
      goto LABEL_7;
    case 3:
      a3 = (const $599F175E452E455E49EC8439362DB023 *)((char *)a3 + 8);
      goto LABEL_7;
    case 4:
      a3 = (const $599F175E452E455E49EC8439362DB023 *)((char *)a3 + 12);
      goto LABEL_7;
    case 5:
      a3 = (const $599F175E452E455E49EC8439362DB023 *)((char *)a3 + 16);
LABEL_7:
      result = a3->var0;
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

- (void)_boneDataWithMotionRange:(void *)a3@<X8> curlAmts:
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  _QWORD *v8;
  float32x4_t *v9;
  float32x4_t *v10;
  uint64_t v11;
  float v12;
  float v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float v18;
  float32x4_t v19;
  int8x16_t v20;
  float32x4_t v21;
  int8x16_t v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float32x2_t v33;
  float32x2_t v34;
  float v35;
  float32x4_t v36;
  int8x16_t v37;
  float32x2_t v38;
  float32x4_t v39;
  unsigned __int32 v40;
  float32x2_t v41;
  float32x2_t v42;
  float32x4_t *v43;
  __int128 v44;
  float v45;
  float v46;
  float32x4_t v47;
  float32x4_t v48;
  float v49;

  memcpy(a3, a1 + 4, 0x3E0uLL);
  v5 = 0x1FFFFFFFFFFFFF84;
  v6 = &kBoneTypes;
  v44 = xmmword_21526F060;
  do
  {
    v7 = *v6++;
    v8 = (_QWORD *)a1[128];
    v9 = (float32x4_t *)(*v8 + v5 * 8);
    v10 = v9 + 63;
    v11 = v8[2];
    objc_msgSend(a1, "getFingerCurlAmt:boneType:", a2, v7, v44);
    if (v12 <= 0.0)
    {
      v43 = (float32x4_t *)&a1[v5];
      v43[64] = v9[62];
      v43[65] = *v10;
    }
    else
    {
      v13 = v12;
      *(float32x4_t *)&a1[v5 + 128] = vmlaq_n_f32(v9[62], vsubq_f32(*(float32x4_t *)(v11 + v5 * 8 + 992), v9[62]), v12);
      v14 = *(float32x4_t *)(v11 + v5 * 8 + 1008);
      v15 = vmulq_f32(*v10, v14);
      v16 = (float32x4_t)vextq_s8((int8x16_t)v15, (int8x16_t)v15, 8uLL);
      *(float32x2_t *)v15.f32 = vadd_f32(*(float32x2_t *)v15.f32, *(float32x2_t *)v16.f32);
      v15.f32[0] = vaddv_f32(*(float32x2_t *)v15.f32);
      v16.i32[0] = 0;
      v17 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v15, v16)), 0), (int8x16_t)vnegq_f32(v14), (int8x16_t)v14);
      v18 = 1.0;
      v19 = vsubq_f32(*v10, v17);
      v20 = (int8x16_t)vmulq_f32(v19, v19);
      v47 = v17;
      v48 = *v10;
      v21 = vaddq_f32(*v10, v17);
      v22 = (int8x16_t)vmulq_f32(v21, v21);
      v49 = v13;
      v23 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v20.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v20, v20, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v22.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v22, v22, 8uLL)))));
      v24 = v23 + v23;
      v25 = 1.0;
      if ((float)(v23 + v23) != 0.0)
        v25 = sinf(v23 + v23) / v24;
      v26 = (float)(1.0 - v49) * v24;
      v27 = v49;
      if (v26 != 0.0)
      {
        v45 = v25;
        v28 = sinf((float)(1.0 - v49) * v24);
        v25 = v45;
        v27 = v49;
        v18 = v28 / v26;
      }
      v29 = v27 * v24;
      v30 = 1.0;
      if (v29 != 0.0)
      {
        v46 = v25;
        v31 = sinf(v29);
        v25 = v46;
        v27 = v49;
        v30 = v31 / v29;
      }
      v32 = v25;
      v33 = vrecpe_f32((float32x2_t)LODWORD(v25));
      v34 = vmul_f32(v33, vrecps_f32((float32x2_t)LODWORD(v32), v33));
      v35 = vmul_f32(v34, vrecps_f32((float32x2_t)LODWORD(v32), v34)).f32[0];
      v34.f32[0] = (float)(1.0 - v49) * (float)(v35 * v18);
      v36 = vmlaq_f32(vmulq_n_f32(v47, v27 * (float)(v35 * v30)), v48, (float32x4_t)vdupq_lane_s32((int32x2_t)v34, 0));
      v37 = (int8x16_t)vmulq_f32(v36, v36);
      v38 = vadd_f32(*(float32x2_t *)v37.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v37, v37, 8uLL));
      v39 = (float32x4_t)v44;
      if (vaddv_f32(v38) != 0.0)
      {
        v40 = vadd_f32(v38, (float32x2_t)vdup_lane_s32((int32x2_t)v38, 1)).u32[0];
        v41 = vrsqrte_f32((float32x2_t)v40);
        v42 = vmul_f32(v41, vrsqrts_f32((float32x2_t)v40, vmul_f32(v41, v41)));
        v39 = vmulq_n_f32(v36, vmul_f32(v42, vrsqrts_f32((float32x2_t)v40, vmul_f32(v42, v42))).f32[0]);
      }
      *(float32x4_t *)&a1[v5 + 130] = v39;
    }
    v5 += 4;
  }
  while (v5 * 8);
}

- (void)_boneDataWithMotionRangeDq:(void *)a3@<X8> curlAmts:
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  float v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __n128 v22;
  __n128 v23;

  memcpy(a3, (const void *)(a1 + 32), 0x3E0uLL);
  v5 = 0;
  v6 = &kBoneTypes;
  do
  {
    v7 = *v6++;
    objc_msgSend((id)a1, "getFingerCurlAmt:boneType:", a2, v7, *(_OWORD *)&v22, *(_OWORD *)&v23);
    if (v8 <= 0.0)
    {
      v19 = a1 + v5;
      *(_OWORD *)(v19 + 32) = *(_OWORD *)(**(_QWORD **)(a1 + 1024) + v5);
      *(_OWORD *)(v19 + 48) = *(_OWORD *)(**(_QWORD **)(a1 + 1024) + v5 + 16);
    }
    else
    {
      v9 = v8;
      dqIdentity();
      v13 = *(float32x4_t *)(a1 + v5 + 1040);
      v14 = *(float32x4_t *)(a1 + v5 + 1056);
      v15 = *(float32x4_t *)(a1 + v5 + 3024);
      v16 = *(float32x4_t *)(a1 + v5 + 3040);
      if (*(_QWORD *)(a1 + 5008) == 1)
        *(double *)v17.i64 = dqDLB(v10, v11, v12, v13, *(double *)v14.i64, v15, *(double *)v16.i64, v9);
      else
        dqScLERP(v13, v14, v15, v16, v9);
      v22 = (__n128)v18;
      v23 = (__n128)v17;
      *(double *)&v20 = dqGetTranslation(v17, v18);
      *(_OWORD *)(a1 + v5 + 32) = v20;
      *(double *)&v21 = dqGetRotation(v23, v22);
      *(_OWORD *)(a1 + v5 + 48) = v21;
    }
    v5 += 32;
  }
  while (v5 != 992);
}

- (void)boneDataWithTransformSpace:(uint64_t)a3@<X3> referencePose:(void *)a4@<X8>
{
  const void **v8;
  uint64_t v9;
  const void **v10;

  bzero(a4, 0x3E0uLL);
  switch(a3)
  {
    case 0:
    case 1:
      v8 = (const void **)(*(_QWORD *)(a1 + 1024) + 8 * (a2 == 0));
      break;
    case 2:
    case 3:
      v9 = *(_QWORD *)(a1 + 1024);
      v10 = (const void **)(v9 + 16);
      v8 = (const void **)(v9 + 24);
      if (a2)
        v8 = v10;
      break;
    default:
      -[_GCHandSkeleton boneDataWithTransformSpace:referencePose:].cold.1();
  }
  return memcpy(a4, *v8, 0x3E0uLL);
}

- (void)_convertToModelSpaceUsingMatrices:(uint64_t)a1@<X2>
{
  uint64_t v2;
  int32x4_t *v7;
  uint64_t v8;
  float *v9;
  float v10;
  float v11;
  float v12;
  float v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  float v17;
  float v18;
  float v19;
  float32x4_t *v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  unsigned int v25;
  __int128 v26;
  int32x4_t *v27;
  int32x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int32x4_t *v33;
  int32x4_t *v34;
  float v35;
  float v37;
  float32x2_t v38;
  float32x2_t v39;
  float32x2_t v40;
  float32x2_t v41;
  float32x2_t v42;
  float v43;
  float32_t v44;
  float32x2_t v45;
  float32x2_t v46;
  float32x2_t v47;
  float32x2_t v48;
  float32x2_t v49;
  float32x2_t v50;
  float32x2_t v51;
  float v52;
  int32x4_t v54;
  float32x2_t v55;
  float32x2_t v56;
  float v57;
  unsigned int v58;
  float32x2_t v59;
  float32x2_t v60;
  float32x2_t v61;
  float32x2_t v62;
  float32x2_t v63;
  _OWORD v64[4];
  int32x4_t v65;
  int32x4_t v66;
  int32x4_t v67;
  int32x4_t v68;
  _OWORD v69[2];
  int32x4_t v70;
  int32x4_t v71;
  uint64_t v72;

  v2 = 0;
  v72 = *MEMORY[0x24BDAC8D0];
  a2[30] = 0u;
  a2[31] = 0u;
  a2[28] = 0u;
  a2[29] = 0u;
  a2[26] = 0u;
  a2[27] = 0u;
  a2[24] = 0u;
  a2[25] = 0u;
  a2[22] = 0u;
  a2[23] = 0u;
  a2[20] = 0u;
  a2[21] = 0u;
  a2[18] = 0u;
  a2[19] = 0u;
  a2[16] = 0u;
  a2[17] = 0u;
  a2[14] = 0u;
  a2[15] = 0u;
  a2[12] = 0u;
  a2[13] = 0u;
  a2[10] = 0u;
  a2[11] = 0u;
  a2[8] = 0u;
  a2[9] = 0u;
  a2[6] = 0u;
  a2[7] = 0u;
  a2[4] = 0u;
  a2[5] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  __asm { FMOV            V3.2S, #0.25 }
  *a2 = 0u;
  a2[1] = 0u;
  v7 = (int32x4_t *)MEMORY[0x24BDAEE00];
  do
  {
    if (v2)
    {
      v8 = 0;
      v9 = (float *)(a1 + 32 * v2);
      v11 = v9[6];
      v10 = v9[7];
      v13 = v9[4];
      v12 = v9[5];
      v14 = *(_OWORD *)v9;
      HIDWORD(v15) = 0;
      *(float *)&v15 = (float)((float)((float)(v13 * v13) - (float)(v12 * v12)) - (float)(v11 * v11))
                     + (float)(v10 * v10);
      *((float *)&v15 + 1) = (float)((float)(v10 * v11) + (float)(v13 * v12))
                           + (float)((float)(v10 * v11) + (float)(v13 * v12));
      *((float *)&v15 + 2) = (float)-(float)((float)(v10 * v12) - (float)(v13 * v11))
                           - (float)((float)(v10 * v12) - (float)(v13 * v11));
      HIDWORD(v16) = 0;
      *(float *)&v16 = (float)-(float)((float)(v10 * v11) - (float)(v13 * v12))
                     - (float)((float)(v10 * v11) - (float)(v13 * v12));
      *((float *)&v16 + 1) = (float)((float)((float)(v12 * v12) - (float)(v11 * v11)) + (float)(v10 * v10))
                           - (float)(v13 * v13);
      *((float *)&v16 + 2) = (float)((float)(v10 * v13) + (float)(v12 * v11))
                           + (float)((float)(v10 * v13) + (float)(v12 * v11));
      v17 = (float)(v10 * v12) + (float)(v11 * v13);
      v18 = -(float)((float)(v10 * v13) - (float)(v12 * v11));
      v19 = (float)(v10 * v10) + (float)(v11 * v11);
      v20 = (float32x4_t *)&v69[4 * (uint64_t)parentIndices[v2]];
      v21 = *v20;
      v22 = v20[1];
      v23 = v20[2];
      v24 = v20[3];
      *(float *)&v25 = (float)(v19 - (float)(v13 * v13)) - (float)(v12 * v12);
      *(float *)&v26 = v17 + v17;
      *((float *)&v26 + 1) = v18 + v18;
      *((_QWORD *)&v26 + 1) = v25;
      HIDWORD(v14) = 1.0;
      v64[0] = v15;
      v64[1] = v16;
      v64[2] = v26;
      v64[3] = v14;
      v65 = 0uLL;
      v66 = 0uLL;
      v67 = 0uLL;
      v68 = 0uLL;
      do
      {
        *(float32x4_t *)((char *)&v65 + v8 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(v64[v8])), v22, *(float32x2_t *)&v64[v8], 1), v23, (float32x4_t)v64[v8], 2), v24, (float32x4_t)v64[v8], 3);
        ++v8;
      }
      while (v8 != 4);
      v27 = (int32x4_t *)&v69[4 * v2];
      v28 = v65;
      v29 = v66;
      v30 = v67;
      v31 = v68;
      *v27 = v65;
      v27[1] = v29;
      v27[2] = v30;
      v27[3] = v31;
    }
    else
    {
      v29 = v7[1];
      v69[0] = *v7;
      v69[1] = v29;
      v32 = v7[3];
      v70 = v7[2];
      v71 = v32;
      v28 = (int32x4_t)v69[0];
      v30 = v70;
      v31 = v71;
    }
    v33 = (int32x4_t *)&a2[2 * v2];
    *v33 = v31;
    v34 = v33 + 1;
    v35 = *(float *)&v30.i32[2] + (float)(*(float *)v28.i32 + *(float *)&v29.i32[1]);
    if (v35 >= 0.0)
    {
      v43 = sqrtf(v35 + 1.0);
      v44 = v43 + v43;
      v45 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v43 + v43));
      v46 = vmul_f32(v45, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v43 + v43), v45));
      v46.i32[0] = vmul_f32(v46, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v43 + v43), v46)).u32[0];
      *(float32x2_t *)v54.i8 = vmul_n_f32(vsub_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v29, (int8x16_t)v29, 8uLL), *(int32x2_t *)v30.i8), (float32x2_t)vext_s8(*(int8x8_t *)v30.i8, (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)v28, (int8x16_t)v28, 8uLL), 4uLL)), v46.f32[0]);
      v47.i32[0] = vsub_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)v28.i8, 1), *(float32x2_t *)v29.i8).u32[0];
      v47.f32[1] = v44;
      v46.i32[1] = 0.25;
      v56 = vmul_f32(v47, v46);
    }
    else if (*(float *)v28.i32 < *(float *)&v29.i32[1] || *(float *)v28.i32 < *(float *)&v30.i32[2])
    {
      v37 = 1.0 - *(float *)v28.i32;
      if (*(float *)&v29.i32[1] >= *(float *)&v30.i32[2])
      {
        v57 = sqrtf(*(float *)&v29.i32[1] + (float)(v37 - *(float *)&v30.i32[2]));
        *(float *)&v58 = v57 + v57;
        v59 = vrecpe_f32((float32x2_t)v58);
        v60 = vmul_f32(v59, vrecps_f32((float32x2_t)v58, v59));
        v61.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)v28.i8, 1), *(float32x2_t *)v29.i8).u32[0];
        v61.i32[1] = v58;
        v62 = (float32x2_t)vrev64_s32(*(int32x2_t *)v30.i8);
        v63.i32[0] = vadd_f32(v62, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v29, (int8x16_t)v29, 8uLL)).u32[0];
        v63.i32[1] = vsub_f32(v62, (float32x2_t)vdup_laneq_s32(v28, 2)).i32[1];
        v62.i32[0] = vmul_f32(v60, vrecps_f32((float32x2_t)v58, v60)).u32[0];
        v56 = vmul_n_f32(v63, v62.f32[0]);
        v62.i32[1] = 0.25;
        *(float32x2_t *)v54.i8 = vmul_f32(v61, v62);
      }
      else
      {
        *(float32x2_t *)v30.i8 = vadd_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v28, (int8x16_t)v28, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v29, (int8x16_t)v29, 8uLL)), *(float32x2_t *)v30.i8);
        v38 = (float32x2_t)__PAIR64__(v28.u32[1], COERCE_UNSIGNED_INT(sqrtf(*(float *)&v30.i32[2] + (float)(v37 - *(float *)&v29.i32[1]))));
        v39 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v29.i8, 0);
        v40 = vsub_f32(*(float32x2_t *)v28.i8, v39);
        v39.i32[0] = 2.0;
        v39.i32[0] = vmul_f32(v38, v39).u32[0];
        v39.i32[1] = v40.i32[1];
        v41 = vrecpe_f32((float32x2_t)v39.u32[0]);
        v42 = vmul_f32(v41, vrecps_f32((float32x2_t)v39.u32[0], v41));
        v40.i32[0] = vmul_f32(v42, vrecps_f32((float32x2_t)v39.u32[0], v42)).u32[0];
        *(float32x2_t *)v54.i8 = vmul_n_f32(*(float32x2_t *)v30.i8, v40.f32[0]);
        v56 = vmul_f32(v39, (float32x2_t)__PAIR64__(v40.u32[0], _D3));
      }
    }
    else
    {
      v48 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v29.i8, 0);
      v49 = vadd_f32(*(float32x2_t *)v28.i8, v48);
      v48.i32[0] = 2.0;
      v48.i32[0] = vmul_f32((float32x2_t)__PAIR64__(v28.u32[1], COERCE_UNSIGNED_INT(sqrtf(*(float *)v28.i32+ (float)((float)(1.0 - *(float *)&v29.i32[1]) - *(float *)&v30.i32[2])))), v48).u32[0];
      v48.i32[1] = v49.i32[1];
      v50 = vrecpe_f32((float32x2_t)v48.u32[0]);
      v51 = vmul_f32(v50, vrecps_f32((float32x2_t)v48.u32[0], v50));
      LODWORD(v52) = vmul_f32(v51, vrecps_f32((float32x2_t)v48.u32[0], v51)).u32[0];
      __asm { FMOV            V18.2S, #0.25 }
      _D18.f32[1] = v52;
      *(float32x2_t *)v54.i8 = vmul_f32(v48, _D18);
      v55.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v28, (int8x16_t)v28, 8uLL), *(float32x2_t *)v30.i8).u32[0];
      v55.i32[1] = vsub_f32((float32x2_t)vdup_laneq_s32(v29, 2), *(float32x2_t *)&v30).i32[1];
      v56 = vmul_n_f32(v55, v52);
    }
    v54.u64[1] = (unint64_t)v56;
    *v34 = v54;
    ++v2;
  }
  while (v2 != 31);
}

- (void)_convertToModelSpaceUsingDQs:(uint64_t)a1@<X2>
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  float32x4_t DualQuaternion;
  double v9;
  float32x4_t *v10;
  float32x4_t v11;
  float32x4_t v12;
  __int128 v13;
  __int128 v14;
  __n128 v15;
  __n128 v16;
  _OWORD v17[62];
  uint64_t v18;

  v4 = 0;
  v18 = *MEMORY[0x24BDAC8D0];
  a2[30] = 0u;
  a2[31] = 0u;
  a2[28] = 0u;
  a2[29] = 0u;
  a2[26] = 0u;
  a2[27] = 0u;
  a2[24] = 0u;
  a2[25] = 0u;
  a2[22] = 0u;
  a2[23] = 0u;
  a2[20] = 0u;
  a2[21] = 0u;
  a2[18] = 0u;
  a2[19] = 0u;
  a2[16] = 0u;
  a2[17] = 0u;
  a2[14] = 0u;
  a2[15] = 0u;
  a2[12] = 0u;
  a2[13] = 0u;
  a2[10] = 0u;
  a2[11] = 0u;
  a2[8] = 0u;
  a2[9] = 0u;
  a2[6] = 0u;
  a2[7] = 0u;
  a2[4] = 0u;
  a2[5] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  v5 = parentIndices;
  *a2 = 0u;
  a2[1] = 0u;
  do
  {
    v7 = *v5++;
    v6 = v7;
    DualQuaternion = dqMakeDualQuaternion(*(float32x4_t *)(a1 + v4 * 16 + 16));
    if (v4 * 16)
    {
      v10 = (float32x4_t *)&v17[v4];
      *(double *)v11.i64 = dqMul(DualQuaternion, v9, (float32x4_t)v17[2 * v6]);
      *v10 = v11;
      v10[1] = v12;
    }
    else
    {
      *(double *)v11.i64 = dqIdentity();
      v17[0] = v11;
      v17[1] = v12;
    }
    v15 = (__n128)v12;
    v16 = (__n128)v11;
    *(double *)&v13 = dqGetTranslation(v11, v12);
    a2[v4] = v13;
    *(double *)&v14 = dqGetRotation(v16, v15);
    a2[v4 + 1] = v14;
    v4 += 2;
  }
  while (v4 != 62);
}

- (void)_setInterpolationMethod:(int64_t)a3
{
  self->_interpolationMethod = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_physicalInput);
}

- (void)boneDataWithTransformSpace:referencePose:.cold.1()
{
  __assert_rtn("-[_GCHandSkeleton boneDataWithTransformSpace:referencePose:]", "_GCXRComponent.m", 735, "0");
}

@end
