@implementation AVTPresetCategoryFromString

void __AVTPresetCategoryFromString_block_invoke()
{
  uint64_t v0;
  void *v1;
  unint64_t i;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 40);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AVTPresetCategoryFromString_nameToCategory;
  AVTPresetCategoryFromString_nameToCategory = v0;

  for (i = 0; i != 40; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)AVTPresetCategoryFromString_nameToCategory;
    AVTPresetCategoryToString(i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v5);

  }
}

@end
