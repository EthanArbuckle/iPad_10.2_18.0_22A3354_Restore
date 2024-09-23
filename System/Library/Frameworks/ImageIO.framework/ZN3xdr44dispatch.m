@implementation ZN3xdr44dispatch

float32x4_t *___ZN3xdr44dispatch_convert_gainmap_image_to_image_loopILt2ELt2EEEvRKNS_7imageInES3_RKNS_8imageOutERKNS_16colorTransformInERKNS_15gainTransformInERKNS_17colorTransformOutEDv2_t_block_invoke(float32x4_t *result, __int16 a2)
{
  float32x4_t *v3;
  int v4;
  unsigned __int32 v5;
  uint64_t v6;
  int v7;

  v6 = 0x100000000;
  v7 = 1;
  if (result[6].i16[0])
  {
    v3 = result;
    v4 = 0;
    do
    {
      HIWORD(v5) = a2;
      LOWORD(v5) = v4;
      result = xdr::convert_gainmap_image_to_image_loop<(unsigned short)2,(unsigned short)2>(v3[3].i64[0], v3[3].i64[1], (float32x4_t *)v3[4].i64[0], (float32x4_t *)v3[4].i64[1], (float32x4_t *)v3[5].i64[0], (float32x4_t *)v3[5].i64[1], v5, &v6, (int8x16_t)v3[2]);
      ++v4;
    }
    while (v3[6].u16[0] > (unsigned __int16)v4);
  }
  return result;
}

float32x4_t *___ZN3xdr44dispatch_convert_image_to_gainmap_image_loopILt2ELt2EEEvRKNS_7imageInERKNS_8imageOutES6_RKNS_16colorTransformInES9_RKNS_17colorTransformOutERKNS_16gainTransformOutEDv2_t_block_invoke(float32x4_t *result, __int16 a2)
{
  float32x4_t *v3;
  int v4;
  unsigned __int32 v5;
  uint64_t v6;
  int v7;

  v6 = 0x100000000;
  v7 = 1;
  if (result[6].i16[4])
  {
    v3 = result;
    v4 = 0;
    do
    {
      HIWORD(v5) = a2;
      LOWORD(v5) = v4;
      result = xdr::convert_image_to_gainmap_image_loop<(unsigned short)2,(unsigned short)2>(v3[3].i64[0], (float32x4_t *)v3[3].i64[1], (float32x4_t *)v3[4].i64[0], (float32x4_t *)v3[4].i64[1], (float32x4_t *)v3[5].i64[0], (float32x4_t *)v3[5].i64[1], v3[6].i64[0], v5, (int8x16_t)v3[2], &v6);
      ++v4;
    }
    while (v3[6].u16[4] > (unsigned __int16)v4);
  }
  return result;
}

float32x4_t *___ZN3xdr44dispatch_convert_image_to_gainmap_image_loopILt4ELt4EEEvRKNS_7imageInERKNS_8imageOutES6_RKNS_16colorTransformInES9_RKNS_17colorTransformOutERKNS_16gainTransformOutEDv2_t_block_invoke(float32x4_t *result, __int16 a2, double a3, uint16x4_t a4)
{
  float32x4_t *v5;
  int v6;
  unsigned __int32 v7;
  uint64_t v8;
  int v9;

  v8 = 0x100000000;
  v9 = 1;
  if (result[6].i16[4])
  {
    v5 = result;
    v6 = 0;
    do
    {
      HIWORD(v7) = a2;
      LOWORD(v7) = v6;
      result = xdr::convert_image_to_gainmap_image_loop<(unsigned short)4,(unsigned short)4>(v5[3].i64[0], (float32x4_t *)v5[3].i64[1], (float32x4_t *)v5[4].i64[0], (float32x4_t *)v5[4].i64[1], (float32x4_t *)v5[5].i64[0], (float32x4_t *)v5[5].i64[1], v5[6].i64[0], v7, (int8x16_t)v5[2], a4, &v8);
      ++v6;
    }
    while (v5[6].u16[4] > (unsigned __int16)v6);
  }
  return result;
}

@end
