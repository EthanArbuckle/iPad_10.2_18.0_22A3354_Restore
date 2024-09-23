@implementation NSLocale

void __52__NSLocale_EmailFoundationAdditions__ef_posixLocale__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v1 = (void *)ef_posixLocale_locale;
  ef_posixLocale_locale = v0;

}

id __62__NSLocale_EmailFoundationAdditions__ef_localesFromLanguages___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
