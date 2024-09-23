@implementation CAMLocalizedFrameworkString

uint64_t __CAMLocalizedFrameworkString_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t result;

  v6 = a2;
  CAMCameraUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", *(_QWORD *)(a1 + 32), &stru_1EA3325A0, v6);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((result & 1) == 0)
    *a4 = 1;
  return result;
}

@end
