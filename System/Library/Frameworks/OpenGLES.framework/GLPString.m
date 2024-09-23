@implementation GLPString

void *__deserialize_GLPString_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 40) + (unint64_t)*(unsigned int *)(v2 + 260) > *(unsigned int *)(v2 + 256))
    glpDeserialError(v2, 1u);
  v3 = (void *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)(v2 + 240) + 8))(**(_QWORD **)(v2 + 240));
  memcpy(v3, (const void *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) + *(unsigned int *)(*(_QWORD *)(a1 + 32) + 260)), *(_QWORD *)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 260) += *(_DWORD *)(a1 + 40);
  return v3;
}

@end
