@implementation CNNonGregorianBirthdayDescription

void __72__CNNonGregorianBirthdayDescription_ABSExtentions__ABSValueFromCNValue___block_invoke(uint64_t a1, uint64_t a2, const void *a3)
{
  __CFDictionary *v4;
  id v5;

  if (a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = *(__CFDictionary **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    CFDictionarySetValue(v4, a3, v5);

  }
}

uint64_t __72__CNNonGregorianBirthdayDescription_ABSExtentions__CNValueFromABSValue___block_invoke(uint64_t a1, const void *a2)
{
  void *Value;

  Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), a2);
  if (Value)
    return objc_msgSend(Value, "integerValue");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

@end
