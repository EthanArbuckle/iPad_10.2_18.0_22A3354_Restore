@implementation CFPrefsSizeOfValue

uint64_t ___CFPrefsSizeOfValue_block_invoke(uint64_t a1, const char *a2, xpc_object_t xdict)
{
  uint64_t v5;

  v5 = _CFPrefsSizeOfValue(xdict);
  if (v5)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += strlen(a2) + v5;
  return 1;
}

@end
