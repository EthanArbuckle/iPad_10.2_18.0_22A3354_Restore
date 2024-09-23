@implementation CUIKPhoneNumberDescriptionGenerator

+ (id)sharedGenerator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CUIKPhoneNumberDescriptionGenerator_sharedGenerator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedGenerator_onceToken != -1)
    dispatch_once(&sharedGenerator_onceToken, block);
  return (id)sharedGenerator___sharedInstance;
}

void __54__CUIKPhoneNumberDescriptionGenerator_sharedGenerator__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedGenerator___sharedInstance;
  sharedGenerator___sharedInstance = (uint64_t)v1;

}

- (id)formattedStringForPhoneNumber:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t (*v6)(_QWORD, id, void *);
  uint64_t v7;
  void *v8;
  const void *v9;
  void (*v10)(_QWORD, const void *, uint64_t);

  v3 = a3;
  objc_msgSend((id)EKWeakLinkClass(), "defaultCountryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = (uint64_t (*)(_QWORD, id, void *))EKWeakLinkSymbol();
  v7 = v6(0, v5, v4);
  v8 = v5;
  if (v7)
  {
    v9 = (const void *)v7;
    v10 = (void (*)(_QWORD, const void *, uint64_t))EKWeakLinkSymbol();
    v10(0, v9, 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    CFRelease(v9);
  }

  return v8;
}

- (id)formattedStringForTelURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "resourceSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("?"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByRemovingPercentEncoding");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CUIKPhoneNumberDescriptionGenerator formattedStringForPhoneNumber:](self, "formattedStringForPhoneNumber:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)normalizedPhoneNumber:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  const void *v9;
  void *String;

  v3 = a3;
  v4 = (void *)PNCopyBestGuessCountryCodeForNumber();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = (const char *)PNCopyBestGuessNormalizedNumberForCountry();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v7, strlen(v7), 4, 1);
  v9 = (const void *)CFPhoneNumberCreate();
  String = (void *)CFPhoneNumberCreateString();
  if (!String)
  {
    String = (void *)CFPhoneNumberCreateString();
    if (!v9)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v9)
LABEL_5:
    CFRelease(v9);
LABEL_6:

  return String;
}

@end
