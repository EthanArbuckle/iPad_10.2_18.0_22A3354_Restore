@implementation HomeKitSettingToHFItem

void __48___HomeKitSettingToHFItem_CacheItem_na_identity__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_42_1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "build");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED3789E8;
  qword_1ED3789E8 = v1;

}

uint64_t __48___HomeKitSettingToHFItem_CacheItem_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "keyPath");
}

@end
