@implementation NSObject

void __58__NSObject_QSExtras__accessibilitySpeakLanguageSelection___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "specificLanguageID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "speakAction:withPreferredLanguage:", v2, v3);

}

uint64_t __64__NSObject_QSExtras__accessibilitySystemShouldShowSpeakSpellOut__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqualToString:", *MEMORY[0x24BDD0FA8]);
  if ((_DWORD)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
