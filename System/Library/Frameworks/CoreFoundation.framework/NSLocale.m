@implementation NSLocale

+ (NSLocale)currentLocale
{
  return (NSLocale *)+[NSLocale _current](NSLocale, "_current");
}

- (unint64_t)hash
{
  return -[NSString hash](-[NSLocale localeIdentifier](self, "localeIdentifier"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3)
  {
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -[NSString isEqual:](-[NSLocale localeIdentifier](self, "localeIdentifier"), "isEqual:", objc_msgSend(a3, "localeIdentifier"));
  }
  return 0;
}

+ (NSLocale)localeWithLocaleIdentifier:(NSString *)ident
{
  return (NSLocale *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithLocaleIdentifier:", ident);
}

+ (NSLocale)allocWithZone:(_NSZone *)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (NSLocale == a1)
    return (NSLocale *)&__placeholderLocale;
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSLocale;
  return (NSLocale *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

+ (NSString)localeIdentifierFromComponents:(NSDictionary *)dict
{
  return (NSString *)+[NSLocale _localeIdentifierFromComponents:](NSLocale, "_localeIdentifierFromComponents:", dict);
}

+ (NSArray)preferredLanguages
{
  return (NSArray *)+[NSLocale _preferredLanguages](NSLocale, "_preferredLanguages");
}

+ (NSDictionary)componentsFromLocaleIdentifier:(NSString *)string
{
  return (NSDictionary *)+[NSLocale _componentsFromLocaleIdentifier:](NSLocale, "_componentsFromLocaleIdentifier:", string);
}

+ (NSLocale)systemLocale
{
  return (NSLocale *)+[NSLocale _system](NSLocale, "_system");
}

+ (NSString)canonicalLanguageIdentifierFromString:(NSString *)string
{
  if (string)
    return (NSString *)+[NSLocale _canonicalLanguageIdentifierFromString:](NSLocale, "_canonicalLanguageIdentifierFromString:");
  else
    return 0;
}

+ (NSLocaleLanguageDirection)characterDirectionForLanguage:(NSString *)isoLangCode
{
  return +[NSLocale _characterDirectionForLanguage:](NSLocale, "_characterDirectionForLanguage:", isoLangCode);
}

+ (NSString)localeIdentifierFromWindowsLocaleCode:(uint32_t)lcid
{
  return (NSString *)+[NSLocale _localeIdentifierFromWindowsLocaleCode:](NSLocale, "_localeIdentifierFromWindowsLocaleCode:", *(_QWORD *)&lcid);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSString)canonicalLocaleIdentifierFromString:(NSString *)string
{
  if (string)
    return (NSString *)+[NSLocale _canonicalLocaleIdentifierFromString:](NSLocale, "_canonicalLocaleIdentifierFromString:");
  else
    return 0;
}

+ (NSArray)ISOCountryCodes
{
  return (NSArray *)+[NSLocale _isoCountryCodes](NSLocale, "_isoCountryCodes");
}

- (NSLocale)init
{
  return -[NSLocale initWithLocaleIdentifier:](self, "initWithLocaleIdentifier:", 0);
}

- (NSLocale)initWithCoder:(NSCoder *)coder
{
  return 0;
}

- (NSString)localeIdentifier
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", CFSTR("kCFLocaleIdentifierKey"));
}

- (NSString)localizedStringForLocaleIdentifier:(NSString *)localeIdentifier
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", CFSTR("kCFLocaleIdentifierKey"), localeIdentifier);
}

- (NSString)languageCode
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", CFSTR("kCFLocaleLanguageCodeKey"));
}

- (NSString)localizedStringForLanguageCode:(NSString *)languageCode
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", CFSTR("kCFLocaleLanguageCodeKey"), languageCode);
}

- (NSString)countryCode
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", CFSTR("kCFLocaleCountryCodeKey"));
}

- (NSString)localizedStringForCountryCode:(NSString *)countryCode
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", CFSTR("kCFLocaleCountryCodeKey"), countryCode);
}

- (NSString)scriptCode
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", CFSTR("kCFLocaleScriptCodeKey"));
}

- (NSString)localizedStringForScriptCode:(NSString *)scriptCode
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", CFSTR("kCFLocaleScriptCodeKey"), scriptCode);
}

- (NSString)variantCode
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", CFSTR("kCFLocaleVariantCodeKey"));
}

- (NSString)localizedStringForVariantCode:(NSString *)variantCode
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", CFSTR("kCFLocaleVariantCodeKey"), variantCode);
}

- (NSString)calendarIdentifier
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", CFSTR("calendar"));
}

- (NSString)localizedStringForCalendarIdentifier:(NSString *)calendarIdentifier
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", CFSTR("calendar"), calendarIdentifier);
}

- (NSString)collationIdentifier
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", CFSTR("collation"));
}

- (NSString)localizedStringForCollationIdentifier:(NSString *)collationIdentifier
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", CFSTR("collation"), collationIdentifier);
}

- (NSString)decimalSeparator
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", CFSTR("kCFLocaleDecimalSeparatorKey"));
}

- (id)localizedStringForDecimalSeparator:(id)a3
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", CFSTR("kCFLocaleDecimalSeparatorKey"), a3);
}

- (NSString)groupingSeparator
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", CFSTR("kCFLocaleGroupingSeparatorKey"));
}

- (id)localizedStringForGroupingSeparator:(id)a3
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", CFSTR("kCFLocaleGroupingSeparatorKey"), a3);
}

- (NSString)currencySymbol
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", CFSTR("kCFLocaleCurrencySymbolKey"));
}

- (id)localizedStringForCurrencySymbol:(id)a3
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", CFSTR("kCFLocaleCurrencySymbolKey"), a3);
}

- (NSString)currencyCode
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", CFSTR("currency"));
}

- (NSString)localizedStringForCurrencyCode:(NSString *)currencyCode
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", CFSTR("currency"), currencyCode);
}

- (NSString)collatorIdentifier
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", CFSTR("kCFLocaleCollatorIdentifierKey"));
}

- (NSString)localizedStringForCollatorIdentifier:(NSString *)collatorIdentifier
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", CFSTR("kCFLocaleCollatorIdentifierKey"), collatorIdentifier);
}

- (NSString)quotationBeginDelimiter
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", CFSTR("kCFLocaleQuotationBeginDelimiterKey"));
}

- (id)localizedStringForQuotationBeginDelimiter:(id)a3
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", CFSTR("kCFLocaleQuotationBeginDelimiterKey"), a3);
}

- (NSString)quotationEndDelimiter
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", CFSTR("kCFLocaleQuotationEndDelimiterKey"));
}

- (id)localizedStringForQuotationEndDelimiter:(id)a3
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", CFSTR("kCFLocaleQuotationEndDelimiterKey"), a3);
}

- (NSString)alternateQuotationBeginDelimiter
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", CFSTR("kCFLocaleAlternateQuotationBeginDelimiterKey"));
}

- (id)localizedStringForAlternateQuotationBeginDelimiter:(id)a3
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", CFSTR("kCFLocaleAlternateQuotationBeginDelimiterKey"), a3);
}

- (NSString)alternateQuotationEndDelimiter
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", CFSTR("kCFLocaleAlternateQuotationEndDelimiterKey"));
}

- (id)localizedStringForAlternateQuotationEndDelimiter:(id)a3
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", CFSTR("kCFLocaleAlternateQuotationEndDelimiterKey"), a3);
}

- (NSCharacterSet)exemplarCharacterSet
{
  return (NSCharacterSet *)-[NSLocale objectForKey:](self, "objectForKey:", CFSTR("kCFLocaleExemplarCharacterSetKey"));
}

- (BOOL)usesMetricSystem
{
  return objc_msgSend(-[NSLocale objectForKey:](self, "objectForKey:", CFSTR("kCFLocaleUsesMetricSystemKey")), "BOOLValue");
}

- (NSString)regionCode
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", CFSTR("kCFLocaleCountryCodeKey"));
}

- (NSString)languageIdentifier
{
  return (NSString *)-[NSLocale objectForKey:](self, "objectForKey:", CFSTR("locale:languageIdentifier"));
}

+ (NSArray)availableLocaleIdentifiers
{
  return (NSArray *)+[NSLocale _availableLocaleIdentifiers](NSLocale, "_availableLocaleIdentifiers");
}

+ (NSArray)ISOLanguageCodes
{
  return (NSArray *)+[NSLocale _isoLanguageCodes](NSLocale, "_isoLanguageCodes");
}

+ (NSArray)ISOCurrencyCodes
{
  return (NSArray *)+[NSLocale _isoCurrencyCodes](NSLocale, "_isoCurrencyCodes");
}

+ (NSArray)commonISOCurrencyCodes
{
  return (NSArray *)+[NSLocale _commonISOCurrencyCodes](NSLocale, "_commonISOCurrencyCodes");
}

+ (uint32_t)windowsLocaleCodeFromLocaleIdentifier:(NSString *)localeIdentifier
{
  return +[NSLocale _windowsLocaleCodeFromLocaleIdentifier:](NSLocale, "_windowsLocaleCodeFromLocaleIdentifier:", localeIdentifier);
}

+ (NSLocaleLanguageDirection)lineDirectionForLanguage:(NSString *)isoLangCode
{
  return +[NSLocale _lineDirectionForLanguage:](NSLocale, "_lineDirectionForLanguage:", isoLangCode);
}

- (id)_copyDisplayNameForKey:(id)a3 value:(id)a4
{
  return -[NSLocale displayNameForKey:value:](self, "displayNameForKey:value:", a3, a4);
}

- (id)_prefForKey:(id)a3
{
  return 0;
}

+ (id)internetServicesRegion
{
  CFPropertyListRef v2;
  void *v3;
  CFTypeID v4;

  v2 = CFPreferencesCopyAppValue(CFSTR("AppleInternetServicesRegion"), CFSTR("kCFPreferencesCurrentApplication"));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = CFGetTypeID(v2);
    if (v4 == CFStringGetTypeID())
      return v3;
    CFRelease(v3);
  }
  return -[NSLocale objectForKey:](+[NSLocale currentLocale](NSLocale, "currentLocale"), "objectForKey:", CFSTR("kCFLocaleCountryCodeKey"));
}

- (id)objectForKey:(NSLocaleKey)key
{
  objc_class *v3;

  v3 = __CFLookUpClass("NSLocale");
  OUTLINED_FUNCTION_0_27(v3);
}

- (NSString)displayNameForKey:(NSLocaleKey)key value:(id)value
{
  objc_class *v4;

  v4 = __CFLookUpClass("NSLocale");
  OUTLINED_FUNCTION_0_27(v4);
}

@end
