@implementation C3DParticleSystemInstanceStep

float32x4_t ____C3DParticleSystemInstanceStep_block_invoke(uint64_t a1, int a2)
{
  int v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  float32x4_t *v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t result;
  float32x4_t v21[76];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  memcpy(v21, (const void *)(a1 + 32), sizeof(v21));
  v4 = *(_DWORD *)(a1 + 1264);
  v5 = (v4 * a2);
  v6 = v5 + v4;
  v7 = *(_DWORD *)(a1 + 1056);
  if (v6 >= v7)
    v8 = v7;
  else
    v8 = v6;
  C3DParticleSystemProcessAffectors(*(_QWORD *)(*(_QWORD *)(a1 + 1256) + 48), (uint64_t)v21, v5, v8);
  v9 = *(float32x4_t **)(*(_QWORD *)(a1 + 1248) + 8);
  v10 = v9[2];
  v11 = v9[3];
  v12 = vsubq_f32(v10, v11);
  v13 = vsubq_f32(v21[68], v21[69]);
  v12.i32[3] = 0;
  v13.i32[3] = 0;
  v14 = vaddq_f32(v10, v11);
  v15 = vaddq_f32(v21[68], v21[69]);
  v14.i32[3] = 0;
  v15.i32[3] = 0;
  v16 = vminnmq_f32(v12, v13);
  v17 = vmaxnmq_f32(v14, v15);
  v18.i64[0] = 0x3F0000003F000000;
  v18.i64[1] = 0x3F0000003F000000;
  v19 = vmulq_f32(vaddq_f32(v16, v17), v18);
  result = vmulq_f32(vsubq_f32(v17, v16), v18);
  v19.i32[3] = 1.0;
  result.i32[3] = 0;
  v9[2] = v19;
  v9[3] = result;
  return result;
}

@end
