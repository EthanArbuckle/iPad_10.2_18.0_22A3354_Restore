@implementation C3DSkinnerAppendDebugBones

uint64_t __C3DSkinnerAppendDebugBones_block_invoke(uint64_t a1, float32x4_t *a2)
{
  const __CFString *Name;
  const __CFString *v5;
  float32x4_t *v6;
  simd_float4x4 v7;
  float32x4_t *v8;
  uint64_t *v9;
  float *v10;
  int v11;
  float32x4_t *WorldMatrix;
  float v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  simd_float4x4 v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  simd_float4x4 v26;

  if ((C3DAuthoringEnvironmentHasAlreadyProcessedJoint(*(_QWORD *)(a1 + 32), (uint64_t)a2) & 1) == 0)
  {
    Name = (const __CFString *)C3DNodeGetName((uint64_t)a2);
    if (!Name
      || (v5 = Name, CFStringFind(Name, CFSTR("Loose"), 0).location == -1)
      && CFStringFind(v5, CFSTR("_DYN"), 0).location == -1)
    {
      if (*(float32x4_t **)(a1 + 40) == a2)
      {
        if (!*(_BYTE *)(a1 + 61))
        {
LABEL_13:
          C3DAuthoringEnvironmentRegisterProcessedJoint(*(_QWORD *)(a1 + 32), (uint64_t)a2);
          WorldMatrix = C3DNodeGetWorldMatrix(a2);
          v13 = *(float *)(a1 + 56);
          v14 = WorldMatrix[1];
          v15 = WorldMatrix[2];
          v16 = WorldMatrix[3];
          v17 = vmulq_f32(*WorldMatrix, (float32x4_t)0);
          v18 = vmlaq_f32(v17, (float32x4_t)0, v14);
          v21 = vaddq_f32(v16, vmlaq_f32(vmlaq_n_f32(v17, v14, v13), (float32x4_t)0, v15));
          v22 = vaddq_f32(v16, vmlaq_n_f32(v18, v15, v13));
          v23 = vaddq_f32(v16, vmlaq_f32(v18, (float32x4_t)0, v15));
          C3DAuthoringEnvironmentAppendDebugSegment(*(_QWORD *)(a1 + 32), 0, C3DAuthoringEnvironmentColorRed, *(unsigned __int8 *)(a1 + 60), v23, vaddq_f32(v16, vmlaq_f32(vmlaq_f32(vmulq_n_f32(*WorldMatrix, v13), (float32x4_t)0, v14), (float32x4_t)0, v15)));
          C3DAuthoringEnvironmentAppendDebugSegment(*(_QWORD *)(a1 + 32), 0, C3DAuthoringEnvironmentColorGreen, *(unsigned __int8 *)(a1 + 60), v23, v21);
          C3DAuthoringEnvironmentAppendDebugSegment(*(_QWORD *)(a1 + 32), 0, C3DAuthoringEnvironmentColorBlue, *(unsigned __int8 *)(a1 + 60), v23, v22);
          return 0;
        }
        v8 = C3DNodeGetWorldMatrix(a2);
        v25 = 0uLL;
        v24 = (float32x4_t)xmmword_1DD007920;
        v7.columns[0].i32[0] = *(_DWORD *)(a1 + 56);
        v9 = *(uint64_t **)(a1 + 32);
        v10 = *(float **)(a1 + 48);
        v11 = *(unsigned __int8 *)(a1 + 60);
        v7.columns[1].i32[0] = v7.columns[0].i32[0];
      }
      else
      {
        C3DNodeGetMatrix((uint64_t)a2, (uint64_t)&v26);
        v20 = v26;
        v6 = C3DNodeGetWorldMatrix(a2);
        v7 = __invert_f4(v20);
        v25 = 0uLL;
        v7.columns[0] = (simd_float4)vmulq_f32((float32x4_t)v7.columns[3], (float32x4_t)v7.columns[3]);
        v7.columns[1].i32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7.columns[0], 2), vaddq_f32((float32x4_t)v7.columns[0], (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.columns[0].f32, 1))).u32[0];
        v7.columns[0].f32[0] = sqrtf(v7.columns[1].f32[0]);
        if (v7.columns[0].f32[0] <= 0.0)
        {
          v7.columns[2] = (simd_float4)xmmword_1DD007920;
          v7.columns[1].i32[0] = *(_DWORD *)(a1 + 56);
          v7.columns[0].i32[0] = v7.columns[1].i32[0];
        }
        else
        {
          v7.columns[2].i32[0] = v7.columns[1].i32[0];
          *(float32x2_t *)v7.columns[1].f32 = vrsqrte_f32((float32x2_t)v7.columns[1].u32[0]);
          *(float32x2_t *)v7.columns[1].f32 = vmul_f32(*(float32x2_t *)v7.columns[1].f32, vrsqrts_f32((float32x2_t)v7.columns[2].u32[0], vmul_f32(*(float32x2_t *)v7.columns[1].f32, *(float32x2_t *)v7.columns[1].f32)));
          v7.columns[2] = (simd_float4)vmulq_n_f32((float32x4_t)v7.columns[3], vmul_f32(*(float32x2_t *)v7.columns[1].f32, vrsqrts_f32((float32x2_t)v7.columns[2].u32[0], vmul_f32(*(float32x2_t *)v7.columns[1].f32, *(float32x2_t *)v7.columns[1].f32))).f32[0]);
          v7.columns[1].i32[0] = *(_DWORD *)(a1 + 56);
        }
        v24 = (float32x4_t)v7.columns[2];
        v9 = *(uint64_t **)(a1 + 32);
        v10 = *(float **)(a1 + 48);
        v11 = *(unsigned __int8 *)(a1 + 60);
        v8 = v6;
      }
      C3DAuthoringEnvironmentAppendDebugPyramid(v9, &v25, &v24, (uint64_t)v8, v10, v11, v7.columns[0].f32[0], v7.columns[1].f32[0]);
      goto LABEL_13;
    }
  }
  return 0;
}

@end
