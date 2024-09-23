@implementation ABPhoneFormatting

+ (id)abDefaultCountryCode
{
  id result;

  result = (id)CPPhoneNumberCopyHomeCountryCode();
  if (!result)
    return CFSTR("us");
  return result;
}

+ (id)abCopyPhoneNumberFromString:(id)a3
{
  id result;

  if (!a3)
    return 0;
  objc_msgSend(a1, "abDefaultCountryCode");
  result = (id)PNCreateFormattedStringWithCountry();
  if (!result)
    return (id)objc_msgSend(a3, "copy");
  return result;
}

+ (id)abNormalizedPhoneNumberFromString:(id)a3
{
  uint64_t v4;
  const void *v5;
  id v6;

  objc_msgSend(a1, "abDefaultCountryCode");
  v4 = CFPhoneNumberCreate();
  if (v4 && (v5 = (const void *)v4, v6 = (id)CFPhoneNumberCreateString(), CFRelease(v5), v6))
    return v6;
  else
    return a3;
}

@end
