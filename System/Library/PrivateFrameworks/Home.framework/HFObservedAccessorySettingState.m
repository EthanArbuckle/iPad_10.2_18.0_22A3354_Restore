@implementation HFObservedAccessorySettingState

uint64_t __61___HFObservedAccessorySettingState_initWithSettings_setting___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "title");
}

void __47___HFObservedAccessorySettingState_na_identity__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendCharacteristic:", &__block_literal_global_20_1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_21_1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendCharacteristic:", &__block_literal_global_22_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED378E30;
  qword_1ED378E30 = v3;

}

uint64_t __47___HFObservedAccessorySettingState_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "settings");
}

uint64_t __47___HFObservedAccessorySettingState_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setting");
}

uint64_t __47___HFObservedAccessorySettingState_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "selectionOptions");
}

@end
