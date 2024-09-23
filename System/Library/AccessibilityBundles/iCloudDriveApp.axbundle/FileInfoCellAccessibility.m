@implementation FileInfoCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FileInfoCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FileInfoCell"), CFSTR("nameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FileInfoCell"), CFSTR("valueLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FileInfoCell"), CFSTR("initWithNameAndValue: value: maxLines:"), "@", "@", "@", "q", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[FileInfoCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("nameLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_opt_class();
  -[FileInfoCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("valueLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("fileinfo.location.arrow"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR(", %@ ,"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("text"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("▸"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _QWORD v15[2];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)FileInfoCellAccessibility;
  -[FileInfoCellAccessibility _accessibilityLoadAccessibilityInformation](&v14, sel__accessibilityLoadAccessibilityInformation);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[FileInfoCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("nameLabel"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  -[FileInfoCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("valueLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setIsAccessibilityElement:", 0);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v7);
  }

}

- (FileInfoCellAccessibility)initWithNameAndValue:(id)a3 value:(id)a4 maxLines:(int64_t)a5
{
  FileInfoCellAccessibility *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FileInfoCellAccessibility;
  v5 = -[FileInfoCellAccessibility initWithNameAndValue:value:maxLines:](&v7, sel_initWithNameAndValue_value_maxLines_, a3, a4, a5);
  -[FileInfoCellAccessibility _accessibilityLoadAccessibilityInformation](v5, "_accessibilityLoadAccessibilityInformation");

  return v5;
}

@end
