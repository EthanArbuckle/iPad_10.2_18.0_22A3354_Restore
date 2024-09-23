@implementation C3DNodeGetBoundingBoxOmittingFloor

void __C3DNodeGetBoundingBoxOmittingFloor_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t Floor;
  _BYTE *v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  uint64_t v10;
  float32x4_t *v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  int32x4_t v26;

  v25 = 0u;
  v26 = 0u;
  Floor = C3DNodeGetFloor(a2);
  v5 = (_BYTE *)a1[5];
  if (Floor)
  {
    if (v5)
      *v5 = 1;
  }
  else if (C3DNodeGetBoundingBoxOmittingFloor(a2, &v25, v5))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    C3DNodeGetMatrix(a2, (uint64_t)&v21);
    v6 = vaddq_f32(v24, vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32(v22, *(float32x2_t *)v25.f32, 1), v21, v25.f32[0]), v23, v25, 2));
    v7 = v6;
    v7.i32[3] = 1.0;
    v8 = (float32x4_t)v26;
    v8.i32[1] = v26.i32[0];
    v8.i32[2] = v26.i32[0];
    v9 = vaddq_f32(vaddq_f32(vabsq_f32(vmulq_f32(v21, v8)), vabsq_f32(vmulq_f32((float32x4_t)vuzp2q_s32(vdupq_lane_s32(*(int32x2_t *)v26.i8, 1), v26), v22))), vabsq_f32(vmulq_f32((float32x4_t)vzip2q_s32(vtrn1q_s32(v26, v26), v26), v23)));
    v25 = v7;
    v26 = (int32x4_t)v9;
    v10 = *(_QWORD *)(a1[4] + 8);
    if (*(_BYTE *)(v10 + 24))
    {
      v11 = (float32x4_t *)a1[6];
      v12 = v11[1];
      v13 = vsubq_f32(*v11, v12);
      v14 = vsubq_f32(v6, v9);
      v13.i32[3] = 0;
      v14.i32[3] = 0;
      v15 = vminnmq_f32(v13, v14);
      v16 = vaddq_f32(*v11, v12);
      v17 = vaddq_f32(v6, v9);
      v16.i32[3] = 0;
      v17.i32[3] = 0;
      v18 = vmaxnmq_f32(v16, v17);
      v16.i64[0] = 0x3F0000003F000000;
      v16.i64[1] = 0x3F0000003F000000;
      v19 = vmulq_f32(vaddq_f32(v15, v18), v16);
      v20 = vmulq_f32(vsubq_f32(v18, v15), v16);
      v19.i32[3] = 1.0;
      v20.i32[3] = 0;
      *v11 = v19;
    }
    else
    {
      *(_BYTE *)(v10 + 24) = 1;
      v11 = (float32x4_t *)a1[6];
      v20 = (float32x4_t)v26;
      *v11 = v25;
    }
    v11[1] = v20;
  }
}

@end
