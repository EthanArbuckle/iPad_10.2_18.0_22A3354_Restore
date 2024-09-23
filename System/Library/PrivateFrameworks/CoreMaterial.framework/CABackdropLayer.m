@implementation CABackdropLayer

uint64_t __94__CABackdropLayer_CoreMaterial___mt_configureFilterOfType_ifNecessaryWithName_andFilterOrder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  objc_msgSend(a2, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MTCompareObjectsWithOrder((uint64_t)v6, v7, *(void **)(a1 + 32));
  return v8;
}

void __63__CABackdropLayer_CoreMaterial__mt_orderedFilterTypesBlurAtEnd__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "mt_orderedFilterTypes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v3 = *MEMORY[0x1E0CD2C88];
  objc_msgSend(v2, "removeObject:", *MEMORY[0x1E0CD2C88]);
  v4 = *MEMORY[0x1E0CD2F00];
  objc_msgSend(v2, "removeObject:", *MEMORY[0x1E0CD2F00]);
  objc_msgSend(v2, "addObject:", v3);
  objc_msgSend(v2, "addObject:", v4);
  v5 = (void *)mt_orderedFilterTypesBlurAtEnd___sortedFilterTypesBlurAtEnd;
  mt_orderedFilterTypesBlurAtEnd___sortedFilterTypesBlurAtEnd = (uint64_t)v2;

}

void __54__CABackdropLayer_CoreMaterial__mt_orderedFilterTypes__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[10];

  v6[9] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CD2E20];
  v6[0] = *MEMORY[0x1E0CD2B88];
  v6[1] = v0;
  v1 = *MEMORY[0x1E0CD2C20];
  v6[2] = *MEMORY[0x1E0CD2E18];
  v6[3] = v1;
  v2 = *MEMORY[0x1E0CD2F00];
  v6[4] = *MEMORY[0x1E0CD2C88];
  v6[5] = v2;
  v3 = *MEMORY[0x1E0CD2C00];
  v6[6] = *MEMORY[0x1E0CD2BF0];
  v6[7] = v3;
  v6[8] = *MEMORY[0x1E0CD2BB8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 9);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)mt_orderedFilterTypes___sortedFilterTypes;
  mt_orderedFilterTypes___sortedFilterTypes = v4;

}

@end
