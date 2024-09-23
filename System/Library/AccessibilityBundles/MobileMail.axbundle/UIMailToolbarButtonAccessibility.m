@implementation UIMailToolbarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIToolbarButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  __CFString *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[UIMailToolbarButtonAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)UIMailToolbarButtonAccessibility;
  -[UIMailToolbarButtonAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("transferButton")))
  {
    v5 = CFSTR("transfer.mail.button");
  }
  else
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("wildcat_trash"))
      || objc_msgSend(v4, "isEqualToString:", CFSTR("wildcat_reply"))
      || objc_msgSend(v4, "isEqualToString:", CFSTR("wildcat_compose")))
    {
      UIKitAccessibilityLocalizedString();
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("wildcat_getnewmail")))
    {
      v5 = CFSTR("new.mail.button");
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("archive")))
    {
      v5 = CFSTR("archive.button");
    }
    else if (objc_msgSend(v4, "hasPrefix:", CFSTR("FilterIcon")))
    {
      v5 = CFSTR("filter.button");
    }
    else
    {
      if (!objc_msgSend(v4, "hasPrefix:", CFSTR("FlagIcon")))
      {
        v6 = v4;
        goto LABEL_8;
      }
      v5 = CFSTR("mark.message.button");
    }
  }
  accessibilityLocalizedString(v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v7 = v6;

  return v7;
}

@end
