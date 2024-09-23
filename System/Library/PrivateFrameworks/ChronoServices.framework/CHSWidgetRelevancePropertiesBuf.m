@implementation CHSWidgetRelevancePropertiesBuf

_CHSWidgetRelevanceBuf *__46___CHSWidgetRelevancePropertiesBuf_relevances__block_invoke(uint64_t a1, unsigned int a2)
{
  _CHSWidgetRelevanceBuf *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;

  v4 = [_CHSWidgetRelevanceBuf alloc];
  v7 = *(unsigned int **)(a1 + 40);
  if (*v7 <= a2)
    __40___CHSRelevanceCacheBuf_archivedObjects__block_invoke_cold_1((uint64_t)v4, v5, v6);
  return -[_CHSWidgetRelevanceBuf initWithBufRef:cppPointer:](v4, "initWithBufRef:cppPointer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), (char *)&v7[a2 + 1] + v7[a2 + 1]);
}

void __71___CHSWidgetRelevancePropertiesBuf_deepCopyUsingBufferBuilder_changes___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "deepCopyUsingBufferBuilder:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

void __71___CHSWidgetRelevancePropertiesBuf_deepCopyUsingBufferBuilder_changes___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  id v9;

  v9 = a2;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v9, "setExtensionIdentity:");
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v9, "setKind:");
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    if (*(_BYTE *)(v3 + 24) == 1)
    {
      v4 = *(unsigned __int8 *)(v3 + 25) != 0;
      goto LABEL_10;
    }
    if (*(_BYTE *)(v3 + 24))
      goto LABEL_11;
  }
  v4 = objc_msgSend(*(id *)(a1 + 56), "supportsBackgroundRefresh");
LABEL_10:
  objc_msgSend(v9, "setSupportsBackgroundRefresh:", v4);
LABEL_11:
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    if (*(_BYTE *)(v5 + 26) == 1)
    {
      v6 = *(unsigned __int8 *)(v5 + 27) != 0;
      goto LABEL_16;
    }
    if (*(_BYTE *)(v5 + 26))
      goto LABEL_17;
  }
  v6 = objc_msgSend(*(id *)(a1 + 56), "isDeletion");
LABEL_16:
  objc_msgSend(v9, "setIsDeletion:", v6);
LABEL_17:
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
  {
    if (*(_BYTE *)(v7 + 28) == 1)
    {
      v8 = *(double *)(v7 + 32);
      goto LABEL_22;
    }
    if (*(_BYTE *)(v7 + 28))
      goto LABEL_23;
  }
  objc_msgSend(*(id *)(a1 + 56), "lastRelevanceUpdate");
LABEL_22:
  objc_msgSend(v9, "setLastRelevanceUpdate:", v8);
LABEL_23:
  if (*(_QWORD *)(a1 + 64))
    objc_msgSend(v9, "setRelevances:");

}

uint64_t __52___CHSWidgetRelevancePropertiesBuf_verifyUTF8Fields__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
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

@end
