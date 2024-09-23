@implementation GLPSubroutineUniformObject

uint64_t __deserialize_GLPSubroutineUniformObject_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int *v4;
  _QWORD v6[5];

  v2 = (*(uint64_t (**)(_QWORD, uint64_t, const char *))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) + 8))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 240), 48, "Deserialized");
  *(_OWORD *)v2 = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_QWORD *)v2 = deserialize_GLPString(*(_QWORD *)(a1 + 32));
  *(_QWORD *)(v2 + 8) = v3;
  v4 = *(unsigned int **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 0x40000000;
  v6[2] = __deserialize_GLPType_block_invoke;
  v6[3] = &__block_descriptor_tmp_12;
  v6[4] = v4;
  deserialize_pointer(v4, (uint64_t)v6, (_QWORD *)(v2 + 16));
  return v2;
}

@end
