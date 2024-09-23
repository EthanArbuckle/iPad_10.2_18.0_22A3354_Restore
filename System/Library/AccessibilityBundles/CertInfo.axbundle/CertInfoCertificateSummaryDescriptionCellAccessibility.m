@implementation CertInfoCertificateSummaryDescriptionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CertInfoCertificateSummaryDescriptionCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t i;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  const __CFString *v13;

  -[CertInfoCertificateSummaryDescriptionCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_customContentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_labelsAndValues"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    for (i = 0; i < v5; i += 2)
    {
      objc_msgSend(v3, "objectAtIndex:", i, v11, v12, v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectAtIndex:", i + 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("__AXStringForVariablesSentinel");
      v11 = v8;
      __UIAXStringForVariables();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v9;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
