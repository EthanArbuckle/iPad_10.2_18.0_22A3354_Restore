@implementation HFProgrammableSwitchInputEventOptionDisplayPriorityMap

void __HFProgrammableSwitchInputEventOptionDisplayPriorityMap_block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v0 = (void *)objc_opt_new();
  v4 = (id)objc_opt_new();
  objc_msgSend(v4, "addIndex:", 0);
  objc_msgSend(v4, "addIndex:", 1);
  objc_msgSend(v4, "addIndex:", 2);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __HFProgrammableSwitchInputEventOptionDisplayPriorityMap_block_invoke_2;
  v5[3] = &unk_1EA7412C0;
  v6 = v0;
  v1 = v0;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v5);
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)_MergedGlobals_329;
  _MergedGlobals_329 = v2;

}

void __HFProgrammableSwitchInputEventOptionDisplayPriorityMap_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFProgrammableSwitchLocalizedStringKeyForValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HFLocalizedStringWithDefaultValue(v5, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "na_safeSetObject:forKey:", v7, v6);
}

@end
