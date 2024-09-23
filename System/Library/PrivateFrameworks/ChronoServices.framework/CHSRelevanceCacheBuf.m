@implementation CHSRelevanceCacheBuf

id __40___CHSRelevanceCacheBuf_archivedObjects__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _DWORD *v3;

  v3 = *(_DWORD **)(a1 + 32);
  if (*v3 <= a2)
    __40___CHSRelevanceCacheBuf_archivedObjects__block_invoke_cold_1(a1, a2, a3);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", *((unsigned __int8 *)v3 + a2 + 4));
}

_CHSWidgetRelevancePropertiesBuf *__31___CHSRelevanceCacheBuf_groups__block_invoke(uint64_t a1, unsigned int a2)
{
  _CHSWidgetRelevancePropertiesBuf *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;

  v4 = [_CHSWidgetRelevancePropertiesBuf alloc];
  v7 = *(unsigned int **)(a1 + 40);
  if (*v7 <= a2)
    __40___CHSRelevanceCacheBuf_archivedObjects__block_invoke_cold_1((uint64_t)v4, v5, v6);
  return -[_CHSWidgetRelevancePropertiesBuf initWithBufRef:cppPointer:](v4, "initWithBufRef:cppPointer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (char *)&v7[a2 + 1] + v7[a2 + 1]);
}

void __60___CHSRelevanceCacheBuf_deepCopyUsingBufferBuilder_changes___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "deepCopyUsingBufferBuilder:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

void __60___CHSRelevanceCacheBuf_deepCopyUsingBufferBuilder_changes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v3, "setArchivedObjects:");
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v3, "setGroups:");

}

uint64_t __41___CHSRelevanceCacheBuf_verifyUTF8Fields__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "verifyUTF8Fields");
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

void __40___CHSRelevanceCacheBuf_archivedObjects__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_2("Get", "flatbuffers.h", a3, "i < size()");
}

@end
