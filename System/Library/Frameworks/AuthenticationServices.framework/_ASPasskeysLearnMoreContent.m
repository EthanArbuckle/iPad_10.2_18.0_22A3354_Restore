@implementation _ASPasskeysLearnMoreContent

+ (NSString)systemImageName
{
  return (NSString *)CFSTR("person.badge.key.fill");
}

+ (NSString)titleString
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)subtitleString
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)bodyString
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)footerString
{
  uint64_t v2;

  v2 = objc_msgSend(MEMORY[0x24BE0B290], "biometryType");
  if (v2 == 1 || v2 == 2)
    objc_msgSend(MEMORY[0x24BE0B290], "deviceClass");
  _WBSLocalizedString();
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

+ (NSString)footerLearnMoreLinkBindingString
{
  return (NSString *)CFSTR("@about-passkeys-link@");
}

+ (NSString)footerLearnMoreLinkString
{
  return (NSString *)_WBSLocalizedString();
}

@end
