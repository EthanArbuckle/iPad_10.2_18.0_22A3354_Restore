@implementation DPPrivacyBudgetProperties

void __55___DPPrivacyBudgetProperties_budgetPropertiesFromFile___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("override.budgetproperties"), CFSTR("plist"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  +[_DPPListHelper loadPropertyListFromPath:overridePath:usingBlock:](_DPPListHelper, "loadPropertyListFromPath:overridePath:usingBlock:", *(_QWORD *)(a1 + 32), v5, &__block_literal_global_7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)gAllBudgetProperties;
  gAllBudgetProperties = v3;

}

_DPPrivacyBudgetProperties *__55___DPPrivacyBudgetProperties_budgetPropertiesFromFile___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_DPPrivacyBudgetProperties budgetPropertiesWithName:fromDictionary:](_DPPrivacyBudgetProperties, "budgetPropertiesWithName:fromDictionary:", a2, a3);
}

@end
