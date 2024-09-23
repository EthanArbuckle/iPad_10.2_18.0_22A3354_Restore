@implementation CNPhoneNumberHelper

+ (id)lastFourDigitsForNumber:(id)a3
{
  id v4;
  void *v5;
  void *FourDigitsOfLocalNumber;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(a1, "countryCodeForNumber:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    FourDigitsOfLocalNumber = (void *)_PNCopyLastFourDigitsOfLocalNumber();

  }
  else
  {
    FourDigitsOfLocalNumber = 0;
  }
  return FourDigitsOfLocalNumber;
}

+ (id)countryCodeForNumber:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)PNCopyBestGuessCountryCodeForNumber();
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v4))
  {
    objc_msgSend(a1, "defaultCountryCode");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

+ (id)defaultCountryCode
{
  __CFString *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (__CFString *)CPPhoneNumberCopyHomeCountryCode();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseString");
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5)
      v2 = (__CFString *)v5;
    else
      v2 = CFSTR("us");
  }
  return v2;
}

+ (BOOL)isStringPhoneNumber:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  _QWORD block[5];

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CNPhoneNumberHelper_isStringPhoneNumber___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isStringPhoneNumber__cn_once_token_1 != -1)
    dispatch_once(&isStringPhoneNumber__cn_once_token_1, block);
  if (isStringPhoneNumber__cn_once_object_1)
  {
    v5 = (id)isStringPhoneNumber__cn_once_object_1;
    v6 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", v4, 4, 0, objc_msgSend(v4, "length"));

    v7 = v6 == 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __43__CNPhoneNumberHelper_isStringPhoneNumber___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "makePhoneNumberRegex");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)isStringPhoneNumber__cn_once_object_1;
  isStringPhoneNumber__cn_once_object_1 = v1;

}

+ (id)makePhoneNumberRegex
{
  void *v2;
  id v3;
  NSObject *v4;
  id v6;

  v6 = 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("^[\u202D\u202A]?[\\s.\"'/\\-,;\\[\\]<>()+[:Nd:]a-zA-Z*#-]{3,100}+[\u202C]?$"),
                 1,
                 &v6);
  v3 = v6;
  if (!v2)
  {
    +[CNLogging sdkBreakageLog](CNLogging, "sdkBreakageLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[CNPhoneNumberHelper makePhoneNumberRegex].cold.1((uint64_t)v3, v4);

  }
  return v2;
}

+ (id)internationalizedFormattedNumber:(id)a3 countryCode:(id)a4
{
  id v4;
  const char *v5;
  CFStringRef v6;
  const void *v7;
  void *String;

  v4 = a4;
  v5 = (const char *)PNCopyBestGuessNormalizedNumberForCountry();
  if (!v5)
  {
    String = 0;
    goto LABEL_8;
  }
  v6 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
  v7 = (const void *)CFPhoneNumberCreate();
  String = (void *)CFPhoneNumberCreateString();
  if (String)
  {
    if (!v7)
      goto LABEL_5;
    goto LABEL_4;
  }
  String = (void *)CFPhoneNumberCreateString();
  if (v7)
LABEL_4:
    CFRelease(v7);
LABEL_5:
  if (v6)
    CFRelease(v6);
LABEL_8:

  return String;
}

+ (id)internationalizedUnformattedNumber:(id)a3 countryCode:(id)a4
{
  id v4;
  const char *v5;
  CFStringRef v6;
  const void *v7;
  void *String;

  v4 = a4;
  v5 = (const char *)PNCopyBestGuessNormalizedNumberForCountry();
  if (!v5)
  {
    String = 0;
    goto LABEL_8;
  }
  v6 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
  v7 = (const void *)CFPhoneNumberCreate();
  String = (void *)CFPhoneNumberCreateString();
  if (String)
  {
    if (!v7)
      goto LABEL_5;
    goto LABEL_4;
  }
  String = (void *)CFPhoneNumberCreateString();
  if (v7)
LABEL_4:
    CFRelease(v7);
LABEL_5:
  if (v6)
    CFRelease(v6);
LABEL_8:

  return String;
}

+ (void)makePhoneNumberRegex
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_18F80C000, a2, OS_LOG_TYPE_ERROR, "Error creating phone number regex: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
