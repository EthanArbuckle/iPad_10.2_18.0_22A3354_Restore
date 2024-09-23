@implementation PSSpecifierAccessibility__MobileMail__Preferences

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSSpecifier");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  __CFString *v3;
  void *v4;

  -[PSSpecifierAccessibility__MobileMail__Preferences safeValueForKey:](self, "safeValueForKey:", CFSTR("name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Yahoo!")) & 1) != 0)
  {
    v3 = CFSTR("yahoo.cell.text");
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("AOL")) & 1) != 0)
  {
    v3 = CFSTR("aol.cell.text");
  }
  else
  {
    if (!objc_msgSend(v2, "isEqualToString:", CFSTR(".Mac")))
    {
      v4 = 0;
      goto LABEL_8;
    }
    v3 = CFSTR("dotmac.cell.text");
  }
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v4;
}

@end
