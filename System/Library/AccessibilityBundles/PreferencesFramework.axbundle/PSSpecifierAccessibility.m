@implementation PSSpecifierAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSSpecifier");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  -[PSSpecifierAccessibility _accessibilityUnregister](self, "_accessibilityUnregister");
  v3.receiver = self;
  v3.super_class = (Class)PSSpecifierAccessibility;
  -[PSSpecifierAccessibility dealloc](&v3, sel_dealloc);
}

- (id)accessibilityIdentification
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  -[PSSpecifierAccessibility propertyForKey:](self, "propertyForKey:", CFSTR("accessibilityIdentification"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_5;
  v6.receiver = self;
  v6.super_class = (Class)PSSpecifierAccessibility;
  -[PSSpecifierAccessibility accessibilityIdentification](&v6, sel_accessibilityIdentification);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[PSSpecifierAccessibility propertyForKey:](self, "propertyForKey:", *MEMORY[0x24BE75AC0]),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[PSSpecifierAccessibility propertyForKey:](self, "propertyForKey:", *MEMORY[0x24BE75B50]),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_5:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v3);
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
    }
  }
  return v3;
}

@end
