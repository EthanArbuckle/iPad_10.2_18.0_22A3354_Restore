@implementation GLPOffsetObject

double __deserialize_GLPOffsetObject_block_invoke(uint64_t a1)
{
  _OWORD *v1;
  double result;

  v1 = (_OWORD *)(*(uint64_t (**)(_QWORD, uint64_t, const char *))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240)
                                                                          + 8))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 240), 32, "Deserialized");
  result = 0.0;
  *v1 = 0u;
  v1[1] = 0u;
  return result;
}

@end
