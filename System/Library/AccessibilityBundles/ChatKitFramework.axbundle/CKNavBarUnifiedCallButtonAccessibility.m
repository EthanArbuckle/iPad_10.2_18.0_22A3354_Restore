@implementation CKNavBarUnifiedCallButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKNavBarUnifiedCallButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNavBarUnifiedCallButton"), CFSTR("isFaceTimeVideoAvailable"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNavBarUnifiedCallButton"), CFSTR("isFaceTimeAudioAvailable"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNavBarUnifiedCallButton"), CFSTR("isTelephonyAvailable"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNavBarUnifiedCallButton"), CFSTR("buttonStyle"), "q", 0);

}

- (id)accessibilityLabel
{
  uint64_t v2;
  __CFString *v3;
  NSObject *v4;
  void *v5;

  v2 = -[CKNavBarUnifiedCallButtonAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("buttonStyle"));
  switch(v2)
  {
    case 0:
      v3 = CFSTR("details.facetime.video.button.label");
      goto LABEL_12;
    case 1:
      v3 = CFSTR("details.join.facetime.video.button.label");
      goto LABEL_12;
    case 2:
      v3 = CFSTR("details.joined.facetime.video.button.label");
      goto LABEL_12;
    case 3:
      v3 = CFSTR("details.join.facetime.audio.button.label");
      goto LABEL_12;
    case 4:
      v3 = CFSTR("details.joined.facetime.audio.button.label");
      goto LABEL_12;
    case 5:
      v3 = CFSTR("details.join.facetime.expanse.button.label");
      goto LABEL_12;
    case 6:
      v3 = CFSTR("details.joined.facetime.expanse.button.label");
LABEL_12:
      accessibilityLocalizedString(v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      AXLogCommon();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[CKNavBarUnifiedCallButtonAccessibility accessibilityLabel].cold.1(v2, v4);

      v5 = 0;
      break;
  }
  return v5;
}

- (BOOL)isAccessibilityElement
{
  if ((-[CKNavBarUnifiedCallButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isFaceTimeVideoAvailable")) & 1) != 0|| (-[CKNavBarUnifiedCallButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isFaceTimeAudioAvailable")) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[CKNavBarUnifiedCallButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isTelephonyAvailable"));
  }
}

- (void)accessibilityLabel
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_2324ED000, a2, OS_LOG_TYPE_ERROR, "Missing label for button style: %@", (uint8_t *)&v4, 0xCu);

}

@end
