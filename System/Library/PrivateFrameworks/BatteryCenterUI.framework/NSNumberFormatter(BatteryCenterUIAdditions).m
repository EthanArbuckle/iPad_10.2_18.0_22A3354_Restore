@implementation NSNumberFormatter(BatteryCenterUIAdditions)

+ (id)bcui_newPercentChargeFormatter
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v0, "setNumberStyle:", 3);
  objc_msgSend(v0, "_setUsesCharacterDirection:", 1);
  objc_msgSend(v0, "setMultiplier:", &unk_1E941D958);
  return v0;
}

- (uint64_t)bcui_isPercentSymbolEnabled
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "percentSymbol");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", &stru_1E9419348);

  return v2;
}

- (uint64_t)bcui_setPercentSymbolEnabled:()BatteryCenterUIAdditions
{
  const __CFString *v3;

  if (a3)
    v3 = 0;
  else
    v3 = &stru_1E9419348;
  return objc_msgSend(a1, "setPercentSymbol:", v3);
}

@end
