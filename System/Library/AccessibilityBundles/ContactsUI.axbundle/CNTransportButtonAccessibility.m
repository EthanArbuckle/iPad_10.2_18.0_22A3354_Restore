@implementation CNTransportButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNTransportButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CNFaceTimeCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNTransportButton"), CFSTR("transportType"), "q", 0);

}

- (int64_t)_axTransportType
{
  void *v2;
  int64_t v3;

  -[CNTransportButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("transportType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)isAccessibilityElement
{
  int64_t v3;

  if (UIAccessibilityIsVoiceOverRunning() || _AXSAssistiveTouchScannerEnabled())
  {
    v3 = -[CNTransportButtonAccessibility _axTransportType](self, "_axTransportType");
    if (v3)
      LOBYTE(v3) = -[CNTransportButtonAccessibility _axTransportType](self, "_axTransportType") != 6;
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  char isKindOfClass;
  int64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  -[CNTransportButtonAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490B8B0](CFSTR("CNFaceTimeCell"));
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = -[CNTransportButtonAccessibility _axTransportType](self, "_axTransportType") - 1;
  v6 = CFSTR("transport.button.text");
  switch(v5)
  {
    case 0:
      if ((isKindOfClass & 1) != 0)
        v6 = CFSTR("transport.button.phone.facetime");
      else
        v6 = CFSTR("transport.button.phone");
      goto LABEL_11;
    case 1:
      goto LABEL_11;
    case 2:
      v6 = CFSTR("transport.button.video");
      goto LABEL_11;
    case 3:
      v6 = CFSTR("transport.button.email");
      goto LABEL_11;
    case 4:
      v6 = CFSTR("transport.button.map");
      goto LABEL_11;
    case 5:
      v6 = CFSTR("transport.button.medical.id");
      goto LABEL_11;
    case 6:
      v6 = CFSTR("transport.button.tty");
LABEL_11:
      accessibilityLocalizedString(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = 0;
      break;
  }
  objc_msgSend(v3, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
