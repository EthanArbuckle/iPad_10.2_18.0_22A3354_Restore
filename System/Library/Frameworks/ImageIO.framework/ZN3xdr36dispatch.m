@implementation ZN3xdr36dispatch

float32x4_t *___ZN3xdr36dispatch_convert_image_to_image_loopILt2ELt2EEEvRKNS_7imageInERKNS_8imageOutERKNS_16colorTransformInERKNS_17colorTransformOutEDv2_t_block_invoke(float32x4_t *result, __int16 a2)
{
  float32x4_t *v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  int v7;

  v6 = 0x100000000;
  v7 = 1;
  if (result[5].i16[0])
  {
    v3 = result;
    v4 = 0;
    do
    {
      HIWORD(v5) = a2;
      LOWORD(v5) = v4;
      result = xdr::convert_image_to_image_loop<(unsigned short)2,(unsigned short)2>(v3[3].i64[0], (float32x4_t *)v3[3].i64[1], (float32x4_t *)v3[4].i64[0], (float32x4_t *)v3[4].i64[1], v5, &v6, (int8x16_t)v3[2]);
      ++v4;
    }
    while (v3[5].u16[0] > (unsigned __int16)v4);
  }
  return result;
}

_QWORD *___ZN3xdr36dispatch_compute_luma_gain_histogramILt2ELt2ELt4EEEvRKNS_7imageInES3_RKNS_16colorTransformInERKNS_15gainTransformInERNS_11histogram2DEDv2_fDv2_t_block_invoke_2(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;

  v2 = 0;
  v3 = 0;
  v4 = result[5] + (a2 << 7);
  v5 = result[6] + (a2 << 7);
  do
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v7 += *(unsigned int *)(v4 + v6);
      v6 += 4096;
    }
    while (v6 != 0x40000);
    *(_DWORD *)(v5 + 4 * v2) = v7;
    v3 += v7;
    ++v2;
    v4 += 4;
  }
  while (v2 != 32);
  v8 = *(unint64_t **)(*(_QWORD *)(result[4] + 8) + 24);
  do
    v9 = __ldxr(v8);
  while (__stxr(v9 + v3, v8));
  return result;
}

@end
