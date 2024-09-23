@implementation C3DSceneCreateHitTestResultsWithSegment

uint64_t __C3DSceneCreateHitTestResultsWithSegment_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t i;

  if (a3 >= 1)
  {
    v5 = result;
    for (i = 0; i < a3; ++i)
    {
      result = __ProcessNode(*(_QWORD *)(a2 + 8 * i));
      if ((_DWORD)result && (*(_WORD *)(*(_QWORD *)(v5 + 32) + 8) & 0x80) != 0)
        break;
    }
  }
  return result;
}

void __C3DSceneCreateHitTestResultsWithSegment_block_invoke_2(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  uint64_t v7;
  _OWORD *v8;
  int v9;
  float32x4_t v10;
  uint64_t v11;
  float32x4_t *v12;
  unsigned int v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float v17;
  uint64_t v18;
  float32x4_t *v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  uint64_t v24;
  uint64_t v25;
  float32x4_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  MEMORY[0x1E0C80A78](a1);
  v8 = (_OWORD *)&v26.f32[-4 * v7];
  if (v9)
  {
    v10 = 0uLL;
    v11 = v7;
    v12 = &v26 - v7;
    do
    {
      v26 = v10;
      v13 = *a3++;
      *(double *)v14.i64 = C3DMeshSourceGetValueAtIndexAsVector3(*(_QWORD *)(a1 + 488), v13);
      v15 = v26;
      *v12++ = v14;
      v10 = vaddq_f32(v15, v14);
      --v11;
    }
    while (v11);
    v14.f32[0] = (float)a4;
    v16 = vdivq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 0));
    v17 = 3.4028e38;
    v18 = v7;
    v19 = &v26 - v7;
    do
    {
      v20 = *v19++;
      v21 = vsubq_f32(v20, v16);
      v22 = vmulq_f32(v21, v21);
      v17 = fminf(v17, sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).f32[0]));
      --v18;
    }
    while (v18);
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 480) + 8) + 24) = v17 * 0.5;
    do
    {
      v23 = (float32x4_t)v8[v18];
      v24 = v18 + 1;
      if (v7 - 1 == v18)
        v25 = 0;
      else
        v25 = v18 + 1;
      C3DAuthoringEnvironmentAppendDebugSegment(*(_QWORD *)(a1 + 448), *(_QWORD *)(a1 + 496) + 112, (float *)(a1 + 464), 0, v23, (float32x4_t)v8[v25]);
      v18 = v24;
    }
    while (v7 != v24);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 480) + 8) + 24) = 2130706431;
  }
}

@end
