@implementation NavIdleTimeoutTimerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NavIdleTimeoutTimer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavIdleTimeoutTimer"), CFSTR("idleTimeout"), "d", 0);
}

- (double)idleTimeout
{
  NSObject *v3;
  double result;
  objc_super v5;
  uint8_t buf[16];

  if (AXRequiresLongerTimeouts())
  {
    AXLogAppAccessibility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_232703000, v3, OS_LOG_TYPE_DEFAULT, "Accessibility option, setting idle timeout to 1 hour", buf, 2u);
    }

    return 3600.0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NavIdleTimeoutTimerAccessibility;
    -[NavIdleTimeoutTimerAccessibility idleTimeout](&v5, sel_idleTimeout);
  }
  return result;
}

@end
