@implementation ZN3AGX14FenceGroupPool13getFenceGroupEv

int8x16_t *___ZN3AGX14FenceGroupPool13getFenceGroupEv_block_invoke(int8x16_t *result)
{
  int8x16_t *v1;
  int8x16_t *v2;
  int8x16_t *v3;
  int8x16_t v4;

  v1 = result;
  v2 = (int8x16_t *)result[2].i64[1];
  v3 = (int8x16_t *)v2->i64[0];
  if (!v2->i64[0])
  {
    result = (int8x16_t *)malloc_type_malloc(0x448uLL, 0x10200409324277FuLL);
    v4 = *v2;
    v2->i64[1] = (uint64_t)result;
    *result = vextq_s8(v4, v4, 8uLL);
    result[9].i64[0] = (uint64_t)&result->i64[1];
    result[17].i64[1] = (uint64_t)result[9].i64;
    result[26].i64[0] = (uint64_t)&result[17].i64[1];
    result[34].i64[1] = (uint64_t)result[26].i64;
    result[43].i64[0] = (uint64_t)&result[34].i64[1];
    result[51].i64[1] = (uint64_t)result[43].i64;
    v3 = result + 60;
    result[60].i64[0] = (uint64_t)&result[51].i64[1];
    v2->i64[0] = (uint64_t)result[60].i64;
  }
  *(_QWORD *)(*(_QWORD *)(v1[2].i64[0] + 8) + 24) = v3;
  v2->i64[0] = *(_QWORD *)v2->i64[0];
  return result;
}

@end
