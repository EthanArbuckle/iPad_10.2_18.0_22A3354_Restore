@implementation C3DShapeMeshCreationAppendShape

void __C3DShapeMeshCreationAppendShape_block_invoke(uint64_t a1, char a2, int a3, UInt8 *bytes, unsigned int a5)
{
  CFDataRef v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) || *(_BYTE *)(a1 + 40))
  {
    v9 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes, 2 * a5);
    v10 = C3DMeshElementCreate();
    C3DMeshElementInit(v10, a2, a3, v9, 2);
    if (v9)
      CFRelease(v9);
    free(bytes);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(v11 + 128);
    v13 = *(unsigned __int16 *)(v11 + 98);
    *(_WORD *)(v11 + 98) = v13 + 1;
    *(_QWORD *)(v12 + 8 * v13) = v10;
  }
}

float __C3DShapeMeshCreationAppendShape_block_invoke_2(uint64_t a1, float64x2_t *a2, double a3, double a4, float a5, double a6, double a7, double a8, double a9)
{
  uint64_t v9;
  uint64_t v10;
  float32x2_t *v11;
  float *v12;
  double v13;
  float v14;
  float v15;
  float result;
  float v17;
  float v18;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(unsigned __int16 *)(v9 + 96);
  v11 = (float32x2_t *)(*(_QWORD *)(v9 + 112) + 12 * v10);
  v12 = (float *)(*(_QWORD *)(v9 + 120) + 12 * v10);
  v13 = a2[4].f64[0];
  v14 = v13;
  *(float *)&v13 = *(double *)(a1 + 56) - v13;
  v15 = *(float *)&v13 + a6 * v14;
  *v11 = vcvt_f32_f64(vmlaq_n_f64(vmulq_n_f64(vaddq_f64(*(float64x2_t *)(a1 + 40), *a2), a7), vaddq_f64(a2[3], *(float64x2_t *)(a1 + 40)), 1.0 - a7));
  v11[1].f32[0] = v15 * a5;
  result = a3 * a9;
  v17 = a4 * a9;
  v18 = a8 * a5;
  *v12 = result;
  v12[1] = v17;
  v12[2] = v18;
  *(_WORD *)(v9 + 96) = v10 + 1;
  return result;
}

@end
