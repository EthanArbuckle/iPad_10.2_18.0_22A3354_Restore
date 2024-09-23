@implementation AVTEditingModelMappings

+ (id)presetCategoryFromCategoryName:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", AVTPresetCategoryFromString());
}

+ (id)framingModeForCameraIdentifier:(id)a3
{
  return a3;
}

+ (id)presetCategoryForColorPaletteName:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", AVTColorCategoryFromString());
}

+ (id)paletteCategories
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 40);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  AVTEnumeratePresetCategories();

  return v3;
}

void __44__AVTEditingModelMappings_paletteCategories__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
