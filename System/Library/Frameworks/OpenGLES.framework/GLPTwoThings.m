@implementation GLPTwoThings

uint64_t __deserialize_GLPTwoThings_block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = (*(uint64_t (**)(_QWORD, uint64_t, const char *))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) + 8))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 240), 16, "Deserialized");
  deserialize_GLPNameTableEntry(*(_QWORD *)(a1 + 32), v2);
  deserialize_GLPNameTableEntry(*(_QWORD *)(a1 + 32), v2 + 8);
  return v2;
}

@end
