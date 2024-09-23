@implementation VKCDataDetectorElementViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VKCDataDetectorElementView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCDataDetectorElementView"), CFSTR("dataDetectorElement"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCDataDetectorElementView"), CFSTR("allowLongPressDDActivationOnly"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("VKCTextDataDetectorElement"), CFSTR("VKCBaseDataDetectorElement"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCBaseDataDetectorElement"), CFSTR("scannerResult"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCTextDataDetectorElement"), CFSTR("dataDetectorTypes"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DDScannerResult"), CFSTR("value"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return -[VKCDataDetectorElementViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("allowLongPressDDActivationOnly")) ^ 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[VKCDataDetectorElementViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("dataDetectorElement.scannerResult"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  NSObject *v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("detected.data.element"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v4);

  if (-[VKCDataDetectorElementViewAccessibility _axIsDataDetectorOfType:](self, "_axIsDataDetectorOfType:", 1))
  {
    v5 = CFSTR("phone.number");
LABEL_28:
    accessibilityLocalizedString(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "axSafelyAddObject:", v6);

    goto LABEL_29;
  }
  if (-[VKCDataDetectorElementViewAccessibility _axIsDataDetectorOfType:](self, "_axIsDataDetectorOfType:", 2))
  {
    v5 = CFSTR("address");
    goto LABEL_28;
  }
  if (-[VKCDataDetectorElementViewAccessibility _axIsDataDetectorOfType:](self, "_axIsDataDetectorOfType:", 4))
  {
    v5 = CFSTR("calendar.event");
    goto LABEL_28;
  }
  if (-[VKCDataDetectorElementViewAccessibility _axIsDataDetectorOfType:](self, "_axIsDataDetectorOfType:", 8))
  {
    v5 = CFSTR("shipment.tracking");
    goto LABEL_28;
  }
  if (-[VKCDataDetectorElementViewAccessibility _axIsDataDetectorOfType:](self, "_axIsDataDetectorOfType:", 16))
  {
    v5 = CFSTR("flight.number");
    goto LABEL_28;
  }
  if (-[VKCDataDetectorElementViewAccessibility _axIsDataDetectorOfType:](self, "_axIsDataDetectorOfType:", 32))
  {
    v5 = CFSTR("lookup.suggestion");
    goto LABEL_28;
  }
  if (-[VKCDataDetectorElementViewAccessibility _axIsDataDetectorOfType:](self, "_axIsDataDetectorOfType:", 64))
  {
    v5 = CFSTR("web.url");
    goto LABEL_28;
  }
  if (-[VKCDataDetectorElementViewAccessibility _axIsDataDetectorOfType:](self, "_axIsDataDetectorOfType:", 128))
  {
    v5 = CFSTR("mail.url");
    goto LABEL_28;
  }
  if (-[VKCDataDetectorElementViewAccessibility _axIsDataDetectorOfType:](self, "_axIsDataDetectorOfType:", 256))
  {
    v5 = CFSTR("url");
    goto LABEL_28;
  }
  if (-[VKCDataDetectorElementViewAccessibility _axIsDataDetectorOfType:](self, "_axIsDataDetectorOfType:", 512))
  {
    v5 = CFSTR("email");
    goto LABEL_28;
  }
  if (-[VKCDataDetectorElementViewAccessibility _axIsDataDetectorOfType:](self, "_axIsDataDetectorOfType:", 0x200000))
  {
    v5 = CFSTR("mr.code");
    goto LABEL_28;
  }
  if (-[VKCDataDetectorElementViewAccessibility _axIsDataDetectorOfType:](self, "_axIsDataDetectorOfType:", 0x400000))
  {
    v5 = CFSTR("app.code");
    goto LABEL_28;
  }
  if (!-[VKCDataDetectorElementViewAccessibility _axIsDataDetectorOfType:](self, "_axIsDataDetectorOfType:", 1024))
  {
    if (-[VKCDataDetectorElementViewAccessibility _axIsDataDetectorOfType:](self, "_axIsDataDetectorOfType:", 2048))
    {
      v5 = CFSTR("money");
      goto LABEL_28;
    }
    AXLogAppAccessibility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[VKCDataDetectorElementViewAccessibility accessibilityLabel].cold.1(self, v9);

  }
LABEL_29:
  MEMORY[0x234924814](v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_axIsDataDetectorOfType:(unint64_t)a3
{
  void *v4;
  uint64_t v5;

  -[VKCDataDetectorElementViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dataDetectorElement"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeUnsignedIntegerForKey:", CFSTR("dataDetectorTypes"));

  return (a3 & ~v5) == 0;
}

- (void)accessibilityLabel
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "safeValueForKey:", CFSTR("dataDetectorElement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 134217984;
  v5 = objc_msgSend(v3, "safeUnsignedIntegerForKey:", CFSTR("dataDetectorTypes"));
  _os_log_error_impl(&dword_232B9E000, a2, OS_LOG_TYPE_ERROR, "Detector type : %lu should be included in accessibility label", (uint8_t *)&v4, 0xCu);

}

@end
