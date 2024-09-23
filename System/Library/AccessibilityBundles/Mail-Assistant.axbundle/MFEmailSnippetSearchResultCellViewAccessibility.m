@implementation MFEmailSnippetSearchResultCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFEmailSnippetSearchResultCellView");
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
  void *v3;
  int v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MFEmailSnippetSearchResultCellViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("isOutgoingEmailKey"));
  -[MFEmailSnippetSearchResultCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_addressLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    if (v4)
      v7 = CFSTR("message.address.to.label");
    else
      v7 = CFSTR("message.address.from.label");
    accessibilityMobileMailLocalizedString(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  -[MFEmailSnippetSearchResultCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subjectLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    accessibilityMobileMailLocalizedString(CFSTR("subject"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: %@"), v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v14);
  }
  -[MFEmailSnippetSearchResultCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dateLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accessibilityLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "length"))
  {
    objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB10]);
    objc_msgSend(v3, "addObject:", v17);

  }
  -[MFEmailSnippetSearchResultCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_bodyLabel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "accessibilityLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "length"))
    objc_msgSend(v3, "addObject:", v19);
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)setEmail:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MFEmailSnippetSearchResultCellViewAccessibility;
  -[MFEmailSnippetSearchResultCellViewAccessibility setEmail:](&v20, sel_setEmail_, v4);
  objc_opt_class();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("outgoing"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "BOOLValue");
  -[MFEmailSnippetSearchResultCellViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", v7, CFSTR("isOutgoingEmailKey"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("statusFlags"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  if ((v10 & 1) != 0)
  {
    accessibilityMobileMailLocalizedString(CFSTR("unread"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v8, "addObject:", v11);

    }
  }
  if ((v10 & 8) != 0)
  {
    accessibilityMobileMailLocalizedString(CFSTR("flagged"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v8, "addObject:", v13);

    }
  }
  if ((v10 & 2) != 0)
  {
    accessibilityMobileMailLocalizedString(CFSTR("replied"));
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      objc_msgSend(v8, "addObject:", v15);

    }
  }
  if ((v10 & 4) != 0)
  {
    accessibilityMobileMailLocalizedString(CFSTR("forwarded"));
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      objc_msgSend(v8, "addObject:", v17);

    }
  }
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFEmailSnippetSearchResultCellViewAccessibility setAccessibilityValue:](self, "setAccessibilityValue:", v19);

}

@end
