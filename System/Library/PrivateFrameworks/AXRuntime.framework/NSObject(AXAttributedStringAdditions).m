@implementation NSObject(AXAttributedStringAdditions)

- (uint64_t)isAXAttributedString
{
  return 0;
}

- (id)_accessibilityAttributedLocalizedString
{
  return objc_getAssociatedObject(a1, &AXAttributedLocalizedString);
}

- (void)_setAccessibilityAttributedLocalizedString:()AXAttributedStringAdditions
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  if (v4 == a1)
  {
    AXRuntimeLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[NSObject(AXAttributedStringAdditions) _setAccessibilityAttributedLocalizedString:].cold.1(v5);

    __assert_rtn("-[NSObject(AXAttributedStringAdditions) _setAccessibilityAttributedLocalizedString:]", "AXAttributedString.m", 812, "false");
  }
  v6 = v4;
  objc_setAssociatedObject(a1, &AXAttributedLocalizedString, v4, (void *)0x301);

}

- (void)_setAccessibilityAttributedLocalizedString:()AXAttributedStringAdditions .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B54A6000, log, OS_LOG_TYPE_ERROR, "Attempting to associate string with itself!", v1, 2u);
}

@end
