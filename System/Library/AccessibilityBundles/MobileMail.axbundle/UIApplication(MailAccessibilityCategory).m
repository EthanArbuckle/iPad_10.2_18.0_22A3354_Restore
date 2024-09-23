@implementation UIApplication(MailAccessibilityCategory)

+ (void)_accessibilityPerformValidations:()MailAccessibilityCategory
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("MailComposeScene"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("UIWindowScene"), CFSTR("UIScene"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("UIScene"), CFSTR("_mostActiveScene"), "@", 0);

}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("app.name"));
}

- (id)_accessibilityFilenameForAttachmentCID:()MailAccessibilityCategory
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE662E8], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attachmentForContentID:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "fileName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)_accessibilityApplicationIsModal
{
  void *v0;
  char isKindOfClass;

  objc_msgSend(MEMORY[0x24BDF7000], "safeValueForKey:", CFSTR("_mostActiveScene"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("MailComposeScene"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
