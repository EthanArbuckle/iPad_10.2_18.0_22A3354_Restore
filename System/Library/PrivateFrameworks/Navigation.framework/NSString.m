@implementation NSString

uint64_t __64__NSString_FormatExtras___navigation_formattedStringForInteger___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)_MergedGlobals_21;
  _MergedGlobals_21 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_21;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend((id)_MergedGlobals_21, "setNumberStyle:", 1);
  return objc_msgSend((id)_MergedGlobals_21, "setMinimumIntegerDigits:", 1);
}

uint64_t __100__NSString_FormatExtras___navigation_replacementForFormatToken_options_overrideVariables_useMetric___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)qword_1ED0C3E80;
  qword_1ED0C3E80 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ED0C3E80, "setNumberStyle:", 3);
}

void __58__NSString_FormatExtras___navigation_formatterForOptions___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)qword_1ED0C3E90;
  qword_1ED0C3E90 = (uint64_t)v0;

}

uint64_t __43__NSString_FormatExtras___navigation_isCJK__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  v1 = (void *)qword_1ED0C3EA0;
  qword_1ED0C3EA0 = (uint64_t)v0;

  objc_msgSend((id)qword_1ED0C3EA0, "addCharactersInRange:", 4352, 256);
  objc_msgSend((id)qword_1ED0C3EA0, "addCharactersInRange:", 11904, 352);
  objc_msgSend((id)qword_1ED0C3EA0, "addCharactersInRange:", 12272, 464);
  objc_msgSend((id)qword_1ED0C3EA0, "addCharactersInRange:", 12800, 29392);
  objc_msgSend((id)qword_1ED0C3EA0, "addCharactersInRange:", 44032, 11183);
  objc_msgSend((id)qword_1ED0C3EA0, "addCharactersInRange:", 63744, 352);
  objc_msgSend((id)qword_1ED0C3EA0, "addCharactersInRange:", 65072, 32);
  objc_msgSend((id)qword_1ED0C3EA0, "addCharactersInRange:", 65280, 240);
  objc_msgSend((id)qword_1ED0C3EA0, "addCharactersInRange:", 0x20000, 42711);
  return objc_msgSend((id)qword_1ED0C3EA0, "addCharactersInRange:", 194560, 542);
}

void __58__NSString_FormatExtras___navigation_stringForPower_unit___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3760]);
  v1 = (void *)qword_1ED0C3EB0;
  qword_1ED0C3EB0 = (uint64_t)v0;

}

@end
