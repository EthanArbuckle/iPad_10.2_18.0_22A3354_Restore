@implementation ZL22

char *___ZL22_lightMapImageFromDataP6NSDataP8NSNumberS2__block_invoke(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char *v7;
  char *result;
  char *v12;
  size_t v13;

  v7 = a2;
  if (a3 == 2 * *(int *)(a1 + 48))
    return (char *)memcpy(a2, (const void *)objc_msgSend(*(id *)(a1 + 32), "bytes"), *(_QWORD *)(a1 + 40));
  result = (char *)objc_msgSend(*(id *)(a1 + 32), "bytes");
  if (a7)
  {
    v12 = result;
    v13 = 2 * a6;
    do
    {
      result = (char *)memcpy(v7, v12, v13);
      v12 += v13;
      v7 += a3;
      --a7;
    }
    while (a7);
  }
  return result;
}

@end
