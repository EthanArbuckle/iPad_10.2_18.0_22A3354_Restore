@implementation NSLocale

void __63__NSLocale_MNExtras___localeOverridesForLocaleWithCountryCode___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[2];
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("GB");
  v5[0] = *MEMORY[0x1E0C99840];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = CFSTR("MNLocaleUseYardForShortDistance");
  v6[0] = v0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_MergedGlobals_32;
  _MergedGlobals_32 = v3;

}

@end
