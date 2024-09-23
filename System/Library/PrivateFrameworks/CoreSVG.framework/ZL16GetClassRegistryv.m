@implementation ZL16GetClassRegistryv

_QWORD *___ZL16GetClassRegistryv_block_invoke()
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  result[2] = 0;
  result[1] = 0;
  *result = result + 1;
  GetClassRegistry(void)::classRegistry = (uint64_t)result;
  return result;
}

@end
