@implementation TPButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TPButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  objc_super v11;

  -[TPButtonAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    -[TPButtonAccessibility accessibilityIdentification](self, "accessibilityIdentification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("emergencyCallButton")))
      {
        v8 = CFSTR("emergencyCallButton.title");
LABEL_8:
        accessibilityLocalizedString(v8);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("emergencyCancelButton")))
      {
        v8 = CFSTR("emergencyCancelButton.title");
        goto LABEL_8;
      }
    }
    -[TPButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
LABEL_12:

      goto LABEL_13;
    }
    v11.receiver = self;
    v11.super_class = (Class)TPButtonAccessibility;
    -[TPButtonAccessibility accessibilityLabel](&v11, sel_accessibilityLabel);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v5 = (id)v9;
    goto LABEL_12;
  }
  v5 = v3;
LABEL_13:

  return v5;
}

@end
