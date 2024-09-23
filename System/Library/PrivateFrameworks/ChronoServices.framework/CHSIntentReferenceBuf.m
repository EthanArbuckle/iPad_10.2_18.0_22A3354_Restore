@implementation CHSIntentReferenceBuf

id __36___CHSIntentReferenceBuf_intentData__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _DWORD *v3;

  v3 = *(_DWORD **)(a1 + 32);
  if (*v3 <= a2)
    __40___CHSRelevanceCacheBuf_archivedObjects__block_invoke_cold_1(a1, a2, a3);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", *((unsigned __int8 *)v3 + a2 + 4));
}

id __36___CHSIntentReferenceBuf_schemaData__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _DWORD *v3;

  v3 = *(_DWORD **)(a1 + 32);
  if (*v3 <= a2)
    __40___CHSRelevanceCacheBuf_archivedObjects__block_invoke_cold_1(a1, a2, a3);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", *((unsigned __int8 *)v3 + a2 + 4));
}

id __43___CHSIntentReferenceBuf_partialIntentData__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _DWORD *v3;

  v3 = *(_DWORD **)(a1 + 32);
  if (*v3 <= a2)
    __40___CHSRelevanceCacheBuf_archivedObjects__block_invoke_cold_1(a1, a2, a3);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", *((unsigned __int8 *)v3 + a2 + 4));
}

void __61___CHSIntentReferenceBuf_deepCopyUsingBufferBuilder_changes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    if (*(_BYTE *)(v3 + 8) == 1)
    {
      v4 = *(_QWORD *)(v3 + 16);
      goto LABEL_6;
    }
    if (*(_BYTE *)(v3 + 8))
      goto LABEL_7;
  }
  v4 = objc_msgSend(*(id *)(a1 + 40), "stableHash");
LABEL_6:
  objc_msgSend(v5, "setStableHash:", v4);
LABEL_7:
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v5, "setIntentData:");
  if (*(_QWORD *)(a1 + 56))
    objc_msgSend(v5, "setSchemaData:");
  if (*(_QWORD *)(a1 + 64))
    objc_msgSend(v5, "setPartialIntentData:");

}

@end
