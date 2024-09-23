@implementation CASDeleteClient

uint64_t __CASDeleteClient_block_invoke(uint64_t a1)
{
  uint64_t result;
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;

  result = *(_QWORD *)(a1 + 32);
  v2 = (unsigned int *)(result + 8);
  do
  {
    v3 = __ldaxr(v2);
    v4 = v3 - 1;
  }
  while (__stlxr(v4, v2));
  if (!v4)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
  return result;
}

@end
