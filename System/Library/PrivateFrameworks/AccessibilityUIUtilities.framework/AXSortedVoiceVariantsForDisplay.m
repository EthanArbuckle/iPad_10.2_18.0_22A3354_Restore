@implementation AXSortedVoiceVariantsForDisplay

uint64_t __AXSortedVoiceVariantsForDisplay_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend(v5, "footprint");
  if (v6 == objc_msgSend(v4, "footprint"))
  {
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "localizedCompare:", v8);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    v11 = objc_msgSend(v5, "footprint");

    objc_msgSend(v10, "numberWithInteger:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "footprint"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "compare:", v8);
  }
  v12 = v9;

  return v12;
}

@end
