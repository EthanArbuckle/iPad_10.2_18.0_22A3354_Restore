@implementation NSString

- (id)stringByTrimmingDots
{
  id v1;
  void *v2;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("."));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringByTrimmingCharactersInSet:", v2);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

uint64_t __50__NSString_HomeKit__stringByCapitalizingFirstWord__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCapitalizedString");
}

void __61__NSString_HomeKit__stringByTransformingFirstWordUsingBlock___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v9 = *(_QWORD *)(a1[5] + 8);
  *(_QWORD *)(v9 + 32) = a3;
  *(_QWORD *)(v9 + 40) = a4;
  (*(void (**)(void))(a1[4] + 16))();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  *a7 = 1;
}

@end
