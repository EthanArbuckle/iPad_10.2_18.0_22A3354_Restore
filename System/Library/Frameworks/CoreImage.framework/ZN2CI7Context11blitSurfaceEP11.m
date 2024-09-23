@implementation ZN2CI7Context11blitSurfaceEP11

_QWORD *___ZN2CI7Context11blitSurfaceEP11__IOSurface5IRectS2_S3__block_invoke_2(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v8;
  unint64_t v9;

  if (result[6])
  {
    v8 = result;
    v9 = 0;
    do
    {
      result = memmove((void *)(v8[7] + (v9 + *((int *)v8 + 17)) * v8[11] + *((int *)v8 + 16) * (uint64_t)*((int *)v8 + 24)), (const void *)(a2 + (v9 + *((int *)v8 + 9)) * a6 + *((int *)v8 + 24) * (uint64_t)*((int *)v8 + 8)), v8[5] * *((int *)v8 + 24));
      ++v9;
    }
    while (v9 < v8[6]);
  }
  return result;
}

@end
