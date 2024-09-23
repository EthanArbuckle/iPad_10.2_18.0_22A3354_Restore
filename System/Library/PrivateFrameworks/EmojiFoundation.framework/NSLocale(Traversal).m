@implementation NSLocale(Traversal)

+ (void)_enumerateLanguageFallbackGraphForLocaleIdentifier:()Traversal usingBlock:
{
  void (**v5)(id, id, _BYTE *);
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  char v12;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  v9 = 0;
  v12 = 0;
  v10 = v8;
  do
  {
    if ((objc_msgSend(v10, "isEqualToString:", v9) & 1) != 0)
      break;
    objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v11;
    v5[2](v5, v10, &v12);
    v9 = v10;
  }
  while (!v12);

}

@end
