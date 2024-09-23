@implementation C3DCullingSystemComputeHierarchicalAABB

uint64_t __C3DCullingSystemComputeHierarchicalAABB_block_invoke(float32x4_t *a1, uint64_t a2)
{
  uint64_t v2;
  __n128 WorldAABBAtIndex;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
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

  if (a1[6].i64[1] != a2)
  {
    v2 = *(int *)(a2 + 216);
    if ((_DWORD)v2 != -1)
    {
      WorldAABBAtIndex = __C3DCullingSystem::_getWorldAABBAtIndex((__C3DCullingSystem *)a1[7].i64[0], *(_DWORD *)(*(_QWORD *)(a1[7].i64[0] + 32) + 4 * v2));
      v5 = a1[2];
      v6 = a1[3];
      v7 = a1[4];
      v8 = vaddq_f32(a1[5], vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32(v6, (float32x2_t)WorldAABBAtIndex.n128_u64[0], 1), v5, WorldAABBAtIndex.n128_f32[0]), v7, (float32x4_t)WorldAABBAtIndex, 2));
      v10 = vaddq_f32(vaddq_f32(vabsq_f32(vmulq_n_f32(v5, v9.f32[0])), vabsq_f32(vmulq_lane_f32(v6, *(float32x2_t *)v9.f32, 1))), vabsq_f32(vmulq_laneq_f32(v7, v9, 2)));
      v11 = *(float32x4_t **)(a1[6].i64[0] + 8);
      v12 = v11[3];
      v13 = v11[4];
      v14 = vsubq_f32(v8, v10);
      v15 = vsubq_f32(v12, v13);
      v14.i32[3] = 0;
      v15.i32[3] = 0;
      v16 = vminnmq_f32(v14, v15);
      v17 = vaddq_f32(v8, v10);
      v18 = vaddq_f32(v12, v13);
      v17.i32[3] = 0;
      v18.i32[3] = 0;
      v19 = vmaxnmq_f32(v17, v18);
      v12.i64[0] = 0x3F0000003F000000;
      v12.i64[1] = 0x3F0000003F000000;
      v20 = vmulq_f32(vaddq_f32(v16, v19), v12);
      v21 = vmulq_f32(vsubq_f32(v19, v16), v12);
      v20.i32[3] = 1.0;
      v21.i32[3] = 0;
      v11[3] = v20;
      v11[4] = v21;
    }
  }
  return 0;
}

uint64_t __C3DCullingSystemComputeHierarchicalAABB_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __n128 WorldAABBAtIndex;
  float32x4_t *v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;

  v2 = *(int *)(a2 + 216);
  if ((_DWORD)v2 != -1)
  {
    WorldAABBAtIndex = __C3DCullingSystem::_getWorldAABBAtIndex((__C3DCullingSystem *)*(_QWORD *)(a1 + 40), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) + 4 * v2));
    v5 = *(float32x4_t **)(*(_QWORD *)(a1 + 32) + 8);
    v6 = v5[3];
    v7 = v5[4];
    v9 = vsubq_f32((float32x4_t)WorldAABBAtIndex, v8);
    v10 = vsubq_f32(v6, v7);
    v9.i32[3] = 0;
    v10.i32[3] = 0;
    v11 = vminnmq_f32(v9, v10);
    v12 = vaddq_f32((float32x4_t)WorldAABBAtIndex, v8);
    v13 = vaddq_f32(v6, v7);
    v12.i32[3] = 0;
    v13.i32[3] = 0;
    v14 = vmaxnmq_f32(v12, v13);
    v6.i64[0] = 0x3F0000003F000000;
    v6.i64[1] = 0x3F0000003F000000;
    v15 = vmulq_f32(vaddq_f32(v11, v14), v6);
    v16 = vmulq_f32(vsubq_f32(v14, v11), v6);
    v15.i32[3] = 1.0;
    v16.i32[3] = 0;
    v5[3] = v15;
    v5[4] = v16;
  }
  return 0;
}

@end
