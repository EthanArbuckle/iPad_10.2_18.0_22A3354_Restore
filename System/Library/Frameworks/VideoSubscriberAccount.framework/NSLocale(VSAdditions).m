@implementation NSLocale(VSAdditions)

+ (__CFString)vs_systemLanaguage
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.UIKit"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unable to obtain system language bundle."));
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The languageID parameter must not be nil."));
    v7 = 0;
    return v7;
  }
  v1 = v0;
  v2 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(v0, "localizations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredLocalizationsFromArray:forPreferences:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(v4, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "canonicalLanguageIdentifierFromString:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (-[__CFString isEqual:](v7, "isEqual:", CFSTR("pt")))
    {

      v7 = CFSTR("pt-BR");
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("No preferred localizations in system language bundle."));
    v7 = 0;
  }

  if (!v7)
    goto LABEL_8;
  return v7;
}

@end
