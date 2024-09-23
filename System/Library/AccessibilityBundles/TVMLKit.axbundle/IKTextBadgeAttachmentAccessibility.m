@implementation IKTextBadgeAttachmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("IKTextBadgeAttachment");
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
  id v6;
  id v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  -[IKTextBadgeAttachmentAccessibility badge](self, "badge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
LABEL_5:
    v7 = v6;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "textContent");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v13.receiver = self;
  v13.super_class = (Class)IKTextBadgeAttachmentAccessibility;
  -[IKTextBadgeAttachmentAccessibility accessibilityLabel](&v13, sel_accessibilityLabel);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v7 = v9;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "attributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("src"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      accessibilityRetrieveLabelForSource(v12);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
  }

LABEL_6:
  return v7;
}

@end
