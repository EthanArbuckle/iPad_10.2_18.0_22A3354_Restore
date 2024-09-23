@implementation MusicLibraryAddKeepLocalControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicLibraryAddKeepLocalControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (NSString)_accessibilityCustomActionLabel
{
  return (NSString *)objc_getAssociatedObject(self, &__MusicLibraryAddKeepLocalControlAccessibility___accessibilityCustomActionLabel);
}

- (void)_accessibilitySetCustomActionLabel:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicLibraryAddKeepLocalControl"), CFSTR("controlStatus"), "{MusicLibraryAddKeepLocalControlStatus=qd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicLibraryAddKeepLocalControl"), CFSTR("setControlStatus:animated:"), "v", "{MusicLibraryAddKeepLocalControlStatus=qd}", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicLibraryAddKeepLocalControl"), CFSTR("_updateControlStatusProperties"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MusicLibraryAddKeepLocalControl"), CFSTR("_controlTitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MusicLibraryAddKeepLocalControl"), CFSTR("UIControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicLibraryAddKeepLocalControl"), CFSTR("setTitle:forControlStatusType:"), "v", "@", "q", 0);

}

- (BOOL)_accessibilityisStatusStructValidated
{
  void *v2;
  uint64_t v3;
  id v4;
  char v5;
  _QWORD block[4];
  id v8;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__MusicLibraryAddKeepLocalControlAccessibility__accessibilityisStatusStructValidated__block_invoke;
  block[3] = &unk_2502FCFD8;
  v8 = v2;
  v3 = _accessibilityisStatusStructValidated_onceToken;
  v4 = v2;
  if (v3 != -1)
    dispatch_once(&_accessibilityisStatusStructValidated_onceToken, block);
  v5 = _accessibilityisStatusStructValidated_validated;

  return v5;
}

uint64_t __85__MusicLibraryAddKeepLocalControlAccessibility__accessibilityisStatusStructValidated__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicLibraryAddKeepLocalControl"), CFSTR("controlStatus"), "{MusicLibraryAddKeepLocalControlStatus=qd}", 0);
  _accessibilityisStatusStructValidated_validated = result;
  if ((_DWORD)result)
    result = objc_msgSend(*(id *)(a1 + 32), "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicLibraryAddKeepLocalControl"), CFSTR("setControlStatus:animated:"), "v", "{MusicLibraryAddKeepLocalControlStatus=qd}", "B", 0);
  _accessibilityisStatusStructValidated_validated = result;
  return result;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  BOOL v4;
  void *v5;

  -[MusicLibraryAddKeepLocalControlAccessibility accessibilityValue](self, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 1;
  }
  else
  {
    -[MusicLibraryAddKeepLocalControlAccessibility accessibilityLabel](self, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "length") != 0;

  }
  return v4;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;

  -[MusicLibraryAddKeepLocalControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_controlTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (-[MusicLibraryAddKeepLocalControlAccessibility _accessibilityisStatusStructValidated](self, "_accessibilityisStatusStructValidated"))
    {
      -[MusicLibraryAddKeepLocalControlAccessibility _accessibilityLabelForStatusType:](self, "_accessibilityLabelForStatusType:", *(_QWORD *)-[MusicLibraryAddKeepLocalControlAccessibility safeIvarForKey:](self, "safeIvarForKey:", CFSTR("_controlStatus")));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (id)accessibilityValue
{
  uint64_t v3;
  void *v4;

  if (-[MusicLibraryAddKeepLocalControlAccessibility _accessibilityisStatusStructValidated](self, "_accessibilityisStatusStructValidated"))
  {
    v3 = -[MusicLibraryAddKeepLocalControlAccessibility safeIvarForKey:](self, "safeIvarForKey:", CFSTR("_controlStatus"));
    -[MusicLibraryAddKeepLocalControlAccessibility _accessibilityValueForStatusType:andDownloadProgress:](self, "_accessibilityValueForStatusType:andDownloadProgress:", *(_QWORD *)v3, *(double *)(v3 + 8));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_accessibilityLabelForStatusType:(int64_t)a3
{
  __CFString *v3;

  if (a3 == 1)
  {
    v3 = CFSTR("add.to.playlist");
  }
  else
  {
    if (a3 != 2)
      return 0;
    v3 = CFSTR("download.button");
  }
  accessibilityLocalizedString(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_accessibilityValueForStatusType:(int64_t)a3 andDownloadProgress:(double)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3 == 3)
  {
    accessibilityLocalizedString(CFSTR("waiting.download"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 4)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("downloading.percentage"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatFloatWithPercentage();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_accessibilityCustomActionLabelForControlStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return 0;
  accessibilityLocalizedString(off_2502FD140[a3 - 1]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MusicLibraryAddKeepLocalControlAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[MusicLibraryAddKeepLocalControlAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  if (-[MusicLibraryAddKeepLocalControlAccessibility _accessibilityisStatusStructValidated](self, "_accessibilityisStatusStructValidated"))
  {
    if (*(_QWORD *)-[MusicLibraryAddKeepLocalControlAccessibility safeIvarForKey:](self, "safeIvarForKey:", CFSTR("_controlStatus")) == 4)v4 = *MEMORY[0x24BDF7430];
    else
      v4 = 0;
    v3 |= v4;
  }
  v5 = -[MusicLibraryAddKeepLocalControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("userInteractionEnabled"));
  v6 = *MEMORY[0x24BDF73E8];
  if (v5)
    v6 = 0;
  return v6 | v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  if (-[MusicLibraryAddKeepLocalControlAccessibility _accessibilityisStatusStructValidated](self, "_accessibilityisStatusStructValidated"))
  {
    -[MusicLibraryAddKeepLocalControlAccessibility _accessibilityCustomActionLabelForControlStatus:](self, "_accessibilityCustomActionLabelForControlStatus:", *(_QWORD *)-[MusicLibraryAddKeepLocalControlAccessibility safeIvarForKey:](self, "safeIvarForKey:", CFSTR("_controlStatus")));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MusicLibraryAddKeepLocalControlAccessibility _accessibilitySetCustomActionLabel:](self, "_accessibilitySetCustomActionLabel:", v3);

  }
  v4.receiver = self;
  v4.super_class = (Class)MusicLibraryAddKeepLocalControlAccessibility;
  -[MusicLibraryAddKeepLocalControlAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
}

- (void)_updateControlStatusProperties
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MusicLibraryAddKeepLocalControlAccessibility;
  -[MusicLibraryAddKeepLocalControlAccessibility _updateControlStatusProperties](&v3, sel__updateControlStatusProperties);
  -[MusicLibraryAddKeepLocalControlAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)setControlStatus:(MusicLibraryAddKeepLocalControlStatus)a3 animated:(BOOL)a4
{
  int64_t var0;
  void *v6;
  objc_super v7;

  var0 = a3.var0;
  v7.receiver = self;
  v7.super_class = (Class)MusicLibraryAddKeepLocalControlAccessibility;
  -[MusicLibraryAddKeepLocalControlAccessibility setControlStatus:animated:](&v7, sel_setControlStatus_animated_, a3.var0, *(_QWORD *)&a3.var1, a4);
  if (-[MusicLibraryAddKeepLocalControlAccessibility _accessibilityisStatusStructValidated](self, "_accessibilityisStatusStructValidated"))
  {
    -[MusicLibraryAddKeepLocalControlAccessibility _accessibilityCustomActionLabelForControlStatus:](self, "_accessibilityCustomActionLabelForControlStatus:", var0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MusicLibraryAddKeepLocalControlAccessibility _accessibilitySetCustomActionLabel:](self, "_accessibilitySetCustomActionLabel:", v6);

  }
}

- (void)setTitle:(id)a3 forControlStatusType:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MusicLibraryAddKeepLocalControlAccessibility;
  -[MusicLibraryAddKeepLocalControlAccessibility setTitle:forControlStatusType:](&v5, sel_setTitle_forControlStatusType_, a3, a4);
  -[MusicLibraryAddKeepLocalControlAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
