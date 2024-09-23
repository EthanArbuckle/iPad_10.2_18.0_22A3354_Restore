@implementation INIntentSchemaBuildIntentSlotDescriptionMap

void ___INIntentSchemaBuildIntentSlotDescriptionMap_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3 + 1;
  v6 = a2;
  objc_msgSend(v4, "numberWithUnsignedInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRank:", v7);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v6, "name");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v6, v9);

}

@end
