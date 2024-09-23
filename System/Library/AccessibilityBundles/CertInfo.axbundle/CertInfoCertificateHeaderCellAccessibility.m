@implementation CertInfoCertificateHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CertInfoCertificateHeaderCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  -[CertInfoCertificateHeaderCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertInfoCertificateHeaderCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subtitleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertInfoCertificateHeaderCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_trustedLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "textColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "redColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  objc_msgSend(v3, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 & 1) != 0)
  {
    accessibilityLocalizedString(CFSTR("expired"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __UIAXStringForVariables();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

@end
