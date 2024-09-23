@implementation GLPLayoutObject

_QWORD *__deserialize_GLPLayoutObject_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unsigned int *v4;
  unsigned int *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  unsigned int *v11;

  v2 = (_QWORD *)(*(uint64_t (**)(_QWORD, uint64_t, const char *))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240)
                                                                          + 8))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 240), 16, "Deserialized");
  v3 = MEMORY[0x24BDAC760];
  v4 = *(unsigned int **)(a1 + 32);
  v7 = MEMORY[0x24BDAC760];
  v8 = 0x40000000;
  v9 = __deserialize_GLPLayoutPair_block_invoke;
  v10 = &__block_descriptor_tmp_4_0;
  v11 = v4;
  deserialize_pointer(v4, (uint64_t)&v7, v2);
  v5 = *(unsigned int **)(a1 + 32);
  v7 = v3;
  v8 = 0x40000000;
  v9 = __deserialize_GLPLayoutPair_block_invoke;
  v10 = &__block_descriptor_tmp_4_0;
  v11 = v5;
  deserialize_pointer(v5, (uint64_t)&v7, v2 + 1);
  return v2;
}

@end
