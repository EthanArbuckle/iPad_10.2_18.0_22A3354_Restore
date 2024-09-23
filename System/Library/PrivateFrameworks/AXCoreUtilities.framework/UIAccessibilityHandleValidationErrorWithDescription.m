@implementation UIAccessibilityHandleValidationErrorWithDescription

void ____UIAccessibilityHandleValidationErrorWithDescription_block_invoke()
{
  AXPerformBlockOnMainThreadAfterDelay(&__block_literal_global_1_0, 0.1);
}

void ____UIAccessibilityHandleValidationErrorWithDescription_block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  if (AXShouldLogValidationErrors())
  {
    AXLogValidations();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v1 = 0;
      _os_log_error_impl(&dword_18EBEC000, v0, OS_LOG_TYPE_ERROR, "UIAccessibility validation error: see log output above.", v1, 2u);
    }

  }
  abort();
}

@end
