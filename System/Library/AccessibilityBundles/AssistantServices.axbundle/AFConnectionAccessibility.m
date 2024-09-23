@implementation AFConnectionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AFConnection");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFConnection"), CFSTR("rollbackRequest"), "v", 0);
}

- (void)rollbackRequest
{
  NSObject *v3;
  int v4;
  const __CFString *v5;
  objc_super v6;
  uint8_t buf[4];
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (-[AFConnectionAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("VoiceOverCancelRequestInProgress")))
  {
    AXLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = AXIsInternalInstall();
      v5 = &stru_25017CAF8;
      if (v4)
        v5 = CFSTR("rdar://80384131");
      *(_DWORD *)buf = 138412290;
      v8 = v5;
      _os_log_impl(&dword_23242E000, v3, OS_LOG_TYPE_DEFAULT, "VoiceOver issued this cancel request - not acting on the rollback %@", buf, 0xCu);
    }

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AFConnectionAccessibility;
    -[AFConnectionAccessibility rollbackRequest](&v6, sel_rollbackRequest);
  }
}

@end
