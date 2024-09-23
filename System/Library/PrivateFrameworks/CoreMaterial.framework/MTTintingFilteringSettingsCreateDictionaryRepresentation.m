@implementation MTTintingFilteringSettingsCreateDictionaryRepresentation

id __MTTintingFilteringSettingsCreateDictionaryRepresentation_block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  char v4;
  void *v5;

  if (*(_BYTE *)(a1 + 40))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 32), "blurInputQuality");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("default"));

    if ((v4 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "blurInputQuality");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("inputQuality"));

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id __MTTintingFilteringSettingsCreateDictionaryRepresentation_block_invoke()
{
  const __CFString *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v1 = CFSTR("inputColorMap");
  v2[0] = MTDefaultLuminanceColorMap();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, &v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
